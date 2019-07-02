Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53645C95F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:36:22 +0200 (CEST)
Received: from localhost ([::1]:49544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiCOs-00024V-2o
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58573)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByo-00057N-4U
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByj-0002wA-VH
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:26 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54457 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByj-0002tS-Gf; Tue, 02 Jul 2019 02:09:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMj70sqz9sPg; Tue,  2 Jul 2019 16:09:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047745;
 bh=HT07ntmZpjPIf5Gf42qXhpH8/xItYhlhB29GMoH0fLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h/gJY9P0tDjNi0igUaQpwQqrD58ZetDuaBfPhb5nNrhN4/YBcq1Of231RCgRgWGNw
 LVuMbzIIo0DiPpcScNhiju88ldBs/3kZme2wDjibPRShB1FaeomMjd0LhyvTaOFvbb
 JpYKKwbjOwCBtkBwMxfpsRXkkpxT0V3HnVe8fFMc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:19 +1000
Message-Id: <20190702060857.3926-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 11/49] xics: Add comment about CPU hotplug
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

So that no one is tempted to drop that code, which is never called
for cold plugged CPUs.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156078063349.435533.12283208810037409702.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 29f7d39781..978d7f0886 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -351,6 +351,7 @@ static void icp_realize(DeviceState *dev, Error **err=
p)
         return;
     }
=20
+    /* Connect the presenter to the VCPU (required for CPU hotplug) */
     if (kvm_irqchip_in_kernel()) {
         icp_kvm_realize(dev, &err);
         if (err) {
--=20
2.21.0


