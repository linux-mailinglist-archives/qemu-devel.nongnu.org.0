Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7E525187
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:47:27 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB2C-0000gM-Sb
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyV-0006Dw-2Y
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:35 -0400
Received: from mail-mw2nam10on20631.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::631]:14752
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyS-0005Iq-47
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkoeXSINTOWCI4PTZpVx5uEaCTQxPdnZSFjphAiBZyHuD2/avAA9qfUo4LR0RP+IDtlLeAuAc7BOj5yYsmKW1BMciJJLGeqBEcvRLGIy7wLMFPdw2gTxTsRxEsbsLVZh1v61IvgfQZm5Na31kRZ0bZ4ESnRTsd56cJmwv0XtlTW7qa2acra7+k03KvQf4CHP62X0Rtwpj6Ur4Gw1lUh9AJjUWQBFNTfPKFrFCYTsjaIjrqxrGCqg9kl+Z2W5oPNq0prf6L3NtCTPvGgK8nARvpEVC7R7t9oTixhDgu53YBMQ1yeirE20hyocE7HQ5Ml3l65f4Psc5gykqT8EPG4nyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5VG+up6yU09+mzhma8dT2or3CjCxr/1sgyI8vO4A7I=;
 b=VRbFKPDTj0PESFR1mzEeeYfj58hynz1FcX8nK71XgTahKholdnD2qdww7Wry647x2CUyajreaD9D1/PXicMaKQysrNsoSSobbK+ztH8bQVzm2nydGsOa03uzAyTMaaltUETCMOVKJHVXYZXp2VS9ZSk+3FlIJ/lhDtOVDGDEK1NYufDIZVT9AGoiEgWIyyODqpTF0uro8YIaI5FeDgqnHIBJGZQONpLrQV76kp4PhrEe72gMjc04hnM7ESqhT3eNwC6xyEd/FsYBC4unWL+Fhub8uHhekeyO4gONDBlvgBCxRBKFwArl+A+sWIb9c2d2G6n8y4LyhUiNCCFa83mRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5VG+up6yU09+mzhma8dT2or3CjCxr/1sgyI8vO4A7I=;
 b=Bc+jN/THyUYWdssvfVMvXkobRbbpTMrnPvT8fe00Q+NMQPqdfget4JdPpcD0oA9zinzlqHgJWU69GqrAqKmAkE/cwQzJ/h0Ck+ZrL1lVoly8JFikmgB/PXoK96IUTtGYmJYMUASCNLRzZ0eP7gGTMEH7ldiNneViou1UBgZgmDMkMmC5hC71bwouSoWbE2P78idbpQIZ6mZtS8Fisteyh60W9fFjOCwwdj8RljP087laqlIt6PnHZ0IR+gTCt/sn1pQEpAdCyDVZGFDmGHIF1aKsSez1A92ozOzSDIw8CxpDPJ93tTQZ9iPscdmiqxiAhdAZIfJomK8/1KWubhvOjQ==
Received: from MW4PR03CA0270.namprd03.prod.outlook.com (2603:10b6:303:b4::35)
 by BN6PR12MB1297.namprd12.prod.outlook.com (2603:10b6:404:14::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 15:43:26 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::57) by MW4PR03CA0270.outlook.office365.com
 (2603:10b6:303:b4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Thu, 12 May 2022 15:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:43:25 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:43:25 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:43:24 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:21 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 0/9] vfio/migration: Implement VFIO migration protocol v2
Date: Thu, 12 May 2022 18:43:11 +0300
Message-ID: <20220512154320.19697-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e668c81a-4bd4-48e2-d0a5-08da342e2759
X-MS-TrafficTypeDiagnostic: BN6PR12MB1297:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1297C9C0F40B5B701A8379C4DECB9@BN6PR12MB1297.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EFNyrMHB6v0D/VAF7HciR90pd6DCfuEv+zw0vqSyfoBCsnqPzbGM10An13tlg3/pM2lm7GmZ64SZbBey6PH3CbRwr+q2xoP9TodREWyAJC0bXaJCSBmFXn31tCtbJs9306jv2OuIaW3fYoRn4hfPO0vxWGk8jsdRkJ8hU/kNGfw3Nao2f5sjj30z3kQJhLW0xV9Il39ktEw/+YXRhqbfZpauUJzYc3tjSN39/2xBf9zb73FrP1xx68iSyugHLJ3w/4uZKrR15GON0q7tI4v+Jq8h9lsU1EfSSXNrRmf8rrJ5QitDbXKKqwVHwKNSuN3UkNcn5V4Xvr+V4cHEo3V6wpAmOlKUtD9nUz5cJFRWdh1YZNFUkKIBEIyPEb4WTc5T6rgDsDRVvf5ldzQGnzBwU9rG9xj/LUpbG5SHT9WPZd+LW4uXC5jRsXMtfqYq4b2NcmDy8pmhKkfpUeP0SOrquoxsH4cn2W46C9IzPmxJhudHPVtXRyDqaaf4t5OeN+w9Dou5BIqt/99934l0nrA8+ysa3QyXsImEaIYCu1mH4wEar2C14KlT6TlbOp5ff42EzIClzA8yTJ+nfJBise9akSZo+74ejJ9C2/CBQJU2GtmkXtxWhRO6x6aza/4I46Gd601Q29Lp81g8YkxjRb16o3CMHI2U+vmZlJUeC29314h2QTBUSEtfcnuJXuoUHCZNGsaDwNDQ5m6S5Q7QTxg+cSmhyg+JIsKgfDY6AZyXuZiyh5h4U9CpesaGEnwXR5FmeBcY0QwdcEhEgnSmtchYpcZN0/ghFEgIsUMzWLNHadg=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(8676002)(4326008)(107886003)(83380400001)(70586007)(47076005)(54906003)(5660300002)(36860700001)(426003)(40460700003)(2906002)(110136005)(81166007)(336012)(356005)(82310400005)(70206006)(2616005)(86362001)(316002)(508600001)(36756003)(26005)(7696005)(1076003)(6666004)(186003)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:43:25.8590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e668c81a-4bd4-48e2-d0a5-08da342e2759
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1297
Received-SPF: softfail client-ip=2a01:111:f400:7e89::631;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

Hello,

Following VFIO migration protocol v2 acceptance in kernel, this series
implements VFIO migration according to the new v2 protocol and replaces
the now deprecated v1 implementation.

The main differences between v1 and v2 migration protocols are:
1. VFIO device state is represented as a finite state machine instead of
   a bitmap.

2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
   ioctl and normal read() and write() instead of the migration region
   used in v1.

3. Migration protocol v2 currently doesn't support the pre-copy phase of
   migration.

Full description of the v2 protocol and the differences from v1 can be
found here [1].

Patches 1-5 are prep patches importing the new uAPI headers, fixing bugs
and adding QEMUFile function that will be used later.

Patches 6-9 are the main patches that replace the v1 implementation with
v2.

Thanks.

[1]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

Avihai Horon (9):
  linux-headers: Update headers to v5.18-rc6
  vfio: Fix compilation errors caused by VFIO migration v1 deprecation
  vfio/migration: Fix NULL pointer dereference bug
  vfio/migration: Skip pre-copy if dirty page tracking is not supported
  migration/qemu-file: Add qemu_file_get_to_fd()
  vfio/migration: Implement VFIO migration protocol v2
  vfio/migration: Reset device if setting recover state fails
  vfio: Alphabetize migration section of VFIO trace-events file
  docs/devel: Align vfio-migration docs to VFIO migration v2

 docs/devel/vfio-migration.rst                 |  77 +--
 hw/vfio/common.c                              |  21 +-
 hw/vfio/migration.c                           | 640 ++++--------------
 hw/vfio/trace-events                          |  25 +-
 include/hw/vfio/vfio-common.h                 |   8 +-
 .../linux/input-event-codes.h                 |  25 +-
 .../standard-headers/linux/virtio_config.h    |   6 +
 .../standard-headers/linux/virtio_crypto.h    |  82 ++-
 linux-headers/asm-arm64/kvm.h                 |  16 +
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/linux/kvm.h                     |  27 +-
 linux-headers/linux/psci.h                    |   4 +
 linux-headers/linux/userfaultfd.h             |   8 +-
 linux-headers/linux/vfio.h                    | 406 ++++++-----
 linux-headers/linux/vhost.h                   |   7 +
 migration/migration.c                         |   5 +
 migration/migration.h                         |   3 +
 migration/qemu-file.c                         |  34 +
 migration/qemu-file.h                         |   1 +
 20 files changed, 618 insertions(+), 781 deletions(-)

-- 
2.21.3


