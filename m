Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A009D5251B1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:57:22 +0200 (CEST)
Received: from localhost ([::1]:42936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBBp-0001Ln-Fo
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyw-0006UE-T2
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:44:03 -0400
Received: from mail-bn1nam07on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::60d]:11353
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyq-0005La-9U
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY9Hd0LmjFKmgTxW58MFEy5gQDIU5M+Gx2S/vzlOKNLLANJtvYS1/A7JmCWP0SzUrp8fRbIdnq13YS+wlJ37HzTEa1UO0cOb2tYLsxhTaK8f1LqVvCO97C6FqtLtDILYXXfV4Hm9AOeqdEBOA0uccK4DKo+2gm9n+eUqmDSOfPza5djw5PLOyaTFk7ckUPAVvADD6GaUwME66guZ7MenQIOkyGfghJIIL+y9LRiEsM48lTJsi1Poq1hdrQp7GRWIgRBgUD/jpIDJ3PKvhwhXp6XOqOIz/bsx1J9VYsh+GXDb+VwlzVRTDf0jzCodTSAEydm3NDOBHIk2m3SRYjMOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cyw/PPr2SoPoAMYV02CPQlf9qOuzmF91duF0c1oGOAc=;
 b=g9Ojm6eNidYoQOEHD1xRmhfQNfGEXN9ohwXoDzVxtUgXr5tiwXdld32fuwSzQ8tNqRCkrXy7wCvHKhEs0Uj0y1i+2SQ2UHAWdZ+kpl5/efIUvAsSZj44M+7Y1LC3vgMJKTtUE1xqS6ZBO7AlBFwZ5nTM5piU5KvPlAdWzIPra4M5WhSCnUsDQAr7Fymsw6/U3iNcfeHmDBAmBwTL15ZjTHOhgUZIo0HMCwLwHK4bKzZxNFzDe/C6yM3t3e2sP1iw9WcREmipFBmXhExDhrOivE6olNxdd/eIcQXs5p7Calm8xHhRnd635Gg6sLyzLJHttQv2ubFqyUBhULGcatiujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cyw/PPr2SoPoAMYV02CPQlf9qOuzmF91duF0c1oGOAc=;
 b=f5PaNd+QFd0hpCNksjNmECBD7KUCFvtlYo0C7/Nx4H0s6AXNP3xMdgMx2HYssyIswFvsOzUk8BhUVLEKG/NpooD6RvyOctyWfWvwZgp6z3JYnEZ5+cy7060yQlG7uJ8cD2CohLanL5HmnO8TGupf1EGl7yqf/55M2fMG08/51YkuN7aBbnKxKxTpN6W+zJP+aiALbp6aatzFFdqRxXOtL29/sxUhYMLtg2aFbpxfcNwk88eiHHQVKtVTVZ8eGwzp/QkyjSvN05ARutfR7BiVrTXWi33efUAxpU2GD+osoNEmdrtfWEVCDTywOsj63s57jmF/lXcYsWwSg6JCDshrZA==
Received: from MW4PR04CA0265.namprd04.prod.outlook.com (2603:10b6:303:88::30)
 by PH7PR12MB5736.namprd12.prod.outlook.com (2603:10b6:510:1e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 15:43:53 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::77) by MW4PR04CA0265.outlook.office365.com
 (2603:10b6:303:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Thu, 12 May 2022 15:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:43:53 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:43:53 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:43:52 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:49 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 7/9] vfio/migration: Reset device if setting recover state
 fails
Date: Thu, 12 May 2022 18:43:18 +0300
Message-ID: <20220512154320.19697-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65832d28-31a7-46dd-3d58-08da342e37e5
X-MS-TrafficTypeDiagnostic: PH7PR12MB5736:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5736A9A1C4497A55AEF8C39DDECB9@PH7PR12MB5736.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Hf2jz8/9qDjgDBBPj3QDM/Wj33VrW4v0cx8jDF+h0v8pq4pfj1K1V5DSyKWl838V32/dLgDe6bQfyc7Ck26qmvxgZ4q0R4SVEbIL/O+sA3vaplN+7f3QR2sdK8vqYc9kuOQkqpMtWKfFsZ8ZnnSusWhdbH7e8OtRhsulUHkuVDEtJ5ozg+iagBI63C5NwZQogdJtAU1hl6UWZeJ5k/UTVmnATQn+X9nMGP5SlMZj6cX0iCKdZJrCfaysY2XFceIyBk+DTDdWfvXreic28KhyRu3Zzs+D1UJmEmOzsJvJZEjtrgyrqFTo5MKVzMkEz7LhVpiyh2hqE+sMy92v+NmzvHi/19T8eQWwEzKyErsmboT6q0jYKSddFucxBlTifjJ7N/3ILJUpu3JsOb/7wVn2X2X/JBoW460kboel/8mW+JAmR6UAS/ZNzB0Xg6bxZJisVZyFI2/iJFCuQNZaolNVtT7CiCxSZthEvvznVWpIkSA5R3y3YlOkg82umrg+nc+OVCypfO7KEOPmu6if94zClgkgSvQ3e57q9Q3Y4VIqcb0ZWYuk0ZyiGSUPUGj3VzndCNbPSzLv1lujk9Bb8CNA4VFH0wFiUOyQMFknkiT80+X7B36v2kG5OxUDlDhqoLkWVNwcsCMrD6o8N6hJoZ7X3fgyvgrM7UNMvit2dyfJvkiGZ0rkh5QY4fcyNZXV3BUD46T2kuW4EdP5x6MFscuyw==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(40460700003)(6666004)(7696005)(2616005)(356005)(36860700001)(81166007)(2906002)(26005)(186003)(8936002)(8676002)(82310400005)(4326008)(70206006)(86362001)(70586007)(1076003)(336012)(47076005)(110136005)(107886003)(54906003)(36756003)(426003)(83380400001)(5660300002)(508600001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:43:53.6163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65832d28-31a7-46dd-3d58-08da342e37e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5736
Received-SPF: softfail client-ip=2a01:111:f400:7eb2::60d;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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

If vfio_migration_set_state() fails to set the device in the requested
state it tries to put it in a recover state. If setting the device in
the recover state fails as well, hw_error is triggered and the VM is
aborted.

To improve user experience and avoid VM data loss, reset the device with
VFIO_RESET_DEVICE instead of aborting the VM.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 8943ccbace..aec8afcd6c 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -89,8 +89,16 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
         /* Try to put the device in some good state */
         mig_state->device_state = recover_state;
         if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
-            hw_error("%s: Device in error state, can't recover",
-                     vbasedev->name);
+            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
+                hw_error("%s: Device in error state, can't recover",
+                         vbasedev->name);
+            }
+
+            error_report(
+                "%s: Device was reset due to failure in changing device state to recover state %s",
+                vbasedev->name, mig_state_to_str(recover_state));
+
+            return -1;
         }
 
         error_report("%s: Failed changing device state to %s", vbasedev->name,
-- 
2.21.3


