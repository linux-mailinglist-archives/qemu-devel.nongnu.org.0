Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37293247D7E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:27:47 +0200 (CEST)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tDu-0004vQ-9M
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6C-0007XG-Fi; Tue, 18 Aug 2020 00:19:48 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38309 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6A-0006Mv-Rg; Tue, 18 Aug 2020 00:19:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNb72Pfz9sVR; Tue, 18 Aug 2020 14:19:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724367;
 bh=K0+7r8i73nDpRDqs5tcp1Ji9n1M/AGHGHH0KokPDWwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e+G3uBtKwKOde6DKxoXugykpiqd395PVcVj+gYd5cE5MDsCnSEmzcl6JyGxDPLdb7
 0mYj30LentksR5TPfY88W+Wuqa0mM3ysPUogFAmz/gI2vuEyyofGahKyUvA2Z0yrfA
 psCDDrIdfzCiuTdSkHv7WYdMdcFy387g8FcrqtWs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/40] docs: Update POWER9 XIVE support for nested guests
Date: Tue, 18 Aug 2020 14:18:59 +1000
Message-Id: <20200818041922.251708-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

It is not yet supported.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200804131639.407049-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/specs/ppc-spapr-xive.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/specs/ppc-spapr-xive.rst b/docs/specs/ppc-spapr-xive.rst
index 6159bc6eed..7199db730b 100644
--- a/docs/specs/ppc-spapr-xive.rst
+++ b/docs/specs/ppc-spapr-xive.rst
@@ -61,6 +61,11 @@ depend on the XIVE KVM capability of the host. On older kernels
 without XIVE KVM support, QEMU will use the emulated XIVE device as a
 fallback and on newer kernels (>=5.2), the KVM XIVE device.
 
+XIVE native exploitation mode is not supported for KVM nested guests,
+VMs running under a L1 hypervisor (KVM on pSeries). In that case, the
+hypervisor will not advertise the KVM capability and QEMU will use the
+emulated XIVE device, same as for older versions of KVM.
+
 As a final refinement, the user can also switch the use of the KVM
 device with the machine option ``kernel_irqchip``.
 
-- 
2.26.2


