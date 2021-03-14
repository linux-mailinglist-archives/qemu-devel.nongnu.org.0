Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82933A8EA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:48:32 +0100 (CET)
Received: from localhost ([::1]:56162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaTH-0000n7-VX
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaRs-00084g-JO
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:47:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaRr-0003Ea-0F
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:47:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso19203632wmi.3
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=suvH21j+YfDTj1CY1NkdjyzK1t6K7J8wSgbx8wa+lxk=;
 b=E9Hn3bExkNAeiBFbcaGfoXbz7yQYIHo2mfSUK+d916gnt/J+pR31w5STWZKoBkTQj9
 nDRmIXgWu7taNPYTu59WFe6Suq4RzcHwxKABUWoZp5/UOfpI4/yBGmMZ/cslsUvV/4un
 aUweLVStmXX7aCoo3iYQT8zy8s89e7epCjB6eIwp8G1LTjJ8u5byZDWd4yGdtHyr5yo5
 0AcoiEja4nxDvhBgqGEgEr/7F24XNOE7iUv0RlvI4isn8WxOilmX8ZEJ6GRDHwlA/XZO
 RZwJeSdWeaaP13ithIdqVNwZQwYMGBDyEuO3t+6quRiefLyJRg5FXhyBMBqKjDmhA10D
 RUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=suvH21j+YfDTj1CY1NkdjyzK1t6K7J8wSgbx8wa+lxk=;
 b=hEWAv2FKJtWiNutRtBQszUD1I9I/1rGPBt3tmEGYOY8cc6Oct6eE2sMmwNie2tv7GK
 YgBejnCC7WnXUCTV5Gnr0auwXihGf9hw/Tmzb1VRIYDIk2Zf70ZOjfPQ3OkfjZDn7TxN
 Bi2JK3AQ1hwcPQLi8JPbxSEJ1oIn117qyPQVM0MTjqdmxfxIHUdSDPEpCGIAAbHIitza
 uU0LXOuqSNPIyfrXiDvVISgSC6PbYyYJLrppm5FZW5AUUaM/v662eR/O8WHJlg1+2du9
 AKJ+pAKkqlaAEIBDHq3tT7Cb3l/Y5py0LUIREcG7VX2SgcWRFLC7w8rNDnVzmo51Th8v
 xsdQ==
X-Gm-Message-State: AOAM530CRzyrobDU70A2jq4DcORdMjb7tZwNM+vj6oK5oztSvG84fqzz
 ZkNxZ7cDlXoXU0r2llaegFgTsMYQukv5hQ==
X-Google-Smtp-Source: ABdhPJyT9LWDzaJ7Hg0W9pRTmrj01KpRhE3LAOb5nSvf9SD+d297b6k4hDparUtt0Rd7T48wTTVqCg==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr22708528wmh.131.1615765621527; 
 Sun, 14 Mar 2021 16:47:01 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x23sm10461170wmi.33.2021.03.14.16.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:47:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] hw/avr/arduino: List board schematic links
Date: Mon, 15 Mar 2021 00:46:47 +0100
Message-Id: <20210314234649.2614590-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314234649.2614590-1-f4bug@amsat.org>
References: <20210314234649.2614590-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20210313165445.2113938-3-f4bug@amsat.org>
---
 hw/avr/arduino.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 3c8388490d6..3ff31492fa6 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -75,7 +75,10 @@ static void arduino_duemilanove_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     ArduinoMachineClass *amc = ARDUINO_MACHINE_CLASS(oc);
 
-    /* https://www.arduino.cc/en/Main/ArduinoBoardDuemilanove */
+    /*
+     * https://www.arduino.cc/en/Main/ArduinoBoardDuemilanove
+     * https://www.arduino.cc/en/uploads/Main/arduino-duemilanove-schematic.pdf
+     */
     mc->desc        = "Arduino Duemilanove (ATmega168)",
     mc->alias       = "2009";
     amc->mcu_type   = TYPE_ATMEGA168_MCU;
@@ -87,7 +90,10 @@ static void arduino_uno_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     ArduinoMachineClass *amc = ARDUINO_MACHINE_CLASS(oc);
 
-    /* https://store.arduino.cc/arduino-uno-rev3 */
+    /*
+     * https://store.arduino.cc/arduino-uno-rev3
+     * https://www.arduino.cc/en/uploads/Main/arduino-uno-schematic.pdf
+     */
     mc->desc        = "Arduino UNO (ATmega328P)";
     mc->alias       = "uno";
     amc->mcu_type   = TYPE_ATMEGA328_MCU;
@@ -99,7 +105,10 @@ static void arduino_mega_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     ArduinoMachineClass *amc = ARDUINO_MACHINE_CLASS(oc);
 
-    /* https://www.arduino.cc/en/Main/ArduinoBoardMega */
+    /*
+     * https://www.arduino.cc/en/Main/ArduinoBoardMega
+     * https://www.arduino.cc/en/uploads/Main/arduino-mega2560-schematic.pdf
+     */
     mc->desc        = "Arduino Mega (ATmega1280)";
     mc->alias       = "mega";
     amc->mcu_type   = TYPE_ATMEGA1280_MCU;
@@ -111,7 +120,10 @@ static void arduino_mega2560_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     ArduinoMachineClass *amc = ARDUINO_MACHINE_CLASS(oc);
 
-    /* https://store.arduino.cc/arduino-mega-2560-rev3 */
+    /*
+     * https://store.arduino.cc/arduino-mega-2560-rev3
+     * https://www.arduino.cc/en/uploads/Main/arduino-mega2560_R3-sch.pdf
+     */
     mc->desc        = "Arduino Mega 2560 (ATmega2560)";
     mc->alias       = "mega2560";
     amc->mcu_type   = TYPE_ATMEGA2560_MCU;
-- 
2.26.2


