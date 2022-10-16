Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF95FFE64
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 11:07:42 +0200 (CEST)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojzcR-0008Mw-Gm
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 05:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ojzYB-0005lh-5f
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 05:03:15 -0400
Received: from mail-dm6nam12on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::60d]:51607
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ojzY6-0002g2-PN
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 05:03:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHzcNEOf8ULYQVXnWAm084QaXnvKn4Ymc6yVPP2Xn0dsh3HIrUXQmLIiEWaoVsfegZcb40W8Im+g42nE0Fxu++baamknIDMGRe68Koncnu6Xn4zVEAvRDsM+kRwfJhN6SBxmHEFtdticK9lnyChdxHwfQw8cxBfWTMVL+fMHQTWlbhCOUKGTzwF8XdloVQgDx5vEhrfueutTVhsPb4IInlRYOA/h6vESime71VMMnHpqGJTHJhO6bNToIbgR3odCLTPBroCngwNlCa3G8opspq3zC/da7kQlb9NSDgaa1M0IgPtpgaElwWQBj9+bto75do9++UlHbY17GkM3Y5Cewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHAfVa/xPvu15JECEl12TQ7fKudUTZV9Xgfk1CqAzbw=;
 b=GbrPXMfNVWz3EwhXeuZOmwCQseLVrtLh3DS3Luf1tBTJgLvu3d1PTHj3bAY/2obI77N9e7x1DprSUG9+lwDBx/rDhmpjpY5riP2Vs2Lys/NLElknS3DtpG2qZw2WOLx8BYlUZl2HszV9yb6bx8hZfuqb2o25lSU/ExSPUMomPmtkV/0rinMKZwbIuNvs8gC7fKrzI/gayShuoFr0a2YGYjKJ3AFGyLFNHuMmlm2r0DoTMV95px+TfnumTJa8FocR7CPYyQLBkmxRzWdA49bhbSL7BpsYWNnHr46Dse9KCPuZXhVWaRrHsoSZ3txfH49ZDdGt3Az4wuvshiueDjc1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHAfVa/xPvu15JECEl12TQ7fKudUTZV9Xgfk1CqAzbw=;
 b=timWwgSY1G1SpU1kBVJyIqsjRT2Qbz8FSxKvLY2/lFqKkFLJxe5y7ITgq2bJigb9KTxDvKWKD/ZFtul57F52fE7m4QfwaXIbKPvFeKjz995PNrBj8AnOTDncq6zAO90KY/wRUqjlIUuH77iHSu4pNrl3hRej5EB46NKs2wYWf9R7ZWMtv79oB779zoh1q9/zSndDpZDHjXTalCxkqoOB8l2rdspYCjVove28PYqSJwV/9z6723zm2EPSv8ESXLN27JddlJqeGrXMd0DTHSeVz88P2RHPcUgbJglhfwLvYLhnPphZsz/unmOW4XkZJdXzNRjjGCg1o5onki3MuOQ7TQ==
Received: from BN0PR10CA0029.namprd10.prod.outlook.com (2603:10b6:408:143::7)
 by PH7PR12MB6857.namprd12.prod.outlook.com (2603:10b6:510:1af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Sun, 16 Oct
 2022 08:58:03 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::43) by BN0PR10CA0029.outlook.office365.com
 (2603:10b6:408:143::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sun, 16 Oct 2022 08:58:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Sun, 16 Oct 2022 08:58:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Sun, 16 Oct
 2022 01:57:54 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 16 Oct
 2022 01:57:54 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport; Sun, 16 Oct
 2022 01:57:53 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: = <qemu-devel@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>,
 Kunkun Jiang <jiangkunkun@huawei.com>
CC: Avihai Horon <avihaih@nvidia.com>
Subject: [PATCH] vfio/migration: Fix wrong enum usage
Date: Sun, 16 Oct 2022 11:57:52 +0300
Message-ID: <20221016085752.32740-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|PH7PR12MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 84548dc3-c227-4b13-6606-08daaf54885c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fWXKhETJ21HsYOj1AKGUZ2X6mPPf1qJQlIAMltWCoF1hoSodEsN1zVQFca001GQCw4a8b+/KJveH7VY/oUdhCAQ01TZLEC+qpsE8XJZOQ16BHKENxKlwukcEh9+YRFDMRSf3XL4EEKwVsQB0vZ1RDoGFfjuVxRqOBrSw627ft2YiHocyvz2R4DB3v4F3aJJhJ43GK6W8oNr6/TlMrJ3FcDx+Vfwz3kwgNAw0DNUndOENspMStRYn5s/Rw4wSAuwa5syfuyiWYGcqHnhYv0VJnL+t47B/22CmLDxTz+dd4zGGP5doPBU19Md4/bAMTCWqumLe3EDGfVGcsL/JVT1L0mENq3YtSDbLxlr61HW24pC8yQw9JQqVTGtb6EhS7/uq3NWCCMsGJeFazEQhNhMk8LmCFYPa7TunGwEQkDjge+IdWFp17mejqgbnba2lbiSqcTUhj8pmthrLmrHr2v/yf1ed5KoHhItHF2iZx+Eyp88EicImeOk50lw6Vi7/orGVS8g9LzanbvQYy38bpBvUQhNlQRkgGzlF3YHCarOBwwHJpqKfH050lvfw19D7JJiT4ED2S3sYTKGm87CabCcK8koN7txMYEYnkfki5UgXkVDW4GhVhUjdIMxbuIZF8WtvtxR93GCWk+cG9HYz78YcxIsGXfvtlQfDxbNa1mK+VaCVsX+qzOuYnfIlLFw7JeRserAQnPWMWs06l6JBClLkZRB0UFPDO0TOVZbW/P3FiHpEa0WOYl+GVYgZu1i3ih2zBOQc9JpWvlfhg5x7pJiA4g==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(36860700001)(86362001)(5660300002)(4744005)(2906002)(82740400003)(336012)(47076005)(426003)(1076003)(186003)(2616005)(7636003)(356005)(83380400001)(26005)(7696005)(316002)(478600001)(70586007)(70206006)(110136005)(82310400005)(40480700001)(41300700001)(8936002)(4326008)(107886003)(40460700003)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2022 08:58:02.4185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84548dc3-c227-4b13-6606-08daaf54885c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6857
Received-SPF: softfail client-ip=2a01:111:f400:fe59::60d;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

vfio_migration_init() initializes VFIOMigration->device_state using enum
of VFIO migration protocol v2. Current implemented protocol is v1 so v1
enum should be used. Fix it.

Fixes: 429c72800654 ("vfio/migration: Fix incorrect initialization value for parameters in VFIOMigration")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index d9598ce070..8dbbfa2c56 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -803,7 +803,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     }
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
-    vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+    vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
     vbasedev->migration->vm_running = runstate_is_running();
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
-- 
2.21.3


