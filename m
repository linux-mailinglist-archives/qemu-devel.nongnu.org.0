Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC4052518A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:47:36 +0200 (CEST)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB2M-0000nM-GK
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyd-0006Ht-55
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:46 -0400
Received: from mail-dm6nam10on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::60d]:28609
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyb-0005JM-Bz
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/EiBSggeJS7OtHiv7Xo0Gn/mCQ3+WTKWMvaHNqk56rUH7GObDcDtpxbJS2yuqyIb2lMc8V8Uucy7/0CWtaXKY+KrrBbtBpKxrOHlwG2E8lvUd/xgcBLTgKMdac47PiHVVAUynglUlsiIhF8SG3yx7eNhg7Omi8Q/T7TnoP9+jB2917/8S0HNDT8LS0/HLKI5KBIztqzkShCIa0OkxqVP4ri6b4vV+RZzUGK22z3a8n6Ch0wYbdmDZlhg12/IoYv6ZJCfg33iLEE8HvLxKUoCMv09HEH/8S/0sA+XpQXdQWTNMkT1xh0sAjyKsRs9j0JwpUG+vbhJV4JbPB+iPjbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPkHnwWAu6iKElPml2VAVqhFysl0efHK1imZX3pHVg4=;
 b=GHl33JYfIOBmWEEz3bWZlWDVKlwKs8fStQLIaK3Uhhld8gCYlse8JoEZWy9Kphf/RTbMEysPVOitYJDffBdLWcT0v7wG5/FXrBgNkLQC7x5yVLtEn0b2zTfEaVx8KOStBXRn+fYfctUJsOu2b6+virQND66EP5knmj0gffEEhJDU5egnhb4UoqKzi0t6aX1zfuc9IWQfe8CPQ9NNyJaJBZs0sUOK4/9He1SlpZyRFNNEU9w0P3cMB1ZFIjzAdlgzdTxn03Gjdgjf5UvPIm6L9+L5eyMewzRix6dm2F6ROwtYsHLGfvNqsqqqZXdL/NOyB/o3A/g58HNUeFLhQdq80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPkHnwWAu6iKElPml2VAVqhFysl0efHK1imZX3pHVg4=;
 b=oe68BBN2itJDAUIBF7S0LoNhL02QzpPXYaqOWLMYJ+oRpQ7wTVcz314XVpHVXocg5xB50InlV21tHCakzolJu+4VheUX3EpGY5JgSer4FVKc3oYQOnMuMPh67HEU4P1KkDEhDrwwcqAzA52rVujPIQd739PwnYAFxIRcfau+tpm1Z64ow2uIIDCO+3B2K0JR0PnDAiEhiBCGzrPR314uUvJc4rLVlGGyiZ9El7OBJlifJhhQADYNMcdDWDz42F3F2Q9fv9tZz2GfWXog42yJ+IcTwLs3XeCsc2in80SRT1oG2qybBiONcX9adA42u0Yu8XrjtuN8TI/YOXFU6h4g/A==
Received: from MW4P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::16)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 15:43:37 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::59) by MW4P222CA0011.outlook.office365.com
 (2603:10b6:303:114::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Thu, 12 May 2022 15:43:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:43:37 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:43:37 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:43:36 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:32 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 3/9] vfio/migration: Fix NULL pointer dereference bug
Date: Thu, 12 May 2022 18:43:14 +0300
Message-ID: <20220512154320.19697-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bcf9771-08ec-458f-5b1d-08da342e2e4d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4217:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB421727F2CA2CAA3B456F4BC6DECB9@DM6PR12MB4217.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWbzYujY4VlvlL3T89uAxwyR6xCFOy/n2eFz0b9rPaJCfMyRpVZSBPQ1K0Mh8NND61N+RHie9jyzf3VCbJGGJib+TnePCjWdFOTYOOWvfX0lRcQM7uLuIE8qPn1wznQA1ifu/4X6bseDJ5NBIk5nOL2llfv9KuxOBgxD9v5dnWeElLS10T+9E8ek1CIcE1OU+I7vX0kHszAFJL8s/htb8xhaMiAwoJfzSY4NhbWMkv6z3l/09LpN97F99N6gzqe/MFn/ESgVbAVLaKxi6CKSRVy8EYB+QZbcnutNCvaBG7MeEtNZhYjBye5J9LTAzS1SVIwWRMhPcosEusH+0yVuQAxsjx/VUqyqs7sithwUKcKSkq6zFD1XmxMPvrcJ4KAlfA955HTrWADCN6HKLKFTgghhj9XPVMXu+bexTYt+JxgtIG/RNOqiyKqEq9t9lgsDowngDV/e7kXneaeGlQJGqkH4gM7fTIh/9FRaPWVAixwx7DJwB/P8EKicr/pTYTJAeVLjvYrQlaehkcsmkEvKRX9Nva73W5DV2sKQd4FbxzIUutkyxjEmHTM2JdDZMWh7f+KrnQPP6iagD974YisLyCYc7QS0pFWkUScG7Rstp4KVvnTlH4qWf0CMyhFAs8Hc9AtR5IQ2pdGI1Kxf3zzQYSyAl+kmFlP1VVcsCswAnTE6TUk4cvxclnutQUu5BnlN2pJLx62o+f0HKHcu5dXWEA==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(186003)(2906002)(6666004)(508600001)(5660300002)(86362001)(2616005)(36860700001)(36756003)(40460700003)(336012)(426003)(47076005)(82310400005)(83380400001)(316002)(8676002)(4326008)(81166007)(70586007)(110136005)(70206006)(356005)(7696005)(8936002)(107886003)(1076003)(54906003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:43:37.5214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcf9771-08ec-458f-5b1d-08da342e2e4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
Received-SPF: softfail client-ip=2a01:111:f400:7e88::60d;
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

As part of its error flow, vfio_vmstate_change() accesses
MigrationState->to_dst_file without any checks. This can cause a NULL
pointer dereference if the error flow is taken and
MigrationState->to_dst_file is not set.

For example, this can happen if VM is started or stopped not during
migration and vfio_vmstate_change() error flow is taken, as
MigrationState->to_dst_file is not set at that time.

Fix it by checking that MigrationState->to_dst_file is set before using
it.

Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 835608cd23..21e8f9d4d4 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -744,7 +744,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          */
         error_report("%s: Failed to set device state 0x%x", vbasedev->name,
                      (migration->device_state & mask) | value);
-        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        if (migrate_get_current()->to_dst_file) {
+            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        }
     }
     vbasedev->migration->vm_running = running;
     trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
-- 
2.21.3


