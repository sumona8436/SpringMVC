package com.spring.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.servicePage.CartDetails;
import com.spring.servicePage.CartDetailsDAO;
import com.spring.servicePage.ProductDetails;
import com.spring.servicePage.ProductDetailsDAO;
import com.spring.signup.SendingWelcomeMail;
import com.spring.signup.SignupBEAN;
import com.spring.signup.SignupDAO;

@Controller
public class EmployeeControler {

	@Autowired
	private SignupDAO signupDAO;

	@Autowired
	private SendingWelcomeMail sendingWelcomeMail;

	@Autowired
	private ProductDetailsDAO productDetailsdao;

	@Autowired
	private CartDetailsDAO cartDetailsDAO;

	@RequestMapping("/")
	public String redirectToDefault() {
		return "redirect:/index";
		// redirectToDefault() will hit index page as a default-Firstpage when we will
		// start server
	}

	@RequestMapping("/index")
	public String home() {
		System.out.println("index page running");
		return "index";
		// here Home is .jsp name, location = WEB-INF -> views folder -> Home.jsp
	}

	@RequestMapping("/contact")
	public String contactUs() {
		System.out.println("contactUs page running");
		return "contact";
	}

	@RequestMapping("/signup")
	public String signup() {
		System.out.println("signup page running");
		return "signup";
		// here Home is .jsp name, location = WEB-INF -> views folder -> Home.jsp
	}

	@RequestMapping("/cart")
	public String cart(@ModelAttribute CartDetails cartDetails, Model model) {
		/*
		 * List<CartDetails>
		 * items=this.cartDetailsDAO.fetchingCartDetailsFromDB(cartDetails);
		 * model.addAttribute("cartItems",items);
		 */
		System.out.println("cart page running");
		return "Cart";

	}

	@Transactional
	@RequestMapping("/services")
	public String services(@ModelAttribute ProductDetails productDetails, Model model) {

		List<ProductDetails> items = this.productDetailsdao.fetchingProductDetailsFromDB(productDetails);
		for (ProductDetails t : items) {
			System.out.println("items............................" + t); 
			//model.addAttribute("products", t);
		}
		List<Long> fetchingOnlyProductID=items.stream()
                .map(ProductDetails::getId)
                .collect(Collectors.toList());
		
		model.addAttribute("products", items);
		model.addAttribute("OnlyproductIds", fetchingOnlyProductID);
		System.out.println("checknow page running");
		return "checknow";
		// return "service";
	}

	// @PostMapping("/validateEmail")
	// @ResponseBody
	// public Map<String, Boolean> validateEmail(@RequestBody String email) {
	// Map<String, Boolean> response = new HashMap<>();
	// try {
	// response.put("isValid", this.signupDAO.isEmailValid(email));
	// }
	// catch (Exception e) {
	// response.put("isValid", false);
	// Log the exception or handle it as needed
	// }
	// return response;
	// }

	@RequestMapping(path = "/signupSubmission", method = RequestMethod.POST)
	public String handleSignupForm(@ModelAttribute SignupBEAN signupBean, Model model) {
		System.out.println(signupBean.getEmail());
		int count = this.signupDAO.createNewUser(signupBean);
		System.out.println(">>>>>>>>>count::::" + count);
		if (count != 0) {
			this.sendingWelcomeMail.sendWelcomeMail(signupBean.getEmail(), signupBean.getUserName());

			return "index";
		} else {
			System.out.println(">>>under else>>>>>>>>>>>");
			model.addAttribute("signupFailed", true);
			return "signup";
		}
	}

	
	
	
	/* creating API using SpringBoot, and calling by Ajax */
	@Transactional
	@GetMapping("/addToCartButtonFromServicePage/{productDetailsID}")
	// @RequestMapping(path = "/addToCartButtonFromServicePage", method =
	// RequestMethod.POST,produces = "application/json")
	@ResponseBody
	public ResponseEntity<ProductDetails> addToCartButton(@PathVariable Long productDetailsID) {
		System.out.println("Product ID: " + productDetailsID);
		ProductDetails item = this.productDetailsdao.fetchingProductDetailsByID(productDetailsID);
		// Add your logic to process the product ID here
		return new ResponseEntity<>(item, HttpStatus.OK);

	}

	@Transactional
	@PostMapping("/storingCartItemFromCartPage")
	@ResponseBody
	public ResponseEntity<Object> storingCartItemToCartTable(@RequestBody CartDetails cartDetails) {
		Long item = this.cartDetailsDAO.insertToCartTable(cartDetails);
		Map<String, Object> response = new HashMap<>();
		response.put("Product_ID", cartDetails.getProduct_ID());
		response.put("Product_Name", cartDetails.getProduct_Name());

		// Log the received data
		System.out.println("Received data: " + cartDetails.toString());
		return new ResponseEntity<>(response, HttpStatus.CREATED);
	}

	@Transactional
	@GetMapping("/gettingAllDataFromCartTable")
	@ResponseBody
	public ResponseEntity<List<CartDetails>> gettingAllDataFromCartdetailsTable(
			@ModelAttribute CartDetails cartDetails) {
		List<CartDetails> items = this.cartDetailsDAO.fetchingCartDetailsFromDB(cartDetails);
		return new ResponseEntity<>(items, HttpStatus.OK);
	}

	@Transactional
	@DeleteMapping("/deleteDataFromCartTable/{cartItemID}")
	@ResponseBody
	public ResponseEntity<String> removeButtonOfCart(@PathVariable Long cartItemID) {
		System.out.println(">>>>>>>>cartItemID" + cartItemID);
		this.cartDetailsDAO.deleteFromCartTable(cartItemID);
		return new ResponseEntity<>("true", HttpStatus.CREATED);
	}

	@Transactional
	@GetMapping("/getAllDataFromProductTable")
	@ResponseBody
	public ResponseEntity<List<ProductDetails>> gettingAllDataFromProductdetailsTable(
			@ModelAttribute ProductDetails productDetails) {
		List<ProductDetails> items = this.productDetailsdao.fetchingProductDetailsFromDB(productDetails);
		return new ResponseEntity<>(items, HttpStatus.OK);
	}

}
