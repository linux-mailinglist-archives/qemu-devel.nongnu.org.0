Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343AC339F4A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:58:59 +0100 (CET)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7bO-0000k7-73
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Xd-0005Mk-9t
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:05 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7XY-0000qH-JO
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id o16so3449712wrn.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J7gMHqZIErk5rCH25dzzn6NDSzVyceUq6CbtaCA8wLk=;
 b=vBAgavVjSYHvgI0+0El4932LzCDSiTAgfKpoqzHXE/r/HSQiLXIHnMw2iUMH00tFVh
 Zfi6iBslOuunGvLDgmrF7z8K/AiXw+9n2dcUforP+G44ld50nxeyHPXAUIDwenJYH0Qg
 kqNi3EVecPZJT9AV55WqioEoSGCquQ1cjJaSMy1JVyR4vfVzHIoztD3x4Q8mferFMhoJ
 x5Q36D8MSK/iG3GIluBCRUjZc74yAXn/MqGWNiY0Mcl6YXoTojolRLTITqnkb+s0/FXQ
 ei/ENB6PS1StQwX4Dy2UFRggMu1WC5mY4hmiaoB9R+GY9CVPdccuhb6FpQrl76PnNNpn
 ohBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J7gMHqZIErk5rCH25dzzn6NDSzVyceUq6CbtaCA8wLk=;
 b=kECW01H6+IgcoYABOgX0QCaZxtMIFzpWMJoPlPOOK0zDBI3+DTEcSZ0ioYu+eOVB/X
 TcGVbVmGR7XCIRIRQPbQoqix3EX15WEHbigMwKEN4e+LwO0le6MUfDRfhtQILb9LaX3q
 t50Fz+YtqsTJxe6uASgsoefgFu+rx0KCXF97r/JOgAwpq+YBEVNd7s+aASDunOtizfxK
 2zzgsw5rKyaSq8CqDaLEMpwoC5ol3GyX5aNIvlyguoIhHcMd58Wh4H57A4NB4kt0nLkp
 3SO2hSot85VMdeK5IVVx2oV3ZqCs8nsmZSGeWCtmsEScRZVhse9T5V03sa1u0cDGKaFw
 esuA==
X-Gm-Message-State: AOAM530IzLPdhVk2QQQ2ZKNBMoKKy9tvo+FOaDkIfdDK+AzdC//5om7y
 DfrPaWt48ht9HxkRQtLskKlBY0m7PW53vw==
X-Google-Smtp-Source: ABdhPJy682kfbg0w8Oa1TZLb5kAIzzOv3TB2z/+y5T5Qm0zMPFB/1p8GZytJkVyem46sZy08TcaETw==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr19141486wru.78.1615654498937; 
 Sat, 13 Mar 2021 08:54:58 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j6sm6629154wmq.16.2021.03.13.08.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:54:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] hw/avr/arduino: List board schematic links
Date: Sat, 13 Mar 2021 17:54:36 +0100
Message-Id: <20210313165445.2113938-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


