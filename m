Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0C72C10AC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 17:39:22 +0100 (CET)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khEs5-0000Mr-Gf
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 11:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1khEqU-0007pe-F6; Mon, 23 Nov 2020 11:37:43 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49078
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1khEqS-0007qc-CU; Mon, 23 Nov 2020 11:37:42 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ANGYcWB079755; Mon, 23 Nov 2020 11:37:24 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34yucmq7e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 11:37:24 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ANGIN0P009356;
 Mon, 23 Nov 2020 16:37:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 34xt5har3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 16:37:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ANGbKpx7602940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 16:37:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C9D6A4054;
 Mon, 23 Nov 2020 16:37:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A018A4060;
 Mon, 23 Nov 2020 16:37:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 23 Nov 2020 16:37:20 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-178-186.de.ibm.com [9.145.178.186])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5832422010B;
 Mon, 23 Nov 2020 17:37:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] xive: Add trace events
Date: Mon, 23 Nov 2020 17:37:17 +0100
Message-Id: <20201123163717.1368450-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_14:2020-11-23,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1034
 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011230108
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have been keeping those logging messages in an ugly form for
while. Make them clean !

Beware not to activate all of them, this is really verbose.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/spapr_xive.c | 27 +++++++++++++++++++++++++++
 hw/intc/xive.c       | 40 +++++++++++++++++++++++++++++++++++++---
 hw/intc/trace-events | 26 ++++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 1fa09f287ac0..644cc85cbdc9 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -24,6 +24,7 @@
 #include "hw/ppc/xive.h"
 #include "hw/ppc/xive_regs.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
=20
 /*
  * XIVE Virtualization Controller BAR and Thread Managment BAR that we
@@ -900,6 +901,8 @@ static target_ulong h_int_get_source_info(PowerPCCPU =
*cpu,
     target_ulong flags  =3D args[0];
     target_ulong lisn   =3D args[1];
=20
+    trace_spapr_xive_get_source_info(flags, lisn);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1015,6 +1018,8 @@ static target_ulong h_int_set_source_config(PowerPC=
CPU *cpu,
     uint8_t end_blk;
     uint32_t end_idx;
=20
+    trace_spapr_xive_set_source_config(flags, lisn, target, priority, ei=
sn);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1120,6 +1125,8 @@ static target_ulong h_int_get_source_config(PowerPC=
CPU *cpu,
     uint8_t nvt_blk;
     uint32_t end_idx, nvt_idx;
=20
+    trace_spapr_xive_get_source_config(flags, lisn);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1194,6 +1201,8 @@ static target_ulong h_int_get_queue_info(PowerPCCPU=
 *cpu,
     uint8_t end_blk;
     uint32_t end_idx;
=20
+    trace_spapr_xive_get_queue_info(flags, target, priority);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1281,6 +1290,8 @@ static target_ulong h_int_set_queue_config(PowerPCC=
PU *cpu,
     uint8_t end_blk, nvt_blk;
     uint32_t end_idx, nvt_idx;
=20
+    trace_spapr_xive_set_queue_config(flags, target, priority, qpage, qs=
ize);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1448,6 +1459,8 @@ static target_ulong h_int_get_queue_config(PowerPCC=
PU *cpu,
     uint8_t end_blk;
     uint32_t end_idx;
=20
+    trace_spapr_xive_get_queue_config(flags, target, priority);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1541,6 +1554,10 @@ static target_ulong h_int_set_os_reporting_line(Po=
werPCCPU *cpu,
                                                 target_ulong opcode,
                                                 target_ulong *args)
 {
+    target_ulong flags   =3D args[0];
+
+    trace_spapr_xive_set_os_reporting_line(flags);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1577,6 +1594,10 @@ static target_ulong h_int_get_os_reporting_line(Po=
werPCCPU *cpu,
                                                 target_ulong opcode,
                                                 target_ulong *args)
 {
+    target_ulong flags   =3D args[0];
+
+    trace_spapr_xive_get_os_reporting_line(flags);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1629,6 +1650,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
     hwaddr mmio_addr;
     XiveSource *xsrc =3D &xive->source;
=20
+    trace_spapr_xive_esb(flags, lisn, offset, data);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1698,6 +1721,8 @@ static target_ulong h_int_sync(PowerPCCPU *cpu,
     target_ulong flags =3D args[0];
     target_ulong lisn =3D args[1];
=20
+    trace_spapr_xive_sync(flags, lisn);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1763,6 +1788,8 @@ static target_ulong h_int_reset(PowerPCCPU *cpu,
     SpaprXive *xive =3D spapr->xive;
     target_ulong flags   =3D args[0];
=20
+    trace_spapr_xive_reset(flags);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 489e6256ef70..fa8c3d82877f 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -21,6 +21,7 @@
 #include "hw/irq.h"
 #include "hw/ppc/xive.h"
 #include "hw/ppc/xive_regs.h"
+#include "trace.h"
=20
 /*
  * XIVE Thread Interrupt Management context
@@ -93,6 +94,10 @@ static uint64_t xive_tctx_accept(XiveTCTX *tctx, uint8=
_t ring)
=20
         /* Drop Exception bit */
         regs[TM_NSR] &=3D ~mask;
+
+        trace_xive_tctx_accept(tctx->cs->cpu_index, ring,
+                               regs[TM_IPB], regs[TM_PIPR],
+                               regs[TM_CPPR], regs[TM_NSR]);
     }
=20
     return (nsr << 8) | regs[TM_CPPR];
@@ -113,12 +118,21 @@ static void xive_tctx_notify(XiveTCTX *tctx, uint8_=
t ring)
         default:
             g_assert_not_reached();
         }
+        trace_xive_tctx_notify(tctx->cs->cpu_index, ring,
+                               regs[TM_IPB], regs[TM_PIPR],
+                               regs[TM_CPPR], regs[TM_NSR]);
         qemu_irq_raise(xive_tctx_output(tctx, ring));
     }
 }
=20
 static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t cpp=
r)
 {
+    uint8_t *regs =3D &tctx->regs[ring];
+
+    trace_xive_tctx_set_cppr(tctx->cs->cpu_index, ring,
+                             regs[TM_IPB], regs[TM_PIPR],
+                             cppr, regs[TM_NSR]);
+
     if (cppr > XIVE_PRIORITY_MAX) {
         cppr =3D 0xff;
     }
@@ -508,6 +522,8 @@ void xive_tctx_tm_write(XivePresenter *xptr, XiveTCTX=
 *tctx, hwaddr offset,
 {
     const XiveTmOp *xto;
=20
+    trace_xive_tctx_tm_write(offset, size, value);
+
     /*
      * TODO: check V bit in Q[0-3]W2
      */
@@ -545,6 +561,7 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveT=
CTX *tctx, hwaddr offset,
                            unsigned size)
 {
     const XiveTmOp *xto;
+    uint64_t ret;
=20
     /*
      * TODO: check V bit in Q[0-3]W2
@@ -560,7 +577,8 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveT=
CTX *tctx, hwaddr offset,
                           "@%"HWADDR_PRIx"\n", offset);
             return -1;
         }
-        return xto->read_handler(xptr, tctx, offset, size);
+        ret =3D xto->read_handler(xptr, tctx, offset, size);
+        goto out;
     }
=20
     /*
@@ -568,13 +586,17 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, Xiv=
eTCTX *tctx, hwaddr offset,
      */
     xto =3D xive_tm_find_op(offset, size, false);
     if (xto) {
-        return xto->read_handler(xptr, tctx, offset, size);
+        ret =3D xto->read_handler(xptr, tctx, offset, size);
+        goto out;
     }
=20
     /*
      * Finish with raw access to the register values
      */
-    return xive_tm_raw_read(tctx, offset, size);
+    ret =3D xive_tm_raw_read(tctx, offset, size);
+out:
+    trace_xive_tctx_tm_read(offset, size, ret);
+    return ret;
 }
=20
 static char *xive_tctx_ring_print(uint8_t *ring)
@@ -1005,6 +1027,8 @@ static uint64_t xive_source_esb_read(void *opaque, =
hwaddr addr, unsigned size)
                       offset);
     }
=20
+    trace_xive_source_esb_read(addr, srcno, ret);
+
     return ret;
 }
=20
@@ -1030,6 +1054,8 @@ static void xive_source_esb_write(void *opaque, hwa=
ddr addr,
     uint32_t srcno =3D addr >> xsrc->esb_shift;
     bool notify =3D false;
=20
+    trace_xive_source_esb_write(addr, srcno, value);
+
     /* In a two pages ESB MMIO setting, trigger page only triggers */
     if (xive_source_is_trigger_page(xsrc, addr)) {
         notify =3D xive_source_esb_trigger(xsrc, srcno);
@@ -1507,6 +1533,7 @@ static bool xive_presenter_notify(XiveFabric *xfb, =
uint8_t format,
=20
     /* handle CPU exception delivery */
     if (count) {
+        trace_xive_presenter_notify(nvt_blk, nvt_idx, match.ring);
         xive_tctx_ipb_update(match.tctx, match.ring, priority_to_ipb(pri=
ority));
     }
=20
@@ -1558,6 +1585,7 @@ static void xive_router_end_notify(XiveRouter *xrtr=
, uint8_t end_blk,
     }
=20
     if (!xive_end_is_valid(&end)) {
+        trace_xive_router_end_notify(end_blk, end_idx, end_data);
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
                       end_blk, end_idx);
         return;
@@ -1683,6 +1711,10 @@ do_escalation:
         }
     }
=20
+    trace_xive_router_end_escalate(end_blk, end_idx,
+           (uint8_t) xive_get_field32(END_W4_ESC_END_BLOCK, end.w4),
+           (uint32_t) xive_get_field32(END_W4_ESC_END_INDEX, end.w4),
+           (uint32_t) xive_get_field32(END_W5_ESC_END_DATA,  end.w5));
     /*
      * The END trigger becomes an Escalation trigger
      */
@@ -1796,6 +1828,8 @@ static uint64_t xive_end_source_read(void *opaque, =
hwaddr addr, unsigned size)
     end_blk =3D xive_router_get_block_id(xsrc->xrtr);
     end_idx =3D addr >> (xsrc->esb_shift + 1);
=20
+    trace_xive_end_source_read(end_blk, end_idx, addr);
+
     if (xive_router_get_end(xsrc->xrtr, end_blk, end_idx, &end)) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
                       end_idx);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 22782b3f089b..77addc100f72 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -203,3 +203,29 @@ heathrow_set_irq(int num, int level) "set_irq: num=3D=
0x%02x level=3D%d"
 # bcm2835_ic.c
 bcm2835_ic_set_gpu_irq(int irq, int level) "GPU irq #%d level %d"
 bcm2835_ic_set_cpu_irq(int irq, int level) "CPU irq #%d level %d"
+
+# spapr_xive.c
+spapr_xive_get_source_info(uint64_t flags, uint64_t lisn) "flags=3D0x%"P=
RIx64" lisn=3D0x%"PRIx64
+spapr_xive_set_source_config(uint64_t flags, uint64_t lisn, uint64_t tar=
get, uint64_t priority, uint64_t eisn) "flags=3D0x%"PRIx64" lisn=3D0x%"PR=
Ix64" target=3D0x%"PRIx64" priority=3D0x%"PRIx64" eisn=3D0x%"PRIx64
+spapr_xive_get_source_config(uint64_t flags, uint64_t lisn) "flags=3D0x%=
"PRIx64" lisn=3D0x%"PRIx64
+spapr_xive_get_queue_info(uint64_t flags, uint64_t target, uint64_t prio=
rity) "flags=3D0x%"PRIx64" target=3D0x%"PRIx64" priority=3D0x%"PRIx64
+spapr_xive_set_queue_config(uint64_t flags, uint64_t target, uint64_t pr=
iority, uint64_t qpage, uint64_t qsize) "flags=3D0x%"PRIx64" target=3D0x%=
"PRIx64" priority=3D0x%"PRIx64" qpage=3D0x%"PRIx64" qsize=3D0x%"PRIx64
+spapr_xive_get_queue_config(uint64_t flags, uint64_t target, uint64_t pr=
iority) "flags=3D0x%"PRIx64" target=3D0x%"PRIx64" priority=3D0x%"PRIx64
+spapr_xive_set_os_reporting_line(uint64_t flags) "flags=3D0x%"PRIx64
+spapr_xive_get_os_reporting_line(uint64_t flags) "flags=3D0x%"PRIx64
+spapr_xive_esb(uint64_t flags, uint64_t lisn, uint64_t offset, uint64_t =
data) "flags=3D0x%"PRIx64" lisn=3D0x%"PRIx64" offset=3D0x%"PRIx64" data=3D=
0x%"PRIx64
+spapr_xive_sync(uint64_t flags, uint64_t lisn) "flags=3D0x%"PRIx64" lisn=
=3D0x%"PRIx64
+spapr_xive_reset(uint64_t flags) "flags=3D0x%"PRIx64
+
+# xive.c
+xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D=
0x%02x CPPR=3D0x%02x NSR=3D0x%02x ACK"
+xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D=
0x%02x CPPR=3D0x%02x NSR=3D0x%02x raise !"
+xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pi=
pr, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=
=3D0x%02x new CPPR=3D0x%02x NSR=3D0x%02x"
+xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x=
0x%"PRIx64" IRQ 0x%x val=3D0x0x%"PRIx64
+xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0=
x0x%"PRIx64" IRQ 0x%x val=3D0x0x%"PRIx64
+xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end_d=
ata) "END 0x%02x/0x%04x -> enqueue 0x%08x"
+xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t esc_=
blk, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate =
END 0x%02x/0x%04x data 0x%08x"
+xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "=
@0x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
+xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@=
0x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
+xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "=
found NVT 0x%x/0x%x ring=3D0x%x"
+xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "=
END 0x%x/0x%x @0x0x%"PRIx64
--=20
2.26.2


