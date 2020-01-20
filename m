Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8D1433C0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 23:13:14 +0100 (CET)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itfID-00077j-OP
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 17:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1itf6u-0001fs-Jh
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 17:01:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1itf6t-0005w1-HY
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 17:01:28 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40434)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1itf6t-0005vd-BC
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 17:01:27 -0500
Received: by mail-wr1-x444.google.com with SMTP id c14so1088789wrn.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 14:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uF5SD4eExXYhrVbQuOpTQ8D9Fx28DI4wx6WvsKwahOc=;
 b=o9XLjQ6UNQ5vxcruZJ+Fsv+Zs/8lMjbiAFk8ooH70IcYrWKkoncJFwLa1Azab20M0d
 lGjStZG4OPqxFyRrw9fha+vrGRMlm8MURK+LMUmR74SGvsv+oICgHr5+A0Edt2iYzNlS
 ecEzC+UGVfBBagcqlm+MQe1yvSAM208qxCgcr6AgMlZUlHkSStRQMgZRv7XRha0Qpem7
 7sjEpBndkBgcuVPTZgw8daMsanGwfXYG7mmyPAlj/+AiOZ9NIDG4ah2TgMMFhnx7Ieek
 Rxr6MLAlBm+vVCoWf4qqHe3l0GrbMFk+HocUCnj0zFd1qNqENmzRypA6impFXwInc5+3
 9rxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uF5SD4eExXYhrVbQuOpTQ8D9Fx28DI4wx6WvsKwahOc=;
 b=hYThn4L0WjiK6px2kf0qNOKasTMGAfJJ7n7Fg0KaIrMPyz6V10Xqs22jFOswncPvOe
 TnOxuKJXbEBoSuTNDWY/IA+plt9lMqUR7x7SaRUCsvhWQNzZASGdum96EVjNTSjQOTXo
 /Jv8I5keYVTUSkFGkMAhzS6+g+6WrKin7sULGQV2rh0xRYQzMEYYwmLBgDH+1UiC0dgu
 kpqZ6mRyO8z14zSZcBZHXiOqzjaj/Kw463WzBrylG3CrXyLdNnk905ET39kY5joiyFEf
 7c9rOKpqzXACknGh7cEb9g8vEYhehhYlXRX5OWevzZrp9vCeA8DNbqr25Hf/La8KUc3R
 dbzg==
X-Gm-Message-State: APjAAAUL0hj9bJXMNJayhMwKe5BFI3LrofZ76u8zR65aNN9oMCh1lVbD
 +hfMztvH9toFOBIldnnJ8kSWTTOp
X-Google-Smtp-Source: APXvYqwTGXWRAeZ6rBbUb2PZkxurYoq4vpwYkGcwaZvdsSeYiNvkHb29BBLwmqfXjK4H5SNXIM9ttQ==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr1459094wro.51.1579557686288;
 Mon, 20 Jan 2020 14:01:26 -0800 (PST)
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id f1sm904341wmc.45.2020.01.20.14.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 14:01:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/18] hw/avr: Introduce ATMEL_ATMEGA_MCU config
Date: Mon, 20 Jan 2020 23:01:01 +0100
Message-Id: <20200120220107.17825-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200120220107.17825-1-f4bug@amsat.org>
References: <20200120220107.17825-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/avr/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index 516b89c849..228eae7582 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -1,6 +1,9 @@
-config AVR_SAMPLE
+config ATMEL_ATMEGA_MCU
     bool
     select ATMEL_TIMER16
     select ATMEL_USART
     select ATMEL_POWER
+
+config AVR_SAMPLE
+    select ATMEL_ATMEGA_MCU
     select UNIMP
-- 
2.21.1


