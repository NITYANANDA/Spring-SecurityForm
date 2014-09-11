package com.home.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.domain.Book;
import com.home.service.BookService;

@Controller
@RequestMapping("/admin")
public class BookController {

	@Autowired
	private BookService bookService;

	@RequestMapping("/index")
	public String listBooks(ModelMap map) {
		map.addAttribute("book", new Book());
		map.addAttribute("bookList", bookService.listBooks());
		return "book";
	}

	@RequestMapping(value = "/book/add", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book,
			BindingResult result) {
		if (null == book.getId()) {
			bookService.addBook(book);
		} else {
			bookService.updateBook(book);
		}
		return "book";
	}

	@RequestMapping("/delete/{bookId}")
	public String deleteBook(@PathVariable("bookId") Integer bookId) {
		bookService.removeBook(bookId);
		return "redirect:/index";
	}

	@RequestMapping("/edit/{bookId}")
	public String editBook(@PathVariable("bookId") Integer bookId,
			Map<String, Object> map) {
		map.put("book", bookService.getBookById(bookId));
		map.put("bookList", bookService.listBooks());
		return "book";
	}
}