Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D845251A7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:54:12 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB8l-0003ls-Ve
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAys-0006SL-7n
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:58 -0400
Received: from mail-co1nam11on20607.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::607]:15521
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyo-0005LW-Fs
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxxR6ASSrE4gUZ0en3KH/YYtF8Gh2vFOpvef6WhInOlwjxvsCHQdGZJRhFlD1p1Ao65gaWkLOe5b3DHvTUoQtuLb3ubZUdF13L/GW5cEmUFdgDjeROEkTY4zWpFvwhbf2DpyEpqAY3hsJfkPdHepCmxdzo7meDGBGyWKi3kZ0An9ryplc0KoQTMtBj1lvP393Q8s1o/Hry9yZvXEUyAT47xEN6lGS9Vc/JwxTT9wwuYBv+9kC675dA2rgr1c2ya2LMyt4BTwpW5fMOyMGKMWRqwfIxKN6/YHq3RMOglF9cfyVrkcqoMZWBfheGzwo12V+KYMd+vYlKBEEY+m8VCx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbWyXsElyZSxu9Fq9WDLufpfeC+qEKquVJCktKZnuzw=;
 b=czMzYO/PmRyOa9Hg3Mv7f4p7thcGJGY0mVUR2Id8TZQUqAlxMcN8xMPAz6tNC95P1h3/blZSuU5mg7ScZ5IJGTpzjZ5JHcEgu0xc6orYqeusEadVq5AAlg3Y48L4MFiJbXbXie7h+JiNzdnk74AfdGbYtKvpZYf2w/Seq/hXNsym2kH8R2NelgKXVyrAP3a/0PKvZuvUEH/oe73nTbM3iHkDkSVBqv/gSq2bD4tUtH0ALJQ5Msb2eSX0T+Pg73Dy//3wQToHVW1YCcA2HMRDTY1m5Ql0R6Ht9xo3BW0gb7pnU+DCti4auxYWzzhYXCLmxz8KnbteNbMwXpVGr8V6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbWyXsElyZSxu9Fq9WDLufpfeC+qEKquVJCktKZnuzw=;
 b=hJal3SoVESp8EhORUNC/JxnXAtEZJmsu/C8Ackvyc/P4TIO9AW9EmhsWMlPpp0q8+gPEs1+XQFvbxq3iqQ6XyHLxxIowMSd+ps7zwGD5A4v9USzeTkYntzThzT/8RcvcVPAHpNLFSJSJ/gcWRQhLYSmj8JKXcoM7ijTodt13p0FI5c1IGhFYtibAyEl0G1EU9ebiaowZosjB1bnrB5FZR2CvhXZmku3F69v30mcFN/hPZOSIf3/myuP1nUfoYBdxbzld6G089eSrTOp342+6hscHOJguLubn0bo5ikoUdmH7PAPL0+zzyGFLiL6hoo1R9ii4gvpeFQ5ArpzrHA5knw==
Received: from MW4PR03CA0080.namprd03.prod.outlook.com (2603:10b6:303:b6::25)
 by BYAPR12MB5701.namprd12.prod.outlook.com (2603:10b6:a03:a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 15:43:50 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::67) by MW4PR03CA0080.outlook.office365.com
 (2603:10b6:303:b6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Thu, 12 May 2022 15:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:43:49 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:43:49 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:43:48 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:45 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 6/9] vfio/migration: Implement VFIO migration protocol v2
Date: Thu, 12 May 2022 18:43:17 +0300
Message-ID: <20220512154320.19697-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc1853a8-f83a-462b-f5b4-08da342e35a5
X-MS-TrafficTypeDiagnostic: BYAPR12MB5701:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB570148F058AC343997CA689DDECB9@BYAPR12MB5701.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQbnGQUDreJhgTd42rNNoXbrj80ZNFxoDa5iE7toBFV/xBqr3+dxAewJ5brWUMeJ4wSZS6bzbdntugdJZPCccn7DDKXxsJdicXqH1ntFZj3LNEz9/e1BJxzirjMgnbQ8eTzLovQ9nPieKYY3gqddC6dB0IV7V0Q6+1S5FVMXRTlntiUO87XCP4Am9LFRZziJpM092A8HcCVHpJnJ7psNXNFr0QgIfIjItg7ao0tLkFNj3AQdyxvBt0tR5MDW8Va6OLkm+wOB5V33LnX2ZMqAXW+v0FrVvtxcAFMVJZEgKo1mNq3uUoTReWMaItkiDd+04htjGFagCdDWLk1aCUpomPOic7AGgwHrlu6SyXAdy+9mZ8zYn44hOWkOZ0zuuD1nHM2FkbByfNfvfYSVfZAAaH9bzaeD739UCsLawDc8bm/gOq/LDaQOeRCiWi0ewngHh6famS0SzWm2shWXu0UKd0eCTN5npHI+ZLLrul0HNToVYNYqJCE2/kfYrSuqRNG+En5qpuO7E7Ozj7s/wq1d0Rk+q4JASumURfpeZMsGTIcz82yRs/XUHfjQIuBIDGNkyjOCkIMDxNpTg+A65HlQD9CWGuHgz8QoG07kq2FHpy5fsEOlgcPagt37PePoRGQqcGbwuAw75qGHvDAN4AAe8xI4pjddfjGy3381ZlMBO0WnjEcc/uUc9DxP2h0NuRf7jagVrTLOx/yBxiExN5aGqM61+zFjS6RKdzySKPKh5Joey4n6CrGbNyepTBJXcLLOEnYPryLzc/wB/LqWfCcDddRisfbbBtS8dykdX33BFoA=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(7696005)(81166007)(356005)(26005)(2906002)(8936002)(6666004)(508600001)(86362001)(5660300002)(966005)(30864003)(110136005)(54906003)(36860700001)(83380400001)(316002)(82310400005)(40460700003)(70586007)(47076005)(336012)(426003)(8676002)(4326008)(70206006)(2616005)(107886003)(1076003)(186003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:43:49.8149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1853a8-f83a-462b-f5b4-08da342e35a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB5701
Received-SPF: softfail client-ip=2a01:111:f400:7eab::607;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

Replace the current VFIO migration protocol v1 implementation with a new
implementation corresponding to VFIO migration protocol v2.

The main changes are:
- VFIO device state is now represented as a finite state machine instead
  of a bitmap.

- Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
  ioctl and normal read() and write() instead of the migration region.

- As VFIO migration protocol v2 currently doesn't support the pre-copy
  phase of migration, .save_live_pending and .save_live_iterate handlers
  plus pre-copy relevant code are removed.

Detailed information about VFIO migration protocol v2 and difference
compared to v1 can be found here [1].

[1]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c              |  21 +-
 hw/vfio/migration.c           | 628 +++++++---------------------------
 hw/vfio/trace-events          |   9 +-
 include/hw/vfio/vfio-common.h |   8 +-
 4 files changed, 153 insertions(+), 513 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 29982c7af8..4c6baa5a79 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "migration/misc.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -354,8 +355,9 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
-                && (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+                 (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
                 return false;
             }
         }
@@ -363,13 +365,16 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
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
 
@@ -381,8 +386,8 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
                 return false;
             }
 
-            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
-                (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P) {
                 continue;
             } else {
                 return false;
@@ -461,7 +466,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     };
 
     if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_saving(container)) {
+        vfio_devices_all_running_and_mig_active(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index d4b6653026..8943ccbace 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -44,309 +44,96 @@
 #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
 #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
 
+#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024)
+
 static int64_t bytes_transferred;
 
-static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
-                                  off_t off, bool iswrite)
+static const char *mig_state_to_str(enum vfio_device_mig_state state)
 {
-    int ret;
-
-    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
-                    pread(vbasedev->fd, val, count, off);
-    if (ret < count) {
-        error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
-                     HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
-                     vbasedev->name, off, strerror(errno));
-        return (ret < 0) ? ret : -EINVAL;
+    switch (state) {
+    case VFIO_DEVICE_STATE_ERROR:
+        return "ERROR";
+    case VFIO_DEVICE_STATE_STOP:
+        return "STOP";
+    case VFIO_DEVICE_STATE_RUNNING:
+        return "RUNNING";
+    case VFIO_DEVICE_STATE_STOP_COPY:
+        return "STOP_COPY";
+    case VFIO_DEVICE_STATE_RESUMING:
+        return "RESUMING";
+    case VFIO_DEVICE_STATE_RUNNING_P2P:
+        return "RUNNING_P2P";
+    default:
+        return "UNKNOWN STATE";
     }
-    return 0;
 }
 
-static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
-                       off_t off, bool iswrite)
-{
-    int ret, done = 0;
-    __u8 *tbuf = buf;
-
-    while (count) {
-        int bytes = 0;
-
-        if (count >= 8 && !(off % 8)) {
-            bytes = 8;
-        } else if (count >= 4 && !(off % 4)) {
-            bytes = 4;
-        } else if (count >= 2 && !(off % 2)) {
-            bytes = 2;
-        } else {
-            bytes = 1;
-        }
-
-        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
-        if (ret) {
-            return ret;
-        }
-
-        count -= bytes;
-        done += bytes;
-        off += bytes;
-        tbuf += bytes;
-    }
-    return done;
-}
-
-#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
-#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
-
-#define VFIO_MIG_STRUCT_OFFSET(f)       \
-                                 offsetof(struct vfio_device_migration_info, f)
-/*
- * Change the device_state register for device @vbasedev. Bits set in @mask
- * are preserved, bits set in @value are set, and bits not set in either @mask
- * or @value are cleared in device_state. If the register cannot be accessed,
- * the resulting state would be invalid, or the device enters an error state,
- * an error is returned.
- */
-
-static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
-                                    uint32_t value)
+static int vfio_migration_set_state(VFIODevice *vbasedev,
+                                    enum vfio_device_mig_state new_state,
+                                    enum vfio_device_mig_state recover_state)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    off_t dev_state_off = region->fd_offset +
-                          VFIO_MIG_STRUCT_OFFSET(device_state);
-    uint32_t device_state;
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                              sizeof(struct vfio_device_feature_mig_state),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (void *)buf;
+    struct vfio_device_feature_mig_state *mig_state = (void *)feature->data;
     int ret;
 
-    ret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
-                        dev_state_off);
-    if (ret < 0) {
-        return ret;
-    }
-
-    device_state = (device_state & mask) | value;
-
-    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
-        return -EINVAL;
-    }
-
-    ret = vfio_mig_write(vbasedev, &device_state, sizeof(device_state),
-                         dev_state_off);
-    if (ret < 0) {
-        int rret;
-
-        rret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
-                             dev_state_off);
-
-        if ((rret < 0) || (VFIO_DEVICE_STATE_IS_ERROR(device_state))) {
-            hw_error("%s: Device in error state 0x%x", vbasedev->name,
-                     device_state);
-            return rret ? rret : -EIO;
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
+    mig_state->device_state = new_state;
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
+    if (ret) {
+        /* Try to put the device in some good state */
+        mig_state->device_state = recover_state;
+        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+            hw_error("%s: Device in error state, can't recover",
+                     vbasedev->name);
         }
-        return ret;
-    }
-
-    migration->device_state = device_state;
-    trace_vfio_migration_set_state(vbasedev->name, device_state);
-    return 0;
-}
 
-static void *get_data_section_size(VFIORegion *region, uint64_t data_offset,
-                                   uint64_t data_size, uint64_t *size)
-{
-    void *ptr = NULL;
-    uint64_t limit = 0;
-    int i;
+        error_report("%s: Failed changing device state to %s", vbasedev->name,
+                     mig_state_to_str(new_state));
+        migration->device_state = recover_state;
 
-    if (!region->mmaps) {
-        if (size) {
-            *size = MIN(data_size, region->size - data_offset);
-        }
-        return ptr;
+        return -1;
     }
 
-    for (i = 0; i < region->nr_mmaps; i++) {
-        VFIOMmap *map = region->mmaps + i;
-
-        if ((data_offset >= map->offset) &&
-            (data_offset < map->offset + map->size)) {
-
-            /* check if data_offset is within sparse mmap areas */
-            ptr = map->mmap + data_offset - map->offset;
-            if (size) {
-                *size = MIN(data_size, map->offset + map->size - data_offset);
-            }
-            break;
-        } else if ((data_offset < map->offset) &&
-                   (!limit || limit > map->offset)) {
+    if (mig_state->data_fd != -1) {
+        if (migration->data_fd != -1) {
             /*
-             * data_offset is not within sparse mmap areas, find size of
-             * non-mapped area. Check through all list since region->mmaps list
-             * is not sorted.
+             * This can happen if the device is asynchronously reset and
+             * terminates a data transfer.
              */
-            limit = map->offset;
-        }
-    }
-
-    if (!ptr && size) {
-        *size = limit ? MIN(data_size, limit - data_offset) : data_size;
-    }
-    return ptr;
-}
-
-static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
-{
-    VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    uint64_t data_offset = 0, data_size = 0, sz;
-    int ret;
-
-    ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
-    if (ret < 0) {
-        return ret;
-    }
-
-    ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
-    if (ret < 0) {
-        return ret;
-    }
+            error_report("%s: data_fd out of sync", vbasedev->name);
+            close(mig_state->data_fd);
 
-    trace_vfio_save_buffer(vbasedev->name, data_offset, data_size,
-                           migration->pending_bytes);
-
-    qemu_put_be64(f, data_size);
-    sz = data_size;
-
-    while (sz) {
-        void *buf;
-        uint64_t sec_size;
-        bool buf_allocated = false;
-
-        buf = get_data_section_size(region, data_offset, sz, &sec_size);
-
-        if (!buf) {
-            buf = g_try_malloc(sec_size);
-            if (!buf) {
-                error_report("%s: Error allocating buffer ", __func__);
-                return -ENOMEM;
-            }
-            buf_allocated = true;
-
-            ret = vfio_mig_read(vbasedev, buf, sec_size,
-                                region->fd_offset + data_offset);
-            if (ret < 0) {
-                g_free(buf);
-                return ret;
-            }
+            return -1;
         }
 
-        qemu_put_buffer(f, buf, sec_size);
-
-        if (buf_allocated) {
-            g_free(buf);
-        }
-        sz -= sec_size;
-        data_offset += sec_size;
+        migration->data_fd = mig_state->data_fd;
     }
+    migration->device_state = new_state;
 
-    ret = qemu_file_get_error(f);
+    trace_vfio_migration_set_state(vbasedev->name, new_state);
 
-    if (!ret && size) {
-        *size = data_size;
-    }
-
-    bytes_transferred += data_size;
-    return ret;
+    return 0;
 }
 
 static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
                             uint64_t data_size)
-{
-    VFIORegion *region = &vbasedev->migration->region;
-    uint64_t data_offset = 0, size, report_size;
-    int ret;
-
-    do {
-        ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
-        if (ret < 0) {
-            return ret;
-        }
-
-        if (data_offset + data_size > region->size) {
-            /*
-             * If data_size is greater than the data section of migration region
-             * then iterate the write buffer operation. This case can occur if
-             * size of migration region at destination is smaller than size of
-             * migration region at source.
-             */
-            report_size = size = region->size - data_offset;
-            data_size -= size;
-        } else {
-            report_size = size = data_size;
-            data_size = 0;
-        }
-
-        trace_vfio_load_state_device_data(vbasedev->name, data_offset, size);
-
-        while (size) {
-            void *buf;
-            uint64_t sec_size;
-            bool buf_alloc = false;
-
-            buf = get_data_section_size(region, data_offset, size, &sec_size);
-
-            if (!buf) {
-                buf = g_try_malloc(sec_size);
-                if (!buf) {
-                    error_report("%s: Error allocating buffer ", __func__);
-                    return -ENOMEM;
-                }
-                buf_alloc = true;
-            }
-
-            qemu_get_buffer(f, buf, sec_size);
-
-            if (buf_alloc) {
-                ret = vfio_mig_write(vbasedev, buf, sec_size,
-                        region->fd_offset + data_offset);
-                g_free(buf);
-
-                if (ret < 0) {
-                    return ret;
-                }
-            }
-            size -= sec_size;
-            data_offset += sec_size;
-        }
-
-        ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
-        if (ret < 0) {
-            return ret;
-        }
-    } while (data_size);
-
-    return 0;
-}
-
-static int vfio_update_pending(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    uint64_t pending_bytes = 0;
     int ret;
 
-    ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
-                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
-    if (ret < 0) {
-        migration->pending_bytes = 0;
+    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
+    if (ret) {
         return ret;
     }
 
-    migration->pending_bytes = pending_bytes;
-    trace_vfio_update_pending(vbasedev->name, pending_bytes);
+    trace_vfio_load_state_device_data(vbasedev->name, data_size);
+
     return 0;
 }
 
@@ -398,9 +185,8 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    if (migration->region.mmaps) {
-        vfio_region_unmap(&migration->region);
-    }
+    close(migration->data_fd);
+    migration->data_fd = -1;
 }
 
 /* ---------------------------------------------------------------------- */
@@ -408,44 +194,13 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
 static int vfio_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    int ret;
 
     trace_vfio_save_setup(vbasedev->name);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
-
-    if (migration->region.mmaps) {
-        /*
-         * Calling vfio_region_mmap() from migration thread. Memory API called
-         * from this function require locking the iothread when called from
-         * outside the main loop thread.
-         */
-        qemu_mutex_lock_iothread();
-        ret = vfio_region_mmap(&migration->region);
-        qemu_mutex_unlock_iothread();
-        if (ret) {
-            error_report("%s: Failed to mmap VFIO migration region: %s",
-                         vbasedev->name, strerror(-ret));
-            error_report("%s: Falling back to slow path", vbasedev->name);
-        }
-    }
-
-    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
-    if (ret) {
-        error_report("%s: Failed to set state SAVING", vbasedev->name);
-        return ret;
-    }
-
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
 
-    ret = qemu_file_get_error(f);
-    if (ret) {
-        return ret;
-    }
-
-    return 0;
+    return qemu_file_get_error(f);
 }
 
 static void vfio_save_cleanup(void *opaque)
@@ -456,127 +211,67 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_save_pending(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    int ret;
-
-    ret = vfio_update_pending(vbasedev);
-    if (ret) {
-        return;
-    }
-
-    *res_precopy_only += migration->pending_bytes;
-
-    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
-                            *res_postcopy_only, *res_compatible);
-}
-
-static int vfio_save_iterate(QEMUFile *f, void *opaque)
+/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
+static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
 {
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    uint64_t data_size;
-    int ret;
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
-
-    if (migration->pending_bytes == 0) {
-        ret = vfio_update_pending(vbasedev);
-        if (ret) {
-            return ret;
-        }
+    ssize_t data_size;
 
-        if (migration->pending_bytes == 0) {
-            qemu_put_be64(f, 0);
-            qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-            /* indicates data finished, goto complete phase */
-            return 1;
-        }
+    data_size = read(migration->data_fd, migration->data_buffer,
+                     migration->data_buffer_size);
+    if (data_size < 0) {
+        return -1;
     }
-
-    ret = vfio_save_buffer(f, vbasedev, &data_size);
-    if (ret) {
-        error_report("%s: vfio_save_buffer failed %s", vbasedev->name,
-                     strerror(errno));
-        return ret;
+    if (data_size == 0) {
+        return 1;
     }
 
-    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
+    qemu_put_be64(f, data_size);
+    qemu_put_buffer_async(f, migration->data_buffer, data_size, false);
+    qemu_fflush(f);
+    bytes_transferred += data_size;
 
-    ret = qemu_file_get_error(f);
-    if (ret) {
-        return ret;
-    }
+    trace_vfio_save_block(migration->vbasedev->name, data_size);
 
-    /*
-     * Reset pending_bytes as .save_live_pending is not called during savevm or
-     * snapshot case, in such case vfio_update_pending() at the start of this
-     * function updates pending_bytes.
-     */
-    migration->pending_bytes = 0;
-    trace_vfio_save_iterate(vbasedev->name, data_size);
-    return 0;
+    return qemu_file_get_error(f);
 }
 
 static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    uint64_t data_size;
+    enum vfio_device_mig_state recover_state;
     int ret;
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    /* We reach here with device state STOP or STOP_COPY only */
+    recover_state = VFIO_DEVICE_STATE_STOP;
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
+                                   recover_state);
     if (ret) {
-        error_report("%s: Failed to set state STOP and SAVING",
-                     vbasedev->name);
         return ret;
     }
 
-    ret = vfio_update_pending(vbasedev);
-    if (ret) {
-        return ret;
-    }
-
-    while (migration->pending_bytes > 0) {
-        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
-        ret = vfio_save_buffer(f, vbasedev, &data_size);
+    do {
+        ret = vfio_save_block(f, vbasedev->migration);
         if (ret < 0) {
-            error_report("%s: Failed to save buffer", vbasedev->name);
-            return ret;
-        }
-
-        if (data_size == 0) {
-            break;
-        }
-
-        ret = vfio_update_pending(vbasedev);
-        if (ret) {
             return ret;
         }
-    }
+    } while (!ret);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-
     ret = qemu_file_get_error(f);
     if (ret) {
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
+                                   recover_state);
     if (ret) {
-        error_report("%s: Failed to set state STOPPED", vbasedev->name);
         return ret;
     }
 
     trace_vfio_save_complete_precopy(vbasedev->name);
-    return ret;
+
+    return 0;
 }
 
 static void vfio_save_state(QEMUFile *f, void *opaque)
@@ -595,28 +290,9 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
 static int vfio_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    int ret = 0;
 
-    if (migration->region.mmaps) {
-        ret = vfio_region_mmap(&migration->region);
-        if (ret) {
-            error_report("%s: Failed to mmap VFIO migration region %d: %s",
-                         vbasedev->name, migration->region.nr,
-                         strerror(-ret));
-            error_report("%s: Falling back to slow path", vbasedev->name);
-        }
-    }
-
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_RESUMING);
-    if (ret) {
-        error_report("%s: Failed to set state RESUMING", vbasedev->name);
-        if (migration->region.mmaps) {
-            vfio_region_unmap(&migration->region);
-        }
-    }
-    return ret;
+    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
+                                   vbasedev->migration->device_state);
 }
 
 static int vfio_load_cleanup(void *opaque)
@@ -685,8 +361,6 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
 static SaveVMHandlers savevm_vfio_handlers = {
     .save_setup = vfio_save_setup,
     .save_cleanup = vfio_save_cleanup,
-    .save_live_pending = vfio_save_pending,
-    .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
     .save_state = vfio_save_state,
     .load_setup = vfio_load_setup,
@@ -699,58 +373,28 @@ static SaveVMHandlers savevm_vfio_handlers = {
 static void vfio_vmstate_change(void *opaque, bool running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    uint32_t value, mask;
+    enum vfio_device_mig_state new_state;
     int ret;
 
-    if (vbasedev->migration->vm_running == running) {
-        return;
-    }
-
     if (running) {
-        /*
-         * Here device state can have one of _SAVING, _RESUMING or _STOP bit.
-         * Transition from _SAVING to _RUNNING can happen if there is migration
-         * failure, in that case clear _SAVING bit.
-         * Transition from _RESUMING to _RUNNING occurs during resuming
-         * phase, in that case clear _RESUMING bit.
-         * In both the above cases, set _RUNNING bit.
-         */
-        mask = ~VFIO_DEVICE_STATE_MASK;
-        value = VFIO_DEVICE_STATE_V1_RUNNING;
+        new_state = VFIO_DEVICE_STATE_RUNNING;
     } else {
-        /*
-         * Here device state could be either _RUNNING or _SAVING|_RUNNING. Reset
-         * _RUNNING bit
-         */
-        mask = ~VFIO_DEVICE_STATE_V1_RUNNING;
-
-        /*
-         * When VM state transition to stop for savevm command, device should
-         * start saving data.
-         */
-        if (state == RUN_STATE_SAVE_VM) {
-            value = VFIO_DEVICE_STATE_V1_SAVING;
-        } else {
-            value = 0;
-        }
+        new_state = VFIO_DEVICE_STATE_STOP;
     }
 
-    ret = vfio_migration_set_state(vbasedev, mask, value);
+    ret =
+        vfio_migration_set_state(vbasedev, new_state, VFIO_DEVICE_STATE_ERROR);
     if (ret) {
         /*
          * Migration should be aborted in this case, but vm_state_notify()
          * currently does not support reporting failures.
          */
-        error_report("%s: Failed to set device state 0x%x", vbasedev->name,
-                     (migration->device_state & mask) | value);
         if (migrate_get_current()->to_dst_file) {
             qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         }
     }
-    vbasedev->migration->vm_running = running;
     trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
-            (migration->device_state & mask) | value);
+                              new_state);
 }
 
 static void vfio_migration_state_notifier(Notifier *notifier, void *data)
@@ -759,7 +403,6 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     VFIOMigration *migration = container_of(notifier, VFIOMigration,
                                             migration_state);
     VFIODevice *vbasedev = migration->vbasedev;
-    int ret;
 
     trace_vfio_migration_state_notifier(vbasedev->name,
                                         MigrationStatus_str(s->state));
@@ -769,34 +412,45 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_set_state(
-            vbasedev,
-            ~(VFIO_DEVICE_STATE_V1_SAVING | VFIO_DEVICE_STATE_V1_RESUMING),
-            VFIO_DEVICE_STATE_V1_RUNNING);
-        if (ret) {
-            error_report("%s: Failed to set state RUNNING", vbasedev->name);
-        }
+        vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
+                                 VFIO_DEVICE_STATE_ERROR);
     }
 }
 
 static void vfio_migration_exit(VFIODevice *vbasedev)
 {
-    VFIOMigration *migration = vbasedev->migration;
-
-    vfio_region_exit(&migration->region);
-    vfio_region_finalize(&migration->region);
+    g_free(vbasedev->migration->data_buffer);
     g_free(vbasedev->migration);
     vbasedev->migration = NULL;
 }
 
-static int vfio_migration_init(VFIODevice *vbasedev,
-                               struct vfio_region_info *info)
+static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                                  sizeof(struct vfio_device_feature_migration),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (void *)buf;
+    struct vfio_device_feature_migration *mig = (void *)feature->data;
+
+    feature->argsz = sizeof(buf);
+    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        return -EOPNOTSUPP;
+    }
+
+    *mig_flags = mig->flags;
+
+    return 0;
+}
+
+static int vfio_migration_init(VFIODevice *vbasedev)
 {
-    int ret;
     Object *obj;
     VFIOMigration *migration;
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
+    uint64_t mig_flags;
+    int ret;
 
     if (!vbasedev->ops->vfio_get_object) {
         return -EINVAL;
@@ -807,25 +461,23 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         return -EINVAL;
     }
 
-    vbasedev->migration = g_new0(VFIOMigration, 1);
-
-    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
-                            info->index, "migration");
+    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
     if (ret) {
-        error_report("%s: Failed to setup VFIO migration region %d: %s",
-                     vbasedev->name, info->index, strerror(-ret));
-        goto err;
+        return ret;
     }
 
-    if (!vbasedev->migration->region.size) {
-        error_report("%s: Invalid zero-sized VFIO migration region %d",
-                     vbasedev->name, info->index);
-        ret = -EINVAL;
-        goto err;
+    /* Basic migration functionality must be supported */
+    if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
+        return -EOPNOTSUPP;
     }
 
+    vbasedev->migration = g_new0(VFIOMigration, 1);
+    vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
+    vbasedev->migration->data_buffer =
+        g_malloc0(vbasedev->migration->data_buffer_size);
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
+    migration->data_fd = -1;
 
     oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
     if (oid) {
@@ -837,17 +489,13 @@ static int vfio_migration_init(VFIODevice *vbasedev,
 
     register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
                          vbasedev);
-
     migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
                                                            vfio_vmstate_change,
                                                            vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
-    return 0;
 
-err:
-    vfio_migration_exit(vbasedev);
-    return ret;
+    return 0;
 }
 
 /* ---------------------------------------------------------------------- */
@@ -860,7 +508,6 @@ int64_t vfio_mig_bytes_transferred(void)
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
     VFIOContainer *container = vbasedev->group->container;
-    struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
     if (!vbasedev->enable_migration) {
@@ -874,27 +521,18 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         migrate_get_current()->skip_precopy = true;
     }
 
-    ret = vfio_get_dev_region_info(vbasedev,
-                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
-                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
-                                   &info);
+    ret = vfio_migration_init(vbasedev);
     if (ret) {
         goto add_blocker;
     }
 
-    ret = vfio_migration_init(vbasedev, info);
-    if (ret) {
-        goto add_blocker;
-    }
+    trace_vfio_migration_probe(vbasedev->name);
 
-    trace_vfio_migration_probe(vbasedev->name, info->index);
-    g_free(info);
     return 0;
 
 add_blocker:
     error_setg(&vbasedev->migration_blocker,
                "VFIO device doesn't support migration");
-    g_free(info);
 
     ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
     if (ret < 0) {
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 582882db91..a24ea7d8b0 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -148,21 +148,18 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
 
 # migration.c
-vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
 vfio_save_setup(const char *name) " (%s)"
 vfio_save_cleanup(const char *name) " (%s)"
-vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
-vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
-vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
-vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
+vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a9f1..09446a9082 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -61,11 +61,11 @@ typedef struct VFIORegion {
 typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
-    VFIORegion region;
-    uint32_t device_state;
-    int vm_running;
+    enum vfio_device_mig_state device_state;
+    int data_fd;
     Notifier migration_state;
-    uint64_t pending_bytes;
+    void *data_buffer;
+    size_t data_buffer_size;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
-- 
2.21.3


