Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF5426585
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:00:21 +0200 (CEST)
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYknj-0003s2-FX
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkmD-0001yo-1u; Fri, 08 Oct 2021 03:58:45 -0400
Received: from mail-mw2nam12on2069.outbound.protection.outlook.com
 ([40.107.244.69]:62433 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkm5-0000h9-Qt; Fri, 08 Oct 2021 03:58:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ievR1F8YzEQjIpq4carGJMxCWtZXdwotKe8t3dWOkK6iepKg5fPo59KbXRvH3V0eIs3vWXF9jb25zQE9m0cBriNFh/Dd+pXsqtCFqwDO4ormXwS2etQatJLuPe7IWemxiTn9olQdrJhxWBzpSZmQg3FvXvLUUi/M+ZkTV+eAl3iYHmz+pjxqggzXF7JcW0g+MrpikNkJhyVEi7UpnnW7MtiCmxMuEyTqFrO48p1S16GmTxGYPKjTbF/Xitl0qoL3wh8CXAxo3VQNOq5RWN04uP8sErnnOLNeBQJj7wuLO/XkPOoeZcPzi5nEyM5RETK8054UfeIUAJO/9TZ4rxTtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JbsP+1HcrrOq9kWbShAEc4Tz0V3T6Qv4QxZ4n5JI+w=;
 b=oeRUqzQ0ajrDigVL8fTaBATGcskQNDSP5vy77/lNgO+RUjIBbikqUeyjHnQz9rnA5deUnM9c0TqOE67SZGbqdjMMZ+C0lMDAuiHWl6SxXaTA0hSepNEbLQlHG5q7rviqsK/Kef6eYg35dlmAN52YAkhYVjcvZsKBbh9/PF632n68gLrAjKWTieiXMX3tvCdp4HSWwPWMVIq4E4xkbVc1OyITpmmybp8ruzWu7riGE4ibsR02my6tH1ffofmue9i5nFOOYW84tG2yP3oktQovS0vJuuFCO+EILcKVQtzmPQgpRIpYdcmRfj8MdGu7TQ6ZO/e+J9ivQ+R26vZthw99rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JbsP+1HcrrOq9kWbShAEc4Tz0V3T6Qv4QxZ4n5JI+w=;
 b=I59ZfHFcquHyNN2nS+QYPIXxPiXLhFlyn1f973Zo3R+ezXhcC/8KYWl1TorrDta3YbNd7YfYDi5lghB/ceJjNQ9Ch4xU3CQ5mrqi3oqUvypFkcNShhjzvs1Oke5PdbLaQdoKES7a9zwtkKG94476g3+xI295SoXIoMQaSYugC0qn3Gge2NUzdJ0VdybEPkdFKXuBZpsBWSKBq1JwGMfVgq/uf+LzycJjZZJLT231uc+fBT/AspQLp+JdnvKixXPn3+Dgj7NaIalC3543WRt5HwLx9qg8nT81HeLM1wXIspOmaCk7gf5iZCwqIvIpsBhY6DrDeAAomE4hdWgHGM3MCQ==
Received: from DS7PR03CA0191.namprd03.prod.outlook.com (2603:10b6:5:3b6::16)
 by CY4PR12MB1288.namprd12.prod.outlook.com (2603:10b6:903:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21; Fri, 8 Oct
 2021 07:58:31 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::e7) by DS7PR03CA0191.outlook.office365.com
 (2603:10b6:5:3b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 07:58:30 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 07:58:29 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>
Subject: [PATCH v3 0/2] Improve vhost-user VQ notifier unmap
Date: Fri, 8 Oct 2021 15:58:03 +0800
Message-ID: <20211008075805.589644-1-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0c5127a-e5a2-4c8b-5e4a-08d98a316b7c
X-MS-TrafficTypeDiagnostic: CY4PR12MB1288:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1288ED32DCB6F146128DA0AEA1B29@CY4PR12MB1288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTz4oDewnYGh5Bgk/3OTtSCu9qTg3ZkV12Kpmn32iRmudO/Ek+Czx3vz8syihn/FE/15PQIFg1zqLd8EUGOOOp2k4HdaFs7vnnC23xbcSpCZRMEs7VRlSnJdBEit5lFwHSODo/ouuEXAL6zxhfvI1f5MHn2rn8osrauK0iG+KEmlRIfITyzd2y5kst3/hBFJlf4KREGlnYApcpy50xoIfAtlvvtZJPMzGIz9UvVHHMp3FejNdbvUSCSM9TMeBG+FL9Wu5FPnsaFkPu5K7YDqaJYfKp7+qIKlxyhs1v/L2zXH22YEIj+gMY5p0e/KlaTBF/mXKopv2R/UA+tPMVA6h3UEqmFEQtAKlkZE/7/TWYqUiwQ7W3Pdk10XL1ZSczvZGI8bi4OF4uCsx7l2g4mjPb2I7bKZR/9WRTb/QxyOMANOXKyc/54yS1JFELAaRqi3vJ2G9RM5a0oW6OwFOlZehJF4lUjM5UmkuGR5K1ehNZp3hsOPmNSmakKLN/0KBmT6chsR7qc0vcV/n8nfHCDMn9mxxQTifVGFkNvPCNkmD9v5uNho49PVVbY90ummdio14mM+Spk9HiwT8AV+PvkJGSKYRovP6PT578bpD5M4XYWcTwiEHy5nyezZ8Qa+RvndyOSOeOZ1Js8JcJYMLPTXKmGr7oyxz1rkwifaS2afVsaYO/9dPKyL4bgsZqdZybD9do/3VT99luHYoAxtDTwcog==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70586007)(55016002)(186003)(16526019)(36860700001)(336012)(7696005)(8936002)(70206006)(6286002)(26005)(4326008)(36906005)(2906002)(86362001)(450100002)(426003)(356005)(6916009)(83380400001)(508600001)(54906003)(6666004)(36756003)(316002)(7636003)(82310400003)(2616005)(47076005)(5660300002)(4744005)(1076003)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:58:30.8370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c5127a-e5a2-4c8b-5e4a-08d98a316b7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1288
Received-SPF: softfail client-ip=40.107.244.69;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

When vDPA applicaiton in client mode shutdown, unmapped VQ notifier
might being accessed by vCPU thread under high tx traffic, it will
crash VM in rare conditon. This patch try to fix it with better RCU
sychronization of new flatview.

v2: no RCU draining on vCPU thread
v3: minor fix on coding style and comments

Xueming Li (2):
  vhost-user: fix VirtQ notifier cleanup
  vhost-user: remove VirtQ notifier restore

 hw/virtio/vhost-user.c         | 41 +++++++++++++---------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 16 insertions(+), 26 deletions(-)

-- 
2.33.0


