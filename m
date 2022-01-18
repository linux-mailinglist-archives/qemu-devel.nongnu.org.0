Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96824928AA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:46:10 +0100 (CET)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pkP-0006lv-FU
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDn-0004EV-1L; Tue, 18 Jan 2022 08:08:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32034
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDi-0000GB-1T; Tue, 18 Jan 2022 08:08:21 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICdgr4007644; 
 Tue, 18 Jan 2022 13:07:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dngcqhbak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:55 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ID0B5K013732;
 Tue, 18 Jan 2022 13:07:54 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dngcqhb9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:54 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7fi6008351;
 Tue, 18 Jan 2022 13:07:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3dknw94h8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20ID7oWR45744600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C70611C04A;
 Tue, 18 Jan 2022 13:07:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4993D11C04C;
 Tue, 18 Jan 2022 13:07:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:50 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 902692201EB;
 Tue, 18 Jan 2022 14:07:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 27/31] ppc/pnv: remove PnvPhb4PecStack object
Date: Tue, 18 Jan 2022 14:07:26 +0100
Message-Id: <20220118130730.1927983-28-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xq5mDR9eEZSy02M3N3vVwEgx8mbvRU7R
X-Proofpoint-ORIG-GUID: _W8QlMuWOgxqJjcyzbEtkUDB4FNtDhqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1034 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

All the complexity that was scattered between PnvPhb4PecStack and
PnvPHB4 are now centered in the PnvPHB4 device. PnvPhb4PecStack does not
serve any purpose in the current code base.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220114180719.52117-8-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 17 -----------------
 hw/pci-host/pnv_phb4_pec.c     | 33 ---------------------------------
 2 files changed, 50 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index e750165e7703..74fdec2b478b 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -164,23 +164,6 @@ extern const MemoryRegionOps pnv_phb4_xscom_ops;
 #define TYPE_PNV_PHB4_PEC "pnv-phb4-pec"
 OBJECT_DECLARE_TYPE(PnvPhb4PecState, PnvPhb4PecClass, PNV_PHB4_PEC)
=20
-#define TYPE_PNV_PHB4_PEC_STACK "pnv-phb4-pec-stack"
-OBJECT_DECLARE_SIMPLE_TYPE(PnvPhb4PecStack, PNV_PHB4_PEC_STACK)
-
-/* Per-stack data */
-struct PnvPhb4PecStack {
-    DeviceState parent;
-
-    /* The owner PEC */
-    PnvPhb4PecState *pec;
-
-    /*
-     * PHB4 pointer. pnv_phb4_update_regions() needs to access
-     * the PHB4 via a PnvPhb4PecStack pointer.
-     */
-    PnvPHB4 *phb;
-};
-
 struct PnvPhb4PecState {
     DeviceState parent;
=20
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 852816b9f83b..12aa4596282b 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -278,42 +278,9 @@ static const TypeInfo pnv_pec_type_info =3D {
     }
 };
=20
-static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
-{
-}
-
-static Property pnv_pec_stk_properties[] =3D {
-        DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
-                         PnvPhb4PecState *),
-        DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pnv_pec_stk_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(klass);
-
-    device_class_set_props(dc, pnv_pec_stk_properties);
-    dc->realize =3D pnv_pec_stk_realize;
-    dc->user_creatable =3D false;
-
-    /* TODO: reset regs ? */
-}
-
-static const TypeInfo pnv_pec_stk_type_info =3D {
-    .name          =3D TYPE_PNV_PHB4_PEC_STACK,
-    .parent        =3D TYPE_DEVICE,
-    .instance_size =3D sizeof(PnvPhb4PecStack),
-    .class_init    =3D pnv_pec_stk_class_init,
-    .interfaces    =3D (InterfaceInfo[]) {
-        { TYPE_PNV_XSCOM_INTERFACE },
-        { }
-    }
-};
-
 static void pnv_pec_register_types(void)
 {
     type_register_static(&pnv_pec_type_info);
-    type_register_static(&pnv_pec_stk_type_info);
 }
=20
 type_init(pnv_pec_register_types);
--=20
2.31.1


