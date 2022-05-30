Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E5538708
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:07:51 +0200 (CEST)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjny-0000TZ-QD
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisX-0005BA-4j
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:29 -0400
Received: from mail-co1nam11on20630.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::630]:31904
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisU-0008PY-UA
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZYnjr76hgpYD6IFlWEtsdYjv2uDA25QwAxZ7U/fM0iixgAa2CykHFJVMX8n6/EFCEUK/oWUqzAuuLlGGIIIZzxVaw2sr65EAXj5qslpTxp4HPg+LhfQABNpcion9szslSVo5Bs3Lap44H/PCmz4nkyLqpzcCbYeOjI7R/IAnrNFQ8i0YOQTAfH4GaeiFUdjsyB5TnSQINtnkg8ZUKWU2rwUV6SnxBuuJozK4b33nF+o5fhAyqJyGa1y6RNDRLlRfMrz97PtnKTthMtqwAvaM3By12Y8W0yUVa7BV9M5SnYBhVxPnhfzxmlTCixTDu/A+FvbK4Smxn9aHd5oJ4VGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSPaPjjDN9b8FTrPUpEHjY11iJitw0hUj9yIciMkLkE=;
 b=Uh73WDhN6QdIsjAL3kuyDcxiB4YKD/jyRFcyigsMcdTlO7RTbBKGnFV4bqpRKiGaox6JLTuJ6ci7RQJzUhzoiNOd/cV8kt+/f8mU3SU+a+7mFQDy44T6yd6BtOFs7QGDGw9oGIs+yCzI1kqtYDbU2SB3fHT01uK26ksS330sgU4XOxnJ427PnmAgufHV39JY0b0KeV6Y7R9HxRJzBPimjZcdkj2LHTq7xwhKQuaZ6TE6SrD/frSmFP+bLJSOXSdDGkHXV46jDoNbaoO9JUQGTCzIQfmR9dYp+o95PzGnp3JpfksAWXEUUUbX7K+FpS3r2AdxP70wbJH1teLwvxhFoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSPaPjjDN9b8FTrPUpEHjY11iJitw0hUj9yIciMkLkE=;
 b=OncJ0ubDiPz1OwAQZ3YsQgk6xWIM+gPZDcnAV7FODnCmhALKdN1kc2ylb8v2rYMGt65Nlc4iCzDY4WfDHWJtaL4gCY9A+O3Dczt8hImAJJxcbs62zugDT8oEm0SqTCqxVTyUiHh3Vq5uAlMsoNexu5VkKtz7aEfDYLbe4oAemkCjS35n7aRFKkR422RRz78ao9KX+ObWdsWKUfPq9HaxSYjJmmHnrQGontYBE6Sr5cqrPCImnf+9yKHBmpppQ7oRhYvOK6gFrSqJ21OZUk8QdVt7oBJHAG82QbNhHURBluSG28MXVXn5e3QDefylWRQmrSbSy1s5EttnOklr/NTFPA==
Received: from CO1PR15CA0084.namprd15.prod.outlook.com (2603:10b6:101:20::28)
 by BN6PR1201MB0004.namprd12.prod.outlook.com (2603:10b6:404:ac::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:08:23 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::67) by CO1PR15CA0084.outlook.office365.com
 (2603:10b6:101:20::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19 via Frontend
 Transport; Mon, 30 May 2022 17:08:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:08:22 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:08:22 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:08:21 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:08:18 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 11/11] docs/devel: Align vfio-migration docs to VFIO
 migration v2
Date: Mon, 30 May 2022 20:07:39 +0300
Message-ID: <20220530170739.19072-12-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 430a0034-c8de-4553-6081-08da425f00e5
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0004:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0004E3AAE36F732AFC78CBD9DEDD9@BN6PR1201MB0004.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eiNSNyNT7JTsj5T07pRLZSk1W5QZXPBMKb0D9MbZkWiI22cV/dU1NeC8i003lROnF+5PGmhunOSmmfAHjE+N9gERj2AlqEdnQJugp14OogYTZUUwakEeQIOa0Q0Vsd6Z3uMnY2SFSKf/7JDKjmPSFiKNhxABKhzXoPLdDSMrOQOYIViJdgeHh8mSDxlyd9zuqkhWSt4IZgNTZL6OC71s50+gISAgg9ywt21aUxlMFuxPnsBjgfahvJtYR8YekNLmV2NNzCpEBpeqD231rmH6rKk+Kgji0wqLePjeFfeOkpwQPbMewTGfSG7ODAjkIuRfHb2/34FI8m9bFMz688Bg2xqbiTJPxFTh/0yl3YMqoLmN9Jd6FT5A55L4qTlNzlAvN7rxx0xX3b9EHJ2wYFPS44KCSY/NN1nDIXCM/p/U6aND1ilRwChtt3uc+PoGfofQdu3uy3yMyNw2kfAohnNSJ0EOPdeK37IvFF9iEjSlyBngrBUku7ZrPkk81aY4Q2ErXVfhv/LEnlzlGYLJ/bkrl+LfnA8akZMlr9CYDYNWG7VaFd4wireZ2dc72D1aHq7LHC7kbNk1k2lyJ6qfZR9pCq1j+xQmfkLAkxKPhNcbo0AyUhDhLuabN3aqxHmaZqGux9Ul3nU1HFZu64ALf/6nRc8eebtvuJHJdJyEX/GTpzE0Qd8ZLD5lCw3fdF6KmMTm2Cw02XjJt8SPFDGIttMhkg==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(86362001)(40460700003)(6666004)(508600001)(8676002)(356005)(7696005)(316002)(5660300002)(4326008)(110136005)(54906003)(36756003)(83380400001)(36860700001)(336012)(426003)(186003)(8936002)(2906002)(1076003)(2616005)(82310400005)(70586007)(70206006)(107886003)(81166007)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:08:22.9455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 430a0034-c8de-4553-6081-08da425f00e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0004
Received-SPF: softfail client-ip=2a01:111:f400:7eab::630;
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


