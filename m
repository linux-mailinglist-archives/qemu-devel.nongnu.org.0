Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFF58EA59
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:12:52 +0200 (CEST)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLihn-0004hq-Eu
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibF-0006qp-QO; Wed, 10 Aug 2022 06:06:10 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibD-0000v4-SR; Wed, 10 Aug 2022 06:06:05 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id 129so14584031vsq.8;
 Wed, 10 Aug 2022 03:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ka9clBzBNCBG6/NCtFaKpDHEGzLyxl2U70eTva2upAU=;
 b=LXaRaKEGQ6AfNic9xeUNbKbsy42qqVxvHDvpSfUzEpIGUkZVgLKM7xM96q0ws9yqLp
 JJMTCSqfCtRqziryjAMblEw1E2Oay3eZSZABroAgv213pCfeZuDMiEsU2z4yoWJnmP84
 46GsxHYHefPieLyjeR5qzLB2+Udfjqus9bBd2nWv7HoBIn2JgtwsSD+RNsj8HcUmLE/C
 68YWp6F/dEeG9WNSRnY8I/utdAhbOlwtml0yFKT6roCEPwUAYmjLjiJvdKY2SCI5edeJ
 5/BWyzzsbDD+2DMIEnOFdtRa/kpqai7QNsN2Lm13ixl0o0rZLJsUoOjvQglc983xgM1G
 1eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ka9clBzBNCBG6/NCtFaKpDHEGzLyxl2U70eTva2upAU=;
 b=hUD4pCJeGdbCAcN5pIksQ5PbFFbEg6nyFeOgnCxTolUfd1kGwLJYCX89X7h+jbTVSK
 SBIpR7FwUSYT74DPysu0E2CNChsLrxxPuwpAAVC/iarG41atzmWbrKAuOkywKTd9BhfH
 1RyF5n73MMV1qLma3GShvjl6s+Qqf2PA5MX6we1jGGwHWCEUt0Es6Gjr0lV6kQXNABsP
 zGtBlp7kqdoEth3J9xJ3RCTNOEKzZaTtwrgoCJmZK9mb3pn5rRSShYVgjVSXlKPSBEj2
 dxg/FkIRi6wsBvEubBm+xlIga1VKadMREdo/wxwcVLY9l3Q2d3kw7370LNg2+DiJo+CD
 o08A==
X-Gm-Message-State: ACgBeo2EHxc2x8UisHvvz+0cie9vLtGfHojlYinEaoEd86Jgjd9GII8R
 HfpD0faRz8Il3W8UPpwfb2uZH0+8HCA=
X-Google-Smtp-Source: AA6agR5tPEF8IjRa61kBrsrb8E18KNHZ7jnubt0RK9XlBtz2V6YNLRZUNwqDWP0ts595G5+z93v0Ww==
X-Received: by 2002:a67:c201:0:b0:386:b3ad:6c2c with SMTP id
 i1-20020a67c201000000b00386b3ad6c2cmr10836069vsj.53.1660125962533; 
 Wed, 10 Aug 2022 03:06:02 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:06:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 09/11] ppc/pnv: change pnv_phb4_get_pec() to also
 retrieve chip10->pecs
Date: Wed, 10 Aug 2022 07:05:34 -0300
Message-Id: <20220810100536.473859-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2c.google.com
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

The function assumes that we're always dealing with a PNV9_CHIP()
object. This is not the case when the pnv-phb device belongs to a
powernv10 machine.

Change pnv_phb4_get_pec() to be able to work with PNV10_CHIP() if
necessary.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index a142b8ff8d..feaef8137f 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -53,17 +53,30 @@ static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
 static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
                                          Error **errp)
 {
-    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    PnvPHB *phb_base = phb->phb_base;
+    PnvPhb4PecState *pecs = NULL;
     int chip_id = phb->chip_id;
     int index = phb->phb_id;
     int i, j;
 
+    if (phb_base->version == 4) {
+        Pnv9Chip *chip9 = PNV9_CHIP(chip);
+
+        pecs = chip9->pecs;
+    } else if (phb_base->version == 5) {
+        Pnv10Chip *chip10 = PNV10_CHIP(chip);
+
+        pecs = chip10->pecs;
+    } else {
+        return NULL;
+    }
+
     for (i = 0; i < chip->num_pecs; i++) {
         /*
          * For each PEC, check the amount of phbs it supports
          * and see if the given phb4 index matches an index.
          */
-        PnvPhb4PecState *pec = &chip9->pecs[i];
+        PnvPhb4PecState *pec = &pecs[i];
 
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
-- 
2.36.1


