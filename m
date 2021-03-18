Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E1340A7E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:48:31 +0100 (CET)
Received: from localhost ([::1]:47090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvp0-0007l1-RE
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXt-0003tZ-SK; Thu, 18 Mar 2021 12:30:49 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:47278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXo-0008Au-QT; Thu, 18 Mar 2021 12:30:49 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGT8Ab065485;
 Thu, 18 Mar 2021 16:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=37gU6bkNgJSnutJuCjJhbipREiG1Mx3KqpvX0YmuNb8=;
 b=0fxTHENf8RMfmlAvpuaFFJi9UKmYosYNH2KnSsCtjekBvN97Ub2zKP6P0TyvQr5DbY8A
 cFLLD3BkKdheZ7MlLcbE0Xdsqsm9uG5fB3i9NTGZ9/0oRukWNAcwlEB/2HbG3qHLAufd
 rhDrxwGNq7+F2sFdVVFrVzerLP3t+7Ij37QPt6f8WhmAv5FZJ8zigzVQKnk9O9MPQnDj
 eU4zBYDicjACwJV81Sy/W+KepJ3YGmHmU53WyRuon4cJhf8l/3LLZ9QrzUu8eTeg+t5B
 c1p3D44j+hdvGzVUDI7MQYUEC9e99EVCxwB9PGasencDjgb3SBiRhBqH7+FFQmU6tvjP sQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 378nbmg4yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGUAvG053881;
 Thu, 18 Mar 2021 16:30:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3030.oracle.com with ESMTP id 3797b352yq-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKhnPq8L7CORMFTfVM3/ZHP996Gv4OdW04IFnst+qpJEVZs7wX42pguMpNAxAl4hdM7TMxKhcY3Mrppd2m9lcV+llIKQiMpDu5UVgJ4iKhRBmggrDGbetFQ1tafWixsX0JmY3fZTBuMZnk2mb2bnUkcL0MwbGEv8KyVHtEqL/6/c4fPfKZUCe60KvTVwD3fyFTpKnA5tnwfNyfCEWFURBXlMZOybbzNQojLbxoBkYzqNYtIg/KB9lB4koxB1nx4DuGYrBnklKZHrIxsIcgIX0MSuRNOTAMTstMHEhTAhlF5IURFymaa452BxQsdd1AdoILejwvRv7qFkttcKqKNmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37gU6bkNgJSnutJuCjJhbipREiG1Mx3KqpvX0YmuNb8=;
 b=jSSVnH/AnE+r2w4MOz9SNLsrFv6QSMWB9Md6c2WHqv6I5qRtn3mZlZfaJf2ISfyBomZnlBH/4ITCF2K6JWjTdDHjlMzSQQn+Ky7QaIGqgjvV0fxUWKunZKO0a9kQ1XFhNYYBkyDKt3aZfwZsPoXBLleTvO5hhUd01lK2CKzvMhY5ItwICTfEjAIrPdfPDauBNyjD+7+VtXt5ZqcgvqAlTVaA+wwKyKTknc3C5ksdNoVYas5O9rBtIvWysmeC1mNjXdgdMNkPV7IxyHIQ4YZg9ihZ75NuwGHhqEBOIFVRuniVAu5MuiTQPkfzsS7eeYJ4NeM3uFiwa+hh6pb7+VoQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37gU6bkNgJSnutJuCjJhbipREiG1Mx3KqpvX0YmuNb8=;
 b=WUQz5sAm6AQmOan28Ui8zOjaK7w68VcER/WJgdvRJ1WGVNtLXDZsR1ocGDQzYgLXlAUBCuH2DL51cw9G6xC4iLqMMh841yNMpOvmJSOAty0ywcIGbAloxsZu0yyOHJyUmddQUYrlKuIAW2OG7eJDBPf43sM7p4Y3o8g0GevLpAg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4565.namprd10.prod.outlook.com (2603:10b6:510:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 16:30:13 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db%2]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 16:30:13 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 3/6] qmp: decode feature bits in virtio-status
Date: Thu, 18 Mar 2021 12:29:41 -0400
Message-Id: <1616084984-11263-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-Originating-IP: [24.147.51.11]
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (24.147.51.11) by
 SJ0PR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:332::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Thu, 18 Mar 2021 16:30:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75ae705a-0a1d-488c-7a97-08d8ea2b1b0e
X-MS-TrafficTypeDiagnostic: PH0PR10MB4565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB45652070E503BA828C8B90FBE8699@PH0PR10MB4565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GyaDEOq0sWLmpAwsvbf8huirBS2hXEmAL0Yj301R/uhEecSjmf3HkTksGmBY9VvHJLnOLmETRxY14lwEH/Lv9UaA7PQvc71AziLJuom/r0mcEynOQwQ2zCBeOMD/byG7FysNbh9nguRmZyvqW2AmC+AH0sEcZ/43uSOgHPPGZ6lzziq7nVFSWCPN8so8EcOD4r9kGLtPGL9vhe3AH5uO9e4nZ8goDzCPE+euB17Zhc/1/jhTbOpSgTDcROJX7iElclbM8GM3CGr/hb+EZZDTmu/A/Phu7XHd+LMpZkLsXYbzVmqvTYUXYAcdcvP3P4CUuRCkTRezSdsOpAVSYJuq+W/NrFZuRsZstSRlK6L0z7xcmOsDq405djKNoHSZIVwdaZW6jtGC8PkrZpkEPPxDPQjFwD4LOAjdKLN88bP4xWUi6/AiPd0tSHqsGdBfG4kakbtU23dqFw0VnGJ5hMS7Zid9eDho0TD8RyMBUKf0ZQBOyYyQfyVaFxpVLvVjPCIWipbpeE9xY3OaPWlGsiv/xmfbJWnH5KDcsPQ1F5DMejW/cBRtjbUtv0UGE7LatGzjH+4VfEnmNhgJGtAIp8VspEqsBw1USL1ohWOKDSDZoLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39860400002)(376002)(136003)(8676002)(66476007)(66556008)(66946007)(38100700001)(36756003)(186003)(5660300002)(2906002)(478600001)(30864003)(86362001)(52116002)(7696005)(8936002)(316002)(16526019)(956004)(26005)(7416002)(6666004)(44832011)(83380400001)(2616005)(6916009)(107886003)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XoUdiupndV7d3VReCydqTO4JgLhD8NOQgHTTjJsg5yVAEYPSsRL8JFXOUKLM?=
 =?us-ascii?Q?swMAyKjd7IbyDzsuvH5lWTRLjcOs6hP8pxkoBmmuGJpJhhNxE4mS4+QEjmDJ?=
 =?us-ascii?Q?G73ae0UlP/sAgOx7/PW9CVH3voI5NOR6Ju5Zx4TxcUhQ++swMBuGu7DvpSmt?=
 =?us-ascii?Q?yzsUN7tPYtBi/+ScAMtNav35UB/9iPxKTb59axbepugSv8723mXF01UuvylV?=
 =?us-ascii?Q?kmv0zgj4l8XPue/v7jLw/lsHWNDxV3juE+nBA8Tdx34UNqBS0xpHFDBxDzWk?=
 =?us-ascii?Q?cBDUcK3o5uJixpQh1bnC4216AxXba0ljKqT1rtjP+qvNk9fGzhFGu3Q8NWJG?=
 =?us-ascii?Q?a/IKsbWOsSoTiHovp74njXi74FNHoV+DGnW7cBdXn7otKz5hzdEXFEFhAioj?=
 =?us-ascii?Q?9RqRyWwcCfrqz2wl7ReAoUo8tRbdmpHQ/ZeUAS0Ah5Sy79YwjSHYcf0DylNi?=
 =?us-ascii?Q?M5qdS90cwal9lB7rNMz6Vb3O2xTrD3DC7iWe0Br2na5XF7EKC1ewPLLmG4uL?=
 =?us-ascii?Q?Sh8UZStQ4+hjBv9k6TyUO9OD9z+9wnSphTk2KB6vuVvYZxFEBYJ6hRW6OzT1?=
 =?us-ascii?Q?MWm5cq3GkmTNjLpljV09tOMY5UnG675vHjQC+PZqP4Zr7UcSsl1/oKSuXE8R?=
 =?us-ascii?Q?HuHzatkZs8wSTz9tRvYv+Ns/OYuEd10/zF3TsGBkG9n40lkfCQLXEp0w1QzH?=
 =?us-ascii?Q?Gdn0QRpOvjogR1pq7jsLUyqYJRQHw+lA6UjMFqGNAI/PA95bI2SrxgmjkHwz?=
 =?us-ascii?Q?IXZMcvvaM2hiqSca0wDdi7dS35tjr3YLV1kMSb939xOvJIkvGff/SeDHqjOS?=
 =?us-ascii?Q?EFClVuGuygtOAnkZNGBzkeTS6lsXWXfNkwOgFtj8Im569mPJyQ8ctFEZfKgE?=
 =?us-ascii?Q?2zf43uxDK++EmZ3HwO9q9uOvOFofewGIeOnYGxuCHrkTum1Fk/89V3Jd4+sw?=
 =?us-ascii?Q?JcCtSqCn5ZPWF8PEnb2Qe9I/vX19qZKV+kxo0yl2vHpdBxHOFGxynY+lKI6R?=
 =?us-ascii?Q?xjH2gSwD2nP6cY4kyJ4IAzx++yPe9X3RmyibCB8CdIiSiWw3sA8JmEBkoVJ+?=
 =?us-ascii?Q?7YTO8WWep9IwRcM8mYAUp4TRqtnxJTA+DANvL66a1ZBmTUfuvep72W0xYyMx?=
 =?us-ascii?Q?9dLy6Ko9GzAwNJkx4jlKc/epl+wu1a1QqpBasflAiCqC8FzrKELbWcpHLSW6?=
 =?us-ascii?Q?/kaTiBUG+zOEf6TqQhnZXaqDugB5sQtxktjmWtUTqB9xnRnjk4TqowfECQCq?=
 =?us-ascii?Q?1tiiE2IMaZmZY4Xs7rTjKicvExJWmNTxqyumI0kUNBASQb2UerNKAv398yUu?=
 =?us-ascii?Q?KU4l2jqUYZ5zwTZ1tzYruA46?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ae705a-0a1d-488c-7a97-08d8ea2b1b0e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:30:13.2805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WO0AAI4hr3fV/iSU7eZFi7udZ8e7DZQQn9OPh5GWFMH2E8DHCGWcGIVvmXs1FN2eIjAEklIrQLNAERvU+y8aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=jonah.palmer@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Display feature names instead of a features bitmap for host, guest,
and backend.

Decode features according to device type, transport features are
on the first line. Undecoded bits (if any) are stored in a separate
field.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/virtio-blk.c        |  23 ++++
 hw/char/virtio-serial-bus.c  |  11 ++
 hw/display/virtio-gpu-base.c |  12 ++
 hw/net/virtio-net.c          |  38 ++++++
 hw/scsi/virtio-scsi.c        |  12 ++
 hw/virtio/virtio-balloon.c   |  14 +++
 hw/virtio/virtio-iommu.c     |  14 +++
 hw/virtio/virtio.c           | 127 +++++++++++++++++++-
 include/hw/virtio/virtio.h   |  13 ++
 qapi/virtio.json             | 280 +++++++++++++++++++++++++++++++++++++++++--
 10 files changed, 531 insertions(+), 13 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e8600b0..c2858f8 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -48,6 +49,28 @@ static VirtIOFeature feature_sizes[] = {
     {}
 };
 
+qmp_virtio_feature_map_t blk_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BLK_F_##name, VIRTIO_BLK_FEATURE_##name }
+    FEATURE_ENTRY(SIZE_MAX),
+    FEATURE_ENTRY(SEG_MAX),
+    FEATURE_ENTRY(GEOMETRY),
+    FEATURE_ENTRY(RO),
+    FEATURE_ENTRY(BLK_SIZE),
+    FEATURE_ENTRY(TOPOLOGY),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(DISCARD),
+    FEATURE_ENTRY(WRITE_ZEROES),
+#ifndef VIRTIO_BLK_NO_LEGACY
+    FEATURE_ENTRY(BARRIER),
+    FEATURE_ENTRY(SCSI),
+    FEATURE_ENTRY(FLUSH),
+    FEATURE_ENTRY(CONFIG_WCE),
+#endif
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
 {
     s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index b200389..9791b1d 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -33,6 +34,16 @@
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-access.h"
 
+qmp_virtio_feature_map_t serial_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_CONSOLE_F_##name, VIRTIO_SERIAL_FEATURE_##name }
+    FEATURE_ENTRY(SIZE),
+    FEATURE_ENTRY(MULTIPORT),
+    FEATURE_ENTRY(EMERG_WRITE),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static struct VirtIOSerialDevices {
     QLIST_HEAD(, VirtIOSerial) devices;
 } vserdevices;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 4a57350..dd8e9e7 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -16,9 +16,21 @@
 #include "hw/virtio/virtio-gpu.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t gpu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_GPU_F_##name, VIRTIO_GPU_FEATURE_##name }
+    FEATURE_ENTRY(VIRGL),
+    FEATURE_ENTRY(EDID),
+    FEATURE_ENTRY(RESOURCE_UUID),
+    FEATURE_ENTRY(RESOURCE_BLOB),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 void
 virtio_gpu_base_reset(VirtIOGPUBase *g)
 {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5150f29..e405d82 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -35,6 +35,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-events-migration.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/virtio/virtio-access.h"
 #include "migration/misc.h"
 #include "standard-headers/linux/ethtool.h"
@@ -89,6 +90,43 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
+qmp_virtio_feature_map_t net_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_NET_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(CSUM),
+    FEATURE_ENTRY(GUEST_CSUM),
+    FEATURE_ENTRY(CTRL_GUEST_OFFLOADS),
+    FEATURE_ENTRY(MTU),
+    FEATURE_ENTRY(MAC),
+    FEATURE_ENTRY(GUEST_TSO4),
+    FEATURE_ENTRY(GUEST_TSO6),
+    FEATURE_ENTRY(GUEST_ECN),
+    FEATURE_ENTRY(GUEST_UFO),
+    FEATURE_ENTRY(HOST_TSO4),
+    FEATURE_ENTRY(HOST_TSO6),
+    FEATURE_ENTRY(HOST_ECN),
+    FEATURE_ENTRY(HOST_UFO),
+    FEATURE_ENTRY(MRG_RXBUF),
+    FEATURE_ENTRY(STATUS),
+    FEATURE_ENTRY(CTRL_VQ),
+    FEATURE_ENTRY(CTRL_RX),
+    FEATURE_ENTRY(CTRL_VLAN),
+    FEATURE_ENTRY(CTRL_RX_EXTRA),
+    FEATURE_ENTRY(GUEST_ANNOUNCE),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(CTRL_MAC_ADDR),
+    FEATURE_ENTRY(STANDBY),
+    FEATURE_ENTRY(SPEED_DUPLEX),
+    FEATURE_ENTRY(HASH_REPORT),
+    FEATURE_ENTRY(RSS),
+    FEATURE_ENTRY(RSC_EXT),
+#ifndef VIRTIO_NET_NO_LEGACY
+    FEATURE_ENTRY(GSO),
+#endif /* VIRTIO_NET_NO_LEGACY */
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 99ff261..904e297 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "migration/qemu-file-types.h"
@@ -29,6 +30,17 @@
 #include "hw/virtio/virtio-access.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t scsi_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_SCSI_F_##name, VIRTIO_SCSI_FEATURE_##name }
+    FEATURE_ENTRY(INOUT),
+    FEATURE_ENTRY(HOTPLUG),
+    FEATURE_ENTRY(CHANGE),
+    FEATURE_ENTRY(T10_PI),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static inline int virtio_scsi_get_lun(uint8_t *lun)
 {
     return ((lun[2] << 8) | lun[3]) & 0x3FFF;
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index e770955..11a32ad 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "migration/misc.h"
@@ -34,6 +35,19 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 
+qmp_virtio_feature_map_t balloon_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BALLOON_F_##name, VIRTIO_BALLOON_FEATURE_##name }
+    FEATURE_ENTRY(MUST_TELL_HOST),
+    FEATURE_ENTRY(STATS_VQ),
+    FEATURE_ENTRY(DEFLATE_ON_OOM),
+    FEATURE_ENTRY(FREE_PAGE_HINT),
+    FEATURE_ENTRY(PAGE_POISON),
+    FEATURE_ENTRY(REPORTING),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
 
 typedef struct PartiallyBalloonedPage {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c2883a2..1b7c202 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -25,6 +25,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
@@ -36,6 +37,19 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci.h"
 
+qmp_virtio_feature_map_t iommu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_IOMMU_F_##name, VIRTIO_IOMMU_FEATURE_##name }
+    FEATURE_ENTRY(INPUT_RANGE),
+    FEATURE_ENTRY(DOMAIN_RANGE),
+    FEATURE_ENTRY(MAP_UNMAP),
+    FEATURE_ENTRY(BYPASS),
+    FEATURE_ENTRY(PROBE),
+    FEATURE_ENTRY(MMIO),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 69ef890..08ca635 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -31,9 +31,30 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include CONFIG_DEVICES
 
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
+static qmp_virtio_feature_map_t transport_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(NOTIFY_ON_EMPTY),
+    FEATURE_ENTRY(ANY_LAYOUT),
+    FEATURE_ENTRY(VERSION_1),
+    FEATURE_ENTRY(IOMMU_PLATFORM),
+    FEATURE_ENTRY(RING_PACKED),
+    FEATURE_ENTRY(ORDER_PLATFORM),
+    FEATURE_ENTRY(SR_IOV),
+    FEATURE_ENTRY(BAD_FEATURE),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_RING_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(INDIRECT_DESC),
+    FEATURE_ENTRY(EVENT_IDX),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3898,6 +3919,103 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+#define CONVERT_FEATURES(type, map)                \
+    ({                                           \
+        type *list = NULL;                         \
+        type *node;                                \
+        for (i = 0; map[i].virtio_bit != -1; i++) {\
+            bit = 1ULL << map[i].virtio_bit;       \
+            if ((bitmap & bit) == 0) {             \
+                continue;                          \
+            }                                      \
+            node = g_new0(type, 1);                \
+            node->value = map[i].qapi_virtio_enum; \
+            node->next = list;                     \
+            list = node;                           \
+            bitmap ^= bit;                         \
+        }                                          \
+        list;                                      \
+    })
+
+static VirtioDeviceFeatures *qmp_decode_features(const char *name,
+                                                 uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+
+    /* transport features */
+    features->transport = CONVERT_FEATURES(VirtioTransportFeatureList, \
+                                           transport_map);
+
+    /* device features */
+    features->type = qapi_enum_parse(&VirtioType_lookup,
+                                     name, -1, NULL);
+    switch (features->type) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        features->u.virtio_serial.features =
+                          CONVERT_FEATURES(VirtioSerialFeatureList, serial_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        features->u.virtio_blk.features =
+                                CONVERT_FEATURES(VirtioBlkFeatureList, blk_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        features->u.virtio_gpu.features =
+                                CONVERT_FEATURES(VirtioGpuFeatureList, gpu_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_TYPE_VIRTIO_NET:
+        features->u.virtio_net.features =
+                                CONVERT_FEATURES(VirtioNetFeatureList, net_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        features->u.virtio_scsi.features =
+                              CONVERT_FEATURES(VirtioScsiFeatureList, scsi_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        features->u.virtio_balloon.features =
+                        CONVERT_FEATURES(VirtioBalloonFeatureList, balloon_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        features->u.virtio_iommu.features =
+                            CONVERT_FEATURES(VirtioIommuFeatureList, iommu_map);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_TYPE_VIRTIO_9P:
+    case VIRTIO_TYPE_VIRTIO_INPUT:
+    case VIRTIO_TYPE_VHOST_USER_FS:
+    case VIRTIO_TYPE_VHOST_VSOCK:
+    case VIRTIO_TYPE_VIRTIO_CRYPTO:
+    case VIRTIO_TYPE_VIRTIO_PMEM:
+    case VIRTIO_TYPE_VIRTIO_RNG:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    features->has_unknown_features = bitmap != 0;
+    if (features->has_unknown_features) {
+        features->unknown_features = bitmap;
+    }
+
+    return features;
+}
+
 VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
 {
     VirtIODevice *vdev;
@@ -3910,9 +4028,12 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
     }
 
     status = g_new0(VirtioStatus, 1);
-    status->guest_features = vdev->guest_features;
-    status->host_features = vdev->host_features;
-    status->backend_features = vdev->backend_features;
+    status->guest_features = qmp_decode_features(vdev->name,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->name,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->name,
+                                                   vdev->backend_features);
     status->device_id = vdev->device_id;
 
     switch (vdev->device_endian) {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 2470e09..6fcb5e0 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -163,6 +163,19 @@ struct VirtioDeviceClass {
     bool (*primary_unplug_pending)(void *opaque);
 };
 
+typedef struct {
+    int virtio_bit;
+    int qapi_virtio_enum;
+} qmp_virtio_feature_map_t;
+
+extern qmp_virtio_feature_map_t serial_map[];
+extern qmp_virtio_feature_map_t blk_map[];
+extern qmp_virtio_feature_map_t gpu_map[];
+extern qmp_virtio_feature_map_t net_map[];
+extern qmp_virtio_feature_map_t scsi_map[];
+extern qmp_virtio_feature_map_t balloon_map[];
+extern qmp_virtio_feature_map_t iommu_map[];
+
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 4af95a0..8b5785f 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -79,6 +79,253 @@
 }
 
 ##
+# @VirtioTransportFeature:
+#
+# An enumeration of Virtio device transport features, including virtio-ring
+#
+# Since: 6.0
+##
+
+{ 'enum': 'VirtioTransportFeature',
+  'data': [ 'notify-on-empty', 'any-layout', 'version-1', 'iommu-platform',
+            'ring-packed', 'order-platform', 'sr-iov', 'indirect-desc',
+            'event-idx', 'bad-feature' ]
+}
+
+##
+# @VirtioSerialFeature:
+#
+# An enumeration of Virtio serial features
+#
+# Since: 6.0
+##
+
+{ 'enum': 'VirtioSerialFeature',
+  'data': [ 'size', 'multiport', 'emerg-write' ]
+}
+
+##
+# @VirtioBlkFeature:
+#
+# An enumeration of Virtio block features
+#
+# Since: 6.0
+##
+
+{ 'enum': 'VirtioBlkFeature',
+  'data': [ 'size-max', 'seg-max', 'geometry', 'ro', 'blk-size', 'topology',
+            'mq', 'discard', 'write-zeroes', 'barrier', 'scsi', 'flush',
+            'config-wce' ]
+}
+
+##
+# @VirtioGpuFeature:
+#
+# An enumeration of Virtio gpu features
+#
+# Since: 6.0
+##
+
+{ 'enum': 'VirtioGpuFeature',
+  'data': [ 'virgl', 'edid', 'resource-uuid', 'resource-blob' ]
+}
+
+##
+# @VirtioNetFeature:
+#
+# An enumeration of Virtio net features
+#
+# Since: 6.0
+##
+
+{ 'enum': 'VirtioNetFeature',
+  'data': [ 'csum', 'guest-csum', 'ctrl-guest-offloads', 'mtu', 'mac',
+            'guest-tso4', 'guest-tso6', 'guest-ecn', 'guest-ufo',
+            'host-tso4', 'host-tso6', 'host-ecn', 'host-ufo', 'mrg-rxbuf',
+            'status', 'ctrl-vq', 'ctrl-rx', 'ctrl-vlan', 'ctrl-rx-extra',
+            'guest-announce', 'mq', 'ctrl-mac-addr', 'standby',
+            'speed-duplex', 'gso', 'hash-report', 'rss', 'rsc-ext' ]
+}
+
+##
+# @VirtioScsiFeature:
+#
+# An enumeration of Virtio scsi features
+#
+# Since: 6.0
+##
+
+{ 'enum': 'VirtioScsiFeature',
+  'data': [ 'inout', 'hotplug', 'change', 't10-pi' ]
+}
+
+##
+# @VirtioBalloonFeature:
+#
+# An enumeration of Virtio balloon features
+#
+# Since: 6.0
+##
+
+{ 'enum': 'VirtioBalloonFeature',
+  'data': [ 'must-tell-host', 'stats-vq', 'deflate-on-oom', 'free-page-hint',
+            'page-poison', 'reporting' ]
+}
+
+##
+# @VirtioIommuFeature:
+#
+# An enumeration of Virtio iommu features
+#
+# Since: 6.0
+##
+
+{ 'enum': 'VirtioIommuFeature',
+  'data': [ 'input-range', 'domain-range', 'map-unmap', 'bypass', 'probe',
+            'mmio' ]
+}
+
+##
+# @VirtioDeviceFeaturesBase:
+#
+# The common fields that apply to all Virtio devices
+#
+# @type: virtio device type
+# @transport: the list of transport features of the virtio device
+# @unknown-features: virtio device features bitmap that have not been decoded
+#
+# Since: 6.0
+##
+
+{ 'struct': 'VirtioDeviceFeaturesBase',
+  'data': {
+    'type': 'VirtioType',
+    'transport': [ 'VirtioTransportFeature' ],
+    '*unknown-features': 'uint64'
+  }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsSerial:
+#
+# The options that apply to Virtio serial device
+#
+# @features: List of the device features
+#
+# Since: 6.0
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsSerial',
+  'data': { 'features': [ 'VirtioSerialFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsBlk:
+#
+# The options that apply to Virtio block device
+#
+# @features: List of the device features
+#
+# Since: 6.0
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBlk',
+  'data': { 'features': [ 'VirtioBlkFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsGpu:
+#
+# The options that apply to Virtio GPU device
+#
+# @features: List of the device features
+#
+# Since: 6.0
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsGpu',
+  'data': { 'features': [ 'VirtioGpuFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsNet:
+#
+# The options that apply to Virtio net device
+#
+# @features: List of the device features
+#
+# Since: 6.0
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsNet',
+  'data': { 'features': [ 'VirtioNetFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsScsi:
+#
+# The options that apply to Virtio SCSI device
+#
+# @features: List of the device features
+#
+# Since: 6.0
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsScsi',
+  'data': { 'features': [ 'VirtioScsiFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsBalloon:
+#
+# The options that apply to Virtio balloon device
+#
+# @features: List of the device features
+#
+# Since: 6.0
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBalloon',
+  'data': { 'features': [ 'VirtioBalloonFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsIommu:
+#
+# The options that apply to Virtio IOMMU device
+#
+# @features: List of the device features
+#
+# Since: 6.0
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsIommu',
+  'data': { 'features': [ 'VirtioIommuFeature' ] }
+}
+
+##
+# @VirtioDeviceFeatures:
+#
+# A union to define the list of features for a virtio device
+#
+# Since: 6.0
+##
+
+{ 'union': 'VirtioDeviceFeatures',
+  'base': 'VirtioDeviceFeaturesBase',
+  'discriminator': 'type',
+  'data': {
+    'virtio-serial': 'VirtioDeviceFeaturesOptionsSerial',
+    'virtio-blk': 'VirtioDeviceFeaturesOptionsBlk',
+    'virtio-gpu': 'VirtioDeviceFeaturesOptionsGpu',
+    'virtio-net': 'VirtioDeviceFeaturesOptionsNet',
+    'virtio-scsi': 'VirtioDeviceFeaturesOptionsScsi',
+    'virtio-balloon': 'VirtioDeviceFeaturesOptionsBalloon',
+    'virtio-iommu': 'VirtioDeviceFeaturesOptionsIommu'
+  }
+}
+
+##
 # @VirtioStatus:
 #
 # @device-id: VirtIODevice status
@@ -101,9 +348,9 @@
   'data': {
     'device-id': 'int',
     'device-endian': 'VirtioStatusEndianness',
-    'guest-features': 'uint64',
-    'host-features': 'uint64',
-    'backend-features': 'uint64',
+    'guest-features': 'VirtioDeviceFeatures',
+    'host-features': 'VirtioDeviceFeatures',
+    'backend-features': 'VirtioDeviceFeatures',
     'num-vqs': 'uint16'
   }
 }
@@ -123,18 +370,31 @@
 #
 # -> { "execute": "x-debug-virtio-status",
 #      "arguments": {
-#          "path": "/machine/peripheral-anon/device[3]/virtio-backend"
+#          "path": "/machine/peripheral-anon/device[1]/virtio-backend"
 #      }
 #   }
 # <- { "return": {
-#          "backend-features": 0,
-#          "guest-features": 5111807911,
-#          "num-vqs": 3,
-#          "host-features": 6337593319,
 #          "device-endian": "little",
-#          "device-id": 1
+#          "device-id": 3,
+#          "backend-features": {
+#              "transport": [],
+#              "type": "virtio-serial",
+#              "features": []
+#          },
+#          "num-vqs": 64,
+#          "guest-features": {
+#              "transport": [ "event-idx", "indirect-desc", "version-1" ],
+#              "type": "virtio-serial",
+#              "features": [ "multiport" ]
+#          },
+#          "host-features": {
+#              "transport": [ "event-idx", "indirect-desc", "bad-feature",
+#                             "version-1", "any-layout", "notify-on-empty" ],
+#              "type": "virtio-serial",
+#              "features": [ "emerg-write", "multiport" ]
+#          }
 #      }
-#    }
+#  }
 #
 ##
 
-- 
1.8.3.1


