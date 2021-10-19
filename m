Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A2432E87
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:46:48 +0200 (CEST)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcitb-0002NU-Bh
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mcilU-0002C0-WE; Tue, 19 Oct 2021 02:38:25 -0400
Received: from mail-bn7nam10on2061.outbound.protection.outlook.com
 ([40.107.92.61]:49632 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mcilQ-0003jI-4P; Tue, 19 Oct 2021 02:38:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R00qNLWROZUJUSHoxoIZnDVgLvHl1KcGiyo6ZkAsue6eaD7dnyNVE3ggDrnrZM1KYOqeWMIEkolJiwhu0I8zQAeg7ehhulbSymGR3j99tBjnwn6PZXVL9Jgv1ItMHjcEhwQqTGRWLACR4slCiAoGi89mWaN66rWly50D5asIiMNjzBSoxUHMPdzB7awhmLCSgjASuKHH4nOuLie4d5PEkpRBNU7jITh7EuNQMEoBHzzA4bDT+1BTCB5wHBeQ6qPkOThh0nZb+e6XIeWMPLA/VPrpbYLX8+enSJ+6huEsoy5C10NDygo9BN7kamui3fDn+9lHvZ7r93cjQ9+RfAthiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3p3hH8pFwk9GiI811jLv0tpTb7lJRT2jmOfNb+hOC0=;
 b=LqM9Nrbk602xCY8LDbVCEW79YZ+tooVGtCe3Afa7yay/tHXQdL2sgk6X39rh1HAJ0IkUQxGK/i8qSXlgH38llV1n4AR4ybTCHJwGpU1N0bm8mBXegWTrRoLzpNeOD7llQ9Ynwy89ye54JT6PzBzD5//PSLIm3Ju/LYu/6mE7oF74dx+ZblZPmsNjyFx7VdB6qHojb9MbFSIeEQZtjvt5PcfDy1eZM20sq9ePq16ChvOXIwfXZu4UCXT+Cg8z62JlR47/O1rkMwRTTWp/V20TEevfqzPHStLyEFqqPBUtKIP27x6Ey5R+alYDZGw+cm5Pc+7JyYUq12yGBwW++4yrEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3p3hH8pFwk9GiI811jLv0tpTb7lJRT2jmOfNb+hOC0=;
 b=dxVJkel5RA37Hy/PBd/neoPiIoWaaBtVL/mGdPmrF3PBIFWb/9/4vuiHQZdkwOb0EPIk2/rVPHPKdGLnP3l+IqBjbnNcujju9ym6vSDCxD2mdk+HEP9P/0pOz40nc1umwh73dmpzrtIxRGj1kGjJqGGwHDeVfxTUzGpBc0aaQKiR3MbrgGPnRwPqmDxznCJOjX+hr7S3U27B+hcpjEDBWctReUO3bzvUDBbOpEV9fhAfZDDMULHO1w9xGA3+A9H6KFy+zjBMpXxQs1DZVwRX6di/dEuczNoLW3r8hIRQz3Tpaz78AX1ZsyaLomr1cIiLLROXUh6QWDLxgU/E2Xumdw==
Received: from MWHPR03CA0007.namprd03.prod.outlook.com (2603:10b6:300:117::17)
 by BN8PR12MB3074.namprd12.prod.outlook.com (2603:10b6:408:65::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 06:38:15 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:117:cafe::de) by MWHPR03CA0007.outlook.office365.com
 (2603:10b6:300:117::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 06:38:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 06:38:13 +0000
Received: from nvidia.com (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 19 Oct
 2021 06:38:07 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>
Subject: [PATCH v4 0/2] Improve vhost-user VQ notifier unmap
Date: Tue, 19 Oct 2021 14:37:53 +0800
Message-ID: <20211019063755.2150452-1-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e80546c2-6e33-4552-6d4c-08d992cb06f7
X-MS-TrafficTypeDiagnostic: BN8PR12MB3074:
X-Microsoft-Antispam-PRVS: <BN8PR12MB30741E6113CAF941D7BCC1AEA1BD9@BN8PR12MB3074.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rSinyg2Ef/OAAtg06sarXwqKb8l7u9/uko+jpN+ta+tjLqK6skeQlG1D20ajXXpMsAdAKrHGtTKq8ZQ6Es7/VEPAJlGUqU/jQtQ3yF+oJh3VqwIW5ZEunAReI6D0urIWGJ3CLPkkQ9cDPnRSG+O9rT3aPoQ749rMGg0BC4W8OoLNP0wp2WSfPgfewaZU06iIMQKtniTYnkaZvffOqWwo1nibj58UUwY6sY8mrV+EsOVrjaQh7YaTvcSF2ZKqUy0fW40DPPGpa+MRRM80pewdPce0fJOTY7ENc2EsxijACE3eZbrbvtxResaX2Q+gwXe8LlIQ7dFYI7vqwIu7O26cJA5HGGQ/Am+Mvy/o1AJ2mII2cTCReduVlJM/eYPCVAbazmLZkIBcRc8S9M17nPLBgPDmbNw6ushwZ2unGza4A4TVIRhaBbMoRaUZD1HWtcFZRImz6GyTpxDIO2OSpDVWMSk/iVEoqXnfl5AZfcNh9IlDuaMK5JeixElPNHPx74BiFUOPMvBEIunCWgviqlw3U/gV2auH4GbZ15o7F1h899anuUYYSqc0xDgy8mYBRcdb04tVoVn3lKxqoIwBS8wYCO3ZIwxtuRqIBQLSpAEwU1PRXOXgoHVTds25yGt75G3iV7q+tOlhbVUgOwsizHoLrpuoo/nug2mYt+PfcfIVOqTmrAAg+InDoAYlQ5Mm64I45nWNTAzpcagxdwWbaQLjlrhvoo/5Bvq3UAVB3JKuhpJnwOU5G2xNh4KF+2oHBOQLBaC5ZGIeA9S9ptuQFtQKtZo5Jy89v9x8E72UXrYr1eM=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(356005)(36756003)(2616005)(8936002)(47076005)(6916009)(16526019)(4326008)(7636003)(426003)(83380400001)(55016002)(26005)(1076003)(7696005)(54906003)(6286002)(336012)(186003)(2906002)(70206006)(316002)(70586007)(508600001)(36860700001)(82310400003)(450100002)(86362001)(8676002)(5660300002)(6666004)(4744005)(966005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 06:38:13.7105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e80546c2-6e33-4552-6d4c-08d992cb06f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3074
Received-SPF: softfail client-ip=40.107.92.61;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
    https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01764.html
v4: fix first patch compilation

Xueming Li (2):
  vhost-user: fix VirtQ notifier cleanup
  vhost-user: remove VirtQ notifier restore

 hw/virtio/vhost-user.c         | 41 +++++++++++++---------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 16 insertions(+), 26 deletions(-)

-- 
2.33.0


