Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B1125476
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 22:16:31 +0100 (CET)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihggI-0008Or-C2
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 16:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ihgUr-000296-Ku
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:04:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ihgUq-00019m-5e
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:04:41 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ihgUp-00018G-Vf
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:04:40 -0500
Received: by mail-wm1-x344.google.com with SMTP id t14so3426772wmi.5
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 13:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=K7NdrGgib2SGgtUNoIuWUwFhjQbTtx4xXBELzh85Z6M=;
 b=htdyPi7eCIS8y9K4gwDoCHNbbFe1oWY9RG8fvddf6vPk6Z7zTeTwn5s9T3pAPnfQgb
 ajdWE3H/pvmvcVtcvDL8FDtHO7HtUyNnmLqSg0WBzgHY53g9X5R3K/JNIhG7wQAqpWrS
 5L9Hn97C9WSUkQUHZYzrCCDdmYlbCrJEEjyVP39K1Fr6sJmWZKXAIwOaLBhiWOjjQiBC
 S2OOHqcpX5bIJXD8Q64PrCdA7qjBIJfwaeRdBnI1x4VhPnZwjUVZFh8OXlrjuOHdlEEA
 0fvVHkVrH05QFuc6mq/LNLOxdFbkecFk/qw52gfIUbEf91uRqqyU3+9eSEaZPSALpYEK
 5XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=K7NdrGgib2SGgtUNoIuWUwFhjQbTtx4xXBELzh85Z6M=;
 b=A3Bx6R3synKrD94rVMajkmRJoMXBC5uDCyfAksZpgeKd9icmWj/DJyFXRnw7sp+gdC
 S964aSwKC90yKY7VK4kr/4vsFx7hK9i/7ph3Bn4jGgJFx4G0mdO4lmFN3Kzl5jPVuDnw
 SFXpwU9PNqI02adt9dP2nsDpcJjpfoLz6ldclK+nB+tERXlQyFXyyytojP9z5opI5a8S
 VLXPwUECwT5/s4zE6f5Lnd68sCqwS+HNkp3s3gnpLzL8t2EnUvlpnMZbMiU0/CzmH3zB
 kHTlptL4r7bJ0kicVZ2JcspVg8p+jst4O599KYq1KH6PnZru8XpFUZ5kOQo5U/EXaf0g
 qLCA==
X-Gm-Message-State: APjAAAUYjv2UKgHNs0h+HI6ncd19IBB2qUb5WV7J9ecu69txt12T1epb
 rlAFhDmk5YemhdnIdn5gaBEOKkX/A8c9Zw==
X-Google-Smtp-Source: APXvYqzectLhCzl76YLi7enUmILGH1NPjl53TstgX10KfoYQoZkmx8bbBkf7dEE4zjxUWAm6w1X5Ew==
X-Received: by 2002:a1c:7918:: with SMTP id l24mr5863421wme.125.1576703075295; 
 Wed, 18 Dec 2019 13:04:35 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-109-65-2-109.red.bezeqint.net. [109.65.2.109])
 by smtp.gmail.com with ESMTPSA id a133sm3808933wme.29.2019.12.18.13.04.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Dec 2019 13:04:34 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v39 16/22] target/avr: Add section about AVR into QEMU
 documentation
Date: Wed, 18 Dec 2019 23:03:23 +0200
Message-Id: <20191218210329.1960-17-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191218210329.1960-1-mrolnik@gmail.com>
References: <20191218210329.1960-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 me@xcancerberox.com.ar, richard.henderson@linaro.org, dovgaluk@ispras.ru,
 imammedo@redhat.com, philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 qemu-doc.texi | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index eea91a2d1e..c169ab9357 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1742,6 +1742,7 @@ differences are mentioned in the following sections.
 * Microblaze System emulator::
 * SH4 System emulator::
 * Xtensa System emulator::
+* AVR System emulator::
 @end menu
 
 @node PowerPC System emulator
@@ -2515,6 +2516,56 @@ so should only be used with trusted guest OS.
 
 @c man end
 
+@node AVR System emulator
+@section AVR System emulator
+@cindex system emulation (AVR)
+
+Use the executable @file{qemu-system-avr} to emulates a AVR 8 bit based machine having one for the following cores: avr1, avr2, avr25, avr3, avr31, avr35, avr4, avr5, avr51, avr6, avrtiny, xmega2, xmega3, xmega4, xmega5, xmega6 and xmega7.
+
+As for now it does not support any real MCUs. However, it does support a "sample" board for educational and testing purposes. This "sample" board hosts USART & 16 bit timer devices and it's enought to run FreeRTOS based applicaton (like this @url{https://github.com/seharris/qemu-avr-tests/blob/master/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf,,demo})
+
+Following are examples of possible usages, assuming program.elf is compiled for AVR cpu
+@itemize
+
+@item Continious non interrupted execution
+@example
+qemu-system-avr -kernel program.elf
+@end example
+
+@item Continious non interrupted execution with serial output into telnet window
+@example
+qemu-system-avr -kernel program.elf -serial tcp::5678,server,nowait -nographic
+@end example
+and then in another shell
+@example
+telent localhost 5678
+@end example
+
+@item Continious non interrupted execution with serial output into stdout
+@example
+qemu-system-avr -kernel program.elf -serial stdio
+@end example
+
+@item Debugging wit GDB debugger
+@example
+qemu-system-avr -kernel program.elf -s -S
+@end example
+and then in another shell
+@example
+avr-gdb program.elf
+@end example
+and then within GDB shell
+@example
+target remote :1234
+@end example
+
+@item Print out executed instructions
+@example
+qemu-system-avr -kernel program.elf -d in_asm
+@end example
+
+@end itemize
+
 @node QEMU User space emulator
 @chapter QEMU User space emulator
 
-- 
2.17.2 (Apple Git-113)


