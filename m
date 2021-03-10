Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32553334823
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:39:39 +0100 (CET)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4gE-0002Ha-4R
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lK4cW-0007Mb-3g
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:35:48 -0500
Received: from mail-bn8nam12on2052.outbound.protection.outlook.com
 ([40.107.237.52]:41281 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lK4cT-0007pB-4F
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:35:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj3mFAEQWYYLCrPSjE/TIioBPOZ0KY/bI7fhcuJkHqVfWxPA5m2mMbgIMJIIxS0YF1hq5WpyzAkceRqZSlBax/nfq/ROyrorE0IsnjxMNkeY4ffPx4URxZ3KbW4xS2jOuubKCgHav9an5Q4V9nVQbYT4/oOr2DoxPKC4iugtuOocf6Ve0B2SuHUXCBMHILmHaPb/7bx8y7luZ/TTWgIB0lL45xleI7s3m7sAupyLf759q4eCGJ0iOZDgYEfm6/S0FCHkouFKwLSaS2f9gkrqjchH1lqVyVIwR37IzdB3XizjJDolK+etnb+Pnzs75pVdypJEWaEqhm5iqMnf6xDy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNHrvmKxsBZ9lTtMJjqFvMuOw9nZYZMTxHM/bWVr+JM=;
 b=PfgqJK5snjdN5xK3FVLZ8/0UEYMljFJhmrKjrgJdB1JLv5rq/mjc14TgbDkJXYVXbXVCKZVVkLTo1QMRgNf3PCSUQyrAyMxMjEfBx+3r8+XzHP4WGQ3KzlvGExFi48EndF3rJDDqw4uXF0i4dAmHFWHbyOe6pf1xl/2ngVxFiI6J0hUdEqj8yxAbbzPifm6Amk8tgmJKOMJkuiTLIMKD0zUPKiSlN5/KWEiOI8pO9M40AXg6kieFLhmnGKMdWu9TNpTStH6Xp6qmfhyqQqFWUlPei5bSc76+kDjlKGuiDyGxHCh1Yx81rgcM9a7GIZswDUK8Bhtztr/7Ctg6orkqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNHrvmKxsBZ9lTtMJjqFvMuOw9nZYZMTxHM/bWVr+JM=;
 b=MUGe4LHTC7go3TP83fKEdYeS7RvhzqSgR6bW9okElqK1oB/FHSMH6Om90mY/1OIpPQvLrXfj1I3kK0UKDxkyhafjTQFbtVctCInIVBNTGc+7hs9EJdPOJAUL0SI7FJf0T6fm6UYZiOWuk2Q3GhEulYfLi4i2MKR0hbRVAvlXxzeP9DFdjJedD54AGbLci3RIdimu3C4DvWhUyZr958IfQrjdTCxvYJRxcTJdySnKTLmFzS60wDsMm8v6SRfw2vcH3nL8tdZAxX9vqA2NOYn3hUdEANUBFcyDLXUqORT5SSwqoQ1OJ0r6FDCLR5/ha4ICHA8xAjtHzJZXONIvz4+DeQ==
Received: from BN9PR03CA0385.namprd03.prod.outlook.com (2603:10b6:408:f7::30)
 by SN6PR12MB2606.namprd12.prod.outlook.com (2603:10b6:805:6e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Wed, 10 Mar
 2021 19:20:38 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::1a) by BN9PR03CA0385.outlook.office365.com
 (2603:10b6:408:f7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Wed, 10 Mar 2021 19:20:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Wed, 10 Mar 2021 19:20:37 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 10 Mar
 2021 19:20:37 +0000
Received: from dhcp-10-24-130-144.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 19:20:32 +0000
From: Tarun Gupta <targupta@nvidia.com>
To: <alex.williamson@redhat.com>, <qemu-devel@nongnu.org>, <cohuck@redhat.com>
Subject: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Date: Thu, 11 Mar 2021 00:50:09 +0530
Message-ID: <20210310192009.53848-1-targupta@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 365793ce-0f0c-4f08-8ea1-08d8e3f9963f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2606:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2606B5F8AD6B47829B7F28B0B8919@SN6PR12MB2606.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93lKMTHgXKvQKycWg4muqI76XgSjzfF4tV8m+22dggLXIoRj0+Yal03F9atSCgequwAj7VKFnE2jS2RNFA5rvwTL+PkNEXPpQ0ukQA4Yp9GoIbtydVYKDxGa7iQXlsG3V4RgydX62vq9afvBRpO1NWIuciu/HStUKhSu6bgSrEkqeJWZQ8w5LPedcXp7wY1KG3AQtHueMdwKHzJnlsF6GzYp4Uw7rfWCgCSYmRjwmbGo0IWvjg6/58bjkNq5Ffpyr1yN6kyq8yI2yfX8GEm4nBUNK75Oan1R0aK3+M/qeLeyoyrAszrmzd9lrgsCeBD0aXSGqAPx4cEwt9u0auG/J7LQL7Xmhb1T9RyhLaRuNzdsSe4/iU3BwpR/o/sVS/7dg2emcsyvBqUkPkra2zU4CEkxMa5EcbE6+P2zAcds6Qe7FkcehIyEjtpM6AT78HPHh8/frloyT35xWZpNoFyhvqfLcFyKQ4O7TKGZghlGaS4zi2i0jkh4YgRgrrsUusDbbHvVw/it+ltR8BOJnFUSaCa6XEZc8XKItPB6/m1zYbo2ALfkg4gNbX6OQmwxJrWsOGOPyNHjQ5grkdImVj+UQw7rPygeJbXwIv47DF1mtHz0/KTQE6bpmxCkbQYnrhhwWsbllxQnCpE34lVcKp3sgNkZSvSNTaImH5KX2TbrVDF5e2rQ9lUgimoNOwtg2vd1
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(6666004)(36756003)(2906002)(70586007)(70206006)(83380400001)(1076003)(5660300002)(186003)(107886003)(478600001)(47076005)(7416002)(426003)(7696005)(82310400003)(2616005)(110136005)(336012)(54906003)(86362001)(8676002)(7636003)(8936002)(26005)(36860700001)(356005)(4326008)(82740400003)(34070700002)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 19:20:37.8275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 365793ce-0f0c-4f08-8ea1-08d8e3f9963f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2606
Received-SPF: softfail client-ip=40.107.237.52;
 envelope-from=targupta@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: kevin.tian@intel.com, berrange@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, yan.y.zhao@intel.com, lushenming@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, dnigam@nvidia.com, cjia@nvidia.com,
 philmd@redhat.com, Tarun Gupta <targupta@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document interfaces used for VFIO device migration. Added flow of state changes
during live migration with VFIO device. Tested by building docs with the new
vfio-migration.rst file.

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
 docs/devel/vfio-migration.rst | 135 ++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
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
index 0000000000..6196fb132c
--- /dev/null
+++ b/docs/devel/vfio-migration.rst
@@ -0,0 +1,135 @@
+=====================
+VFIO device Migration
+=====================
+
+VFIO devices use an iterative approach for migration because certain VFIO
+devices (e.g. GPU) have large amount of data to be transfered. The iterative
+pre-copy phase of migration allows for the guest to continue whilst the VFIO
+device state is transferred to the destination, this helps to reduce the total
+downtime of the VM. VFIO devices can choose to skip the pre-copy phase of
+migration by returning pending_bytes as zero during the pre-copy phase.
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
+  copies the remaining data for the VFIO device untill the vendor driver
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
+notification on migration state change. These states are translated to VFIO
+device state and conveyed to vendor driver.
+
+System memory dirty pages tracking
+----------------------------------
+
+A ``log_sync`` memory listener callback marks those system memory pages
+as dirty which are used for DMA by the VFIO device. The dirty pages bitmap is
+queried per container. All pages pinned by the vendor driver through
+vfio_pin_pages() external API have to be marked as dirty during migration.
+When there are CPU writes, CPU dirty page tracking can identify dirtied pages,
+but any page pinned by the vendor driver can also be written by device. There
+is currently no device which has hardware support for dirty page tracking. So
+all pages which are pinned by vendor driver are considered as dirty.
+
+By default, dirty pages are tracked when the device is in pre-copy as well as
+stop-and-copy phase. So, a page pinned by the vendor driver using
+vfio_pin_pages() will be copied to destination in both the phases. Copying
+dirty pages in pre-copy phase helps QEMU to predict if it can achieve its
+downtime tolerances.
+
+QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
+to disable dirty page tracking during pre-copy phase. If it is set to off, all
+pinned pages will be copied to destination in stop-and-copy phase only.
+
+System memory dirty pages tracking when vIOMMU is enabled
+---------------------------------------------------------
+
+With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
+phase of migration. In that case, the unmap ioctl returns any pinned pages in
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
+Postcopy migration is not supported for VFIO devices.
-- 
2.27.0


