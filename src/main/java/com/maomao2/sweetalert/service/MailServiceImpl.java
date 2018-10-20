package com.maomao2.sweetalert.service;

import com.maomao2.sweetalert.entity.Mail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.mail.MailProperties;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {

  private final Logger logger = LoggerFactory.getLogger(getClass());

  @Autowired
  private JavaMailSender jms;

  @Autowired
  private MailProperties mailProperties;

  @Override
  public void sendSimpleEmail(Mail mail) {
    logger.info("prepare to send email");
    SimpleMailMessage mainMessage = new SimpleMailMessage();
    mainMessage.setFrom(mailProperties.getUsername());
    mainMessage.setTo(mail.getTo());
    mainMessage.setSubject(mail.getSubject());
    mainMessage.setText(mail.getBody());
    jms.send(mainMessage);
    logger.info("Simple mail sends successfully");
  }
}
