Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E14C195D78
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 19:19:37 +0100 (CET)
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHtZw-00022X-G2
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 14:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jHtU4-0001ty-6I
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 14:13:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jHtU2-0000mW-QV
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 14:13:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38913)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jHtU2-0000lZ-Jb
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 14:13:30 -0400
Received: by mail-wr1-x431.google.com with SMTP id p10so12550669wrt.6
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ztDbOw6DhMgOgSgsUfM4L+NS4o98VZx9Fe9KbZgV6vo=;
 b=f2MGy5GVTqIceuk4wEfuc6zFJp5u8yDcAlqgY6yuVj5ZEU2I+V8PVrc1YRdL4CEih8
 nMxtuqCMwH8xrDhn7uTk5qIp8zAVjPzQDzaeiQX5fnzNOn4Q8VzwZFzXgAKW9hmhawQ8
 BP38sPOOdu7vdqyLDz7bGWAAzcZFdQ851dZTbJjF5ed+NOoeeANpRbuEtcd3eWSXbh8V
 Qd7fzc/28pQsWj4HewEKt0ZlVktGCHwVn2DAEj1xOpiKIgtoypeIXmxZ3yWEGqT0EGbd
 RAE2qiceJski2YSI1AdErdjUinnt4JOiP1N4uMK7/uyDMdRK9eJ6rn7urjktf+hElRmZ
 cOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ztDbOw6DhMgOgSgsUfM4L+NS4o98VZx9Fe9KbZgV6vo=;
 b=A2PVi41pLJI13gunSjUR7X6lm+XOLNwTzlkjwCAO9LX+OKaPxN7KXD2CyiQPOrQ6Vv
 UGubjEcEmW3y+YnLZMFYxn0Y+X4Gzxpu8ps0qDGTP2iY4KwcWIRjE/Y99HKcvp9Ds371
 URzh6CDe8up32KGd3MJg9QVhR9Bs+NgEiFu5Y6ZFaC/mDqyr9nPwk30rYsE10dC8fF7W
 IaylBZqLPZad40YLNzAQRw4IsleY7kYKwseCjs5hUETqUbY/L35m7QeLWXsdK61QcZb3
 hw4gkxsiRdX/Q/9uN9+5wQv+sYJtb9G85f8u7l/Un5fC/mlzbmXobQdUkWx3GizuhZ9r
 Rziw==
X-Gm-Message-State: ANhLgQ0VQzCbzf0sRHAps0lR65XtKP9KgOjPiCiTNXfYYV+M7WiMFp4g
 ejeQL1vZ+RwE02yAhub+ZB2eXg==
X-Google-Smtp-Source: ADFU+vvGttw4ayvfoY1nD9TtZ8K1jixSeH5nR8oiNQZyZxd0sVnJ8OSw2bZHUyqOGAR5v/fISCJc9g==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr674978wru.94.1585332809528;
 Fri, 27 Mar 2020 11:13:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm9401178wrr.12.2020.03.27.11.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 11:13:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9B641FF91;
 Fri, 27 Mar 2020 18:13:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 05/12] tests/vm: update NetBSD to 9.0
Date: Fri, 27 Mar 2020 18:13:13 +0000
Message-Id: <20200327181320.23329-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327181320.23329-1-alex.bennee@linaro.org>
References: <20200327181320.23329-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Kamil Rytarowski <kamil@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

The installer supports GPT now, so the install workflow has changed a
bit.  Also: run without VGA device.  This works around a bug in the
seabios sercon code and makes the bootloader menu show up on the serial
line, so we can drop the quirk for that.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200310083218.26355-5-kraxel@redhat.com>
Message-Id: <20200323161514.23952-5-alex.bennee@linaro.org>

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index f3257bc245a..b10c9d429de 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
 
-    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-8.1/images/NetBSD-8.1-amd64.iso"
-    csum = "718f275b7e0879599bdac95630c5e3f2184700032fdb6cdebf3bdd63687898c48ff3f08f57b89f4437a86cdd8ea07c01a39d432dbb37e1e4b008f4985f98da3f"
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-amd64.iso"
+    csum = "34da4882ee61bdbf69f241195a8933dc800949d30b43fc6988da853d57fc2b8cac50cf97a0d2adaf93250b4e329d189c1a8b83c33bd515226f37745d50c33369"
     size = "20G"
     pkgs = [
         # tools
@@ -86,42 +86,31 @@ class NetBSDVM(basevm.BaseVM):
         self.boot(img_tmp, extra_args = [
             "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
-            "-device", "VGA",
             "-cdrom", iso
         ])
         self.console_init()
-        self.console_wait("Primary Bootstrap")
-
-        # serial console boot menu output doesn't work for some
-        # reason, so we have to fly blind ...
-        for char in list("5consdev com0\n"):
-            time.sleep(0.2)
-            self.console_send(char)
-            self.console_consume()
+        self.console_wait_send("3. Drop to boot prompt", "3")
+        self.console_wait_send("> ", "consdev com0\n")
         self.console_wait_send("> ", "boot\n")
 
         self.console_wait_send("Terminal type",            "xterm\n")
         self.console_wait_send("a: Installation messages", "a\n")
-        self.console_wait_send("b: US-English",            "b\n")
         self.console_wait_send("a: Install NetBSD",        "a\n")
         self.console_wait("Shall we continue?")
         self.console_wait_send("b: Yes",                   "b\n")
 
         self.console_wait_send("a: ld0",                   "a\n")
+        self.console_wait_send("a: Guid Partition Table",  "a\n")
         self.console_wait_send("a: This is the correct",   "a\n")
-        self.console_wait_send("b: Use the entire disk",   "b\n")
-        self.console_wait("NetBSD bootcode")
-        self.console_wait_send("a: Yes",                   "a\n")
-        self.console_wait_send("b: Use existing part",     "b\n")
+        self.console_wait_send("b: Use default part",      "b\n")
         self.console_wait_send("x: Partition sizes ok",    "x\n")
-        self.console_wait_send("for your NetBSD disk",     "\n")
         self.console_wait("Shall we continue?")
         self.console_wait_send("b: Yes",                   "b\n")
 
         self.console_wait_send("b: Use serial port com0",  "b\n")
         self.console_wait_send("f: Set serial baud rate",  "f\n")
         self.console_wait_send("a: 9600",                  "a\n")
-        self.console_wait_send("x: Exit",                  "x\n")
+        self.console_wait_send("x: Continue",              "x\n")
 
         self.console_wait_send("a: Full installation",     "a\n")
         self.console_wait_send("a: CD-ROM",                "a\n")
-- 
2.20.1


