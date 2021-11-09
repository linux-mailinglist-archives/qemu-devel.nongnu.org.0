Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B30D44A009
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:54:47 +0100 (CET)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFPS-0000lC-BM
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAc-0005es-HU
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046W-0Q
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:23 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A901USR001194
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=YBaA2VeIu4CgbO7yOsCjXGViD8KNexdoMr5cVFzIqy4=;
 b=WMoEPA0m5y/zSOAmkOXMs1OgFeUYFXRSa1HHdgWM5npNRIeI/q9Dg+u448/rKHo5W0MC
 oKJMem3spwee+tZKtOq+QC+b05qK21BzLgXtkvgxety+WbPGSslCGnELZOoyPXA1PMjh
 QV/kxhQGyEPupW4i0Hk9pWe9dvWQNuS28CEajvCkFx3BKN09TzX2dlpEwAWEcPjk8acQ
 xwAOiXPmzSr4E/5de+V7vZ/zd8v71CLPQmhimXZQQPZ/OvvOVcfoDxboYUSJr5iTujD5
 XNUzapxuWLcK7RTnXpaJaS411MVuAkXqAQ1VULe7LbNanmIFj/6V/O5lXa17CkPjzago gA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6uh4fnp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLN2129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRw4pClL1DyNb4FBttJ5dxhSNrYRzjIO1gHP3ljmXRxmretks3oiFzUzaeC1okp+xr48ahYwITG1PritlwoJT77y4pBgQ4X1uCMtBVHsn3vkRdTOHwNhfylhbisqRrM6r9ho42fXWNOH7UOTNP5EHjUfJCEYcGoTvhtgw23YRH7xE1f5DAY2HQCyg9WlFq2Jk5FmehRrmhYsl0K5nYiVZWb2DrQsY5LHZQx8vmTWQ38SpFpIB9vCxZuMkawsOXcnBna3YjsilQfHedWEM3wff+wUorU/nWlDImBBlLyncOZbF9Fud0ervrig+c5pI4+2rwI7PhCT5jv0nyXCCh8PLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBaA2VeIu4CgbO7yOsCjXGViD8KNexdoMr5cVFzIqy4=;
 b=oObzeBKA6GW947yL3DXSymQSm9TvJUtOVdWWR6DiIzKajIR/XZCZJ/PxED/lvuFLuBMd/XX2ZrtVsOy+PNiK/b+9LZBjAPn4cB+dCs98S8hiD9rD2gO6whRhy6KL/98UuR2hZm1A2cvEwd/g16NrJF0f+l4VcgfQ3UBApXY1FanWuMi5nEDAy0VkAZB7fjTaDjPa8+Jj2T+jhzMLEFlDWypVEVyx8xPIqoTkYfZTlOxEgiUIiShAVoCdP+Z4CT/FtRdxiW+zZpOvlFoH3tNpDdsu7Xh+CCqv3vTWs0tY9pWW9zc7hQ+anUTid4BZ4GDizoIQy99ihXuxOH3tEWShZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBaA2VeIu4CgbO7yOsCjXGViD8KNexdoMr5cVFzIqy4=;
 b=vGwMNbIvkjOOdrji0/jWDvgL/bZffE0+OW2zIulUoD9/cvTDpv1QHGHLf/NWmBLCw8hr5AHOVU+rWM+Xgbra3rngzF3b3AZiTsfCG69nsRteZwVgfT+S41ovLGgCpgvM7GAvAEpYH8wTUwWhXEiWVetqn0FVL8x/dFb+qxhDpwc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:12 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:12 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 06/19] vfio-user: Define type vfio_user_pci_dev_info
Date: Mon,  8 Nov 2021 16:46:34 -0800
Message-Id: <28d95a317e70c418dc054a59db307d9c49411ca6.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f96f138-533e-4bbe-37c0-08d9a3195949
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB4068FD659BD3F6DFF81D4F91B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p5hDSFrHo/echZQraZ5Rs8UtD/R/lsCA5OQmLEYKkfKoYn2gsQb75OPj35ApeuvxNov4y35DI7ATZ/2k47lbF97tNqAiH4GD0fi7OE8+YCqoJ2Ew+GOqIWuNKcIn3uhtCLzS8gzNYhOuHOINBcLKnE4gsXjab8AHXm0LfowTt5BzNI4yn4knN/ilBvpyWl28UYB6IsXsaWdunTAGQrJoGj4g+DXNzXFvThStv5G9J1ZPOvU5XtvN913NGJ5OE9QQKM3wPbbNPjsMY6AGt5EAqL7JwN+q0NGjrOU5Ee7hc1ZvHD3fU8b5EjPXmauQya4HNMUk8TrlcHTOU6Av3lZLG8nvMLu94yyk0PXkE7RGdpJFet+dN/1BKdeAfUAjb7+TInKMTromTqkwNqcevwUFzLtrkt4GERYk2mmUgoRyDVd3bDbpSQUs0iSgEQ8teC042fuLP99ns7Kh7gpT3JUVMoA09UiJtaJFop+jEW9TuRSNmo0uPQSf0lUcovRRKFmgA8SgCttra/MlTvdr4tRzbc/nszwpiAtYNTSJFdSMZTHGrWaRguyV2Qakle6v01TFZUMfd2rTiVGDpyV8c4BQ7mvizxa4LqhhQ8XgT2IqwITtwImMbepX+YtoU7Gox3ovV3UXHa1/gzwdUnRqy1neEj4Oe+pU6ZdttGTZ8hpU/FFs7hET2leBUB+CnEhSKq3hCUY2wLPdyJOnsguwtiP3Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C1gSWvzFiXJ/68yv8APf7SDVhfcxqmSQi+XonaMQYLAtPUoNu2+fUXpIdxIT?=
 =?us-ascii?Q?upg/t37sZtd+j2Ey+vsto0uDnzT6XmYE5ha9LOMcpbrR+XwmniqzAdM++Cna?=
 =?us-ascii?Q?7LY01t2FfFPCaY+MnJuyVWsjB/ysky+7/2a2D9X3KYY6HPMP+DAjmHbR9+y+?=
 =?us-ascii?Q?FzzTwd+nUPuI0wQ/hGYeejoAiGWBxWzsFPVjOD/gOnbjML554XmhnYlcNG4+?=
 =?us-ascii?Q?3wtpvSKM+2YCbhPskPIUWXyv2p11qQOmjWdbk3M3bqLoDoECy5YWObetnMjW?=
 =?us-ascii?Q?kOQli2mW0L1irc/SBpBEi9lzd6Z8sZ3sBSFSODUSrY5SUYD07in7oCRO7y4N?=
 =?us-ascii?Q?DPmv5tDaKVUhIqHYbEcewNIc91aop7MriYfGrz2hn0jqQomLpYOfjI+Rg/K5?=
 =?us-ascii?Q?iH5dOT/pkveZjkDmzAEABr25gaZ7Uik8mFUMMwvNyKHLY6ZLb+6AUy8W8eTN?=
 =?us-ascii?Q?Xw37Uo69eRuS+sIzbgJelrCSrrXG9OtDUhRHiYtD8CoMNKslPf3YO+/acEKw?=
 =?us-ascii?Q?tnhH38DvZDxnHn0bSiwCzMMzWxxYveHHEqUggoVog9ZgPUpQrjrbSkEfQBKm?=
 =?us-ascii?Q?ssP9hd6P4/m6wxpASF7nL81PQheF5rEks3QVf12R9qY41wVNnLOsXyu/WMet?=
 =?us-ascii?Q?nO7Kg7moggBU9HeP3ACvuoOZQ3Ew8352iJwcWZ/uV+cksb2Rpp4y00IH40cz?=
 =?us-ascii?Q?dze8/JL6xb2v+2UrDeGB3z61sT9HliungA0QCnQknJoVNPliyjrAAt46epaA?=
 =?us-ascii?Q?UG/L42wWyfnIeTqjZafHHXKKOm3GpZ7UdhMtvNGQuGa5bqItFY4/oI5poRIG?=
 =?us-ascii?Q?BB6JSyc6FEyMiPqajhbC6V9qecDkXu+UsKdNOdOFgcTV9PbU/AkyaY09U+I7?=
 =?us-ascii?Q?LzkeRgaghecbzJzDEudJuPfx6rlYMraOKXhJ1M0jh3nSqpXBtlfm87WD+f0O?=
 =?us-ascii?Q?Gd26JWBCwnVDNw3FQO0yR59ziwPhC1JTBRipL0Z9QCSaTyoa5sd6jp7WZlUJ?=
 =?us-ascii?Q?HjC4qXQPRX48QdbKhH3mwrg815jDM/A2U/AhmMoObFGEVW8qATwBwmF1dvd1?=
 =?us-ascii?Q?7vJXdZw8Aed3GFad4REkFXwIWVBoN2HPGnwrhofJwPBITjQRe1t6i9a4rEtd?=
 =?us-ascii?Q?OjJ/dU82SytBpOwodi4Z8LTdUqoeAd16wBzaXZfl/yAI+fylbCmwIu5IosuW?=
 =?us-ascii?Q?NgB3+fvTMrDrUyuiyEhTkXXDnLM3NrhwoWZ63X3hv5S9WkEkeiEa23v6TIuJ?=
 =?us-ascii?Q?T+jEAyTGvT2yGlTOXemddP2bfE9kwSHsHsrqIVd4UL25v4x8be6XxcnEMqwR?=
 =?us-ascii?Q?+gDsUnduh0bEyhZmYkbx2sPnpOwrjjiezmz6KRFAYL+22vK2sQCnhpQPv/P+?=
 =?us-ascii?Q?Rn9gM1Arx5XAugAy+jRzWYBWiNTULQjKei0IQDMSbxHQf/tHoMebcLW5Zg7A?=
 =?us-ascii?Q?BpT196PjDF4whv5qCYirQZzG4WE41sO+Rhr5qEHYzCyNUJg7u0zm+Zp0uR20?=
 =?us-ascii?Q?yDqIDoTjNOs+pSvC7Yg2jh9MeLJYY4wlZ0QAwaSJ6YldWRUWSqV8dZha23U6?=
 =?us-ascii?Q?o2QQZwZYhSF2qzeOHmpLr5PJuda8wYz1KSxuqodVp2hMg3xLRTL74AEGvVt+?=
 =?us-ascii?Q?HlALBOabJnsGH19s7QXR97R8WEVhvydeLR9KaYbUec7WVUt2Ac61UyeIJyDt?=
 =?us-ascii?Q?nN2dbQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f96f138-533e-4bbe-37c0-08d9a3195949
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:11.8161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prxnfs/1NzQ9rPiRDcNgcCXC0Wnc+FTLsqCpocQqhbvFnw6WuAqGTAeH+oCZu5yIbMgxNoyux1sro/drS9R3E09wEWg+tWP0KXIjutruxwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-ORIG-GUID: mTMV4-pe7WtYv2wmsmOMAAwfbFZffKKf
X-Proofpoint-GUID: mTMV4-pe7WtYv2wmsmOMAAwfbFZffKKf
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New class for vfio-user with its class and instance
constructors and destructors, and its pci ops.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h   |  9 ++++++
 hw/vfio/pci.c   | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/Kconfig | 10 ++++++
 3 files changed, 116 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index bbc78aa..08ac647 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -187,6 +187,15 @@ struct VFIOKernPCIDevice {
     VFIOPCIDevice device;
 };
 
+#define TYPE_VFIO_USER_PCI "vfio-user-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
+
+struct VFIOUserPCIDevice {
+    VFIOPCIDevice device;
+    char *sock_name;
+    bool secure_dma; /* disable shared mem for DMA */
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 6e2ce35..fa3e028 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 
@@ -3438,3 +3439,99 @@ struct VFIOValidOps vfio_pci_valid_ops = {
     .validate_get_region_info = vfio_pci_valid_region_info,
     .validate_get_irq_info = vfio_pci_valid_irq_info,
 };
+
+
+#ifdef CONFIG_VFIO_USER_PCI
+
+/*
+ * vfio-user routines.
+ */
+
+/*
+ * Emulated devices don't use host hot reset
+ */
+static int vfio_user_pci_no_reset(VFIODevice *vbasedev)
+{
+    error_printf("vfio-user - no hot reset\n");
+    return 0;
+}
+
+static void vfio_user_pci_not_needed(VFIODevice *vbasedev)
+{
+    vbasedev->needs_reset = false;
+}
+
+static VFIODeviceOps vfio_user_pci_ops = {
+    .vfio_compute_needs_reset = vfio_user_pci_not_needed,
+    .vfio_hot_reset_multi = vfio_user_pci_no_reset,
+    .vfio_eoi = vfio_intx_eoi,
+    .vfio_get_object = vfio_pci_get_object,
+    .vfio_save_config = vfio_pci_save_config,
+    .vfio_load_config = vfio_pci_load_config,
+};
+
+static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
+{
+    ERRP_GUARD();
+    VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    /*
+     * TODO: make option parser understand SocketAddress
+     * and use that instead of having scalar options
+     * for each socket type.
+     */
+    if (!udev->sock_name) {
+        error_setg(errp, "No socket specified");
+        error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
+        return;
+    }
+
+    vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
+    vbasedev->dev = DEVICE(vdev);
+    vbasedev->fd = -1;
+    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
+    vbasedev->no_mmap = false;
+    vbasedev->ops = &vfio_user_pci_ops;
+    vbasedev->valid_ops = &vfio_pci_valid_ops;
+
+}
+
+static void vfio_user_instance_finalize(Object *obj)
+{
+}
+
+static Property vfio_user_pci_dev_properties[] = {
+    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vfio_user_pci_dev_properties);
+    dc->desc = "VFIO over socket PCI device assignment";
+    pdc->realize = vfio_user_pci_realize;
+}
+
+static const TypeInfo vfio_user_pci_dev_info = {
+    .name = TYPE_VFIO_USER_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOUserPCIDevice),
+    .class_init = vfio_user_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_user_instance_finalize,
+};
+
+static void register_vfio_user_dev_type(void)
+{
+    type_register_static(&vfio_user_pci_dev_info);
+}
+
+type_init(register_vfio_user_dev_type)
+
+#endif /* VFIO_USER_PCI */
diff --git a/hw/vfio/Kconfig b/hw/vfio/Kconfig
index 7cdba05..301894e 100644
--- a/hw/vfio/Kconfig
+++ b/hw/vfio/Kconfig
@@ -2,6 +2,10 @@ config VFIO
     bool
     depends on LINUX
 
+config VFIO_USER
+    bool
+    depends on VFIO
+
 config VFIO_PCI
     bool
     default y
@@ -9,6 +13,12 @@ config VFIO_PCI
     select EDID
     depends on LINUX && PCI
 
+config VFIO_USER_PCI
+    bool
+    default y
+    select VFIO_USER
+    depends on VFIO_PCI
+
 config VFIO_CCW
     bool
     default y
-- 
1.8.3.1


