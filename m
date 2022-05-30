Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C155386EF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:56:25 +0200 (CEST)
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjcu-00070r-GD
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisN-0004b3-JG
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:19 -0400
Received: from mail-dm6nam10on20604.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::604]:32352
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisK-0008N6-6o
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6jR/dtyQEL2NHiIdyMgk9IFWtEbAh/YsYngZuS8epNKYbYkfUuxElt7nhciRabcJCTOknLsae8RHidQhhfetntEpQmI1Yy/hnel+PMtLLLrqk0to+5SI8KmRn266pAJI3QUvQU/qpajVmZj0CgW/J3yB/mfXBEJYZbWIJAUyT27n4BnsXX2owPA/ZXAGwFZvrnS1ux6yUTPPXLIGUXX/XkkThi/obiYNguumIA2AccHLI6kyP1BUKcZaZoZ+0WPkdocO94hBhwrp70y/ky7VpD0nU12lCSEoeYOWh3qppK5VsOssAtZ7/k+0DtsH1VAwjcqp73p1d4GOrlaAqrHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJuF1217+IQ4i7VgbZUxRxtNbyHUTT+Gl6kqze0jgY8=;
 b=UYy2z+mLZRADTk/yQh7H2yNOQNRAR9LUbTGvx0jvo0JrOVLkJ3ubAXmo72v5+0CrzF3SEqGPsPYfl8UBIaeV0fHyUmK0HDQTu8LyCN3oDf8fbmokbCG7zYLUolgWYW/ipvgYsLV5Fekr82AM7ftu4E2Dxgv7LI0TRCvOjOjEZ7XZ8HJXV8u0+JWWwkifnwICdLkQl5+iBNHH8MzKjw++FX8LbHm9NaTUBsuWrghN8GPw0rGpS7/CsiRnuiJiTz0HVYmCeyFiZXz988LhGr41WN5a590vWbRc3yVxjFXIbQqVLf8YYiZSf1OKsBUBoTVmykZeQA7PCCDlN6gnMezKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJuF1217+IQ4i7VgbZUxRxtNbyHUTT+Gl6kqze0jgY8=;
 b=FpS1cZcHpYGkyRRJlpG9ww3yU9whsW73IJtyvZrErmkxVn9TWxX9kMGaQ48rCU7X3VU4sSyQQhdFrZ3O6fEWRdISMpe6aCwXdAADKBjemhrsM/gbt6SBf7yaUqsz9yY71cow3KCxXKTBRZAp6IopaFoDI2CFFAAmBt7v+FAIibHBf+MqODl6/lXBS0rLwRzS1kmDSZOeT9Ho7GdKAC1RSVdLwQI2eg1h35OZU4Li30i/qCmqOqLJZ+P3WW69M0eJXWbdLY32EcU6Cp9qIwRqSao77kflgBC4WqNnlPNoAkvsdEQZLaIOoVwF6bOmX1pIn610JTjrCHYIzgZb/Cy7zw==
Received: from CO1PR15CA0101.namprd15.prod.outlook.com (2603:10b6:101:21::21)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:08:12 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::bc) by CO1PR15CA0101.outlook.office365.com
 (2603:10b6:101:21::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19 via Frontend
 Transport; Mon, 30 May 2022 17:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:08:12 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:08:11 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:08:11 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:08:08 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 08/11] vfio/migration: Remove VFIO migration protocol v1
Date: Mon, 30 May 2022 20:07:36 +0300
Message-ID: <20220530170739.19072-9-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae243338-c926-4820-ebd3-08da425efa97
X-MS-TrafficTypeDiagnostic: DM6PR12MB4337:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB43373875454268C682395CAFDEDD9@DM6PR12MB4337.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOB423/lKCJqqNH6HeB+NBrJZAraqJ86FbpSxbERmPOh8JXFgDwhaxw4qRp0PiFCJlubHZlA+0iOq8zIIt8nNC6atVFEf4yscgxMTig6DSamYjGuk0CGjfqjhr0dNgrqjEvG0Sz78MTis3jCSEEvu+Mj4j4bvSCguPKvqWXHIKYvRivwxT0ZxM0im1KyeJSW3BEi5AZUHXlrhG9GzalaruujzFyp1FXegB6xf4K/LJXrZjWQZD0xWSgJMlOdVK+9iqazq6q0vFhj/l0AdYC+Co2p3OQj5B5JWfgHztd6fAC7yE7ICSFqnpAsfZjNa40I/fEp1xJbzrWwMqq2YfWGnNh/x0JOaKUrdbB/NP5lZsmsP8fI5feKPgDSeOT2KtfJZY02uGiiQmq9ubj41s/9hTC4xAETfgDgeWfskrq5d995y4JUek99xMkmzF1OaRvBHaq5bPGk290QLpptpnS5+1dPra1JUeX4DE1SyLI7nGsmBrgHJKLEL5+A79Y/fx89x65YeMvPi4xTph5rRGIZWu+NG6yr4yEJgpHZllsKIhDmFr24I+woxRkUB3qG/mwiB1MQqhwep37r5DydOC5bkK5zvhuX09ECjW1WQ3yAkJHF2KCk/nGuClcMNFmuK+ypXvaLVoCkipu4YUgTV+uT3glqf6DKsAVgiuNBL02hrlP7aKgNcWZ7yrj2UfEyLQhWLzBgSiz1XyIvUcYBEfl5ww==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(1076003)(356005)(47076005)(81166007)(7696005)(26005)(316002)(6666004)(70206006)(70586007)(54906003)(8676002)(30864003)(5660300002)(8936002)(40460700003)(82310400005)(336012)(186003)(426003)(36756003)(110136005)(508600001)(36860700001)(86362001)(107886003)(2616005)(2906002)(83380400001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:08:12.3559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae243338-c926-4820-ebd3-08da425efa97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
Received-SPF: softfail client-ip=2a01:111:f400:7e88::604;
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

Now that v2 protocol implementation has been added, remove the
deprecated v1 implementation.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c              |  19 +-
 hw/vfio/migration.c           | 698 +---------------------------------
 hw/vfio/trace-events          |   5 -
 include/hw/vfio/vfio-common.h |   5 -
 4 files changed, 24 insertions(+), 703 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5541133ec9..00c6cb0ffe 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -355,14 +355,7 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if (!migration->v2 &&
-                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
-                (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
-                return false;
-            }
-
-            if (migration->v2 &&
-                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
                 (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
                  migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
                 return false;
@@ -393,14 +386,8 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (!migration->v2 &&
-                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
-                continue;
-            }
-
-            if (migration->v2 &&
-                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
-                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
+            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index de68eadb09..852759e6ca 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -121,220 +121,6 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
     return 0;
 }
 
-static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
-                                  off_t off, bool iswrite)
-{
-    int ret;
-
-    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
-                    pread(vbasedev->fd, val, count, off);
-    if (ret < count) {
-        error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
-                     HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
-                     vbasedev->name, off, strerror(errno));
-        return (ret < 0) ? ret : -EINVAL;
-    }
-    return 0;
-}
-
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
-static int vfio_migration_v1_set_state(VFIODevice *vbasedev, uint32_t mask,
-                                       uint32_t value)
-{
-    VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    off_t dev_state_off = region->fd_offset +
-                          VFIO_MIG_STRUCT_OFFSET(device_state);
-    uint32_t device_state;
-    int ret;
-
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
-        }
-        return ret;
-    }
-
-    migration->device_state_v1 = device_state;
-    trace_vfio_migration_set_state(vbasedev->name, device_state);
-    return 0;
-}
-
-static void *get_data_section_size(VFIORegion *region, uint64_t data_offset,
-                                   uint64_t data_size, uint64_t *size)
-{
-    void *ptr = NULL;
-    uint64_t limit = 0;
-    int i;
-
-    if (!region->mmaps) {
-        if (size) {
-            *size = MIN(data_size, region->size - data_offset);
-        }
-        return ptr;
-    }
-
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
-            /*
-             * data_offset is not within sparse mmap areas, find size of
-             * non-mapped area. Check through all list since region->mmaps list
-             * is not sorted.
-             */
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
-
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
-        }
-
-        qemu_put_buffer(f, buf, sec_size);
-
-        if (buf_allocated) {
-            g_free(buf);
-        }
-        sz -= sec_size;
-        data_offset += sec_size;
-    }
-
-    ret = qemu_file_get_error(f);
-
-    if (!ret && size) {
-        *size = data_size;
-    }
-
-    bytes_transferred += data_size;
-    return ret;
-}
-
 static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
                             uint64_t data_size)
 {
@@ -351,96 +137,6 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
     return 0;
 }
 
-static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
-                               uint64_t data_size)
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
-        trace_vfio_v1_load_state_device_data(vbasedev->name, data_offset, size);
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
-{
-    VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    uint64_t pending_bytes = 0;
-    int ret;
-
-    ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
-                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
-    if (ret < 0) {
-        migration->pending_bytes = 0;
-        return ret;
-    }
-
-    migration->pending_bytes = pending_bytes;
-    trace_vfio_update_pending(vbasedev->name, pending_bytes);
-    return 0;
-}
-
 static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -493,15 +189,6 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
     migration->data_fd = -1;
 }
 
-static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
-{
-    VFIOMigration *migration = vbasedev->migration;
-
-    if (migration->region.mmaps) {
-        vfio_region_unmap(&migration->region);
-    }
-}
-
 /* ---------------------------------------------------------------------- */
 
 static int vfio_save_setup(QEMUFile *f, void *opaque)
@@ -516,49 +203,6 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    int ret;
-
-    trace_vfio_save_setup(vbasedev->name);
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
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
-    ret = vfio_migration_v1_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                      VFIO_DEVICE_STATE_V1_SAVING);
-    if (ret) {
-        error_report("%s: Failed to set state SAVING", vbasedev->name);
-        return ret;
-    }
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-
-    ret = qemu_file_get_error(f);
-    if (ret) {
-        return ret;
-    }
-
-    return 0;
-}
-
 static void vfio_save_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -567,82 +211,6 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_v1_save_cleanup(void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-
-    vfio_migration_v1_cleanup(vbasedev);
-    trace_vfio_save_cleanup(vbasedev->name);
-}
-
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
-{
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
-
-        if (migration->pending_bytes == 0) {
-            qemu_put_be64(f, 0);
-            qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-            /* indicates data finished, goto complete phase */
-            return 1;
-        }
-    }
-
-    ret = vfio_save_buffer(f, vbasedev, &data_size);
-    if (ret) {
-        error_report("%s: vfio_save_buffer failed %s", vbasedev->name,
-                     strerror(errno));
-        return ret;
-    }
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-
-    ret = qemu_file_get_error(f);
-    if (ret) {
-        return ret;
-    }
-
-    /*
-     * Reset pending_bytes as .save_live_pending is not called during savevm or
-     * snapshot case, in such case vfio_update_pending() at the start of this
-     * function updates pending_bytes.
-     */
-    migration->pending_bytes = 0;
-    trace_vfio_save_iterate(vbasedev->name, data_size);
-    return 0;
-}
-
 /* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
 static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
 {
@@ -706,62 +274,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    uint64_t data_size;
-    int ret;
-
-    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
-                                      VFIO_DEVICE_STATE_V1_SAVING);
-    if (ret) {
-        error_report("%s: Failed to set state STOP and SAVING",
-                     vbasedev->name);
-        return ret;
-    }
-
-    ret = vfio_update_pending(vbasedev);
-    if (ret) {
-        return ret;
-    }
-
-    while (migration->pending_bytes > 0) {
-        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
-        ret = vfio_save_buffer(f, vbasedev, &data_size);
-        if (ret < 0) {
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
-            return ret;
-        }
-    }
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-
-    ret = qemu_file_get_error(f);
-    if (ret) {
-        return ret;
-    }
-
-    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
-                                      0);
-    if (ret) {
-        error_report("%s: Failed to set state STOPPED", vbasedev->name);
-        return ret;
-    }
-
-    trace_vfio_save_complete_precopy(vbasedev->name);
-    return ret;
-}
-
 static void vfio_save_state(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -783,33 +295,6 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
                                    vbasedev->migration->device_state);
 }
 
-static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    int ret = 0;
-
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
-    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
-                                      VFIO_DEVICE_STATE_V1_RESUMING);
-    if (ret) {
-        error_report("%s: Failed to set state RESUMING", vbasedev->name);
-        if (migration->region.mmaps) {
-            vfio_region_unmap(&migration->region);
-        }
-    }
-    return ret;
-}
-
 static int vfio_load_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -819,15 +304,6 @@ static int vfio_load_cleanup(void *opaque)
     return 0;
 }
 
-static int vfio_v1_load_cleanup(void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-
-    vfio_migration_v1_cleanup(vbasedev);
-    trace_vfio_load_cleanup(vbasedev->name);
-    return 0;
-}
-
 static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
 {
     VFIODevice *vbasedev = opaque;
@@ -861,11 +337,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             uint64_t data_size = qemu_get_be64(f);
 
             if (data_size) {
-                if (vbasedev->migration->v2) {
-                    ret = vfio_load_buffer(f, vbasedev, data_size);
-                } else {
-                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
-                }
+                ret = vfio_load_buffer(f, vbasedev, data_size);
                 if (ret < 0) {
                     return ret;
                 }
@@ -896,18 +368,6 @@ static SaveVMHandlers savevm_vfio_handlers = {
     .load_state = vfio_load_state,
 };
 
-static SaveVMHandlers savevm_vfio_v1_handlers = {
-    .save_setup = vfio_v1_save_setup,
-    .save_cleanup = vfio_v1_save_cleanup,
-    .save_live_pending = vfio_save_pending,
-    .save_live_iterate = vfio_save_iterate,
-    .save_live_complete_precopy = vfio_v1_save_complete_precopy,
-    .save_state = vfio_save_state,
-    .load_setup = vfio_v1_load_setup,
-    .load_cleanup = vfio_v1_load_cleanup,
-    .load_state = vfio_load_state,
-};
-
 /* ---------------------------------------------------------------------- */
 
 static void vfio_vmstate_change(void *opaque, bool running, RunState state)
@@ -938,70 +398,12 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
                               new_state);
 }
 
-static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    uint32_t value, mask;
-    int ret;
-
-    if (vbasedev->migration->vm_running == running) {
-        return;
-    }
-
-    if (running) {
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
-    } else {
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
-    }
-
-    ret = vfio_migration_v1_set_state(vbasedev, mask, value);
-    if (ret) {
-        /*
-         * Migration should be aborted in this case, but vm_state_notify()
-         * currently does not support reporting failures.
-         */
-        error_report("%s: Failed to set device state 0x%x", vbasedev->name,
-                     (migration->device_state_v1 & mask) | value);
-        if (migrate_get_current()->to_dst_file) {
-            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
-        }
-    }
-    vbasedev->migration->vm_running = running;
-    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
-            (migration->device_state_v1 & mask) | value);
-}
-
 static void vfio_migration_state_notifier(Notifier *notifier, void *data)
 {
     MigrationState *s = data;
     VFIOMigration *migration = container_of(notifier, VFIOMigration,
                                             migration_state);
     VFIODevice *vbasedev = migration->vbasedev;
-    int ret;
 
     trace_vfio_migration_state_notifier(vbasedev->name,
                                         MigrationStatus_str(s->state));
@@ -1011,31 +413,14 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        if (migration->v2) {
-            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
-                                     VFIO_DEVICE_STATE_ERROR);
-        } else {
-            ret = vfio_migration_v1_set_state(vbasedev,
-                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                                VFIO_DEVICE_STATE_V1_RESUMING),
-                                              VFIO_DEVICE_STATE_V1_RUNNING);
-            if (ret) {
-                error_report("%s: Failed to set state RUNNING", vbasedev->name);
-            }
-        }
+        vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
+                                 VFIO_DEVICE_STATE_ERROR);
     }
 }
 
 static void vfio_migration_exit(VFIODevice *vbasedev)
 {
-    VFIOMigration *migration = vbasedev->migration;
-
-    if (migration->v2) {
-        g_free(migration->data_buffer);
-    } else {
-        vfio_region_exit(&migration->region);
-        vfio_region_finalize(&migration->region);
-    }
+    g_free(vbasedev->migration->data_buffer);
     g_free(vbasedev->migration);
     vbasedev->migration = NULL;
 }
@@ -1066,7 +451,6 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     VFIOMigration *migration;
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
-    struct vfio_region_info *info = NULL;
     uint64_t mig_flags;
 
     if (!vbasedev->ops->vfio_get_object) {
@@ -1079,48 +463,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
 
     ret = vfio_migration_query_flags(vbasedev, &mig_flags);
-    if (!ret) {
-        /* Migration v2 */
-        /* Basic migration functionality must be supported */
-        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
-            return -EOPNOTSUPP;
-        }
-        vbasedev->migration = g_new0(VFIOMigration, 1);
-        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
-        vbasedev->migration->data_buffer =
-            g_malloc0(vbasedev->migration->data_buffer_size);
-        vbasedev->migration->data_fd = -1;
-        vbasedev->migration->v2 = true;
-    } else {
-        /* Migration v1 */
-        ret = vfio_get_dev_region_info(vbasedev,
-                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
-                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
-                                       &info);
-        if (ret) {
-            return ret;
-        }
-
-        vbasedev->migration = g_new0(VFIOMigration, 1);
-
-        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
-                                info->index, "migration");
-        if (ret) {
-            error_report("%s: Failed to setup VFIO migration region %d: %s",
-                         vbasedev->name, info->index, strerror(-ret));
-            goto err;
-        }
-
-        if (!vbasedev->migration->region.size) {
-            error_report("%s: Invalid zero-sized VFIO migration region %d",
-                         vbasedev->name, info->index);
-            ret = -EINVAL;
-            goto err;
-        }
+    if (ret) {
+        return ret;
+    }
 
-        g_free(info);
+    /* Basic migration functionality must be supported */
+    if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
+        return -EOPNOTSUPP;
     }
 
+    vbasedev->migration = g_new0(VFIOMigration, 1);
+    vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
+    vbasedev->migration->data_buffer =
+        g_malloc0(vbasedev->migration->data_buffer_size);
+    vbasedev->migration->data_fd = -1;
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
 
@@ -1132,28 +488,16 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
     strpadcpy(id, sizeof(id), path, '\0');
 
-    if (migration->v2) {
-        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
-                             &savevm_vfio_handlers, vbasedev);
-
-        migration->vm_state = qdev_add_vm_change_state_handler(
-            vbasedev->dev, vfio_vmstate_change, vbasedev);
-    } else {
-        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
-                             &savevm_vfio_v1_handlers, vbasedev);
-
-        migration->vm_state = qdev_add_vm_change_state_handler(
-            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
-    }
+    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
+                         vbasedev);
 
+    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
+                                                           vfio_vmstate_change,
+                                                           vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
-    return 0;
 
-err:
-    g_free(info);
-    vfio_migration_exit(vbasedev);
-    return ret;
+    return 0;
 }
 
 /* ---------------------------------------------------------------------- */
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 6e8c5958b9..a24ea7d8b0 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -154,15 +154,10 @@ vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t
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
-vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
 vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2ec3346fea..76d470178f 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -61,16 +61,11 @@ typedef struct VFIORegion {
 typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
-    VFIORegion region;
-    uint32_t device_state_v1;
-    int vm_running;
     Notifier migration_state;
-    uint64_t pending_bytes;
     enum vfio_device_mig_state device_state;
     int data_fd;
     void *data_buffer;
     size_t data_buffer_size;
-    bool v2;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
-- 
2.21.3


