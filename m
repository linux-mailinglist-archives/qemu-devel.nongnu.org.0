Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754EB56935A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:31:36 +0200 (CEST)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BgN-0000Fb-7s
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLY-0000H7-CY; Wed, 06 Jul 2022 16:10:04 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLW-0003H6-Ll; Wed, 06 Jul 2022 16:10:04 -0400
Received: by mail-ua1-x933.google.com with SMTP id r18so4021909uan.4;
 Wed, 06 Jul 2022 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9g3G6Jbl5qAWlkPkZoLVFE94P8Y7NwMQYAHdJBeATnY=;
 b=T1xQZozHXvjnEVAInWVMq3ambRlp+mPXa4WdNEdsfFoY5P53H6GvapDcAxxO0TuA1T
 C85yU/lGX0gpj4WLQuTq063nglElCPFFNUx+QAlm3EEwMCbxlMXwLZzVL6PAI3BlLsel
 yC8p5dGP08igRJjxkgwgczlezNXOXmuBlIwZkX5fz56QDmnjNpVV0/lFj21lezR0i17O
 Eb9FqJMjk8FG1ZpYg0CiBxnHE1jvBku4U9K1RRtkdJk05ajdiumopxHKpus96Uut94If
 i7RlrlqFnT4QJfMis9YiXcV45FJC6jMOnCDfXh0zqieJiiZ0o4PMLjy0JqPpUr5kFMxi
 n+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9g3G6Jbl5qAWlkPkZoLVFE94P8Y7NwMQYAHdJBeATnY=;
 b=QlaRyPjpEhShNnoSYf/qKRmz7AK+okwNub48kXG+j0I0tV+sIlz58W+7A4QX+72YCl
 ThpHYVrlhaAO39K8xUqT5EbljNRKDyO3SE2v2SKkKfSyJ5C4E6yQ4O1bklu1S89sDijh
 MveIERG8UpiIfEIvaqU0/IVEuc6pu7eipLfYKINBWDq/ZbV5W4bihehcjWUUa5B/bMms
 r3Ec6sX5V7+UjjPSvEl5z6ZjX6zU+2f3f107wtOQoqo9mNYpc/QVApOuMaRr3dI8H0Nc
 MW09mdbQ2pdYUpJ8s/fGeU4uJ9Hen1T97dWv4G+jdFNGi1kbp4K7Dsapep741Ira4xOl
 JxNA==
X-Gm-Message-State: AJIora/nT3hDa9AoFBhVdvKTNFo/AsTn07ngRZ3hgDJ+Tsq175FB6LyJ
 /gHiAVdFZ0B9h8DlgON1hu86XqAbwsE=
X-Google-Smtp-Source: AGRyM1sc1gYqFVQ7K0NDnhb91p1Q0lhQbDDyLhedjTA/SbuHJiTtZpz5cn5hJfVTtLf38PY40fo3Vg==
X-Received: by 2002:ab0:7c59:0:b0:382:bd08:64f1 with SMTP id
 d25-20020ab07c59000000b00382bd0864f1mr6679023uaw.24.1657138201055; 
 Wed, 06 Jul 2022 13:10:01 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 05/34] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Date: Wed,  6 Jul 2022 17:09:17 -0300
Message-Id: <20220706200946.471114-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x933.google.com
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

pnv_ics_resend() is scrolling through all the child objects of the chip
to search for the PHBs. It's faster and simpler to just use the phbs[]
array.

pnv_ics_resend_child() was folded into pnv_ics_resend() since it's too
simple to justify its own function.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220621173436.165912-6-danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e6cea789f8..74a6c88dd2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1990,28 +1990,22 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
     return NULL;
 }
 
-static int pnv_ics_resend_child(Object *child, void *opaque)
-{
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
-
-    if (phb3) {
-        ics_resend(&phb3->lsis);
-        ics_resend(ICS(&phb3->msis));
-    }
-    return 0;
-}
-
 static void pnv_ics_resend(XICSFabric *xi)
 {
     PnvMachineState *pnv = PNV_MACHINE(xi);
-    int i;
+    int i, j;
 
     for (i = 0; i < pnv->num_chips; i++) {
-        PnvChip *chip = pnv->chips[i];
         Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
 
         ics_resend(&chip8->psi.ics);
-        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
+
+        for (j = 0; j < chip8->num_phbs; j++) {
+            PnvPHB3 *phb3 = &chip8->phbs[j];
+
+            ics_resend(&phb3->lsis);
+            ics_resend(ICS(&phb3->msis));
+        }
     }
 }
 
-- 
2.36.1


