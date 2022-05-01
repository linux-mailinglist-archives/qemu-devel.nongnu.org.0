Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D516516227
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:16:30 +0200 (CEST)
Received: from localhost ([::1]:45642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2sf-00047W-Dk
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tr-0006tO-UJ
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2To-0001Ib-6E
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id n8so10288409plh.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOb3rzseCiR8Xy7i8OaLSJuA44LGmp0qA1p0J8E5viY=;
 b=KoNsez0QrTAorjU71pNnpYh8w4Cw+zyHW5aOJxqQiqrx0yIIWiIPJHa9fWUGfrOiPu
 AKu+8r0doEdpeG8tQTOfknfBeIEnfSIBU/edvb+yR6yYj0tq/9H8IbE9rD/W93VpXoS/
 HRI4Lfm9wZ9yIX+IGkvtZxHEpCZrET7kgTDZj89k3OYxBxwdtUV+3Qa61/dRv/W8fbBI
 ogl0Tmo6kzbt6kO7UJ5WRuecuAZ8VwcaHz1PqcgZCnH6gMvS0lBGOv8NWr1Tiw0Wa9Iq
 WfU04Jvu8oqezGaz8HDMu0ss0AgxCDVAcZ++DZsR/6uOnrgG39E2SWpu2fwiauIlHG/L
 9klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOb3rzseCiR8Xy7i8OaLSJuA44LGmp0qA1p0J8E5viY=;
 b=GrHdebP4mOEFoqz7Q9VE4SjGIG3e/IujDSbrQ/ye66FrWB5CRhCFgbWOyrkueD0Dmw
 KzvxAR/UqwDYA+Fr/kUV2PBwMgB52BTbsB0yDYPI/VGfDX913YfL2TFiiErWSUZbkbnv
 vtsinpu36Zki+wpyO4Y32Mhp/P5lRh33qYpWjmQNMv34MlKxTkMyoSw7bn1iyyGUK0fr
 Ss827WKLKFNV9PTBsvkTBRXvZsqotyw6LekE571cZrjYeggU2EgkmsKXPv6xhK3CkPB4
 cGZFuzAFzkleVYWpsaP0N8XL/MID600INhahwUnOvBRltpX377yBbHn+Prvml+3b3PK1
 v5Cw==
X-Gm-Message-State: AOAM533SaJrlwiYEOOgRNFcVelJNb+YpSd1QYy3t6y+MO3f1U5rukVPp
 fVQA13RPBFt5WrV59jtrEkdvgx+aqA4DOQ==
X-Google-Smtp-Source: ABdhPJwMV8HkW7mc1NGsTc04Q5d1ltmA6hzqOt4qp7rA2V4Nkw/LqIRU6Hfy1UH9vXIBBuC6OgvxMg==
X-Received: by 2002:a17:902:a613:b0:156:b53d:c137 with SMTP id
 u19-20020a170902a61300b00156b53dc137mr6284992plq.73.1651384246904; 
 Sat, 30 Apr 2022 22:50:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/45] target/arm: Reformat comments in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:50:00 -0700
Message-Id: <20220501055028.646596-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put the block comments into the current coding style.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2ed07795d8..b690346469 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8496,15 +8496,16 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
+/*
+ * Private utility function for define_one_arm_cp_reg_with_opaque():
+ * add a single reginfo struct to the hash table.
+ */
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    void *opaque, CPState state,
                                    CPSecureState secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
-    /* Private utility function for define_one_arm_cp_reg_with_opaque():
-     * add a single reginfo struct to the hash table.
-     */
     uint32_t key;
     ARMCPRegInfo *r2;
     bool is64 = r->type & ARM_CP_64BIT;
@@ -8568,7 +8569,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 
     isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
     if (isbanked) {
-        /* Register is banked (using both entries in array).
+        /*
+         * Register is banked (using both entries in array).
          * Overwriting fieldoffset as the array is only used to define
          * banked registers but later only fieldoffset is used.
          */
@@ -8577,7 +8579,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 
     if (state == ARM_CP_STATE_AA32) {
         if (isbanked) {
-            /* If the register is banked then we don't need to migrate or
+            /*
+             * If the register is banked then we don't need to migrate or
              * reset the 32-bit instance in certain cases:
              *
              * 1) If the register has both 32-bit and 64-bit instances then we
@@ -8592,8 +8595,9 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                 r2->type |= ARM_CP_ALIAS;
             }
         } else if ((secstate != r->secure) && !ns) {
-            /* The register is not banked so we only want to allow migration of
-             * the non-secure instance.
+            /*
+             * The register is not banked so we only want to allow migration
+             * of the non-secure instance.
              */
             r2->type |= ARM_CP_ALIAS;
         }
@@ -8607,7 +8611,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
     }
 
-    /* By convention, for wildcarded registers only the first
+    /*
+     * By convention, for wildcarded registers only the first
      * entry is used for migration; the others are marked as
      * ALIAS so we don't try to transfer the register
      * multiple times. Special registers (ie NOP/WFI) are
@@ -8622,7 +8627,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
     }
 
-    /* Check that raw accesses are either forbidden or handled. Note that
+    /*
+     * Check that raw accesses are either forbidden or handled. Note that
      * we can't assert this earlier because the setup of fieldoffset for
      * banked registers has to be done first.
      */
-- 
2.34.1


