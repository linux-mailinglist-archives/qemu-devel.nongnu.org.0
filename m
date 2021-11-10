Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B526E44BEC1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:33:59 +0100 (CET)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkvW-0001Ju-Sg
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkmB-0002Tt-H1; Wed, 10 Nov 2021 05:24:21 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkm7-0005Cx-5X; Wed, 10 Nov 2021 05:24:17 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9SpV8032545; 
 Wed, 10 Nov 2021 10:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BfqZRVbaK5S/qhphPGr0frgjJ6jUxS3G9llv8/NdDI4=;
 b=hgSwt8FmPukWgRHWCRKawZFCahctsGm8BKk+yvT55BPiHlyPBoOTU2rGSzujZ4KJJ3kY
 aifwnySws3l/v5P8Pcc/jsfcfRYy8gGdpruv8OIcxk/DzbozHJdowGvfdLNXhuLSMlOi
 CCIp8c2rv2i3yV05mLKdxQxmoN70jt9R4wGSH9iod6PuSj36ONXM5CMyg5Axv0HXaghM
 jTFQCiMzU7Irva32nyPGx+bEsQxLUMIzbB5sP/rMRKEfmAE2Kmox6hk91RGoGg3Yfpza
 UBYt8fkMN3YFOtNn3djMW+xK89icOw+dI8BFBOQDpXMth1NFYWhkkDZne6QeMKUBQjy8 Nw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c82vgap7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:24:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAGOCZ034660;
 Wed, 10 Nov 2021 10:23:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3030.oracle.com with ESMTP id 3c5frfd2yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNnGQ7ilSLG+p8eh5ky/sWZTJULcHD+Szc7WLX5nWTzYMnpW8EejQxLeBXV5gNBoMB2rkGm2ideCAxevNkacYboT/gubf5155N97hBfbV0TOxD8ZVgLu2T0nF4TPYuxB2l380zlYjzieXqC5t3bB9ycbbQ0q7+HnjzzYNyXPf8gRk7p1RBqYq8ZhCLNWsHczwAMfQHdsQOwZP5DRAzfXcjumqSUTsFSRnwZF7C2mwpXkaretqUrhILVZhllZKsoiedP1W1+hJJlCRE0D2xfT3iSazacjYO9kuvVce8kMN3Y4jvBcgfnNrk/bCvVByHAyVjeKZwKMeWjXyzEyJJjCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfqZRVbaK5S/qhphPGr0frgjJ6jUxS3G9llv8/NdDI4=;
 b=ReKMTkAUSGafUxUoOOMpdJ5FZ6kFMlzrvhoK7S6w59qiFObmNKvh+y2yQchxVa5nCQ8cTtsXOgOddMZ+XD1eWlDCN1SrGS+qgUvieWUfFA+kaLh+gkKbX/+1/MOnetcN6V0/MpL2pmyL+W+zhFNoR+5X1eXPRCxHPkipjHIFNUzgAuQdrjJJDvHTfuIwVv9ziakJtnw5AeIjm4bPJ97TF9xqi4O1q47rpXSHjvJcAUVD0i2oLIalBTq/xkrTP5KAtriRJtroLn8MRtZwRrx/pqnfkTIPuRvXmJ0OzTsi5YF2JlwdTSZsbt3mHjKP/63TmU99ZNVB5s9M6NhZMUflAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfqZRVbaK5S/qhphPGr0frgjJ6jUxS3G9llv8/NdDI4=;
 b=IiXu7QB7BW3CNAYCrbnDY5dBtDmc8SjdRcMsuqPJtainvPTkXcXp0hnXkYa4ye/sO4BJVje5EgAXDuc2UcEf0vw1XXZF+ece9XRjA15wzmXxdseHlM5ixN8swCHIiBPnd2WnoHqqqXHQgDnvFsL5taxPgu3PQF+3mXpDhPW6rmQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5895.namprd10.prod.outlook.com (2603:10b6:510:14c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 10 Nov
 2021 10:23:56 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:56 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 7/8] qmp: add QMP command x-query-virtio-queue-element
Date: Wed, 10 Nov 2021 05:23:11 -0500
Message-Id: <1636539792-20967-8-git-send-email-jonah.palmer@oracle.com>
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
 Transport; Wed, 10 Nov 2021 10:23:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e574944a-f882-45d4-7869-08d9a43433ee
X-MS-TrafficTypeDiagnostic: PH0PR10MB5895:
X-Microsoft-Antispam-PRVS: <PH0PR10MB5895AB3EA3E6269603A85EB7E8939@PH0PR10MB5895.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3GfOOUz07mRDJMRHLk5NQxlj0vEOApE7yB7NJ59bDkGr8E9CWKdY8x4spvAtc/0zfoB+DFSVzMnP8n9LhZdMXgfP7i/zX8WdrRb/4TirSqHfOWSC3jai8evf6UnCACeeIBOx3zp7ue99OWN6egqNq6Oz2Np5Ip8493KwLaosxF83Pfok5T6e6PCPivBI8g2SuvxhEFmgojV4AVSqHvnUdUgm+89R+aJ5k1NZCjl9Q2iUTEQIxIrjjnOA8h3DCGpJr4cCINrJgnkMJS579CNuc4JaaIc8nEJLzyZzxOnkra1TzDJKWzud3R9XDxlNhFdDgJgG7dlU9mUyeWX/Fi0YsjGXy8+/2FlnNlTGb/QfthqjjhP5HT+qwer+v8oTCL6ZKCjo11O04L92pBlcU/44424CdDXAJq3f+HSSyLqXFs53S6n6HOFUJibye8LQ8dT/3i8Nh6JxYEGO5L1zDWx9siddZbH7b7ZTs+76+Bq0xlS/u9+1Rd20VuhUEhTQ2YJaoYcr9HIulPtt47P4MomWwz44I3hdQyk14DZwzZe+qqxNM2Ym0eGRmy3ja+dYVkshLNIn10MJIdlxloBwm7Do0usihZqBJXqvF2vBY3SHxCMofsuWI1dYyTKsXcOHykeiI9Ngls8BjeiFwPsA5s15S7eNLU0WTIvscA1hNeP7XUTIrabrNfTf5KWkAZrpf9qszG3Y/J37B7RZcaUXGKk8uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(7696005)(44832011)(83380400001)(956004)(2616005)(7416002)(5660300002)(6666004)(36756003)(2906002)(26005)(186003)(86362001)(4326008)(8676002)(38100700002)(8936002)(52116002)(6916009)(38350700002)(6486002)(66556008)(508600001)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hIkHAxx8Mkn1q71sBz+bDS4jeu3I3+XzGgKeAHXd+e8JeJM3I4fhZGTdg+n?=
 =?us-ascii?Q?QVcDZcS+gdDoR3wc/jVT+2I+O6L4/G9OiCzJL8kgOgj748fqbGC56qhGYCS0?=
 =?us-ascii?Q?YXeexIZD4gVw+E6V4Xuv1Fwlle88tHQQW4nPgm5+fOZeC0FHjPtkEdSy5WAd?=
 =?us-ascii?Q?epeRIXo3Aw3PX7y8VLOnCtAU9uLANtI8378ObfFfgAszgAXTGrtDgenQXv1E?=
 =?us-ascii?Q?bCY54bhgeelXDsSqBczS+0aOV/Ny3WGxOKm2TvpV+8VeTm5q8Qo91ghxCztI?=
 =?us-ascii?Q?6+P8ziDRCQGWZOhhm+dywcFZI6seiDi2UPLdI1BWI0jG7d1/FOkyOiOPYkJZ?=
 =?us-ascii?Q?bT92MxBYIe4zJj042NqmhYuxADqfSB0BrtfnakfBwIp4rl4hlvaJMTa5dhyA?=
 =?us-ascii?Q?dapQcorsd49ByYiHZ+5GoE0TLZYXizlcwRxxWY/5WHigflJj3P1XfSiPf3ht?=
 =?us-ascii?Q?/Dtt8e+ALt/IBKFTtWji5dlp3vAmCGprfVNCpnBcdrcjzB3eQo4k2jMoP8ai?=
 =?us-ascii?Q?E3oVwOA26JYvEZsFdyhrw7fdEVH67kT2WQET33QgKFwCPt4cm7KJiF2iwASl?=
 =?us-ascii?Q?GIZApREiOBt1MXYYY24NvVpn/2/kPruc2y8zdFb+PqMMtuSKMBK2jx/tro9n?=
 =?us-ascii?Q?JSHhqPXyFxGEqQ+LKhSmEBmaG35hCE48Ygz+SLerKt3+BekDusz/a/A92UxX?=
 =?us-ascii?Q?jxFqyUR67L4YNjkV30ZfYVoM3Cyf7dWjD+1qSwzZPECxZx1kg1xNTP0RMyeU?=
 =?us-ascii?Q?yyMWjaPvLzDieUg4edlBsQLiEskC3zPVLhnLOCHPUaKVssAIh8wxWNCx/iv3?=
 =?us-ascii?Q?1SDMZ3kTcexLm1G1S/s6lXsJVM4v3FKtCnetrUY8mkkz8hBhmzetjxYQgVqS?=
 =?us-ascii?Q?UlEY8HkJEbTvvCaX1y//AGynIpzSJmGZlAirn+TqcaDd/N5fIUGbVuKMy+QM?=
 =?us-ascii?Q?tkmw+2JZdQKXWsRfTFEpPuKfwEl0DMb8ZnLWVQUb/HN1nlv6U/unOtUzNygI?=
 =?us-ascii?Q?FnCN4DBG7XYMONCTHX2ZbtlI/4QbQWuLOQlwKsYvRsm0ApePHHKOUdgBGe4M?=
 =?us-ascii?Q?SNpXrViXRMwgjz8Vr7hfeu19Tdy+la60cGZ5ZVDUFw/vON3D8FzujoWREjup?=
 =?us-ascii?Q?t1DmwbV1A+LAWnfhvq+ItyvhXJlCkwQo3+sdZmfkHoQdAhVQCsOYBcQG4KsX?=
 =?us-ascii?Q?ypz4qne3PDoqHzYkOiAJDeP7CeHhrf2BAtBGN5ucgu4oMHfJpCnN97IHfG7y?=
 =?us-ascii?Q?Y5BMqYaFT+FnUB7fSbgpJjYgj6yCeEfBYTEpMGWpDdqXIA68FT4l6KfDTrIZ?=
 =?us-ascii?Q?gB8l8QpzgyD80Kj4EdMQmb+6D7hpVLVN5CiS/t5k0IRuuMk6J0yj4IimKKqK?=
 =?us-ascii?Q?hC4dJ0zNXrfC2L3udBIVjULu8XBdKr+yfwqKo5SU0VBcgE6keaVVkx4X1ZL2?=
 =?us-ascii?Q?ClE0aLQltMZQjbd7JKwzScJgD222F5KS6pY8Q17+o/mTsiV7dU8kxFk95FKB?=
 =?us-ascii?Q?435N/hxXnMNwGzQNk1hXSkvxvVK52e/ia5UTNq8N3gSY6MLiZM4KAh4V+6wI?=
 =?us-ascii?Q?3vJ2fywGZbQz8Jz3ghVfcbAmkCPzyG2gC8GhagzW2+yyL62zr0DMEVFUDqYL?=
 =?us-ascii?Q?LwkSWkQGy533JuzaYpPLZ3s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e574944a-f882-45d4-7869-08d9a43433ee
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:56.7291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPH5GO+KmHzkoEiOHanAkFsX9njpJttXEm0OCr1D7be0gvHQByTGIp8VE3GszuZLsH4oesaw/6IJrtVz6irV3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5895
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100056
X-Proofpoint-ORIG-GUID: qlCKodIlkYix4-4RbhJWCxjDV-O2XQck
X-Proofpoint-GUID: qlCKodIlkYix4-4RbhJWCxjDV-O2XQck
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

This new command shows the information of a VirtQueue element.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 +++
 hw/virtio/virtio.c      | 154 +++++++++++++++++++++++++++++++++++++++++
 qapi/virtio.json        | 177 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 3484b1f..810317c 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -31,3 +31,12 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 160cc90..6df6a85 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -480,6 +480,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     address_space_cache_invalidate(&caches->used, pa, sizeof(VRingUsedElem));
 }
 
+/* Called within rcu_read_lock(). */
+static inline uint16_t vring_used_flags(VirtQueue *vq)
+{
+    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
+    hwaddr pa = offsetof(VRingUsed, flags);
+
+    if (!caches) {
+        return 0;
+    }
+
+    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
+}
+
 /* Called within rcu_read_lock().  */
 static uint16_t vring_used_idx(VirtQueue *vq)
 {
@@ -4392,6 +4405,147 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
     return status;
 }
 
+static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    VirtioRingDescFlagsList *list = NULL;
+    VirtioRingDescFlagsList *node;
+    int i;
+
+    struct {
+        uint16_t flag;
+        VirtioRingDescFlags value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, VIRTIO_RING_DESC_FLAGS_NEXT },
+        { VRING_DESC_F_WRITE, VIRTIO_RING_DESC_FLAGS_WRITE },
+        { VRING_DESC_F_INDIRECT, VIRTIO_RING_DESC_FLAGS_INDIRECT },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, VIRTIO_RING_DESC_FLAGS_AVAIL },
+        { 1 << VRING_PACKED_DESC_F_USED, VIRTIO_RING_DESC_FLAGS_USED },
+        { 0, -1 }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(VirtioRingDescFlagsList));
+        node->value = map[i].value;
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueue *vq;
+    VirtioQueueElement *element = NULL;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+    vq = &vdev->vq[queue];
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+        error_setg(errp, "Packed ring not supported");
+        return NULL;
+    } else {
+        unsigned int head, i, max;
+        VRingMemoryRegionCaches *caches;
+        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
+        MemoryRegionCache *desc_cache;
+        VRingDesc desc;
+        VirtioRingDescList *list = NULL;
+        VirtioRingDescList *node;
+        int rc;
+
+        RCU_READ_LOCK_GUARD();
+
+        max = vq->vring.num;
+
+        if (!has_index) {
+            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
+        } else {
+            head = vring_avail_ring(vq, index % vq->vring.num);
+        }
+        i = head;
+
+        caches = vring_get_region_caches(vq);
+        if (!caches) {
+            error_setg(errp, "Region caches not initialized");
+            return NULL;
+        }
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->avail = g_new0(VirtioRingAvail, 1);
+        element->used = g_new0(VirtioRingUsed, 1);
+        element->device_name = g_strdup(vdev->name);
+        element->index = head;
+        element->ndescs = 0;
+        element->avail->flags = vring_avail_flags(vq);
+        element->avail->idx = vring_avail_idx(vq);
+        element->avail->ring = head;
+        element->used->flags = vring_used_flags(vq);
+        element->used->idx = vring_used_idx(vq);
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (element->ndescs >= max) {
+                break;
+            }
+            node = g_new0(VirtioRingDescList, 1);
+            node->value = g_new0(VirtioRingDesc, 1);
+            node->value->addr = desc.addr;
+            node->value->len = desc.len;
+            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
+            node->next = list;
+            list = node;
+
+            element->ndescs++;
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
+        element->descs = list;
+done:
+        address_space_cache_destroy(&indirect_desc_cache);
+    }
+
+    return element;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 0f65044..c57fbc5 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -1061,3 +1061,180 @@
 { 'command': 'x-query-virtio-vhost-queue-status',
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus', 'features': [ 'unstable' ] }
+
+##
+# @VirtioRingDescFlags:
+#
+# An enumeration of the virtio ring descriptor flags
+#
+# Since: 6.3
+#
+##
+
+{ 'enum': 'VirtioRingDescFlags',
+  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
+}
+
+##
+# @VirtioRingDesc:
+#
+# Information regarding the VRing descriptor area
+#
+# @addr: guest physical address of the descriptor data
+#
+# @len: length of the descriptor data
+#
+# @flags: list of descriptor flags
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+  'data': { 'addr': 'uint64',
+            'len': 'uint32',
+            'flags': [ 'VirtioRingDescFlags' ] } }
+
+##
+# @VirtioRingAvail:
+#
+# Information regarding the avail VRing (also known as the driver
+# area)
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail index
+#
+# @ring: VRingAvail ring[] entry at provided index
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioRingAvail',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16',
+            'ring': 'uint16' } }
+
+##
+# @VirtioRingUsed:
+#
+# Information regarding the used VRing (also known as the device
+# area)
+#
+# @flags: VRingUsed flags
+#
+# @idx: VRingUsed index
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioRingUsed',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16' } }
+
+##
+# @VirtioQueueElement:
+#
+# Information regarding a VirtQueue VirtQueueElement including
+# descriptor, driver, and device areas
+#
+# @device-name: name of the VirtIODevice which this VirtQueue belongs
+#               to (for reference)
+#
+# @index: index of the element in the queue
+#
+# @ndescs: number of descriptors
+#
+# @descs: list of the descriptors
+#
+# @avail: VRingAvail info
+#
+# @used: VRingUsed info
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+  'data': { 'device-name': 'str',
+            'index': 'uint32',
+            'ndescs': 'uint32',
+            'descs': [ 'VirtioRingDesc' ],
+            'avail': 'VirtioRingAvail',
+            'used': 'VirtioRingUsed' } }
+
+##
+# @x-query-virtio-queue-element:
+#
+# Return the information about a VirtQueue VirtQueueElement (by
+# default looks at the head of the queue)
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: the index in the queue, by default head
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioQueueElement information
+#
+# Since: 6.3
+#
+# Examples:
+#
+# 1. Introspect on virtio-net virtqueue 0 at index 5
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#                     "queue": 0,
+#                     "index": 5 }
+#    }
+# <- { "return": {
+#         "index": 5,
+#         "ndescs": 1,
+#         "device-name": "virtio-net",
+#         "descs": [ { "flags": ["write"], "len": 1536, "addr": 5257305600 } ],
+#         "avail": { "idx": 256, "flags": 0, "ring": 5 },
+#         "used": { "idx": 13, "flags": 0 } }
+#    }
+#
+# 2. Introspect on virtio-crypto virtqueue 1 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#         "index": 0,
+#         "ndescs": 1,
+#         "device-name": "virtio-crypto",
+#         "descs": [ { "flags": [], "len": 0, "addr": 8080268923184214134 } ],
+#         "avail": { "idx": 280, "flags": 0, "ring": 0 },
+#         "used": { "idx": 280, "flags": 0 } }
+#    }
+#
+# 3. Introspect on virtio-scsi virtqueue 2 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#                     "queue": 2 }
+#    }
+# <- { "return": {
+#         "index": 19,
+#         "ndescs": 1,
+#         "device-name": "virtio-scsi",
+#         "descs": [ { "flags": ["used", "indirect", "write"], "len": 4099327944,
+#                      "addr": 12055409292258155293 } ],
+#         "avail": { "idx": 1147, "flags": 0, "ring": 19 },
+#         "used": { "idx": 1147, "flags": 0 } }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement', 'features': [ 'unstable' ] }
-- 
1.8.3.1


