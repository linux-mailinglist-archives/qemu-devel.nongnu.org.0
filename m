Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEC42C6712
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:44:12 +0100 (CET)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kie2l-0004wJ-MB
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kidwD-00075B-9u; Fri, 27 Nov 2020 08:37:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kidwB-0003Ou-96; Fri, 27 Nov 2020 08:37:25 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ARDVncE091492; Fri, 27 Nov 2020 08:37:01 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3531tf1aba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 08:37:00 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ARCRXuD006452;
 Fri, 27 Nov 2020 13:36:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3518j8jprc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 13:36:59 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ARDauTI59441438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 13:36:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9B0AA4040;
 Fri, 27 Nov 2020 13:36:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A90E0A4053;
 Fri, 27 Nov 2020 13:36:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 27 Nov 2020 13:36:56 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-95-195.uk.ibm.com [9.145.95.195])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B2E2922013F;
 Fri, 27 Nov 2020 14:36:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] xive: Add more trace events
Date: Fri, 27 Nov 2020 14:36:54 +0100
Message-Id: <20201127133654.290177-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_06:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=637 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=2 clxscore=1034
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270078
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are useful to understand IRQ requests from the OS.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

David, Feel free to merge with the previous.

 hw/intc/spapr_xive.c     | 6 ++++++
 hw/intc/spapr_xive_kvm.c | 5 +++++
 hw/intc/trace-events     | 7 +++++++
 3 files changed, 18 insertions(+)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 644cc85cbdc9..db6d0e7a3a12 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -563,6 +563,8 @@ static int spapr_xive_claim_irq(SpaprInterruptControl=
ler *intc, int lisn,
=20
     assert(lisn < xive->nr_irqs);
=20
+    trace_spapr_xive_claim_irq(lisn, lsi);
+
     if (xive_eas_is_valid(&xive->eat[lisn])) {
         error_setg(errp, "IRQ %d is not free", lisn);
         return -EBUSY;
@@ -588,6 +590,8 @@ static void spapr_xive_free_irq(SpaprInterruptControl=
ler *intc, int lisn)
     SpaprXive *xive =3D SPAPR_XIVE(intc);
     assert(lisn < xive->nr_irqs);
=20
+    trace_spapr_xive_free_irq(lisn);
+
     xive->eat[lisn].w &=3D cpu_to_be64(~EAS_VALID);
 }
=20
@@ -654,6 +658,8 @@ static void spapr_xive_set_irq(SpaprInterruptControll=
er *intc, int irq, int val)
 {
     SpaprXive *xive =3D SPAPR_XIVE(intc);
=20
+    trace_spapr_xive_set_irq(irq, val);
+
     if (spapr_xive_in_kernel(xive)) {
         kvmppc_xive_source_set_irq(&xive->source, irq, val);
     } else {
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index e8667ce5f621..acc8c3650c4c 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -20,6 +20,7 @@
 #include "hw/ppc/spapr_xive.h"
 #include "hw/ppc/xive.h"
 #include "kvm_ppc.h"
+#include "trace.h"
=20
 #include <sys/ioctl.h>
=20
@@ -163,6 +164,8 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **e=
rrp)
=20
     vcpu_id =3D kvm_arch_vcpu_id(tctx->cs);
=20
+    trace_kvm_xive_cpu_connect(vcpu_id);
+
     ret =3D kvm_vcpu_enable_cap(tctx->cs, KVM_CAP_PPC_IRQ_XIVE, 0, xive-=
>fd,
                               vcpu_id, 0);
     if (ret < 0) {
@@ -308,6 +311,8 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int src=
no, uint32_t offset,
         return xive_esb_rw(xsrc, srcno, offset, data, 1);
     }
=20
+    trace_kvm_xive_source_reset(srcno);
+
     /*
      * Special Load EOI handling for LSI sources. Q bit is never set
      * and the interrupt should be re-triggered if the level is still
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 77addc100f72..8ed397a0d587 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -205,6 +205,9 @@ bcm2835_ic_set_gpu_irq(int irq, int level) "GPU irq #=
%d level %d"
 bcm2835_ic_set_cpu_irq(int irq, int level) "CPU irq #%d level %d"
=20
 # spapr_xive.c
+spapr_xive_claim_irq(uint32_t lisn, bool lsi) "lisn=3D0x%x lsi=3D%d"
+spapr_xive_free_irq(uint32_t lisn) "lisn=3D0x%x"
+spapr_xive_set_irq(uint32_t lisn, uint32_t val) "lisn=3D0x%x val=3D%d"
 spapr_xive_get_source_info(uint64_t flags, uint64_t lisn) "flags=3D0x%"P=
RIx64" lisn=3D0x%"PRIx64
 spapr_xive_set_source_config(uint64_t flags, uint64_t lisn, uint64_t tar=
get, uint64_t priority, uint64_t eisn) "flags=3D0x%"PRIx64" lisn=3D0x%"PR=
Ix64" target=3D0x%"PRIx64" priority=3D0x%"PRIx64" eisn=3D0x%"PRIx64
 spapr_xive_get_source_config(uint64_t flags, uint64_t lisn) "flags=3D0x%=
"PRIx64" lisn=3D0x%"PRIx64
@@ -217,6 +220,10 @@ spapr_xive_esb(uint64_t flags, uint64_t lisn, uint64=
_t offset, uint64_t data) "f
 spapr_xive_sync(uint64_t flags, uint64_t lisn) "flags=3D0x%"PRIx64" lisn=
=3D0x%"PRIx64
 spapr_xive_reset(uint64_t flags) "flags=3D0x%"PRIx64
=20
+# spapr_xive_kvm.c
+kvm_xive_cpu_connect(uint32_t id) "connect CPU%d to KVM device"
+kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
+
 # xive.c
 xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D=
0x%02x CPPR=3D0x%02x NSR=3D0x%02x ACK"
 xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D=
0x%02x CPPR=3D0x%02x NSR=3D0x%02x raise !"
--=20
2.26.2


