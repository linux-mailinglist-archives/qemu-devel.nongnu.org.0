Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58DCDDC2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 10:53:27 +0200 (CEST)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHOli-0006Kk-W6
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 04:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iHOad-0003iW-9n
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:42:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iHOaW-00042b-Dm
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:41:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iHOa8-0003oO-H1
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:41:52 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x978bPRH040302
 for <qemu-devel@nongnu.org>; Mon, 7 Oct 2019 04:41:20 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vg12a9yer-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 04:41:20 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <clg@kaod.org>;
 Mon, 7 Oct 2019 09:41:17 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 7 Oct 2019 09:41:14 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x978fD3352560076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Oct 2019 08:41:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23486A404D;
 Mon,  7 Oct 2019 08:41:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05B8AA4059;
 Mon,  7 Oct 2019 08:41:13 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Oct 2019 08:41:12 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-169-184.de.ibm.com
 [9.145.169.184])
 by smtp.tls.ibm.com (Postfix) with ESMTP id 35332220204;
 Mon,  7 Oct 2019 10:41:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 5/9] ppc/pnv: Remove pnv_xive_vst_size() routine
Date: Mon,  7 Oct 2019 10:40:58 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007084102.29776-1-clg@kaod.org>
References: <20191007084102.29776-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19100708-4275-0000-0000-0000036EC410
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100708-4276-0000-0000-00003881D12E
Message-Id: <20191007084102.29776-6-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-07_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910070090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id x978bPRH040302
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pnv_xive_vst_size() tries to compute the size of a VSD table from the
information given by FW. The number of entries of the table are
deduced from the result and the MMIO regions of the ESBs and the END
ESBs are then resized accordingly with the computed value. This
reduces the number of elements that can be addressed by the ESB pages.

The maximum number of elements of a direct table can contain is simply:

   Table size / sizeof(XIVE structure)

An indirect table is a one page array of VSDs pointing to subpages
containing XIVE virtual structures and the maximum number of elements
an indirect table can contain :

   (PAGE_SIZE / sizeof(vsd)) * (PAGE_SIZE / sizeof(XIVE structure))

which gives us 16M for XiveENDs, 8M for XiveNVTs. That's more than the
associated VC and PC BARS can address.

The result returned by pnv_xive_vst_size() for indirect tables is
incorrect and can not be used to reduce the size of the MMIO region of
a XIVE resource using an indirect table, such as ENDs in skiboot.

Remove pnv_xive_vst_size() and use a simpler form for direct tables
only. Keep the resizing of the MMIO region for direct tables only as
this is still useful for the ESB MMIO window.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive.c | 112 +++++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 69 deletions(-)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 348f2fdd263d..0b142fd9f112 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -123,36 +123,22 @@ static uint64_t pnv_xive_vst_page_size_allowed(uint=
32_t page_shift)
          page_shift =3D=3D 21 || page_shift =3D=3D 24;
 }
=20
-static uint64_t pnv_xive_vst_size(uint64_t vsd)
-{
-    uint64_t vst_tsize =3D 1ull << (GETFIELD(VSD_TSIZE, vsd) + 12);
-
-    /*
-     * Read the first descriptor to get the page size of the indirect
-     * table.
-     */
-    if (VSD_INDIRECT & vsd) {
-        uint32_t nr_pages =3D vst_tsize / XIVE_VSD_SIZE;
-        uint32_t page_shift;
-
-        vsd =3D ldq_be_dma(&address_space_memory, vsd & VSD_ADDRESS_MASK=
);
-        page_shift =3D GETFIELD(VSD_TSIZE, vsd) + 12;
-
-        if (!pnv_xive_vst_page_size_allowed(page_shift)) {
-            return 0;
-        }
-
-        return nr_pages * (1ull << page_shift);
-    }
-
-    return vst_tsize;
-}
-
 static uint64_t pnv_xive_vst_addr_direct(PnvXive *xive, uint32_t type,
                                          uint64_t vsd, uint32_t idx)
 {
     const XiveVstInfo *info =3D &vst_infos[type];
     uint64_t vst_addr =3D vsd & VSD_ADDRESS_MASK;
+    uint64_t vst_tsize =3D 1ull << (GETFIELD(VSD_TSIZE, vsd) + 12);
+    uint32_t idx_max;
+
+    idx_max =3D vst_tsize / info->size - 1;
+    if (idx > idx_max) {
+#ifdef XIVE_DEBUG
+        xive_error(xive, "VST: %s entry %x out of range [ 0 .. %x ] !?",
+                   info->name, idx, idx_max);
+#endif
+        return 0;
+    }
=20
     return vst_addr + idx * info->size;
 }
@@ -215,7 +201,6 @@ static uint64_t pnv_xive_vst_addr(PnvXive *xive, uint=
32_t type, uint8_t blk,
 {
     const XiveVstInfo *info =3D &vst_infos[type];
     uint64_t vsd;
-    uint32_t idx_max;
=20
     if (blk >=3D info->max_blocks) {
         xive_error(xive, "VST: invalid block id %d for VST %s %d !?",
@@ -232,15 +217,6 @@ static uint64_t pnv_xive_vst_addr(PnvXive *xive, uin=
t32_t type, uint8_t blk,
         return xive ? pnv_xive_vst_addr(xive, type, blk, idx) : 0;
     }
=20
-    idx_max =3D pnv_xive_vst_size(vsd) / info->size - 1;
-    if (idx > idx_max) {
-#ifdef XIVE_DEBUG
-        xive_error(xive, "VST: %s entry %x/%x out of range [ 0 .. %x ] !=
?",
-                   info->name, blk, idx, idx_max);
-#endif
-        return 0;
-    }
-
     if (VSD_INDIRECT & vsd) {
         return pnv_xive_vst_addr_indirect(xive, type, vsd, idx);
     }
@@ -453,19 +429,12 @@ static uint64_t pnv_xive_pc_size(PnvXive *xive)
     return (~xive->regs[CQ_PC_BARM >> 3] + 1) & CQ_PC_BARM_MASK;
 }
=20
-static uint32_t pnv_xive_nr_ipis(PnvXive *xive)
+static uint32_t pnv_xive_nr_ipis(PnvXive *xive, uint8_t blk)
 {
-    uint8_t blk =3D xive->chip->chip_id;
-
-    return pnv_xive_vst_size(xive->vsds[VST_TSEL_SBE][blk]) * SBE_PER_BY=
TE;
-}
-
-static uint32_t pnv_xive_nr_ends(PnvXive *xive)
-{
-    uint8_t blk =3D xive->chip->chip_id;
+    uint64_t vsd =3D xive->vsds[VST_TSEL_SBE][blk];
+    uint64_t vst_tsize =3D 1ull << (GETFIELD(VSD_TSIZE, vsd) + 12);
=20
-    return pnv_xive_vst_size(xive->vsds[VST_TSEL_EQDT][blk])
-        / vst_infos[VST_TSEL_EQDT].size;
+    return VSD_INDIRECT & vsd ? 0 : vst_tsize * SBE_PER_BYTE;
 }
=20
 /*
@@ -598,6 +567,7 @@ static void pnv_xive_vst_set_exclusive(PnvXive *xive,=
 uint8_t type,
     XiveSource *xsrc =3D &xive->ipi_source;
     const XiveVstInfo *info =3D &vst_infos[type];
     uint32_t page_shift =3D GETFIELD(VSD_TSIZE, vsd) + 12;
+    uint64_t vst_tsize =3D 1ull << page_shift;
     uint64_t vst_addr =3D vsd & VSD_ADDRESS_MASK;
=20
     /* Basic checks */
@@ -633,11 +603,16 @@ static void pnv_xive_vst_set_exclusive(PnvXive *xiv=
e, uint8_t type,
=20
     case VST_TSEL_EQDT:
         /*
-         * Backing store pages for the END. Compute the number of ENDs
-         * provisioned by FW and resize the END ESB window accordingly.
+         * Backing store pages for the END.
+         *
+         * If the table is direct, we can compute the number of PQ
+         * entries provisioned by FW (such as skiboot) and resize the
+         * END ESB window accordingly.
          */
-        memory_region_set_size(&end_xsrc->esb_mmio, pnv_xive_nr_ends(xiv=
e) *
-                               (1ull << (end_xsrc->esb_shift + 1)));
+        if (!(VSD_INDIRECT & vsd)) {
+            memory_region_set_size(&end_xsrc->esb_mmio, (vst_tsize / inf=
o->size)
+                                   * (1ull << xsrc->esb_shift));
+        }
         memory_region_add_subregion(&xive->end_edt_mmio, 0,
                                     &end_xsrc->esb_mmio);
         break;
@@ -646,11 +621,16 @@ static void pnv_xive_vst_set_exclusive(PnvXive *xiv=
e, uint8_t type,
         /*
          * Backing store pages for the source PQ bits. The model does
          * not use these PQ bits backed in RAM because the XiveSource
-         * model has its own. Compute the number of IRQs provisioned
-         * by FW and resize the IPI ESB window accordingly.
+         * model has its own.
+         *
+         * If the table is direct, we can compute the number of PQ
+         * entries provisioned by FW (such as skiboot) and resize the
+         * ESB window accordingly.
          */
-        memory_region_set_size(&xsrc->esb_mmio, pnv_xive_nr_ipis(xive) *
-                               (1ull << xsrc->esb_shift));
+        if (!(VSD_INDIRECT & vsd)) {
+            memory_region_set_size(&xsrc->esb_mmio, vst_tsize * SBE_PER_=
BYTE
+                                   * (1ull << xsrc->esb_shift));
+        }
         memory_region_add_subregion(&xive->ipi_edt_mmio, 0, &xsrc->esb_m=
mio);
         break;
=20
@@ -1579,8 +1559,7 @@ void pnv_xive_pic_print_info(PnvXive *xive, Monitor=
 *mon)
     XiveRouter *xrtr =3D XIVE_ROUTER(xive);
     uint8_t blk =3D xive->chip->chip_id;
     uint32_t srcno0 =3D XIVE_EAS(blk, 0);
-    uint32_t nr_ipis =3D pnv_xive_nr_ipis(xive);
-    uint32_t nr_ends =3D pnv_xive_nr_ends(xive);
+    uint32_t nr_ipis =3D pnv_xive_nr_ipis(xive, blk);
     XiveEAS eas;
     XiveEND end;
     int i;
@@ -1600,21 +1579,16 @@ void pnv_xive_pic_print_info(PnvXive *xive, Monit=
or *mon)
         }
     }
=20
-    monitor_printf(mon, "XIVE[%x] ENDT %08x .. %08x\n", blk, 0, nr_ends =
- 1);
-    for (i =3D 0; i < nr_ends; i++) {
-        if (xive_router_get_end(xrtr, blk, i, &end)) {
-            break;
-        }
-        xive_end_pic_print_info(&end, i, mon);
+    monitor_printf(mon, "XIVE[%x] ENDT\n", blk);
+    i =3D 0;
+    while (!xive_router_get_end(xrtr, blk, i, &end)) {
+        xive_end_pic_print_info(&end, i++, mon);
     }
=20
-    monitor_printf(mon, "XIVE[%x] END Escalation %08x .. %08x\n", blk, 0=
,
-                   nr_ends - 1);
-    for (i =3D 0; i < nr_ends; i++) {
-        if (xive_router_get_end(xrtr, blk, i, &end)) {
-            break;
-        }
-        xive_end_eas_pic_print_info(&end, i, mon);
+    monitor_printf(mon, "XIVE[%x] END Escalation EAT\n", blk);
+    i =3D 0;
+    while (!xive_router_get_end(xrtr, blk, i, &end)) {
+        xive_end_eas_pic_print_info(&end, i++, mon);
     }
 }
=20
--=20
2.21.0


