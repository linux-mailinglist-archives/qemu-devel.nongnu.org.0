Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D7941D2EE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:56:33 +0200 (CEST)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVp3W-0000cQ-Pt
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos6-0000xh-8o; Thu, 30 Sep 2021 01:44:42 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos4-0003R0-Lp; Thu, 30 Sep 2021 01:44:42 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR0g6Qz4xbQ; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=2p30RpvvRdORiiZEMhXoxFuuS3myQ6w/elWyJ7r4SNw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GxFSuHpwzh4bnOEqWH1K45oIQ739sYdrrsZEXnMHyCImbIR48zss/mFA/sD9nqIun
 UHiBndnUw02cn8e3g4FZuGWxlKqmv+i5qi2Tchat2TkXCwlVd4zhO7Xj9J8cdmlCPF
 v87pk0dQc0ws8hgWolrZ5nDDJzNhax6sZphXIYjQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 07/44] ppc/pnv: Remove useless variable
Date: Thu, 30 Sep 2021 15:43:49 +1000
Message-Id: <20210930054426.357344-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210901094153.227671-5-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 2f5358b70c..a62e90b15e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -838,8 +838,7 @@ static void pnv_init(MachineState *machine)
     for (i = 0; i < pnv->num_chips; i++) {
         char chip_name[32];
         Object *chip = OBJECT(qdev_new(chip_typename));
-        int chip_id = i;
-        uint64_t chip_ram_size =  pnv_chip_get_ram_size(pnv, chip_id);
+        uint64_t chip_ram_size =  pnv_chip_get_ram_size(pnv, i);
 
         pnv->chips[i] = PNV_CHIP(chip);
 
@@ -850,9 +849,9 @@ static void pnv_init(MachineState *machine)
                                 &error_fatal);
         chip_ram_start += chip_ram_size;
 
-        snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
+        snprintf(chip_name, sizeof(chip_name), "chip[%d]", i);
         object_property_add_child(OBJECT(pnv), chip_name, chip);
-        object_property_set_int(chip, "chip-id", chip_id, &error_fatal);
+        object_property_set_int(chip, "chip-id", i, &error_fatal);
         object_property_set_int(chip, "nr-cores", machine->smp.cores,
                                 &error_fatal);
         object_property_set_int(chip, "nr-threads", machine->smp.threads,
-- 
2.31.1


