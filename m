Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFA544A01A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:58:59 +0100 (CET)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFTX-0001gw-29
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:58:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAe-0005fx-Tq
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:29 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046J-0O
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:28 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9019cI010247
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=SydTKKwlNxt9FkOHyG7rijpU3+ScSId62fKktBOXgHg=;
 b=kK5mAbGkGvDuFuIkIni5SNEKeylzf36MIart09vfqvTkBKiCy5LL+AocVM+Ohu4UC/sN
 32LmexM/kNNwCPsqu2x2koFUEDUxcIwRAYrtdLvOtu/QmcDwvWE+lzY2+uaYH7dmzRPw
 2kDdtwJ4OTTo3gPs27JQMysTEpgEMpDZwuzxVOKSdFdBCjSwr32vtlDKHBD1MLSM7Pc1
 qdTG2/vtG2nBPXg6T45h6BcWCMmBjUpSivou8MUI0GJaHrk2RtpNcwkeFtToenTpf7zY
 JuauA02u024Iwrm39v2M0ZAegGuSqszrN3FJtPvyHKQy2uAD+VBuR50LRHVu+E3YO5TT mA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6usnfjk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLN0129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1KhjESeHQTR33BlBlUTIH5D/5wvtx9UtrDQnlYL7qL1ivbfQvO8BD/G8SyOGN/08ql6aCDS7KeFXpWzSpx9Dz/Nt8gwTgBP/CO4hbx7l2QAbslJe/gWSHwB4XmCAGhTtM+OzubFdRJ2T5FB4tGb1l9ZP8PRx5EL6Zqzx8RZW8xBn3VZCjDdxAqrltzmqirlMvJYv2kYpCl/HHSO+AXs6eoFwGWiP80aexRQrlZpsmtz6pmDaQbFnvHQ1fFe8qig0svy/1S0efmt0acXRhobZLmZGW+hc407zByurH2gZo5z663JEPJJDPDfDeFguk0KfmbamjszriyDfTJ2A/PADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SydTKKwlNxt9FkOHyG7rijpU3+ScSId62fKktBOXgHg=;
 b=jz1cy4K/LTrnuaG7Neaqv6GHx/I7gfnhpmVFUfkF2T5vNqLAqtwlv2TOoLYxPc8/y/4n+37kVmIvXh3Y61om9hZAHad42kksTQ1M926q6/4lcP044E73gA020X6mEHq7Lw2uot728EPGhV8bQDYRRkwmgAQPpbjcn1u93DBr1xNGS3JkMA08cYRteRS6wKU/GBW80DvxosHie2rA93H8kRt5LHvypG3zp4OXAyxamICBtxFHyNaBXUzUo73mnJ0AMhiRmGOfj99mC9QYXkSgSC7Tf+5oQyyCmrDyGocCHGWOqvtuofEjPzx5bIVfTiigcLFSmhZG5nqHCYDR7YIDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SydTKKwlNxt9FkOHyG7rijpU3+ScSId62fKktBOXgHg=;
 b=oKWLrxKl8rd0o4t6pvBdK7vB3mJcubTtkxTgYqZfNrlYL/u6s7RW/AuHOMgJC1o/ZuCN4IYAWoM5l9yisB+pb1mYgaQ69Hoeyi+kzWWE/g2njsFb3R6/MNhQWbkT0ewEkSJ91GAvXTCAqHWxYuBDKpOJO63jlcHC6kZTX1FH9Lc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:11 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:11 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 03/19] Add container IO ops vector
Date: Mon,  8 Nov 2021 16:46:31 -0800
Message-Id: <9ce71d6fe15f23e22bf22c392e72aca5aabadce3.1636057885.git.john.g.johnson@oracle.com>
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
 Transport; Tue, 9 Nov 2021 00:39:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e17835e-3826-4dec-7dd2-08d9a31958d8
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB406810A4992761127EB082CAB6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FvL12JJ6A2BY7Cwg9GXYGlIozlaEv0AEbI+qawf+eWnmTiNNegncAaJ6HUugCGB6SYq1x4vsft/lqLUFYCraS/epXrxolFVuUCnhea4Kysru+K8c1i7LjJvqNuhNbYGsWeW174ssWcM1gY+pdQdjZZ8Lvp+QY5w7qv+/Z68VWSzeYSh0gN02qdKC/fbrugT9xAxWRZq9dojgAgLKNFTtR9/0znFYtDi4U3hJzIAVCQbKywDwXNgqKNdKCPuD+q6rE+vq1TZtny5WWb11r4MP4RCPrAkHuEFTMiEJAn1N8FXKNZ5q4gy5fVzFLHk3IFIiJnoYbB04PpLh4hK1b93BmJ/hlxgbn5m08pai4Y7OqK4sALoaJ7Y3Se1ZH95EznNmlfTPyAbSd1SREWIGWrxusziLZhmeU1zWyQTYMg2H4QnljZDfjIvT7GZp1FI00tCswlu0RP8oGKofdfXZIxAMayq8nfbHe5VmJxK9GfADh8jO5S2YPr07FfQlqF8WtS27SbKHtTGc9B/mBnsEKRqLjH4dmKrLmch9TeMLQ5b+9xGMKvtjeTGSpXNb3R/Xh6I8UU3xy7MRQcnhl4qCwUDY9f9Fqc5Rp6Guaew2ceoEMUQ5sehQMBzm9G7UzjnxTslvKAxweC7itz47k65idyLimQkKFVcNdUS8iyR+IqXmgMeo6rsPyNHyt1il1/jVwbt76/74RFnDuNzdYgd48UiXAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l55nqmfGUf3GGH9CZx/RmPitreVcA9mCUt4uGObkWNm/2NVG5q6I7SG9H1Me?=
 =?us-ascii?Q?ha4K+HxhgcVoOL3hBksbLF+8l6q8VU/iLfwwxUaScHhlmhWbrw5+hOvbX7RO?=
 =?us-ascii?Q?pwQhejoS7ORZ7rVbHRAwyapruVJECK4Lg2jyIc8FtVKn2+5ERH4Cb6GpvHBL?=
 =?us-ascii?Q?yhGwVE63nWSIEBnnG8BcGZfPDeMJpnl0i2O7KIAMZxlK0d6VCTMrkV62FXbC?=
 =?us-ascii?Q?0lyC6JDkSq0ERgzM0Uf4e3J3g7dgjM01G9vOb14WVevySm0sWdL+7ex3OtWZ?=
 =?us-ascii?Q?Nzj1eyE2eIUM/g2uDJILyVT5QJxj8uKz98GkQa2iDq6DHi09ww+Nm+0k59d/?=
 =?us-ascii?Q?oXL25sJsXi0U5wW7i/0RUqGTtoEDhO1FSP/Xce8ilieGcYX9RT33fJpDa4bF?=
 =?us-ascii?Q?J3BqpheOkdM8SR8VPu5LvhQXUNA3yhBAQhq0DmQsum/B5VHt8hRg6x34bV0K?=
 =?us-ascii?Q?shHY+506FDwaJElWTmmpFD0r5WMUGtbHM1eq8PZuFDw4G4OxcGXSuRKV5sGs?=
 =?us-ascii?Q?U1zm7ZwwKw1iXJYQrjvITtVr1aNCCJzK/d05MwouzLLiO4YNgYrQEzVMarG2?=
 =?us-ascii?Q?iV8fHyZWSimOUqrHdkS8vWCO0R8Fcabj7J4A5C/o/D4SW2UEcYFTlwZTropg?=
 =?us-ascii?Q?7B+JVd7b8TrQNFGA8QrpTQXWVCCTpIMO/7VOSkk9B4+b25VOW98d4lpupME5?=
 =?us-ascii?Q?3a4HPyBrUmOLs5O+dOFA/wKzxhFjqse72o6+WicIWY7bIs08iA1F7PmUZcHP?=
 =?us-ascii?Q?1udfNW7DIsArl3AV2sdZYEy8WmbmY9PWIySD8OgnIDqsPq4fLqaMe+QB19iW?=
 =?us-ascii?Q?wWGa/i6fbubNThCW+gl4KFvpXtJiEBuFmejcUYrZvJR/BGRPqLjpR1Z3Av26?=
 =?us-ascii?Q?XAUevm69hVP9Ip1RyKf0pz0lT8g+tLxAOZCfx+ursfI8NF6Q5z4dPZVm6kQ6?=
 =?us-ascii?Q?Ku1JkzLyiDfwm1Xrz7KOECGfWo6vjOXGLK2t1y/JXc9BQV78oS2vViNnOqdA?=
 =?us-ascii?Q?78ICl501eBiiIaUFskjahv8m0IvoolOzVkniixvNh77WmKx+lMpA28H33PqU?=
 =?us-ascii?Q?AAW/BtGzwk9i+uPQcRJL91ezq/kkcN11VSjVV5jHqb3NveEEtOKDaXQMC/YJ?=
 =?us-ascii?Q?H9FQ6mCrwjsGr454ShqnAjqE08biClp5HwtBhYKaOI5Go55YJnwsUJYKC243?=
 =?us-ascii?Q?nScat9/2Zw+YGu0LMY78OJgiM4COdrfpoocS/rU5wSysoSt0L4mhIJ7B5k1d?=
 =?us-ascii?Q?3Kaps4xJw+acRkPCVMowv5mjHWwM+T6Q5aasF6Twb2OzfCfNCExr+YmMXuk5?=
 =?us-ascii?Q?OGW+RbU3QukprfLAw6UJY/JjiQZcmwYn6EttWdPAQjIApkhdGmgCA5xT7mS/?=
 =?us-ascii?Q?Rdoc3rkYUpRyXS+y1Jecw2t15m4c6LnmqqtUFWGWzQu8bY1dJp/3bCr396oR?=
 =?us-ascii?Q?FOw3v56EHLSCu+ufEQYStlkOBJRQYdwF+vWlq6+EVRAb7MweLYVsYSA3ZpEu?=
 =?us-ascii?Q?qzGBENYXwTuMaSXD9jzMjWxg9ABnH8aYsIa9AXN/qZIg8595FVXgxOW3Yv6q?=
 =?us-ascii?Q?VQ8ItaG+Ug9Qn3w21/87d9kKyDnLgReWGe5FuG55R0RKR1LzjnZqjmvkMPdU?=
 =?us-ascii?Q?nxP9iGZAMLj7PkNNkbJmevG9co9qYJjyHVqLt1IPsHQW+Or3x5dD+4RrqxRO?=
 =?us-ascii?Q?VugIeA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e17835e-3826-4dec-7dd2-08d9a31958d8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:11.0694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouLR31Yz6+ylIGZiBGT+Ad00D9NIx4Ibo72NpLjU+7OXaWAscsnVNZ0VT6RBHp2R5XfesDfI0BBquM7GkWSi0XuHTuMaboJ8etTzWgy3kCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-ORIG-GUID: uildpvvPird6fDDTXpnaspauQPI1ktQj
X-Proofpoint-GUID: uildpvvPird6fDDTXpnaspauQPI1ktQj
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

Used for communication with VFIO driver
(prep work for vfio-user, which will communicate over a socket)

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 include/hw/vfio/vfio-common.h |  34 +++++++++++
 hw/vfio/common.c              | 131 ++++++++++++++++++++++++++++--------------
 2 files changed, 123 insertions(+), 42 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0..9b3c5e5 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
 } VFIOAddressSpace;
 
 struct VFIOGroup;
+typedef struct VFIOContIO VFIOContIO;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -83,6 +84,7 @@ typedef struct VFIOContainer {
     MemoryListener prereg_listener;
     unsigned iommu_type;
     Error *error;
+    VFIOContIO *io_ops;
     bool initialized;
     bool dirty_pages_supported;
     uint64_t dirty_pgsizes;
@@ -154,6 +156,38 @@ struct VFIODeviceOps {
     int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
 };
 
+#ifdef CONFIG_LINUX
+
+/*
+ * The next 2 ops vectors are how Devices and Containers
+ * communicate with the server.  The default option is
+ * through ioctl() to the kernel VFIO driver, but vfio-user
+ * can use a socket to a remote process.
+ */
+
+struct VFIOContIO {
+    int (*dma_map)(VFIOContainer *container,
+                   struct vfio_iommu_type1_dma_map *map,
+                   int fd, bool will_commit);
+    int (*dma_unmap)(VFIOContainer *container,
+                     struct vfio_iommu_type1_dma_unmap *unmap,
+                     struct vfio_bitmap *bitmap, bool will_commit);
+    int (*dirty_bitmap)(VFIOContainer *container,
+                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                        struct vfio_iommu_type1_dirty_bitmap_get *range);
+};
+
+#define CONT_DMA_MAP(cont, map, fd, will_commit) \
+    ((cont)->io_ops->dma_map((cont), (map), (fd), (will_commit)))
+#define CONT_DMA_UNMAP(cont, unmap, bitmap, will_commit) \
+    ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap), (will_commit)))
+#define CONT_DIRTY_BITMAP(cont, bitmap, range) \
+    ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
+
+extern VFIOContIO vfio_cont_io_ioctl;
+
+#endif /* CONFIG_LINUX */
+
 typedef struct VFIOGroup {
     int fd;
     int groupid;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8728d4d..50748be 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -431,12 +431,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
         goto unmap_exit;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    ret = CONT_DMA_UNMAP(container, unmap, bitmap, false);
     if (!ret) {
         cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
                 iotlb->translated_addr, pages);
     } else {
-        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
+        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %s", strerror(-ret));
     }
 
     g_free(bitmap->data);
@@ -464,30 +464,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
-    while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
-        /*
-         * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
-         * v4.15) where an overflow in its wrap-around check prevents us from
-         * unmapping the last page of the address space.  Test for the error
-         * condition and re-try the unmap excluding the last page.  The
-         * expectation is that we've never mapped the last page anyway and this
-         * unmap request comes via vIOMMU support which also makes it unlikely
-         * that this page is used.  This bug was introduced well after type1 v2
-         * support was introduced, so we shouldn't need to test for v1.  A fix
-         * is queued for kernel v5.0 so this workaround can be removed once
-         * affected kernels are sufficiently deprecated.
-         */
-        if (errno == EINVAL && unmap.size && !(unmap.iova + unmap.size) &&
-            container->iommu_type == VFIO_TYPE1v2_IOMMU) {
-            trace_vfio_dma_unmap_overflow_workaround();
-            unmap.size -= 1ULL << ctz64(container->pgsizes);
-            continue;
-        }
-        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
-        return -errno;
-    }
-
-    return 0;
+    return CONT_DMA_UNMAP(container, &unmap, NULL, false);
 }
 
 static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
@@ -500,24 +477,18 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .iova = iova,
         .size = size,
     };
+    int ret;
 
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
-    /*
-     * Try the mapping, if it fails with EBUSY, unmap the region and try
-     * again.  This shouldn't be necessary, but we sometimes see it in
-     * the VGA ROM space.
-     */
-    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0 ||
-        (errno == EBUSY && vfio_dma_unmap(container, iova, size, NULL) == 0 &&
-         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0)) {
-        return 0;
-    }
+    ret = CONT_DMA_MAP(container, &map, -1, false);
 
-    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
-    return -errno;
+    if (ret < 0) {
+        error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
+    }
+    return ret;
 }
 
 static void vfio_host_win_add(VFIOContainer *container,
@@ -1221,10 +1192,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+    ret = CONT_DIRTY_BITMAP(container, &dirty, NULL);
     if (ret) {
         error_report("Failed to set dirty tracking flag 0x%x errno: %d",
-                     dirty.flags, errno);
+                     dirty.flags, -ret);
     }
 }
 
@@ -1274,11 +1245,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    ret = CONT_DIRTY_BITMAP(container, dbitmap, range);
     if (ret) {
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
-                (uint64_t)range->size, errno);
+                (uint64_t)range->size, -ret);
         goto err_out;
     }
 
@@ -2048,6 +2019,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
+    container->io_ops = &vfio_cont_io_ioctl;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
@@ -2577,3 +2549,78 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
     }
     return vfio_eeh_container_op(container, op);
 }
+
+/*
+ * Traditional ioctl() based io_ops
+ */
+
+static int vfio_io_dma_map(VFIOContainer *container,
+                           struct vfio_iommu_type1_dma_map *map,
+                           int fd, bool will_commit)
+{
+
+    /*
+     * Try the mapping, if it fails with EBUSY, unmap the region and try
+     * again.  This shouldn't be necessary, but we sometimes see it in
+     * the VGA ROM space.
+     */
+    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, map) == 0 ||
+        (errno == EBUSY &&
+         vfio_dma_unmap(container, map->iova, map->size, NULL) == 0 &&
+         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, map) == 0)) {
+        return 0;
+    }
+    return -errno;
+}
+
+static int vfio_io_dma_unmap(VFIOContainer *container,
+                             struct vfio_iommu_type1_dma_unmap *unmap,
+                             struct vfio_bitmap *bitmap,
+                             bool will_commit)
+{
+
+    while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap)) {
+        /*
+         * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
+         * v4.15) where an overflow in its wrap-around check prevents us from
+         * unmapping the last page of the address space.  Test for the error
+         * condition and re-try the unmap excluding the last page.  The
+         * expectation is that we've never mapped the last page anyway and this
+         * unmap request comes via vIOMMU support which also makes it unlikely
+         * that this page is used.  This bug was introduced well after type1 v2
+         * support was introduced, so we shouldn't need to test for v1.  A fix
+         * is queued for kernel v5.0 so this workaround can be removed once
+         * affected kernels are sufficiently deprecated.
+         */
+        if (errno == EINVAL && unmap->size && !(unmap->iova + unmap->size) &&
+            container->iommu_type == VFIO_TYPE1v2_IOMMU) {
+            trace_vfio_dma_unmap_overflow_workaround();
+            unmap->size -= 1ULL << ctz64(container->pgsizes);
+            continue;
+        }
+        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
+        return -errno;
+    }
+
+    return 0;
+}
+
+static int vfio_io_dirty_bitmap(VFIOContainer *container,
+                                struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                                struct vfio_iommu_type1_dirty_bitmap_get *range)
+{
+    int ret;
+
+    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, bitmap);
+    if (ret < 0) {
+        return -errno;
+    }
+
+    return ret;
+}
+
+VFIOContIO vfio_cont_io_ioctl = {
+    .dma_map = vfio_io_dma_map,
+    .dma_unmap = vfio_io_dma_unmap,
+    .dirty_bitmap = vfio_io_dirty_bitmap,
+};
-- 
1.8.3.1


