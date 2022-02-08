Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8754AD52E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:49:38 +0100 (CET)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHN7v-0003rq-34
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:49:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpt-0001xL-8B
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpl-0001vb-3X
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:47 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2186sIux007544; 
 Tue, 8 Feb 2022 07:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=h9ObOmoSV7GEHpOqL8fbNqZo3ChyoR3Cn/AmxxbVev0=;
 b=Ya/jl81kJ292TkCuIfirSIey0Xu3Zr5a9ds5C9ijSDJsuqwrDRSdCONEl25yk54BZihd
 u5umDjOt56jrTQjflbHDfqGL6vnvYa6qmwQuNHsjzAazVo4FolPQXtfeXBblc5fYDl18
 n5HoajXt8ZpYoPp0ln8JK03C732T3zk6LvEY4lpsmVxfkqBEreU8p3YkiaKIoeoLdMwq
 Wdg5kHlvaCrZO8j/U9A8wxa3FiCxwL+KiF2uJDYQYitXL6Wyq6/Aze79nebnow+c4C/l
 FqpezBfqoaZ0HudOaC8+h+EInf34ff3L9KL7BcFznBgjydc9YXw4EIbSc9eMFcwih6r8 ug== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e368tsxcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYt093365;
 Tue, 8 Feb 2022 07:22:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US2GvwLRpql4kv5eiZ0WOcAjDJ+krMQfQ/OkPxnbGKdF+KFbl/T4GHjWk/98ivL9d2YIDrtZx86lOnWQLioGKrwJ4PfYUGmNSDZIjDtdi27iBTdCy88TkcCYFSUQii4hE77L92uHpXmMZa8RRPGP+eyfEbhsGpNmMhPSuYciXd9mIgwPlSMy+rXxfdTe4lD7v3Px+Rrmcyl1BqsfQ9VATYAAHeL6GPBPU2Wv51hDcRoLMzbwQnciYdQmRntHA/1p26VNnVxqvFJ5zkCrYjO/yARqKXFiX/L37Y5bjHySUuL6UtyzquymJJlT9fci9C0ltzYvU/HPX7B3VOKxJkZc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9ObOmoSV7GEHpOqL8fbNqZo3ChyoR3Cn/AmxxbVev0=;
 b=bOOPP0ApSkd8e/iWJLRVpFGN+x1TONByvCD2W0XsTPiOG6/wVx+TzvkwDM3qs6iMHBD1h322o/PxS4hKsgrH8ASCseFbAEBIfUgvg5o9pA4bV9EmpB5NUnvH9YfPt1K7UkaSEHTTXLQDjrO/r9GZX9+4FVnxRuJaz/ZbH/ooUPectU/ya6fkDVklMZA8HhdYSWBd8rqRs2GYWSKTW9U9nQ9WXvaNcoTicj9jbTmNccaC/MHMWYI7MR9j+s5rGFVTNgmDxa3peK/tgDYOK4gZgU50ygZRpkRpZDrNxLcgfG+ykPArMV5dduSQ0IHnKL2k9vV7u6LIFMDe9NEJOokpCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9ObOmoSV7GEHpOqL8fbNqZo3ChyoR3Cn/AmxxbVev0=;
 b=ih/V9Tobue19mTMWZokc0+48+p6X92urRsoYsyNIjZEnl9193UE86amagHsyCyCeSMFaIOnbKCAt8G2hoPM+C3HM31JsBIej0oxGM4NJw+IxX7BKyibViVlde7sP/i8VnRnKZ9+xVoiH4mAFIno81IV9NtIYaaJ/NonrPlGmPh0=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:34 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:34 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 5/8] multiprocess: prepare ioregionfds for remote device
Date: Mon,  7 Feb 2022 23:22:19 -0800
Message-Id: <7b0f00218f64b5b4445837c0edaed2b97a020213.1644302411.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75856efe-8c84-461b-9356-08d9ead3c6ab
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5608D9B3C081A88898C91FEE8C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBnye1zN+oyq7G5PlOOn5od81ijb1TUd/0dlr4sw5/piAQSL6tBW47tBh14ADS7JWJDdgWo3DUimUJDFQ4M2WV+kwJi1Xe+2EFdTNclA/bazUD3iqN+HGIU1pXWa4MGnnyZeFUbFwJmrdr7tXwdQmw5NYvmwszW1VR6WQzNFM9BdQO9sQjHtF3p+3M32aj7RfhnRRBqBUjEMw4ekqblHOku52aFcG8SJuMIO9HHpRIbtULlJztY5MZDSRoUXQBn9ZlwERq6pG8qO8PRIcgHFRkGxhmNGTJlnjIzZV0vmwQz2PT3CvU/bw6rDtpwg9Zuzc0foM2coXnTjx1yjYm4eNA6qkFh/oXlx1jqGpkoq1Dhh3izA2EFaOuRTVa0KaiN+P6nLE290JgSLWQFpuv5ySo0IG0r01bqDQQ0BhmvloYfW/Pqt11EbuskVmP4nX51bebGoYnQsk29Pkt5MxtyrUABFRKu6ZtJF0TdPZZ9C2qXK2qK8S9q91CwtJpK4j6JYptjRqF1aDbgzE0a6RyxR9+7mZkAkqFX3X2JrwJBx+0wMFnDVM+EY09O9nWhFrnnitGIxfT6vxeyILDR9QqPBKxhU9LVU7MBNJM+pPu9TGdmYWWMGG6I80BySNm+Lalhrfp13yOeSP2JaONuXWM+VCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?In8xl1bAIA6HiNFyy9LkedkaqdMIgxBQ+Ea5WQGNSYznF/Rk6yhEqjrw2hEt?=
 =?us-ascii?Q?K6s0OVwkAJ7rBCdwN4V1tT0gpnXYa3KX1YRaO6ndSLYU8cJkaH6IjxwnwMx4?=
 =?us-ascii?Q?zpQQ9ElxMaSlZ4O1vr1HxTk9lZZ1p07BNUsbqfWarRp4rWZj/Xs98BjVQUdQ?=
 =?us-ascii?Q?oN5wRfDsDCJhFZXKXeX6QsG35kD55UfVpJ9XbGR/01TsE6t6tTIf/jeDLtK3?=
 =?us-ascii?Q?4S/NR4Dv2oLj3ZwJtnm4PvjfDirPANtJvoXQkHEFUKq0iwKfWNkRhTZ8l2fo?=
 =?us-ascii?Q?MI4iNmLre0v5xg3Q70UC2M/Jcsgp4sbZXZ27jhA6MUJAxGqYPp0tsNlPIMJJ?=
 =?us-ascii?Q?Y3aBfm8r6Y5onOkShteB5T0g03RAWbBUO6eDPSwq+gNSZiMm612tQWE5bVAp?=
 =?us-ascii?Q?5lJ8jpopOOw3E97G5G4V40DZhv8xPDyF0inFAmO1T+z06F1HW838vfDJicwj?=
 =?us-ascii?Q?FNj2WWqoMTBlVjKtsAPoJFF48GPrVOuTfRw9rD3B1lYfpV9iVHr9Eyz6UR0B?=
 =?us-ascii?Q?Sp2/KVqFVRV7TKO3S5EWBXeqm4aFu6x3U9vS3t1GMbp55irvLptAyPF/R/wU?=
 =?us-ascii?Q?3QeZyz6yvS5NoP6jAErtfOQLV5nmnQkYqizBBkZOMD7+BqPhjZpBxJDQmHaW?=
 =?us-ascii?Q?4sO+8gjgw+hqWMHLd11ET4l3AnmPVnixibjcHP/a1tIr5xeCEaejHiZzM8GM?=
 =?us-ascii?Q?Lr7L5ZoPoGstZpMJ48jFv74pGaHjkEDXoTTQX4YA64wmVHJ516jHwXXy6xwq?=
 =?us-ascii?Q?G7TZx2wIZNl4YlLc5w3vB1B4GGhDUnlTotQceA6aaln4g2bDxeuIkJtsSEfb?=
 =?us-ascii?Q?tQZE9a6kBcP61KKhBTSGGUy29s+KDe7Rpu8Qq+NICbmBqIOxxj07L2m8fPye?=
 =?us-ascii?Q?K+K0+ZkTHV+EmqZWbKzY3RhMmf4MyRsrYAueWrfC4CSPFE82Wz1eDIKEW4qP?=
 =?us-ascii?Q?OtgWwKvrl0Ohb4WT2IIqxwcK4cRTVC99VpUmpdqCkxgcXv9y7OpfukfCslJb?=
 =?us-ascii?Q?BXTpprKlUBco+FS7T9+3825Cj+9EhHCA4X/9ZspsctC6TBi3DGreNTCtUzVJ?=
 =?us-ascii?Q?KErpMoM6sRjff/TANNrjnca4qflECCYErja/K7BF4uswbz45fV1zJR7QMlnA?=
 =?us-ascii?Q?rEQd6CoRCTpqiJhk8IN0iAsTlzMamSGeX8KKw5/+UfS/bVvpueLuwdIv+iLp?=
 =?us-ascii?Q?nNb+2RzEyxyEH4u9SKNjtYMvPO5KIYNythYOQNUQKtZynXBZO8vYMMnsc5s5?=
 =?us-ascii?Q?bGItxp05OL/QC/pklZLCk2VcomBPivr9Xg2CtTsdR4Aq0f0CFE1GYH6c8A/N?=
 =?us-ascii?Q?zMcY7SOV8bfkNCYm6py35pllp8tAHgyzX8xAK9X/ehoWnUkFzqOIXbD5xfIV?=
 =?us-ascii?Q?VdOlcibO303GrQOFygVfilrs9YWuyLFzCj7tXbdcud780rPV8kJGxQAVFanc?=
 =?us-ascii?Q?1jEWCLBEDSR6DapVV1sHSPU6V9dR701AmCLlwKGdBhnzoHNlkNgCJvtTzR2t?=
 =?us-ascii?Q?3l+EbIa6nLZMgPAE5lY0v1vP6oyYz12PjS3tufNB7O8qVjtkRyng14BoWzCg?=
 =?us-ascii?Q?hrzSoh41FUs7tg85Ek30+hJiLUXoKnbxChP0JRQWn7KBGurGj7AZ951YTMOL?=
 =?us-ascii?Q?MT2xZAX8CdUbD16gcNSdnL0wg95MZqslA/WsSeaG5zLYOro91RH5SMPqgsHl?=
 =?us-ascii?Q?Ud5d48qJgs0Laxh6cR4No1tgfg0X9InFmTbGsknAjUdFkOO8nYTJLVtyh7pP?=
 =?us-ascii?Q?RbsPby8msQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75856efe-8c84-461b-9356-08d9ead3c6ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:34.3017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +28U3HbAlpvgDSmA6X1+fvEs/ChCkvyeW89a0JSkQF0/Pw2P6vtpuE8Co6D7Wg3qQDpYBz4a/r+f2YWcT5hSCAAmGZVp38qegN6KVvtw+XI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-ORIG-GUID: CA_jay0y9tTqQaOlwZm7SnAdCzArxmOr
X-Proofpoint-GUID: CA_jay0y9tTqQaOlwZm7SnAdCzArxmOr
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, armbru@redhat.com, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/hw/remote/ioregionfd.h |  1 +
 include/hw/remote/remote.h     |  1 +
 hw/remote/ioregionfd.c         | 26 ++++++++++
 hw/remote/remote-obj.c         | 93 ++++++++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+)

diff --git a/include/hw/remote/ioregionfd.h b/include/hw/remote/ioregionfd.h
index c8a8b32ee0..85a2ef2c4f 100644
--- a/include/hw/remote/ioregionfd.h
+++ b/include/hw/remote/ioregionfd.h
@@ -37,4 +37,5 @@ struct IORegionFDObject {
 
 typedef struct IORegionFDObject IORegionFDObject;
 
+GSList *ioregionfd_get_obj_list(void);
 #endif /* IOREGIONFD_H */
diff --git a/include/hw/remote/remote.h b/include/hw/remote/remote.h
index a2d23178b9..46390c7934 100644
--- a/include/hw/remote/remote.h
+++ b/include/hw/remote/remote.h
@@ -23,6 +23,7 @@ struct RemoteObject {
 
     DeviceState *dev;
     DeviceListener listener;
+    GHashTable *ioregionfd_hash;
 };
 
 #endif
diff --git a/hw/remote/ioregionfd.c b/hw/remote/ioregionfd.c
index ae95f702a6..85ec0f7d38 100644
--- a/hw/remote/ioregionfd.c
+++ b/hw/remote/ioregionfd.c
@@ -37,6 +37,32 @@ struct IORegionFDObjectClass {
     unsigned int max_ioregfds;
 };
 
+static int ioregionfd_obj_list(Object *obj, void *opaque)
+{
+    GSList **list = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_IOREGIONFD_OBJECT)) {
+        *list = g_slist_append(*list, obj);
+    }
+
+    object_child_foreach(obj, ioregionfd_obj_list, opaque);
+    return 0;
+}
+
+/*
+ * inquire ioregionfd objects and link them into the list which is
+ * returned to the caller.
+ *
+ * Caller must free the list.
+ */
+GSList *ioregionfd_get_obj_list(void)
+{
+    GSList *list = NULL;
+
+    object_child_foreach(object_get_root(), ioregionfd_obj_list, &list);
+    return list;
+}
+
 static void ioregionfd_object_init(Object *obj)
 {
     IORegionFDObjectClass *k = IOREGIONFD_OBJECT_GET_CLASS(obj);
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
index f0da696662..9bb61c3a2d 100644
--- a/hw/remote/remote-obj.c
+++ b/hw/remote/remote-obj.c
@@ -24,6 +24,10 @@
 #include "qemu/sockets.h"
 #include "monitor/monitor.h"
 #include "hw/remote/remote.h"
+#include "hw/remote/ioregionfd.h"
+#include "qemu/cutils.h"
+#include "qapi/qapi-visit-qom.h"
+#include "qapi/string-output-visitor.h"
 
 #define TYPE_REMOTE_OBJECT "x-remote-object"
 OBJECT_DECLARE_TYPE(RemoteObject, RemoteObjectClass, REMOTE_OBJECT)
@@ -74,6 +78,80 @@ static void remote_object_unrealize_listener(DeviceListener *listener,
     }
 }
 
+static GSList *ioregions_list;
+
+static unsigned int ioregionfd_bar_hash(const void *key)
+{
+    const IORegionFDObject *o = key;
+
+    return g_int_hash(&o->ioregfd.bar);
+}
+
+/* TODO: allow for multiple ioregionfds per BAR. */
+static gboolean ioregionfd_bar_equal(const void *a, const void *b)
+{
+    const IORegionFDObject *oa = a;
+    const IORegionFDObject *ob = b;
+
+    error_report("BARS comparing %d %d", oa->ioregfd.bar, ob->ioregfd.bar);
+    if (oa->ioregfd.bar == ob->ioregfd.bar) {
+        return TRUE;
+    }
+    return FALSE;
+}
+
+static void ioregionfd_prepare_for_dev(RemoteObject *o, PCIDevice *dev)
+{
+    IORegionFDObject *ioregfd_obj = NULL;
+    GSList *obj_list, *list;
+
+    list = ioregionfd_get_obj_list();
+
+    o->ioregionfd_hash = g_hash_table_new(ioregionfd_bar_hash,
+                                       ioregionfd_bar_equal);
+
+    for (obj_list = list; obj_list; obj_list = obj_list->next) {
+        ioregfd_obj = obj_list->data;
+        if (strcmp(ioregfd_obj->ioregfd.devid, o->devid) != 0) {
+            list = g_slist_remove(list, ioregfd_obj);
+            error_report("No my dev remove");
+            continue;
+        }
+        if (!g_hash_table_add(o->ioregionfd_hash, ioregfd_obj)) {
+            error_report("Cannot use more than one ioregionfd per bar");
+            list = g_slist_remove(list, ioregfd_obj);
+            object_unparent(OBJECT(ioregfd_obj));
+        } else {
+            error_report("Added to hash");
+        }
+    }
+
+    if (!list) {
+        error_report("Remote device %s will not have ioregionfds.",
+                     o->devid);
+        goto fatal;
+    }
+
+    /*
+     * Take first element in the list of ioregions and use its fd
+     * for all regions for this device.
+     * TODO: make this more flexible and allow different fd for the
+     * device.
+     */
+    ioregfd_obj = list->data;
+
+    /* This is default and will be changed when proxy requests region info. */
+    ioregfd_obj->ioregfd.memory = true;
+
+    ioregions_list = list;
+    return;
+
+ fatal:
+    g_slist_free(list);
+    g_hash_table_destroy(o->ioregionfd_hash);
+    return;
+}
+
 static void remote_object_machine_done(Notifier *notifier, void *data)
 {
     RemoteObject *o = container_of(notifier, RemoteObject, machine_done);
@@ -98,6 +176,10 @@ static void remote_object_machine_done(Notifier *notifier, void *data)
 
     o->dev = dev;
 
+#if CONFIG_IOREGIONFD
+    ioregionfd_prepare_for_dev(o, PCI_DEVICE(dev));
+#endif
+
     o->listener.unrealize = remote_object_unrealize_listener;
     device_listener_register(&o->listener);
 
@@ -132,6 +214,13 @@ static void remote_object_init(Object *obj)
     qemu_add_machine_init_done_notifier(&o->machine_done);
 }
 
+static void ioregionfd_release(gpointer data, gpointer user_data)
+{
+    IORegionFDObject *o = data;
+
+    object_unparent(OBJECT(o));
+}
+
 static void remote_object_finalize(Object *obj)
 {
     RemoteObjectClass *k = REMOTE_OBJECT_GET_CLASS(obj);
@@ -148,6 +237,10 @@ static void remote_object_finalize(Object *obj)
 
     k->nr_devs--;
     g_free(o->devid);
+    /* Free the list of the ioregions. */
+    g_slist_foreach(ioregions_list, ioregionfd_release, NULL);
+    g_slist_free(ioregions_list);
+    g_hash_table_destroy(o->ioregionfd_hash);
 }
 
 static void remote_object_class_init(ObjectClass *klass, void *data)
-- 
2.25.1


