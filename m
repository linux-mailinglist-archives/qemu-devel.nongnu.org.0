Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB895EFD39
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:43:14 +0200 (CEST)
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odyV7-0004qS-Ec
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Ak25=2A=kaod.org=clg@ozlabs.org>)
 id 1odxz3-0004rB-Uq; Thu, 29 Sep 2022 14:10:06 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Ak25=2A=kaod.org=clg@ozlabs.org>)
 id 1odxz1-0003w9-5d; Thu, 29 Sep 2022 14:10:05 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MdhGT2hRlz4xGT;
 Fri, 30 Sep 2022 04:09:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdhGR27mqz4x3w;
 Fri, 30 Sep 2022 04:09:51 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] MAINTAINERS: step back from PPC
Date: Thu, 29 Sep 2022 20:09:46 +0200
Message-Id: <20220929180946.848721-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Ak25=2A=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

I am not active anymore on the PPC maintainership, degrade my self as
standard Reviewer. Also degrade PowerNV and XIVE status since I am not
funded for this work.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1729c0901cea..40f4984b439b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -267,8 +267,8 @@ F: hw/openrisc/
 F: tests/tcg/openrisc/
 
 PowerPC TCG CPUs
-M: Cédric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
@@ -392,8 +392,8 @@ F: target/mips/kvm*
 F: target/mips/sysemu/
 
 PPC KVM CPUs
-M: Cédric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 S: Maintained
@@ -1365,8 +1365,8 @@ F: include/hw/rtc/m48t59.h
 F: tests/avocado/ppc_prep_40p.py
 
 sPAPR (pseries)
-M: Cédric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
@@ -1387,7 +1387,7 @@ F: tests/avocado/ppc_pseries.py
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Maintained
+S: Odd Fixes
 F: docs/system/ppc/powernv.rst
 F: hw/ppc/pnv*
 F: hw/intc/pnv*
@@ -2321,7 +2321,7 @@ T: git https://github.com/philmd/qemu.git fw_cfg-next
 XIVE
 M: Cédric Le Goater <clg@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Supported
+S: Odd Fixes
 F: hw/*/*xive*
 F: include/hw/*/*xive*
 F: docs/*/*xive*
-- 
2.37.3


