Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC98E3EDBDB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:57:35 +0200 (CEST)
Received: from localhost ([::1]:60524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfvb-0000Kb-1E
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhf-0000rt-N4
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhZ-0007yP-DC
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:11 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGaFJO000687; Mon, 16 Aug 2021 16:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=qGePs2QFNSfTvuBH7+YB/8qpJE2m7WykWxFo6Uuiu3o=;
 b=gc6MdU+eOfiCF28+mSky+2BJstuPqxrCtuXOhpYgLvrGylnWmFwhEgBKtxtP+AiZ5YAd
 ArPYZRJi/OpiKwJ5k8sOpFBtff8llsRX2ep38JNYVY3PQsnuOVtke71Q0Im/QniNtXVF
 5DUnq/iF23h1m8VnOt+r616Nb3OaA5krlo2IE7ooIjUBEzDZXoUlsphFSRMZWBnVvb38
 QGX6dWWpWOl/pxNTu5xIQ9TotyelMqE7ftEs1BO8rRrELcvzctHLNGQNHVDNSPOLBvdE
 KQKgAzzAYhIPYRA1xK2xorPErJRsM7l6LRxhlWtgbq3hFSAw+8ITNK69KpLnjk+NcOnl tA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=qGePs2QFNSfTvuBH7+YB/8qpJE2m7WykWxFo6Uuiu3o=;
 b=G32KNQz1z/+BohJ5NZE5d97LAJWDlDxBgl06Egbmo+QyU7+KKPg+y1yOwxp/mqEz5+6e
 aP16StKvznq7lOd79B22BkZ+dRVYuqn8J3s9eY/8ihRi+tvPVcuTFGjLuyBFNYK8k+Gl
 zJgS7LqyaSP8r3ULtQ5mpqTZfhskdo/EL1GjZSVflCCJjG0qkxLayFbdkPxf/blqwltT
 xez+1FOpcdj87EqLNDoUQ+J6XK356HetzTSvSAyGe72IArltIbrxB7gjG2x4x2IRANfk
 f5SsJKMkv6Sav+UPWTGgGBR5c/sRhlgag9tSaDxPLbPHRvcHqUWRkVPNvQGr83b1nnnL og== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af1q9anv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeo5x159237;
 Mon, 16 Aug 2021 16:43:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3ae3ve34y4-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F50STqsKGHZCa4qnxX0k/hoMzwKhqjv8EZkgx2iQnzTfF27Yim3WYktAq8NWkmmj8IpqDGH/9rNAZC43hInvYpuwBIdEKc4sxVnk2lBo+liGB6UuGCaOoYUfmMFqqzWNlLZYrKulVcgtiiJATYJXpkSAVIuOGzqZIGPp8yQlDZjNh8kqnXuSGXOT1ExwRrv7mfQiMqT629pinB9gZ14hIhuqkAGJGWB2870u0m8w+TLh1A8wzu8tob++hGTQ6Wlwcabl3oZFGSlGvQbSgFHA6NDRQ3IDqE9pX9GMvgg31/po89a1z8IXZsIw+o0utHQPoMbfnpEj+uuBSSgBdVzEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGePs2QFNSfTvuBH7+YB/8qpJE2m7WykWxFo6Uuiu3o=;
 b=XvxacVjcb+MgL6TOiSCMoVqrvBNJ57SSSbSB18T9Jo8pg7LmZ9iShBtZh21tkvjriAuaVZNj772kFi8DM1AdoKNlHatnGhZRmAAlqXekgkwdB7fUd0hwDfaN0+XSWQlgB2zbfIdWTjQY1yN+PBttLR5Gisz4Vgzs+0zBFA9YmsZDtn432BbeyIy2S4+1t6p9sZaOzSYjHdADm2BSztXiX4v8zNlT28gbpeQk5dSaClEb9T9UPdVDHEqZU8/MD9zsljyE/eytRKGVD/IcNiw+JdHQc4GEfYxh1I67NMXtRM3hVKGOBEpvUXqRFmCKgoQVuxtCR5e1PYEDUObTdk9qyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGePs2QFNSfTvuBH7+YB/8qpJE2m7WykWxFo6Uuiu3o=;
 b=rJtFRQgl2gVA47f9Jc2KQ4GHRtEYJe/W8URT8pjWUXPV/z1PJ9oGqFFOyccM+xKAxN5Q5CWQFYjDY8w8ot9LSI7m8qIk9/CR1mdvJ2cHCYAe3kTabQH7wzG+mP9v4Q7z4VXvTTedVZPASqG8di5gIIT98TeV45lzYLFvz3ZidZg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:43:02 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:43:02 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 12/16] vfio-user: proxy container connect/disconnect
Date: Mon, 16 Aug 2021 09:42:45 -0700
Message-Id: <7f6595dcd88bfc0b459d3befd615a569635bae7d.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd93c160-5cd9-4990-03cf-08d960d4e99a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4765D9237A2943DAD498C22B8CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mbFngX9tuTfBFS2HKkr7hZGalHDeFBjZzaAzbSLYcAwMOn3rSJV8L8R/MhGqM7ktLN25lNTZMNW+QMPQna+cfUeioTf74jzxQi22ra/nSpaM4LwEENyq0qX7DXI59Y5aRyLnhr7HiPm5wB5/5vuAnkb6w/t3j5A8z/k6zsPojkWqXY/xBddzeBm4MvJFUuPkC7W1Cl0GYY6BEu6uOywbNFtGmrllqKfxmfXurnK8tRfWbqMwv9+4+iysuc82+MG8fIpLYl7QkDJ09twuKglsrSGro/SDSzZmmOs0FcNl+iEiFZQIO84sE1wP/Jp9ilmwMKJgTss5T55HBfuoJJIeE9ym8l8mNW4+Ota9QGLFtJ8ZeJqyYMC3blZd2O697Ex6C9BJmw1Ivny3camU/PsUpt/Zq3zue4W/DwD/s0T0XB+2OTrRKAhB2HnyZY6WOb4HZsnNJXSVMUtmxqI6yW1diWUIlB6IFJMDw1yuWMbLWSJ6k47Z4OtWpG7JlAxYLW5LFGZ0IOvdB9Du9jUGRTWxFOMvMu82G7NDd9rF/DGbFd+MV4ORHmJ1/cQXS8s1nn3d/rigIOGUXou0RgRQ3v7DogtE73f2e8GLFOsVG9VRP9wa0ZYaKrMD/m2FosUK8+mmlJWTirY3Iq+Ypxr4hmi9ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cx10qUFyuC1D66I15ksf+IU802yCUiELQxciIunvOq0kslz33cupOJtw/BLr?=
 =?us-ascii?Q?snUTi50RAtdn+UycPyfCrJT/+DaIAjszZr+bkHcpO8tPEX3kb4xOCZOFmf+O?=
 =?us-ascii?Q?Kv7gXtsOcQ0Nt20vnEJ+GTbBaXKxNxcAReT+g5qYBnWeEdd6zQsmai2xSsjf?=
 =?us-ascii?Q?v6LGDwcpe0LOov2dhH8HusdaPCDJx9/6WIvYAU9FEF/ZNWieO0OaWlpJpc9r?=
 =?us-ascii?Q?1ZD9pTrbamhsWWEho7qKacZrKeT6VYeFaxyJ7RlyQDV4cbksAYkphz2ezRAv?=
 =?us-ascii?Q?wZk41LW7Btbmaj73O3yB1K+zyF6NigF7QpgUqN9df+QkOrCx00z5/DSx9dQB?=
 =?us-ascii?Q?jfr+rITuCj1KoR9ySwKM4OzxVxUsFQhHy0pgc4hmKTDGjWa85QLB6CrQ4gkJ?=
 =?us-ascii?Q?Ah+NZKn66zhkRWD0F4/vlpGT1O9x1JYpS/xaVpebwLUwxptLi/qmyn0ydnfb?=
 =?us-ascii?Q?ZZuI5+bGd4csawboaKZM4MF9/eCiSRKji2o87yc0nMAfg3pZBZEuknYpE1p+?=
 =?us-ascii?Q?N9oKXlwYZqeq+rVIkB8GWta+u1xtL++qkT3Xmak4AvL41OY6MOh23HAI/s/1?=
 =?us-ascii?Q?mAeZGm9pn3CwTxWefVRXTAUJIsaEK9OH5qclc8Cr458WXFdy8p7tDc4hELqZ?=
 =?us-ascii?Q?gKI6ohwRJiZhMnyA+ojBsnziJqLGNp65rPyQRhFdIrQOMVlmso42pC1cPN9u?=
 =?us-ascii?Q?Bn6raaXwBckpi1nCgeSe6RxNBeBdxq1TMmYn6z5axTtATatLErBu0st6METg?=
 =?us-ascii?Q?5njO2hl7xw5WybvIqczm4Xy3L368SjROA/CVzeUBual328OW2HY/8d6RCQsk?=
 =?us-ascii?Q?GverQlyxceswZDHikGTwPANz68B1+G7SU1LuPKjRUf0MS2dav5z8ALC6buWQ?=
 =?us-ascii?Q?FsKl3EMclb0faG/J2lY0yVPK1FWp+se+r6Cb1G4e1Vjon+0aJpMjwZBnPpQ3?=
 =?us-ascii?Q?3+pxoxL+rJIXwjUkKvPRX1xsymnt+ND6XH7C9chtGY3CMNssAgNiV5f2hhfG?=
 =?us-ascii?Q?vC5knTvg35b1nfo5XshjuqJx82IVp6/nf2rHLWpINfvG1UFZZEmrEEFmR14m?=
 =?us-ascii?Q?HBJf3tJ/Oq0Sc+/0UfbsHnNHLmeXo/2vIa2rgfTOkRE+s5Y6mgvwx0io2tYX?=
 =?us-ascii?Q?M0HqvtjU/e7XkCBqtfIbfrlvmE1gw0a5I1n5iL3w0wzRAsxmV3UqX9Kssutw?=
 =?us-ascii?Q?nnhYi0M4Tqm7xxbTk9JDnv+pAyKdALIRxaaygAW5ABWLt30QMF/L0TeI5A5P?=
 =?us-ascii?Q?12ptV7EPnTHhKOlCi2ow/2UIoCnWhIpzPhwFjpO9aDTpTTYpQ2h8BZyT8cBz?=
 =?us-ascii?Q?i1RBdu/cxuH4H/rF6ngaCxN28koyZn3MlMDTklLJvto6LDhbPT3Kct7JsrW3?=
 =?us-ascii?Q?Lpa/H+AWFdGYVRlz4oN5P1e8+v/+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd93c160-5cd9-4990-03cf-08d960d4e99a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:43:01.9463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQ3sPeC7R80UvcvlceQeg/QpmPtFaDGtgc1JZO/U8ZD8OGsKvPTm66CdxBP8pvziPIU8jJFvwABKgPN2PVvGtp2hB/FQs5iV2Iq8DgWoVLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: LeNAUWSeXRzR7ZqcyHZfFvjnHvi-TK6z
X-Proofpoint-ORIG-GUID: LeNAUWSeXRzR7ZqcyHZfFvjnHvi-TK6z
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/vfio/vfio-common.h |  3 ++
 hw/vfio/common.c              | 84 +++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 | 22 +++++++++
 3 files changed, 109 insertions(+)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index bdd25a546c..688660c28d 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -91,6 +91,7 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    VFIOProxy *proxy;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
@@ -217,6 +218,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as);
+void vfio_disconnect_proxy(VFIOGroup *group);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9fe3e05dc6..57b9e111e6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -2249,6 +2249,55 @@ put_space_exit:
     return ret;
 }
 
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        qemu_register_reset(vfio_reset_handler, NULL);
+    }
+
+    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
+
+    /*
+     * try to mirror vfio_connect_container()
+     * as much as possible
+     */
+
+    space = vfio_get_address_space(as);
+
+    container = g_malloc0(sizeof(*container));
+    container->space = space;
+    container->fd = -1;
+    QLIST_INIT(&container->giommu_list);
+    QLIST_INIT(&container->hostwin_list);
+    container->proxy = proxy;
+
+    /*
+     * The proxy uses a SW IOMMU in lieu of the HW one
+     * used in the ioctl() version.  Use TYPE1 with the
+     * target's page size for maximum capatibility
+     */
+    container->iommu_type = VFIO_TYPE1_IOMMU;
+    vfio_host_win_add(container, 0, (hwaddr)-1, TARGET_PAGE_SIZE);
+    container->pgsizes = TARGET_PAGE_SIZE;
+
+    container->dirty_pages_supported = true;
+    container->max_dirty_bitmap_size = VFIO_USER_DEF_MAX_XFER;
+    container->dirty_pgsizes = TARGET_PAGE_SIZE;
+
+    QLIST_INIT(&container->group_list);
+    QLIST_INSERT_HEAD(&space->containers, container, next);
+
+    group->container = container;
+    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+
+    container->listener = vfio_memory_listener;
+    memory_listener_register(&container->listener, container->space->as);
+    container->initialized = true;
+}
+
 static void vfio_disconnect_container(VFIOGroup *group)
 {
     VFIOContainer *container = group->container;
@@ -2291,6 +2340,41 @@ static void vfio_disconnect_container(VFIOGroup *group)
     }
 }
 
+void vfio_disconnect_proxy(VFIOGroup *group)
+{
+    VFIOContainer *container = group->container;
+    VFIOAddressSpace *space = container->space;
+    VFIOGuestIOMMU *giommu, *tmp;
+
+    /*
+     * try to mirror vfio_disconnect_container()
+     * as much as possible, knowing each device
+     * is in one group and one container
+     */
+
+    QLIST_REMOVE(group, container_next);
+    group->container = NULL;
+
+    /*
+     * Explicitly release the listener first before unset container,
+     * since unset may destroy the backend container if it's the last
+     * group.
+     */
+    memory_listener_unregister(&container->listener);
+
+    QLIST_REMOVE(container, next);
+
+    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
+        memory_region_unregister_iommu_notifier(
+            MEMORY_REGION(giommu->iommu), &giommu->n);
+        QLIST_REMOVE(giommu, giommu_next);
+        g_free(giommu);
+    }
+
+    g_free(container);
+    vfio_put_address_space(space);
+}
+
 VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 282de6a30b..2c9fcb2fa9 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3442,6 +3442,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    VFIOGroup *group = NULL;
     int ret;
     Error *err = NULL;
 
@@ -3484,6 +3485,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->no_mmap = false;
     vbasedev->ops = &vfio_user_pci_ops;
 
+    /*
+     * each device gets its own group and container
+     * make them unrelated to any host IOMMU groupings
+     */
+    group = g_malloc0(sizeof(*group));
+    group->fd = -1;
+    group->groupid = -1;
+    QLIST_INIT(&group->device_list);
+    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
+    vbasedev->group = group;
+
+    vfio_connect_proxy(proxy, group, pci_device_iommu_address_space(pdev));
+
     ret = vfio_user_get_info(&vdev->vbasedev);
     if (ret) {
         error_setg_errno(errp, -ret, "get info failure");
@@ -3587,6 +3601,9 @@ out_teardown:
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
 error:
+    if (group != NULL) {
+        vfio_disconnect_proxy(group);
+    }
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
@@ -3595,6 +3612,11 @@ static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOGroup *group = vbasedev->group;
+
+    vfio_disconnect_proxy(group);
+    g_free(group);
+    vbasedev->group = NULL;
 
     vfio_put_device(vdev);
 
-- 
2.25.1


