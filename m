Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6144BE8B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:26:57 +0100 (CET)
Received: from localhost ([::1]:39472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkoi-0005Ag-Fo
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:26:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkm0-0002Nr-89; Wed, 10 Nov 2021 05:24:08 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkklw-0005BH-Rj; Wed, 10 Nov 2021 05:24:06 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9SuFC014454; 
 Wed, 10 Nov 2021 10:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=xB/u4eff3tHLTtnkwq3PcXI97TvW1x3wVPuSti8zOCY=;
 b=iz6cL/r6UF2IcDT9rnvdP2I2qgg2PrwZera74LCHTshzqYiC9D3FvcfE2Y0qt1DXddew
 ayO1c5XCdB2JIZFbxHdjyVAy4ZoNmubo4eVK8+nCl1oNN/dHFi8Wd95TyPOLNY5G6WmH
 9t6ejVy7RfJ9zhYynKtnc0R1OX1z7ydD5CJ/YUddwgLxn/Hzi9Ev5yT7gYTQLhm4Kc/B
 5spTz8ndW3iC7gDaBl1ShaF108E9hiSzo7ee/bMTv1rpe+kn3E5bk4tnYy9LbiiVrJB0
 Dsv26tWazZv1b2BTfu5U0xoEk7Vuqb4kUkoaYP6WetCtX/3S2Qk/XwkFBIRG3Fb7FQYw aQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c85nsa221-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAGPg7034863;
 Wed, 10 Nov 2021 10:23:49 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by aserp3030.oracle.com with ESMTP id 3c5frfd2ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3QvMqKgiAloC3QpcztNeUZPU4/VDHE2qWrL4WbCAPfXkzTZNCMnN8dR82O2s4mcC6G/9svALz1z0+yZbs5ztq11cHpTfT3KzTesY17NLzjL/JS147fEIFi0+M7V+fL3ohyuJJAV8bwgOMnp8JFWMfjRug6wumlFAEcM/SaWQgqsnrw/rkVFXxotSl2MYvlv4ePHnPo6uidb6SEWe0xqW2bkUDncCqttwJJD3Y78yzGN2GmdflfsCwLvIOBBkfb6b/QOa5J9qVAUFpgVFy3vqir4aXiGxWWv5c7ei4/yqZi6X7M3Nhbga/Kl6GU+di73AoyVCflUb5KtmGoDT/XXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB/u4eff3tHLTtnkwq3PcXI97TvW1x3wVPuSti8zOCY=;
 b=QEM0IPJhUyYDh/UhWszvh4canynyuiOfVIiGpx/sjO6C6ZxUOnH4yric0xKtgEebvvWnXUARUdsVqq6BRnOilHuLbAuELRtHRbrjzqETZvzdZmFa2ylAUpQI8spM/sH8O+ODNj2/Jk0uQwfXcRlRHnDKqR02VTtJ+SPhOPsTA6GIRG4OhmR8f+3ZsOUSf7HlPbeSfiX9frhXeA/4YWUt/tz3I9U2MdDWZKYs/EBFwvc/zrktAFgTIxzS3ZzDl5GINAoD8A40H4hK4QornFxwtrWrHyT84qOC6KAnKsoDOD01Zs4Wb+8MeVXjy8HgqHNYqifbYyNCSI2ivV7f0Ya2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB/u4eff3tHLTtnkwq3PcXI97TvW1x3wVPuSti8zOCY=;
 b=Xu9stA1DrYonLOvFk3zT8o+KHa+dbdeAKxIlLD7nwptwNH33O94L6wYIkddB6T4/JeGJ0MYGk5HuGT5EbrL9+w29znSTdcZbnhGWgVePwJANYwyPViTDFKhUfq6QlQzydsDEAuSxMklHWfkGi3nT/BUJNbjtqhTHEDjkFfKU+nM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4727.namprd10.prod.outlook.com (2603:10b6:510:3f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 10:23:46 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:46 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 3/8] qmp: add QMP command x-query-virtio
Date: Wed, 10 Nov 2021 05:23:07 -0500
Message-Id: <1636539792-20967-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.43) by
 SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Wed, 10 Nov 2021 10:23:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af78dc3b-f632-4b40-52c0-08d9a4342db8
X-MS-TrafficTypeDiagnostic: PH0PR10MB4727:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4727A54D282127BC5640028BE8939@PH0PR10MB4727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ErXp1qqxTBXqnUBEL58YHRvZ0ll7eaP872NDYkpDXXW+U+62VwPvG+EkjvoqaBQSob6BWD/2NW84hf7YmQb07Li26PQpG5Xok7R+qAmfC6vB2OKg2Zd3evIoVWyAI1ROqEGRk0L7mWPvWYTdohobqmqXFtav4DxECYsdnE/1bCyFLZSAxxc3HVf+l6Kk7z+sBLLw3YFDVTaMZ7OgU5wtpWV0/pUzgRPEMoQUaBKdcmeJwyIWqeaq8zKKHUg1+kAyUbigwdeq/9Wsql6FmKC+tYJK7iv7Fhg5cDjAUQO7mvVQFS7GxM4VfEvzmjLV3sxbtrsjuALR3EWV+DDq8JNf9GOl/wkZ3wnSgRCI/S9yOYRmdWOZgMXr5AgNc8iRaB0mWCgXOjN4RnT3JCECGFsMEZnRotstHVQbl6Xou6Q7QzQmmofQJy+o5XXfgHS7StHy5DEigq82b3mK3y4cG+T3/28QDK18QyGHSR9+PXj/OFMqUH8W6uK1kMHsqYiAiBHcwRO5ytBc82kA6WcrTQw5ck+FXMjBSdgopNxX3On+I4etvuIvpJsTO5jOFW3y4Q1hoRvoAf2kkxOxnoYWH1mzwtHzZEWXsJ5rnI/fSrBnFUzsOQUGbvWWAVKeribscKyeY1yXyxPrHPLiGxSZbuUS9uOrGD5AzPQpcW7SgSz9Y7ogc6BU2Ac25yyt+khpYedur+0Wxm6QGXtWyLIC6LS9Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(66556008)(8676002)(7416002)(6486002)(66476007)(26005)(5660300002)(66946007)(83380400001)(186003)(4326008)(44832011)(86362001)(7696005)(38100700002)(38350700002)(6916009)(52116002)(2906002)(508600001)(8936002)(956004)(6666004)(2616005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2sBoYdYvhkS2haIKbJ9KFFTZ/fjQuTbFq3Qspme5FiQ5lsoljsYJ4oIm0MV6?=
 =?us-ascii?Q?iMLoLTakXJCBIvVIcV4FCBfYZUJxD+7ZFfErMzgHIImrA4Qq8t/9Ta3fy8TO?=
 =?us-ascii?Q?iJBylnhPpmqFvJFsrQ4deTw7x0EKOaRATTYhn35UJYad3ubtMYYQf5FAKKwC?=
 =?us-ascii?Q?iduBwz4hzFR+BC1+FCL8thTKeWYyw4gOly95E3pQlHbovXJidtkEqmo21ewc?=
 =?us-ascii?Q?psU2CrOSLOjifLjkXwPSKyA0B8cpEEGDO5eYOAUyVGO06Bw5Zk+RH6pCUkiG?=
 =?us-ascii?Q?B4ShRgQt6ksjVXKfCR2FH4BfiErPsFHPJriiLR1q8iwZSiXf5p/NGVwCvN/H?=
 =?us-ascii?Q?qd6tnrS27fXm+hRNWqHPdL3n+5D0ME8BbdwfDKxdqz7j0a6+HQV4UpknfGWC?=
 =?us-ascii?Q?/I9v1UG5S5FDCs79HJS3bSOLm4K7z/zejUV+bpXMPUzISzVnGNWLjuE9qKDp?=
 =?us-ascii?Q?IZMsA8pKGXDFyjJsTxnwB1vknjoe1INTzoPvJnmQK/2vAbzri2wV6ricFaDK?=
 =?us-ascii?Q?XunO1G/4SCVjqRU6IAOm2d/sAQF/Hf1uhUOWKnTEcqxVdSOb1Tc9AEbd8hJ8?=
 =?us-ascii?Q?+okdlNl3hppW8QoWK67E3+gnrfaElylxIZdzCJm1F1op/HlMm6i/P/Zsqqpn?=
 =?us-ascii?Q?+pamFv1/nKUI0SXRi4bPNMDULYdpqQolf0fx6TvkVl52pv41sA/4tmWmZZvp?=
 =?us-ascii?Q?Dw8awZc03cJiWLOCaOyiMX7lxkxWYbXTEoOp3GW7bvpdDlkyTtlt0c3uBEMY?=
 =?us-ascii?Q?8FAN11q+xDdFUvdZc6/spmqrqhk70ZTSI+KXWCqrsxLSBo9bg/yUActh275B?=
 =?us-ascii?Q?ZSmFp5gsT3n96o0s/kY07APuqXdrFt/F3kc/GxjYVj2WHYZqB5/fb525Wflp?=
 =?us-ascii?Q?/o+Wp5ySx0RpqKz6mMoRwVUM1C84XbRX/WbwSov5xAIIeOQqjdMQoFRbXEUC?=
 =?us-ascii?Q?VI2Z5Nb/qkKTS9Sre2OXJf/5jUqhDwl2QqBWJGyjx1JU46+zTba+9DwazYX+?=
 =?us-ascii?Q?UcXvih8rYzo9YNFZh+kNCzZFarO54UymSmwFbegvyUMTMECLzcKPAF7Sw/Y/?=
 =?us-ascii?Q?dEjiAj9oJfqyLzH+v3NLU4LQRwfNenEg1uzcmvREBR/cSPH+0QzXlFxFfZxj?=
 =?us-ascii?Q?VT2uaWrwJiWHR8EkG/H84zGfk03asJ3pcSWpnghXGnydTJF00uV1cQFyklT0?=
 =?us-ascii?Q?cLo3g6k9gZLAXDj4iLWqHQ07usBphQIeSscuhsLkhwKsJ/VsmyZytgxS/8Ht?=
 =?us-ascii?Q?o0kND7Ski5YSUVvjUIkNjLXaQS4wpGzQo8DcIZc/PStrVaaTXLCvz+skwNGU?=
 =?us-ascii?Q?DHa46wG9K3uZ95wtAQh9Uob2anCNUaUMdUBaF28c7l0YyjKRnG06tdTYNr3m?=
 =?us-ascii?Q?8vON1/XLVfhEfXfNyOAYZpLpo68txA8ixk0nfgVarY1X2jc03FBKaGx6h6Tr?=
 =?us-ascii?Q?COgavs9dBdU/xPJwM3CCgYXSOjze2P3wJ9v7HwB0in7qy9SldVTi0ZpyTqG2?=
 =?us-ascii?Q?aQLvFvllGygwVL//TqTm6ipV0JVrNcUgZ8CqnFdVxSV0BTBVbprS57PVD4FF?=
 =?us-ascii?Q?ii9Sidqou4Fjqi8QJcx8IMu17QodEkC77D5vAf5W2IcAGA3kxEJBza7W11R+?=
 =?us-ascii?Q?b36ONwW0cq2u5CtUgnDhoZ8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af78dc3b-f632-4b40-52c0-08d9a4342db8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:46.3727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CejssRi/YAeQ8UDHZXzOalFq7prbII+/16GtBjM8NLiX2l/UVVE65zp1m5dCczzMTqmiLcoVbTAuNXxP5X9aZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100056
X-Proofpoint-GUID: mGup5oUgm9s5RlZoEFrYntEO8CADJIT6
X-Proofpoint-ORIG-GUID: mGup5oUgm9s5RlZoEFrYntEO8CADJIT6
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevice with
their QOM paths and virtio type/name.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++++++
 hw/virtio/virtio.c         | 27 +++++++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 102 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 521f7d6..d893f5f 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000..05a81ed
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7050bd5..aad554b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,6 +13,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
@@ -29,6 +31,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* QAPI list of VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3709,6 +3714,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3723,6 +3729,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3896,6 +3903,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3906,6 +3915,24 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        node = g_new0(VirtioInfoList, 1);
+        node->value = g_new(VirtioInfo, 1);
+        node->value->path = g_strdup(dev->canonical_path);
+        node->value->type = g_strdup(vdev->name);
+        QAPI_LIST_PREPEND(list, node->value);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 105b98c..eceaafc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c1..e332f28 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -48,6 +48,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..1512ada 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..324ba8c
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,55 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice
+#
+# @path: the device's canonical QOM path
+#
+# @type: VirtIO device name
+#
+# Since: 6.3
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': { 'path': 'str',
+            'type': 'str' } }
+
+##
+# @x-query-virtio:
+#
+# Returns a list of all realized VirtIO devices
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: list of gathered @VirtioInfo devices
+#
+# Since: 6.3
+#
+# Example:
+#
+# -> { "execute": "x-query-virtio" }
+# <- { "return": [ { "path": "/machine/peripheral-anon/device[4]/virtio-backend",
+#                    "type": "virtio-input" },
+#                  { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                    "type": "virtio-crypto" },
+#                  { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#                    "type": "virtio-scsi" },
+#                  { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#                    "type": "virtio-net" },
+#                  { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#                    "type": "virtio-serial" }
+#                ] }
+#
+##
+
+{ 'command': 'x-query-virtio', 'returns': ['VirtioInfo'],
+  'features': [ 'unstable' ] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 7f103ea..fd00ee2 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-query-virtio",         /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
-- 
1.8.3.1


