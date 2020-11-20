Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650242BB1B9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:50:28 +0100 (CET)
Received: from localhost ([::1]:41398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAYF-00034e-Eq
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAUx-0008RS-6N
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:07 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:39261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAUt-00058D-Vl
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:02 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-tYPiPneZMIixWPmnIleXWw-1; Fri, 20 Nov 2020 12:46:57 -0500
X-MC-Unique: tYPiPneZMIixWPmnIleXWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40F0610051C6;
 Fri, 20 Nov 2020 17:46:56 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 131BD5C1D5;
 Fri, 20 Nov 2020 17:46:54 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 5/8] spapr/xics: Drop unused argument to
 xics_kvm_has_broken_disconnect()
Date: Fri, 20 Nov 2020 18:46:43 +0100
Message-Id: <20201120174646.619395-6-groug@kaod.org>
In-Reply-To: <20201120174646.619395-1-groug@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Never used from the start.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/xics_spapr.h | 2 +-
 hw/intc/xics_kvm.c          | 2 +-
 hw/ppc/spapr_irq.c          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
index 0b8182e40b33..de752c0d2c7e 100644
--- a/include/hw/ppc/xics_spapr.h
+++ b/include/hw/ppc/xics_spapr.h
@@ -38,6 +38,6 @@ DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
 int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
                      Error **errp);
 void xics_kvm_disconnect(SpaprInterruptController *intc);
-bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr);
+bool xics_kvm_has_broken_disconnect(void);
=20
 #endif /* XICS_SPAPR_H */
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index 68bb1914b9bb..570d635bcc08 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -484,7 +484,7 @@ void xics_kvm_disconnect(SpaprInterruptController *intc=
)
  * support destruction of a KVM XICS device while the VM is running.
  * Required to start a spapr machine with ic-mode=3Ddual,kernel-irqchip=3D=
on.
  */
-bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr)
+bool xics_kvm_has_broken_disconnect(void)
 {
     int rc;
=20
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index a0fc474ecb06..2dacbecfd5fd 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -186,7 +186,7 @@ static int spapr_irq_check(SpaprMachineState *spapr, Er=
ror **errp)
     if (kvm_enabled() &&
         spapr->irq =3D=3D &spapr_irq_dual &&
         kvm_kernel_irqchip_required() &&
-        xics_kvm_has_broken_disconnect(spapr)) {
+        xics_kvm_has_broken_disconnect()) {
         error_setg(errp,
             "KVM is incompatible with ic-mode=3Ddual,kernel-irqchip=3Don")=
;
         error_append_hint(errp,
--=20
2.26.2


