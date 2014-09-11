package com.home.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.home.domain.Book;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	private HibernateTemplate template;

	@Override
	public void addBook(Book book) {
		template.save(book);
	}

	@Override
	public void removeBook(Integer id) {
//		Book book = (Book) sessionFactory.openSession().load(Book.class, id);
//		if (null != book) {
//			template.delete(book);
//		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Book> listBooks() {
		return template.find("from Book");
	}

	@Override
	public void updateBook(Book book) {
		template.update(book);
	}

	@Override
	@SuppressWarnings("unchecked")
	public Book getBookById(Integer bookId) {
		List<Book> list = template.find("from Book b where b.id = :bookId");
				//.setParameter("bookId", bookId);
		return list.size() > 0 ? (Book) list.get(0) : null;
	}

}
