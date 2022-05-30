Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B32F538735
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:22:16 +0200 (CEST)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvk1v-0003u7-81
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisK-0004Nu-Bg
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:16 -0400
Received: from mail-sn1anam02on20614.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::614]:51678
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisG-0008Ms-8X
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h496DP5xAtWyVhUpAxmVSHIqNFqvEe3ocHJ5gZ8yucw7I5Bqj6Ie2jdvwrvvOsOazPDXcSqb3lAid+MKuabarYc0GjJv9Yy+ySsrgzUiHV+Dbfzl+nNmzT2MCZ0r1j2sl9NI9c526Nkn2RY2W7ImVw+N/xvtjA+5UC0LRcVNOfK+/UHdgQanMavKjQeJXRLfoRA/QhDPtVBjUAX+Dy6xyryhgc+qQeB4GXEv8eS/PbeRsrpEz7yBhjUzJGocuMy1eqjzPcOsgxjCJzYiQzxQh8JJm6zhr+NfYXOfC3Y59HGZrZ2m0G0YUStBCb5nHL5ICa5BKi/AT2XFk+dSEDxF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/zOSCKw7zFSSB+1LnE/2WjnkVIfVsyyLiFlMm4RF1o=;
 b=CuvRtPVztVq/7l6MCzPTmCZiV5jsHV7KsWHw26YM7v8orwL9klTySwGNKKEcms8qZfFs0jMvyo1P9WtZ+FPRYAF/oqXby5kgzeN4XjJX0J7jekoz50/OWwjDp8K5m3pCho1lB2QKw6l9X83AmtXuo34My6dRK1zXdhmx8Hd6LsLFzDN3vx09YqigZ1fx7/Nsl6+XLmtpDs3bU1dh+f5oakOLBODKQkzBpBlDTjMcnc5uDC9hQTsEafx2ZoaH14GNUm1UedDf/mHIw62MrlJ9B+Wa1/SQv/qmk/9wUr2HmyXsSrKp6Jg13s/L7SOww7+GJVT9qdpExPhutXKXY/jaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/zOSCKw7zFSSB+1LnE/2WjnkVIfVsyyLiFlMm4RF1o=;
 b=PGsteNYxN8zz4uu6ewkPkDq0kJjv4wDlZslRgmrH59r0IxF4nEXou8r1QMurIYJtqvLetpOzU/vfW2gISRjGCguUINMpvIcfLYtkJBtidZ4SaSs5joiZuPUh7YitWDEFtpA5h2dEbqdEjF8nLzzE/+aRfrn76109aeBKrrQaHIzZ8xqjw4AkumUiuvHt0ZJslqNJoywW4DoAd/+YkBvrutgS6oLJliZQ1aw9ryuWtGjWFICH9CatoRlvejLaY6MQMOKKIrq92LulJwytcv43CX2ETzRqOssVfwhEeFO/Ukvs1LyHDCMwObvRCJJQWFRtPLkRFo4KtfAdCViwgGNAEw==
Received: from CO1PR15CA0099.namprd15.prod.outlook.com (2603:10b6:101:21::19)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:08:09 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::92) by CO1PR15CA0099.outlook.office365.com
 (2603:10b6:101:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19 via Frontend
 Transport; Mon, 30 May 2022 17:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:08:08 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:08:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:08:08 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:08:05 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 07/11] vfio/migration: Implement VFIO migration protocol v2
Date: Mon, 30 May 2022 20:07:35 +0300
Message-ID: <20220530170739.19072-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7df47cd1-9995-4f66-4802-08da425ef884
X-MS-TrafficTypeDiagnostic: DM6PR12MB4235:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB42357AB16113862C203B06BFDEDD9@DM6PR12MB4235.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yfp/bYY8hCIDni58U9PRYsQWhzQtMU0CZP6ThAYb6+x6uOjQ+cXZcl8uzFfTUaEpUSuDpbSA1v3VYAiZy9fJxkibYPCBELo7XaLB+RAcmRd6YUhbKHmgbL3+vtQBMj+LtLmAohQ2ttgQU5YC+ekyZsqCZ3ueky+L8JHbpX3Q9+0h+rI4X6wIMgPoPZT2orozACB0iUYPM49je9tCgsoMizl13yA8Z5asC/xiFUY3Z4M/gORnpzig0o37HLB01JC5Y/qzf8Q6vCmX9OzmmalxuG7JMIUsxerB1N+1LNk7bGmZQV67xHPt0wXlGfynqhEr46/WSaF35fEmbWK0rxQo8oQRXLjiF8UsVo2F6jw0FEDlzkEt7yRyJx5Z77SE0i7ajBpdW3eAVZ0CQymTB6OJ8zvMkq3FgIQfS5XuYH+kxhUfbw5MR+6qBGDxp675DoraAB8JpTZYf6ZAORORl0NAMFWd7xx/2jWiUZWTNVLiCphznpJ2RAriA0lXe2yCgrsYsAUvM8B2+dt4GbIuKQL6jHQjZaTOOck44YjWUl3nC0P8c07XxZRkzC7AewqJ6LyDMF8CMJhlsP2PDDBru4SPv/+vHCT67KYcNfbPLsvfMqxlDP9G9aLB8E5DPyKgq2k31EWGiWw3S2tLO+vQw8KYiSB7PNH+YixgbUho7h4th9D/t5nCnXuQNGnvX6DIpwI9uX0Q0VkXwUa9uV7h6sltyfmI0DkikpWt6JTl/WPI8frPg7vvQarYby3UztWQWZfn3KdCiJqpLGAiLJxS9IS6s0p25BflKWsPj6aywU3lt2U=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70206006)(82310400005)(4326008)(8676002)(70586007)(86362001)(5660300002)(2616005)(1076003)(107886003)(30864003)(36860700001)(186003)(6666004)(40460700003)(508600001)(966005)(26005)(54906003)(8936002)(7696005)(110136005)(2906002)(316002)(81166007)(47076005)(83380400001)(426003)(336012)(36756003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:08:08.8718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df47cd1-9995-4f66-4802-08da425ef884
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::614;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

Add implementation of VFIO migration protocol v2. The two protocols, v1
and v2, will co-exist and in next patch v1 protocol will be removed.

There are several main differences between v1 and v2 protocols:
- VFIO device state is now represented as a finite state machine instead
  of a bitmap.

- Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
  ioctl and normal read() and write() instead of the migration region.

- VFIO migration protocol v2 currently doesn't support the pre-copy
  phase of migration.

Detailed information about VFIO migration protocol v2 and difference
compared to v1 can be found here [1].

[1]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c              |  19 +-
 hw/vfio/migration.c           | 365 ++++++++++++++++++++++++++++++----
 hw/vfio/trace-events          |   2 +
 include/hw/vfio/vfio-common.h |   5 +
 4 files changed, 354 insertions(+), 37 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a3dd8221ed..5541133ec9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -355,10 +355,18 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+            if (!migration->v2 &&
+                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
                 (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
                 return false;
             }
+
+            if (migration->v2 &&
+                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
+                return false;
+            }
         }
     }
     return true;
@@ -385,7 +393,14 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
+            if (!migration->v2 &&
+                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
+                continue;
+            }
+
+            if (migration->v2 &&
+                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index e40aa0ad80..de68eadb09 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -44,8 +44,83 @@
 #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
 #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
 
+#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024)
+
 static int64_t bytes_transferred;
 
+static const char *mig_state_to_str(enum vfio_device_mig_state state)
+{
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
+    }
+}
+
+static int vfio_migration_set_state(VFIODevice *vbasedev,
+                                    enum vfio_device_mig_state new_state,
+                                    enum vfio_device_mig_state recover_state)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                              sizeof(struct vfio_device_feature_mig_state),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (void *)buf;
+    struct vfio_device_feature_mig_state *mig_state = (void *)feature->data;
+    int ret;
+
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
+        }
+
+        error_report("%s: Failed changing device state to %s", vbasedev->name,
+                     mig_state_to_str(new_state));
+        migration->device_state = recover_state;
+
+        return -1;
+    }
+
+    if (mig_state->data_fd != -1) {
+        if (migration->data_fd != -1) {
+            /*
+             * This can happen if the device is asynchronously reset and
+             * terminates a data transfer.
+             */
+            error_report("%s: data_fd out of sync", vbasedev->name);
+            close(mig_state->data_fd);
+
+            return -1;
+        }
+
+        migration->data_fd = mig_state->data_fd;
+    }
+    migration->device_state = new_state;
+
+    trace_vfio_migration_set_state(vbasedev->name, new_state);
+
+    return 0;
+}
+
 static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
                                   off_t off, bool iswrite)
 {
@@ -260,6 +335,22 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     return ret;
 }
 
+static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
+                            uint64_t data_size)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    int ret;
+
+    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
+    if (ret) {
+        return ret;
+    }
+
+    trace_vfio_load_state_device_data(vbasedev->name, data_size);
+
+    return 0;
+}
+
 static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
                                uint64_t data_size)
 {
@@ -394,6 +485,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
+static void vfio_migration_cleanup(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+
+    close(migration->data_fd);
+    migration->data_fd = -1;
+}
+
 static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -405,6 +504,18 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
 
 /* ---------------------------------------------------------------------- */
 
+static int vfio_save_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    trace_vfio_save_setup(vbasedev->name);
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    return qemu_file_get_error(f);
+}
+
 static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -448,6 +559,14 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
+static void vfio_save_cleanup(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    vfio_migration_cleanup(vbasedev);
+    trace_vfio_save_cleanup(vbasedev->name);
+}
+
 static void vfio_v1_save_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -524,6 +643,69 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     return 0;
 }
 
+/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
+static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
+{
+    ssize_t data_size;
+
+    data_size = read(migration->data_fd, migration->data_buffer,
+                     migration->data_buffer_size);
+    if (data_size < 0) {
+        return -1;
+    }
+    if (data_size == 0) {
+        return 1;
+    }
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
+    qemu_put_be64(f, data_size);
+    qemu_put_buffer_async(f, migration->data_buffer, data_size, false);
+    qemu_fflush(f);
+    bytes_transferred += data_size;
+
+    trace_vfio_save_block(migration->vbasedev->name, data_size);
+
+    return qemu_file_get_error(f);
+}
+
+static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    enum vfio_device_mig_state recover_state;
+    int ret;
+
+    /* We reach here with device state STOP or STOP_COPY only */
+    recover_state = VFIO_DEVICE_STATE_STOP;
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
+                                   recover_state);
+    if (ret) {
+        return ret;
+    }
+
+    do {
+        ret = vfio_save_block(f, vbasedev->migration);
+        if (ret < 0) {
+            return ret;
+        }
+    } while (!ret);
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+    ret = qemu_file_get_error(f);
+    if (ret) {
+        return ret;
+    }
+
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
+                                   recover_state);
+    if (ret) {
+        return ret;
+    }
+
+    trace_vfio_save_complete_precopy(vbasedev->name);
+
+    return 0;
+}
+
 static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -593,6 +775,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
     }
 }
 
+static int vfio_load_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
+                                   vbasedev->migration->device_state);
+}
+
 static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -620,6 +810,15 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
     return ret;
 }
 
+static int vfio_load_cleanup(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    vfio_migration_cleanup(vbasedev);
+    trace_vfio_load_cleanup(vbasedev->name);
+    return 0;
+}
+
 static int vfio_v1_load_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -662,7 +861,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             uint64_t data_size = qemu_get_be64(f);
 
             if (data_size) {
-                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
+                if (vbasedev->migration->v2) {
+                    ret = vfio_load_buffer(f, vbasedev, data_size);
+                } else {
+                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
+                }
                 if (ret < 0) {
                     return ret;
                 }
@@ -683,6 +886,16 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
     return ret;
 }
 
+static SaveVMHandlers savevm_vfio_handlers = {
+    .save_setup = vfio_save_setup,
+    .save_cleanup = vfio_save_cleanup,
+    .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_state = vfio_save_state,
+    .load_setup = vfio_load_setup,
+    .load_cleanup = vfio_load_cleanup,
+    .load_state = vfio_load_state,
+};
+
 static SaveVMHandlers savevm_vfio_v1_handlers = {
     .save_setup = vfio_v1_save_setup,
     .save_cleanup = vfio_v1_save_cleanup,
@@ -697,6 +910,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
 
 /* ---------------------------------------------------------------------- */
 
+static void vfio_vmstate_change(void *opaque, bool running, RunState state)
+{
+    VFIODevice *vbasedev = opaque;
+    enum vfio_device_mig_state new_state;
+    int ret;
+
+    if (running) {
+        new_state = VFIO_DEVICE_STATE_RUNNING;
+    } else {
+        new_state = VFIO_DEVICE_STATE_STOP;
+    }
+
+    ret = vfio_migration_set_state(vbasedev, new_state,
+                                   VFIO_DEVICE_STATE_ERROR);
+    if (ret) {
+        /*
+         * Migration should be aborted in this case, but vm_state_notify()
+         * currently does not support reporting failures.
+         */
+        if (migrate_get_current()->to_dst_file) {
+            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        }
+    }
+
+    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
+                              new_state);
+}
+
 static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
@@ -770,12 +1011,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_v1_set_state(vbasedev,
-                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                            VFIO_DEVICE_STATE_V1_RESUMING),
-                                          VFIO_DEVICE_STATE_V1_RUNNING);
-        if (ret) {
-            error_report("%s: Failed to set state RUNNING", vbasedev->name);
+        if (migration->v2) {
+            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
+                                     VFIO_DEVICE_STATE_ERROR);
+        } else {
+            ret = vfio_migration_v1_set_state(vbasedev,
+                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
+                                                VFIO_DEVICE_STATE_V1_RESUMING),
+                                              VFIO_DEVICE_STATE_V1_RUNNING);
+            if (ret) {
+                error_report("%s: Failed to set state RUNNING", vbasedev->name);
+            }
         }
     }
 }
@@ -784,12 +1030,35 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    vfio_region_exit(&migration->region);
-    vfio_region_finalize(&migration->region);
+    if (migration->v2) {
+        g_free(migration->data_buffer);
+    } else {
+        vfio_region_exit(&migration->region);
+        vfio_region_finalize(&migration->region);
+    }
     g_free(vbasedev->migration);
     vbasedev->migration = NULL;
 }
 
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
 static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
@@ -798,6 +1067,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
     struct vfio_region_info *info = NULL;
+    uint64_t mig_flags;
 
     if (!vbasedev->ops->vfio_get_object) {
         return -EINVAL;
@@ -808,32 +1078,48 @@ static int vfio_migration_init(VFIODevice *vbasedev)
         return -EINVAL;
     }
 
-    ret = vfio_get_dev_region_info(vbasedev,
-                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
-                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
-                                   &info);
-    if (ret) {
-        return ret;
-    }
+    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
+    if (!ret) {
+        /* Migration v2 */
+        /* Basic migration functionality must be supported */
+        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
+            return -EOPNOTSUPP;
+        }
+        vbasedev->migration = g_new0(VFIOMigration, 1);
+        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
+        vbasedev->migration->data_buffer =
+            g_malloc0(vbasedev->migration->data_buffer_size);
+        vbasedev->migration->data_fd = -1;
+        vbasedev->migration->v2 = true;
+    } else {
+        /* Migration v1 */
+        ret = vfio_get_dev_region_info(vbasedev,
+                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                       &info);
+        if (ret) {
+            return ret;
+        }
 
-    vbasedev->migration = g_new0(VFIOMigration, 1);
+        vbasedev->migration = g_new0(VFIOMigration, 1);
 
-    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
-                            info->index, "migration");
-    if (ret) {
-        error_report("%s: Failed to setup VFIO migration region %d: %s",
-                     vbasedev->name, info->index, strerror(-ret));
-        goto err;
-    }
+        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
+                                info->index, "migration");
+        if (ret) {
+            error_report("%s: Failed to setup VFIO migration region %d: %s",
+                         vbasedev->name, info->index, strerror(-ret));
+            goto err;
+        }
 
-    if (!vbasedev->migration->region.size) {
-        error_report("%s: Invalid zero-sized VFIO migration region %d",
-                     vbasedev->name, info->index);
-        ret = -EINVAL;
-        goto err;
-    }
+        if (!vbasedev->migration->region.size) {
+            error_report("%s: Invalid zero-sized VFIO migration region %d",
+                         vbasedev->name, info->index);
+            ret = -EINVAL;
+            goto err;
+        }
 
-    g_free(info);
+        g_free(info);
+    }
 
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
@@ -846,11 +1132,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
     strpadcpy(id, sizeof(id), path, '\0');
 
-    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
-                         &savevm_vfio_v1_handlers, vbasedev);
+    if (migration->v2) {
+        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
+                             &savevm_vfio_handlers, vbasedev);
+
+        migration->vm_state = qdev_add_vm_change_state_handler(
+            vbasedev->dev, vfio_vmstate_change, vbasedev);
+    } else {
+        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
+                             &savevm_vfio_v1_handlers, vbasedev);
+
+        migration->vm_state = qdev_add_vm_change_state_handler(
+            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
+    }
 
-    migration->vm_state = qdev_add_vm_change_state_handler(
-        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
     return 0;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index ac8b04f52a..6e8c5958b9 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -163,6 +163,8 @@ vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
 vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
+vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index bbaf72ba00..2ec3346fea 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -66,6 +66,11 @@ typedef struct VFIOMigration {
     int vm_running;
     Notifier migration_state;
     uint64_t pending_bytes;
+    enum vfio_device_mig_state device_state;
+    int data_fd;
+    void *data_buffer;
+    size_t data_buffer_size;
+    bool v2;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
-- 
2.21.3


