package com.maomao2.sweetalert.controller;

import com.maomao2.sweetalert.entity.Mail;
import com.maomao2.sweetalert.service.MailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Mails")
public class MailController {
  private final Logger logger = LoggerFactory.getLogger(getClass());

  @Autowired
  public MailService mailService;

  @PostMapping("/send")
  public void sendSimpleEmail(@RequestBody Mail mail) {
    mailService.sendSimpleEmail(mail);
  }
}
