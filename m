Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2395C43C8EB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:55:06 +0200 (CEST)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhWK-0000tl-Uz
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKd-0001Ed-Pb; Wed, 27 Oct 2021 07:42:59 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKZ-00070M-Iz; Wed, 27 Oct 2021 07:42:57 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBgA0o012296; 
 Wed, 27 Oct 2021 11:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=EDyhOHnSSI0eU3CG7KUElf1bCePkvnpBTxbzpPGgmUY=;
 b=TVSud83aRoMcHdEllFTdm0gEq9u450YPpLIzGNXAP6JGC9YQrquMXXxHjQl2+lWiRCYz
 v+kOMRXFeMSCD0cyGo2xb4COAwCSchipgA47rcmeuuPhsOZ5/WIPBw/H3/1jGdkHYiuT
 xHihBR2Rp340Ibks6aqn33I7VHcZFFlK0zAweifY2yHisxcLWpT8xSdQyu+KCPEBP5gm
 nIOLbo9MHo10f1APtjryXWHSiLJyuQQVsx73KWwZfD7XeZ65ALrjHdrmoSfMAEwT0kQb
 mKU6bIfhy4Xp47XpYrdJkeNfEVIqyE/nSxNhprbP34romdOFfv5a+4mbYnRYDjW3NmLZ +g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fg1uvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RBfYVs006996;
 Wed, 27 Oct 2021 11:42:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3020.oracle.com with ESMTP id 3bx4gcjgyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg3rEzGrGkIsiZWl+We7FHSO51aMWBhDSuKmgz7aWYLBS336fyE66nqn9FVvVzcisKRQO3AnEvdN5wnYNj7y9ouyjkZ8hOvea+fPVT1swXq9/izmvEwPIFt3cyERqN+1kuD2vIvoALx2yARZ5ajors2551KiELN1BDc8P8+VBrnrFZ15ZTj69abgjgwGEx3Eavn0NIRfx53ZhYSjIcK59HLDT7ZalCzJJwf4N6hJxijrNmfy608XoXZg4HRUkj4EocxRsWvUiI3NrynfoWl2ndwW1+1HX049ayg0Oerd6MsLs/o9IxpsYEfj/fNiLhsvXNqKcg97giXG+4gKYgzF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDyhOHnSSI0eU3CG7KUElf1bCePkvnpBTxbzpPGgmUY=;
 b=XakB75yoR0jUNJwvCc7g9qj26tytbcNIw7zWmbJ+fnjY1Q0IEY/H0xQBweGihltWFh53DoW6oi+Iwi/BVOeaxnQg+ksGhO44Py8SWDe2TlPf6HlW4aE0OqyVHFCGZ10w8NdjM7O6MZtTZcCN5G+3pOcaV8ImgBRy1LF1/30O1oFPwoUm7/lr8rGhfp2TbPHQno3bg86vtFYV82C1ypiSC5M9BjqNl3Vktrn8rzdYHm4dm6PZqfPN+fM35ou2a08eZHKQuKFfQiKMWkbtT7agCsDtBDlqF5CvDiIifTOp8PUW3XMc4CFqG+vbfiiBKX59HgtuE5UIg+zOyHspDiZ2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDyhOHnSSI0eU3CG7KUElf1bCePkvnpBTxbzpPGgmUY=;
 b=ircTNDSyexiAHd2QECBah411qazM2OgfjioMxb6VaufH577Kb/DH0jkEiateH9nhO4TssgZ6dvs7FVgf1PETaXc4un2fSai4gsc/nLmx+aL+Dl/QL4Qp/2FGwQ3GTgxeLcTR6i5fulL0EASBKGNuZiDEtOAJBCcS3NDeYiPl3wk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:42:34 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:42:34 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 2/8] virtio: add vhost support for virtio devices
Date: Wed, 27 Oct 2021 07:41:43 -0400
Message-Id: <1635334909-31614-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.40) by
 SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Wed, 27 Oct 2021 11:42:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd00cdfb-f1b3-4800-0943-08d9993eddf8
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB474484894C20A66D502AA286E8859@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXTeQMeTMAG9J4htTtg6z0xVGN1W5fTUb9c/h30L1bafz8KJMOU5D5at5F7zNfLIWp7oduE1PJaV/husvOhfLhjRk/PeEE18m+LeUemanHly4PRj5ICk2tHcq3rVtCnTg4aTBe47dxu0xDrW7t+vZMNh07+8e6cylO0nZ7TL/jfbwdgux/hPk1vqp9zHUpJDtQk1UvENmitNKNGg3VVvlM+0vh1equPR96VwvtV8VRE0YQsi2NUVUek/fN0KDtUw0kfLZHqLZs5EJKP5p2siOs5GG8CkKKjcjKrb3VWhvwzPGxaL55dcXtglw5eN2DMwrIOkL/MQcWTlGI0MgVNLiMBB+gdh2AZnJKf6/tfNdUdhb+o/vIaOZW6+0NuLmv9wve8i0a9OW3WJVHLmr3VQqyTlptWUxuYgzKSpwQ7uIVh8Vq9MWHctxcLZ15WNb4e6NXtW3Pv8TdqnNCbGiSv3kPA85XExlYHrNSkjYUhzLylrKVpLC5Sbg3ZIvQqVU8JmaStB6SrXZfGpzAssKabazSYzJ9M1A4PdN5hBQkVm5UDLz/KoNhlWq1l5LpqG69jzU2HVBuQBhjKSTgLlUkbff3jo3YiDGF7UC1/hcous0MpwfiWLcnsfj8Yve/xq/A7Y31a78zG5F0OSbY15x/WBMUZr8628st/9mk0M54DuAZArNq+y3PpcQFO9mCHJOSjl5O1un+i2ok9xF4vmQ5wikw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(44832011)(26005)(4326008)(316002)(38350700002)(38100700002)(8936002)(6916009)(956004)(36756003)(2616005)(2906002)(30864003)(86362001)(83380400001)(7416002)(5660300002)(52116002)(508600001)(6666004)(8676002)(186003)(66946007)(6486002)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N09EwU5L9F4hBH7BVEhPCt7aJglxpalONbaG+jJ1X/GgVkWOrJU5z97c42gr?=
 =?us-ascii?Q?8sb3mOuBFcN0yfmm3YZ/nZvnJJn4BJv+uQflHW5q5PIqOOGjJkaLXtxMCyKT?=
 =?us-ascii?Q?4ftf85zk97ilV+GZt0PDHDmte5OnlbWmtCWe0frDF6k0E/qPGxU2HZiFDl5k?=
 =?us-ascii?Q?AbFMvTHcc0rsrJCByzPqEkvRPgmSfQ+Doi7e3hidQPxV5iXySfHtUyAPWjBx?=
 =?us-ascii?Q?9vDjk+2mV3uytb4lYNR3GS90Z47yuh8yYslTM+lrgG2mFQBOYeab5sWiN+x3?=
 =?us-ascii?Q?duvTP5l4mvLnfEyFEBGtqX2KCZ/ptOQaQCD7nFzvu4rVHOCh0llXEXcgHG4O?=
 =?us-ascii?Q?z/PDHdu1DwrAqLVRbCaZgK5nGeLHDx7GnWERJC5/iX3saZP8+SZkd3zzQQZk?=
 =?us-ascii?Q?EvzXr3sC2wFXeXy/owPzQKf+l8LT2x87M9dPVHpfgZtkaBaKkKT+5p2fLD60?=
 =?us-ascii?Q?JYh6Ht+JT/oiuIup0n5CV60TMxGQKVVdBe01HAT9lA1DIsxV+7ORTglZqo7M?=
 =?us-ascii?Q?LFXpjUdaXSCVXdeYA97zFiCuEh7QRIfQJICi7HxGjOHZxxL/LdR+HqZHFb0e?=
 =?us-ascii?Q?wZgngXtCHdEye1PZynjoODZHe7LisRf7LYdcJ4MFW6u7glasaMb8KtVMRhqK?=
 =?us-ascii?Q?NlcbgrOcqS5hnjim9A2j/XhnyKgZCP6XQcyNLVCCmMcZs5y0WXKQFkQt7X6X?=
 =?us-ascii?Q?8SGY5b8zBgBqw389aBhL36w+kIhZ2Kvzr9OJ7hRu+1T/Z235NQtxag0yCYB3?=
 =?us-ascii?Q?IJhH9E6TGzESN6/b6trZFPuwghhmeg5C7EWAGzctKneVmBsj0sR2ot7q11n+?=
 =?us-ascii?Q?BYN7XYoUz4wAhzZwpWsW82HNzSX5ERcS0/db+Uo9zuQxlhQaZ1PhbabG4ohT?=
 =?us-ascii?Q?t/laMCXdpb0YDNOFfmP4AYHfEOagJvglcGtywwmO6zzn0RnUXRcZdbCLr50f?=
 =?us-ascii?Q?SvrOQVbPA/WSzkh9cCCVb9bbVTBofaD/oNebJX6sIqJi14Z5huE7RPVS2X3H?=
 =?us-ascii?Q?kop3aFHY0Df0/8gH90/nIeLimCaLfacNGt/FgYkPWwViOWSy/OvG2E+VRbWI?=
 =?us-ascii?Q?rhLIJhcX7i+LYF1rlHFuu/k2OS0KBYJCX3L/aGq7XhHKvULNkFJeZLic4RGk?=
 =?us-ascii?Q?mvewsA06D1yEBClYO4heSw+II3ctKokmKBkc5l5ZqwD+rbgDWTOmhKWE3Zdx?=
 =?us-ascii?Q?IQ+DfGTkzDf01RrnydvSxN75iQpDT+OZsWxXTFccaqXR8p+cjM7YLUA3iM2y?=
 =?us-ascii?Q?Gl9gJn+pqWGlcsCEbWtFgU+/UUgGn26onU6JIsR5hHm44GeRRu+eQGaY1v31?=
 =?us-ascii?Q?4Za2SsZ/O50UdLC4c0pjp+ZXdbsciRJZUc1xHJWyqAa0zupkmWgUkIZE0qb3?=
 =?us-ascii?Q?TAtw5vO0f56Hh9Ru/RdSFC6JeDbQFkowtiC16XBTpNgMy3sKNRs9UZZJFavX?=
 =?us-ascii?Q?nJ0F+B53OcC9jcT2+4vyUaz8YSwG6BFKR6Gfc+NaQWdWn+piPf5asaiIrbKL?=
 =?us-ascii?Q?gFudLskG8BmLrLsu6b23VyWzVlj+zNeqacZBxGO9jh5dFtUcEwqEIqdF0CMM?=
 =?us-ascii?Q?a8Wl8JcYI+Y/csr6Ifrmj6kMwc5MiG4iu8+e0BDGWd1YqLLH1HpKQSBpNHU1?=
 =?us-ascii?Q?DCmZB4Pfn9hcC/4dzXqETkY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd00cdfb-f1b3-4800-0943-08d9993eddf8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:42:34.2241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1P7z0wSEZfNLtfB4MYuDD2LVc5lz+k0oGCWdvQKADDD5kOu0HGRja8xEFxAztuMNi7sM3x3+Mjbaup27C+sr7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270071
X-Proofpoint-ORIG-GUID: bMKpR8NVABTyq3vQV3bgoEHvPBgkZkXO
X-Proofpoint-GUID: bMKpR8NVABTyq3vQV3bgoEHvPBgkZkXO
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a get_vhost() callback function for VirtIODevices that
returns the device's corresponding vhost_dev structure if the vhost
device is running. This patch also adds a vhost_started flag for VirtIODevices.

Previously, a VirtIODevice wouldn't be able to tell if its corresponding
vhost device was active or not.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/vhost-user-blk.c      |  7 +++++++
 hw/display/vhost-user-gpu.c    |  7 +++++++
 hw/input/vhost-user-input.c    |  7 +++++++
 hw/net/virtio-net.c            |  9 +++++++++
 hw/scsi/vhost-scsi.c           |  8 ++++++++
 hw/virtio/vhost-user-fs.c      |  7 +++++++
 hw/virtio/vhost-user-rng.c     |  7 +++++++
 hw/virtio/vhost-vsock-common.c |  7 +++++++
 hw/virtio/vhost.c              |  3 +++
 hw/virtio/virtio-crypto.c      | 10 ++++++++++
 hw/virtio/virtio.c             |  1 +
 include/hw/virtio/virtio.h     |  3 +++
 12 files changed, 76 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index f61f8c1..b059da1 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -568,6 +568,12 @@ static void vhost_user_blk_instance_init(Object *obj)
                                   "/disk@0,0", DEVICE(obj));
 }
 
+static struct vhost_dev *vhost_user_blk_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    return &s->dev;
+}
+
 static const VMStateDescription vmstate_vhost_user_blk = {
     .name = "vhost-user-blk",
     .minimum_version_id = 1,
@@ -602,6 +608,7 @@ static void vhost_user_blk_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_user_blk_get_features;
     vdc->set_status = vhost_user_blk_set_status;
     vdc->reset = vhost_user_blk_reset;
+    vdc->get_vhost = vhost_user_blk_get_vhost;
 }
 
 static const TypeInfo vhost_user_blk_info = {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 49df56c..6e93b46 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -565,6 +565,12 @@ vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
     g->vhost_gpu_fd = -1;
 }
 
+static struct vhost_dev *vhost_user_gpu_get_vhost(VirtIODevice *vdev)
+{
+    VhostUserGPU *g = VHOST_USER_GPU(vdev);
+    return &g->vhost->dev;
+}
+
 static Property vhost_user_gpu_properties[] = {
     VIRTIO_GPU_BASE_PROPERTIES(VhostUserGPU, parent_obj.conf),
     DEFINE_PROP_END_OF_LIST(),
@@ -586,6 +592,7 @@ vhost_user_gpu_class_init(ObjectClass *klass, void *data)
     vdc->guest_notifier_pending = vhost_user_gpu_guest_notifier_pending;
     vdc->get_config = vhost_user_gpu_get_config;
     vdc->set_config = vhost_user_gpu_set_config;
+    vdc->get_vhost = vhost_user_gpu_get_vhost;
 
     device_class_set_props(dc, vhost_user_gpu_properties);
 }
diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
index 273e96a..43d2ff3 100644
--- a/hw/input/vhost-user-input.c
+++ b/hw/input/vhost-user-input.c
@@ -79,6 +79,12 @@ static void vhost_input_set_config(VirtIODevice *vdev,
     virtio_notify_config(vdev);
 }
 
+static struct vhost_dev *vhost_input_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserInput *vhi = VHOST_USER_INPUT(vdev);
+    return &vhi->vhost->dev;
+}
+
 static const VMStateDescription vmstate_vhost_input = {
     .name = "vhost-user-input",
     .unmigratable = 1,
@@ -93,6 +99,7 @@ static void vhost_input_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_vhost_input;
     vdc->get_config = vhost_input_get_config;
     vdc->set_config = vhost_input_set_config;
+    vdc->get_vhost = vhost_input_get_vhost;
     vic->realize = vhost_input_realize;
     vic->change_active = vhost_input_change_active;
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b275acf..2449b9c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3610,6 +3610,14 @@ static bool dev_unplug_pending(void *opaque)
     return vdc->primary_unplug_pending(dev);
 }
 
+static struct vhost_dev *virtio_net_get_vhost(VirtIODevice *vdev)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_queue(n->nic);
+    struct vhost_net *net = get_vhost_net(nc->peer);
+    return &net->dev;
+}
+
 static const VMStateDescription vmstate_virtio_net = {
     .name = "virtio-net",
     .minimum_version_id = VIRTIO_NET_VM_VERSION,
@@ -3712,6 +3720,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
+    vdc->get_vhost = virtio_net_get_vhost;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 039caf2..b0a9c45 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -264,6 +264,13 @@ static void vhost_scsi_unrealize(DeviceState *dev)
     virtio_scsi_common_unrealize(dev);
 }
 
+static struct vhost_dev *vhost_scsi_get_vhost(VirtIODevice *vdev)
+{
+    VHostSCSI *s = VHOST_SCSI(vdev);
+    VHostSCSICommon *vsc = VHOST_SCSI_COMMON(s);
+    return &vsc->dev;
+}
+
 static Property vhost_scsi_properties[] = {
     DEFINE_PROP_STRING("vhostfd", VirtIOSCSICommon, conf.vhostfd),
     DEFINE_PROP_STRING("wwpn", VirtIOSCSICommon, conf.wwpn),
@@ -298,6 +305,7 @@ static void vhost_scsi_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_scsi_common_get_features;
     vdc->set_config = vhost_scsi_common_set_config;
     vdc->set_status = vhost_scsi_set_status;
+    vdc->get_vhost = vhost_scsi_get_vhost;
     fwc->get_dev_path = vhost_scsi_common_get_fw_dev_path;
 }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index b875640..e513e4f 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -276,6 +276,12 @@ static void vuf_device_unrealize(DeviceState *dev)
     fs->vhost_dev.vqs = NULL;
 }
 
+static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+    return &fs->vhost_dev;
+}
+
 static const VMStateDescription vuf_vmstate = {
     .name = "vhost-user-fs",
     .unmigratable = 1,
@@ -313,6 +319,7 @@ static void vuf_class_init(ObjectClass *klass, void *data)
     vdc->set_status = vuf_set_status;
     vdc->guest_notifier_mask = vuf_guest_notifier_mask;
     vdc->guest_notifier_pending = vuf_guest_notifier_pending;
+    vdc->get_vhost = vuf_get_vhost;
 }
 
 static const TypeInfo vuf_info = {
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 08bccba..3a7bf8e 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -247,6 +247,12 @@ static void vu_rng_device_unrealize(DeviceState *dev)
     vhost_user_cleanup(&rng->vhost_user);
 }
 
+static struct vhost_dev *vu_rng_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+    return &rng->vhost_dev;
+}
+
 static const VMStateDescription vu_rng_vmstate = {
     .name = "vhost-user-rng",
     .unmigratable = 1,
@@ -272,6 +278,7 @@ static void vu_rng_class_init(ObjectClass *klass, void *data)
     vdc->set_status = vu_rng_set_status;
     vdc->guest_notifier_mask = vu_rng_guest_notifier_mask;
     vdc->guest_notifier_pending = vu_rng_guest_notifier_pending;
+    vdc->get_vhost = vu_rng_get_vhost;
 }
 
 static const TypeInfo vu_rng_info = {
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index e8f6249..665a0df 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -261,6 +261,12 @@ static Property vhost_vsock_common_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static struct vhost_dev *vhost_vsock_common_get_vhost(VirtIODevice *vdev)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    return &vvc->vhost_dev;
+}
+
 static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -270,6 +276,7 @@ static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->guest_notifier_mask = vhost_vsock_common_guest_notifier_mask;
     vdc->guest_notifier_pending = vhost_vsock_common_guest_notifier_pending;
+    vdc->get_vhost = vhost_vsock_common_get_vhost;
 }
 
 static const TypeInfo vhost_vsock_common_info = {
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 437347a..96b15a1 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1745,6 +1745,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
 
@@ -1821,6 +1822,7 @@ fail_mem:
 fail_features:
 
     hdev->started = false;
+    vdev->vhost_started = false;
     return r;
 }
 
@@ -1850,6 +1852,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     }
     vhost_log_put(hdev, true);
     hdev->started = false;
+    vdev->vhost_started = false;
     hdev->vdev = NULL;
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index cca5237..7d63b8c 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -961,6 +961,15 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
+static struct vhost_dev *virtio_crypto_get_vhost(VirtIODevice *vdev)
+{
+    VirtIOCrypto *vcrypto = VIRTIO_CRYPTO(vdev);
+    CryptoDevBackend *b = vcrypto->cryptodev;
+    CryptoDevBackendClient *cc = b->conf.peers.ccs[0];
+    CryptoDevBackendVhost *vhost_crypto = cryptodev_get_vhost(cc, b, 0);
+    return &vhost_crypto->dev;
+}
+
 static void virtio_crypto_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -977,6 +986,7 @@ static void virtio_crypto_class_init(ObjectClass *klass, void *data)
     vdc->set_status = virtio_crypto_set_status;
     vdc->guest_notifier_mask = virtio_crypto_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_crypto_guest_notifier_pending;
+    vdc->get_vhost = virtio_crypto_get_vhost;
 }
 
 static void virtio_crypto_instance_init(Object *obj)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index be98b4d..7050bd5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3289,6 +3289,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id,
 
     vdev->start_on_kick = false;
     vdev->started = false;
+    vdev->vhost_started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
     qatomic_set(&vdev->isr, 0);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index bfc73ec..105b98c 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -22,6 +22,7 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
 #include "qom/object.h"
+#include "hw/virtio/vhost.h"
 
 /* A guest should never accept this.  It implies negotiation is broken. */
 #define VIRTIO_F_BAD_FEATURE		30
@@ -102,6 +103,7 @@ struct VirtIODevice
     bool started;
     bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
     bool disable_legacy_check;
+    bool vhost_started;
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
@@ -160,6 +162,7 @@ struct VirtioDeviceClass {
     int (*post_load)(VirtIODevice *vdev);
     const VMStateDescription *vmsd;
     bool (*primary_unplug_pending)(void *opaque);
+    struct vhost_dev *(*get_vhost)(VirtIODevice *vdev);
 };
 
 void virtio_instance_init_common(Object *proxy_obj, void *data,
-- 
1.8.3.1


