Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A53858FD2A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:14:25 +0200 (CEST)
Received: from localhost ([::1]:33224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM812-0001r9-H9
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7HR-0002mc-8P; Thu, 11 Aug 2022 08:27:17 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7HO-0002Zo-MH; Thu, 11 Aug 2022 08:27:16 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BCNC2j009437;
 Thu, 11 Aug 2022 12:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2022-7-12;
 bh=W6L/jygsI/LiXGnghNuVDHnzVmKpkn5D8aCNSzxNsTs=;
 b=x4LgL1K7vf/AZKcIZbiqAJCDKelyhEL+KTQMrL5cpeTpXl27F2FQIz7q9SFwJtUobEZe
 VWONWe2AaQwrJ2xMWj1QfpjGOlCB0hYE3YaeUndzsuCiidfa+B3iTiYToxvVllpJCZ2/
 NwTxztYIl2bLB3yVaAU4Ri2FWxKuIp3L351Vww/NpDfcpsyvWv7L7VrwN1wUT1ugBR1k
 xRZauVIlWiXSeqSQ08zaemJDRPyvnuFblf9k0oe3aufRLgQ1PkNk+hPJMywtuUqJH8eT
 EIUpPW8hk/34lGdnBIV6lN3kFHxizfeJt/4d2YvjVY1eUcnoMdA1eSsJfU1J7sY4GEOk XA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqgmeep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:27:01 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27BC4f4M023707; Thu, 11 Aug 2022 12:27:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqh2m8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:27:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnIUlHaEMhADw49dc+0I8jDjaIgeaIO8i8lTsD7U05/41PPBFvKX/nNbfzMzaReCAAhtHB+Ksa2/jUEngNJ0m3oLQP68lbTuO5xnOHKiDInuDXD0RkJYwpGxX6FTDMlDJWItPdrDCDqGQA41ya/eOeFEif2syaUpo04TYqQmEAAzaigHvsvEuBgMEGC+4e4pIdqziVVV2zIXXDhPFD0Ap1snZ8XPmq7MBj4RFIAJGHpY0Z4mETYB2KYaCDKiZtc1L9thobTh254YVGEW2HB59SEqFayJylMADmwEBGHpc+/DshKd9y+7M/5hwGNJ2t5Wmlnb62xk+TlXqTwhHbyrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6L/jygsI/LiXGnghNuVDHnzVmKpkn5D8aCNSzxNsTs=;
 b=cUNCMVOSCluMeCfFvpTxWGKKpYOwT2koP89QqxsoYQysMjKpZL6J6jF1jgT9BuG0Kp7A9+MWrVwGeQVRr98kc+cUcS3hQC1MOuVXeuaxj63YRZ1iCF+WWeX1pnUb54rLZSkfAhGP5rPQJyumCxagDDzcQKW1xmTr9ffwJSP7xBY/bWlnIGWTIRDNmt1YUYygGd5Dt9VPuGUdvFMQ0857whsyLhP2JGpC5yGy08gaCvVOw1hydpuK0t5gpbw8qoSZw4+I9yhro7hw1GIXtfy2YZZ+VGCwI4Li0ww1fKUEX407QI5sEwlprZYcj5/hmD3VuxpVA7G0PA4A4bYCrgUWog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6L/jygsI/LiXGnghNuVDHnzVmKpkn5D8aCNSzxNsTs=;
 b=nnmiAPKYwY05Nhql1sPCy+fOpcI/4lCnIuR6bb7LtHZNN9e1DWmKliluivx3RV5jMkIyWm/vCs1SkYfPq3ATINxHqkt3utXJHVKwlWfsfgqr5xuzw/EGCYR2WoyEeIYFYqE/nZbAa4TDtsrgSu2T/1Ttp8DRhzMsvBRI0xvr0+U=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM5PR1001MB2090.namprd10.prod.outlook.com (2603:10b6:4:32::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Thu, 11 Aug
 2022 12:26:58 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 12:26:58 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com,
 lvivier@redhat.com, thuth@redhat.com, michael.roth@amd.com,
 groug@kaod.org, dgilbert@redhat.com, eric.auger@redhat.com,
 stefanha@redhat.com, boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: [PATCH v15 6/6] hmp: add virtio commands
Date: Thu, 11 Aug 2022 08:24:44 -0400
Message-Id: <1660220684-24909-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:333::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba519848-d971-40e5-d039-08da7b94c8d3
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3n32SRv16q5NfyxUFZt4ds9PK7IMHYFNfY2IwueQksvk/gdmScTaVmW94z6cju51bxIiypi8Euhgk9di3myovvLA40qUbfe1eVNHNjjwxMEWkKa2aL228T8LGJ+96Z3Y68s9Qd9FeSKPz7tJtShGMJYHGU86nxN+JjySRc9nNfM95HouzIWDaPe9L6A6/5Gz4hR1Mp2Ds2gmMOudYL4kHuwXGiusxhAp8nJpP1+WrZ88PPOkyP+Chpf4JD0sFn1ZKK0aLPpx8pkEUklVGalD6v+7oMqUwRMgqJZ4YFLCTXp/xYGuBXL5BCgphNzaB3siE6VQdDIEW1yGYzL1UsgiNhv9XTCWcGwO7m71kUEWgVvF5mx3mhTF/rfXftBwQYD+GnoJlyf3wReZ2mRkHeJFtVflLUhasyfpYIl/DZ8KX+5F3Wyx21Hqg9bqZUGFpunwfRIzB8+aejNQyR3b9kkjwKrU9vNwkYFxn2TabifCY8hw6LhfF4hX8JB8BXOHHkD00ZrHVxeE8O223iot+eiT9q/Dz0fJLQy9Zmm8buQ6TXNqONOVm0II4x6tIv7A1Pyx6olOMitZXG6Q2vS4h8Ut3Xscz4YwKQ08LZZQhY+Re/E7Xho9pDgbuR9YPGop47QALic1Yb5nft/WPKE80WKhl8f0rplyLRwY5gZCp8sKSpRZbYaPb6jwPU3/8bgosBOnNshhhV4ft2SboAh58XqfuK0hi0jNSqYGYoLfyBVwHcaXIY2TdreInMt+oB1gUS1p+Ga8CogoCksNBvvP41ql7loN/8PQGRwC8LyD2Om2Xls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(366004)(136003)(376002)(346002)(36756003)(6506007)(316002)(41300700001)(52116002)(6916009)(6512007)(66556008)(26005)(6666004)(6486002)(478600001)(2906002)(86362001)(8936002)(66946007)(4326008)(8676002)(66476007)(30864003)(5660300002)(44832011)(38100700002)(38350700002)(7416002)(83380400001)(2616005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LSLgirgrl/V6vc0e8vYhsHQz863Vhm8Cs95OpQgCWRqpPz6ur3qBRfaQE2Cv?=
 =?us-ascii?Q?Ry7AvQannIaMtWi5arQjjlCc6EEXlGEcZcXK60VWGheGraLb2o6FgBuoJTBj?=
 =?us-ascii?Q?VpeTiwDwPYRXzpxIY3AKmeeAEsS2YtiFJO3Ikw+3K9MJWknOX0yH2m5+J/Q9?=
 =?us-ascii?Q?XP5qTp8yzD3UkgmvAcZSYp8bzbXdBpXoODmYIPCa7BqLTVj8zbLlWCPEgfJA?=
 =?us-ascii?Q?ivui18ehTi3w98G3tnJ1iTpLQo5G+APRuThYnuV2v9/zsQNVnd9zMvT87RtC?=
 =?us-ascii?Q?/I3QyqCGoNgMdOl1rTgp2GpvC3mSKPC4VnnjfDKEOXzKaIunmmU8GsLlO6XO?=
 =?us-ascii?Q?rk4Fjk0U10pkahjnISKvV5+XW+eyug6MKTNFFPHCodVq2jRV7gskh380NVRT?=
 =?us-ascii?Q?D1mDJA/4hj39edZWu0RMp5DX5ZYovuUS8Q9/e+8K+H668smHHTqf3JGgo4zh?=
 =?us-ascii?Q?KrTQinjsIHGlI7ymjqQQUi9ugicyGB5pv1Ml1Ph3KZvCo1dMWNM6ceyAFwYf?=
 =?us-ascii?Q?m7sjSsPUUXE1oWLjAaoz2k5xOipBfFOZ+2TdCgrZhu/FfDeXVqsXncc5u2H2?=
 =?us-ascii?Q?2NilUCAbwIjFjYtxYZlfEBaGqdW6h2vZgGduWQFHvA8YrrDNQLOoPQceSOaJ?=
 =?us-ascii?Q?4JderTqezQSUCccrgaUFuly1SM0YSF8jkOEOoVnIyRAvy97jmJRPWh/aFWVs?=
 =?us-ascii?Q?kxZzDU40hQA9FTiyLQYTmjQneSGOfQJ/lnSGHwWnPL3JsGrRWC4x2TbqRZFq?=
 =?us-ascii?Q?V8ZtarzmD2OvYd+Ypiac8uDMl7n2+InFtY289uC0CJPUYpYs7MQuH6ycQCEJ?=
 =?us-ascii?Q?rozkzecSKBCeDee9nNmV3WKQ9XhO+NmDgxGGqjelYK/9gJ4TiCkaZoIh6aU9?=
 =?us-ascii?Q?sB2tIIvkLFbg8fE5F9qv/5lOn2359JUz2UmbCx0aOOmkKyVocx1bAqQUP7D+?=
 =?us-ascii?Q?KbzjfDyPOE7bSpyU5WzUPc3OfOtMoZ9lWpjBd/G/yPz7xQa0cQUvku2lmglq?=
 =?us-ascii?Q?NBXC0mbmxuUmvT23IheUo2bi2qm7jSULR4PK6kVK5nb2b3vMFmrX0Dy6qZvy?=
 =?us-ascii?Q?DpbOdImP6wTD3E6SKPPXxUVk+KY/GzUZ0eKdXjtRFyVlaB9eSGWfwfMKHD75?=
 =?us-ascii?Q?zqUjXIGBeYN7wFAjMe/sDSS4sXO43mFt+GpOYkFHjDSbSClypPLw11ljeDu+?=
 =?us-ascii?Q?CM3Zl2T3CshcOu9tP0oGHhjmR9cVpSeMH4wr2/1jJnZksmjepCjKNPlW2UEm?=
 =?us-ascii?Q?LGo73GveCt4CLTDDrQd7TZCqtJmx+tDhoC2hls/Kx9KrI6ldzebKq8PrtywR?=
 =?us-ascii?Q?1L3mu38vtFD2ef1Liz3PgnFvplr/zxkyFcZNk/wLJaM9v8SaXgcIi0W45IOS?=
 =?us-ascii?Q?HgIF+jtrNKSeaQBauHEg6WxEySJ2RfDe0gL68sjTlda/j7im8Pbd21aLZGzK?=
 =?us-ascii?Q?Hlh+SdxmPn7KJJ4nZvEDvNvKzCojsWcC40B3ddgnsaCAro6pEGGdq97Ptkdk?=
 =?us-ascii?Q?9qKOW0lCvZBt1sJ/LGfcgPcvTj86tUq8C9Rr+OLHwyv10PTGrDLLex27b7Gq?=
 =?us-ascii?Q?zgMZoKgKhft7cvsESDxr7lB7w8DXE7QjkkdTB2t9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba519848-d971-40e5-d039-08da7b94c8d3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:26:58.3234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POMWb8fd+UrJnaF1itymN85AflDvc5KOd/rsPcwhST61yMRAbq3eS42fee2eVBIDM5kbSuqshuaD4OOKA8z+eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2090
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110038
X-Proofpoint-GUID: -9vLsWYiOmuWFivONiVDDXcZJ31U5aPL
X-Proofpoint-ORIG-GUID: -9vLsWYiOmuWFivONiVDDXcZJ31U5aPL
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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

From: Laurent Vivier <lvivier@redhat.com>

This patch implements the HMP versions of the virtio QMP commands.

[Jonah: Adjusted hmp monitor output format for features / statuses
	with their descriptions.]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hmp-commands-info.hx  |  70 ++++++++++
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 310 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 385 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 188d9ece3b..58cfa86638 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -921,3 +921,73 @@ SRST
   ``stats``
     Show runtime-collected statistics
 ERST
+
+    {
+        .name      = "virtio",
+        .args_type = "",
+        .params    = "",
+        .help      = "List all available virtio devices",
+        .cmd       = hmp_virtio_query,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio``
+    List all available virtio devices
+ERST
+
+    {
+        .name      = "virtio-status",
+        .args_type = "path:s",
+        .params    = "path",
+        .help      = "Display status of a given virtio device",
+        .cmd       = hmp_virtio_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-status`` *path*
+    Display status of a given virtio device
+ERST
+
+    {
+        .name      = "virtio-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given virtio queue",
+        .cmd       = hmp_virtio_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-queue-status`` *path* *queue*
+    Display status of a given virtio queue
+ERST
+
+    {
+        .name      = "virtio-vhost-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given vhost queue",
+        .cmd       = hmp_vhost_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-vhost-queue-status`` *path* *queue*
+    Display status of a given vhost queue
+ERST
+
+    {
+        .name       = "virtio-queue-element",
+        .args_type  = "path:s,queue:i,index:i?",
+        .params     = "path queue [index]",
+        .help       = "Display element of a given virtio queue",
+        .cmd        = hmp_virtio_queue_element,
+        .flags      = "p",
+    },
+
+SRST
+  ``info virtio-queue-element`` *path* *queue* [*index*]
+    Display element of a given virtio queue
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a618eb1e4e..a9cf064ee8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -95,6 +95,11 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c6cd6f91dd..0934dbd557 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -43,6 +43,8 @@
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -2472,3 +2474,311 @@ exit:
 exit_no_print:
     error_free(err);
 }
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    strList *pcol_list = pcol->protocols;
+    while (pcol_list) {
+        monitor_printf(mon, "\t%s", pcol_list->value);
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    strList *status_list = status->statuses;
+    while (status_list) {
+        monitor_printf(mon, "\t%s", status_list->value);
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    strList *transport_list = features->transports;
+    while (transport_list) {
+        monitor_printf(mon, "\t%s", transport_list->value);
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+
+    monitor_printf(mon, "\n");
+    strList *list = features->dev_features;
+    if (list) {
+        while (list) {
+            monitor_printf(mon, "\t%s", list->value);
+            list = list->next;
+            if (list != NULL) {
+                monitor_printf(mon, ",\n");
+            }
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    if (features->has_unknown_dev_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_dev_features);
+    }
+}
+
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->name);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_query_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %"PRId64"\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   s->device_endian);
+    monitor_printf(mon, "  status:\n");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:\n");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:\n");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features:\n");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->has_vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %"PRId64"\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %"PRId64"\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %"PRId64"\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %"PRId64"\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %"PRId64"\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %"PRId64"\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features:\n");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_query_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->name);
+    monitor_printf(mon, "  kick:                 %"PRId64"\n", s->kick);
+    monitor_printf(mon, "  call:                 %"PRId64"\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %"PRId64"\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
+
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_query_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_query_virtio_queue_element(path, queue, index != -1,
+                                         index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->name);
+    monitor_printf(mon, "  index:   %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    descs:\n");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "        addr 0x%"PRIx64" len %d",
+                       list->value->addr, list->value->len);
+        if (list->value->flags) {
+            strList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", flag->value);
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
-- 
2.31.1


