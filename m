Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE0E51C611
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:28:19 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfGy-00061B-QI
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0m-00063R-IZ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0i-0002CI-IM
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:31 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FpPqY018740
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=IItzUkMRhj29kZspoVTdwkT1Pk6L/mEgCGr8ZyZ2lUg=;
 b=UQVtf+NO6fQoX5LrqoydAdZEpbAiXbX+sVhXe434baoL8NnTH2j5bwC+xM+ZZan4xrVB
 AJyLac8VwHXZDUe/lYeuwTneqYQ4QF+kdx0blnHxmyeBTlVRbi5K7tPsHQUPMqFSRoNe
 bdNbowNQiL4YyzjEbl1kwsiLAFwt/bmqYDFBaCTLp7OJiDzGjQ9N3gRcebrDjXhkQqSw
 bceBGIIHvmmVaVCl5nCr/JVcpO1GB5WN+tGS5d6IwloDt7T7gkaDVtmz1myblRt3B7SO
 ei7GYkuQ1quB8P+PgQsvNLciykkv7RrMvijA7nD6KqC3acr3kExcsj4AkZ0STKkMWXOi UA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntc3km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:25 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0Zqe006282
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8ybftd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XW0Y3PcDBxKXh6Qa6vcwN6FkNiPsMTwSS6GGgsrQ/CgjUNBoEiaf5ASpbovTvorKVsUScuBQP3YBK7VtQO4hVj6NqcJNl424QtU9s3Om/uHMkkvI/ieYRtmMRaV9Ez3Z0qW8rEF1kve5X6YqA7w2jLTrfxGKqudVqqkSYg4BxypscPYSoVpH5sn3r2+Gl5KZPAYHAORY+s567D+H0kW9DvrI/t6PF6bwp2+r42BJYKES9K+H6PDOnlv0/n+LH/8Nza4kn8l4Q0Ljbja44nBB/pfv3+4j8I3JulfMQbBabCSFWuo9b+1S3qNfxAE2jvM3goSVvJTI1GIEfxB/hJ8O2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IItzUkMRhj29kZspoVTdwkT1Pk6L/mEgCGr8ZyZ2lUg=;
 b=Pbi92TydskvdlOEXId+aYr8jogf6RTyGNDJ7tdFvXzA9peq6/s5/F7bTixBDZ0M38SWoyAkF+i2+uVRIDwQMD/IZTTzYpl/8Prynq9JaATgPKiMSqjmP3j2owsxYaj0wWsuhK/rNTr6DVjxut2PzQIMMkjBsNU+wDNUBc2Q9h54mO4FOOYVLYtDdqO26ITyXZXJ7TIcys7KeZoevzGxx/FIirg8A7tbxlvwEOBePWsizMEHNYfR4ULyynX+b7tUlWqDJlVTfgljN6y0hFayL+wMika69vsaoovAti15A8EG56WHajNsht0LxpTOSGgqJr7O+Rdc1o09H6w2RVadV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IItzUkMRhj29kZspoVTdwkT1Pk6L/mEgCGr8ZyZ2lUg=;
 b=TsCMb/zQVKYe0h0GEs9B0bQFiR4H5+qEhY8GEVorXT4CNhSkb9XWpQPXvFzw7OOy9/3nplaqAhk8IuBWTeDluJOsMxIuMPjPJ9tiC7r59WBEws6LA/So8MnMP+tp2sZwu3kW15MY667wJ9ijj7jhXNBDK6gZUP4B1H8N7Fh5Yz4=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:23 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:23 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 15/23] vfio-user: get and set IRQs
Date: Thu,  5 May 2022 10:19:58 -0700
Message-Id: <788217d1a64b2b70097236ec8fec39a39a01aefb.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a8a0670-6bbf-4d4c-4348-08da2eba4655
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB268964E62E4807CE2CB81224B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fyct2qaHbtetHJsEC2bnx0kVbdzFYC/0a0TfgrWOMzT+5SeBw1RBVDcFJUFXCXCVdCo8Mz13TmW5H9p7kXR/zrPQoN9ef9fn3hmK0kbpOWUF5U1UspvFTBuq2S51xD9Wpldu2oCNF3VPY0IOMdnqwtyGx2JxfusXo/MNff6VMo1/JUCA2q5jRiu95WVNyoqlMnnj8MmFMUzmN5c3I2sX5uEWOhrdfwKGsTLYL+8o33GbGsIV73Bp8PYgbaOwqn75z8yTo3xzitNg/pROcvvcfLj68nYVcUfUne1A64w0WpP4d2YXtBAY0PlvFmx9FsaqbeJCUlwrPiRx680EiEGBYSRNXyzOCiZrXGamkme8BWldfR3GiFMZBSJNyuq451Hiw58Dx4h1FXNk2+91VHvoIaGOZyQXoI7/4whuYNiC0brYBcdoAj3x58CnhdFC6w5tMnc8QekKTw5lx4WMGxbOvZodXi/5vjVo6uv0iL1A/PF6RtQztj0tpSri083T34pqjX5bfMvF2XkXNOWWoaw1oONIimcR0PFizWnN0Pclk9nx1NGVLaoI8FvH6x+D2QkomN6Anxh7rZzdQEfSvbgvb+xZJ03EiHm01vH0ll5u5qBZyuFkuf7lSF4V9/SVghyLayGx9ZFfxuGWEGUxsO8Z7V6vm2hFE/MSaHyQ4bRN4hzab0BJK7bFH42BNdwDPR2Wl0JMTuxtMon4t8+tYS/+2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yoQNWuuTxn+0CxbUmzSIFszrT1hxZ+2DIQPI8XheCEXIkS5j4aeHi/+eFyPE?=
 =?us-ascii?Q?6CITcM8bA6gQ1cRtAiW6TSP3nowvf/B83r+w+m8rHnLPBnBzzHdXHbvvtDJU?=
 =?us-ascii?Q?74o53TAi5GsWRvixLp3IMKuWA8sGmg+/f7QOtptUwe7T5O0OM/sgJ5Yu05yh?=
 =?us-ascii?Q?JGBbZCEmQw0krsItUkYhxh/UCTLC9jBFUkvozvrNpMHqIfQQSO2pQZM3txY8?=
 =?us-ascii?Q?20fp9hmm5Qr9GlYw4XQbDttqagKPWrepcw+T+Nf1PJE44SpLS4tOIiYXvJiB?=
 =?us-ascii?Q?6tHws3GyDAXsfe/ry6pE1IKD0tTcaz6DyVexiKLMKva6bLeLoitpbQUMadUi?=
 =?us-ascii?Q?AfFGj71mYKx1GshL9JFGYfujQsTiZ7jyqh3KHG3409Z5LdEdFDr3SD7NPxxS?=
 =?us-ascii?Q?AOfVVBja9y7fwO6NL2LW/ArKwFJem0BbjYlTs5s+cm9EHv8xiZdztF33dyKf?=
 =?us-ascii?Q?mISCf05n8Ydo1yrUwA0xCMMcX0wKZVJfpzht4Y2vfd2/rtHN0Dl41styY6fL?=
 =?us-ascii?Q?zZgIvS7Yvigq2eLonmMPEaDz+QAOw+mA13iBtz+jP/2PDfEi/OsbogqKBxy7?=
 =?us-ascii?Q?FHwNNr7iJQlKKmBD6O8eSp4FPgC2NGcWwnMX8g1eljAEPDNWP+W/gyAadOzW?=
 =?us-ascii?Q?73Hbrsm3A+0F5Y5NwpJAVtC/P4/PgBnM/XdeUrIvOR2fvok46wtAPD/3pqr1?=
 =?us-ascii?Q?8TCEk9eoaOGH+jruSwtEg+PRdyG/BH0uDgZZqYnrl6u6ZUgzVhGwAkFTk0GV?=
 =?us-ascii?Q?TuY6JKKTszJbyVKUNp/uAzd9cYZv6AgZpAjuMcXCjQmC2nSL8VZ07ehvqBMJ?=
 =?us-ascii?Q?QJ3SUdO3dqx5R+Wb896Uve40fmJfYnhIgcFT3/RFJIopWmNt4cX3e/ambQ5C?=
 =?us-ascii?Q?ihmcpeUWP6+Yaq1W+iAav2KOlFidD12p6/cyafeeD41MRgFN6sSL6JkXJ8XF?=
 =?us-ascii?Q?Qm/jS0iCpoPx7Z51izsgL0oMMTOmU34KZicvyfDM2hFcCy58f3YjjuuldF4w?=
 =?us-ascii?Q?qUXJpd+8Wecwt/5sCNohPggkzvECAH9lKPqLixtWb/jXPk+vEUNCUveBJ1Fx?=
 =?us-ascii?Q?66AwLlszzYDFbjgSycvUj7TSJepCBm3RAZnIx0fiZNq+QHQuhpmPvR4DatNX?=
 =?us-ascii?Q?1/RV4jNShw6VilREwbUUP0IQDX5OwuGWxZ55+2nrOjh82nD31Pddf60JN/71?=
 =?us-ascii?Q?7B77tCg00+wPkBN97s1nmUjtIdlnRqNHj3f/I8qu/RWN9w0buBZ0EBoJX72W?=
 =?us-ascii?Q?nyn/NO+KKP0k1nuiIuFLidJgn8ZXjpTeaQ9ArNIKHjmiCPUGj8H6Tr3meyu4?=
 =?us-ascii?Q?4vLSaXCbfOCJqVX2kT2rLAjiHu+iswJ8eItJaGfLfR/PCWoIvIS0nY3LWxfs?=
 =?us-ascii?Q?Vzswg3N/zf/apy6IUgH3tYvA9aFW7Plk4SKTBNTTBnfKL5aOLr8WJRe2Zod3?=
 =?us-ascii?Q?x9M283pxQqrzuTvh8tvpXS/8poN2JCt/+pcb5FN+CA8vQ2OhEgNvpc25tLRB?=
 =?us-ascii?Q?Xgm70jg5NpE00zGIo9EloycVzx9fLfBIjKN3DB5azoVaHv97VZL4/ZDlZdnQ?=
 =?us-ascii?Q?cRkZcrAXre7zhKDE9bTfRCpQZ4KvC8Ylm/ZQOfoLqwHrbRPS/u7acAR/O69O?=
 =?us-ascii?Q?0pjjOZFUPje4WrawlNevELFxf7U/IM8uS1zbygzUMzaQKwyRSQcvH5sWvmw/?=
 =?us-ascii?Q?UEtEYH922ee7XMMqpnMcX85rhA3xdXyyj+vont8V5WhOPCGNc099ED7ktgCR?=
 =?us-ascii?Q?c9RjIWfeCcTeMlrufyGXlpPAu7bAK2Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8a0670-6bbf-4d4c-4348-08da2eba4655
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:20.6696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTBDAbVswBvWCuYTiY/Hq1aOvDMrRA77ahu3tBjzdSVeyu3MgwDA7u3U/JZiuFQU9WrHQ0qlRxBcprYDSvPMuMlZiuu2olSMGTOAQTQaBWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: E8O1PbP39BCLVBG-Ui2B1NogGWKXy6dG
X-Proofpoint-GUID: E8O1PbP39BCLVBG-Ui2B1NogGWKXy6dG
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  25 +++++++++
 hw/vfio/pci.c           |   9 +++-
 hw/vfio/user.c          | 131 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index b1ea55f..4852882 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -121,6 +121,31 @@ typedef struct {
 } VFIOUserRegionInfo;
 
 /*
+ * VFIO_USER_DEVICE_GET_IRQ_INFO
+ * imported from struct vfio_irq_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t count;
+} VFIOUserIRQInfo;
+
+/*
+ * VFIO_USER_DEVICE_SET_IRQS
+ * imported from struct vfio_irq_set
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t start;
+    uint32_t count;
+} VFIOUserIRQSet;
+
+/*
  * VFIO_USER_REGION_READ
  * VFIO_USER_REGION_WRITE
  */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index bc70968..0a4208b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -517,7 +517,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         vdev->nr_vectors = nr + 1;
         ret = vfio_enable_vectors(vdev, true);
         if (ret) {
-            error_report("vfio: failed to enable vectors, %d", ret);
+            error_report("vfio: failed to enable vectors, %s", strerror(-ret));
         }
     } else {
         Error *err = NULL;
@@ -662,7 +662,8 @@ retry:
     ret = vfio_enable_vectors(vdev, false);
     if (ret) {
         if (ret < 0) {
-            error_report("vfio: Error: Failed to setup MSI fds: %m");
+            error_report("vfio: Error: Failed to setup MSI fds: %s",
+                         strerror(-ret));
         } else if (ret != vdev->nr_vectors) {
             error_report("vfio: Error: Failed to enable %d "
                          "MSI vectors, retry with %d", vdev->nr_vectors, ret);
@@ -2669,6 +2670,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
     ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
+
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -3662,6 +3664,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto out_teardown;
     }
 
+    vfio_register_err_notifier(vdev);
+    vfio_register_req_notifier(vdev);
+
     return;
 
 out_teardown:
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index fb6851e..d0140d6 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1072,6 +1072,113 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
     return 0;
 }
 
+static int vfio_user_get_irq_info(VFIOProxy *proxy,
+                                  struct vfio_irq_info *info)
+{
+    VFIOUserIRQInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
+                          sizeof(msg), 0);
+    msg.argsz = info->argsz;
+    msg.index = info->index;
+
+    vfio_user_send_wait(proxy, &msg.hdr, NULL, 0, false);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    memcpy(info, &msg.argsz, sizeof(*info));
+    return 0;
+}
+
+static int irq_howmany(int *fdp, int cur, int max)
+{
+    int n = 0;
+
+    if (fdp[cur] != -1) {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] != -1 && n < max_send_fds);
+    } else {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] == -1 && n < max_send_fds);
+    }
+
+    return n;
+}
+
+static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
+{
+    g_autofree VFIOUserIRQSet *msgp = NULL;
+    uint32_t size, nfds, send_fds, sent_fds;
+
+    if (irq->argsz < sizeof(*irq)) {
+        error_printf("vfio_user_set_irqs argsz too small\n");
+        return -EINVAL;
+    }
+
+    /*
+     * Handle simple case
+     */
+    if ((irq->flags & VFIO_IRQ_SET_DATA_EVENTFD) == 0) {
+        size = sizeof(VFIOUserHdr) + irq->argsz;
+        msgp = g_malloc0(size);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS, size, 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start;
+        msgp->count = irq->count;
+
+        vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+
+        return 0;
+    }
+
+    /*
+     * Calculate the number of FDs to send
+     * and adjust argsz
+     */
+    nfds = (irq->argsz - sizeof(*irq)) / sizeof(int);
+    irq->argsz = sizeof(*irq);
+    msgp = g_malloc0(sizeof(*msgp));
+    /*
+     * Send in chunks if over max_send_fds
+     */
+    for (sent_fds = 0; nfds > sent_fds; sent_fds += send_fds) {
+        VFIOUserFDs *arg_fds, loop_fds;
+
+        /* must send all valid FDs or all invalid FDs in single msg */
+        send_fds = irq_howmany((int *)irq->data, sent_fds, nfds - sent_fds);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS,
+                              sizeof(*msgp), 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start + sent_fds;
+        msgp->count = send_fds;
+
+        loop_fds.send_fds = send_fds;
+        loop_fds.recv_fds = 0;
+        loop_fds.fds = (int *)irq->data + sent_fds;
+        arg_fds = loop_fds.fds[0] != -1 ? &loop_fds : NULL;
+
+        vfio_user_send_wait(proxy, &msgp->hdr, arg_fds, 0, false);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+    }
+
+    return 0;
+}
+
 static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
                                  uint32_t count, void *data)
 {
@@ -1185,6 +1292,28 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
     return 0;
 }
 
+static int vfio_user_io_get_irq_info(VFIODevice *vbasedev,
+                                     struct vfio_irq_info *irq)
+{
+    int ret;
+
+    ret = vfio_user_get_irq_info(vbasedev->proxy, irq);
+    if (ret) {
+        return ret;
+    }
+
+    if (irq->index > vbasedev->num_irqs) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int vfio_user_io_set_irqs(VFIODevice *vbasedev,
+                                 struct vfio_irq_set *irqs)
+{
+    return vfio_user_set_irqs(vbasedev->proxy, irqs);
+}
+
 static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
                                     off_t off, uint32_t size, void *data)
 {
@@ -1202,6 +1331,8 @@ static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
     .get_region_info = vfio_user_io_get_region_info,
+    .get_irq_info = vfio_user_io_get_irq_info,
+    .set_irqs = vfio_user_io_set_irqs,
     .region_read = vfio_user_io_region_read,
     .region_write = vfio_user_io_region_write,
 };
-- 
1.8.3.1


