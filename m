Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B78648BC27
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:06:51 +0100 (CET)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7S6E-0000gK-CO
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:06:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdb-0000j5-ID
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdW-0005fz-Pn
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:15 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMv7qW005893
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=cp9DO/q3Op+srzMyWROMbWlwHD+1KhGfMZ6ccvJFoRU=;
 b=beNOXXQ2gyzOV5/lRF2mesBOBu23oD6YOuvKn7QyejrMtwCCwF+DCoTgx4lPhSPFfEPF
 x/V7IyvSg/yxaifDV1F5fU4XphtbvS75h70/xCisd8oC5WymDro2xzGacm/nlULVqJCs
 KGOlVRA9dynMypYatuoKsfhmvMmxuV5aIkTBfQ+oaqDIBjCfvNlmui0mX+jLhq53I386
 Y7FOhejJVdFYJOsBFzDNEEpc6OVbRlPWIoVfsrW7U6pOyn6rqEzP47lDM4ml/Y8nO3A3
 UnHnBqBac7lc3alYMkbX2WSf8RGWNeMzJpS1hzRZ/RG9fITJmqNeI08YWujgyiqqLnlU dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgd1u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KATa069271
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3030.oracle.com with ESMTP id 3deyqy1gju-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxufyHRb8wneW3qm0tlLgLUTSl9MAa+KtrkcE9R0mdChAY+SbDqgy0Setm1/XuORU72RkUvVgW4mJbFi4w6piWP0hfRvqeGzfa8LzIqqXwsONsBHY5VAlaGqVFkDQu0KzeehkYEMPqttuiObTd8fZ70KJZppdDzdoHFwTX3ukFLjWtgv8/R2RM/ROE+ejsRtucgODy86lCEKUVeyYU2o1sVQAhaZSIRMvqj0smuWsjYGT+5sdEiZ2xdXV98GsyL85FFusYiHP+0VmO7/OHWhZLem20n4Pcwex+qn87sBNJWiYp3i2UtzuzTfp4fo+hHMkHH5ddJ9scCfwkajLhxYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cp9DO/q3Op+srzMyWROMbWlwHD+1KhGfMZ6ccvJFoRU=;
 b=N2l6ElrO2BN6yXdCMV45goI0P2MTMpL3N7phlYXL9iRqjyC7z974ioiNiP1DrqVc7VYacFkZTcdKaw1ag8nwbNRrkEaGqJVO4eT5HdexDsliL6a/irzICPyFnT+LM3QWt921n2j2b6bgmji8AH1mbndxyXi/MzUcK2pyD3JZcMS/xKpzHYSKX+GiHlYGsoujNeIWX3VFRXX2nUyssh62YdVDygIjPBgYtCNiA6JKeRfSNMgBBIHztL67R9m1nIh+wzKE9UZrXgZq+K3RGj96hMR3fyb+R4x6ahvLXyLdAYKlMgR7GAzPd/lG3AVjI1K462CJQGokZKWWy//cBmjGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp9DO/q3Op+srzMyWROMbWlwHD+1KhGfMZ6ccvJFoRU=;
 b=j/tTnBXJg8Y3ti5I5C4mrZ4q0tUre8qpk4gheHoPqjsx6Y9yXvsz3DVWBO4QesDH7/XpdF4fh8GML5QrDQmvhHQDbCmywBuAHsjTTvQwh82B63aEdn4izSWtDPlpC5GLqWJYbObgh6HNkAXCSlaXq45aMel2wI/YTP9z8Sd2Mm8=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 12 Jan
 2022 00:37:04 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:04 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 03/21] vfio-user: add container IO ops vector
Date: Tue, 11 Jan 2022 16:43:39 -0800
Message-Id: <58534cabf2ca1891f7b8a4c09d8ec7e08bcdd695.1641584316.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a876c648-b9e1-40e3-9ebc-08d9d563a785
X-MS-TrafficTypeDiagnostic: PH7PR10MB5813:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5813681937F7C7BE77C8AD3EB6529@PH7PR10MB5813.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U3faJ5T5+v0z2UFNecLvGFr+iCWaHk0x768TppoK4rqSuhN6quGnarXknjGEhlPBmtzJZxVwPFQLRJYjvHCDV4/Oqu2oEW9C/s2XnNHZ7RP0rDwpEHyx6MiF3x5gRmm52aiu2Xn/WI2A3VZT1Wsk6rlac1MOqlq+YFYLu7r0z+nviNKLK1SECbLwgkOoSVSJX9RNCf4IR4dA1UxVso8+lXD0/vm2AH8GSHyP2XENSfZBcisVKzhQ7nDXN9cjnRtC+Tdr7Gv/SmrHsdotmQsGxAoAqzsph0keY84UTrBDwJ9m11cfPBwQZy4c78x1DGCYP87Uc5HLVhMi2Cr/IweSz3Cf0XBYv20hZcvjAuSyWRCJGALpqF2gJAZZuXxkefWolgRi2XGZJGD+duemAYVj97shoXU6tVoqxQxslne4kSdvBvBK0E+7GfdfBEUAETzDn+enkLC5Ye1LZbHFv7HvbpmnenJJWRpTuX2nCWkMwQZvnTym1Ih47rvW6Q4bGHASfoflZOlVzGJ+DzMqfwDq//srqo9SDgZv8odm28ecI3O4XF/pPYzYhHh8RzCEYOQWQPr2XJahIUwtjC5cvKeWryLpr8vFyWjvKKHkT0QA4tYGaZwu04KVKciczzzbfqHdXTrnqxIJ85Lg4D+D3n1YaFCe/Z1Kevr9dC47LarOvPf06skC8j6F0wk3QbVgDlhen7yr8kQVSHdiiU5t6TwERg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6506007)(8936002)(26005)(6512007)(36756003)(186003)(8676002)(52116002)(6666004)(86362001)(6916009)(6486002)(316002)(508600001)(2616005)(83380400001)(66946007)(5660300002)(38100700002)(66556008)(38350700002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fMU8Gr7/4g5RKukJ8cy7b+m8AEZFRQoG7anaUwQ/yo12iuvbn+CGxkV8W+QY?=
 =?us-ascii?Q?mr/hBnbHT6796V7hxjpw9k6vgMb8ieFitHz7MU0z3nQmAwKGDdcQR+k8zE3I?=
 =?us-ascii?Q?okGBgS49bsjygNDwmRhXhTaWlH2x6w6ulXBKRS5h3V7eojhNyFYWUj4tdIAE?=
 =?us-ascii?Q?gZ3TTbV9vN20YVAQwIIOVrrjhfE+MWW5Kr85nwXsE5USkcOjzP3ptB1AGVL+?=
 =?us-ascii?Q?cFCwUtVvT9RiJwRAsdQTPsemfJccTuiyKx/0cbG+ASEQ1kZmqO8aCFMuzfPo?=
 =?us-ascii?Q?KNwypKHFuJJaZo3dQF/ly94ohXtIWGohOsdQDHQ/WMhvHuPJXzzTprsIGr33?=
 =?us-ascii?Q?WM3PAdIBUkxsUheob9aWZ/GmDd0MkHZtGYKGYjqASOLJi4EHf4dRQisfXnNL?=
 =?us-ascii?Q?BHlZJvcIjBk9OZ0Fsnovslf3eiKI1Bj3ap9k+bVc08XHlM08f3mBsIP+O6U9?=
 =?us-ascii?Q?eusU1iTbixYGG1WrH9IuceBWAMJg3uormRQe/o156mcn2ZBVta9Vb+xicFd6?=
 =?us-ascii?Q?7IV/c7ZK2t8V0e5Szw5WkEEwyH8tWAoGLk4XriPQrjvh5xuAp1etZxJe0a/1?=
 =?us-ascii?Q?zBy6cbWTRJyk8thFTDQEgqIq5cR3241r1ZNSpGzdf8AhrJ6Y+s39yUo2jntl?=
 =?us-ascii?Q?gG9n/imKwpRKku42Ev/ob6wV+D7o54oHmoKy5jsXMM36XCb7FOuvKOtiLAsX?=
 =?us-ascii?Q?xGXS6lNgeoZ1HpLrRnHKUKCxU84APiBVWuTDzwIBzXp7NW8sKdtTaMnG/AJe?=
 =?us-ascii?Q?6xRvzeZGpehvd2icxQxVTgK6JV0SRixuaVvHCXzKeY8aUDx7UUPNU8/3tdXF?=
 =?us-ascii?Q?LEnA4e6O+L7Ahu7Mv+zYn3T9+CM4Q2VrZMYaeZ40vXJEJMMAEEgf7XPS/D2b?=
 =?us-ascii?Q?eWuHLX66e7t80HGi5qvXyPTtucl5QF0vDAR0ART+F3+M+9w3OyRMB6ZmaPGC?=
 =?us-ascii?Q?HzSKVrjVeA7+QohlxbAwW2RzH5xcxlfDDlIO4ReSn8fPHv5jX9XapQmoe+v5?=
 =?us-ascii?Q?8riFhvLHHTC/eMevaPd3/752PFwzgnL41CliCOTOLAL+oN9MYIQj2+pIvpk0?=
 =?us-ascii?Q?HEk2J1Qyozz1oNWdfOCZzqK0lmfnuk3XEfmEsgK4Qh5XuxernLIkZbb695BM?=
 =?us-ascii?Q?nLnSTY/Nsa/j2UFTsTSPM7LCFDozAOfA4hOK3BSKBl92kU6GbA3ZiY9NNcJk?=
 =?us-ascii?Q?pb2wexfPwzE64LHltvyULZpMqTzfsu8EzpjdUKFXcWCOqS1QJuCuCSol/65t?=
 =?us-ascii?Q?ZaF+KXHlSmNvJuNEHQB77AJXV6x3yri95iyEZhwIIK6f3lyxAnf1VpCjUnuE?=
 =?us-ascii?Q?X8c0HszKlhz/3MwVsnvd6z/ypBCeeaXaGq6vVkP3rSw6jwJHU3kF4PqaGWSa?=
 =?us-ascii?Q?vJVqaawdo2sGwphJNYcrA4wZtsArovJhycLcAWj+Ies8PW1vC0WxNRAmUEPu?=
 =?us-ascii?Q?kl6gro8edAM8+GIHYwaCsr/SPLJFtHibyMDP36bPSIhCb4otrOQ3ba3nfkAR?=
 =?us-ascii?Q?fxP8h5IdMXjKeZU3AfPTv+fgimk8+4lZFDmK0v86pDBqdR2f+QJL1Rn0mw/9?=
 =?us-ascii?Q?S+89C0cxLUowoEz9u2V4376fCnZTDCP0HLX4GGdujs08IVSU4a7wLHCVGEBr?=
 =?us-ascii?Q?cyvdw+UawqozYxAyatVLKwMmnB5qiGz96fsotItbp3v58fG1e262uo6NKksd?=
 =?us-ascii?Q?mS+BTg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a876c648-b9e1-40e3-9ebc-08d9d563a785
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:03.9603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sX9u7ZAltQSlZl1FN2zbxH5UgmerYCEdL9R52TZnjTjni9hZym2hbzZbNDBWtFUOs09/cPVHviaWfjomSIXURFBKakxMT4TpFLJIglGy0vM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: DtDtXo62AT3HfCPsg04tns84pwxWG9tn
X-Proofpoint-ORIG-GUID: DtDtXo62AT3HfCPsg04tns84pwxWG9tn
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

Used for communication with VFIO driver
(prep work for vfio-user, which will communicate over a socket)

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 include/hw/vfio/vfio-common.h |  33 +++++++++++
 hw/vfio/common.c              | 126 ++++++++++++++++++++++++++++--------------
 2 files changed, 117 insertions(+), 42 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0..2761a62 100644
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
@@ -154,6 +156,37 @@ struct VFIODeviceOps {
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
+                   struct vfio_iommu_type1_dma_map *map);
+    int (*dma_unmap)(VFIOContainer *container,
+                     struct vfio_iommu_type1_dma_unmap *unmap,
+                     struct vfio_bitmap *bitmap);
+    int (*dirty_bitmap)(VFIOContainer *container,
+                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                        struct vfio_iommu_type1_dirty_bitmap_get *range);
+};
+
+#define CONT_DMA_MAP(cont, map) \
+    ((cont)->io_ops->dma_map((cont), (map)))
+#define CONT_DMA_UNMAP(cont, unmap, bitmap) \
+    ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
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
index 080046e..dbf23c0 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -431,12 +431,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
         goto unmap_exit;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    ret = CONT_DMA_UNMAP(container, unmap, bitmap);
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
+    return CONT_DMA_UNMAP(container, &unmap, NULL);
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
+    ret = CONT_DMA_MAP(container, &map);
 
-    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
-    return -errno;
+    if (ret < 0) {
+        error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
+    }
+    return ret;
 }
 
 static void vfio_host_win_add(VFIOContainer *container,
@@ -1230,10 +1201,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
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
 
@@ -1283,11 +1254,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
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
 
@@ -2058,6 +2029,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
+    container->io_ops = &vfio_cont_io_ioctl;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
@@ -2594,3 +2566,73 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
     }
     return vfio_eeh_container_op(container, op);
 }
+
+/*
+ * Traditional ioctl() based io_ops
+ */
+
+static int vfio_io_dma_map(VFIOContainer *container,
+                           struct vfio_iommu_type1_dma_map *map)
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
+                             struct vfio_bitmap *bitmap)
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
+
+    return ret < 0 ? -errno : ret;
+}
+
+VFIOContIO vfio_cont_io_ioctl = {
+    .dma_map = vfio_io_dma_map,
+    .dma_unmap = vfio_io_dma_unmap,
+    .dirty_bitmap = vfio_io_dirty_bitmap,
+};
-- 
1.8.3.1


