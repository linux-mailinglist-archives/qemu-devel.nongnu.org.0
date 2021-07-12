Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB503C5070
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:46:05 +0200 (CEST)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tRs-0004Ob-Pj
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tJ6-0001nf-6q; Mon, 12 Jul 2021 06:37:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIy-00008z-Uk; Mon, 12 Jul 2021 06:36:58 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CAVccO021376; Mon, 12 Jul 2021 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=aDVTnIMhVqobBL591y8efZa80r2a3h30perjSqL0iqU=;
 b=OSLpw+dDcxCHRz0IjsEaVvmkNmqe+UY2f4VFlEztpcdSNUnotcGy0s61khenpGq+X8Se
 /siZX3bw7ERXPsGQppyaHMG7/m8wttsPb+h6i3pr4mCEelznkhOZ7aDFB8jwv+VnBsVI
 2s2KyxzBu0BQl47PXzN8PejfkvAaeMKG3Qguuc2G+5decRix+IWgln+JXq3wJj2N1BEa
 LTYzSobJoqk+WgLn5ayZpIoqyIQtKM9bB572rvEyenYnLC8sFCxS4kC+39wQxHrw/LvX
 fI50HZL0NZlqfEkhP81QCIqrGj789+VvHu3bWvD9/uNkqxyXfA8aAKiSuGp1PAEwvISM kA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39q35s2bw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CAabrQ181205;
 Mon, 12 Jul 2021 10:36:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3020.oracle.com with ESMTP id 39q3c6wn8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAV2r08nNEsSzXwtFkYRhkBcVpUDr43Fsh1c4I0qRRwHU+C95H1a7CEHaGOhO3w1yC7p2ANaozX+Q7U0UJ6EVwcTlr5FqmFOhlnhPCinENbRXHBoN7mhuKhchD2nGNmZETGEMWw6t/xGsExYi0vQox0VIf50gU1fUpvbMuQ6/AewpyrLpxBT2h+LZ9hjxl7Q7hYHWL+vyl8CRymLiPRrb83nwK5zsdeUFbvwt7JVL93U05ScacqlxdjBJqZncyaRmUX1ZfYRRiTBLa2xcXqzkjbXgGdMWHkStgqYFKlVXqZDwwCrJf4M/uq/SzHQni+SNS7nUPlTyQeq5ylnHGTT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDVTnIMhVqobBL591y8efZa80r2a3h30perjSqL0iqU=;
 b=Fi0U7xTIEDqCXDxaOb4w4lLVCbb80spd4FMUNFoT5D0+Chs70kDHdhZVX54U8Fq7tC0RT2M+3RVwbJ0G7ONGOHVQ7reZ/Pp2vxRcoTyGEO0ExXggSoJxWpdISSVtW4x8rSSHVD8HDoJNFkqlSMk59/cew9l7+AWQKqsen8guJR/WL5/RGsMR8Stp2EM4RrU9B99epJUzEFbgoFXEL2Fsrs5dRhudnX6I5TZp1dpjATvMLv7JYMAnDAnGwwZaioL2nr+e0LNrkGsi4rzAVId2JKqeV6vdTgkiB0uEz2KeeYwHQvegI6KlWhCf39AohFXzbPfTUQjYNQyqTb851Q8v1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDVTnIMhVqobBL591y8efZa80r2a3h30perjSqL0iqU=;
 b=QeSuoENWa/XQdjQECpElmN2eMAvzgJZ01QEgBHPbjq54LDXkLimnBrR7WmvkXAzSigKsqevFo9Sll2Avl0Q/nYAr3dRLHbIM4R/uHrWmYnOUwHYGXHuye3vW38Qk6priKbLHjaQdeixW493K/iGnkkKujLB+/uEPzEbtFO1qDQQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4584.namprd10.prod.outlook.com (2603:10b6:510:37::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 10:36:30 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:36:30 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/6] qmp: decode feature bits in virtio-status
Date: Mon, 12 Jul 2021 06:35:34 -0400
Message-Id: <1626086137-16292-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.41) by
 SN4PR0701CA0019.namprd07.prod.outlook.com (2603:10b6:803:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 10:36:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5c366dd-8c8c-40cf-6ec7-08d94520e8e3
X-MS-TrafficTypeDiagnostic: PH0PR10MB4584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB45848A4A629D058D2E8811ADE8159@PH0PR10MB4584.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QKvNTbHMOE/vusR5TNBWB3yJZfdOO5gDX+/MvBJoGRmXnLxUVhhZMCiKzdEf6ybmahZ8p6lpGZUNWzvkgB39ZJ8QDLvmkKzJk226QkxHGDzcvwN/HbVN1i8qISSnlKv/EmTca5oqd6UKOTv3pJT15/h2dLbU8TZWSjNcAhAR/mIwp27hlL50RuSEQM8h1BOG2po4Tq43zQygyFHKrth+98fpnrFpr2/Vpzz8g2ZqM/ppkFBjkWgjuT5P5L+nP4d5jrZGq8DLUKBSfo/4NpMdWotHwk+cWnD36LVdDxtD5E73UdUD+9N6N9sUnLq/4lLhrJpjtDzZ3o/TL67Nai/oE6BIunu16+tbJlTSivD8stGMpzhKmJU4MU4wN8tP7+dYsEuXMTFSjWFC5FfBVoE0QAaQNMqyTtXA1XrlLB1SeCpGBZA/frw/534ajWTJBA04v4tbjGBaZVlwt2vxWv8MoWFHXi2uLgij4nZd93YJybksDSxOjyAAIZtS1bq5MTV8hA3Ap7kBSNWeU3POfwkornYrxm0JWoyrDMuGAToGSuHwy1ym7JJZVzpr2ybuw7u2DzshYr6ovGEbP7hpwLJtrtTvD6dS821txGfKwAFWhJRZz4E/gigQT/g3r0Id+8tfnCjGSPwRBMxKfcJX6Zf9ko/EaGBZlc7lqT3UUWngopEzsMWgyaPli2G0crmW1OweSeuTMO4w3HUzRKhFI7mc5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(36756003)(6916009)(66476007)(66946007)(186003)(66556008)(6486002)(478600001)(30864003)(83380400001)(6666004)(7416002)(52116002)(8676002)(2616005)(8936002)(86362001)(2906002)(44832011)(38350700002)(38100700002)(26005)(7696005)(956004)(4326008)(316002)(5660300002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hv2gACZXKQt764AGt+/WGTV8DQOiKjpMJxtJv8Abp1jXMO6F8HwZ1XG1nk2g?=
 =?us-ascii?Q?59ecMJTJvSiIhYdlGSZ7/30h+4qdkgVaO+TfywO8uQVATQPe3s4HDJ7v3jaT?=
 =?us-ascii?Q?2/NU2+RlTDgkoD66zXjpiEARPgePLheI2D0JpSGLxsNMJo0MjnfOTaYKRWdj?=
 =?us-ascii?Q?9zyWf6EJ4JcgtOEgHsUmxIZD5KVvdaacq25hEvtQB6itKsehv4Dmv0Srk8Ch?=
 =?us-ascii?Q?JvnA2ZSfxgODUMfwXb9ZvGGO8712DXVCmGjZjOsYC8Vgdas+FglZRokqq6sG?=
 =?us-ascii?Q?C2ST2r69KNphcSimcVs1rA/mWFdvf68OHG5kMaeZaRmt0R2NuKu0txDesJC8?=
 =?us-ascii?Q?t+fDhb3nptyhe39F1uAvQ24yBN+OhOPau1wwEqwaNUsoVfvORdYH/a5ERumg?=
 =?us-ascii?Q?nv5CQk3ndC4wz1AI4bY6KSQAbnHQu4/h9JZ+OOcr89sk/Pl6ifuUODfNQCLY?=
 =?us-ascii?Q?Sj7VPdyRP0poTSFjlcoX3120IbPlzbhjZZyBURwTA9LFUdfvJzC+S2Q4hcpT?=
 =?us-ascii?Q?+MBguBDxmcVV1+ffeiZsGJsWSUcZDRGGQO/1tq5X40ChH2URff60BBFOEISj?=
 =?us-ascii?Q?OxtklwFRUVwujJL43A3uy14txe0+gY1vaOjFEo4w8HTQCU6Us/723W4sbJ6V?=
 =?us-ascii?Q?FJrG7AEXL0C+oOXQ9AtPGP+MH1QKrZtnuPYhOSpEBXfEcwETTg/6IKXTaNvQ?=
 =?us-ascii?Q?/VGKsJqXNBE8N9C2lbjLeAGAOyYiZMk41lMqe1r3FnIr+vtNTNDVvnAPIOBM?=
 =?us-ascii?Q?TBSD176q9T9MLe6nfH6oa8N+wcvisD87aBKAbVBnkG5yqst1hrUYlRh9wHuZ?=
 =?us-ascii?Q?1e7h/VUfV2UNJTuMuU4VtafWrpP1xFGL5DqbBK3GJJFBUKRkieTfPD3S+NVh?=
 =?us-ascii?Q?wjpvf/YGp1Bkh3yIoXIDCGmPvEq/K5cHTsyMjSdp2ddKF+bgOxZvy7bre5Ar?=
 =?us-ascii?Q?7oB8prQ7kwTVJITeolIqHD1mDcQpz9vzxHoGDlLAi0QH9QPhJPviTntjGpCr?=
 =?us-ascii?Q?MniUI20ngI0KC0WwMkozMB569Bo1citm3tJEUn1HDxBRFLVW8iMzLmtcQMEs?=
 =?us-ascii?Q?VHj9MbLGB7FoMmlJ4GonqYuUFO9jqxBFKcFeqePMJZia5JQnYq3JHvAqSCc4?=
 =?us-ascii?Q?p8m3+O7qxdm5bmu3a2Azi5+uzoCBirCJ1YDI+4sFtbvkq+rYEhbv1/hdqsCx?=
 =?us-ascii?Q?+MehCopNQkx9We+quvheg/8X/jRQxJZ10XrR8TibLp9r3uH4Cr5lUk5EAiwg?=
 =?us-ascii?Q?Fx79YCd0rwu3YqUPXKy5jTxVFs7c7qAhOTI2nAPj/wtxiqeq9d3vYk7Mfihw?=
 =?us-ascii?Q?F6hLWan094zGmW2xDPPY6vvl?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c366dd-8c8c-40cf-6ec7-08d94520e8e3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:36:29.9897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yam57dzSysf371XSzgKwtT8EoNu+Wec3MnwuaSnhrrhHCfEnwRuspT1HzwpkP460U4bwh9uONuU4JoLoxCdq9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4584
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10042
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120082
X-Proofpoint-GUID: 2ZAUgQtPApaQhmp3iAa350IJt7uvOQEV
X-Proofpoint-ORIG-GUID: 2ZAUgQtPApaQhmp3iAa350IJt7uvOQEV
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Display feature names instead of a features bitmap for host, guest,
and backend.

Decode features according to device type, transport features are
on the first line. Undecoded bits (if any) are stored in a separate
field.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/virtio-blk.c        |  23 ++++
 hw/char/virtio-serial-bus.c  |  11 ++
 hw/display/virtio-gpu-base.c |  12 ++
 hw/net/virtio-net.c          |  38 ++++++
 hw/scsi/virtio-scsi.c        |  12 ++
 hw/virtio/virtio-balloon.c   |  14 +++
 hw/virtio/virtio-iommu.c     |  14 +++
 hw/virtio/virtio.c           | 129 +++++++++++++++++++-
 include/hw/virtio/virtio.h   |  13 ++
 qapi/virtio.json             | 280 +++++++++++++++++++++++++++++++++++++++++--
 10 files changed, 533 insertions(+), 13 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7..e66c5eb 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -48,6 +49,28 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
+qmp_virtio_feature_map_t blk_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BLK_F_##name, VIRTIO_BLK_FEATURE_##name }
+    FEATURE_ENTRY(SIZE_MAX),
+    FEATURE_ENTRY(SEG_MAX),
+    FEATURE_ENTRY(GEOMETRY),
+    FEATURE_ENTRY(RO),
+    FEATURE_ENTRY(BLK_SIZE),
+    FEATURE_ENTRY(TOPOLOGY),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(DISCARD),
+    FEATURE_ENTRY(WRITE_ZEROES),
+#ifndef VIRTIO_BLK_NO_LEGACY
+    FEATURE_ENTRY(BARRIER),
+    FEATURE_ENTRY(SCSI),
+    FEATURE_ENTRY(FLUSH),
+    FEATURE_ENTRY(CONFIG_WCE),
+#endif /* !VIRTIO_BLK_NO_LEGACY */
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
 {
     s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index dd6bc27..4a626e6 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -32,6 +33,16 @@
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-access.h"
 
+qmp_virtio_feature_map_t serial_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_CONSOLE_F_##name, VIRTIO_SERIAL_FEATURE_##name }
+    FEATURE_ENTRY(SIZE),
+    FEATURE_ENTRY(MULTIPORT),
+    FEATURE_ENTRY(EMERG_WRITE),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static struct VirtIOSerialDevices {
     QLIST_HEAD(, VirtIOSerial) devices;
 } vserdevices;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index dd29427..34c1ead 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -16,9 +16,21 @@
 #include "hw/virtio/virtio-gpu.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t gpu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_GPU_F_##name, VIRTIO_GPU_FEATURE_##name }
+    FEATURE_ENTRY(VIRGL),
+    FEATURE_ENTRY(EDID),
+    FEATURE_ENTRY(RESOURCE_UUID),
+    FEATURE_ENTRY(RESOURCE_BLOB),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 void
 virtio_gpu_base_reset(VirtIOGPUBase *g)
 {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cd..0a05fe6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -35,6 +35,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-events-migration.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/virtio/virtio-access.h"
 #include "migration/misc.h"
 #include "standard-headers/linux/ethtool.h"
@@ -89,6 +90,43 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
+qmp_virtio_feature_map_t net_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_NET_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(CSUM),
+    FEATURE_ENTRY(GUEST_CSUM),
+    FEATURE_ENTRY(CTRL_GUEST_OFFLOADS),
+    FEATURE_ENTRY(MTU),
+    FEATURE_ENTRY(MAC),
+    FEATURE_ENTRY(GUEST_TSO4),
+    FEATURE_ENTRY(GUEST_TSO6),
+    FEATURE_ENTRY(GUEST_ECN),
+    FEATURE_ENTRY(GUEST_UFO),
+    FEATURE_ENTRY(HOST_TSO4),
+    FEATURE_ENTRY(HOST_TSO6),
+    FEATURE_ENTRY(HOST_ECN),
+    FEATURE_ENTRY(HOST_UFO),
+    FEATURE_ENTRY(MRG_RXBUF),
+    FEATURE_ENTRY(STATUS),
+    FEATURE_ENTRY(CTRL_VQ),
+    FEATURE_ENTRY(CTRL_RX),
+    FEATURE_ENTRY(CTRL_VLAN),
+    FEATURE_ENTRY(CTRL_RX_EXTRA),
+    FEATURE_ENTRY(GUEST_ANNOUNCE),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(CTRL_MAC_ADDR),
+    FEATURE_ENTRY(HASH_REPORT),
+    FEATURE_ENTRY(RSS),
+    FEATURE_ENTRY(RSC_EXT),
+    FEATURE_ENTRY(STANDBY),
+    FEATURE_ENTRY(SPEED_DUPLEX),
+#ifndef VIRTIO_NET_NO_LEGACY
+    FEATURE_ENTRY(GSO),
+#endif /* VIRTIO_NET_NO_LEGACY */
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 6d80730..8187dc3 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "migration/qemu-file-types.h"
@@ -29,6 +30,17 @@
 #include "hw/virtio/virtio-access.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t scsi_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_SCSI_F_##name, VIRTIO_SCSI_FEATURE_##name }
+    FEATURE_ENTRY(INOUT),
+    FEATURE_ENTRY(HOTPLUG),
+    FEATURE_ENTRY(CHANGE),
+    FEATURE_ENTRY(T10_PI),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static inline int virtio_scsi_get_lun(uint8_t *lun)
 {
     return ((lun[2] << 8) | lun[3]) & 0x3FFF;
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 4b5d9e5..4bc05de 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "migration/misc.h"
@@ -34,6 +35,19 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 
+qmp_virtio_feature_map_t balloon_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BALLOON_F_##name, VIRTIO_BALLOON_FEATURE_##name }
+    FEATURE_ENTRY(MUST_TELL_HOST),
+    FEATURE_ENTRY(STATS_VQ),
+    FEATURE_ENTRY(DEFLATE_ON_OOM),
+    FEATURE_ENTRY(FREE_PAGE_HINT),
+    FEATURE_ENTRY(PAGE_POISON),
+    FEATURE_ENTRY(REPORTING),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
 
 typedef struct PartiallyBalloonedPage {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e..6deddcb 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -25,6 +25,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
@@ -36,6 +37,19 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci.h"
 
+qmp_virtio_feature_map_t iommu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_IOMMU_F_##name, VIRTIO_IOMMU_FEATURE_##name }
+    FEATURE_ENTRY(INPUT_RANGE),
+    FEATURE_ENTRY(DOMAIN_RANGE),
+    FEATURE_ENTRY(MAP_UNMAP),
+    FEATURE_ENTRY(BYPASS),
+    FEATURE_ENTRY(PROBE),
+    FEATURE_ENTRY(MMIO),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 222330a..81a0ee8 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -30,9 +30,32 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include CONFIG_DEVICES
 
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
+static qmp_virtio_feature_map_t transport_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+#ifndef VIRTIO_CONFIG_NO_LEGACY
+    FEATURE_ENTRY(NOTIFY_ON_EMPTY),
+    FEATURE_ENTRY(ANY_LAYOUT),
+#endif /* VIRTIO_CONFIG_NO_LEGACY */
+    FEATURE_ENTRY(VERSION_1),
+    FEATURE_ENTRY(IOMMU_PLATFORM),
+    FEATURE_ENTRY(RING_PACKED),
+    FEATURE_ENTRY(ORDER_PLATFORM),
+    FEATURE_ENTRY(SR_IOV),
+    FEATURE_ENTRY(BAD_FEATURE),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_RING_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(INDIRECT_DESC),
+    FEATURE_ENTRY(EVENT_IDX),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3912,6 +3935,103 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+#define CONVERT_FEATURES(type, map)                \
+    ({                                           \
+        type *list = NULL;                         \
+        type *node;                                \
+        for (i = 0; map[i].virtio_bit != -1; i++) {\
+            bit = 1ULL << map[i].virtio_bit;       \
+            if ((bitmap & bit) == 0) {             \
+                continue;                          \
+            }                                      \
+            node = g_new0(type, 1);                \
+            node->value = map[i].qapi_virtio_enum; \
+            node->next = list;                     \
+            list = node;                           \
+            bitmap ^= bit;                         \
+        }                                          \
+        list;                                      \
+    })
+
+static VirtioDeviceFeatures *qmp_decode_features(const char *name,
+                                                 uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+
+    /* transport features */
+    features->transport = CONVERT_FEATURES(VirtioTransportFeatureList, \
+                                           transport_map);
+
+    /* device features */
+    features->type = qapi_enum_parse(&VirtioType_lookup,
+                                     name, -1, NULL);
+    switch (features->type) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        features->u.virtio_serial.features =
+                          CONVERT_FEATURES(VirtioSerialFeatureList, serial_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        features->u.virtio_blk.features =
+                                CONVERT_FEATURES(VirtioBlkFeatureList, blk_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        features->u.virtio_gpu.features =
+                                CONVERT_FEATURES(VirtioGpuFeatureList, gpu_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_TYPE_VIRTIO_NET:
+        features->u.virtio_net.features =
+                                CONVERT_FEATURES(VirtioNetFeatureList, net_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        features->u.virtio_scsi.features =
+                              CONVERT_FEATURES(VirtioScsiFeatureList, scsi_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        features->u.virtio_balloon.features =
+                        CONVERT_FEATURES(VirtioBalloonFeatureList, balloon_map);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        features->u.virtio_iommu.features =
+                            CONVERT_FEATURES(VirtioIommuFeatureList, iommu_map);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_TYPE_VIRTIO_9P:
+    case VIRTIO_TYPE_VIRTIO_INPUT:
+    case VIRTIO_TYPE_VHOST_USER_FS:
+    case VIRTIO_TYPE_VHOST_VSOCK:
+    case VIRTIO_TYPE_VIRTIO_CRYPTO:
+    case VIRTIO_TYPE_VIRTIO_PMEM:
+    case VIRTIO_TYPE_VIRTIO_RNG:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    features->has_unknown_features = bitmap != 0;
+    if (features->has_unknown_features) {
+        features->unknown_features = bitmap;
+    }
+
+    return features;
+}
+
 VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
 {
     VirtIODevice *vdev;
@@ -3924,9 +4044,12 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
     }
 
     status = g_new0(VirtioStatus, 1);
-    status->guest_features = vdev->guest_features;
-    status->host_features = vdev->host_features;
-    status->backend_features = vdev->backend_features;
+    status->guest_features = qmp_decode_features(vdev->name,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->name,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->name,
+                                                   vdev->backend_features);
     status->device_id = vdev->device_id;
 
     switch (vdev->device_endian) {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f7da326..b872dcf 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -163,6 +163,19 @@ struct VirtioDeviceClass {
     bool (*primary_unplug_pending)(void *opaque);
 };
 
+typedef struct {
+    int virtio_bit;
+    int qapi_virtio_enum;
+} qmp_virtio_feature_map_t;
+
+extern qmp_virtio_feature_map_t serial_map[];
+extern qmp_virtio_feature_map_t blk_map[];
+extern qmp_virtio_feature_map_t gpu_map[];
+extern qmp_virtio_feature_map_t net_map[];
+extern qmp_virtio_feature_map_t scsi_map[];
+extern qmp_virtio_feature_map_t balloon_map[];
+extern qmp_virtio_feature_map_t iommu_map[];
+
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 4bd09c9..78873cd 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -83,6 +83,253 @@
 }
 
 ##
+# @VirtioTransportFeature:
+#
+# An enumeration of Virtio device transport features, including virtio-ring
+#
+# Since: 6.1
+##
+
+{ 'enum': 'VirtioTransportFeature',
+  'data': [ 'notify-on-empty', 'any-layout', 'version-1', 'iommu-platform',
+            'ring-packed', 'order-platform', 'sr-iov', 'indirect-desc',
+            'event-idx', 'bad-feature' ]
+}
+
+##
+# @VirtioSerialFeature:
+#
+# An enumeration of Virtio serial features
+#
+# Since: 6.1
+##
+
+{ 'enum': 'VirtioSerialFeature',
+  'data': [ 'size', 'multiport', 'emerg-write' ]
+}
+
+##
+# @VirtioBlkFeature:
+#
+# An enumeration of Virtio block features
+#
+# Since: 6.1
+##
+
+{ 'enum': 'VirtioBlkFeature',
+  'data': [ 'size-max', 'seg-max', 'geometry', 'ro', 'blk-size', 'topology',
+            'mq', 'discard', 'write-zeroes', 'barrier', 'scsi', 'flush',
+            'config-wce' ]
+}
+
+##
+# @VirtioGpuFeature:
+#
+# An enumeration of Virtio gpu features
+#
+# Since: 6.1
+##
+
+{ 'enum': 'VirtioGpuFeature',
+  'data': [ 'virgl', 'edid', 'resource-uuid', 'resource-blob' ]
+}
+
+##
+# @VirtioNetFeature:
+#
+# An enumeration of Virtio net features
+#
+# Since: 6.1
+##
+
+{ 'enum': 'VirtioNetFeature',
+  'data': [ 'csum', 'guest-csum', 'ctrl-guest-offloads', 'mtu', 'mac',
+            'guest-tso4', 'guest-tso6', 'guest-ecn', 'guest-ufo',
+            'host-tso4', 'host-tso6', 'host-ecn', 'host-ufo', 'mrg-rxbuf',
+            'status', 'ctrl-vq', 'ctrl-rx', 'ctrl-vlan', 'ctrl-rx-extra',
+            'guest-announce', 'mq', 'ctrl-mac-addr', 'standby',
+            'speed-duplex', 'gso', 'hash-report', 'rss', 'rsc-ext' ]
+}
+
+##
+# @VirtioScsiFeature:
+#
+# An enumeration of Virtio scsi features
+#
+# Since: 6.1
+##
+
+{ 'enum': 'VirtioScsiFeature',
+  'data': [ 'inout', 'hotplug', 'change', 't10-pi' ]
+}
+
+##
+# @VirtioBalloonFeature:
+#
+# An enumeration of Virtio balloon features
+#
+# Since: 6.1
+##
+
+{ 'enum': 'VirtioBalloonFeature',
+  'data': [ 'must-tell-host', 'stats-vq', 'deflate-on-oom', 'free-page-hint',
+            'page-poison', 'reporting' ]
+}
+
+##
+# @VirtioIommuFeature:
+#
+# An enumeration of Virtio iommu features
+#
+# Since: 6.1
+##
+
+{ 'enum': 'VirtioIommuFeature',
+  'data': [ 'input-range', 'domain-range', 'map-unmap', 'bypass', 'probe',
+            'mmio' ]
+}
+
+##
+# @VirtioDeviceFeaturesBase:
+#
+# The common fields that apply to all Virtio devices
+#
+# @type: virtio device type
+# @transport: the list of transport features of the virtio device
+# @unknown-features: virtio device features bitmap that have not been decoded
+#
+# Since: 6.1
+##
+
+{ 'struct': 'VirtioDeviceFeaturesBase',
+  'data': {
+    'type': 'VirtioType',
+    'transport': [ 'VirtioTransportFeature' ],
+    '*unknown-features': 'uint64'
+  }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsSerial:
+#
+# The options that apply to Virtio serial device
+#
+# @features: List of the device features
+#
+# Since: 6.1
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsSerial',
+  'data': { 'features': [ 'VirtioSerialFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsBlk:
+#
+# The options that apply to Virtio block device
+#
+# @features: List of the device features
+#
+# Since: 6.1
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBlk',
+  'data': { 'features': [ 'VirtioBlkFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsGpu:
+#
+# The options that apply to Virtio GPU device
+#
+# @features: List of the device features
+#
+# Since: 6.1
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsGpu',
+  'data': { 'features': [ 'VirtioGpuFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsNet:
+#
+# The options that apply to Virtio net device
+#
+# @features: List of the device features
+#
+# Since: 6.1
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsNet',
+  'data': { 'features': [ 'VirtioNetFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsScsi:
+#
+# The options that apply to Virtio SCSI device
+#
+# @features: List of the device features
+#
+# Since: 6.1
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsScsi',
+  'data': { 'features': [ 'VirtioScsiFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsBalloon:
+#
+# The options that apply to Virtio balloon device
+#
+# @features: List of the device features
+#
+# Since: 6.1
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBalloon',
+  'data': { 'features': [ 'VirtioBalloonFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsIommu:
+#
+# The options that apply to Virtio IOMMU device
+#
+# @features: List of the device features
+#
+# Since: 6.1
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsIommu',
+  'data': { 'features': [ 'VirtioIommuFeature' ] }
+}
+
+##
+# @VirtioDeviceFeatures:
+#
+# A union to define the list of features for a virtio device
+#
+# Since: 6.1
+##
+
+{ 'union': 'VirtioDeviceFeatures',
+  'base': 'VirtioDeviceFeaturesBase',
+  'discriminator': 'type',
+  'data': {
+    'virtio-serial': 'VirtioDeviceFeaturesOptionsSerial',
+    'virtio-blk': 'VirtioDeviceFeaturesOptionsBlk',
+    'virtio-gpu': 'VirtioDeviceFeaturesOptionsGpu',
+    'virtio-net': 'VirtioDeviceFeaturesOptionsNet',
+    'virtio-scsi': 'VirtioDeviceFeaturesOptionsScsi',
+    'virtio-balloon': 'VirtioDeviceFeaturesOptionsBalloon',
+    'virtio-iommu': 'VirtioDeviceFeaturesOptionsIommu'
+  }
+}
+
+##
 # @VirtioStatus:
 #
 # @device-id: VirtIODevice status
@@ -105,9 +352,9 @@
   'data': {
     'device-id': 'int',
     'device-endian': 'VirtioStatusEndianness',
-    'guest-features': 'uint64',
-    'host-features': 'uint64',
-    'backend-features': 'uint64',
+    'guest-features': 'VirtioDeviceFeatures',
+    'host-features': 'VirtioDeviceFeatures',
+    'backend-features': 'VirtioDeviceFeatures',
     'num-vqs': 'uint16'
   }
 }
@@ -127,18 +374,31 @@
 #
 # -> { "execute": "x-debug-virtio-status",
 #      "arguments": {
-#          "path": "/machine/peripheral-anon/device[3]/virtio-backend"
+#          "path": "/machine/peripheral-anon/device[1]/virtio-backend"
 #      }
 #   }
 # <- { "return": {
-#          "backend-features": 0,
-#          "guest-features": 5111807911,
-#          "num-vqs": 3,
-#          "host-features": 6337593319,
 #          "device-endian": "little",
-#          "device-id": 1
+#          "device-id": 3,
+#          "backend-features": {
+#              "transport": [],
+#              "type": "virtio-serial",
+#              "features": []
+#          },
+#          "num-vqs": 64,
+#          "guest-features": {
+#              "transport": [ "event-idx", "indirect-desc", "version-1" ],
+#              "type": "virtio-serial",
+#              "features": [ "multiport" ]
+#          },
+#          "host-features": {
+#              "transport": [ "event-idx", "indirect-desc", "bad-feature",
+#                             "version-1", "any-layout", "notify-on-empty" ],
+#              "type": "virtio-serial",
+#              "features": [ "emerg-write", "multiport" ]
+#          }
 #      }
-#    }
+#  }
 #
 ##
 
-- 
1.8.3.1


