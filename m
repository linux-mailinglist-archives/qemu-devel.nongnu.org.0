Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2C20BD51
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 02:00:42 +0200 (CEST)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joyGv-0006w2-G0
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 20:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CYv2XgsKCvYfqigllckmclemmejc.amkocks-bctcjlmlels.mpe@flex--hskinnemoen.bounces.google.com>)
 id 1joyCL-0007px-Bn
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 19:55:57 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:33573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CYv2XgsKCvYfqigllckmclemmejc.amkocks-bctcjlmlels.mpe@flex--hskinnemoen.bounces.google.com>)
 id 1joyCJ-00028c-BU
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 19:55:57 -0400
Received: by mail-pf1-x449.google.com with SMTP id f132so7261013pfa.0
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 16:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=22toBuaFKcdBVJjCoNCm9G0xXsHPCmVoRDgitxAcN7s=;
 b=LsxrmtNrB6swa6LGBlAXBZos6QOd4+FzUD8FuVSkATXBAzZQ9T9aqhXsHwVC/BHOtE
 0X+2Sfu7970DDdjWR1rcp8rjGGa1c1ro8iI9n+sRrHHb3j6Q3CpWy1/ABy9nNgyYMUmH
 pPoCoM1cajA08LYqAEtBgxW+n3cuuIiLnIFk4MEepWDEyBryxhewZF+OdsJhCjJvfWna
 oENX1KU9ntjk+XWO3jL4vTTOnP9Mt9DKLPh6tsmbsC9h2zcki3RVH34w/8RfBfGDtLtS
 qJhnx+CO4miOG11dmmT442GnBNbvm+MglHfJ9JUUyB9bSz/HuEHo7OU4Nib7p2c8VeK6
 2G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=22toBuaFKcdBVJjCoNCm9G0xXsHPCmVoRDgitxAcN7s=;
 b=ZBJ2pFBTn7gyzp1Qdqn6bR7Xc1PjAk6YJS1Em3+J1SuhhUiwZ/c2KwocdZV6CHNjhd
 WaSEecZi775LVMC8eVq5TIaUmp2j8NyzSG4CbbOGXXq2WZix7JWjNZJj/W536Z7xDdVl
 7hSgqXR6X2I58HILN7YAArHFVLUm8Hq+X86blIIK5wVF7xb/wUrPRUqIbAVWjPc/5EFH
 /uf0KuozVSs6vE2O/9w5KGOmJQ5lB4/55fKTyF6EFWB8cVTARejSvyehdafXw1zaIeTP
 yqZGlvQs+xyLknVnKQRSUyZ89HtD0FXYRtoLbvBB/To4aGaqqqxoLvlHB404d8eujt5+
 LoNw==
X-Gm-Message-State: AOAM532kkQCZ0fZF1Rp/HxKRjVI/K6cyl/MVBBEGskGYfZftXlTIsiUt
 Ms9De/iJsTFtOOtucL7xYuq5DhEISi9wsB86Ww==
X-Google-Smtp-Source: ABdhPJywvb/R0LXT0ZcXJUTbNzsWUZdwgY4BpQrKwDFb1YtqBaJZBX8dN7MybA2v68h6AEfMPx6oTHD00xo9886eWg==
X-Received: by 2002:a17:902:fe90:: with SMTP id
 x16mr3409128plm.307.1593215753305; 
 Fri, 26 Jun 2020 16:55:53 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:14 -0700
In-Reply-To: <20200626235519.591734-1-hskinnemoen@google.com>
Message-Id: <20200626235519.591734-8-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3 07/12] hw/arm: Load -bios image as a boot ROM for npcm7xx
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3CYv2XgsKCvYfqigllckmclemmejc.amkocks-bctcjlmlels.mpe@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a -bios option is specified on the command line, load the image into
the internal ROM memory region, which contains the first instructions
run by the CPU after reset.

A minimal Apache-2.0-licensed boot ROM can be found at

https://github.com/google/vbootrom

It is by no means feature complete, but it is enough to launch the
Nuvoton bootblock[1] from offset 0 in the flash, which in turn will
launch u-boot and finally the Linux kernel.

[1] https://github.com/Nuvoton-Israel/bootblock

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index c82d9e018b..ca33262a59 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,8 +18,11 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/loader.h"
 #include "qapi/error.h"
+#include "qemu-common.h"
 #include "qemu/units.h"
+#include "sysemu/sysemu.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
@@ -33,6 +36,25 @@ static struct arm_boot_info npcm7xx_binfo = {
     .board_id           = -1,
 };
 
+static void npcm7xx_load_bootrom(NPCM7xxState *soc)
+{
+    if (bios_name) {
+        g_autofree char *filename = NULL;
+        int ret;
+
+        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        if (!filename) {
+            error_report("Could not find ROM image '%s'", bios_name);
+            exit(1);
+        }
+        ret = load_image_mr(filename, &soc->irom);
+        if (ret < 0) {
+            error_report("Failed to load ROM image '%s'", filename);
+            exit(1);
+        }
+    }
+}
+
 static void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
 {
     NPCM7xxClass *sc = NPCM7XX_GET_CLASS(soc);
@@ -65,7 +87,7 @@ static void npcm750_evb_init(MachineState *machine)
     NPCM7xxState *soc;
 
     soc = npcm7xx_create_soc(machine, NPCM750_EVB_POWER_ON_STRAPS);
-
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
@@ -74,7 +96,7 @@ static void quanta_gsj_init(MachineState *machine)
     NPCM7xxState *soc;
 
     soc = npcm7xx_create_soc(machine, QUANTA_GSJ_POWER_ON_STRAPS);
-
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.27.0.212.ge8ba1cc988-goog


