Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E5320E76
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 00:02:53 +0100 (CET)
Received: from localhost ([::1]:37472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxka-0006LG-NL
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 18:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxeh-0001fX-Aj; Sun, 21 Feb 2021 17:56:47 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxef-0000eK-RW; Sun, 21 Feb 2021 17:56:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id o82so11866578wme.1;
 Sun, 21 Feb 2021 14:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=na17oWuPKTj+SU6c6Dkqcg8IZxkfU6eQT/pu9RwQ//c=;
 b=QQ4RqeoxggM3NB1m6/I0B6UZbsoZk3fOqadHCCoRo2/J9+iRWesq+a9h1eowd0bmZN
 WFjFrdvIkKJ+GY09ruwNXb6VFd5N/ntsFvGgLUbDNZRCQHsidYD0nU/E3wY5L/Ft66To
 W7RgD7IziLh6z0y2EsPeJDnOIx4OXmlPqtBxQKRvR9tnPFDDkFmzmtAUeGzqwuIcveZn
 ZYxGINvlRjS+3+bZS3+yNhM2fZ3JtDmN8mWxDU5l5OQ9Vo6+4teM7QDhUgsquctIufvm
 dAvNqp9sDNj9JL8Azj5UkUhP6lkuOynZ2txEdMseNXaI9sLdKpZ6Yy7XFw3e2K5dU3pk
 eULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=na17oWuPKTj+SU6c6Dkqcg8IZxkfU6eQT/pu9RwQ//c=;
 b=PSILP11lBcIYxbH5jLcSc305RNgfUVb+I6kojx5paIcsBZIWPPb5y1K7suX46mftJk
 4VjAFyXQ/rmcBJWz8q5rgTsCSYLCDZ+znRF0kmgksHrD0TnV7BhQecjpmh2OEah1p6aj
 vthXscsHQKmbjKBe+UTwBMKrXFwdHkRXyNLzLgswOtornd1eLsVQuzXMNyzBTsX+81+Y
 oZZygXM9Z8w2NRrBwypXrgyvQF8Un1KfpzFJHnjYznac3+Qls0pJ/lCEkLn+BXZdjIJ6
 3/7xmElVdV4AvE3f0WSgq37bu1CCnzDEvhLdRsLUvXkfGEYT5M3psKZPqzMOcGila8v8
 o/Ug==
X-Gm-Message-State: AOAM530JSVBvHQfUdtngnGc/Achj+BdO38FmNNTb7IP4h5nok8gA7N+U
 54mBHGfBYqczxJgk9UuUZ1eewfK8eNI=
X-Google-Smtp-Source: ABdhPJygzHh+hXjLeeJILafgE5N50QS77f6OFFmpK1YtRS1e24wAZKvVJSLgXcuq2k/3vqG0YoM8Lw==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr16344255wma.150.1613948204046; 
 Sun, 21 Feb 2021 14:56:44 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m4sm10301974wrb.87.2021.02.21.14.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:56:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/lm32/Kconfig: Have MILKYMIST select LM32_DEVICES
Date: Sun, 21 Feb 2021 23:56:26 +0100
Message-Id: <20210221225626.2589247-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221225626.2589247-1-f4bug@amsat.org>
References: <20210221225626.2589247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Milkymist board requires more than the PTIMER. Directly
select the LM32_DEVICES. This fixes:

  /usr/bin/ld:
  libqemu-lm32-softmmu.fa.p/target_lm32_gdbstub.c.o: in function `lm32_cpu_gdb_read_register':
  target/lm32/gdbstub.c:46: undefined reference to `lm32_pic_get_im'
  target/lm32/gdbstub.c:48: undefined reference to `lm32_pic_get_ip'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_im':
  target/lm32/op_helper.c:107: undefined reference to `lm32_pic_set_im'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_ip':
  target/lm32/op_helper.c:114: undefined reference to `lm32_pic_set_ip'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jtx':
  target/lm32/op_helper.c:120: undefined reference to `lm32_juart_set_jtx'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jrx':
  target/lm32/op_helper.c:125: undefined reference to `lm32_juart_set_jrx'
  libqemu-lm32-softmmu.fa.p/target_lm32_translate.c.o: in function `lm32_cpu_dump_state':
  target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_ip'
  target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_im'

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/lm32/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 518c84ed508..8ac94205d71 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -6,11 +6,11 @@ config MILKYMIST
     bool
     # FIXME: disabling it results in compile-time errors
     select MILKYMIST_TMU2 if OPENGL && X11
-    select PTIMER
     select PFLASH_CFI01
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+    select LM32_DEVICES
 
 config LM32_EVR
     bool
-- 
2.26.2


