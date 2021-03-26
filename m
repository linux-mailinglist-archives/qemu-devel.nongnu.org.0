Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B293C34A833
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:35:55 +0100 (CET)
Received: from localhost ([::1]:36984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmd0-0004wl-OQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lPmbc-0004RL-4T
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:34:31 -0400
Received: from mail-mw2nam12on2041.outbound.protection.outlook.com
 ([40.107.244.41]:14785 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lPmbZ-0004ne-Ge
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:34:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wox8+UzJBznOF1oTAO6mXab1NsHGjvHM9dYWj7Cqcv+QnD2RCpofRyyld5tKzAaUux5BxqOBaXQqeHtZZfyACSsqwgUmOcGtLKcD9yLdWTAfmiXorVlKoydICLTK79nKu9jPePq/V2vsDrHZ0uySEx6E8qZuin1h9NH+UCFaCA8bykGIlQqIl3TyRxmvJ9h4HaGzwe2d6GcQ3w3uAr8fMOBsEFVc0+ky32AGx8l4lDA6vaFS3lBnOr5kRwTNZI1ZgV/NdF0fnBQL1t8ti0ZtRp48UI8gJaJv5P1L0OhDlGkTbkDfdDKxQqp85g/6rarpangeNcvW0SARDdy1BKiSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CscwAVMOlmYeNxu5I7zQyoWBkwWDd8Qn1E1G/4YvtSw=;
 b=bV0PvmF/M5N3cdhUKxiP/69zhUj1A0vaAucUvQRj4Iqf3+R8jhlz/zUZfN/6bQ/eaGOIEkYGJ2HU7XhF6k+G6s8BFZbahXS6REICWqNIvPDX4VwV1doE4cM5SfkKnUIRpe+vCTai7sM7BqNsTXAQiduwtcWLD5sENsassVtSm3/XoKiZi0Vz76yAUmzKerDCrLxPrFO0LgIy/6jUo9iSQ6htB7UxPPdAe01lgIBIhYXZwvyxt7Lt213BY43f4y6YM4AZxG96aFnpFpqIZTU+eNN1PqsFGpfAy+s9Miq38R86wsNDAqdIetrnZRhA+heiFOjbRrIgKD0cugFwH+3IKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CscwAVMOlmYeNxu5I7zQyoWBkwWDd8Qn1E1G/4YvtSw=;
 b=aibttNeTfj+WP9hrUs3xg8YjkK0+8Wi6xI8ktz4AFxmBTfFsWXmJ/Y7o0MO2KdkjvLVsrePYghaKF4jgngp+pdFI9Z3/P5BYhQthFNFvw94NCsLGvBB8Zwv/xdy4ZrLsz/aD71Nh/2Jh4+EnsQJP89epKDkhKBcWU1ig+psbcs2hiXz4Nt+OE70oeSIVZwH0dJyGo6yL1ZAoPWfYwrIzAk/KFcdMz0ZLRO9g+XP52JlGh92+qXfgZ6A2SJcm9/jouM/y+WI4W/1Q7jU5hWZrJWUWqt0mACXL4kMFiHnDguMI5WHiObJ82cC+4j+GEHYmJKzVD/wWssORZKl9dfe/qw==
Received: from DM6PR07CA0046.namprd07.prod.outlook.com (2603:10b6:5:74::23) by
 DM6PR12MB4911.namprd12.prod.outlook.com (2603:10b6:5:20e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24; Fri, 26 Mar 2021 13:19:17 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::5c) by DM6PR07CA0046.outlook.office365.com
 (2603:10b6:5:74::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Fri, 26 Mar 2021 13:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 13:19:15 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar
 2021 13:19:15 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar
 2021 13:19:14 +0000
Received: from dhcp-10-24-130-144.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Mar 2021 06:19:10 -0700
From: Tarun Gupta <targupta@nvidia.com>
To: <qemu-devel@nongnu.org>, <kwankhede@nvidia.com>,
 <alex.williamson@redhat.com>, <cohuck@redhat.com>, <kevin.tian@intel.com>
Subject: [PATCH v3 1/1] docs/devel: Add VFIO device migration documentation
Date: Fri, 26 Mar 2021 18:48:50 +0530
Message-ID: <20210326131850.149337-1-targupta@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cbdca61-54bd-4b52-09b5-08d8f059c167
X-MS-TrafficTypeDiagnostic: DM6PR12MB4911:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4911F268E7B75D6B59091B43B8619@DM6PR12MB4911.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxV/TJhEnsm+8rZpEF8Q9klHZlVY2VuR0o7u5JpagU3fT6KouJNJX5nEFkdqWINoaiXB8Hh7JRYmwl7X56p2LDMQRtUjIZxQf/lHPk+GEOTjZgP0poPb/WOcoPCsebJlgF/o0b+sthWNb7wHyecBnwT1Xz5Zc7Er2eVLt3Sa8R9EKtEw/XVe8xzSs8gAjP5J6IkGZVzMWVmGebl11XNZIzn1WYCr7nDM1HHh8IsOw6qosZtEotDxAEYdfuSVFVtMhz8WPEKdUEvzjVxya3N75dc8LekmMBF2Wd5g4wCT+b5AWdnQucs7+Wtpzrfnh3T3wCnYJ+4X1oV5udbfX1RCuzPxd++dHoLSTYqtXxER801xq1VRixzJNz7ESf17l7jkVDoiZ0B5aY4VJZTewIa5nWtNIrKKbTr8ne5DIzpjX0shV5qSRxiuutjcObf2flrNcE/4fuWF4+XP0xrUBEzTImQcRoV0O2YDYquN/DmAuRllQKLI8cNSUNhBXa5tCIKHURiz9gBBLHgDgLQiujwu+4rx4ht0Gf11DzCFbDBg2If4rNnDubZ7s5qDlWFg5tDpSDkun7I8gk/ATdeVqZ3zW3VZiOH3rJgr3F6ilapxFb4IYXzoXjhtqNORuTn16eczPBTUoPCA72lydmf+1Hoqky159BPHalUMpnthDClHo5c=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(36840700001)(46966006)(6666004)(1076003)(7636003)(7696005)(4326008)(2906002)(86362001)(26005)(82740400003)(70206006)(5660300002)(70586007)(83380400001)(478600001)(8936002)(336012)(107886003)(7416002)(316002)(110136005)(356005)(426003)(54906003)(36860700001)(47076005)(36906005)(186003)(36756003)(2616005)(8676002)(82310400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 13:19:15.8867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbdca61-54bd-4b52-09b5-08d8f059c167
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4911
Received-SPF: softfail client-ip=40.107.244.41;
 envelope-from=targupta@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cjia@nvidia.com, quintela@redhat.com, dgilbert@redhat.com,
 yan.y.zhao@intel.com, lushenming@huawei.com, dnigam@nvidia.com,
 berrange@redhat.com, philmd@redhat.com, Tarun Gupta <targupta@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document interfaces used for VFIO device migration. Added flow of state changes
during live migration with VFIO device. Tested by building docs with the new
vfio-migration.rst file.

v3:
- Add introductory line about VM migration in general.
- Remove occurcences of vfio_pin_pages() to describe pinning.
- Incorporated comments from v2

v2:
- Included the new vfio-migration.rst file in index.rst
- Updated dirty page tracking section, also added details about
  'pre-copy-dirty-page-tracking' opt-out option.
- Incorporated comments around wording of doc.

Signed-off-by: Tarun Gupta <targupta@nvidia.com>
Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 MAINTAINERS                   |   1 +
 docs/devel/index.rst          |   1 +
 docs/devel/vfio-migration.rst | 143 ++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 docs/devel/vfio-migration.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 738786146d..a2a80eee59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1801,6 +1801,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
 S: Supported
 F: hw/vfio/*
 F: include/hw/vfio/
+F: docs/devel/vfio-migration.rst
 
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index ae664da00c..5330f1ca1d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -39,3 +39,4 @@ Contents:
    qom
    block-coroutine-wrapper
    multi-process
+   vfio-migration
diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
new file mode 100644
index 0000000000..24cb55991a
--- /dev/null
+++ b/docs/devel/vfio-migration.rst
@@ -0,0 +1,143 @@
+=====================
+VFIO device Migration
+=====================
+
+Migration of virtual machine involves saving the state for each device that
+the guest is running on source host and restoring this saved state on the
+destination host. This document details how saving and restoring of VFIO
+devices is done in QEMU.
+
+Migration of VFIO devices consists of two phases: the optional pre-copy phase,
+and the stop-and-copy phase. The pre-copy phase is iterative and allows to
+accommodate VFIO devices that have a large amount of data that needs to be
+transferred. The iterative pre-copy phase of migration allows for the guest to
+continue whilst the VFIO device state is transferred to the destination, this
+helps to reduce the total downtime of the VM. VFIO devices can choose to skip
+the pre-copy phase of migration by returning pending_bytes as zero during the
+pre-copy phase.
+
+A detailed description of the UAPI for VFIO device migration can be found in
+the comment for the ``vfio_device_migration_info`` structure in the header
+file linux-headers/linux/vfio.h.
+
+VFIO device hooks for iterative approach:
+
+* A ``save_setup`` function that sets up the migration region, sets _SAVING
+  flag in the VFIO device state and informs the VFIO IOMMU module to start
+  dirty page tracking.
+
+* A ``load_setup`` function that sets up the migration region on the
+  destination and sets _RESUMING flag in the VFIO device state.
+
+* A ``save_live_pending`` function that reads pending_bytes from the vendor
+  driver, which indicates the amount of data that the vendor driver has yet to
+  save for the VFIO device.
+
+* A ``save_live_iterate`` function that reads the VFIO device's data from the
+  vendor driver through the migration region during iterative phase.
+
+* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
+  VFIO device state, saves the device config space, if any, and iteratively
+  copies the remaining data for the VFIO device until the vendor driver
+  indicates that no data remains (pending bytes is zero).
+
+* A ``load_state`` function that loads the config section and the data
+  sections that are generated by the save functions above
+
+* ``cleanup`` functions for both save and load that perform any migration
+  related cleanup, including unmapping the migration region
+
+A VM state change handler is registered to change the VFIO device state when
+the VM state changes.
+
+Similarly, a migration state change notifier is registered to get a
+notification on migration state change. These states are translated to the
+corresponding VFIO device state and conveyed to the vendor driver.
+
+System memory dirty pages tracking
+----------------------------------
+
+A ``log_sync`` memory listener callback marks those system memory pages
+as dirty which are used for DMA by the VFIO device. The dirty pages bitmap is
+queried per container. All pages pinned by the vendor driver through external
+APIs have to be marked as dirty during migration. When there are CPU writes,
+CPU dirty page tracking can identify dirtied pages, but any page pinned by the
+vendor driver can also be written by device. There is currently no device or
+IOMMU support for dirty page tracking in hardware.
+
+By default, dirty pages are tracked when the device is in pre-copy as well as
+stop-and-copy phase. So, a page pinned by vendor driver will be copied to
+destination in both the phases. Copying dirty pages in pre-copy phase helps
+QEMU to predict if it can achieve its downtime tolerances. If QEMU during
+pre-copy phase keeps finding dirty pages continuously, then it understands
+that even in stop-and-copy phase, it is likely to find dirty pages and can
+predict the downtime accordingly
+
+QEMU also provides per device opt-out option ``pre-copy-dirty-page-tracking``
+which disables querying dirty bitmap during pre-copy phase. If it is set to
+off, all dirty pages will be copied to destination in stop-and-copy phase only
+
+System memory dirty pages tracking when vIOMMU is enabled
+---------------------------------------------------------
+
+With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
+phase of migration. In that case, the unmap ioctl returns any dirty pages in
+that range and QEMU reports corresponding guest physical pages dirty. During
+stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
+pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
+mapped ranges.
+
+Flow of state changes during Live migration
+===========================================
+
+Below is the flow of state change during live migration.
+The values in the brackets represent the VM state, the migration state, and
+the VFIO device state, respectively.
+
+Live migration save path
+------------------------
+
+::
+
+                        QEMU normal running state
+                        (RUNNING, _NONE, _RUNNING)
+                                  |
+                     migrate_init spawns migration_thread
+                Migration thread then calls each device's .save_setup()
+                    (RUNNING, _SETUP, _RUNNING|_SAVING)
+                                  |
+                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
+             If device is active, get pending_bytes by .save_live_pending()
+          If total pending_bytes >= threshold_size, call .save_live_iterate()
+                  Data of VFIO device for pre-copy phase is copied
+        Iterate till total pending bytes converge and are less than threshold
+                                  |
+  On migration completion, vCPU stops and calls .save_live_complete_precopy for
+   each active device. The VFIO device is then transitioned into _SAVING state
+                   (FINISH_MIGRATE, _DEVICE, _SAVING)
+                                  |
+     For the VFIO device, iterate in .save_live_complete_precopy until
+                         pending data is 0
+                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
+                                  |
+                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
+             Migraton thread schedules cleanup bottom half and exits
+
+Live migration resume path
+--------------------------
+
+::
+
+              Incoming migration calls .load_setup for each device
+                       (RESTORE_VM, _ACTIVE, _STOPPED)
+                                 |
+       For each device, .load_state is called for that device section data
+                       (RESTORE_VM, _ACTIVE, _RESUMING)
+                                 |
+    At the end, .load_cleanup is called for each device and vCPUs are started
+                       (RUNNING, _NONE, _RUNNING)
+
+Postcopy
+========
+
+Postcopy migration is currently not supported for VFIO devices.
-- 
2.27.0


