Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389152519A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:50:57 +0200 (CEST)
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB5c-00065n-Bx
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAz2-0006Xx-Py
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:44:10 -0400
Received: from mail-dm6nam08on20611.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::611]:20288
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyz-0005M1-Dr
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:44:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuINeZDsqizolUGGnboZt4m6I6SjNhVvjw2jMymB/3LE3NMSeMlIJ0+cVkRGtMIEN7US54zE8rOeUfNN0WT+GdOOTT+PG1RFBm0/qwQCr9dh/zazyTSUUanePE1oMtaFyWmdoo6spZI8ScdRzhDaAwZasNZgbjtjGtUsLq+wSMO1shesCUytUhlcuM1dpqn0zH+kmhHwmnIy9dmJTqMChLPo9ZO1W9AmuIM7ku3aNsxIBupmXvm1XUa7uriyTQ6S9NcgAVfFJD2a998qMCgCypKqEsqrkfxPZJndV/jIDcMnGZW+YXqjNKXUCd7MDySjKQ0QnFgCISAFCfKY4yw/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSPaPjjDN9b8FTrPUpEHjY11iJitw0hUj9yIciMkLkE=;
 b=ToRq9+5e5Ya07B4ee0JSUMGoiY09MsGW+YhUwOzEsvh9iGKcuR/UGfKMyANeFOBjURLrf+aLtmz0BmeG942aQYvEkrXlifqIGaExYJ6aBrT4XO0ZJ4MyHWxOPVGgiztxfK7ZgqKEh4HMEFq9oa+HmvleeIlKC4M55iqy4DghI9QAk1tmF8craNp4xYByK9Rl/CH/wPjUpwvBn6LhStH1x8lrRXM881t4DxfXqnrBIyBwY1LLp5e3ai7tYyyu1YTzir0jqBBJ1wb+wIAvCuKdGOaZ7JbragJNixCA7DbbLKxI8AtL8YWstM69UCvbjg3aCyp3BTSTDxV+BfPKNu0d/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSPaPjjDN9b8FTrPUpEHjY11iJitw0hUj9yIciMkLkE=;
 b=Hcuw2iKMs5WeBgbuz7fSH9rq1WxZ+cfj/G9I9H53Ch/RpfOP/yoR77nsCmk5Loee7UvSdOTH+JEzaIUGq887Sx+bvTRXzpqRit0g9gGR/34TwPyn3N6vdnI8QjRAIYi80/kA3hgrLBhaMXx1yPg4ltZ9LmCMJGwNmE4WvUY43vmVPxx/bGTaZrXXCsThcrw3ISANwm8tSDZhQYfcKtRRkhUlaprUDU3rkbj/vL5gji0yecCGBQi0NbLl4mQIRHffrIWYEqh+NaX2NZOwWfcjJQswZmhBK1UvYvUt6JO2xavdpWHKgegA5Wqfk7GVknlk3igSrYvwb4+ik9VoWiKQeg==
Received: from MW3PR06CA0029.namprd06.prod.outlook.com (2603:10b6:303:2a::34)
 by MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 15:44:01 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::e0) by MW3PR06CA0029.outlook.office365.com
 (2603:10b6:303:2a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 12 May 2022 15:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:44:01 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:44:01 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:44:00 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:56 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 9/9] docs/devel: Align vfio-migration docs to VFIO migration v2
Date: Thu, 12 May 2022 18:43:20 +0300
Message-ID: <20220512154320.19697-10-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6cb182f-2ea1-4907-940c-08da342e3cb9
X-MS-TrafficTypeDiagnostic: MWHPR12MB1248:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1248EB03E55AD7AF2FDF98C6DECB9@MWHPR12MB1248.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6b33mxuAQPa609N70d8YL/RGRHSG2Gj5b8SJlglZXV9RlgLv6NALocdZxK8+N5NQ2/8Q06fcmhliuYaEtHjM2NjZzpO1FeL8tanM9u0cXfGi9u4cbAkMZbpM7hAVDncNffN5pgpD1iZcMCymOHn0Cm8F3binUCrb1FCk1LK6zDhFEpc9hqUUDaD8lLgPSe191CdyzWdYzIZGNJ0chthic/gmg8BkUUnSffJJQ8U6P0z5hwbwpDSquC2y/rbrnfXylihQj9/QmwgZbb719ufEZBmfHoIHfJxG7rv8LfUh0WquBQK3+V66MrlE6/B+b14CWFlom7bI7qbSglI5c+cYH4pZq5WnGINegcCLDByig27A6OH/din11TPUS+hkcj9+H70Ed+GnyofCWgOjj5wkO8ZmJ0J4PsIdLccCmFai7pug6X0eu7qvCJYBMkqgXp9oxXS36czjccCsab6pav/391eAqwuOR6/6MmGv2W+JdEx2JUPayk88Vb5IL8n0zwZJFwx1TqTpo8sPdd3ictAeqAW9EuXGe2jvQYAzLdJcGWmZ/xba5XE09KplfLxcJa2gtHlGA2oaUPcmwVhmWg8Pgp8b7lYjBMUsxWxp7vOe14+hH4eFPMnrpTW2ziKjZBdFw2cwAQcFq69SMavWUbFfCqpvOBbgnE21dABOqJiwqvMOQ3o/PncMfbgAdzZzMASc8hkRp4P6KRpQxZSQ0TOTA==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8676002)(316002)(81166007)(4326008)(70586007)(356005)(508600001)(1076003)(5660300002)(186003)(54906003)(2616005)(110136005)(107886003)(36756003)(8936002)(82310400005)(336012)(47076005)(426003)(26005)(7696005)(83380400001)(2906002)(40460700003)(6666004)(86362001)(36860700001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:44:01.7187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cb182f-2ea1-4907-940c-08da342e3cb9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1248
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::611;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
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

Align the vfio-migration documentation to VFIO migration protocol v2.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 docs/devel/vfio-migration.rst | 77 +++++++++++++++--------------------
 1 file changed, 33 insertions(+), 44 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 9ff6163c88..09744af5a6 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -7,46 +7,35 @@ the guest is running on source host and restoring this saved state on the
 destination host. This document details how saving and restoring of VFIO
 devices is done in QEMU.
 
-Migration of VFIO devices consists of two phases: the optional pre-copy phase,
-and the stop-and-copy phase. The pre-copy phase is iterative and allows to
-accommodate VFIO devices that have a large amount of data that needs to be
-transferred. The iterative pre-copy phase of migration allows for the guest to
-continue whilst the VFIO device state is transferred to the destination, this
-helps to reduce the total downtime of the VM. VFIO devices can choose to skip
-the pre-copy phase of migration by returning pending_bytes as zero during the
-pre-copy phase.
+Migration of VFIO devices currently consists of a single stop-and-copy phase.
+During the stop-and-copy phase the guest is stopped and the entire VFIO device
+data is transferred to the destination.
+
+The pre-copy phase of migration is currently not supported for VFIO devices,
+so VFIO device data is not transferred during pre-copy phase.
 
 A detailed description of the UAPI for VFIO device migration can be found in
-the comment for the ``vfio_device_migration_info`` structure in the header
-file linux-headers/linux/vfio.h.
+the comment for the ``vfio_device_mig_state`` structure in the header file
+linux-headers/linux/vfio.h.
 
 VFIO implements the device hooks for the iterative approach as follows:
 
-* A ``save_setup`` function that sets up the migration region and sets _SAVING
-  flag in the VFIO device state.
-
-* A ``load_setup`` function that sets up the migration region on the
-  destination and sets _RESUMING flag in the VFIO device state.
-
-* A ``save_live_pending`` function that reads pending_bytes from the vendor
-  driver, which indicates the amount of data that the vendor driver has yet to
-  save for the VFIO device.
+* A ``save_setup`` function that sets up migration on the source.
 
-* A ``save_live_iterate`` function that reads the VFIO device's data from the
-  vendor driver through the migration region during iterative phase.
+* A ``load_setup`` function that sets the VFIO device on the destination in
+  _RESUMING state.
 
 * A ``save_state`` function to save the device config space if it is present.
 
-* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
-  VFIO device state and iteratively copies the remaining data for the VFIO
-  device until the vendor driver indicates that no data remains (pending bytes
-  is zero).
+* A ``save_live_complete_precopy`` function that sets the VFIO device in
+  _STOP_COPY state and iteratively copies the data for the VFIO device until
+  the vendor driver indicates that no data remains.
 
 * A ``load_state`` function that loads the config section and the data
-  sections that are generated by the save functions above
+  sections that are generated by the save functions above.
 
 * ``cleanup`` functions for both save and load that perform any migration
-  related cleanup, including unmapping the migration region
+  related cleanup.
 
 
 The VFIO migration code uses a VM state change handler to change the VFIO
@@ -71,13 +60,13 @@ tracking can identify dirtied pages, but any page pinned by the vendor driver
 can also be written by the device. There is currently no device or IOMMU
 support for dirty page tracking in hardware.
 
-By default, dirty pages are tracked when the device is in pre-copy as well as
-stop-and-copy phase. So, a page pinned by the vendor driver will be copied to
-the destination in both phases. Copying dirty pages in pre-copy phase helps
-QEMU to predict if it can achieve its downtime tolerances. If QEMU during
-pre-copy phase keeps finding dirty pages continuously, then it understands
-that even in stop-and-copy phase, it is likely to find dirty pages and can
-predict the downtime accordingly.
+By default, dirty pages are tracked during pre-copy as well as stop-and-copy
+phase. So, a page pinned by the vendor driver will be copied to the destination
+in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
+it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
+finding dirty pages continuously, then it understands that even in stop-and-copy
+phase, it is likely to find dirty pages and can predict the downtime
+accordingly.
 
 QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
 which disables querying the dirty bitmap during pre-copy phase. If it is set to
@@ -111,23 +100,23 @@ Live migration save path
                                   |
                      migrate_init spawns migration_thread
                 Migration thread then calls each device's .save_setup()
-                    (RUNNING, _SETUP, _RUNNING|_SAVING)
+                       (RUNNING, _SETUP, _RUNNING)
                                   |
-                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
-             If device is active, get pending_bytes by .save_live_pending()
-          If total pending_bytes >= threshold_size, call .save_live_iterate()
-                  Data of VFIO device for pre-copy phase is copied
+                      (RUNNING, _ACTIVE, _RUNNING)
+         Migration thread calls each .save_live_pending() handler
+  If total pending_bytes >= threshold_size, call each .save_live_iterate() handler
+          Data of this iteration for pre-copy phase is copied
         Iterate till total pending bytes converge and are less than threshold
                                   |
   On migration completion, vCPU stops and calls .save_live_complete_precopy for
-   each active device. The VFIO device is then transitioned into _SAVING state
-                   (FINISH_MIGRATE, _DEVICE, _SAVING)
+  each active device. The VFIO device is then transitioned into _STOP_COPY state
+                  (FINISH_MIGRATE, _DEVICE, _STOP_COPY)
                                   |
      For the VFIO device, iterate in .save_live_complete_precopy until
                          pending data is 0
-                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
+                   (FINISH_MIGRATE, _DEVICE, _STOP)
                                   |
-                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
+                 (FINISH_MIGRATE, _COMPLETED, _STOP)
              Migraton thread schedules cleanup bottom half and exits
 
 Live migration resume path
@@ -136,7 +125,7 @@ Live migration resume path
 ::
 
               Incoming migration calls .load_setup for each device
-                       (RESTORE_VM, _ACTIVE, _STOPPED)
+                       (RESTORE_VM, _ACTIVE, _STOP)
                                  |
        For each device, .load_state is called for that device section data
                        (RESTORE_VM, _ACTIVE, _RESUMING)
-- 
2.21.3


