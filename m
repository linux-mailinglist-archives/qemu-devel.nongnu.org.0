Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985E4EEE2C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:32:36 +0200 (CEST)
Received: from localhost ([::1]:37554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHOE-0002tG-TW
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:32:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGd-0002Mb-Oy; Fri, 01 Apr 2022 09:24:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGa-00079L-9p; Fri, 01 Apr 2022 09:24:43 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231CvRsZ014831; 
 Fri, 1 Apr 2022 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=zKlqX3uYMLtqym4uxszgAzpjBjv9w+D52TlkO2/ePx4=;
 b=c539yvaHb4U4fzbMEVtVZH1d05AZPgNTxHrbPEJ8F1gQxTmgT/a5LGqXl6nB+13aqRol
 /jdKDkVFllNwnudk951oKm6NYw9DP3ZR/aUB3nrtB3aNUCpCZWPNcxAvknpL+PgfbHiv
 K2VRetR1giofv83Gkgn5vwU/cx9fgu2Ri+EwYLp7fH6TkjSUDXfkjqF7Fb9nl/9OQ30D
 KPsG+FRGCrsZsOFRbdbOEn3DuHFX4W88uiRb13O8RC5+vt1uRh4/r4/QPE+zWQSGOJJZ
 n3cyJjC+frURCTh8pBc2AyxTcOKDjAShN1YbRouTPnDe0aqm7o3de2NOQluCllWFehSf nA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1sm2q2x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:19 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231DGb4I024163; Fri, 1 Apr 2022 13:24:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s95t9r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzwicbqO0DlICwx/+3RPS7QgcpKHwSr+UYV0S5bO8NjQqV63fpf6CDNry2qHnE/2snB0o2mdux71VNr738HFPbnzVx8qQyEvmleEbQ+fYbd+w3HT3HoDN40eePNJnbw4GaqyjiIZEIv6/xWl5O9eyfLiPUIDyXS2d0DsgFshETRQ3Knd5MfN0jNvmGiGe+iKIlrX5poaSIOtzCk2PKBf8pNYTs9soTF8Qlj/xICeaDfp/W/0u2ieJYxy/EZPYXhNXF4a0q/gbgXmX1Z3w7ITDlADZ975jRqhAZ8jLmyv63O5ZUqdcAqWCCnNH5e3FQNuqJ67VZmKI2It1lyCSwBZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKlqX3uYMLtqym4uxszgAzpjBjv9w+D52TlkO2/ePx4=;
 b=Clxv2uJ/hGAtDbhW6Uw0qKQakPfoxyFhPwjC4fbzViSkEGYs2vt3Z9qYAG8ZKdgJS3/p5IzaZhp2liSz2ShO5WCwQMYi2Iew2CkiQHBhByEVuEWP3PNgXi882nBZBIasNKVSwJz9X7QV4lGjPkEn1CfHHMN5mFSZN/xrlP6wreJIQZpfhzXT+/gCQziZO9WblqEUpmiyNc0Z4NSmzPmd3LwJqVfQzzPiKY4pOduKdcYs9hmJLmc7Di2HSoad9rNy2kBWbkyv3m9Qoklr4IvXNDEtozBP0X5PJBBqQnD9QhHDNadefsbJiHJJP4DCe9pWich9lYn7Y2InJyyoeVXSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKlqX3uYMLtqym4uxszgAzpjBjv9w+D52TlkO2/ePx4=;
 b=dsXv0Yt9xdvHrNHCyOlJYcQKZDBSqkFzk2z7KLpmF/aThyNdzEwu3vACoCrxC74JKA0DbWars6E+0IcivVjOiNND8I7USgTY2FaL0IDbaMnr7BiKmymZzv65EJynT8hPue/tQeUl74hFxsTsjxb/FP6Th6Wd7SFCRZngpgWXn1s=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by MN2PR10MB4302.namprd10.prod.outlook.com (2603:10b6:208:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 13:24:16 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae%2]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:24:16 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 2/8] virtio: add vhost support for virtio devices
Date: Fri,  1 Apr 2022 09:23:19 -0400
Message-Id: <1648819405-25696-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8605f61c-b032-4a72-7a14-08da13e2eb84
X-MS-TrafficTypeDiagnostic: MN2PR10MB4302:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB430214F3ADD42EE73A9DED1DE8E09@MN2PR10MB4302.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDVX+WiX6PrlphgAGeXlXupSHpjHt8LhgDf9y4SKQ0i8BWtXuln5zVZSvTLz81wnNdCobDyy/KWxKC+HUEJ1DDTIgtNF3zBxdWXMDjB/20EtVnhX0bAjlLsedygwRxsTdpJF76wlXP5/Oo32+2M4KPJpbkZh/GBlpH9fKC89XN7Ws5DEBJsuDZU8Htq+fE2R99A/TYqm8YZjPDk0fGKZ9CTz0TnAINTUbW4GrUCR+eECDdH1zetUOeYlj/x9ep0gHHe52UVG+gk4ohiUdYdrifsA04hO8hi614DLN+izw5BYD3xa97Kv8rF5HkPOJl/sD+gKFuf6i2pz6l0GIWZvUct+A+JPadXTSPYNWTEuKuTw94qL/OI/SNqFry+UJm/wKnZW6UA8sZCeZOZVzmQbvAZmGNm8sjido509wJWKOklWAZQDhfoGoVEUpUdD7/VCK8DTL6QNFpPLQfF2xJo4jY1bxfSZWqbyiMUh0Q5SryVjTuUFdB7X4zt0xjBuAsuHLqjWqNnYJsoKWVI8SG/BQk9ECidaaQwSgHFSGnTXMrVzgZ5Y8Kwd+ys+um5ysr7EvNBXZR0NdIAsshOR1SE/6WK/6P9VXNzv9DQYDqYGxo6IlX+/cm9emxKRWzuj6xDNWBodOnQxoL6g0JbH4g+uOOIH4LZw2id5T4mlGl6lFwht6mOe9+TvbIbjs2/JXz+jPYqeVBM0mnXdkyQQE2uzfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(4326008)(508600001)(66556008)(66476007)(2906002)(8676002)(6916009)(86362001)(36756003)(66946007)(38350700002)(38100700002)(6486002)(5660300002)(7416002)(30864003)(6506007)(52116002)(8936002)(44832011)(6512007)(26005)(186003)(83380400001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hMZT1y/agJepk+iMC8v6OhFj6vQ45cr0RRZ0wp5YKEpeZY2l359/6CL+NgkU?=
 =?us-ascii?Q?Aam7kjD9oqVzq6yOyjdFPQcZ4uaHjAgghafqlilCo8Y+h68MImTzDuS5LLkB?=
 =?us-ascii?Q?cG9a2TovlrG+kaqI25m80zNcGZL+tyoU2bViVdPVS1hmxfkkCy7U1TYF1ZEQ?=
 =?us-ascii?Q?OdwdmnVBkg0iG+zWIJAd9EluRg6YuJlVgMHcgs3Dn+nvPvBeyIPwLFMyITrr?=
 =?us-ascii?Q?4wf1qEG2lM9o3u1TJOjzg5o8zP9+4mYj04XSGPiMA280NmlS4/NduOzvdGXg?=
 =?us-ascii?Q?MOV76MxQdG4ifXaCZvN5nOs2I5aXHI8XEwSf8RI9D3L65Hvq56Mv8WNmLeK3?=
 =?us-ascii?Q?B79MqIBOQWGBr4x+cEwoRWS6O01kNUGyi+EnK16e8nSn6zwbN8jjUToosKCb?=
 =?us-ascii?Q?2yhxPFXAa0Z1yV3sfb8LHBukVWT/PNgcsHZ/E+fC3xj7hwoMvubYnkdRpFJP?=
 =?us-ascii?Q?ifX4k466edftr9Bux587+nPDGF4X73XhwTqOCQ7Y+3LRXLL65pfhjyJaLOr3?=
 =?us-ascii?Q?LJ57tvAAavj95fmXjPwKK3d9cfFQNBeu9MhiGGcDMeV/LN6mxt3fqrVq3644?=
 =?us-ascii?Q?5dV58efIjyslspspdN9hzZMY/t0JOk6A5c1exKOjjPjQIeI+2/US2ZU1tTgo?=
 =?us-ascii?Q?plIKjS2jormdK1ud1snhVTtFt/3d0A1wie/c0pHTtrYBXfhdX/7TV9AiHvMy?=
 =?us-ascii?Q?WDygfbqLsFaDitqB/1Yrl8bNpHUpXry9YTZol/Tba6xpmU53D3VkRZCmpH19?=
 =?us-ascii?Q?drGnPdTl9ZuXTnqLSgBfFTT5oJf2FvFWrxfe4I9QP3xcVKatGSdoMTf34l+6?=
 =?us-ascii?Q?KCkaHluQQUSC71CN8ibOH7h3XNtITpzhgCP09Jus/uV8qQrDINi83+L4yfOP?=
 =?us-ascii?Q?0ZlrWAVeuEGC6//CDKfJfAHptjvOmM/mqdwWf3F58QL8638TF9oya5YxSMoY?=
 =?us-ascii?Q?mTVWoexpV3COWzqy+LDfJfZuAq1m/n2q8Doo+fqpWCyyJBtNSntkSNmZ52km?=
 =?us-ascii?Q?bwiSsQ5EDz8+M7NGfO97QFoFpzH0scpSPE7gaQJN3xhuAbXHnr452wgLr8Mk?=
 =?us-ascii?Q?ILeFOo0US50zuW0b43rAFSB260BVs54AKmolQCfHKhcQXRpxdkBsNBc//iG4?=
 =?us-ascii?Q?7wk+vc1WQrRCTwCeRP8NocAnMIsW5CAiZ5MeZXrbv3mvSTXkpCtmhDYHLbD6?=
 =?us-ascii?Q?pm8CKufUiri/C8JFdFsT+9d+jTLrfQ86M5zAZAHC3+m5T4X4/qg9x/TzBjtD?=
 =?us-ascii?Q?AtvASx4cJM56sBsvPMGetLrwzKxKiLH5zLCKnLs+XRht7z1G3qzr7CN4b+dj?=
 =?us-ascii?Q?ho87lOHUHXAQr71/4KN712bjmAZtpzWIOc74mOZX5nZmnD3schAJjcQNonsj?=
 =?us-ascii?Q?Sf1pMuYuwQhv30CRRCVAt4vY3YQU1xlDd3sdSkaGEp9oXgizX5LPVbgSPQk0?=
 =?us-ascii?Q?3/US0QLCyq7nsKss18Q+uauwbBCc2f/cZpgx0VxRDiyKatGYK+unVLJ8keJE?=
 =?us-ascii?Q?V1Fo3fbqppca/WKaEXYkerpWTVNJques2hdjXYDqE5QNY9X/WjKKjy4OhL5Z?=
 =?us-ascii?Q?O08sGylTfidasS607pGkBuUju55qd0Am4AnqJRlTlmVrRrt1AHK0jKS7rKD4?=
 =?us-ascii?Q?zVefUK6XQ3Wv/QXXt5LOm7Ndh8sElTtB4guSs5hdsWobuXGbK9v0GTRqTsrT?=
 =?us-ascii?Q?kGNbtvNm5+fnfTU2Ot5VvCqn9wQCtbi34Xxx+Sg+fL3Ktlbx5wAwXUOUT1TX?=
 =?us-ascii?Q?5itpPeOrBX2GFlExc2ei0oQK8lEAO+g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8605f61c-b032-4a72-7a14-08da13e2eb84
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:24:16.2460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /E5BDBzHwQ4UZGFNGmQENSXJ6t4VB8fPYeQFi5F/6GrEP7AFy2WMb9mINoUyFVvH61hArD0dIHhkvsUGl3qhCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4302
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_04:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010062
X-Proofpoint-ORIG-GUID: wbQDGH12TtvkszXiBACO4vKFknwx04Wj
X-Proofpoint-GUID: wbQDGH12TtvkszXiBACO4vKFknwx04Wj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
returns the device's corresponding vhost_dev structure, if the vhost
device is running. This patch also adds a vhost_started flag for
VirtIODevices.

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
 hw/virtio/vhost.c              |  4 +++-
 hw/virtio/virtio-crypto.c      | 10 ++++++++++
 hw/virtio/virtio.c             |  1 +
 include/hw/virtio/virtio.h     |  3 +++
 12 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index e8cb170032..5dca4eab09 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -569,6 +569,12 @@ static void vhost_user_blk_instance_init(Object *obj)
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
@@ -603,6 +609,7 @@ static void vhost_user_blk_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_user_blk_get_features;
     vdc->set_status = vhost_user_blk_set_status;
     vdc->reset = vhost_user_blk_reset;
+    vdc->get_vhost = vhost_user_blk_get_vhost;
 }
 
 static const TypeInfo vhost_user_blk_info = {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 09818231bd..96e56c4467 100644
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
index 273e96a7b1..43d2ff3816 100644
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
index 6fbcfd7cb7..027ce40c6f 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3619,6 +3619,14 @@ static bool dev_unplug_pending(void *opaque)
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
@@ -3721,6 +3729,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
+    vdc->get_vhost = virtio_net_get_vhost;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 778f43e4c1..3059068175 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -273,6 +273,13 @@ static void vhost_scsi_unrealize(DeviceState *dev)
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
@@ -307,6 +314,7 @@ static void vhost_scsi_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_scsi_common_get_features;
     vdc->set_config = vhost_scsi_common_set_config;
     vdc->set_status = vhost_scsi_set_status;
+    vdc->get_vhost = vhost_scsi_get_vhost;
     fwc->get_dev_path = vhost_scsi_common_get_fw_dev_path;
 }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index b875640147..e513e4fdda 100644
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
index 08bccba9dc..3a7bf8e32d 100644
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
index ad5c8ff5d5..7394818e00 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -258,6 +258,12 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
     virtio_cleanup(vdev);
 }
 
+static struct vhost_dev *vhost_vsock_common_get_vhost(VirtIODevice *vdev)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    return &vvc->vhost_dev;
+}
+
 static Property vhost_vsock_common_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSockCommon, seqpacket,
                             ON_OFF_AUTO_AUTO),
@@ -273,6 +279,7 @@ static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->guest_notifier_mask = vhost_vsock_common_guest_notifier_mask;
     vdc->guest_notifier_pending = vhost_vsock_common_guest_notifier_pending;
+    vdc->get_vhost = vhost_vsock_common_get_vhost;
 }
 
 static const TypeInfo vhost_vsock_common_info = {
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index b643f42ea4..a25ec5b032 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1739,6 +1739,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
 
@@ -1811,7 +1812,7 @@ fail_vq:
 
 fail_mem:
 fail_features:
-
+    vdev->vhost_started = false;
     hdev->started = false;
     return r;
 }
@@ -1842,6 +1843,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     }
     vhost_log_put(hdev, true);
     hdev->started = false;
+    vdev->vhost_started = false;
     hdev->vdev = NULL;
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 0a1f3dfdbe..947a11c3af 100644
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
index cbb4920f49..80c7708c7e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3271,6 +3271,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 
     vdev->start_on_kick = false;
     vdev->started = false;
+    vdev->vhost_started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
     qatomic_set(&vdev->isr, 0);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 5d774684b1..8e12aeebc1 100644
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
2.35.1


