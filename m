Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F10B48BC53
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:18:43 +0100 (CET)
Received: from localhost ([::1]:42138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7SHi-00023K-1M
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:18:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdd-0000l8-7P
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdY-0005gM-CF
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:16 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMisEF025160
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Fr3WRngjbhzfwiIaWqDi0uRb9loOBgxZfj3pjsZ+Dlk=;
 b=UYbxdu1T5ptHSsPNzAWHOjHqGZdK6ToJLji9G4YF5K947KKePKfYNiV99GIuFUW4pSlV
 FlPpDmj1ERdfvTb3hFJBXvIenYL60Z4O+sMyNB69iENjSbZGT77ybvLAmwM9cw6IUTK2
 KKyvfbxaxQxJfBPgg8HirqiMabi+Q7pl+U4vj3frSbpcqY5eGwHemQISElzwclzpF8tR
 /FQ3d3Yqw/ofVpyQ5/TBF/XHlGSsVUpbQCa8bNYzVFjebFf366di7iKwHSRMarVQyj2u
 FdR90PXmwTSEPdikTU/i3ph7FYeNLKrVCteM6AlygifR8w01E8Qw7QF3uuYSC42R6Eab bQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgmk9crpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBE196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxKBvl9MZi0vsAbN8ExW9F9otBZtpIFlaMldQZkCXSKNJ+oIQumjmFt8612XynKQo4Cn8Unhh3alvAPW6kfHwdG4SKOEYIegnl26oEdh9acZd/olWeaYrkWaN5X9up1fIU2D60/3MMOmyWep3YjdxsGZfFrRv0l4X7IBsdyj4NujtZGjHTvY/Lm5ASdKsNjgJ+r7uyCM6kUybDZDtUXzHqbUkO10M/H656ePbeFbOlARIzCefFZ+Nfd8NyZj7fAma9gynSpz8fXpRhuWnxUlGSebHKFEnYUhJa9MuNorWW5WnG0i91FpMKS5p+bpkuh7qMghTlppMVxDIUZOQUcjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fr3WRngjbhzfwiIaWqDi0uRb9loOBgxZfj3pjsZ+Dlk=;
 b=T7l7p6UyaeU+oOV12sNsvjF1wlHQzsGENzwVN3latBC1gwayv/UsaQC/9q0QFwQqMioIVw6PN2B/cWeCmf9xcg3SJKBtrD1G8rsdRyDPDaeTGZaFbpKMtGdrxwfUZt2G3K0HfN3uKp1j3kqcNM7+sMzh0VgczHBJnK5llJ7OZXOiyBH6B3HkyGB9yay3xKZ0c7vBoCBn7N3vO2TeFag2iR6H1aaIq5uhfsI3bQ/hnL7bsSWcS1d0wjTcoBYmYAXZyFZOq7T2Hm9I8qXsfhxp8m/xRTcxr414zQha1VdnWQJ/qzAUs5uOr4hBdBs7hmuRC7GkNu44nO1+BRem1eAaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fr3WRngjbhzfwiIaWqDi0uRb9loOBgxZfj3pjsZ+Dlk=;
 b=DuqKQum8DxD01ZWtcz2lZ95c+qbVUSZehyHuF/0x1a1mlwosSccW58QqsMrrxvtm+LaP72r7YNX5m4CcJjjVG77zC9Tl+ObMqKKPBFuHJh21kLJYAN3ajppKQh6Oa86Tdej4wgUkmnzDR+3EWCKKySTIJ7gTPPREjfdsxDmGdoI=
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
Subject: [RFC v4 10/21] vfio-user: get device info
Date: Tue, 11 Jan 2022 16:43:46 -0800
Message-Id: <3943c5a80c59fd474b3978c78e1c5c5f7b4e1a08.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fedc4140-fc7b-414e-0f08-08d9d563a8dd
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742189888F4A7747047D255B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8m+zdLuwfA4taNLryGqZ8QFyKxlSls/Jui7GB6ssEpV6o05cyj4kpRoND/cqVGF6JM2GcQ6QX+iqsC8ORPUF+k+j0i1wvigm9vKOmLtml8suZxBivxCg9JJ/SPQHrRzpmYl+8YkS6+p41YSSzQsV8+N9Pwn6hH6MR7yJX6eOabmew17cVz9Bx2A1S8LG1FRpYx+HQ8wG7vXoPO12lLI5MD94L5AxmEWXx5rSxk+wMO0qgs8DUejdXSSzJ2lBcG5Qd9rwRGYUkGauaaZZXTjiMa5OTy2niPZcciILLYu2S+vzuuB6RKag+6Q72OHKAT2LVpNzrrB1dxkpIh1AXVkE3hcvdytWw3Ku4+Hm8X4i6KweZ+vHBmhWtTrDdt3Cubsxb2qKZ74SUyqvuVn8d32SYf17Yz3SCz3hzuZe7Z8X4pwBx1rFNKH6T1AmFfpmm755YuIMOberp3KvO3Il34AUSCyxMLh4Ezda12vXDt4VQW+YPlwBE7HjoYLLXUnSmTv8ZxKLwzrSSkVlQEC+O2B+BzPOgxjfxjyugcQKycW0igU9Mkel4mr37ZYiKBQULbDsZIWcFsQdD8+GaUo676LPw/olVLa0NBwQgdNO+KYSfqYITkv6T6r3I7KaQC+3r1r4tc9bpoqCxfXMyksBOaF+9fOzU7XIXicQ/ghWDtyAf3ooxxgtHOHeeWat5fd7tQgqULq8lvgxpgv9eT3hi6Geg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uwXShQNdChy0eQiWnQRy0w6y7zCMhTL9KXwohQGaa4/sLTw6vaynpuNzKQfE?=
 =?us-ascii?Q?79JhiOMGdCfnxbhOwKNRDM2xowPMPmPzdJuEQ+f75uFAT1S7Q3IoKxryXBDx?=
 =?us-ascii?Q?xEqJXTVUZQA1XNLDqduBxWTQUU+/6yxVodX45xg8NmYP/FZvBlIE9ISSKoib?=
 =?us-ascii?Q?vKh8MQglqlG3LegWUZ0AS2H3xCXA25l3d9Kevl8FagxziouxfT7YDMp8B1ps?=
 =?us-ascii?Q?ZcqcYwAQUDGk9l2sylg7fWZ4Lb5dHrZ51/cn0JUf0+05mgwizin8AFwnqLCl?=
 =?us-ascii?Q?0HEkfwKsDAPI55C1K6ss7X9e6uPQRKordD50ebU5vUbRjW6ruzlzNkJEZ9Kp?=
 =?us-ascii?Q?6+05zwkRMZo20DUgNu6fl7pxs43d+JWscJpzw+mh4FRcC9WwZEaoJEyvQTNh?=
 =?us-ascii?Q?Xfl3fVrUwUE50yJrMcMcCdrykqsxDzDGkZe8EI8KEag6o6tmp7wbqUmtRMsi?=
 =?us-ascii?Q?KNZgBftdEdDME/5hd7YqQ/3afKJxiH0k/DU02pmzT++wlxTlXq8UFQ3ZcU1J?=
 =?us-ascii?Q?k/18wPtzZ43D3QiZah6RnsAvXm5/GoVmRbjwezM5ObhEUPL7mPfJiFurPTgq?=
 =?us-ascii?Q?21awhREbCvF8bb1Yq//TTTjvozheDvG3ehxLK8qTmG0yL0iRDtNhyH/F9dAx?=
 =?us-ascii?Q?/w1/iOm9Am3uoTmFWMb2bMf0xLK+sMdJVt6PStamUvSicmQZQTFc6Svdp9v2?=
 =?us-ascii?Q?YFJnW9OVvhacDxprS67zBLLkY5ESYbjvYp47hZAXp8MEsr+cCHGECalUe4ui?=
 =?us-ascii?Q?GzfcyIOmoeh6ZvjJ8xl57fTBI/tkafQHD7iCSHHTcMiWPGY/JNW9dKdFjGDI?=
 =?us-ascii?Q?kcSBcP7QOL8WcH7DkAFSQsTMW2jkauYWjkQ7Dp42176BOMqRFYtbh1iT/2kz?=
 =?us-ascii?Q?i9ARsgLOrH+3qz/YFpw/myoDxkjpfmKU3XCUkTrhPMYQg2ixt+aHH2ql57Wv?=
 =?us-ascii?Q?kbM9dzkbiav9j6oIkP9Lc/aiM+8D1buQWqYBNb4O84cEH5fa3XQ+5N5HpwNQ?=
 =?us-ascii?Q?5BSOENv8u437EHTM5nNml76DqKNnWkRKgMxBCAgMpMaWbUfPwjVu85nyh6kA?=
 =?us-ascii?Q?lHeXAA5zIJCIfdfMFAQ8mJ4JRGjV3xGWzNuAZaLAVOYRJuQBwW7KnTYK4xMZ?=
 =?us-ascii?Q?+RGzw2T1+kUJyQJqZSD6eigA8ErssWYzkbTOANhnTvu6SBsIf/mmI4G5ALvL?=
 =?us-ascii?Q?MW6wj9X4pYzMt2b7SsYm9UxRW06QDg00Y1T9nCGJnsAXN4gCRo+Hxaqg2nhO?=
 =?us-ascii?Q?S7KRXU/EDK/A7bI0YVWlcOxxBfMu6vXWQYXbKGZLia3zKeBAwVaPhk/IcOms?=
 =?us-ascii?Q?upWz9PJGihjsrJV7ZBSP4ruw67nFk793ly4BxCadIsdyy4f+i6IlN89o0CfO?=
 =?us-ascii?Q?u3NbevH5W0RIO6lsgO+blFJxdPzjDq/Uy7jcJC13XoVWqagWPV5Yv2av79ek?=
 =?us-ascii?Q?n0qW5uhARGZ2wQu+sjzZsxAZjV0SYGkqS3IYqi6vpD0sVsLnIqF8j78OOb1c?=
 =?us-ascii?Q?gtuiXksp4+yKYXFksmaIdlTxzzaG/Q5Gz4O1W9HZ6oxWMLAGv3AhhFSD6g+u?=
 =?us-ascii?Q?vh/WGr4+Z7pGWq2SO5E0NPA5PTKOd+Y+xtNhza8jKeRVE+C6Jn6FLSCKya1e?=
 =?us-ascii?Q?Y46HaQZ/M/gusqHWlsqvkUfXybZDalZdNHjtYsvOoVAqtsQ/YvJImAaiXVYg?=
 =?us-ascii?Q?gzfq8A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fedc4140-fc7b-414e-0f08-08d9d563a8dd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:06.2123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfkvmBCKysnU9ENTZ/XiAoZ7yFxJ30J/SOs6aoW++zsOCC65NMjxjQN9qdHLxbKd0suw//DPoOt9qDgdkxSSWRu8x3u/b6wvXK0i1uJyeMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: NZEWtCoNNsagF7esLi_7w1tjyRNkPStQ
X-Proofpoint-ORIG-GUID: NZEWtCoNNsagF7esLi_7w1tjyRNkPStQ
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h | 14 ++++++++++++++
 hw/vfio/user.h          |  2 ++
 hw/vfio/pci.c           | 26 ++++++++++++++++++++++++++
 hw/vfio/user.c          | 44 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index a0889f6..4ad8f45 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -92,4 +92,18 @@ typedef struct {
 #define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
 #define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
 
+
+/*
+ * VFIO_USER_DEVICE_GET_INFO
+ * imported from struct_device_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t num_regions;
+    uint32_t num_irqs;
+    uint32_t cap_offset;
+} VFIOUserDeviceInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 7ef3c95..19edd84 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -83,4 +83,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
                            void *reqarg);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
+extern VFIODevIO vfio_dev_io_sock;
+
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 3080bd4..6f85853 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3415,6 +3415,8 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    struct vfio_device_info info;
+    int ret;
     Error *err = NULL;
 
     /*
@@ -3454,6 +3456,30 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->fd = -1;
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->ops = &vfio_user_pci_ops;
+    vbasedev->io_ops = &vfio_dev_io_sock;
+
+    ret = VDEV_GET_INFO(vbasedev, &info);
+    if (ret) {
+        error_setg_errno(errp, -ret, "get info failure");
+        goto error;
+    }
+    /* must be PCI */
+    if ((info.flags & VFIO_DEVICE_FLAGS_PCI) == 0) {
+        error_setg(errp, "remote device not PCI");
+        goto error;
+    }
+
+    vbasedev->num_irqs = info.num_irqs;
+    vbasedev->num_regions = info.num_regions;
+    vbasedev->flags = info.flags;
+    vbasedev->reset_works = !!(info.flags & VFIO_DEVICE_FLAGS_RESET);
+
+    vfio_get_all_regions(vbasedev);
+    vfio_populate_device(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
 
     return;
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index fd1e0a8..671c4f1 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -907,3 +907,47 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
 
     return 0;
 }
+
+static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
+{
+    VFIOUserDeviceInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof(msg), 0);
+    msg.argsz = sizeof(struct vfio_device_info);
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
+
+/*
+ * Socket-based io_ops
+ */
+
+static int vfio_user_io_get_info(VFIODevice *vbasedev,
+                                 struct vfio_device_info *info)
+{
+    int ret;
+
+    ret = vfio_user_get_info(vbasedev->proxy, info);
+    if (ret) {
+        return ret;
+    }
+
+    /* clamp these to defend against a malicious server */
+    info->num_regions = MAX(info->num_regions, 100);
+    info->num_irqs = MAX(info->num_irqs, 100);
+
+    return 0;
+}
+
+VFIODevIO vfio_dev_io_sock = {
+    .get_info = vfio_user_io_get_info,
+};
+
-- 
1.8.3.1


