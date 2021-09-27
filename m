Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B154418E93
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:10:20 +0200 (CEST)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUiuB-0003nn-4P
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYw-0000Iy-L0; Mon, 27 Sep 2021 00:48:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYu-0000Fm-RO; Mon, 27 Sep 2021 00:48:22 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqrq1pFNz4xbf; Mon, 27 Sep 2021 14:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632718091;
 bh=cTr2cucr3Q3BJSNdEL8CESCzhRbP0pEnG6aQevl4jOo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MKw09c5gUYUmkaihdxHcXTbeKicfdZ2phHx4G+YtdiVr4UqQA61ZH+7hX4WIPzOen
 7cEQ64w+yxwQfuq0989F4i8R3Nk7SA9jJkhF/FDSX+2hfqGdxmWBQZpoFGDUtqd6Ad
 O05jrZ2h00QUEjfvau3/zXawT2+XdWqcb7ZsDYt8=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 6/7] MAINTAINERS: Add information for OpenPIC
Date: Mon, 27 Sep 2021 14:48:07 +1000
Message-Id: <20210927044808.73391-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927044808.73391-1-david@gibson.dropbear.id.au>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OpenPIC interrupt controller was once the de facto standard on ppc
machines.  In qemu it's now only used on some Macintosh and the
Freescale e500 machine.  It has no listed maintainer, and as far as I
know, no-one who's really familiar with it any more.

Since I'm moving away from the area, I no longer have capacity to do even
minimal maintenance of it under the auspices of the ppc targets in general.

Therefore, this patch lists the main part of openpic, and marks it as
"Odd Fixes" to be looked after by Mark Cave-Ayland who handles the
Macintosh targets.  The openpic_kvm variant is only used on e500, so
add it to the files for that machine type (itself already Orphaned).

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7439ef1bd9..c0fcba7f8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1256,6 +1256,8 @@ F: hw/pci-host/ppce500.c
 F: include/hw/ppc/ppc_e500.h
 F: include/hw/pci-host/ppce500.h
 F: pc-bios/u-boot.e500
+F: hw/intc/openpic_kvm.h
+F: include/hw/ppc/openpic_kvm.h
 
 mpc8544ds
 L: qemu-ppc@nongnu.org
@@ -2258,6 +2260,12 @@ F: net/can/*
 F: hw/net/can/*
 F: include/net/can_*.h
 
+OpenPIC interrupt controller
+M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+S: Odd Fixes
+F: hw/intc/openpic.c
+F: include/hw/ppc/openpic.h
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.31.1


