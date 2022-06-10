Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB216546DF3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:04:03 +0200 (CEST)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkrS-0001se-K2
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkfB-0000Sw-BX
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf9-0000Z2-2Y
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:21 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhqNG016299;
 Fri, 10 Jun 2022 19:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=v0TtMtb4msHN7hub68kHMLkIaVoFhkiYdKR+pNRRZvw=;
 b=t/VueAvH+N/oj/k0toMCyG0tob2rGQSVrE+aMhFMop5b7+JGY/T3kC/hM4x4FhEYhdu5
 45RFydJSTtqhOrSwQdd00ZPsEEGmuzVQOMmTwDj2yBe9jfeE0Cwv/am9zxywj3h96ADl
 uZ37xyiwKyJ6Puj5thpkYtNowUHUx73a3uhTSwXerCRkY4JSGMwo3nZ+Jo7Yr2qWO6nr
 SXuyqui1sNskQG7TlPAiuDgHNN7ns1WAxTYAFsjqK5DVup5j4BPJYKmVCRGzC6R4Xj1K
 r9gz7Uzkr5Lt+XDDK4Mx0Otstf8djPWWenIpNxIw+q/R30+/pHcIwzL3AbN9lL/xT7ma RQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ggvxn4faw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:16 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJjLKc030549; Fri, 10 Jun 2022 19:51:15 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwudf2re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGyTK1RJf6YkkfHLOLE4xbnKRNIeCuFUvM5rUrKSg2p0TVXjnfhofStbl99ULCP+Bzw4c3zGUpXyKye5ThVkAi/FkpaCLV3ja/1aaLLE3EFeMtJmIP/BmBswLyHlwPq1I/pouGECgXjirvnCr7Tx9oE7sdIKyZSKJUR2Coqy2mbzMu5NThEi+cr/l2CQ7i+yrRMrMh+QpdFH4tMWe83ONw6njuLg71cgVy4xiRwrlhxpQOh1WXRFpdtS4DIMAp+WP5pWeM+HicsK/DKWENjqPfQXkYE+YZeiK1RTQ5NmPmIHvMQudjwBf1iIco2v+WZ3yFmdsHgVcm0f1Mzvmo51KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0TtMtb4msHN7hub68kHMLkIaVoFhkiYdKR+pNRRZvw=;
 b=RKdYiTPrkwKsijKVFQMTpvxi2RYLW+NlEN6QVbCpCShsiJ4EwOuEOZSPhgxYncdTOt29tpkBS6Lh5zQViTK5gDo4K51rWfh65zrSRIXezDhSNUOFDtAtzzZ9EYlt0hKNUgLE1NtlKLAywXdK9tTONvDvHJ/EVb5AL+Ymj2lXbGtE7QjBpVAYkNPO23NiEjvR6JdAeL4IFbwzul2u9EpaoJEuzXxAzlXwQqOMmQLVNptOtoUtZno+/ckV8d/W543DN6FdIz6WksXJ+CZ6ijMFD8p7JatE+V6g9s4ADAwsZPqXIBMwsbuy8jIWnt+Nhe7T93UGTWhgAW+nFgqQB3yGlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0TtMtb4msHN7hub68kHMLkIaVoFhkiYdKR+pNRRZvw=;
 b=e/7Ts1N3a9XEdFHB7wDl6FIzgo1eQOk61Su0mFIpQSOO8wuLbA7Ggp+3yqofWU8b6NEkStGh9b++3yLh20MhEuZmLCgT8KcNGqmODtgOBiG3KBgZ3lAc1HWZejKYPLcOYWUr6vcc15yv8Dhmmm8PMMcO2Jz8ILlURZRAdsW6WjE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR1001MB2410.namprd10.prod.outlook.com (2603:10b6:4:2e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Fri, 10 Jun
 2022 19:51:14 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:14 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 11/14] vfio-user: handle DMA mappings
Date: Fri, 10 Jun 2022 15:50:38 -0400
Message-Id: <3ac09c447310f028ba53bec701749831a4df852c.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2aff2c5-c5d0-4374-1f58-08da4b1a9339
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2410:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB24109732C28FFB165C245A4090A69@DM5PR1001MB2410.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EIpF2bDt+VkyhZzl56vvDtLf7En+h/52aRtPG3g8SSxQR4f6NA7M6ziZbhpHcsFFPy4PuBKveqqWdmyOOTbFs4g7/hQfn/ulu+A/1ksq1FyG5tNH56jaoziiuCc8Z3nxYlle+Lvx4AUqiCpztqkwPhvLJt407DyEdjcGxj913sgrcL4AWT1ys7ljIQKyLnvb2s7QaxMPilTqbRuXWgl6fJYOMJCUkk7kFOkBCTrVnVN+Oz6NF/nJ3bFL0Glx07ZFx9xtjzJOoepfkMsWW3HGxz7LKZ6rZaIDXIgmcuIg64ogLw19j6mZEVCI4+9wKgJWztSjl5ozKYOS1d32y+G5OpJvPl05vdVFHRYHZEhO0W1Sdqg56AaeLkDa7Nyhc5AAHaEinZ4awGycBnDa8UVaxEh667dvUf/XkhJIeSjTR2nRUi+tlmlbAdvwF/XejDZoR7TkoGvc6oXxtxAMTA0rtgrGfhXCYnvRQ9IrzFP3NHwZSewPUKR61kgfuma6qEgGy5Yz9iO5EHnK0iBYD+XxROsN1UhBka/9G8g2BjPfroTX56bMADVpe8YjJ2B0Y3kwsHkHCnfL4nC1ZaPbzlE+EavqtOuPc/g8QoEN+fW/dn78DB8ogn3rlh+3/khYT67Ho2jvew1POtE4OE+qVR/xo52pZYUqcBCPcx/mz2p5DBU12DhL/tZQBDhfYLUa4O4ZWQ3DGIJaSBW5FrrPk4sv5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(86362001)(66476007)(6512007)(26005)(6506007)(6666004)(107886003)(6486002)(186003)(508600001)(2906002)(8936002)(2616005)(36756003)(316002)(6916009)(52116002)(66556008)(38350700002)(38100700002)(8676002)(5660300002)(4326008)(66946007)(83380400001)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IxgkcClNGP8zXoYQ8GqKM6qMSzsji0D+k/i1ea3ghqpxNO7PoPnvg8ELriMQ?=
 =?us-ascii?Q?oFLozd7jsdujNSBpktKw2QjkQOpTQesDbRgF2L786kDI2/Ts5BBHtSOiFuqH?=
 =?us-ascii?Q?Ms9PTfTYOdMfrLErh+mgH5QO/vOld6yjSSKtq+/Q/TGkjxb9dAmwg3aI9cPq?=
 =?us-ascii?Q?4gIM1bJ1wBhoDg7d2dVKWzG7gRH5qDDh2tPRAdNGTPboKrqOiERso6dtK0Gd?=
 =?us-ascii?Q?i2OQk5IjvcGmO3IMgLrwn1SgEpnlFEcOEiWWLzkdimSsp3rfcEIHGkpxo3gD?=
 =?us-ascii?Q?G2w+iosEFofgxK4xZu9ShEFHxEc69PWWyZ62FNMj7NC7TwDPmt2bZEoWRLnY?=
 =?us-ascii?Q?JZNeHmfiGdZwomB6EfdJE20V8uB8okViXSYJntO5mgZBKtcOfBFaixkVq3oO?=
 =?us-ascii?Q?ofIGwr3RVu3hcgfQ7R0gXz1cLp5a7CGVN+hp7ayHIRcbRamaTFC9c3SQtK+B?=
 =?us-ascii?Q?W7Qxtlrwh36UVt34V5GYjzytfBzA4xYTncOXGRh+ceggKb10veJcArMRF5Yq?=
 =?us-ascii?Q?sLZT9FmqmrZOpgqxdy5riFeEV4LKUsE/VpdVUQ3nzIH0m9J9j2dkjvae7cBz?=
 =?us-ascii?Q?AnSae1PahElmmuqbtm0DAERpFNzKeuDECYi4VIOxl0IBClFumYNMbwYnNy8h?=
 =?us-ascii?Q?D01RQdWatYoSoQ4D/t9wtZRxg/YYKJbaOtxuifm2SgGHrODKMl54S3EaK18+?=
 =?us-ascii?Q?fDi2dA0JhmGNTCsZxh6cmz/LiIKGHv1ieNcbdzsrowxX8a9pYNwFtBUJkYOp?=
 =?us-ascii?Q?k6ouvIejdoA6j3ine72C1Oq2VgQCFi+wJuN86Skqw8yJFHbg5d5o3vDkcad5?=
 =?us-ascii?Q?JypFoUiKSLjOlGxZFtq36oi3mz/uA01GaX9Y53tmagA/+EzcIFKWpx5mjZeo?=
 =?us-ascii?Q?O7aYpysqk0/8A7bdCF6a5PC5nPC29hpdFDfRicDgqit9zmFM36JsFqmfKDvI?=
 =?us-ascii?Q?5j/CMavfhZrajisZ0BA2Zb7ceiuUEA3BV1lIow1Zfz6e7RTrQ2XoSVxhEpIh?=
 =?us-ascii?Q?VvZJ78r0oFyZ9GIIiWhTMbY0OJQ8c01QuU4ebFszsmPIXIEpGmdoZvz1F2h5?=
 =?us-ascii?Q?zxtffuhyB0JeLZbx8snXCH1/vz9TROUC1eUSvYaf9iklpVBZkNDqdBypYJ23?=
 =?us-ascii?Q?BnxnXCivU4W+ot+7B4KIRMgQzrmzBSBT9mdq2LAlvsi5sx9dXRk1CwsRmPzD?=
 =?us-ascii?Q?pwK4URbfzZbuN18a0Qc7Do/SYGQe9mm6niLtl9YotF+w6x5v4cj2mrPhci27?=
 =?us-ascii?Q?a8/XXELzG4h+bXOn5HLx6l2C3iHaT2cL8WUJbELFIPhCRipvmU8efGArIKpe?=
 =?us-ascii?Q?IHzDyR/8RBI1w8oE671UNOI75Wj9eBEvutamsKYzCAEz37DmO0gAydtHNTG4?=
 =?us-ascii?Q?a/sDdDHWgz7ZCjk4nPI8pcq93fMD3iSNIEOd9kpNhmsIfZlpraFhEzqRI3va?=
 =?us-ascii?Q?AWt77NSKbxGg6Xw9hDym+WB/iZA0CJhWI5kSsMI6974jEgmPJ6XMmnN4uEet?=
 =?us-ascii?Q?OPzW4hQHHgFobnnhuQ6CbHe9xxtwET3R1tsNKeuxpifl8NR9ZDfRGZoApHIY?=
 =?us-ascii?Q?bIB1HzNfn155et/qwTwn9CzryA8dQaurw+Efr6kIRxlshz2enXmlaIiDP8/g?=
 =?us-ascii?Q?1Rf3tyb+85XEkxGWM5p02hWUiV5JspSSa3/mohIkJNCTfExM/+FasZ6uAif4?=
 =?us-ascii?Q?4hPMKDz+OxGs7+TXIF1IAtxnMQUueCKr3IA7IBGBVD05n6Cd/I5MhjiFDwxa?=
 =?us-ascii?Q?E4kNSdqGKQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aff2c5-c5d0-4374-1f58-08da4b1a9339
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:13.9604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCokZE8XBRirSJ2BK418sZG/DKaKLjFS2hkK4X9b1sBDjZkXfg2itDPbEKpcmPGAIlNUge2mH4DSn+xX1sgGXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2410
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-GUID: e7jQiSG0ZPFJLx8gDlZZoIaHfr0Ra9Ld
X-Proofpoint-ORIG-GUID: e7jQiSG0ZPFJLx8gDlZZoIaHfr0Ra9Ld
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c       |  5 ++++
 hw/remote/vfio-user-obj.c | 55 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 3 files changed, 62 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index cbb2add291..645b54343d 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -22,6 +22,7 @@
 #include "hw/remote/iohub.h"
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
+#include "hw/remote/iommu.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -51,6 +52,10 @@ static void remote_machine_init(MachineState *machine)
 
     pci_host = PCI_HOST_BRIDGE(rem_host);
 
+    if (s->vfio_user) {
+        remote_iommu_setup(pci_host->bus);
+    }
+
     remote_iohub_init(&s->iohub);
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index cef473cb98..7b21f77052 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -284,6 +284,54 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("mem-%s-%"PRIx64"", o->device,
+                           (uint64_t)info->vaddr);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_add_subregion(dma_as->root, (hwaddr)iov->iov_base, subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return;
+    }
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_del_subregion(dma_as->root, mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -387,6 +435,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup DMA handlers for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884346..f945c7e33b 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
2.20.1


