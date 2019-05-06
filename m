Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1924C14370
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 03:49:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNSl0-00040O-Tk
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 21:49:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sjitindarsingh@gmail.com>) id 1hNSjr-0003eX-Nh
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sjitindarsingh@gmail.com>) id 1hNSjq-0002cb-Po
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:48:19 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sjitindarsingh@gmail.com>)
	id 1hNSjo-0002ab-No; Sun, 05 May 2019 21:48:16 -0400
Received: by mail-pg1-x542.google.com with SMTP id w22so4341022pgi.6;
	Sun, 05 May 2019 18:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Vp/MT/jroWhReVC2u5/9wEFlWAD6qiho+mThlsJtS7w=;
	b=aBVCbuHp2xw9y1zR+sGUlVSciwReihvdl3/9jnNLvfc/fKnYU4u09MQ9tX64BppHvr
	iz2iAE6XLGUOAmRUFZgSj7bn6Hw2eR5BLhPuG7+Chl+0U31DRw7d4sxtjbF2wr2WSPtO
	D/7gfY7pujHw+mt2Ap9rik1wtex9UvBHL3IUNEs2Y1R408f7w/cRRmil1CIjfLY/67Az
	4hS/uJ2b+IDuyLFQlMAxmOhvvuF9uMxuMqQS4NaK/XeiiSbhFDUE8/vzp1iigYEF52Q7
	FUA0haSiVIKlz6qATpO91/Zdb5LAswrbXmlaeUUv7U2maLNsIr0Dxu7oU6FL0bWU+XPY
	RIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vp/MT/jroWhReVC2u5/9wEFlWAD6qiho+mThlsJtS7w=;
	b=PvCWa9rc1Pxroes7SY1mogs/I2gRdRVzGvzDgwXa+7jvJBdBFtRatePqL+SloJrdq5
	ncL0PgXB80pDIts347IkIxw9wObylKcBCv0d29ma+eB4mCWDwQ8kEacasDTmVKRCCy5r
	MoQkIWyO+9XNx1at8AVU6S6TdnFG4OVGLdI77bFZh/gRyNRRurvug0Qo0VLLGJVck3jK
	ySIMEyrEgaFp2ZjL+bmjyjWHXMFzshWsU2XHVCPxe/8vm+jHCP4DSBzbNTGe0Ch8StWU
	HCKF6Zlo6s1IsfdLqvMelbbetwcN508BrspbV3fnx89axBWf9oyMjfmRoVvlKUkoXlkb
	FseQ==
X-Gm-Message-State: APjAAAVouAkFTSpvC2lTVRrxQtboZuSK8lTkhZTpmzyK08uIQp0mAVf2
	QNbKEqHwsYLT9v9TrKHr8/RQc8Nx
X-Google-Smtp-Source: APXvYqwhgZP4B1xq0aQW7/qfS2GT3KIL2ufCDSadPGUo5BtgBXs8MSMCGuZxUn2POXKj89Tat0HjGw==
X-Received: by 2002:a65:4649:: with SMTP id k9mr5386282pgr.239.1557107294649; 
	Sun, 05 May 2019 18:48:14 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
	by smtp.gmail.com with ESMTPSA id
	j5sm10675277pfe.15.2019.05.05.18.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 May 2019 18:48:13 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: qemu-ppc@nongnu.org
Date: Mon,  6 May 2019 11:48:03 +1000
Message-Id: <20190506014803.21299-1-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [QEMU-PPC] [PATCH] target/ppc: Add ibm, purr and ibm,
 spurr device-tree properties
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: paulus@ozlabs.org, qemu-devel@nongnu.org,
	Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ibm,purr and ibm,spurr device tree properties are used to indicate
that the processor implements the Processor Utilisation of Resources
Register (PURR) and Scaled Processor Utilisation of Resources Registers
(SPURR), respectively. Each property has a single value which represents
the level of architecture supported. A value of 1 for ibm,purr means
support for the version of the PURR defined in book 3 in version 2.02 of
the architecture. A value of 1 for ibm,spurr means support for the
version of the SPURR defined in version 2.05 of the architecture.

Add these properties for all processors for which the PURR and SPURR
registers are generated.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 hw/ppc/spapr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2ef3ce4362..8580a8dc67 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -500,7 +500,10 @@ static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
     _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
 
     if (env->spr_cb[SPR_PURR].oea_read) {
-        _FDT((fdt_setprop(fdt, offset, "ibm,purr", NULL, 0)));
+        _FDT((fdt_setprop_cell(fdt, offset, "ibm,purr", 1)));
+    }
+    if (env->spr_cb[SPR_SPURR].oea_read) {
+        _FDT((fdt_setprop_cell(fdt, offset, "ibm,spurr", 1)));
     }
 
     if (ppc_hash64_has(cpu, PPC_HASH64_1TSEG)) {
-- 
2.13.6


