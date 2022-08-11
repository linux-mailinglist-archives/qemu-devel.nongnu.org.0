Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1187A59041B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:47:07 +0200 (CEST)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBKq-0003Af-CJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE9-0001R5-4p; Thu, 11 Aug 2022 12:40:09 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:40870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE7-0003hW-GN; Thu, 11 Aug 2022 12:40:08 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id q190so18805042vsb.7;
 Thu, 11 Aug 2022 09:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4cfFz2XWiAFNQBq445irCbDNDgx/FwlfPFuFqcdoxR8=;
 b=oVqAZb/j0TMdDnqz9kRemNlexZeNlG9CwZgb6gBx/78a5Gv1lL82qUCdr3mZ5i4otA
 e/iDUJBC3nEPkStRQ0gg13rhQ4tNnBWBH9mDL1uRuWTKK47z6SVWzZY9blGOP1cDTr5z
 Qvb2sOBR1k9zGRekZ+qaJqP6eVgvbZiqjf2JkFj7ZfzpVclfqBB59u/UzdT75/UEktUS
 HIe4/g6dPEp4TzkSH6mmX8KLzxv6eEw5BWo40vhrjx7n1e90kUZofdsKK7bgP75EOwZ3
 vcVlv61wD+/ynfNI7rN+Z9RN1fwOeOFpWQ9oatkHKNosEal8XGZsQLIUWlj5DP/ZuErD
 x+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4cfFz2XWiAFNQBq445irCbDNDgx/FwlfPFuFqcdoxR8=;
 b=Di/rN519mCttxra9m1MIZ7Tcfrir/ZFw4FB9pGS39rfZ0pvwnc7FX+gydyknLiCvIU
 5OPCAC4Zy9xcy24wqftI62yH3zK8qCkdJg9veu+p3QU6VESA1z7YuKaB7Wv+onue2pF0
 pE+yrgZx/94SPJ2nth4Rj64hXv79YlsASB2Sgy4HaLAsITAjLBNW0BDlVYr67HvxeNWr
 7Em6kviaJFSEZO0GOot1nnHlu6/1Ii4RaB/HsUicVGjiTmL6CnqzbOYYGYRuIUQT2L9T
 boYJNGe3gJ69xPUHNPYGylOdCWv4RU1/TmwfXHSNZFe54ysuFQqP9Tk2mlNEVFGD22Tc
 gehg==
X-Gm-Message-State: ACgBeo2s1/IT5OXIEqj7ixfm+xleOBpF/MEgixeyxKjIyhbvy5Mp/s26
 jQTYlIhPmCzd2JpjqlR/FZNDYMokLeY=
X-Google-Smtp-Source: AA6agR5hIfBDoDBYqDGrCW2v40GDWG4elO3kvZTAf75lKlJ/7vTefjSYBhuFAjx1wlkyH9ERMuBsPA==
X-Received: by 2002:a67:a449:0:b0:357:3407:9f60 with SMTP id
 p9-20020a67a449000000b0035734079f60mr14890613vsh.17.1660236006126; 
 Thu, 11 Aug 2022 09:40:06 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 05/11] ppc/pnv: turn chip8->phbs[] into a PnvPHB*
 array
Date: Thu, 11 Aug 2022 13:39:44 -0300
Message-Id: <20220811163950.578927-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
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

When enabling user created PHBs (a change reverted by commit 9c10d86fee)
we were handling PHBs created by default versus by the user in different
manners. The only difference between these PHBs is that one will have a
valid phb3->chip that is assigned during pnv_chip_power8_realize(),
while the user created needs to search which chip it belongs to.

Aside from that there shouldn't be any difference. Making the default
PHBs behave in line with the user created ones will make it easier to
re-introduce them later on. It will also make the code easier to follow
since we are dealing with them in equal manner.

The first step is to turn chip8->phbs[] into a PnvPHB3 pointer array.
This will allow us to assign user created PHBs into it later on. The way
we initilize the default case is now more in line with that would happen
with the user created case: the object is created, parented by the chip
because pnv_xscom_dt() relies on it, and then assigned to the array.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c         | 27 ++++++++++++++++++++++-----
 include/hw/ppc/pnv.h |  6 +++++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 2deaac17f7..e53e9e297d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -294,6 +294,13 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
 Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
 {
     if (phb->version == 3) {
+        Pnv8Chip *chip8 = PNV8_CHIP(chip);
+
+        phb->chip = chip;
+
+        chip8->phbs[chip8->num_phbs] = phb;
+        chip8->num_phbs++;
+
         return OBJECT(chip);
     } else {
         /* phb4 support will be added later */
@@ -681,7 +688,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
     ics_pic_print_info(&chip8->psi.ics, mon);
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB *phb = chip8->phbs[i];
         PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
         pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
@@ -1174,7 +1181,17 @@ static void pnv_chip_power8_instance_init(Object *obj)
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
+        Object *phb = object_new(TYPE_PNV_PHB);
+
+        /*
+         * We need the chip to parent the PHB to allow the DT
+         * to build correctly (via pnv_xscom_dt()).
+         *
+         * TODO: the PHB should be parented by a PEC device that, at
+         * this moment, is not modelled powernv8/phb3.
+         */
+        object_property_add_child(obj, "phb[*]", phb);
+        chip8->phbs[i] = PNV_PHB(phb);
     }
 
 }
@@ -1290,7 +1307,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 
     /* PHB controllers */
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB *phb = chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1958,7 +1975,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
         }
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB *phb = chip8->phbs[j];
             PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             if (ics_valid_irq(&phb3->lsis, irq)) {
@@ -1997,7 +2014,7 @@ static void pnv_ics_resend(XICSFabric *xi)
         ics_resend(&chip8->psi.ics);
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB *phb = chip8->phbs[j];
             PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             ics_resend(&phb3->lsis);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 781d0acffa..49433281d7 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -81,7 +81,11 @@ struct Pnv8Chip {
     PnvHomer     homer;
 
 #define PNV8_CHIP_PHB3_MAX 4
-    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
+    /*
+     * The array is used to allow quick access to the phbs by
+     * pnv_ics_get_child() and pnv_ics_resend_child().
+     */
+    PnvPHB       *phbs[PNV8_CHIP_PHB3_MAX];
     uint32_t     num_phbs;
 
     XICSFabric    *xics;
-- 
2.36.1


