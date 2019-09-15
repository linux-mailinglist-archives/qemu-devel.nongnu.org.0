Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FDFB324A
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 23:42:04 +0200 (CEST)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9cHT-0005SP-Kd
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 17:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9cF6-0003y8-Ku
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 17:39:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9cF5-00029q-K1
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 17:39:36 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9cF5-00029W-EZ
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 17:39:35 -0400
Received: by mail-wm1-x344.google.com with SMTP id t3so8014824wmj.1
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 14:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Frg6tZ1TC2PHX8mmoG0LosBDduNlHrAyszqT6sZPRDQ=;
 b=kEApvWtwVS7RxbPMMtTFLVUx5pR4m+XVvjUOkqaxp8MVdcO8JEqr2GfIr+AlUVuRDH
 PuK2/1iw2t6wWnPPMg7v+XpZUtesQNCbdBiWCLLPsXnZQ0WRi93cpoytk3cuoYWOhINU
 4OaEzFBVwOYKVZ4eaarqFdIiVBCeLyhN4MrtPYecjGvtUHl8tM/0lM2xSgcdRaBOIWQ3
 zU4HFVvBajV6sZ0MjEefip5znmpWZTASB+D9YUQ18eu5gIQq/sCitqhhZeVG4ojwgRqG
 MFyxDB3gqxR65VEABsMT8rKa7rGl4c3R1Lopm5qh2LEULg+IapAjAuhQTX2oOzsyp+KK
 Oh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Frg6tZ1TC2PHX8mmoG0LosBDduNlHrAyszqT6sZPRDQ=;
 b=nLJUvcNZiW60Y31M9FQtWa2s4b+bLzwsHKEuEwCHIM7j4vN/o2igr3TFxk4ZY25Iz2
 ++zfKZuynzBUi6sZEt5awE0qKj978fhhcps0r1s6TLJiZAkoLItXApYTEGR/823Y+x39
 1f90TgaSyrRDgW5xrvF7JMleyMidgbskHBtQp8LqGCUYnUkOoUkRO06UmAzWVeJnTn+f
 9dDWm1G2Bat16sRaEWGUgHvGoAuM7OiKVu0lZ+IxVcZt3cLfnaAa5zISux4W/HGVujY4
 VBcTk+yVuL+00k2qiKUp0jtxEiQ7NEwwTUv5o7GMMT0JWiKMIXJKPF9/0NwzntFyT2Om
 CoEw==
X-Gm-Message-State: APjAAAXIEBpzm5JefH0YqIRDkMd59AzmD1UcCbeMryGMP1cNs7ei/NOU
 rZUDC2hX3b0KA/WM1mKj/um4C44B
X-Google-Smtp-Source: APXvYqx9f6DHLCWJ8gNxrRoKQkgZnR7b+XvOXUH3UD74UHMkasJHYWE1+04Na1KPiFEMf51qaF+Rnw==
X-Received: by 2002:a7b:c319:: with SMTP id k25mr12115436wmj.48.1568583574316; 
 Sun, 15 Sep 2019 14:39:34 -0700 (PDT)
Received: from localhost.localdomain (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id z1sm68738999wre.40.2019.09.15.14.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 14:39:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 23:39:21 +0200
Message-Id: <20190915213924.22223-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190915213924.22223-1-f4bug@amsat.org>
References: <20190915213924.22223-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH v7 6/9] linux-user/strace: Add print_sockfd()
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract common print_sockfd() from various socket related syscalls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v6: use another ifdef TARGET_NR_socketcall
---
 linux-user/strace.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 22dd453d26..01c802c4e3 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1709,6 +1709,15 @@ print_socket(const struct syscallname *name,
 
 #if defined(TARGET_NR_socketcall)
 
+static void print_sockfd(abi_long sockfd, int last)
+{
+    print_raw_param(TARGET_ABI_FMT_ld, sockfd, last);
+}
+
+#endif
+
+#if defined(TARGET_NR_socketcall)
+
 #define get_user_ualx(x, gaddr, idx) \
         get_user_ual(x, (gaddr) + (idx) * sizeof(abi_long))
 
@@ -1741,7 +1750,7 @@ static void do_print_sockaddr(const char *name, abi_long arg1)
     get_user_ualx(addrlen, arg1, 2);
 
     gemu_log("%s(", name);
-    print_raw_param(TARGET_ABI_FMT_ld, sockfd, 0);
+    print_sockfd(sockfd, 0);
     print_sockaddr(addr, addrlen);
     gemu_log(")");
 }
@@ -1754,7 +1763,7 @@ static void do_print_listen(const char *name, abi_long arg1)
     get_user_ualx(backlog, arg1, 1);
 
     gemu_log("%s(", name);
-    print_raw_param(TARGET_ABI_FMT_ld, sockfd, 0);
+    print_sockfd(sockfd, 0);
     print_raw_param(TARGET_ABI_FMT_ld, backlog, 1);
     gemu_log(")");
 }
@@ -1789,7 +1798,7 @@ static void do_print_sendrecv(const char *name, abi_long arg1)
     get_user_ualx(flags, arg1, 3);
 
     gemu_log("%s(", name);
-    print_raw_param(TARGET_ABI_FMT_ld, sockfd, 0);
+    print_sockfd(sockfd, 0);
     print_buf(msg, len, 0);
     print_raw_param(TARGET_ABI_FMT_ld, len, 0);
     print_flags(msg_flags, flags, 1);
@@ -1808,7 +1817,7 @@ static void do_print_msgaddr(const char *name, abi_long arg1)
     get_user_ualx(addrlen, arg1, 5);
 
     gemu_log("%s(", name);
-    print_raw_param(TARGET_ABI_FMT_ld, sockfd, 0);
+    print_sockfd(sockfd, 0);
     print_buf(msg, len, 0);
     print_raw_param(TARGET_ABI_FMT_ld, len, 0);
     print_flags(msg_flags, flags, 0);
@@ -1824,7 +1833,7 @@ static void do_print_shutdown(const char *name, abi_long arg1)
     get_user_ualx(how, arg1, 1);
 
     gemu_log("shutdown(");
-    print_raw_param(TARGET_ABI_FMT_ld, sockfd, 0);
+    print_sockfd(sockfd, 0);
     switch (how) {
     case SHUT_RD:
         gemu_log("SHUT_RD");
@@ -1851,7 +1860,7 @@ static void do_print_msg(const char *name, abi_long arg1)
     get_user_ualx(flags, arg1, 2);
 
     gemu_log("%s(", name);
-    print_raw_param(TARGET_ABI_FMT_ld, sockfd, 0);
+    print_sockfd(sockfd, 0);
     print_pointer(msg, 0);
     print_flags(msg_flags, flags, 1);
     gemu_log(")");
@@ -1868,7 +1877,7 @@ static void do_print_sockopt(const char *name, abi_long arg1)
     get_user_ualx(optlen, arg1, 4);
 
     gemu_log("%s(", name);
-    print_raw_param(TARGET_ABI_FMT_ld, sockfd, 0);
+    print_sockfd(sockfd, 0);
     switch (level) {
     case SOL_TCP:
         gemu_log("SOL_TCP,");
-- 
2.20.1


