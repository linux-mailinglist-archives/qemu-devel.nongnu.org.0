Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCBC5386EB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:52:20 +0200 (CEST)
Received: from localhost ([::1]:40428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjYx-0000g0-Ki
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvis7-0003gO-Uq
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:03 -0400
Received: from mail-dm6nam10on20630.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::630]:18414
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvis5-0008M4-OI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qza9g1Jg51/dJcohJyhKUS1hG1Itssup65hsV/xWCkRlC+hBE/+vWVmzsyKU6uZSmURGRNsD1U1yk2QrbEOramLNkZrUpILWC+VDGJRf7kTWgmPMyViTKmbK7iRNapZT/rkt95QrLdyjC/bA7ndoRLy9wxVd+gQQckV9/0VRSRWf36Q11xHME0b5/ERAYqhE/mzDAPUFSDMxyw4T88tq7BbeH/FVtBEKYdiqngToXCW9BUb8P7ZQUQ5CueIdOGS3gZOcqDXki3IUAvjxFQYL59cR6yMGX2wJNIwbU9naxaWYX7XfT3gERInmgcE303RPu98bGi6BBT53PjkfsY1Pyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jypF+XZ5TJO5MGBaBe6ueZYxzrFZm4hXeUTs3lXLfRs=;
 b=ocGBuH+NpPc3is7hiDtEF4bDlhCK8WhQuOWbBEfXfbi39BBdFMQi3bVzVrfRkKYZ3qdY5X9FKwRLue0RGcW+B4bSuF7+BcZsMyxu8rnSdvc20BwPs98nBfNZAufikzE3/54CtPhPLUH+bAliQATcnAp0ecI30hngQNFKFwasfPMjAap5OUE+s/TmHTWfZzkVDR5ODZu6YGlmfrVuAXvL2lTkgAait3rEOj8i9tR5Tasi6jvyvOpU5VfowsrTJOP3vxNo597DwxPmV+K3xGsYOWbSbU0vCt8N2fGhFj8J7k7d4DVM4bkRyh1Ry7rgiOOEwNN5FS1fxCQu2Lt8Sfi1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jypF+XZ5TJO5MGBaBe6ueZYxzrFZm4hXeUTs3lXLfRs=;
 b=pqd8qbAwOfEoKsNUW54KrAfJ8N7v3vZHwwT4M1J7wQLF5r1XfozNWGZ9CIHY1nIF9Xal/zefjwyhrfagb6Y69E8s/CWg8I9cbsNwlNASVDNm65UaAn4BFWEvMmCi4WX2Pq41APxilfkNi2gICtJZMtTD4xPwRhpykslOdEwiyvemTxKWtzbvGfXhIr3c6jKoXR8fYSEJqN7Vusc3FJ+WGQQETMyIsfd35Ji5oPaeZxwIHpLyzCSdmkqSVLP3DhU2QY3mk4jwrqWtdC/ZQ1Ye/ZFmAzHwJyPOAJVHvv4TVZOKXf9c27Qjk7jdnrqu6LQ7KnxGwzBIfeh8oWbdBFciUA==
Received: from MWHPR08CA0044.namprd08.prod.outlook.com (2603:10b6:300:c0::18)
 by BN8PR12MB2994.namprd12.prod.outlook.com (2603:10b6:408:42::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Mon, 30 May
 2022 17:07:59 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::fc) by MWHPR08CA0044.outlook.office365.com
 (2603:10b6:300:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:07:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:07:58 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:07:58 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:07:57 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:07:54 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 04/11] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
Date: Mon, 30 May 2022 20:07:32 +0300
Message-ID: <20220530170739.19072-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcdc6f24-c8d3-4398-af4d-08da425ef252
X-MS-TrafficTypeDiagnostic: BN8PR12MB2994:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2994C08288A8D6D39C73B43BDEDD9@BN8PR12MB2994.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pURG42hkpy7fL+ILNVx76YfBKVArihXaK/UYbyUiNLhw6K3ORuiGir1ECymPTH7G/RcH4uNPWFzLT42JvK8duGy3LLVrR6bk1+zNF3nhhm6ve0nV1cE44pvABShF7k+5DCmXRbZkhvRewJ52eKH7oey8e6VQug4vjnF9GWhK0EH7J7phf4NcGjY5NT/5qMKuV2JnpvyaHKTEV4esDpeh+W9c04VIFFFkNIplPEfnAeU1gsrmSkERaONB0b9z4qTxMsDQlF8Q5JYmC1m4CPYKYduFVhIh4rI4Y2UASZfYKcGTC4FQ3Khjfm60bclwLBvUFgMkrea0AeX/QgxesolZ0A5odC8FB+upLRtSWb3uCL0+dpvXmO9SUjJPcHCtSTZ3clLiCzH3Yu8j5kAU05HnyJ2/dX8gZiYGTplgI24cDUgAgQuoDM6bYbxCipWycYHn76GWuDpEgxT/0ASlyBjwcdYxbWd2WMxZ+Tx3hhPd9sL9ZP8dnOcgpom/QOKSujN5bkIVx20xpRc1EVhSvXJwFQ2pJUcWXgh3hTeLuoKa+BSik7y3PqbtnQj9tqNNEg+z3ABmj+8IbzwSGAbQW3P4+Ts9bqZLGeDAsmlVIiUEpanpfzCWy7je87wF1uSnuK3jDvZikUsivthkpAUzBqMnGKJwy96jtpaV5Hg8D9wTmwpkGV3pmC78g4mRmJJQ649E7/ZKGABu79fEUx9VAhW/w==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(4326008)(7696005)(2616005)(8676002)(70206006)(70586007)(26005)(82310400005)(2906002)(86362001)(5660300002)(508600001)(8936002)(40460700003)(426003)(356005)(336012)(47076005)(36860700001)(36756003)(6666004)(186003)(1076003)(107886003)(54906003)(81166007)(110136005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:07:58.5116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdc6f24-c8d3-4398-af4d-08da425ef252
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2994
Received-SPF: softfail client-ip=2a01:111:f400:7e88::630;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

vfio_devices_all_running_and_saving() is used to check if migration is
in pre-copy phase. This is done by checking if migration is in setup or
active states and if all VFIO devices are in pre-copy state, i.e.
_SAVING | _RUNNING.

VFIO migration protocol v2 currently doesn't support pre-copy phase, so
it doesn't have an equivalent VFIO pre-copy state like v1 has.

As preparation for adding the v2 protocol and to make things easier,
change vfio_devices_all_running_and_saving() logic to check if migration
is active and if all VFIO devices are in running state.

The new logic avoids using the VFIO pre-copy state and is equivalent to
the previous one, indicating that migration is in pre-copy phase. No
functional changes intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 29982c7af8..bbc6d375de 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "migration/misc.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -363,13 +364,16 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
     return true;
 }
 
-static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
+/*
+ * Check if all VFIO devices are running and migration is active, which is
+ * essentially equivalent to the migration being in pre-copy phase.
+ */
+static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
 {
     VFIOGroup *group;
     VFIODevice *vbasedev;
-    MigrationState *ms = migrate_get_current();
 
-    if (!migration_is_setup_or_active(ms->state)) {
+    if (!migration_is_active(migrate_get_current())) {
         return false;
     }
 
@@ -381,8 +385,7 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
                 return false;
             }
 
-            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
-                (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
                 continue;
             } else {
                 return false;
@@ -461,7 +464,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     };
 
     if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_saving(container)) {
+        vfio_devices_all_running_and_mig_active(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
-- 
2.21.3


