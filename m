Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6A5386F2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:59:06 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjfV-0003Yr-NJ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisF-00049y-K8
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:11 -0400
Received: from mail-dm6nam10on20611.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::611]:46689
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisD-0008MT-5P
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSW6oANBiCDkEAh7KVmNV34FupFOe+8Kgu916NIGnMjeR1mZJvjdKPptL84uQC+5fWif83UyHAycAY9lJp1VkPkdPb9NO9hCUO3Xfs77c0gS/QNU3Ddel9IxC+B5M6MLCD5gEPugD60SOT9ObwHHTUWU145mZXNsYUw1Aa0d/s3BZ1Ul2MVmfqq1cAMifDj/8Uxks83H3xJCPyNj5frYt6T0ToCvSsc9K2YFJiVum7SdLUFo38YRkPc8SGpu/z1wXP/csSh6IIKTtHmmJri0q8NJH2T5G+knBX6DYnqqVUqvrFdWQGAopVe+ZzTnJKrtCoWmXeg5muwuXVrAUf5TZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAcKiWMX79rHiJ0N+9JONfz6MYJ8RIJrv7lY5JEVzKA=;
 b=fH4R7SgwWx5ddFzh4GFmON/dZE1hBCpuoD7YS+7eNcrWfsPe5cHUPFKIk9hPQnACIoWzF/RDSyzj4nG6ufRt/ols5CINjoYOZGNtej2SQ+vwiUn8n6D0E/ay1DHD4HkJOuZDw+pCMRGXJADG9rhniSf4k5ch2GdqFuZ5s6OOJAyepYfF7sMe/S/Qit8sLIJucJNoPuazfqfFceG4iAwjr8qSLYRErU4DwAu72U661dDT8bH8B0w/ZwNvOgXl9+gPqDjwZiocPUeHfEcCDY1gt+dDvk6mLdGNH+Cm8xdnOuoUoXL+ytg+hgwFpaSdlAiY6vU/Yhk7Um+7wGko73P2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAcKiWMX79rHiJ0N+9JONfz6MYJ8RIJrv7lY5JEVzKA=;
 b=cnS5mJF9GAPK59C32rAPRSIN0HHn6KlfL9vxg8VfTsztdajetkwi/LoZb8Jv7DrbD8Kfmzkmpk55eQaM2sF8snK2PO1jp04M9aSJtJlnCydhUA9denRS30m95d8jN0U668fFnL6SpLy1nxLJUsU4gYMopuQDRrVr4Z1RGw4JEPJYuxlwAXXJn8w+WiVWlHU4D6y0CQzDX+Z/zZ00iebAFOi6adiRIbhqhiqHjbcnfQrYcMBVkiai0kuYajMaDULBf1jkYPyB6MWOzhlkGoEKTtyOPuPevoXglrs5LpgQXIFQL85Rjmo7PBsgvbLzSG73CLBCGBGC38I8t77Fsrn7TQ==
Received: from MWHPR10CA0069.namprd10.prod.outlook.com (2603:10b6:300:2c::31)
 by MWHPR12MB1360.namprd12.prod.outlook.com (2603:10b6:300:12::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:08:05 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::e6) by MWHPR10CA0069.outlook.office365.com
 (2603:10b6:300:2c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:08:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:08:05 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:08:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:08:04 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:08:01 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 06/11] vfio/migration: Rename functions/structs related to
 v1 protocol
Date: Mon, 30 May 2022 20:07:34 +0300
Message-ID: <20220530170739.19072-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50a572a4-143a-4b83-e4aa-08da425ef69a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1360:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB136099233B8E6C1BD5F92195DEDD9@MWHPR12MB1360.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14GiJsw5JtDs5YFpNx65qBCNPXJuOkUUYSV4RSTtgiukMS5KqxKI0LSlnY+ZaFwuY+t4H70Wr5Rfegs1lF5KZktJPu/p2NsWkIjeUDtSHTwSmEWiWnuuGaxW1Lc3nojqUME09ZfqYuYMO71ousFTbMdRjLN91c4kV26bT9wYkF3Q4pqo55S2jyEelJXYgyw46/kR7AwenYamhgOkUEsCWFEkEm6L1FyjmsdDBBSTnVx08VrHYNibnZyzQJk5vzDouqo6lUDuNZrQ8dvvyQJ6GnC1aLLdMAXQ5AA5AXZ/tLluibrpHoyVLIN9BYKzi4OdH8OXkDGmTVipH9HitXXNwKzlSaSFSffZ2MhVNjcfhqvbG3DWFhrcS2237A17Bm81E2P1ddbwvUAhPdDataCOOyCiuO5hbCCk1NnVObLe751/uwXjIMGTGZ2ZI0HsSa6vhJO/YDVA3omKMXSIqOGR1zkPbUNG2zYV8LO0FdwYz6opZsKOcgXgghlcsryRcxZ0oFfY1hBdGsp7cEGceaBON5bz/H0VbADUUdQZws50tPiYnQJur9EQFtxkOUn3x1gjGe3Ars/HeeLAuSF4yDIh4xHVrkkqdZzA1ymZzN7ftXe3aJDfJCuC0nqTYzCFUzx9V/zIxJBeeAxSAJ8AOWwP47BT1WJNW5LUH1SHaTGbMHMl+cMoP4FBN6vghlwXcRJz0Ohta3foe3nYBUQ46S83yA==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(186003)(86362001)(82310400005)(6666004)(81166007)(336012)(70206006)(107886003)(5660300002)(4326008)(70586007)(1076003)(426003)(36756003)(83380400001)(8936002)(30864003)(356005)(8676002)(2906002)(110136005)(54906003)(316002)(26005)(2616005)(508600001)(47076005)(36860700001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:08:05.6801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a572a4-143a-4b83-e4aa-08da425ef69a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1360
Received-SPF: softfail client-ip=2a01:111:f400:7e88::611;
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

To avoid name collisions, rename functions and structs related to VFIO
migration protocol v1. This will allow the two protocols to co-exist
when v2 protocol is added, until v1 is removed. No functional changes
intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c              |  6 +--
 hw/vfio/migration.c           | 82 +++++++++++++++++------------------
 hw/vfio/trace-events          |  2 +-
 include/hw/vfio/vfio-common.h |  2 +-
 4 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index bbc6d375de..a3dd8221ed 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -355,8 +355,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
-                && (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+                (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
                 return false;
             }
         }
@@ -385,7 +385,7 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
+            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 8a0deed0e4..e40aa0ad80 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -107,8 +107,8 @@ static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
  * an error is returned.
  */
 
-static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
-                                    uint32_t value)
+static int vfio_migration_v1_set_state(VFIODevice *vbasedev, uint32_t mask,
+                                       uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
     VFIORegion *region = &migration->region;
@@ -145,7 +145,7 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
         return ret;
     }
 
-    migration->device_state = device_state;
+    migration->device_state_v1 = device_state;
     trace_vfio_migration_set_state(vbasedev->name, device_state);
     return 0;
 }
@@ -260,8 +260,8 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     return ret;
 }
 
-static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
-                            uint64_t data_size)
+static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
+                               uint64_t data_size)
 {
     VFIORegion *region = &vbasedev->migration->region;
     uint64_t data_offset = 0, size, report_size;
@@ -288,7 +288,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
             data_size = 0;
         }
 
-        trace_vfio_load_state_device_data(vbasedev->name, data_offset, size);
+        trace_vfio_v1_load_state_device_data(vbasedev->name, data_offset, size);
 
         while (size) {
             void *buf;
@@ -394,7 +394,7 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static void vfio_migration_cleanup(VFIODevice *vbasedev)
+static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
@@ -405,7 +405,7 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
 
 /* ---------------------------------------------------------------------- */
 
-static int vfio_save_setup(QEMUFile *f, void *opaque)
+static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -431,8 +431,8 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    ret = vfio_migration_v1_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
+                                      VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state SAVING", vbasedev->name);
         return ret;
@@ -448,11 +448,11 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void vfio_save_cleanup(void *opaque)
+static void vfio_v1_save_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
 
-    vfio_migration_cleanup(vbasedev);
+    vfio_migration_v1_cleanup(vbasedev);
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
@@ -524,15 +524,15 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
+static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
     uint64_t data_size;
     int ret;
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
+                                      VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state STOP and SAVING",
                      vbasedev->name);
@@ -569,7 +569,8 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
+                                      0);
     if (ret) {
         error_report("%s: Failed to set state STOPPED", vbasedev->name);
         return ret;
@@ -592,7 +593,7 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
     }
 }
 
-static int vfio_load_setup(QEMUFile *f, void *opaque)
+static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -608,8 +609,8 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_RESUMING);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
+                                      VFIO_DEVICE_STATE_V1_RESUMING);
     if (ret) {
         error_report("%s: Failed to set state RESUMING", vbasedev->name);
         if (migration->region.mmaps) {
@@ -619,11 +620,11 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
     return ret;
 }
 
-static int vfio_load_cleanup(void *opaque)
+static int vfio_v1_load_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
 
-    vfio_migration_cleanup(vbasedev);
+    vfio_migration_v1_cleanup(vbasedev);
     trace_vfio_load_cleanup(vbasedev->name);
     return 0;
 }
@@ -661,7 +662,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             uint64_t data_size = qemu_get_be64(f);
 
             if (data_size) {
-                ret = vfio_load_buffer(f, vbasedev, data_size);
+                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
                 if (ret < 0) {
                     return ret;
                 }
@@ -682,21 +683,21 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
     return ret;
 }
 
-static SaveVMHandlers savevm_vfio_handlers = {
-    .save_setup = vfio_save_setup,
-    .save_cleanup = vfio_save_cleanup,
+static SaveVMHandlers savevm_vfio_v1_handlers = {
+    .save_setup = vfio_v1_save_setup,
+    .save_cleanup = vfio_v1_save_cleanup,
     .save_live_pending = vfio_save_pending,
     .save_live_iterate = vfio_save_iterate,
-    .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_live_complete_precopy = vfio_v1_save_complete_precopy,
     .save_state = vfio_save_state,
-    .load_setup = vfio_load_setup,
-    .load_cleanup = vfio_load_cleanup,
+    .load_setup = vfio_v1_load_setup,
+    .load_cleanup = vfio_v1_load_cleanup,
     .load_state = vfio_load_state,
 };
 
 /* ---------------------------------------------------------------------- */
 
-static void vfio_vmstate_change(void *opaque, bool running, RunState state)
+static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -736,21 +737,21 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, mask, value);
+    ret = vfio_migration_v1_set_state(vbasedev, mask, value);
     if (ret) {
         /*
          * Migration should be aborted in this case, but vm_state_notify()
          * currently does not support reporting failures.
          */
         error_report("%s: Failed to set device state 0x%x", vbasedev->name,
-                     (migration->device_state & mask) | value);
+                     (migration->device_state_v1 & mask) | value);
         if (migrate_get_current()->to_dst_file) {
             qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         }
     }
     vbasedev->migration->vm_running = running;
     trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
-            (migration->device_state & mask) | value);
+            (migration->device_state_v1 & mask) | value);
 }
 
 static void vfio_migration_state_notifier(Notifier *notifier, void *data)
@@ -769,10 +770,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_set_state(vbasedev,
-                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                         VFIO_DEVICE_STATE_V1_RESUMING),
-                                       VFIO_DEVICE_STATE_V1_RUNNING);
+        ret = vfio_migration_v1_set_state(vbasedev,
+                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
+                                            VFIO_DEVICE_STATE_V1_RESUMING),
+                                          VFIO_DEVICE_STATE_V1_RUNNING);
         if (ret) {
             error_report("%s: Failed to set state RUNNING", vbasedev->name);
         }
@@ -845,12 +846,11 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
     strpadcpy(id, sizeof(id), path, '\0');
 
-    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
-                         vbasedev);
+    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
+                         &savevm_vfio_v1_handlers, vbasedev);
 
-    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
-                                                           vfio_vmstate_change,
-                                                           vbasedev);
+    migration->vm_state = qdev_add_vm_change_state_handler(
+        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
     return 0;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 438402b619..ac8b04f52a 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -162,7 +162,7 @@ vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a9f1..bbaf72ba00 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -62,7 +62,7 @@ typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
     VFIORegion region;
-    uint32_t device_state;
+    uint32_t device_state_v1;
     int vm_running;
     Notifier migration_state;
     uint64_t pending_bytes;
-- 
2.21.3


