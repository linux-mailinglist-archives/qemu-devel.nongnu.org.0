Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFC474D62
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 22:55:27 +0100 (CET)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxFld-000434-Av
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 16:55:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mxFjz-0003NP-DW
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 16:53:43 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mxFjx-0006Zz-2f
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 16:53:43 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BEJHfVX024960; 
 Tue, 14 Dec 2021 21:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Xfb6R6XtVXI/veRZ9vYUlxsSfjqn5lE5gws2ZBcqhFA=;
 b=xNJKibMDNIUEBtqYmNJZEwUZQQVM3WI2rOJabJJsVIQg4FHR0jRymqC/vpkHkr1En+bs
 OSr3ClxJqbz9HoLPapXKPILcy43WOrzshmLVep92V7fM6AbLGoV0vTBrchGdTYw52sL2
 CLtUeuuQOH9x7FjfnPav1i6chxVmoZKauVGJj7vHPSRly9R/h67VuMYSd8VyCVuub/ye
 PqJON5XkHQIFTJKsPGkeqaTmPxa4ln/Pd4wCYvRi48e+J7ztVdtE7swsMBIv9VdVCJOR
 iyqXI+u+0Psh40e8GMTxVGQp4EIinhfPv55k/wxEYByrLtzxtwP7Qbinndy7wRuoXoVE /g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3ukd5t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Dec 2021 21:53:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BELBaal022298;
 Tue, 14 Dec 2021 21:53:36 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by userp3030.oracle.com with ESMTP id 3cvh3y3612-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Dec 2021 21:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkM1Aceuh+KA95yN+t+wvUtXkJm3rGd46tGAxdKms2YHLbAVc2RoDmNKiIVvH9rPACJOyBTZYwWVSyWBLs80pfrRnLUqdVlA4p/2nzx4u3A14lgKU0mP4aTSTmjv8IKrh7TMUd+BbJecwrrPBZhS31CzEMB3KbuQ64ZIBHSj7eHtbMw6zkfd4MxizbHYK20VHrF6k3sFJ67naKPYPTQG35P7lBxXrKLzhySN7IufBy/GkMgLf/KlVS8ClfEN1mvf3Gv0cjLVbE5ks3mE57uiwlNvA/myjVhdIv7buXb77lPbs12xAjm89vAeqnKWdwjk5brQ2luJOBL6ktWsfXp9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xfb6R6XtVXI/veRZ9vYUlxsSfjqn5lE5gws2ZBcqhFA=;
 b=dw06UZKCOn2qVH/+3XYcha4XBIPHfBkcHOM8jjsSTMakV51L4n9/4xnZx6rLKnZB4GmP/pdNF0+D6uQi7VOxOa9K993mku65RKgYGKbkgJvJ2VhK4CovV+PrC5pOGF+rR2CrZt8kvV0FXRtxaYWVPhqFi928jPeTH1HSyuqYtnna4NJpl3VfOsTXbT7r6/UJbmvz8yp93H5RvX78+THZRiB4JpEPVUsbOIuMFWwv/RDDE1LQ+xhNNaNsb7w6vkvLhtMaZlxuDK9gqPKcmM1nXUwxQOuSpje5Ig+dcNcP47UfpxdeO5szWuIRrgBhRpSGF1zgUAoaa0rfVyT6omKaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xfb6R6XtVXI/veRZ9vYUlxsSfjqn5lE5gws2ZBcqhFA=;
 b=QCSNT8IeNmPxT7hT3kRpCSRyad4zjSWuDQauOcI8b6Km7C1fAqjpvvMmulCCLTRyOyBYJOMeKCDQ0ZmS7vAzf749+Mr5h0Au4neHQs42B6eMmX9vifR1NqFK7lJs5z6EXuf7JQ85EqMEI8hzWm+RQSbODpTDnMXJh9T/6uvbgnY=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM6PR10MB2603.namprd10.prod.outlook.com (2603:10b6:5:ac::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 21:53:32 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::99f0:c772:4eda:d1e8]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::99f0:c772:4eda:d1e8%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 21:53:32 +0000
From: Annie Li <annie.li@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] pcie: Do not set power state for some hot-plugged devices
Date: Tue, 14 Dec 2021 21:53:12 +0000
Message-Id: <20211214215312.944-1-annie.li@oracle.com>
X-Mailer: git-send-email 2.30.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0071.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::48) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcf2c505-7590-4f3e-5d43-08d9bf4c2b96
X-MS-TrafficTypeDiagnostic: DM6PR10MB2603:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2603112C321D0CE5CD8BDFFEE5759@DM6PR10MB2603.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xNsTllNi2i5m08soLgsrXswPG2KhhszMP/TMtEo3AUB6hotsS9asIu33u95kbznOYytPsajYpjyw0zKaLJPRfS4D67/xTp/FiILerVD2HsGOVFpANQrdNIMakp2uq5+SxdQRQeRKee2/E4jHQlYWydkFatemCL/AUHwIzIPQZcO2FxuZXjGtDmcPdiaFekuE7SANUG9YHzzFj4F1b/2TzAimHpUHz+pvdSMLW9Csge8AhWalmSCBdlGMK7LpgdAZVqO0+qwoJR8NIp6Uvdj0ZtojsPngt53nF0w5gOMJcOzwaQfd+T0/B7PZHXlFOHwTI7Pivizf+HU0RYjat6nuHyyWw0mbqYUgPofnFJNGCHRQH9ZD9vbIACp5fY36PKttWc7Iqg0uZQtCN2TTYdUy9GkFVKJCqinqxrgbhIeTCJZZlT3jzLX7z/5DzTLyi/1rIBZpOTrhjgC44xE+QPRWLIHel/7cvcMx7Osg6p1YNxrjEzxqQhFxaXXVNKdaYoT6pwqpLHPP+r7Pqty2DmfBV2nXMkkaVfV2LEJi3uOdhJNjwdoUKGKaexch8bGhAxx3FGV/WSzADWubPMQL51wkdup7QQdtl+J1/Tn1fqvMtsrDZMQJkovNkmDANdc0Hy7a6ahZSn6OpgHTcXcVu30Q3v+g67WKrKQxWG6GXkrY951j18zdRHwdVlbJHH5o2FnXvxe/30wXF3UzRlOSMimjDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(4326008)(66556008)(66476007)(66946007)(52116002)(44832011)(5660300002)(1076003)(6506007)(6916009)(8676002)(36756003)(86362001)(8936002)(2616005)(186003)(316002)(38100700002)(6666004)(6512007)(508600001)(6486002)(26005)(83380400001)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y9RaTODghKxm6lphJdvweHGsnGCUU6gE+Nww5V9irOJ7QDyQAVG03DLGutFV?=
 =?us-ascii?Q?JqTIm/YlDnnJDuhh1JB8Ogdy6Ss+vnPKYm5Coag45nk2FXwGgZUbyQSmS+pR?=
 =?us-ascii?Q?kKRDy+SRPDbbEXySFVEM+e+Kr53yBZX6w5JfLVOvI6Kkotdtv1j/dnWOZXYs?=
 =?us-ascii?Q?rV0mNQtQLHGu59JC3fXg6e+BzKk+N/djADtv7FHe2jMY4dyXeYIXewJet7Zk?=
 =?us-ascii?Q?o+lsUS4+RHsBX0ebz2B2xBh39j5rgJlCenH5qbteGNNOeqPzyidOHjrvQjbp?=
 =?us-ascii?Q?t1bfBFj47f7b/OeLKwyCwem0b2bb9VzFrJ6XZA1W6RaboszRDpEUnWQyiGyB?=
 =?us-ascii?Q?SamlC++d2GvlZK/RafPnkyFsQWQ3wKoHG565VE+CBJIKUy1a/80vyR+EBfwA?=
 =?us-ascii?Q?Miv9vB/24QFxILRlthBaNkquyqDiFhcR/wDEQF0PrIe4jFi2r0g0E9slhGPg?=
 =?us-ascii?Q?744sXfN5XXRXQF2gAxqJ2Hb2/9I6EXlFMQDYXqonFf+GsTR4NLI2yu9n7S6+?=
 =?us-ascii?Q?UWI31x0P88ZUa/+k8m/6D9ni+32p9sY3eHB4Ib4obPU8IFlf0+TLOSaasPae?=
 =?us-ascii?Q?cO6/jpWrBPRAS5x8Xw1vIWvDH4WbqPnUR7KBg9aAYhvg+eADYMZf4xcFhpIH?=
 =?us-ascii?Q?e1nyKtR6G4IqCMwyxqZJLse5qiY5DFOxU62VQzarvNjqnQC2r+6CGbq5TqvR?=
 =?us-ascii?Q?kX6S/sqeI8yIHE2rHwFFx94JOfPGhRItLZGlweiXf9HCbBdbOBRkSCVhW3Q8?=
 =?us-ascii?Q?ttuTDxZDAJo0BH5qK0Btz4oLvn8RLcVAvgx6BxUk5J+WjqGKbJxEMaN8s6wY?=
 =?us-ascii?Q?SQAjhUiUBfR+IhnZRlvvldbDoiW4ErhgFDOvw5aSB2tJaAO0tT1OpblJnY0l?=
 =?us-ascii?Q?nhh2lQwypO17qr9QwMxcvxtpDSjk/xkbf4wcx3MtCu5jJB1cHg1Na5RZlLFG?=
 =?us-ascii?Q?kwrRmXcsavHUOYPy1astDfVDXX0qAAjiYMNkXA28bhD6PlBpaPKLhf9JC8IU?=
 =?us-ascii?Q?6UsT6uuh/gOwlA6M552TP9fpaIGOyC5OykvYsCNr9f8mh/j8aUFERGt8O+GW?=
 =?us-ascii?Q?9CRmvCOsn1GZZw1shmaDv/YIC+md9EJ5w0VgNPP6oQmYRsb2bDXoJOkpL1vH?=
 =?us-ascii?Q?gR9RyN2JndxKMXg/J+ph/01EcJMup5QN88SI3q/JwILu3ZUhOIvyHwRGqSLR?=
 =?us-ascii?Q?D46KGQXvids1TNzVhmun0o02IrIgOYuwp8DQxJTDvOLI4ZpSTWIGQc8SJMll?=
 =?us-ascii?Q?KgFmUluILzOU8AqZ9Pc5rXmc8OKVaX+PFeOT2HaMDNPyiu35Rz89ed5j3+MG?=
 =?us-ascii?Q?0NkHk2tVyKVaA6H/E6o5NjO8rQCITUvOyJZE2Fa/xTMcgqVoh2Lavox7hVjO?=
 =?us-ascii?Q?uEBzdZzzNcUlWDL/ClycANjhyr5btngRoFyAeGGhzW87tHe/QhqztMiMTI7V?=
 =?us-ascii?Q?bTJ0KfImGPthxOiFdlBQdCdGM+K1UI4GDUCGwUva+tx3nQWGYonAS0abI6vl?=
 =?us-ascii?Q?jDXfxArkrXkqGTFqdtk29ZzInbzXsmtovvSf2Lu7/Xb2QabveSNhFdN3oTws?=
 =?us-ascii?Q?AaZyLl3XsybXPYy/W8nJhEhunLtsRZ8SC4hx2+xxHLessJ9oGxyLTKvnibf6?=
 =?us-ascii?Q?DJdtzuP9CWu+Ax0P0F9kt4U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf2c505-7590-4f3e-5d43-08d9bf4c2b96
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 21:53:32.1986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rElCs6qfOOS2SvaUIdzlqO3j5qZNhtthsp6wg87V5B6YhqqoaT1Z6B+B0XkmqvPJfMMsVob3TNuiqWjzK8Seaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2603
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112140113
X-Proofpoint-GUID: d_J2KTstwR29MRiuzvAc5R3rtGs8xiVY
X-Proofpoint-ORIG-GUID: d_J2KTstwR29MRiuzvAc5R3rtGs8xiVY
Received-SPF: pass client-ip=205.220.177.32; envelope-from=annie.li@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: annie.li@oracle.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the PCIe device is hot-plugged, the device's power state is
initialized as ON. However, the device isn't powered on yet, i.e.
the PCI_EXP_SYSCTL_PCC bit isn't set to PCI_EXP_SLTCTL_PWR_ON.
Later on, its power state will set back to OFF due to the non
PCI_EXP_SLTCTL_PWR_ON state. The device is invisible until
PCI_EXP_SLTCTL_PWR_ON is set.

This may be appropriate for general PCIe hot-plug cases. However,
if the device is hot-plugged when the VM is in VM_STATE_PRELAUNCH
state, especially the system disk device, the firmware will fail
to find the system disk. As a result, the guest fails to boot.

An extra flag(set_power) is added in this patch to indicate if
pci_set_power is needed. After the device is powered
on(PCI_EXP_SLTCTL_PWR_ON), its power state will be set as normal
devices.

Fixes: 090b32b8dae6 ("implement slot power control for pcie root ports")

Signed-off-by: Annie Li <annie.li@oracle.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 hw/pci/pci.c         |  1 +
 hw/pci/pcie.c        | 29 +++++++++++++++++++++++++++--
 include/hw/pci/pci.h |  1 +
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e5993c1ef5..b61c547291 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2186,6 +2186,7 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         return;
     }
 
+    pci_dev->set_power = true;
     pci_set_power(pci_dev, true);
 }
 
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index d7d73a31e4..e4ff23f3b9 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -28,6 +28,7 @@
 #include "hw/pci/pcie_regs.h"
 #include "hw/pci/pcie_port.h"
 #include "qemu/range.h"
+#include "sysemu/runstate.h"
 
 //#define DEBUG_PCIE
 #ifdef DEBUG_PCIE
@@ -385,8 +386,20 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
         power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
     }
 
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        pcie_set_power_device, &power);
+    /*
+     * For devices hot-plugged in RUN_STATE_PRELAUNCH state, set_power is
+     * set to false to avoid unnecessary power state changes before the device
+     * is powered on. After the device is powered on, set_power has to be
+     * set back to true to allow general power state changes.
+     */
+    if (!hotplug_dev->set_power && power) {
+        hotplug_dev->set_power = true;
+    }
+
+    if (hotplug_dev->set_power) {
+        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
+                            pcie_set_power_device, &power);
+    }
 }
 
 /*
@@ -475,6 +488,18 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
         }
         pcie_cap_slot_event(hotplug_pdev,
                             PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
+
+        /*
+         * After the system disk device is hot-plugged during
+         * RUN_STATE_PRELAUNCH state, its power state will be set to OFF
+         * before the device is actually powered on. The device is invisible
+         * during this period. Hence the firmware won't find the system
+         * disk to boot. The set_power is set to false to avoid setting the
+         * power state to OFF.
+         */
+        if (runstate_check(RUN_STATE_PRELAUNCH)) {
+            hotplug_pdev->set_power = false;
+        }
         pcie_cap_update_power(hotplug_pdev);
     }
 }
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e7cdf2d5ec..753df3523e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -269,6 +269,7 @@ struct PCIDevice {
     DeviceState qdev;
     bool partially_hotplugged;
     bool has_power;
+    bool set_power;
 
     /* PCI config space */
     uint8_t *config;
-- 
2.31.1


