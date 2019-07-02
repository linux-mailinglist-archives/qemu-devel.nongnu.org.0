Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1525C947
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:25:30 +0200 (CEST)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiCEL-0002A8-8y
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByn-00055m-DT
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiBym-0002yV-0t
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:25 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55627 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByl-0002uW-I3; Tue, 02 Jul 2019 02:09:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMk31STz9sQp; Tue,  2 Jul 2019 16:09:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047746;
 bh=xQLujcppXzYZL936PFhH4Oiy7+tPKkVm9ZN46+bvTWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BFE66Eppic9JqJrxhvSqEzKfB38iJpTwKGn1A8myavw1TsR9xECvI5XSiicgqYVmy
 d4/fo5cHZov2jOTFgfqQOmd/j2NjHFx9V9fck5lGiIfBdIQyh7B5GhRGk21VjJ3YgO
 etWbSy/oJ/rM027d824Bz3WhOfNZaaEjX6xn7qw8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:30 +1000
Message-Id: <20190702060857.3926-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 22/49] xics/spapr: Rename xics_kvm_init()
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

Switch to using the connect/disconnect terminology like we already do for
XIVE.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156077920102.433243.6605099291134598170.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xics_kvm.c          | 2 +-
 hw/ppc/spapr_irq.c          | 2 +-
 include/hw/ppc/xics_spapr.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index c7f8f5edd2..534515143e 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -331,7 +331,7 @@ void ics_kvm_set_irq(ICSState *ics, int srcno, int va=
l)
     }
 }
=20
-int xics_kvm_init(SpaprMachineState *spapr, Error **errp)
+int xics_kvm_connect(SpaprMachineState *spapr, Error **errp)
 {
     int rc;
     CPUState *cs;
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 75654fc67a..b2b01e850d 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -243,7 +243,7 @@ static void spapr_irq_init_emu_xics(SpaprMachineState=
 *spapr, Error **errp)
 static void spapr_irq_init_kvm_xics(SpaprMachineState *spapr, Error **er=
rp)
 {
     if (kvm_enabled()) {
-        xics_kvm_init(spapr, errp);
+        xics_kvm_connect(spapr, errp);
     }
 }
=20
diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
index 3304481262..5dabc9a138 100644
--- a/include/hw/ppc/xics_spapr.h
+++ b/include/hw/ppc/xics_spapr.h
@@ -33,7 +33,7 @@
=20
 void spapr_dt_xics(SpaprMachineState *spapr, uint32_t nr_servers, void *=
fdt,
                    uint32_t phandle);
-int xics_kvm_init(SpaprMachineState *spapr, Error **errp);
+int xics_kvm_connect(SpaprMachineState *spapr, Error **errp);
 void xics_kvm_disconnect(SpaprMachineState *spapr, Error **errp);
 bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr);
 void xics_spapr_init(SpaprMachineState *spapr);
--=20
2.21.0


