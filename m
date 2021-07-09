Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBF3C1EE8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:28:44 +0200 (CEST)
Received: from localhost ([::1]:37708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j47-0004kJ-D0
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itm-0001He-KU; Fri, 09 Jul 2021 01:18:02 -0400
Received: from ozlabs.org ([203.11.71.1]:49343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itk-00022g-3q; Fri, 09 Jul 2021 01:18:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf270Gz9t4b; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=XMcyrR+d9xk9axuD4XJcT+E2fMa7254X/u6MOfcxdxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UXgJgwNWYYOdke3DSeQzidP7Uie4cS6vk1og1Za0R2SGGd5dNE/xl3EqWj8YlWRM4
 mlV7VOVkwV+nTd1ZjTMqrV2Mx1Dyeb62f+PnoLyWu1fIrOc7K7Nl1gHhzdU5mT8SoJ
 4yRd9QqG0vg7bJVaGr5a42kbo7Swo6OTVPKDcw7c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 21/33] docs/system: ppc: Update ppce500 documentation with
 eTSEC support
Date: Fri,  9 Jul 2021 15:17:16 +1000
Message-Id: <20210709051728.170203-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, Bin Meng <bmeng.cn@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

This adds eTSEC support to the PowerPC `ppce500` machine documentation.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/system/ppc/ppce500.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 7a815c1881..afc58f60f5 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
 * Power-off functionality via one GPIO pin
 * 1 Freescale MPC8xxx PCI host controller
 * VirtIO devices via PCI bus
+* 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
 
 Hardware configuration information
 ----------------------------------
@@ -121,7 +122,7 @@ To boot the 32-bit Linux kernel:
 Running U-Boot
 --------------
 
-U-Boot mainline v2021.04 release is tested at the time of writing. To build a
+U-Boot mainline v2021.07 release is tested at the time of writing. To build a
 U-Boot mainline bootloader that can be booted by the ``ppce500`` machine, use
 the qemu-ppce500_defconfig with similar commands as described above for Linux:
 
@@ -154,3 +155,10 @@ interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
                     -display none -serial stdio \
                     -bios u-boot \
                     -nic tap,ifname=tap0,script=no,downscript=no,model=e1000
+
+The QEMU ``ppce500`` machine can also dynamically instantiate an eTSEC device
+if “-device eTSEC” is given to QEMU:
+
+.. code-block:: bash
+
+  -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
-- 
2.31.1


