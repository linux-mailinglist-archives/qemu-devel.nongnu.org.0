Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E996A55F35E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 04:29:24 +0200 (CEST)
Received: from localhost ([::1]:35420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6NSF-0008TY-61
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 22:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1o6NP4-0006e2-42
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:26:06 -0400
Received: from mail-dm3nam02on2086.outbound.protection.outlook.com
 ([40.107.95.86]:16097 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1o6NOy-0005nv-Pu
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:26:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us2R90fR05UDkXbKNwCYtMWjkP1lX40rpeP3X2A3v9qGrxfZ++UI5Y7W0L4LpthdaMqsTGmP9mzP8+utnjrTkkl1vRLh5CWJvAp8KfjW1LYgkpyCj/krMhWVY9cn6JnBWPNKTlqmbgJyoaMdzGqZ5UGMObuhmWDUWMT8M8bMHTC+ztwOkd1hVXYNzPbRR59ff6aeUilPQAOisb16d76I1PK70fAPYVCYYbFuZiA/P6h5UWaf5vBtceUssHqur9fbijuYbaUMZCCuw6YJkqoqETiJwPHQjxaSf6QRO5isN9wQhorDjJ+dLkcpAr/pFXS3vNYt7r1HqVurbLvSnhYD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IN7mLt+hFJNb2nw1aLrdcpMiKGw4skTuAieJzdOneE=;
 b=N9biAAeNf6BLGgJmFvsIOiDtNCetdKyYP/r4n4nK8+mF8xuiRzAhpBC9Ux5E1aVwVA8h0VrvcAJ2dVbn7qGkJDusr+BbR/2OBv7BMG3V83q/c0bV3HkDt6JsCUucCYAUFupir7Yvd9tW80fYaIy9LfLCJ4UAE5iJJmb1fZ3Yilux4rHLvNQDV7jNT2sioYEVdBkbOZLy7agQQ7gRLy6qWcATxUBM9jDXjrTkC4hxzdfra+lK2eDLucu1Yyrzvv7e+9vIm+keL9W75Pa8qF53J26S+gA9r25rbon1RPyLxfQWTCAn1ZORVc9foSINFKb2U9izqFFYo93U9kxl0H3Z4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IN7mLt+hFJNb2nw1aLrdcpMiKGw4skTuAieJzdOneE=;
 b=AgGW7VMvOTVLvQK93IdJ+6UgMug/oRUh8R+u5RTM7tALrSjvaKeUSGl2onUvamhvLQaR4b6IRZWf8avG8VR48o8xF+Vf09Mtnbx7rcIwJBvZsC7DUHB0hJwz8Ns6bNS97+UsYPFNhOEmu/we7Xx7BQoNK2sMPGibh5C8M9A7mOElyKLq3ifi7wcv6R/OzGizOCinlU6j/wo99lphLXvFyyMc2BF3zZDQHjid2rR9F5/SkVcebU+YaKSxZRX1OEsfXnF/tg+Jw16jZuNGLmcuIP1DAS2Bs0iiaiAMUZPPO8+9mzCqhDCVsrCw5dso0Pbq7FU1S7DRTNg7F5Q7m513vw==
Received: from BN6PR19CA0076.namprd19.prod.outlook.com (2603:10b6:404:133::14)
 by DM6PR12MB5517.namprd12.prod.outlook.com (2603:10b6:5:1be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 02:25:57 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::36) by BN6PR19CA0076.outlook.office365.com
 (2603:10b6:404:133::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Wed, 29 Jun 2022 02:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 02:25:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 29 Jun 2022 02:25:56 +0000
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 28 Jun
 2022 19:25:54 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <alex.bennee@linaro.org>,
 <yajunw@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
Subject: [PATCH 1/2] vhost: Change the sequence of device start
Date: Wed, 29 Jun 2022 05:25:16 +0300
Message-ID: <20220629022517.2600911-2-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220629022517.2600911-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9471478-21e2-48fa-7c47-08da5976b34e
X-MS-TrafficTypeDiagnostic: DM6PR12MB5517:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftH/mbG1H4PLnhSMf3XSam/HrPDx9J4abuMFCtZzn/AjoGDzE6FlIJvncPQkWgniZeMsX7wvTuQ5W/tgILcV3JHSLo+7Wx4hEUqxIhYg3Op5krQEixBBZpDO+TqF77n/89GDVkG89tdAA2M07XNDIOYND7UHLCNvrJoX41xpzjmpgmxft9fuUvxKTwYXgLTcpYe4wzWQgT1YE4wbqE1FVq0Yh6/4qmSpX0OjG4XrCjU4hb4iG67Kdu8PU2qEj1zfMUKaEnWKlUJx0P8xb4lwiEMXJPMFgia+bTedZRLqR43f6z8d9BaLdLaC6tlb4+3NxvbpQOVVJJzTkfplwwOWCSrYtmriZPOw5Vs0GVJ8iVceBWUQds6Wvk+GXj8tvyVKieg2mWSEPHQOMVeSgLDgKjeW0bR8epBj/vwMMWcTx6XH8WJdLOfBwJpEGLHhKNzSJFlOqw0mszhxs++bbZq5Z7nqo0rFbRs45gzJARj8hRt7Vc0pZWMtrIl7nVpM0t3YsPpdZezHhgWrnuKSaEoT/eauSr24bnH7c7X3tul1nPg4X62QFHfr1LSsn8WLxb/qqnP8RLyX3ogcPIy+attRpqN+piwBUsG0W0JUmB6YYIEnBTRRKotTwYHfJD2ZNbWyIxA1Jt3rjZM1+Je9FOheAKSG2UwAwcQojvLTnn70z1G8YyMsNQQReSJwV5QSoDroVGcwzgqNUwgq2/uNE+1h/sn+pcXAMClIHpvn8mNcJEuOWZJdPitXpZepOWN70NbKoG2hfdKQsPidj+/unTv275LKlYCkCwNb7QbRnTfiO1ixSueI8cUFUyHRxdTPhffkrX7BSkAVIyuhQjM5xfmb9g==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(40470700004)(36840700001)(8676002)(36860700001)(70586007)(4326008)(86362001)(40480700001)(70206006)(41300700001)(478600001)(6666004)(26005)(6286002)(7049001)(7696005)(82740400003)(40460700003)(186003)(47076005)(2906002)(55016003)(81166007)(36756003)(356005)(107886003)(82310400005)(8936002)(2616005)(110136005)(336012)(1076003)(316002)(5660300002)(16526019)(426003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 02:25:57.3749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9471478-21e2-48fa-7c47-08da5976b34e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5517
Received-SPF: softfail client-ip=40.107.95.86; envelope-from=yajunw@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch is part of adding vhost-user vhost_dev_start support. The
motivation is to improve backend configuration speed and reduce live
migration VM downtime.

Moving the device start routines after finishing all the necessary device
and VQ configuration, further aligning to the virtio specification for
"device initialization sequence".

Following patch will add vhost-user vhost_dev_start support.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>

---
 hw/block/vhost-user-blk.c | 18 +++++++++++-------
 hw/net/vhost_net.c        | 12 ++++++------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9117222456..972ef46365 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -163,13 +163,6 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         goto err_guest_notifiers;
     }
 
-    ret = vhost_dev_start(&s->dev, vdev);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Error starting vhost");
-        goto err_guest_notifiers;
-    }
-    s->started_vu = true;
-
     /* guest_notifier_mask/pending not used yet, so just unmask
      * everything here. virtio-pci will do the right thing by
      * enabling/disabling irqfd.
@@ -178,9 +171,20 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         vhost_virtqueue_mask(&s->dev, vdev, i, false);
     }
 
+    s->dev.vq_index_end = s->dev.nvqs;
+    ret = vhost_dev_start(&s->dev, vdev);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Error starting vhost");
+        goto err_guest_notifiers;
+    }
+    s->started_vu = true;
+
     return ret;
 
 err_guest_notifiers:
+    for (i = 0; i < s->dev.nvqs; i++) {
+        vhost_virtqueue_mask(&s->dev, vdev, i, true);
+    }
     k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
 err_host_notifiers:
     vhost_dev_disable_notifiers(&s->dev, vdev);
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index ccac5b7a64..6a8a6082a2 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -370,21 +370,21 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         } else {
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
         }
-        r = vhost_net_start_one(get_vhost_net(peer), dev);
-
-        if (r < 0) {
-            goto err_start;
-        }
 
         if (peer->vring_enable) {
             /* restore vring enable state */
             r = vhost_set_vring_enable(peer, peer->vring_enable);
 
             if (r < 0) {
-                vhost_net_stop_one(get_vhost_net(peer), dev);
                 goto err_start;
             }
         }
+
+        r = vhost_net_start_one(get_vhost_net(peer), dev);
+        if (r < 0) {
+            vhost_net_stop_one(get_vhost_net(peer), dev);
+            goto err_start;
+        }
     }
 
     return 0;
-- 
2.27.0


