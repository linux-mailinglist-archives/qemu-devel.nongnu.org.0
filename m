Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC725C326
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 16:45:53 +0200 (CEST)
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDqUq-0007Ck-90
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 10:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDqTY-0006GT-0d
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 10:44:32 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDqTV-0001WX-Sp
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 10:44:31 -0400
Received: by mail-wr1-x443.google.com with SMTP id x14so3488452wrl.12
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rr+JVKyDamSf0xBTUVSv5bImqBYLa2yDIIfkheqLG6Y=;
 b=OrXUZh7/O1gy1jYEFfJW1KL+f26VkUM1Ol2OtT7BEy4ouDH0mBIkzQghrYe3+QhIzg
 HnK5VExGhKDRiP5nqWfiM19+/ATy/mZYxiaDIL+yt9WxiCnbeM/Q2BC+cFzcRw5Wh7f/
 mZ9P5z4UqsS6slLkGV5Wydli/qOWpVm1JbCL9r8p0kh/mGBzl3jCMeBZ8e9KITDTNhXu
 DGUKOclaYkI20gtBE/E3JrKfcqA6RmYUkOBD3wr4AZl6877r0OjdrtmC1kShXWxO4ySR
 MSQToQCXZuvWOvwqQHmD2SGh3uYoEs9PGvjhUWm6XfV7PH1F5B2WCoIk6T8GqfnnYUuJ
 SQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rr+JVKyDamSf0xBTUVSv5bImqBYLa2yDIIfkheqLG6Y=;
 b=IDBfAzq5jPoWdsqwie5NBx9/ztv8IsxxaEfzfCkJVO47KwBtDHrpAUGUT69kRw2i4W
 ZHWdY2rkSVXOwuYy3HHTit9Db9WzKMaLDS99WOyXOUGUWpvfI0N0pcnJpSYOaW9h8r8f
 +4gTVzh9RXwPjL8EowFuSSoyiuJRbIWHAy34MhyCB9nqqNF0xHMs2WhwKhMd/+F5qRbl
 hHMl6mi4WGBp5RgPrHjS1nrxBIKMFSwRkbWWis3qLGxjEFAPD0S8Ey4cJ9kZ6IFpwVxW
 NpYOQ21jgtb+reEkvGLMjDX8MacbJuKgXwlIXZZl7WfZqAt8cTcZYCTqxmXyVjUYgLO8
 bvoQ==
X-Gm-Message-State: AOAM531L3UwurZHwVppK7vRsaHfwOTu8PPVPaL93hnxf2IY0V0t4y9gv
 D2qZx90O/rit2bIQrUElUA5ptQ==
X-Google-Smtp-Source: ABdhPJzMl8nmR4XPE+WvVlhkVejfP10/DTXlMv+OYk2eoh4EJnIx34IOeRbm6UZX8du9aF9soqjNgQ==
X-Received: by 2002:adf:fc43:: with SMTP id e3mr2746747wrs.28.1599144268324;
 Thu, 03 Sep 2020 07:44:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o2sm5369091wrh.70.2020.09.03.07.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 07:44:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/mps2: New board model mps2-386
Date: Thu,  3 Sep 2020 15:44:25 +0100
Message-Id: <20200903144425.11060-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement a model of the MPS2 with the AN386 firmware. This is
essentially identical to the AN385 firmware, but it has a
Cortex-M4 rather than a Cortex-M3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 9f12934ca8f..559b297e788 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -15,6 +15,7 @@
  * as seen by the guest depend significantly on the FPGA image.
  * We model the following FPGA images:
  *  "mps2-an385" -- Cortex-M3 as documented in ARM Application Note AN385
+ *  "mps2-an386" -- Cortex-M4 as documented in ARM Application Note AN386
  *  "mps2-an511" -- Cortex-M3 'DesignStart' as documented in AN511
  *
  * Links to the TRM for the board itself and to the various Application
@@ -47,6 +48,7 @@
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
+    FPGA_AN386,
     FPGA_AN511,
 } MPS2FPGAType;
 
@@ -79,6 +81,7 @@ typedef struct {
 
 #define TYPE_MPS2_MACHINE "mps2"
 #define TYPE_MPS2_AN385_MACHINE MACHINE_TYPE_NAME("mps2-an385")
+#define TYPE_MPS2_AN386_MACHINE MACHINE_TYPE_NAME("mps2-an386")
 #define TYPE_MPS2_AN511_MACHINE MACHINE_TYPE_NAME("mps2-an511")
 
 #define MPS2_MACHINE(obj)                                       \
@@ -142,7 +145,7 @@ static void mps2_common_init(MachineState *machine)
      *
      * Common to both boards:
      *  0x21000000..0x21ffffff : PSRAM (16MB)
-     * AN385 only:
+     * AN385/AN386 only:
      *  0x00000000 .. 0x003fffff : ZBT SSRAM1
      *  0x00400000 .. 0x007fffff : mirror of ZBT SSRAM1
      *  0x20000000 .. 0x203fffff : ZBT SSRAM 2&3
@@ -157,7 +160,7 @@ static void mps2_common_init(MachineState *machine)
      *  0x20000000 .. 0x2001ffff : SRAM
      *  0x20400000 .. 0x207fffff : ZBT SSRAM 2&3
      *
-     * The AN385 has a feature where the lowest 16K can be mapped
+     * The AN385/AN386 has a feature where the lowest 16K can be mapped
      * either to the bottom of the ZBT SSRAM1 or to the block RAM.
      * This is of no use for QEMU so we don't implement it (as if
      * zbt_boot_ctrl is always zero).
@@ -166,6 +169,7 @@ static void mps2_common_init(MachineState *machine)
 
     switch (mmc->fpga_type) {
     case FPGA_AN385:
+    case FPGA_AN386:
         make_ram(&mms->ssram1, "mps.ssram1", 0x0, 0x400000);
         make_ram_alias(&mms->ssram1_m, "mps.ssram1_m", &mms->ssram1, 0x400000);
         make_ram(&mms->ssram23, "mps.ssram23", 0x20000000, 0x400000);
@@ -193,6 +197,7 @@ static void mps2_common_init(MachineState *machine)
     armv7m = DEVICE(&mms->armv7m);
     switch (mmc->fpga_type) {
     case FPGA_AN385:
+    case FPGA_AN386:
         qdev_prop_set_uint32(armv7m, "num-irq", 32);
         break;
     case FPGA_AN511:
@@ -229,6 +234,7 @@ static void mps2_common_init(MachineState *machine)
 
     switch (mmc->fpga_type) {
     case FPGA_AN385:
+    case FPGA_AN386:
     {
         /* The overflow IRQs for UARTs 0, 1 and 2 are ORed together.
          * Overflow for UARTs 4 and 5 doesn't trigger any interrupt.
@@ -380,7 +386,7 @@ static void mps2_common_init(MachineState *machine)
      */
     lan9118_init(&nd_table[0], 0x40200000,
                  qdev_get_gpio_in(armv7m,
-                                  mmc->fpga_type == FPGA_AN385 ? 13 : 47));
+                                  mmc->fpga_type == FPGA_AN511 ? 47 : 13));
 
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
@@ -409,6 +415,17 @@ static void mps2_an385_class_init(ObjectClass *oc, void *data)
     mmc->scc_id = 0x41043850;
 }
 
+static void mps2_an386_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM MPS2 with AN386 FPGA image for Cortex-M4";
+    mmc->fpga_type = FPGA_AN386;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    mmc->scc_id = 0x41043860;
+}
+
 static void mps2_an511_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -435,6 +452,12 @@ static const TypeInfo mps2_an385_info = {
     .class_init = mps2_an385_class_init,
 };
 
+static const TypeInfo mps2_an386_info = {
+    .name = TYPE_MPS2_AN386_MACHINE,
+    .parent = TYPE_MPS2_MACHINE,
+    .class_init = mps2_an386_class_init,
+};
+
 static const TypeInfo mps2_an511_info = {
     .name = TYPE_MPS2_AN511_MACHINE,
     .parent = TYPE_MPS2_MACHINE,
@@ -445,6 +468,7 @@ static void mps2_machine_init(void)
 {
     type_register_static(&mps2_info);
     type_register_static(&mps2_an385_info);
+    type_register_static(&mps2_an386_info);
     type_register_static(&mps2_an511_info);
 }
 
-- 
2.20.1


