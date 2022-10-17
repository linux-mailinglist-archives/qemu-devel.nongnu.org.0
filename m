Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17606017CC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:17 +0200 (CEST)
Received: from localhost ([::1]:41658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVwG-0007m6-EW
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfO-00028z-M3; Mon, 17 Oct 2022 15:20:50 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfL-0002uR-UT; Mon, 17 Oct 2022 15:20:50 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 r8-20020a056830120800b00661a0a236efso6371166otp.4; 
 Mon, 17 Oct 2022 12:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqrdr9BOGVpedwpdYOszalWevWwEVzPyFVb5k5s3bc8=;
 b=IqIwFzr+NTVSvdRaT8PnpX7xGlGr9xLy6/LlNJfVVMwrT9b4Qg8PxRbphaszSU421W
 /sACH5w4A1d9du0/SC7Zd4ro6dicv2QaU6MlIFOhfd8+/oVZ0Cjloen59TZykCQg2KD8
 y9QWSPDzNaO0lE9ToIjzSbhY9VWpbHl+pkdHugO6JRgmiTvJcKqpGYH0y8Q4XAwze/rO
 UEHUbjSPup26Tx/CKmS0IUnXTvrIq88tXhQ5Fc6Ty7TGXF7xUxrM5Y12LYXJVQ+zLyVh
 Et3mn/6oVPTP2G/VoMoN+uwBV3xFsr2y7XbVNXk+YjmWMgx5eOhZg0sNVAy0RcngdAUj
 ApKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqrdr9BOGVpedwpdYOszalWevWwEVzPyFVb5k5s3bc8=;
 b=tZm7Xn6nY+YQSWYLnBFw0Wvbkw4vRmUx4RS8JCC7Z53D/OdI60hQpbR498vPTlJ/Lr
 T3XQrsmLQWzGTaBYmny/41yYErhbhnfIk+X2zQxibLproatg5qbadOdG1HrxUROgJ6ar
 FnVLT0ILyaz5cdwLKCcFpMDKxH7HKkQoacsBDg/OQ8sQfP1CJD0E97c6MgGEicaAb9dT
 pJdY0aghk1zKLjyfBjG+mjkytrkodt9w4xVnee9BFVf8ifVqcoRBjO3AfFA32DDkJa3R
 dBjyLkKy9Esk/D08Md0vahtrhcgiBq+lNx0zwmSdtuvkgtp6cJDEcQ2GEv5dZZ+gDAM0
 zG6Q==
X-Gm-Message-State: ACrzQf3BeUVm3XwORZiNRuSIeBYe/X76KYlO7xgpYMWzG5Tne5sOTZKz
 fNym/vsIVfPiBMKRg5/5h0DNy/V3PnY=
X-Google-Smtp-Source: AMsMyM74xFHcvt/qlj9zCblijCTOApZFE2NEF/p9Kloji1A3F3x02Vw2Y8EaKwaaUXQTqsyjQd0AyQ==
X-Received: by 2002:a05:6830:698d:b0:660:d8a3:c484 with SMTP id
 cy13-20020a056830698d00b00660d8a3c484mr5633462otb.342.1666034445554; 
 Mon, 17 Oct 2022 12:20:45 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 11/38] ppc440_sdram: Split off map/unmap of sdram banks for
 later reuse
Date: Mon, 17 Oct 2022 16:19:42 -0300
Message-Id: <20221017192009.92404-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <23560b6a71682d513f3dd8e9ed3852f51d5eb309.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 8eae4ad9f0..900b7ab998 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -23,6 +23,7 @@
 #include "sysemu/reset.h"
 #include "ppc440.h"
 #include "qom/object.h"
+#include "trace.h"
 
 /*****************************************************************************/
 /* L2 Cache as SRAM */
@@ -563,26 +564,34 @@ static uint64_t sdram_size(uint32_t bcr)
     return size;
 }
 
+static void sdram_bank_map(Ppc4xxSdramBank *bank)
+{
+    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
+    memory_region_add_subregion(&bank->container, 0, &bank->ram);
+    memory_region_add_subregion(get_system_memory(), bank->base,
+                                &bank->container);
+}
+
+static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
+{
+    memory_region_del_subregion(get_system_memory(), &bank->container);
+    memory_region_del_subregion(&bank->container, &bank->ram);
+    object_unparent(OBJECT(&bank->container));
+}
+
 static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
                           uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
         /* First unmap RAM if enabled */
-        memory_region_del_subregion(get_system_memory(),
-                                    &sdram->bank[i].container);
-        memory_region_del_subregion(&sdram->bank[i].container,
-                                    &sdram->bank[i].ram);
-        object_unparent(OBJECT(&sdram->bank[i].container));
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
+                                 sdram_size(sdram->bank[i].bcr));
+        sdram_bank_unmap(&sdram->bank[i]);
     }
     sdram->bank[i].bcr = bcr & 0xffe0ffc1;
     if (enabled && (bcr & 1)) {
-        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
-                           sdram_size(bcr));
-        memory_region_add_subregion(&sdram->bank[i].container, 0,
-                                    &sdram->bank[i].ram);
-        memory_region_add_subregion(get_system_memory(),
-                                    sdram_base(bcr),
-                                    &sdram->bank[i].container);
+        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
+        sdram_bank_map(&sdram->bank[i]);
     }
 }
 
-- 
2.37.3


