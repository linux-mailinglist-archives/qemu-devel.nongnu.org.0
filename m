Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69055386F3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:59:23 +0200 (CEST)
Received: from localhost ([::1]:58210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjfm-0004bT-Oc
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisS-0004vN-Pk
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:24 -0400
Received: from mail-mw2nam10on20603.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::603]:31680
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisQ-0008NQ-3z
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LU7zy5+yN3odRNhjGvGXXNCqZ7LPVwSSDG8c3K9uO+/w/q7FPaCbXBwnQk039he8I/Rga/FoXeT1OUefwcKqII7BJdtGaVn+2ptjMpkWw9ANGWw8amJVzBLi/lUUTpwvXhS04YzY3SBKrjXVxLdhRuFl5fDnlkgNG6t0tEjYrOLvNUbyvJfr3tK3LYXpyQwRpht1EKByOEOFnwxr607k84YMamQyJoQxIxzKZjVQqbgJ6ykEtNif7V577Vt+ykOdhMWT2c6vrv56fq83RWNgt8ZaRGQfH8fCxq2djZWx2H6J/IFHJbQYNGzxWFqA/6m5o4xTYXSXLmJOK+q2GKXu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnU8qOv6i2xNavvVVrbqS7u4puQ5WHvKn7v45SwSF4E=;
 b=UvvzX9f1IvE5cXLO3A40kXlDTDaxW8u3Rhoqof63RDL5fDEKwU3xuZfLbyFVQt2nncZAt8iMSHO/G0w8BCOm+3hUTPuPA17RkUhrwejYzlU+rqurtJJZWkfau+WFKHDuAJ7/u+xqR/FQspZuAnqJy0P4wtoAmH6HbxZKa1m//41Kwrq9ct+hs4cNwVV4Y6ElL+Y64C6OptVpubY3eWnEdOzNxCkzlJ9VcKaNkYOUQI1iVwpuhEdwi+z5Prv/bjLkNr70A61ut/c/Wb8FmdReV8QfHIpm4krMsq4LVRkCGfqeCGjb4scLBlC7+6zEQEWJbV0O8J3UJTgSiGpe3kCWew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnU8qOv6i2xNavvVVrbqS7u4puQ5WHvKn7v45SwSF4E=;
 b=ORMG2osqX5n3hbvYLGmycn0FijNS02WIEGCxbpPF86EO5erj6vgnJETrQxhfrhVellaS85VHULAnUvUNL+XSNBcN7xeQrDPj8F1JQJHB9KGvQEz2kOb5YuNSzjGr7iW7dEML5RJFW4HGck81hujhKpH9hGquDi6Kg7O9AzWJaae+q5uOlEvOdTdGge52Xu58XpINBLzdSoB4bMJI+suHXoPvaaoTJr1cwtg+4fXUbc+qWzYZV38+ofIxfYk5RsiwPUNAmTDE+DE0RYJZ1P2ben+i1QnKEdOOr+cM8BYeLO4osdNmyYi5RftyQLe9S6mSSvyFHrO5fhs/mdfDbGS/YQ==
Received: from BN9PR03CA0233.namprd03.prod.outlook.com (2603:10b6:408:f8::28)
 by MWHPR1201MB0239.namprd12.prod.outlook.com (2603:10b6:301:50::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:08:16 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::3e) by BN9PR03CA0233.outlook.office365.com
 (2603:10b6:408:f8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:08:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:08:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:08:14 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:08:11 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 09/11] vfio/migration: Reset device if setting recover
 state fails
Date: Mon, 30 May 2022 20:07:37 +0300
Message-ID: <20220530170739.19072-10-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7ca6b28-4a36-4305-ffb0-08da425efcca
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0239:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB02391C3EFF570D0B3AADCADBDEDD9@MWHPR1201MB0239.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vbremTIWLXZyELrVxs+ewf/bJ3Er3TeBaoBxXGgEGR9TbyJyEJ3+Ej4M8ASmXDaLo21kpdfEfdJiA38PSgEbbAq68U7g+j0rUGPmF/zqX0qWM0RSknPRSZyUnHgxLjEWzzeTuOg0GNcFGOD3oWbI1aS9pqR7IwRnHPqF7oOk1mHCGHzqVlwqMX19MSHtkS/kAl0Xlj4X+SZAVJmkxgMkEQq6shwPexevv17FcZixDNniFJZVqa+OxqmcpVhDWfH+1+WSbsIhgi1Sb5J7jGh6c7+NqSaXuG2LDDiLxQ6bAEVsGPJIIrxijyauxa8t5KLPotJoNgt7iZRyRBQwJ7b/FfwV19Bd5TtIFpXM7X4jRLROqkFmtBvoUun1XEaGrhIQMGbYdGsxbtymYRWcBDvKFBoTZalRaLyvlHhnCRojnnXRHMPiqwwAZuCZeRfiLzoyua2Mn39M8o5lhelBshmoSCCXX0XQsA4kDYHO/ZXIPB4isRI2mMEovrHVg0S8m/v3Fol/T0izVIlS3Xcjz2EjDClRLZuBqnW8l4QtChY2Mj3TDuLIY1iBl8PWnBE0CjYyDnLHDudIe6HKJSX715aN+bsmyHPCYe474BpsNO91lUgK8PPKA/tu9EwfOUrLT/HgxSVmVRGVOnEWwFKTI7NorP9qKOo8D9NgYq02AaGkisG8MwExdQhK8dAlfJvM0SnPjvoRCDHbsU/jvAyMa6NNjw==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(316002)(4326008)(54906003)(110136005)(8936002)(2906002)(8676002)(5660300002)(426003)(336012)(47076005)(7696005)(26005)(83380400001)(1076003)(6666004)(186003)(2616005)(107886003)(86362001)(36756003)(40460700003)(36860700001)(356005)(82310400005)(81166007)(70206006)(70586007)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:08:16.0149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ca6b28-4a36-4305-ffb0-08da425efcca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0239
Received-SPF: softfail client-ip=2a01:111:f400:7e89::603;
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
index 852759e6ca..6c34502611 100644
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


