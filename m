Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F9747CD3A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:02:42 +0100 (CET)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzve5-0006pr-Ne
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvGx-0007j9-29; Wed, 22 Dec 2021 01:38:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvGm-0002vf-8i; Wed, 22 Dec 2021 01:38:44 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM3BSiE023133; 
 Wed, 22 Dec 2021 06:38:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3asw6rwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:26 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM6bKQF001180;
 Wed, 22 Dec 2021 06:38:26 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3asw6rw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM6a1Tm029276;
 Wed, 22 Dec 2021 06:38:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3d16wk1x8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BM6U78U41681280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 06:30:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 774C752052;
 Wed, 22 Dec 2021 06:38:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 4603B52051;
 Wed, 22 Dec 2021 06:38:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.51.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B4D1E22028A;
 Wed, 22 Dec 2021 07:38:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/5] ppc/pnv: Remove the PHB4 "device-id" property
Date: Wed, 22 Dec 2021 07:38:15 +0100
Message-Id: <20211222063817.1541058-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222063817.1541058-1-clg@kaod.org>
References: <20211222063817.1541058-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RgKhVM9ykci6Gt4zYxc9bmdCCWGz6D7D
X-Proofpoint-GUID: h2XyIe5Z0pXIDwdwFFDw8H-HqPu5vOyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_02,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1034 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220038
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's unused.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 2 --
 hw/pci-host/pnv_phb4.c         | 1 -
 hw/pci-host/pnv_phb4_pec.c     | 3 ---
 3 files changed, 6 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 60de3031a622..4a19338db35e 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -84,7 +84,6 @@ struct PnvPHB4 {
     uint32_t phb_id;
=20
     uint64_t version;
-    uint16_t device_id;
=20
     char bus_path[8];
=20
@@ -222,7 +221,6 @@ struct PnvPhb4PecClass {
     const char *stk_compat;
     int stk_compat_size;
     uint64_t version;
-    uint64_t device_id;
     const uint32_t *num_stacks;
 };
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 4caf03310fab..3b50a22b97cd 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1261,7 +1261,6 @@ static Property pnv_phb4_properties[] =3D {
         DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
         DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
-        DEFINE_PROP_UINT16("device-id", PnvPHB4, device_id, 0),
         DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STAC=
K,
                          PnvPhb4PecStack *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 24a3adcae326..f3e4fa0c8297 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -527,7 +527,6 @@ static void pnv_pec_class_init(ObjectClass *klass, vo=
id *data)
     pecc->stk_compat =3D stk_compat;
     pecc->stk_compat_size =3D sizeof(stk_compat);
     pecc->version =3D PNV_PHB4_VERSION;
-    pecc->device_id =3D PNV_PHB4_DEVICE_ID;
     pecc->num_stacks =3D pnv_pec_num_stacks;
 }
=20
@@ -587,8 +586,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Err=
or **errp)
                             &error_fatal);
     object_property_set_int(OBJECT(&stack->phb), "version", pecc->versio=
n,
                             &error_fatal);
-    object_property_set_int(OBJECT(&stack->phb), "device-id", pecc->devi=
ce_id,
-                            &error_fatal);
     object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack)=
,
                              &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
--=20
2.31.1


