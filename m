Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69D4986C7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:29:39 +0100 (CET)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC39u-0003AK-I4
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:29:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yI-0005eC-94
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yE-0007k9-CB
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:37 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OFvXKR019284; 
 Mon, 24 Jan 2022 17:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=M7shX+udWDyI/X/h9Q8erI6Ila9OwmMPFOJFsBrSp4TxYY7Is7b7hC3a5AuDMBXoyCSW
 KJEJYp1ktCpBlIzXd5Qpy4Q/pQaWO7LKFdC4fzhN9Fx6OSK9WteHfHvAQApylOF60tE2
 KJwjKtE/iq8glAr1LOzwmMEr8cw/k5wc+JwF5GPjgSImrAfLTJWHZP93t8exxSafBEJ3
 JY0+2zTWMJ4O27S/MjO2hYNB7S5FDDlFNS3NEQHh1zQRfOawimIn7RrmSfa+U8rks8Gu
 E2BTWRN03Kgm6yMTSTMPi3rF3eYPrqwE7ZbpPKaUJAle9/ZHdLwydc3X2rzKmdopCRBx 3g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy7arbfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHAiEY051735;
 Mon, 24 Jan 2022 17:17:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by aserp3020.oracle.com with ESMTP id 3dr9r4djfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bd+ltc2G4vvdTk6fjUUmMvjRkd1aHJ/CaUQCyNYYuFQmR4Gk0oopn1nqNn4Wi4SKDb+xckoDAvKjYsgd6eyhVVSo3CMchkvAy/yOHMX0r8VXJNvmrp0o3Tf4A4QwLGEolPaINyGuxvxBd4FTCVo7glgbATkPxxyJfgrkksy86eWBJ+Yg9Ti0GZBRre5guZZQbUDhuzaTRD0qQYGv4+Gsau2h9Z0zFe0fF2EOepPeYndeyCZH4MIhqO9DNxGATZYRhKnGRFHD+9VQuprEDnvYaKKcECPq2P84ABlVWl7aPxzAYt/itY1xhj8u8EFDyjSn+0m5jiY3dvlybuQLS5DxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=YsyDz1jI21Wo71yFW2f5439yn5Ie7z0tak2z8N/xcPi44kz4hYdx5b6USYYk9L1MJSNf4DXCRMS/hVgITWuIrlVqDVgn1rRbO1izh2W4XEeiT+GzBlJzszNfZGibQ+RWiCqAa0I+UyJOY66kUcTdEPF4Y9U2Uxte/7fAB/wbfGkCgfdRQB3t9x6wNvtWFdyHt6g5ALoqE5OGuC9lwCfkOU8LyZEN88V0A9aF0gv+pqhYXCgM2RpR61C8H/wAvHEptoDD01JDeRQ02eFkKhlHcxWQ6/JtDwaECJ4HCZJb65nIP3eTCqM4oJCFzGLxow3LVzerh0TBd1FuXDUQzmn5jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=tSWeXp+cLuTkd/lFREQlvW9Y1afVm0Z84Uxf92ms5CrhfSojd8QLMBlqcSm0r96uBaQUjoOrVU0FytHckieKIcRlC0vnkf2NPxsDcxuBBi3zP8qEbguhROkQwvpY3FndNa47cZ2HqIzQ8CRnPu0LRxzAAb+VlpBxwqButnhhIkw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR1001MB2265.namprd10.prod.outlook.com (2603:10b6:4:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 17:17:21 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:21 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 04/10] ACPI ERST: header file for ERST
Date: Mon, 24 Jan 2022 12:16:55 -0500
Message-Id: <1643044621-15892-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ca5f58-23fc-4e30-d78d-08d9df5d619d
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2265:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2265DC2992A036AD8FC5952B975E9@DM5PR1001MB2265.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zL7iEM+cQ5horwlEyWYFZELFOKfVl7+v8Plg6Mss+YZok5QAEkWU1gMSyFbIO4dPpjB/wZ0O6avFVlV5CUn8IdmzZWN2X7N8DXTCJoDDmV8iB3bHf2uDN/dubwTm0HWGQNBoY+oCu/AxsFIKHkzzH2YH3eki5TVG6gwLxSpBPsz0GZEshNiApgQ8asJ21T9hdcXlV+84w5E1rMA8eGwsX6Qu9oGk+x0vEU0Su98HobnsLVPIPl+dMJgbEsHxKl3wVtbaHsL4AmONu7MgjqNvVSTeR6Asfqu8LXJUE2n+HRuunbfYr5z4V3KAfpr7wFESMNGUobg3OurXQtBKv1ri+AqdinD+nwkMzLeo40mYwR1xb00eyv9oKP0xCeekzKNbVgmMYTrd+RS1dyUQAKBH4y+9fEPNW/iCoDSWYLA9bah2yPAJ6JrbaSh8gWhIRbHH0gHbIlW8MxDCRnIRwaQhOFWHmXDOzVEyA3+aOZhCQajFFnZ5dnM25462zufDgmmDlQ/J4Sx115V8CWEOnr/lt/eGFbRg0guxgpNFhsSMb7XkWbWGzOp0uCAg1VdLiunqVwwjX6Gaxn8d4zkK9EhaJMNmXAIiGHYUbclpRd1ORm16g6RCVe3Wdd6/HYpaDpHNC4McRUjMq32WhsP9kVVkzgwDDCOgyEUFiTiyDNJ76WoA+Lo2EX11XoMhZ1lv1nr07/DeUBBqhFCCviUPTWEmQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(5660300002)(508600001)(6486002)(316002)(6916009)(66476007)(186003)(2906002)(38350700002)(38100700002)(36756003)(52116002)(4326008)(66946007)(6666004)(4744005)(8936002)(6506007)(8676002)(26005)(2616005)(107886003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9aVKytjDuOILzLdMAmyXVGAaezHqPUz6/eP55TWbIijcDC/l1t330NTqRnpo?=
 =?us-ascii?Q?NXam5XA5WdVaWB095d5s+bCNvl9wWvo5sLtt1YpQNYpbvNTS/mRq7GSJgEkr?=
 =?us-ascii?Q?Gk+Z7Sk4XhoTUapngusFTiCSn4DV+NVqT14Zcx2WhCnAxws2XxXsBry67xua?=
 =?us-ascii?Q?yDUBf9qcu14INHSl9lfbRkK1bkTTEMKrL5VSQrNOVwJTlKh+27YFmpYtPINM?=
 =?us-ascii?Q?ykJtaz/Q6RcvaanSeUlC4ggQ6JYSNHrbI7LIKOlt27xY4a1Mf5NiC5FewqNb?=
 =?us-ascii?Q?79fNJjetzzt6gLEQeU4evWo4cid8b/JK9Dz73+gegMGo9xpk2PB5Y2+8bmxp?=
 =?us-ascii?Q?7llGezzGaulEXsx/z7neGkF616mhgGNXaFqQbqZnaOV9x4gMSWW859EM5H6j?=
 =?us-ascii?Q?jRUClOjAPBMdTVdSgFtQNygmpZcbbt2XCF/ElQ8ln0yzmkH2HRSE0W4ilBNj?=
 =?us-ascii?Q?UMCmMqOHGvbyH2R2DPCeJA5XpE7q5C+iMDeVVKaf15JvbNNs5VGM+mZ9sCtx?=
 =?us-ascii?Q?U3Ln7puvAf32NHeQfvKJr3VGbWZ55jml68EkoPh53eLnlO1D2n7orPL5aeBJ?=
 =?us-ascii?Q?VU4DxfpqEhbJ9H20ODkbkRA6joODy3mU35pwhgweoLRe90SK/b6r0VcWdVNq?=
 =?us-ascii?Q?vBhnw1ZrtAma87K8P643ghiboukmRjyy8eCZAHH2omZ044FvK3lglLMlTYaa?=
 =?us-ascii?Q?CoRTIWPJ19ueCmkGt69UtK6PEz3463+q5TtR0mwy4c+409wBCQV4V0oiU5QW?=
 =?us-ascii?Q?0RO4AFG5gTgwHhqGHRWokkZoS9y4FBhXIVfH/dc5XqERDz+qMhhVo3XsyAjc?=
 =?us-ascii?Q?7ANGM6ZXEFuGoBuBtMRdtJ9gLqnDv8TO7wpNtIde2lGddIV6anjl5noTzoLj?=
 =?us-ascii?Q?kZEaeoouN+gf+piXRcmdEYMLsitKBtfKaXSDRX/diToE+ZNXt+SRg7bvfqTV?=
 =?us-ascii?Q?FdEY+oLSx3tNG8IS8Ag2uz1Zv1jnMX0WAYzyxTAPpJw3HfsPpwPWsJHA3H4a?=
 =?us-ascii?Q?5EMVGGdpyPDzwS0ZryCp1sj2TGEMPY2HQOC4PYivkS++8qkVx7RPr/jATTJP?=
 =?us-ascii?Q?A501rjayx/054yBSnIAguYKHndLloISvJK0sopVWa4IeGBZHT25fcWkqfO5J?=
 =?us-ascii?Q?I5nigM7iMyw+GTuD+0BKUR0NhNMpJ0+eBn/D0/6gO0WBKW/60oqgTrsu8Dan?=
 =?us-ascii?Q?KYKk5JH9NZWhuJCq3Su4Iie66bTgsO+pcs7rHIlsOPHrABKihZp/19cnFQ/G?=
 =?us-ascii?Q?1UQutIi1lDoaLlk5ANVvgWA5mAS6vivE4B+0W0KtrRKHJEsJMTVaRnDWSzVe?=
 =?us-ascii?Q?iiHe47nCuu7JcYQ6MXf3hPonGD7WVObgZVZ2aikSEiTu0xA1kHEinM0Dlhv8?=
 =?us-ascii?Q?s0b4m1BHWM6X5Ex5cWGP2orrHbl+vkvj3Jj5WdM2xnOAvKaom2nMhIkPkHMk?=
 =?us-ascii?Q?IGZr0cG7QwmLKd8l2r2Tn6d3fxY7Yvm2OtxRnG8SXYTw44oz96YdbmqW+su2?=
 =?us-ascii?Q?3brq6KPLiPUDwB0Gsve4HmjhfaHmMF1YWA7rn3eGQHLmdPokDm/WAs9u0DS+?=
 =?us-ascii?Q?Ik+Mot+Z7l1czB6g0oADvkX0CA4Q2u1Li5Ea8vBP1nEGLnqXt6ltyxEbTaSI?=
 =?us-ascii?Q?xmFNL1pryze7idFy95BXgnV5f9TbgLnU9sg38Yr2J5YCzqOw3Hh6RnG4qD2q?=
 =?us-ascii?Q?FYFrFw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ca5f58-23fc-4e30-d78d-08d9df5d619d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:21.4197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHrjLOJATlI886ekZez8PgPzCdhGnTTwEQJ90PoVHiHxxv/zrQAXZfIsJXw5Yrn57k3hFahB2k+cJhYsrx5GgHnRXjtLtM7lGA3aYyFmsLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2265
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240115
X-Proofpoint-GUID: GO3M722wwGT_J3cqwxNOAOCAb1fo8T2l
X-Proofpoint-ORIG-GUID: GO3M722wwGT_J3cqwxNOAOCAb1fo8T2l
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change introduces the public defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/acpi/erst.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..9d63717
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,19 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+                const char *oem_id, const char *oem_table_id);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+
+#endif
-- 
1.8.3.1


