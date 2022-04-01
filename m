Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5364EEE6A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:46:19 +0200 (CEST)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHbW-0000qG-TE
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:46:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGt-0002bK-U4; Fri, 01 Apr 2022 09:25:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGq-0007EV-A5; Fri, 01 Apr 2022 09:24:58 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231CmE1K026804; 
 Fri, 1 Apr 2022 13:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=g3o/0osTw/k1xjgw8ftcqt+LcPq6qcqdhBjt4DQe37o=;
 b=G6krgYzcaSoG7XG1S63KQ3+MgYP4ky1XTntphezRJSvFKEwb/J4jlKPwUjhVNdoBPV7H
 WEGdxkeZv9NpnKZSrDmomnNZAfrbxrNjxyzCzhEklwfItn5jQYU6ZJQ0gK0vK4Is4Cmy
 202ZOur2ff9ID4vgbVl0zUUbxcHPRvFUA91Xl4LX5rhYnUH1demOBpUKSPjPbXpsL3VI
 cpYxMf37bCVIkZmaKUDKXKzXLhxwUEaPMb5TpcW4iKi7MPinblTAijSH70imjX0w6CpA
 ZndcQzrAW0KavasjEt9bNAmswEe+xsRfixPgkFIwLzeEz+oM/B3I6a370FllhjSJFK9T MQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tqbesg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:43 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231DHP3t011113; Fri, 1 Apr 2022 13:24:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1s96j87r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZDtsFXgsVt0lldrxN7JoOz+fDSFd2xdfMoewLibWWnGzAlpwLYN21bTuSOvxeZ6gKIlYZIaL0nc7Zt1pQIumlCq85j2mPz8mnhau7SelPPprznD1ARbLr5tQ0eXqFICAej4jR1dxJZxacY4G0Sr0I9OfzoYT6QqruFzR50TAcuHzdwpMoSpxolf8a0wslRTsj4QOHeMQiIsklPiz6s+ZmjWJc1DIr/FHHYAFbcrT7Fgs71jgK+O3N7mX3vrYx8kLA1gUNqFObW1BlwJeTTbxe+3QclzGzKQNV6vmoqp6JmFo69ANF6xTTFJTsgcYrbsqRe6EJq/Hu5hLLv8dza4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3o/0osTw/k1xjgw8ftcqt+LcPq6qcqdhBjt4DQe37o=;
 b=l5LOJP45+GEvC3outxUiLg3BEJtmSGP9t2RP4NtlGuQGj6ZHP900GYgvZT7AZPyi/n/Xt0BlY0HL28tfxRVw1p+6RhVaLuADb0tyiTF5yiYC0wCp2sqkhWt5wHFnDPSryizempdhbQ1eAaN17pxHauop6uC3B2ZbYusoAHURbpInVM1xaAdfqjlKKFMnWTH5iKv5pZ28k87DU0Gdgn3ZEr2sZj2iw5nVAeutC0DQ8wcXNSh6hv6oTHmwvAu+q/tVKpTIZwvfTs3kuCdMDoSO0rXKlPJGjUTsMPnw3ZjMvUwEHBUxGZV6WIoUD0W6isU+q3pMFyrDEAVnJHCGBg7reA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3o/0osTw/k1xjgw8ftcqt+LcPq6qcqdhBjt4DQe37o=;
 b=CXEsuBoy+nEzEHwt+HIc8QwELFCfkfN5kAheinjdlXU9saByqtYNUCFPR1lR5Jl6Q7h0z0dgHTaK/TiRnYsUSw6ah0eWgm2j8ISYCJk2KuoVjdXayrb0ni2n5iC+hPQPnN9Q56vpwzdobo1hdL8bf0iDqTFyLtex7fIXQUxs+Gk=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4517.namprd10.prod.outlook.com (2603:10b6:510:36::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Fri, 1 Apr
 2022 13:24:40 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae%2]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:24:39 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 8/8] hmp: add virtio commands
Date: Fri,  1 Apr 2022 09:23:25 -0400
Message-Id: <1648819405-25696-9-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e413167d-4ae2-4d73-f2b7-08da13e2f99a
X-MS-TrafficTypeDiagnostic: PH0PR10MB4517:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB451772A89E946458D6DA83A5E8E09@PH0PR10MB4517.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbmxpna7JPKisHcmh/nYLxbrBxAR2gmko7o+7vyQxlR6y4lylsDPzOTB0W1n3TWcgf9scc21/fG2t/ttMb/4CYWzg93UFMsSFZqegmNfg8Sc6IZSRZSce2ojgQOCtSPHugYMSzgXlt1m6Jhc28NgN0nSpi6kZmXdBZ+k4BqLKlv/e+OyFTgg/X86yT7mH3MI3Tw1J0cR/brfzHljxInPVk7dx2JwyqsX3XdWxG8vTRkEGy0nu2y3JKHdYl8H7P2jZXxhM81MMnNKO2XYqeMBofy3VAI1RtJD9ZKsBU7uRKcWcZorLseC1GEknQuBIIyGf797J/Ntz6N6xJ4DyMY5tiDHzrblQlEbd4t+joqe7X04GmP+a5HXMzYaifMxeuR6OajM6jYUnNjidq9wbWpu6miNzy7/WCc2v9Gwrb2ztvcFEqAI+1tHfv1V0muTebdQrI0irxbrzEhpR7HLOTgVQkuvj2Gkdjsw/fNjnAVgXB1AokvtokGqmz699qx95CXCrzV3LNU0aHNiAVgEYZ1Wr9Q6seGtksm7pSckkloYiHmCGXGc5dMBXdxA3LnamTQdMWY3Srdj/V5Oqk6niQIBT5ALFJsHEWssT/nAlLhMC4QY3WykkD35VVaMSlljAWhCQBlnPF8RYCGa10E+cPHtmyKDhm4UKH5ACBqug9Y1uUCj+jXfVLJAPq87qO6tXnWpZOQGH/wSr6h4Rxn0OTAYJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(186003)(26005)(86362001)(6506007)(2616005)(38350700002)(38100700002)(6512007)(8936002)(83380400001)(4326008)(6486002)(2906002)(36756003)(7416002)(30864003)(66556008)(66476007)(6666004)(5660300002)(66946007)(44832011)(6916009)(508600001)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fUp0P8V5gnorKwT9pWK9501jQrJtuFovmFPLyd4RocujeCdp253P2rh/2Yl2?=
 =?us-ascii?Q?o5QjgRant+PLehzU9wRUyvLRQaFZ2t93UhQiIfK+g0/Z1s0NuqtwmoMzDqcc?=
 =?us-ascii?Q?/Ua24HMBst1UF8UNXjteFYUAUVT5VEQdYi4SqU/WjkSs0qHO4edxOlqCjMA4?=
 =?us-ascii?Q?LaYHy/u5VGl4909i8OWyMpO/XoDap5dPaF2Tbh3l712JH0ykXyN4CGAPjWxX?=
 =?us-ascii?Q?J3xtuZlElWy/1wUK8lfswHVKHaUpnJ6HnqNcb6V1X6ildEl8YvgtlRc3Dzpl?=
 =?us-ascii?Q?hjIuuIPOuMzR7iS7on7bJouM1CrU1dc1V2cXbKPGS2lgTCeqjP1mGQZlq/Hf?=
 =?us-ascii?Q?H3iG+2W2uiUAJi7BPbOAW7Vyp8YWa10+X4ebvDEGyatU7GdHcQ5//AfI0nK5?=
 =?us-ascii?Q?DSGFReC9SdE4KtriPEosECPSyInYVBBw+7xBcf/hx5YSL2YM1ygz/MqQ9sQV?=
 =?us-ascii?Q?E//a0slglGuqFiJfqV9P0taITuWg3DC6ovalCcPtkEMY4yT4zAjymHwPH2B0?=
 =?us-ascii?Q?Ab4A92Pcs3Yyuki/Ot7LQaTV7bWDriWw22b3kzm9G/wsbreSM+vmswjpTpPI?=
 =?us-ascii?Q?Mz5ylJqP+j3H7kIjkq9wF5QP0PGxQnJI3+4537O+iRJkXCoKRWUDqPe7BWQi?=
 =?us-ascii?Q?ggOUcHzRZm+1igSOxAaF7jPmmcIcGnd7AOs8kfA7Bm3peR/0tzbNYEYSSSzJ?=
 =?us-ascii?Q?1sJYQlAPhWjnm31uMI6A8iaa1QOsJHEEZrp4sz8ndM5q5Hfl4iJRY6AhkVfA?=
 =?us-ascii?Q?zjSDKByf8MWfYMn0ysTFuoYIoGG6CBvn4CURK+jX7YHlUCLJikmO3/976G7r?=
 =?us-ascii?Q?F3folq3mq9Kd3b2RCt2iEgkvbwed9f7qCd10AeQjmCTB9AygX8onw23GEFc0?=
 =?us-ascii?Q?LflR3xaPrp7jb1IryoZx3g8Gu38u0p2u3Ukl9eaUWx6xOXJ07pqjhKMfns4E?=
 =?us-ascii?Q?W7ePK9EzfH1kbEVfd/QDzolAATaJoj6h54cI1bb/x2eQRLBQjdXSSPW9OaKa?=
 =?us-ascii?Q?IMZBZTeRIVl3V7Z18n2+nqOKyj3yHbhblIhYWuYIyaYS82APd8zWjtrET3OA?=
 =?us-ascii?Q?5XQ08o6Bb59CKNSh+drOvTUoUQzq0Z0XF9QaC10XxkoU0iC6s23qvaOXRQc9?=
 =?us-ascii?Q?77DQIeWx88EPrYCZbLL7kxpOZhtYBUOAXgC+MSj8WL9YvYQxjngEg7/fOrv8?=
 =?us-ascii?Q?iNXB4/gHXQyLOYf0xaFJdWsQ8ZqRjNc7pSKx7wXu6tPsQUFAbSx0+ZS+1nPk?=
 =?us-ascii?Q?qtzbPAO7YF5oTVXqyok0LgqEbQypvDmzKQYpVilRyEeWjXfNhT50K3yf2Jfx?=
 =?us-ascii?Q?fquHayH9W3YOR6Q0GZ5ILEX2hZUCawsmGfTOGbqkBL2Jeu4HTg7BbSuRwDut?=
 =?us-ascii?Q?8a6GCLJQu/Ih/L7HK6bb4/2Dy3IefCckNzasPwFTggnOoVYdOaRTXLEKbP0J?=
 =?us-ascii?Q?RKr7qI+YDVCnCHXJY02O0Nc485r4XoXTNhh2NI+miKw10FybJRdJPXCQfsTj?=
 =?us-ascii?Q?5ewIUZbC1Ybka//YFwoJRWkvm6a91fSf/PVQtl00HFXq3x3GQybk2UGO+/nJ?=
 =?us-ascii?Q?Kr4+uQvV1PAeLOnCFA/RMZLbSmss4XzwxMolFZtp2Da4PJbtubeZkRBIbFBa?=
 =?us-ascii?Q?uHh5PsNSNg3SSSZjqm5aAMxRkK3y7VOY54Ulct75UTsKh68Nj6qgLfqiRZpq?=
 =?us-ascii?Q?zbJndT6blsbJxXNxCGvyUYfxkyXno/cAexMBqkyqTw+9v93wuOynibj8CSc5?=
 =?us-ascii?Q?nf3TKJUQrACJa3L49Ea5UpVNRxA0u8E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e413167d-4ae2-4d73-f2b7-08da13e2f99a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:24:39.8970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRDomFLvb/noWzRNO7WWdHXIejTrqs6eni80ZAJ83NklL9e81v1QLr9m6/zzMeud9+WqNiI/p+kps470SOkayQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4517
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_04:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204010062
X-Proofpoint-GUID: j0f3yPcar8EOoti83sShqrznlACwkDA5
X-Proofpoint-ORIG-GUID: j0f3yPcar8EOoti83sShqrznlACwkDA5
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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

From: Laurent Vivier <lvivier@redhat.com>

This patch implements the HMP versions of the virtio QMP commands.

[Jonah: Fixed virtio hmp command output format (e.g. use PRI types).]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hmp-commands-info.hx  |  70 ++++++++++
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 311 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 386 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index adfa085a9b..8f204d9cb6 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -894,3 +894,73 @@ SRST
   ``info via``
     Show guest mos6522 VIA devices.
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
index 96d014826a..47446d8257 100644
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
index 634968498b..2689aca228 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -42,6 +42,8 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -2221,3 +2223,312 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    strList *pcol_list = pcol->protocols;
+    while (pcol_list) {
+        monitor_printf(mon, "%s", pcol_list->value);
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ", ");
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
+        monitor_printf(mon, "%s", status_list->value);
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ", ");
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
+        monitor_printf(mon, "%s", transport_list->value);
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+
+    monitor_printf(mon, "\n");
+    strList *list = features->dev_features;
+    if (list) {
+        monitor_printf(mon, "                    ");
+        while (list) {
+            monitor_printf(mon, "%s", list->value);
+            list = list->next;
+            if (list != NULL) {
+                monitor_printf(mon, ", ");
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
+    monitor_printf(mon, "  status: ");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
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
+        monitor_printf(mon, "    Features:          ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:    ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:  ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features: ");
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
+    monitor_printf(mon, "  index:       %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    descs:   ");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
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
+            monitor_printf(mon, ", ");
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
2.35.1


