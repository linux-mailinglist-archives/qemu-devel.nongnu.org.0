Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E040915C0F2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 16:04:33 +0100 (CET)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2G2Y-0006zy-UL
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 10:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2FhR-0004uk-Oh
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2FhO-0002RP-7k
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:39 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35099)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2FhN-0002LX-Vf
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:38 -0500
Received: by mail-wm1-x342.google.com with SMTP id b17so7045716wmb.0
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 06:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UA8JO5a7csYlOT0FpOll3VhjQ+P4Rnh4Fm3iNx+U6Js=;
 b=SwbREz+7s60pP+S44IV7mT0OtICjhRjglpby+mYEsg0Yym+ElBFRqsQeAt1X0ihZVW
 55v4fGSMDRE4UUHAVuPF9+ds3ehdLD7YqEj4lpVnEBLQUsyK45i4CzFmabBI3RHckyET
 npcdT1V0ie5KxKwQf18hnP1+sM3kgg3voBt1ol8fP9BQiA8XNXAe3/RNt5jEZJ42bHqF
 xssUhQBOoZpu0+s/Tb2FmLlTNVdU+YNYYYFWnqTWZmHi4RRAewlaLnFe49w5xdRMoJnJ
 9VBgbGXTw3ms4cNLZxWGpNC4PAhHIBX+Io4w+GuHK82keBLoiquY5O8CMj7IRVbV6/Zy
 ZZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UA8JO5a7csYlOT0FpOll3VhjQ+P4Rnh4Fm3iNx+U6Js=;
 b=aPexbUEAGrC3fK8tTCVFfRxyDdtq4hTKgifPD/fxmkuu96NDAXhNJzv9sj7wcxkUYM
 FxQucuVZRGsUNdrVVIsHDDdY3QIbsYZvT3497E3jn/xwXTfvmy72PUQg0EWbie2g9ENy
 pa/Xf65OgNqQ2/JqDQ2hJM2h9u/Cpi5BqDV0wh7t7Q4bXpN7uiYOcmJzTkcKng7yyRlG
 9ea0gEPwJEmhTk38laQyptstVv4NZW8YcPqRfcRwogva3oeqIenJbyBCQcfNn/uCsRiu
 RYDtGUkFSjByvJH2qMPMZx9Gdfa7PeW2j6MuaxAq8K3VSE17cATaMvkfRBKOqNaLV5DT
 VXqQ==
X-Gm-Message-State: APjAAAVZH7JCfIVAM7w6pXQR/z0IQEhziPhpcuAKhVFShVTOsji1uJ/n
 uYw3g5WMolDB1rg1kKgNR5ns3GnL8lQ=
X-Google-Smtp-Source: APXvYqyvpDwisoXO0nByDuL7QJ3PNteQwFWDkoVoQg/8lwDI8/csSV9rWbkTiFLIhs4tqaHMCo2C7g==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr6142604wmi.60.1581604952483; 
 Thu, 13 Feb 2020 06:42:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e22sm3362454wme.45.2020.02.13.06.42.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 06:42:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/46] hw/arm/raspi: Make board_rev a field of RaspiMachineClass
Date: Thu, 13 Feb 2020 14:41:39 +0000
Message-Id: <20200213144145.818-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213144145.818-1-peter.maydell@linaro.org>
References: <20200213144145.818-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to have a common class_init(). The only value that
matters (and changes) is the board revision.
Pass the board_rev as class_data to class_init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20200208165645.15657-9-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/raspi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 62b8df3c2e7..fbfcd297326 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -46,6 +46,7 @@ typedef struct RaspiMachineClass {
     /*< private >*/
     MachineClass parent_obj;
     /*< public >*/
+    uint32_t board_rev;
 } RaspiMachineClass;
 
 #define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
@@ -227,9 +228,11 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
 }
 
-static void raspi_init(MachineState *machine, uint32_t board_rev)
+static void raspi_init(MachineState *machine)
 {
+    RaspiMachineClass *mc = RASPI_MACHINE_GET_CLASS(machine);
     RaspiMachineState *s = RASPI_MACHINE(machine);
+    uint32_t board_rev = mc->board_rev;
     int version = board_version(board_rev);
     uint64_t ram_size = board_ram_size(board_rev);
     uint32_t vcram_size;
@@ -279,13 +282,16 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
 
 static void raspi2_init(MachineState *machine)
 {
-    raspi_init(machine, 0xa21041);
+    raspi_init(machine);
 }
 
 static void raspi2_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    uint32_t board_rev = (uint32_t)(uintptr_t)data;
 
+    rmc->board_rev = board_rev;
     mc->desc = "Raspberry Pi 2B";
     mc->init = raspi2_init;
     mc->block_default_type = IF_SD;
@@ -302,13 +308,16 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
 #ifdef TARGET_AARCH64
 static void raspi3_init(MachineState *machine)
 {
-    raspi_init(machine, 0xa02082);
+    raspi_init(machine);
 }
 
 static void raspi3_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    uint32_t board_rev = (uint32_t)(uintptr_t)data;
 
+    rmc->board_rev = board_rev;
     mc->desc = "Raspberry Pi 3B";
     mc->init = raspi3_init;
     mc->block_default_type = IF_SD;
@@ -327,11 +336,13 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi2"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2_machine_class_init,
+        .class_data     = (void *)0xa21041,
 #ifdef TARGET_AARCH64
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3_machine_class_init,
+        .class_data     = (void *)0xa02082,
 #endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
-- 
2.20.1


