Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5A538729
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:17:38 +0200 (CEST)
Received: from localhost ([::1]:38440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjxQ-0005k0-L3
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisB-0003tI-V7
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:07 -0400
Received: from mail-co1nam11on2060e.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::60e]:5216
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisA-0008MJ-9u
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5C3ICtLYHIUykVC7v40z6avDB5IaThnwxJrIczOcmqOA3a/Xau3XBit+zXreoW92iJH1MktQeM7kZTs6NU7zHLi1b82gERzaIl6F2Y1j9+Fa+DRHUKHUkz3EX+en1V4LfvtSvbTgK51wktNVrQBOFGMG6jpo+t72AzfzWuaVGYZ0nbPuNRty6KFagt2s4KDIBLTgaJ6WRjADv5DCYlgH3YR9MdcQ9kXmUSxr4A4DkSrfU2Z+a+y3FXkioV2jYIOvIMvAnQMv1wAiLfiDLetVwXkpdlCaI3iqdi6LzCJS427wY4ko0sPRDsHNUPZjN0gFZPh7e9qU/Ssj8UD/jymig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjlscHecdcMpLoybC6kEB/IIni+Nsq0JItrk38p+xG8=;
 b=YV9kUbdr1QQ/R0y+wJIeo9qD+IeAgzhIkJdOjAhYk0oe4kAwwUISExvQu11Oor5wNP0J2gOTytmJFhUelGKhyhy9dU+Dtp+TULw+Xk6PegTOuGeUCfc1gP8yXOKvP+nz9a+jz0hvzKuY+cbOAVPhMUNVw+U80SyD27o+Xp2M8rWyI42F1C9m4BMsdZsyD4mMhGrymvS7/52Vx4Bq2vPDCbVu+Ur1M/5UE1pWOg9rCXLoq7+xowW1yzJF0eLqWTwYZLrhyBwDARwGVJWsW0QGOvYcnVIbzr8eHqMYBvAJvBENOevbtaXA2s660eA1LjztAPOW4FbgZIfABa/VtIKiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjlscHecdcMpLoybC6kEB/IIni+Nsq0JItrk38p+xG8=;
 b=p1KA81HzPakd1eUDtv9MYv3Hj0l964Xb2DX3SpQG7GP1akssFn0GA8Yc5STF31sFz7OMhJhPBlOcTQyP5IKjFxG/6M1MQ9XOh5zmiRpCpqDOfRyL1vJxixhQrSqzv9YmMO5nWdXuzhu/yDPjRKOC5JduELptamIgWS77av+yNIUMCjKe4ojbWqU2xGQlCB6aWYk88UWkvIpBMwqKElGlRhKa3g/YBcEldf1xScgYJ/oCh//qZkey+ZcN2rAwFj/uMZ3P4aFCCYpbuftrEFYtoFVW/HgBhtDEGx6u4MFgHsamTeW24ooUzPkrHnn/1MHkSG1Nzv1AP26FuKPh425CRQ==
Received: from MW4PR04CA0314.namprd04.prod.outlook.com (2603:10b6:303:82::19)
 by BYAPR12MB4775.namprd12.prod.outlook.com (2603:10b6:a03:107::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:08:02 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::d6) by MW4PR04CA0314.outlook.office365.com
 (2603:10b6:303:82::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:08:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:08:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:08:01 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:08:01 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:07:58 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 05/11] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
Date: Mon, 30 May 2022 20:07:33 +0300
Message-ID: <20220530170739.19072-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfb53061-0f4a-4b08-67c8-08da425ef462
X-MS-TrafficTypeDiagnostic: BYAPR12MB4775:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB47759B7130539992F4D10ED7DEDD9@BYAPR12MB4775.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FskSo0/GV3UtBtFwRCcnBZLb7VsUrtSFfSjUy0TwzS9kARXRqAtWnsu+AAx52pOt/2KSXgqweJkGKp9iRCrgMKm4tN3xzfS2fLRpv+WpvfIEM/IQYeajNuOszHqYZAC3sQmkyX5cKQjLTe7YfxyTEqxosnHVANFB2lRXcWiJrKzBpzW3Ud5fvse20rTYQt7S239vEPSGGeyo+AqT3eiHRxw7XJokOSkns9WXp4Xi/laDYdNzgc8qlj2G7DFCT3BebbPWQLY1EIyDDep/nTONavIDLOpRIN53qM01zm+ct1yEAfRPzi6he0GVH+WWtxF/iMfbTc2md9xZBWPTP+BONClS4zJLt59IggPC+xy2HwAdpV9HorXkCdoLESxF64Yi9+di3n/xoHPqwUqI2BLgwZde85SK93eAUhk6JlbdU/uwoPVJidWtEoz8dzq2GCupiDrvtCAtWX44H+oYkPpXB9SJp7E/7C8FbI9zO+p0VMBNinA4/L0myyQPacdhbF0LHrS/taWPVf+MWtvau02X7qh8fUufOvl2D9OUXbnMkPcRpEOuAJ038oE8aiB+Tv3qIXfRR9BVzrPrCY5AOsVIoiHBW8jXanQDS01B5nVWI772k8mEJNXFQURw5Wmg05eHbynX8dSwvtfRbjNtknpdpKlToBFjfc7WIpDMeaBc86fdTzlrYdmwnW3q0eX7YOu9HGryxr+9eFfdZcvV2fOH0A==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(26005)(2906002)(110136005)(54906003)(356005)(8676002)(316002)(36860700001)(7696005)(508600001)(47076005)(86362001)(6666004)(81166007)(336012)(186003)(40460700003)(82310400005)(8936002)(36756003)(426003)(83380400001)(107886003)(70206006)(70586007)(4326008)(1076003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:08:01.9545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb53061-0f4a-4b08-67c8-08da425ef462
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4775
Received-SPF: softfail client-ip=2a01:111:f400:7eab::60e;
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

Move vfio_dev_get_region_info() logic from vfio_migration_probe() to
vfio_migration_init(). This logic is specific to v1 protocol and moving
it will make it easier to add the v2 protocol implementation later.
No functional changes intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c  | 30 +++++++++++++++---------------
 hw/vfio/trace-events |  2 +-
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index d8f9b086c2..8a0deed0e4 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -789,14 +789,14 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
     vbasedev->migration = NULL;
 }
 
-static int vfio_migration_init(VFIODevice *vbasedev,
-                               struct vfio_region_info *info)
+static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
     Object *obj;
     VFIOMigration *migration;
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
+    struct vfio_region_info *info = NULL;
 
     if (!vbasedev->ops->vfio_get_object) {
         return -EINVAL;
@@ -807,6 +807,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         return -EINVAL;
     }
 
+    ret = vfio_get_dev_region_info(vbasedev,
+                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                   &info);
+    if (ret) {
+        return ret;
+    }
+
     vbasedev->migration = g_new0(VFIOMigration, 1);
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
@@ -824,6 +832,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         goto err;
     }
 
+    g_free(info);
+
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
 
@@ -846,6 +856,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     return 0;
 
 err:
+    g_free(info);
     vfio_migration_exit(vbasedev);
     return ret;
 }
@@ -860,7 +871,6 @@ int64_t vfio_mig_bytes_transferred(void)
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
     VFIOContainer *container = vbasedev->group->container;
-    struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
     if (!vbasedev->enable_migration) {
@@ -874,27 +884,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
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
-
-    trace_vfio_migration_probe(vbasedev->name, info->index);
-    g_free(info);
+    trace_vfio_migration_probe(vbasedev->name);
     return 0;
 
 add_blocker:
     error_setg(&vbasedev->migration_blocker,
                "VFIO device doesn't support migration");
-    g_free(info);
 
     ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
     if (ret < 0) {
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 582882db91..438402b619 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -148,7 +148,7 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
 
 # migration.c
-vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
-- 
2.21.3


