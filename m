Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D25386EE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:56:07 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjcc-00069q-EX
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvis1-0003GR-Dr
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:07:57 -0400
Received: from mail-bn8nam12on2061d.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::61d]:16096
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvirz-0008LP-9Z
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:07:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoaoAEgILqiPyShX8ux3Bt4r7d6wc6FGCtqIyPR5vbOKVoSeCV5DTHpdO+vPPai43nEGrYRUq6e0fsLt8ACDAK2MCX+rMKYx8SDmQPwqnHKIdKE8k8dfBZ77v4EboaU1H9hotR6+wpGU8axX9/LBeAbQnTN70Ss+EcCQakYzBPd3RtpqJtyGKnH1p60XHIvEBE2hyUjC8Tu2dSHPMkwgVpvjM7i9i6Irs/zTub/k1gmdwOKKVQrrHNrIhkm3uHNBc2EY3aw60tiRIBRhVVpYlz3V5lHXb9XJ+c+Za+B1DGugnMn6nHIfnZeO8gDIKTMI4gSaQwykIGf8H/NPxJ360A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kO1Q0d7wykn/1VkH5MNBlO0UmPGgbg874YdG/5D9cHw=;
 b=TrDmoCMYD/j+z/sazvdmXK4/VZj/HmjvSOuLHGT2RHpkyRpwL41Pqrdhn1obRciPBrjAF0mAhOFDmpISVeL8CQPS42xEFfXDrk9gwYFyGJipN+l4HcMVtG+Vw6CUTZtSyiESPCbHLXgUHG+9f4L9a8J+pISr315Yy2AwHBwuXi2RK6zXW/FrO5wbZ2Gk9abj2bvIVlCcQf03ZrSkE3nmB6xrH4F9Tg4tfSugpyrcuwO2cPSCATk3WWxrk3eevSo7AY6Vy4kDVw7bze/LFf7P5PDplPuNR9TdrwGcSPt1sWPlNMEMh9p0MpenoxoeuSwNs12NekE0xb3iAmAGrNSaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kO1Q0d7wykn/1VkH5MNBlO0UmPGgbg874YdG/5D9cHw=;
 b=PhggqPBKtKXIq9cWfkTZcrj3wNhjPeDkWE0Uf2z8yz6Zpcj/todUEQmXQp9TvoNowjr8a/IaZRRzWwZSSdSgWGvvN+BBykbW1O6XKqL7XUjGSKZIQUbfr5jTA+B9VGUDzEt2Lg6HmgcOuSPZLvhCOdb0Wn1KGGTuQPrduOAgLiFxpYDD9HxYZ2vqu+En/6j9fKlOuewoc9C2BhpQ93IW8OvbPF1BEiglTzRFIeGnXqmeXk85SyWFA3LEsdymfs82jKIl7c6mTPkr2jGNaPlXrgoK09M7S1ljRJcu+8h+IJvduAhcCV9fOqm7B7+I/c+A/Z1SOl/H4AyOYRmZQr1M7Q==
Received: from MW4PR04CA0040.namprd04.prod.outlook.com (2603:10b6:303:6a::15)
 by MN2PR12MB4535.namprd12.prod.outlook.com (2603:10b6:208:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:07:48 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::5a) by MW4PR04CA0040.outlook.office365.com
 (2603:10b6:303:6a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:07:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:07:47 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:07:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:07:46 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:07:43 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 01/11] vfio/migration: Fix NULL pointer dereference bug
Date: Mon, 30 May 2022 20:07:29 +0300
Message-ID: <20220530170739.19072-2-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 759bf2b6-9c08-459c-5040-08da425eebf0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4535:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4535CD0223C1C628812BEFD1DEDD9@MN2PR12MB4535.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GsBO3Z6XPGkkcmnpjRudBR9IGO3hM0SdMtgqNZyl5Y1Pc8fT87IOv/yYwz8tNhNZEd8tUJWKvkfiCZ5ZAroH+7MGdcdwO01aL5y1ey8lNCD37ytdsCCwYnqSH6/6u/E54hkQnJLkTTj61u796m35ePhlIm49yD0Q5EGF07wdJmZT8P51g/Ag5CCDJv7mQFuBEjRR49sJ+RxIYj95NxY7u8L858g3JogJF1QKpC+hFO+kEMraz8xFJHFmJ5Q9j/y8bHEurmDPUxmYCgM3KBa+Ldj5+NG01jnU8q1hXr0KQydUGQW1lT8cEzJc79hDiVe+XmOqMkFQJIwKzOPX+ehjSbbE3tlrgTUFyIWOgILu6jIIEH8waER9qAqsTNES6EykplQUVXXcYdpa6+XbyfYbR4UYApv/hf3XRGIFS1s1C6szvChh9A/ZUE3mYGKQ9ZVY1f8E17lXFYFKJEpjQVl+fRTTpk1jPTm98WR5ryvv6w2nKonRZu7VVkJPpvtuLxLEGHM2cK05hJrVkOcNkz9Ig9k5MlINZhkXlGSIy5PfhV4HPhU1pklyMthugtzz1t/ArYZopLpbGsrssPb8wc3MldEgunHCDmt7bNNDmozGT45sXqZRAYFDUQSBROymz1xatIuu8Vw8USzWc8FwvJzHFTdEsE10BeqD586sHoA6nAtjsdX0x4eu9U3fGfvz3ZJp8hhMpWCFWJEnUMRX05log==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(336012)(186003)(40460700003)(6666004)(86362001)(81166007)(70206006)(107886003)(356005)(5660300002)(4326008)(70586007)(1076003)(36756003)(8936002)(426003)(83380400001)(7696005)(2616005)(8676002)(2906002)(110136005)(316002)(54906003)(26005)(508600001)(47076005)(36860700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:07:47.8006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 759bf2b6-9c08-459c-5040-08da425eebf0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4535
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::61d;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 hw/vfio/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a6ad1f8945..34f9f894ed 100644
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


