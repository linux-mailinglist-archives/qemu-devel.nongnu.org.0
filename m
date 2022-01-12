Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB0548BC17
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:59:53 +0100 (CET)
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RzU-0007xk-4W
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdp-00011g-6k
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:29 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdl-0005hT-77
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:28 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMR5s6025174
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ps7jn4StXnYAopaVhaQ95yDAJqOv8j9X1YO8HqF3lEI=;
 b=M8sOUkbNRIcgF2asP87xWaTwtTJEGNfXtBKCvqYYtl/dDjokaTpPgnZKrWl/l7t5aGB/
 rTRlYjHf7fawN7l0hwoHbmBs3Gp8PXmPMK0TwnLApFOX1Lv4rFtryhJQdXcH8X+vB9ub
 E0weuMRP9Irl7iVPl+1WkJNKD/Irusa13ixEnoF9X/6yul9udUlMBzu04GOXJknNsKT4
 rBtSuaok94LavLGpLd+/2CVGzVEdx9/iV186VQmzI1J9fEINwxTGHbp6BPH9JoP94VPz
 JmL0SKZbVuj7j5UmNrtY6ycbeNRYMLMsl256kjxFZlQNVFFBU5QfmXEDjjtOPnrA050D FA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgmk9crq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBO196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsDzGQzW2zBEFZ2QPjk9S/nOlwapxRwWxW2935CfVQlK+8M0mE/AKuSCq5yXvW2mcgHkoteZc/2dmQmtRzhMBk3UznGp7sZqwIuURsCEyXW0M1aFfRfLNZcNQDiY4x+0x1sFgj2BqX9aJ3h2uLlri9NcpI1Z+VmRmWjtzumSnBCoQftGcD6E1PCTMf4TA0ibq0ie8Ix6lVhwhjIPfUAsYhnK3IDUJszG9zDKixRfStUsvbebBPr7oongxSXZnots58qG8fI4EM+/nFiIJQ7/tNELGneXPyM06UuDw8LXkN/fToJYEDT6AQbRuK0KWfQesc7oPs7oEbQ8mi74X0NAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps7jn4StXnYAopaVhaQ95yDAJqOv8j9X1YO8HqF3lEI=;
 b=jWmw1uyFrXGiASWI8PpBDR2yXT0QvCX23/gg0+wEt2ZVWZMGyQmwS8x+IApsM8QeBBrN8Bxh8224/5rjPggv8iW96ukb8TcEd9EvLfTfQiF496ky3C2M2wpP9OvSWk5WOLPCvO5/qehpRFcV4fn3+KT3RPfRLkw9YpzwchvqixRGxkn2zLKxZsou08NwBZOD+zGJFBcP8LFhegPmywYqqQ9k+qrYIEr05NNVZwCTVY5o8RalYA9KJMpnAzI8gx2uK+UhAZsZaFTpTJ8H6o8+QP5DLpYIVrdDPOGNIynC8UAPZLqPsrPBrhve7RWFoOM2PIFjBYCX+645PHIuLjFcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps7jn4StXnYAopaVhaQ95yDAJqOv8j9X1YO8HqF3lEI=;
 b=jlbXI6XpuA0f0sEtELTqmAf9KcrfQ2/FiIsM+Zh6cwtD3na9XVv19veHPiPnXSaUEOY7lr7j/7M0mya5QwkwdKGhr7xYlEDwn5nKsouTwS7kIhKqzM2qoeEa+/lmtBp0EBq5mh3Wf5+5EBmlOtA07YdNP5GocWcLkGyNYg0Ky2A=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:08 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:08 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 18/21] vfio-user: dma read/write operations
Date: Tue, 11 Jan 2022 16:43:54 -0800
Message-Id: <f70bd72d2b134e71b6896e5597e44de3f87e2b3d.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1789291-b3b7-42d2-805d-08d9d563aa53
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742FA0359644EB67D542ABCB6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2MW6AxRpCLOK07Ly8ewrJTD3re8jQBhlqquB5RD7aGDNzlB6ZzeT5SLG+WOYCV/NXXl7mz0LJwAsDIXwYVvuUS0sLRQo5mSCImqHmoZNl700D6n88UOJjRAo92Vw1uHLEhK1XiXGl/pVz9zKMer0ER5FVnOjeGBt5fxULW6j5kbDL6aqXPsiJXFKxD+OYI9vXr4+asbf4nHEN2FKmmSTq7eSllqddCu3FfMNtgIZ1cju9eupkfOZNp1ZVShlT7hetnftJ4UGC/QxzqGnN1TddsykE2EJnXGF0LFVmXpqKrCk66lsa12TqQDmggmUhNeeb1jtiPxxAomSSJBkJ337MU+3hlXyX5LnMUJC2Yol0fj+aC+NrlYgx27FMEWNHAPPSii26rW1t6HepzGOX3y4ysRM2YKLyuuCPq0opVWGEBkfcSdbYMuCnXdjByLZH57pmx8Xh4thqZQXYgxvLbhIDC0yBguYjz9XQfy4qgUEonU0c5InOmnAwrPWvteYJ3vLz5ZcK2nt+qY6/Adu57EFjHKPB13gVM5UT9s7OHZFfm2ZJpoHPl5vO+ezYA4afG8v0ZSKHBH8h27JmxlQB5UZ44SvISfarmb45u1z5Wl7+zLWttM9iNL65Udfn67fXW5NdYW+3YBC/atraP+JGruSIkBYkQjksf/pWrR4nMHiwcJiz8qeMEDFZyIy3L+5HwWd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IkXPudi5X6rZVoSuRKsKhuZNnoh7dplF9nyi43uaO7ZhEdHPL32d6njIpRtX?=
 =?us-ascii?Q?Sy3gUgx0Cl+qq7k9niMK8usdn/k+0gL43GE7JS+AiNU/YDU0oQCEgl1JHLcB?=
 =?us-ascii?Q?MnWgklhYrczo/j7pfgNk/PS7fMLhBGIyipcdFmFVsxKY4bWiTglVZcXhAoNf?=
 =?us-ascii?Q?KH63jbj1ZjHb4uboBL17rWM4MemN7lSvkBKmfMF4NCaPFPwyUMoLjsQcMYKA?=
 =?us-ascii?Q?vqeo9Q6pckanrBWwCu2GTBIe8Ah817Z6jFFSGfBor/17ngCMmYTUXbjliRb0?=
 =?us-ascii?Q?m3gIE3OyQrUoXVMkS2rAhB+xkPBYaEQ9+dEtJbNs5gioFz54awc4R3yPtmXb?=
 =?us-ascii?Q?uTqdjMOdDlbKuWFR08od6YWEFWOHgdsHxvpy61YWiSlbT+E87I6TtDy4pSKs?=
 =?us-ascii?Q?v7rL61omPj5koJBD3VLV3rrws1nMIdW9IX+MIb5ouzmkJADhoXmQmSjFZqum?=
 =?us-ascii?Q?ZFLOPuBf8ceHjuVV6zEsjiBEdsBSH2zCF3THjUS2w3KbLvjquIGY2uc7mx6p?=
 =?us-ascii?Q?Moeb6Bw6GPrvqkjGRLAPOyM2DbqW6+V4DGQV5Q0Tp6Mf5O0K5d/RhcopAcTQ?=
 =?us-ascii?Q?wkl9RHDVMRd1XeYsR4MUte/Ma0+Edt9oUIFs/kAkmUvdAFOiGzAwKTD6Ni9z?=
 =?us-ascii?Q?JzDWv18ovTFqORSaZwrtcpztDw+A9QGEB3M/SQLlxeFFLVrtptZvxcDSgyFa?=
 =?us-ascii?Q?1saQ0wxkuBTPmIawVdNJBRJ6tYHjU/UY4w6Hr5cZ6GFrNz1dySOG5mbBjrhJ?=
 =?us-ascii?Q?ZvGgbuiovMHyw//6oal2wWBdTNpZQmGRQT92hfVQVakrvoPHHH3fkyLAGFUy?=
 =?us-ascii?Q?1rFhTfCgbOHDILp5ZlN/xt7Swg5D1g7p7m9iWuZ32nRW8ysjIkhko97qGg5m?=
 =?us-ascii?Q?c18FHqV27nDEmhM6EHUolZHI23ZXxbhDSGppGoasVcEiddxUKXbNnRDNUCKA?=
 =?us-ascii?Q?PqSTUFh7TISBHvZpqP1fNVbjSV6ZmYH7NSdDXOOz+hKbtdX7p/gptdZ15lWF?=
 =?us-ascii?Q?m99hWi0DF/zSfuYic/SBk5KSkXlmuaeIZFk0sJzjfime9SKlpY102UrWNa37?=
 =?us-ascii?Q?bYkwe/aFX/FX3ag5SYuNIUVHBoGMoJFsvox0yfyTXs5bamgvfT7AjKtVRDE/?=
 =?us-ascii?Q?HHh4UfLdDG71+RtAwxarun0sLf7w5ob+b89tmTgk/0Px0YOkAAruNK6eW95b?=
 =?us-ascii?Q?ec760GQG2m1NIPocOmfSgvzIAStLzfGbBtuftB/w5Miz9zPvdVHGneCKAdlX?=
 =?us-ascii?Q?0m9wynbIdWidka8WS60ws3C2XmgpMM7zwvbx2NmD+XWQhYKJmGdXWPKYtkpM?=
 =?us-ascii?Q?JLhisrcsCnq4iC9OccZQEmZoMuz7FpbwoiRP4rQCzrw+9J+WlGE+i/PI13kq?=
 =?us-ascii?Q?DMwTI8FDMCTmb2AjZT0cQXnC+nxlYIsbR1u6SbMT92rERMFAO2FXQaVoKg86?=
 =?us-ascii?Q?zoeJZJ0tPosyNhVrSCovc6aTkNLYO0j9DWm3gwRiCmBSmkAI0krGxUiFjw5m?=
 =?us-ascii?Q?QF6hWs7St1cxo2hidtJV/tDwxYhqOjhrbDql3+w98uy40NYe/uDGeB8kAhDa?=
 =?us-ascii?Q?0eQbZutpiAbs1xCfnwrO94RxsOuNCnsSvh5adY4GOFzkBXESROuEua9UHjxx?=
 =?us-ascii?Q?5Nx8KTu24wMS4XU8Y67yKkH/V5Z6BBdhvEW9+OgB957waQvwkftYq7g4lrsq?=
 =?us-ascii?Q?JX51kQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1789291-b3b7-42d2-805d-08d9d563aa53
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:08.6807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfbR50IdElC7OSunlj9GL3ftAtK4YFQ5Y4mueck7VaGY7qLpESTEaoGEZjXbYNVw0VvpGyB9Obyv3Cf7DbjQWCeT82o8bmi2hfRQr2CSrus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: rCt2lCwpY71ymMS1F00A6w6O63OfTwPS
X-Proofpoint-ORIG-GUID: rCt2lCwpY71ymMS1F00A6w6O63OfTwPS
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

Messages from server to client that peform device DMA.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  11 +++++
 hw/vfio/user.h          |   4 ++
 hw/vfio/pci.c           | 105 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/user.c          |  60 ++++++++++++++++++++++++++-
 4 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index ad63f21..8932311 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -182,6 +182,17 @@ typedef struct {
     char data[];
 } VFIOUserRegionRW;
 
+/*
+ * VFIO_USER_DMA_READ
+ * VFIO_USER_DMA_WRITE
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint64_t offset;
+    uint32_t count;
+    char data[];
+} VFIOUserDMARW;
+
 /*imported from struct vfio_bitmap */
 typedef struct {
     uint64_t pgsize;
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 997f748..e6c1091 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -80,9 +80,13 @@ typedef struct VFIOProxy {
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
+uint64_t vfio_user_max_xfer(void);
 void vfio_user_set_handler(VFIODevice *vbasedev,
                            void (*handler)(void *opaque, VFIOUserMsg *msg),
                            void *reqarg);
+void vfio_user_send_reply(VFIOProxy *proxy, VFIOUserHdr *hdr, int size);
+void vfio_user_send_error(VFIOProxy *proxy, VFIOUserHdr *hdr, int error);
+void vfio_user_putfds(VFIOUserMsg *msg);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 extern VFIODevIO vfio_dev_io_sock;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index b86acd1..7479dc4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3427,11 +3427,116 @@ type_init(register_vfio_pci_dev_type)
  * vfio-user routines.
  */
 
+static void vfio_user_dma_read(VFIOPCIDevice *vdev, VFIOUserDMARW *msg)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    VFIOProxy *proxy = vdev->vbasedev.proxy;
+    VFIOUserDMARW *res;
+    MemTxResult r;
+    size_t size;
+
+    if (msg->hdr.size < sizeof(*msg)) {
+        vfio_user_send_error(proxy, &msg->hdr, EINVAL);
+        return;
+    }
+    if (msg->count > vfio_user_max_xfer()) {
+        vfio_user_send_error(proxy, &msg->hdr, E2BIG);
+        return;
+    }
+
+    /* switch to our own message buffer */
+    size = msg->count + sizeof(VFIOUserDMARW);
+    res = g_malloc0(size);
+    memcpy(res, msg, sizeof(*res));
+    g_free(msg);
+
+    r = pci_dma_read(pdev, res->offset, &res->data, res->count);
+
+    switch (r) {
+    case MEMTX_OK:
+        if (res->hdr.flags & VFIO_USER_NO_REPLY) {
+            g_free(res);
+            return;
+        }
+        vfio_user_send_reply(proxy, &res->hdr, size);
+        break;
+    case MEMTX_ERROR:
+        vfio_user_send_error(proxy, &res->hdr, EFAULT);
+        break;
+    case MEMTX_DECODE_ERROR:
+        vfio_user_send_error(proxy, &res->hdr, ENODEV);
+        break;
+    }
+}
+
+static void vfio_user_dma_write(VFIOPCIDevice *vdev, VFIOUserDMARW *msg)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    VFIOProxy *proxy = vdev->vbasedev.proxy;
+    MemTxResult r;
+
+    if (msg->hdr.size < sizeof(*msg)) {
+        vfio_user_send_error(proxy, &msg->hdr, EINVAL);
+        return;
+    }
+    /* make sure transfer count isn't larger than the message data */
+    if (msg->count > msg->hdr.size - sizeof(*msg)) {
+        vfio_user_send_error(proxy, &msg->hdr, E2BIG);
+        return;
+    }
+
+    r = pci_dma_write(pdev, msg->offset, &msg->data, msg->count);
+
+    switch (r) {
+    case MEMTX_OK:
+        if ((msg->hdr.flags & VFIO_USER_NO_REPLY) == 0) {
+            vfio_user_send_reply(proxy, &msg->hdr, sizeof(msg->hdr));
+        } else {
+            g_free(msg);
+        }
+        break;
+    case MEMTX_ERROR:
+        vfio_user_send_error(proxy, &msg->hdr, EFAULT);
+        break;
+    case MEMTX_DECODE_ERROR:
+        vfio_user_send_error(proxy, &msg->hdr, ENODEV);
+        break;
+    }
+
+    return;
+}
+
+/*
+ * Incoming request message callback.
+ *
+ * Runs off main loop, so BQL held.
+ */
 static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
 {
+    VFIOPCIDevice *vdev = opaque;
+    VFIOUserHdr *hdr = msg->hdr;
+
+    /* no incoming PCI requests pass FDs */
+    if (msg->fds != NULL) {
+        vfio_user_send_error(vdev->vbasedev.proxy, hdr, EINVAL);
+        vfio_user_putfds(msg);
+        return;
+    }
 
+    switch (hdr->command) {
+    case VFIO_USER_DMA_READ:
+        vfio_user_dma_read(vdev, (VFIOUserDMARW *)hdr);
+        break;
+    case VFIO_USER_DMA_WRITE:
+        vfio_user_dma_write(vdev, (VFIOUserDMARW *)hdr);
+        break;
+    default:
+        error_printf("vfio_user_process_req unknown cmd %d\n", hdr->command);
+        vfio_user_send_error(vdev->vbasedev.proxy, hdr, ENOSYS);
+    }
 }
 
+
 /*
  * Emulated devices don't use host hot reset
  */
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index fb0165d..e377b0f 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -70,6 +70,11 @@ static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
  * Functions called by main, CPU, or iothread threads
  */
 
+uint64_t vfio_user_max_xfer(void)
+{
+    return max_xfer_size;
+}
+
 static void vfio_user_shutdown(VFIOProxy *proxy)
 {
     qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
@@ -283,7 +288,7 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
         *msg->hdr = hdr;
         data = (char *)msg->hdr + sizeof(hdr);
     } else {
-        if (hdr.size > max_xfer_size) {
+        if (hdr.size > max_xfer_size + sizeof(VFIOUserDMARW)) {
             error_setg(&local_err, "vfio_user_recv request larger than max");
             goto err;
         }
@@ -696,6 +701,59 @@ static void vfio_user_wait_reqs(VFIOProxy *proxy)
     }
 }
 
+/*
+ * Reply to an incoming request.
+ */
+void vfio_user_send_reply(VFIOProxy *proxy, VFIOUserHdr *hdr, int size)
+{
+
+    if (size < sizeof(VFIOUserHdr)) {
+        error_printf("vfio_user_send_reply - size too small\n");
+        g_free(hdr);
+        return;
+    }
+
+    /*
+     * convert header to associated reply
+     */
+    hdr->flags = VFIO_USER_REPLY;
+    hdr->size = size;
+
+    vfio_user_send_async(proxy, hdr, NULL);
+}
+
+/*
+ * Send an error reply to an incoming request.
+ */
+void vfio_user_send_error(VFIOProxy *proxy, VFIOUserHdr *hdr, int error)
+{
+
+    /*
+     * convert header to associated reply
+     */
+    hdr->flags = VFIO_USER_REPLY;
+    hdr->flags |= VFIO_USER_ERROR;
+    hdr->error_reply = error;
+    hdr->size = sizeof(*hdr);
+
+    vfio_user_send_async(proxy, hdr, NULL);
+}
+
+/*
+ * Close FDs erroneously received in an incoming request.
+ */
+void vfio_user_putfds(VFIOUserMsg *msg)
+{
+    VFIOUserFDs *fds = msg->fds;
+    int i;
+
+    for (i = 0; i < fds->recv_fds; i++) {
+        close(fds->fds[i]);
+    }
+    g_free(fds);
+    msg->fds = NULL;
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
-- 
1.8.3.1


