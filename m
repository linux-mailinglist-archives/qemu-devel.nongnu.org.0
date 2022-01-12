Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FDD48BC01
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:48:33 +0100 (CET)
Received: from localhost ([::1]:55224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RoW-00048d-MI
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:48:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdm-0000vu-5L
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:26 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdi-0005gd-Ex
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:24 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMv7qc005893
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=u81A8Ca6WXFHcMibI8RE9TJa472X1f6evWVYufMRPU4=;
 b=diSjChV5o47lbohPnFf9e+9WNVmbYFgMmi0ITlna6nfI3/5F0VwsnDQTPK3NS+7AsOFc
 MzJA4ftIi/513a929PE71JDk3/OrIOPkzD72t8s4GSxxdNg4+BakJDStrKuf3NzItUOD
 Ou1+Ed3e2utRLicvHWpCnfE9OS4DwCru++8k6iSCGdkD/HKbfremGNOZAytg2qLTylSq
 EErkrCU1r66JlPJ2ZcB/5VQy8NIYzUdmgvyIiW3bmmoYAjlTiatez3mUWgjO/6s8RVhR
 rTYqCddbFQSFtXMu3ozdQNHkHklXD8DceLJJlhRGV812nSuLzejS4PfQUflKizEEfX1b mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgd1v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBG196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaNSEU7Do7/QrcLQ1bUqbnBD0f8rcJkGyNDvO36W4cU6a4DFzFgjG5Kp8uY9ypm5MazwHXDtOJTsbV+oWdAZ0fJ+ig8j3FsyR88BgGSMR0Ru2X7zy7Zbica2euONgdPKrYIwR6EWj9qF945GmzN4uCt0tXouREUjwL3RO5qQgH/hM/W9LR2EaN3papPefwbvROSYKbVsbKyJS7nKk+sa3z2PInl/cvqkTIkKiq4pbD6VoJ3U/iFE7exKAPGEoPLmxfB5cfLjxmt965uIxCvo+v3QllSo/PZQ3Lzw6Hh2JA9fUwGw/ClmrceKa3DF3AzE74lsPzs64gSszx/hWLx/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u81A8Ca6WXFHcMibI8RE9TJa472X1f6evWVYufMRPU4=;
 b=AghlIkbOgq2hiJmiiUy+THNWWaCPkhm5UzRC5gjrwNtvHxiOHr0W6lSat1T9gTVsLkI6QyTjuUtZNQt5pAiRNwe7iBkEwgDT11TsdwLha8EDmi4MbbC9BXGMCCzPdpQAgWVQxpQtyT3OWt+SI+casdtqC8+OynJdRnCeM/zRZee6Z/UJaowARbl3Hu3vE0rdYJ3UEGak9che8Pc0aUIuIAl4/ZSG7xmkxi2Rv2a13bWAPF52uHx22Z9mLcApYVH38MFZTyKdIbnOzLJ6sjd27tzQElyTxVygAXRvAc7lSwougUeWvIW0Qc0yDrVRBIOPKjRWJnTbEjwNgHRs0h/4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u81A8Ca6WXFHcMibI8RE9TJa472X1f6evWVYufMRPU4=;
 b=gqfLQdU1Q82nYaiYjsiffW4bfhbDf8DD3Tlv99htOlqZrqHCzhLp+VCRI2WNxZ94QKc3AsTsx2Gxi4kKdQNqRt3jt38yqH9ggi8Y+5O4cxgUarP/Ih6qQWWByDDGb/k6QTYFyRNk5GrytkHT4r3wUsa5yh4YHPI+k5Y3ybEPkLw=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:06 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:06 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 12/21] vfio-user: region read/write
Date: Tue, 11 Jan 2022 16:43:48 -0800
Message-Id: <0fbe8c0935af73fc12eff1f6c919387a9ecad5fd.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2b6a17f-5240-41c6-f863-08d9d563a93e
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742FA769EAE2174B56F6CBCB6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ir6x2J+p8P6SAGE3TRBVhDaDj5czHooL6IwF3j8pN0W+od8pjTbiEM+RZrzqNAbBJRiZhS/XbYvpC55o7VHuvzOa+Qxp4tLMa3H9JyqFq1BxLHavlP0drGboup7oZN5sM+RroedOj6DnPDw9c69lIHJHPWDHAwbkW806AxByqJY4J7nNXtTaFF5qaGuQx83P2A4GnXQOwT6eC96xzmwZvF0TXF15nbupe4p2p3I9YDSWC7eUmnrnvPj5Y5JCufYw2ca23WEGCMxgrY5SM2PkDwuch0uzgj8eZErEqtRfKGIr+wzflO3XEs9YyrS8GZgENUBq20pQuWw/0WEUyL+KGRsMvKy5lQ02xUBfn0XJzlA6FXJS0LoRVdKeVy6hHXEVlm82LGKd+JusJ4lF7QKIdml/9yQS+3y2bgL4rmmAjrWf6EEKUY36Q+n3jgKTC1O0fdTFhVcb2/aPYQWzMeG2k3K3IzlWsii0KE9OpDWYPhc/J6OgpOZljgIjnUBpSqwedUzq+zq3mupD5jqCTZHHSkbybIZzE8hmLGEtmSg6nJ9K4intebOMy+BM2mrB4EmcoW8/u0WwSEB2Ey7Zwz5qddWUv5hSJJ/zGr5kqAfquY/FnJvh7RxcHWzQadwBQT9gdWVdzhEMiUS9Fc/cUObaCUihGIZPxvzjhjssAC7T5h6okFbSpiRw9vPiYo0tePWrgWbN96RmAzjtMlbSoihpFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hyocVtN7lk+LEnxaser/s1vSS5APezBcnOT58ItS35Vba/xujToAyMKFCNdK?=
 =?us-ascii?Q?j8j2jnaxq29lDp230idHsmnksvGouW/KhmfJCG8hvTw1vqOUbIqQX52tza0d?=
 =?us-ascii?Q?wyOlhsDH4PlM/VndyGnrp6auXYZx30nAM8pMOyjiPnWD5N5itRoLH1fv7TCZ?=
 =?us-ascii?Q?D9c9/CXisxI3VVFUxcJ3hGBhPYQgw0yy/NYXOJuEG1IAg8A23Cwun7n1coBg?=
 =?us-ascii?Q?s8J+JNMyu4PnhCSyZMz/2H53XVM6el5fhkn1mzVoqnu8Hinsxp5kWs9+jpI6?=
 =?us-ascii?Q?G4Tzb4jvbLIhiNTNiGGQ8b5Y6lKkP5D737QU2zYzndXmqTpcGr/CYx/2JqwM?=
 =?us-ascii?Q?+YFyeq21rYhtU4n3RH96fU2LqFI7jhrtcfpMzLjTeoT1gQ1fPsP+UjxH3t6z?=
 =?us-ascii?Q?Io5IMtZSFcfCRyxclxQ9Yj7XoDYMKNS9r4l5DnhA7lSvtrk/lJU73AJUVq72?=
 =?us-ascii?Q?PJ/AuQfaYAcTF9KWGFY/TFqTmtX4KQkIPRqqG9ZccBWaePy2D2AlgUy4OVEA?=
 =?us-ascii?Q?hkyRCgOz396mfSsbpdeD1eKn5M9cuEms6DNzehZ7udIvPm1ws7hhLQmK9vT1?=
 =?us-ascii?Q?4X/twzWr2xR6aKmVpbA4Rvs0Qwrp807E6lXPsnO6CaL92kQL7ybURkzYWWAQ?=
 =?us-ascii?Q?bBqU25N4QYx+QR9zNZmz0if4T5dSLVB0W2AQ06Z8hakRqwDKE6B07CeJVaOz?=
 =?us-ascii?Q?qoUISRP49nyEFSnhojQC45ga/ztDs7H6sieax96ueeYhG2OFdc95035xramg?=
 =?us-ascii?Q?QAzCWw1TlKKln8Y2AvMqnBDRYq/GgcQpdMBrcZhkBVG4Ng6g9u3LzacnNY+B?=
 =?us-ascii?Q?JWIRvVorRsU6p2fcnJnneA9oGyKP0Yvrnlba0Yl7HKa5q/gKGY1uVQYNUFLv?=
 =?us-ascii?Q?NWKwcCmSJkrL354URHpN9x2r8gwGMRLKOeGO/wn3XmSmJekj2zp3xLpAkh7o?=
 =?us-ascii?Q?bw65+rwjr93C6YH/QKLqJeI3LSYTOjk4rvATdh7nYYp8rG+b/5OAjmxnnYnm?=
 =?us-ascii?Q?+SZvJg59ro4Iza6Zsnk8wX9FqCmkPB+krKA2mxVEsdr+E9nxp50+zJ6fO2j/?=
 =?us-ascii?Q?Zrk9advY7vOUCn3yRWT18aDzqvF2/YomR2Bopvk3GU5p6NxuBGl8rFY+BfSw?=
 =?us-ascii?Q?Ll5kMV0wfB5LXnnWmP/jenya2qu7zvCp5zyfIs9/o/X/oiQPid07SiJloGut?=
 =?us-ascii?Q?6Zf5fl23uCQhLUjtSnb7k23shD6VR/OUiN4+ncFdUnthVrwGTiWIbWfl3KdL?=
 =?us-ascii?Q?TevNX4zEIMZUBytK901zZsIjNxyU+3KJRk1Iz62a3ExZ1Mkb8C0nBjEmWnXP?=
 =?us-ascii?Q?wtoFVQ9DHyIvJHaHQ765/o5NtZEDoesD8NFy+x31HrXVHOoqPNI9jiAekgjj?=
 =?us-ascii?Q?+3Xv7BG5RwN7QihBjgaQeOCQPLDiu0mxAXAK385ZPTRu76oibcImGi8haoxJ?=
 =?us-ascii?Q?eDJgj8oRRG8NP9ahHvbF6WaRqOYhFjT6zm00NLSKDaZBiTCsr+nPM/fMrI5x?=
 =?us-ascii?Q?GVI7zQe5iOR7gUo4U66yVUzKPdfg0wamDdUNf2gzRjPJvydDWKiwVhGeWnR3?=
 =?us-ascii?Q?ODYMmvhDv+v33zOh2jXVE2W2XRA4QwRUFNU1yA9d00GKwvKFDTN03keF/IDF?=
 =?us-ascii?Q?1f4UqiHyBmA4w8LpGIWAShAqhDii0t+A5oBe2R5P+lEVedxFGTXUo1NwWcrp?=
 =?us-ascii?Q?NkvNZA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b6a17f-5240-41c6-f863-08d9d563a93e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:06.8371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EK9ygherjuXKSGfofpUL4MCNUsWFD9p9KM5/fY8/ikB14j5K9fMbVX/GRCJoyIEj+uTWSkd1vP9tskq7zT03j9Xzijh01DD+kOHNouGcXTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: u7NvVKeSHMeqcRN_ojigNw3P-CLsOxsq
X-Proofpoint-ORIG-GUID: u7NvVKeSHMeqcRN_ojigNw3P-CLsOxsq
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for posted writes on remote devices

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h                 |   1 +
 hw/vfio/user-protocol.h       |  12 +++++
 hw/vfio/user.h                |   1 +
 include/hw/vfio/vfio-common.h |   7 +--
 hw/vfio/common.c              |  10 +++-
 hw/vfio/pci.c                 |   9 +++-
 hw/vfio/user.c                | 109 ++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 143 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index ec9f345..643ff75 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -194,6 +194,7 @@ struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
     bool send_queued;   /* all sends are queued */
+    bool no_post;       /* all regions write are sync */
 };
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index caa523a..b1ea55f 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -120,4 +120,16 @@ typedef struct {
     uint64_t offset;
 } VFIOUserRegionInfo;
 
+/*
+ * VFIO_USER_REGION_READ
+ * VFIO_USER_REGION_WRITE
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint64_t offset;
+    uint32_t region;
+    uint32_t count;
+    char data[];
+} VFIOUserRegionRW;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 19edd84..f2098f2 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -75,6 +75,7 @@ typedef struct VFIOProxy {
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
 #define VFIO_PROXY_FORCE_QUEUED  0x4
+#define VFIO_PROXY_NO_POST       0x8
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2552557..4118b8a 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -57,6 +57,7 @@ typedef struct VFIORegion {
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
     int fd; /* fd to mmap() region */
+    bool post_wr; /* writes can be posted */
 } VFIORegion;
 
 typedef struct VFIOMigration {
@@ -180,7 +181,7 @@ struct VFIODevIO {
     int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
                        void *data);
     int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
-                        void *data);
+                        void *data, bool post);
 };
 
 #define VDEV_GET_INFO(vdev, info) \
@@ -193,8 +194,8 @@ struct VFIODevIO {
     ((vdev)->io_ops->set_irqs((vdev), (irqs)))
 #define VDEV_REGION_READ(vdev, nr, off, size, data) \
     ((vdev)->io_ops->region_read((vdev), (nr), (off), (size), (data)))
-#define VDEV_REGION_WRITE(vdev, nr, off, size, data) \
-    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data)))
+#define VDEV_REGION_WRITE(vdev, nr, off, size, data, post) \
+    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
 
 struct VFIOContIO {
     int (*dma_map)(VFIOContainer *container,
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a50bf4b..83cc5ec 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -213,6 +213,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    bool post = region->post_wr;
     int ret;
 
     switch (size) {
@@ -233,7 +234,11 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf);
+    /* read-after-write hazard if guest can directly access region */
+    if (region->nr_mmaps) {
+        post = false;
+    }
+    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, post);
     if (ret != size) {
         const char *err = ret < 0 ? strerror(-ret) : "short write";
 
@@ -1555,6 +1560,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    region->post_wr = false;
     if (vbasedev->regfds != NULL) {
         region->fd = vbasedev->regfds[index];
     } else {
@@ -2689,7 +2695,7 @@ static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
 }
 
 static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
-                                uint32_t size, void *data)
+                                uint32_t size, void *data, bool post)
 {
     struct vfio_region_info *info = vbasedev->regions[index];
     int ret;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 6f85853..a4fd5e2 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -51,7 +51,7 @@
                      (size), (data))
 #define VDEV_CONFIG_WRITE(vbasedev, off, size, data) \
     VDEV_REGION_WRITE((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
-                      (size), (data))
+                      (size), (data), false)
 
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
@@ -1658,6 +1658,9 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     bar->type = pci_bar & (bar->ioport ? ~PCI_BASE_ADDRESS_IO_MASK :
                                          ~PCI_BASE_ADDRESS_MEM_MASK);
     bar->size = bar->region.size;
+
+    /* IO regions are sync, memory can be async */
+    bar->region.post_wr = (bar->ioport == 0);
 }
 
 static void vfio_bars_prepare(VFIOPCIDevice *vdev)
@@ -3444,6 +3447,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (udev->send_queued) {
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
+    if (udev->no_post) {
+        proxy->flags |= VFIO_PROXY_NO_POST;
+    }
 
     vfio_user_validate_version(vbasedev, &err);
     if (err != NULL) {
@@ -3503,6 +3509,7 @@ static void vfio_user_instance_finalize(Object *obj)
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
+    DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 1b0c9aa..09132a0 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -50,6 +50,8 @@ static void vfio_user_cb(void *opaque);
 
 static void vfio_user_request(void *opaque);
 static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
+static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                 VFIOUserFDs *fds);
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
@@ -534,6 +536,33 @@ static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg)
     return 0;
 }
 
+/*
+ * async send - msg can be queued, but will be freed when sent
+ */
+static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                 VFIOUserFDs *fds)
+{
+    VFIOUserMsg *msg;
+    int ret;
+
+    if (!(hdr->flags & (VFIO_USER_NO_REPLY | VFIO_USER_REPLY))) {
+        error_printf("vfio_user_send_async on sync message\n");
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = 0;
+    msg->type = VFIO_MSG_ASYNC;
+
+    ret = vfio_user_send_queued(proxy, msg);
+    if (ret < 0) {
+        vfio_user_recycle(proxy, msg);
+    }
+}
+
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql)
 {
@@ -959,6 +988,70 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
     return 0;
 }
 
+static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
+                                 uint32_t count, void *data)
+{
+    g_autofree VFIOUserRegionRW *msgp = NULL;
+    int size = sizeof(*msgp) + count;
+
+    if (count > max_xfer_size) {
+        return -EINVAL;
+    }
+
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_READ, sizeof(*msgp), 0);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+
+    vfio_user_send_wait(proxy, &msgp->hdr, NULL, size, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    } else if (msgp->count > count) {
+        return -E2BIG;
+    } else {
+        memcpy(data, &msgp->data, msgp->count);
+    }
+
+    return msgp->count;
+}
+
+static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
+                                  uint32_t count, void *data, bool post)
+{
+    VFIOUserRegionRW *msgp = NULL;
+    int flags = post ? VFIO_USER_NO_REPLY : 0;
+    int size = sizeof(*msgp) + count;
+    int ret;
+
+    if (count > max_xfer_size) {
+        return -EINVAL;
+    }
+
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size, flags);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+    memcpy(&msgp->data, data, count);
+
+    /* async send will free msg after it's sent */
+    if (post && !(proxy->flags & VFIO_PROXY_NO_POST)) {
+        vfio_user_send_async(proxy, &msgp->hdr, NULL);
+        return count;
+    }
+
+    vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        ret = -msgp->hdr.error_reply;
+    } else {
+        ret = count;
+    }
+
+    g_free(msgp);
+    return ret;
+}
+
 
 /*
  * Socket-based io_ops
@@ -1005,8 +1098,24 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
     return 0;
 }
 
+static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
+                                    off_t off, uint32_t size, void *data)
+{
+    return vfio_user_region_read(vbasedev->proxy, index, off, size, data);
+}
+
+static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
+                                     off_t off, unsigned size, void *data,
+                                     bool post)
+{
+    return vfio_user_region_write(vbasedev->proxy, index, off, size, data,
+                                  post);
+}
+
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
     .get_region_info = vfio_user_io_get_region_info,
+    .region_read = vfio_user_io_region_read,
+    .region_write = vfio_user_io_region_write,
 };
 
-- 
1.8.3.1


