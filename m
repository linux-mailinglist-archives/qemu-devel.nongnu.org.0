Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11112CB20
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 23:12:25 +0100 (CET)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilgnQ-0002Ei-Q1
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 17:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ilgV7-0007ty-58
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ilgV5-0004Oc-VI
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:53:29 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51043)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ilgV5-0004MA-Oa
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:53:27 -0500
Received: by mail-wm1-x342.google.com with SMTP id a5so12643827wmb.0
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 13:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=duDXkUFlDNtJIbu978IUSV+Wrf5g6uHlOsWbLLvzQlE=;
 b=e5+GchZL/Sz6S52jv3y8DRoH96Yzokghki/MDq6YlciI1h3GtlEzq5R98gyVbX1eMA
 EP9TbA+gyUjGFCx8BiJFdEdZo4VUOfzd936fytjLEUggiLYKrJr1LV3WoFTuRupRSPMw
 TNuqODmJ0LTRRQu84CBqKNdBmcovHktY5xxaNumKBT2QvQpWKHSlzJvtXmZy7fq/DSqt
 dKV+5O+Ds4AQEgDcnhPvDTDK29ZCSbq3voUplyqVY6Lz+qqfGj7DYZazjC7Vk5nc6PbJ
 YBI3FcxYemTyat2ZQ/GYZ3CXB0FCMl4tAG8mJdMHlyyPtT61UNWvENEONBGyXs1IiNXY
 IeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=duDXkUFlDNtJIbu978IUSV+Wrf5g6uHlOsWbLLvzQlE=;
 b=U8mmP9vwCATWaphJCQ8f+KeuLCmGrUxpm9CLEFdo6Kr5IeN2Wg2Hsu/oIjLSyZkjqk
 k0xCqO9WPkscUmRz4Bq6rnY6T221Va64+5CG7kclrkuGiWZIN+KiPdSgHkRa3kYaXUdS
 0xklmk1wLMX5dU/Ut7mnCKGwmd9eZ0znX9nH8RYSWaqGTz59C0isu2M6elkZJnGIQXhE
 BCDeS/Zib0DUTnL7Hnc47JiNHPYyNzHdbkNerfaTYyZeMeLvtQ5om4ojuPMIjDWe42dN
 1/PjUXhj/KGp8gIBKmZnaCv6KCQ8HqGbqz4zSxPefTz9QYN5szlkm9I11EhdaoQlwXtV
 /omw==
X-Gm-Message-State: APjAAAVo7ti+c4uwUqVWS+OtRdv1QOsllkFW0dzQoEJYV3LNW55VYIIa
 QHNAqJiWXQOGvQXQcR8+e0p54HyP/sr+SA==
X-Google-Smtp-Source: APXvYqzIlzkf7G6GnPMRTLgp930YtR/zRlpyfY8sfaEluFhx0qkd1fIJiesjSWi4LN9y/kcGKzY+ig==
X-Received: by 2002:a1c:7ed0:: with SMTP id z199mr30436301wmc.58.1577656406651; 
 Sun, 29 Dec 2019 13:53:26 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-183-93-3.red.bezeqint.net. [79.183.93.3])
 by smtp.gmail.com with ESMTPSA id 25sm18182850wmi.32.2019.12.29.13.53.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 29 Dec 2019 13:53:26 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v40 21/21] target/avr: Update MAINTAINERS file
Date: Sun, 29 Dec 2019 23:51:58 +0200
Message-Id: <20191229215158.5788-22-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191229215158.5788-1-mrolnik@gmail.com>
References: <20191229215158.5788-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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

Include AVR maintaners in MAINTAINERS file

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 MAINTAINERS | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 387879aebc..90c0a0c27f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -163,6 +163,15 @@ S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
 
+AVR TCG CPUs
+M: Michael Rolnik <mrolnik@gmail.com>
+R: Sarah Harris <S.E.Harris@kent.ac.uk>
+S: Maintained
+F: target/avr/
+F: tests/acceptance/machine_avr6.py
+F: default-configs/avr-softmmu.mak
+F: gdb-xml/avr-cpu.xml
+
 CRIS TCG CPUs
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
@@ -481,6 +490,18 @@ F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
 
+AVR Machines
+M: Michael Rolnik <mrolnik@gmail.com>
+R: Sarah Harris <S.E.Harris@kent.ac.uk>
+S: Maintained
+F: hw/avr/
+F: hw/char/avr_usart.c
+F: include/hw/char/avr_usart.h
+F: hw/timer/avr_timer16.c
+F: include/hw/timer/avr_timer16.h
+F: hw/misc/avr_mask.c
+F: include/hw/misc/avr_mask.h
+
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
-- 
2.17.2 (Apple Git-113)


