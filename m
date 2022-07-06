Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600856932A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:17:12 +0200 (CEST)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BSR-0004Gn-IC
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLZ-0000M7-VT; Wed, 06 Jul 2022 16:10:06 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:43669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLY-0003I9-CB; Wed, 06 Jul 2022 16:10:05 -0400
Received: by mail-ua1-x92b.google.com with SMTP id x31so880534uaf.10;
 Wed, 06 Jul 2022 13:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQPprON4ruMmhY7Drd2HzoyZ79WDBdIstKIDho3lfE0=;
 b=cnkJCTyyamZSUHuEX75UZZdGiVv2v6UHxpd5jwXjQg38J+eirjk8XVcg/fSzAriBqF
 a0yppBCQNPrAmFaqiOuZQaHLdIa6Iu9OvXNzyX/okCshmLO6ceuOkDGMr0o2n7SprUuT
 D5rrpFClwibJxE8TLJyVUp5ba4kTYiw72GXyXGlNuggKi9XlMW4p8+WcutLeDFF3YAOu
 Iny/twqcqme5CjhvEayz5Xiz4NS7evYKaUdh/Wkh2yzoH5GJQetMxqd5uOeb2JqclIj0
 A7H1/Bc9bsCPQMn+gkyBkRj5VzbdVQVr6tFfURrW+FMRXKWWL09rWBk1wwX98XoRi+Ci
 mbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQPprON4ruMmhY7Drd2HzoyZ79WDBdIstKIDho3lfE0=;
 b=bT4lmJSKqByztMgG/Lwq0rdpJTYhg6hmjTdxaj1OeFdBVuR6CIiMEDgRC6iRiLzrwI
 7UDReg2RGrvll07EDX16DQz11njgFpd+u3bkrURJo1VcuplM2yAym14D+zEnqk1BWZVw
 Odk33pCtV1zU0AP03/dYMowBOEMgnKIFllxDsNkcSknPIOliG9p7MaNzLxarfPEgV7KK
 aDL+urJXDpSD1SJ0/kqNpbuPinXPmE3sdCXhMbMdTUZP7yaeO4wWeAcLm9/bK+RUfdLi
 1qOj5IdMLsQSwt/iZyy6P0svYhQw+rSizKVUiqzYMPRrpxZgmwLVFjjddf6A7GyyR0+z
 Zg8Q==
X-Gm-Message-State: AJIora+9AK95jgpij2BRmq+LpH0GXTBtDZtJ8csT69QIfCnahoz9xFK/
 OSBOOumhS9scA0T+9Y3rVMBacyEwueo=
X-Google-Smtp-Source: AGRyM1vgE4w1foVNY4cxYZf2T75LJHsI3pDxE1sHXuMlf5MVCv2PFTmAtiH/qvIAk3JEGfq/Hk64Jw==
X-Received: by 2002:ab0:7341:0:b0:382:30b9:be20 with SMTP id
 k1-20020ab07341000000b0038230b9be20mr14095292uap.95.1657138202885; 
 Wed, 06 Jul 2022 13:10:02 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 06/34] ppc/pnv: make pnv_chip_power8_pic_print_info() use
 chip8->phbs[]
Date: Wed,  6 Jul 2022 17:09:18 -0300
Message-Id: <20220706200946.471114-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It's inneficient to scroll all child objects when we have all PHBs
available in chip8->phbs[].

pnv_chip_power8_pic_print_info_child() ended up folded into
pic_print_info() for simplicity.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220621173436.165912-7-danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 74a6c88dd2..d3f77c8367 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -652,25 +652,19 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
     return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
 }
 
-static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
-{
-    Monitor *mon = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
-
-    if (phb3) {
-        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
-        ics_pic_print_info(&phb3->lsis, mon);
-    }
-    return 0;
-}
-
 static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv8Chip *chip8 = PNV8_CHIP(chip);
+    int i;
 
     ics_pic_print_info(&chip8->psi.ics, mon);
-    object_child_foreach(OBJECT(chip),
-                         pnv_chip_power8_pic_print_info_child, mon);
+
+    for (i = 0; i < chip8->num_phbs; i++) {
+        PnvPHB3 *phb3 = &chip8->phbs[i];
+
+        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
+        ics_pic_print_info(&phb3->lsis, mon);
+    }
 }
 
 static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
-- 
2.36.1


