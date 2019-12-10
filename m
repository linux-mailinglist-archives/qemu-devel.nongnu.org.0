Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50A1181CA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 09:10:34 +0100 (CET)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieabJ-00016B-7r
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 03:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ieaaJ-0008PE-DO
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 03:09:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ieaaI-0006hg-2v
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 03:09:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57280)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ieaaH-0006gc-Ry
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 03:09:30 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA87iwJ140046
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 03:09:28 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wsknakgsp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 03:09:27 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 10 Dec 2019 08:09:25 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Dec 2019 08:09:22 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBA89LoZ48037958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 08:09:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A542AE05F;
 Tue, 10 Dec 2019 08:09:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8E2CAE053;
 Tue, 10 Dec 2019 08:09:20 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.92.214])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Dec 2019 08:09:20 +0000 (GMT)
Subject: [PATCH] ppc: Drop useless extern annotation for functions
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 10 Dec 2019 09:09:20 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19121008-0020-0000-0000-000003961AAC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121008-0021-0000-0000-000021ED59EB
Message-Id: <157596536058.115682.18155243603867418789.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=972 spamscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1034
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100073
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
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/pnv_xscom.h |   22 +++++++++++-----------
 include/hw/ppc/spapr_vio.h |    6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index a40d2a2a2a98..1c1d76bf9be5 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -109,16 +109,16 @@ typedef struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_PSIHB_BASE     0x3011D00
 #define PNV10_XSCOM_PSIHB_SIZE     0x100
 
-extern void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
-extern int pnv_dt_xscom(PnvChip *chip, void *fdt, int offset);
-
-extern void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset,
-                                    MemoryRegion *mr);
-extern void pnv_xscom_region_init(MemoryRegion *mr,
-                                  struct Object *owner,
-                                  const MemoryRegionOps *ops,
-                                  void *opaque,
-                                  const char *name,
-                                  uint64_t size);
+void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
+int pnv_dt_xscom(PnvChip *chip, void *fdt, int offset);
+
+void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset,
+                             MemoryRegion *mr);
+void pnv_xscom_region_init(MemoryRegion *mr,
+                           struct Object *owner,
+                           const MemoryRegionOps *ops,
+                           void *opaque,
+                           const char *name,
+                           uint64_t size);
 
 #endif /* PPC_PNV_XSCOM_H */
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 72762ed16b70..ce6d9b0c6605 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -80,10 +80,10 @@ struct SpaprVioBus {
     uint32_t next_reg;
 };
 
-extern SpaprVioBus *spapr_vio_bus_init(void);
-extern SpaprVioDevice *spapr_vio_find_by_reg(SpaprVioBus *bus, uint32_t reg);
+SpaprVioBus *spapr_vio_bus_init(void);
+SpaprVioDevice *spapr_vio_find_by_reg(SpaprVioBus *bus, uint32_t reg);
 void spapr_dt_vdevice(SpaprVioBus *bus, void *fdt);
-extern gchar *spapr_vio_stdout_path(SpaprVioBus *bus);
+gchar *spapr_vio_stdout_path(SpaprVioBus *bus);
 
 static inline void spapr_vio_irq_pulse(SpaprVioDevice *dev)
 {


