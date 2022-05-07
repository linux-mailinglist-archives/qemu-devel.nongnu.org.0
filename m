Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A80051E399
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:34:02 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnAGf-0004pB-5Z
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABU-0004tE-TZ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABS-0002TD-Hw
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:40 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2471VoUs010450;
 Sat, 7 May 2022 02:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=BW3UaLtk3JIJwGyncE21Vp3BdzYalbqemCJ/MXTPzCz8YygIZaZqW7WZmSlXvmR42qFG
 5BATBw9IkJGwY/j/97x2dw7LpWVq0lUvAU7ZLXoO+MYxeprpxozLsTCLdZCqiwA/Ra7y
 f/hIlX1+JMwjFdFjy3MUhUfryKvd2sQr3XEfcZ9liq5Vl7SV+dQksOyiEQFjW7/T3ok4
 plMpOOAuYjqAOXRZMWsyEfvh697iXVFuRGSJTuKqkVcFfKxD5L/BEbaHvETP4R5lx87S
 k9hz+rsT30v/ZfB0zCSYIL0SO/IHLDZg024adaEx/E5ib4OjcMXSv+MWRKe6eBdq0R8k qQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwf6c015x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:35 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2472BQci024291; Sat, 7 May 2022 02:28:34 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf700tpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SG/D5ku9hWvXwrSfpBlnXNmXe3fEyvljEBghPkkZVn6pOz0pGa6EOd5yWHRdt/Q9piEoALfGilPn4x2XCG6+cQYX9PyPrvNu7urrV09VP51nlBFZ27wZO01POGaIE9ksNYj14nkQdaAlMuTq74PjmgXKIgGcAffW90RLXAREBIksSyKI4probaXL6CteZ6L/Oh+pNfY/Tz+kv5RU/ly7BnXthfOEY7ml2X2JELhVJ3SmBntjrqwHN8iyQ/fFTDJt/YnhWtJEAe5KUX1LLCtk+O1a8PGgmO9ZIP4SSZFS5HHa/bvor2w8NVLXK/Sb87Wfp7oNNRB9PaEAYqpm1/tElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=hvxCLAC5QtXGRE77HYbKnpwzb0EsggIxBr2q8MRt5xh9lNmRWgpggZgM0O9IRN8SICRqRwGEqLi8B6I4QJi8Pq5YX6c5zBSlcxE6IW7eEQpie5yYYorECG4GY8+czFR0JgghNevrb/4nyUGIhzJGCdkr794ozZgcY7BYwi+Gv/Yir52zLS24OYVpPeb/hfxxxk4Jsxr+igD4RKSfwzSuTJpOa3gytjfXahUXQqJnrQdscBdkWfBhHE0PM4VREzGswGJ9bxN19IbGFyKQHBwOkLypj7oCs74rgUQjvNjKe0G1RkOg4aMPR7sos/GSJU5T8Urf6D+bkSlBw2EJKBe2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=UIDP9j+0vGv+pP4QNfHXNjJI135mZ1uto3cunlDyoZgml7AlISXDLfEHGtVhgtQRX6+V3/FjVi8oFryE4WdsPE9d3KAIFNMsJGCpu+1Zmu2PIwuRxKIUPVLe1720Av79+UJJ+tebTjVsgqBPcuSAR+Lm+TmCggBPrCQiao+e0v8=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR10MB1370.namprd10.prod.outlook.com (2603:10b6:3:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Sat, 7 May 2022 02:28:32 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:28:32 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v4 4/7] vhost-net: fix improper cleanup in vhost_net_start
Date: Fri,  6 May 2022 19:28:15 -0700
Message-Id: <1651890498-24478-5-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:100::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2714a7ed-8c10-4c0f-a1bb-08da2fd147b6
X-MS-TrafficTypeDiagnostic: DM5PR10MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1370E04EE2F68B59ACD45172B1C49@DM5PR10MB1370.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L70Azbi++vZlWcfEaOQHy9Pf3DCHVViZrJ+KLi1G76wLd8R5dAgFbjrw95SqbQEsizVGK4CqjgnDCCFm/xzlYpllUhEm9WQGa+Zi80OMSBCYdjjZSgKrK6Cl5+4oc0b0UACGxWd9JOAwCNDSLdm+doPX7tmiE41AEjAlPx/oCvwlQw+oirGG/dO5D6iiDSFlVJF153IsxSHusopNQrmHl8YYWkHBB70czhFqVEjflqFF3qvsLysjjvZNR2z3UksjLf/Wq7RDGdxoYq63Nmrb4HwC9nE4TZIE4IJUlvrp2nsWK5qHfFi7P5cyzJ8FeZWpz8kPAOHQNltqijlaN193Ygrz4KCsUG1KbUMyQkzjMjTNFqzRv+mtorULLDxJ4feFJ2AIr3b6I7pBBtfxzTk1xya9nBhUbtCrqpSrRkdAJM922F2wwIZhbezvKvoP4ZVnELf9Rn10XFgN1PKRmShJG4jRTPkwkKcImQP2/H/IoyWikR8C3MSgKSUfD5hr1ioIewkS7PAt9mx2oBwoF3ItBdtISdS990eBiUbhXOs1lzO5SLjZ86Zs5vHLnlnb5OjlAZ4ASkS0SgZwpbx+Hhtt85h10kVxECYyCiNGNrCfOvHEN1fxFbfmgMkup5Bu8ArULOYffN2cTXrNrdItMV2ONRrBn9iY+7IBGssAanI/NPgWh935zke1sF5TmpECes5DCweNxPZ65gBCfOvauSw9uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(52116002)(6666004)(508600001)(5660300002)(6506007)(6486002)(8936002)(186003)(86362001)(38100700002)(38350700002)(2616005)(316002)(8676002)(6916009)(66476007)(4326008)(66556008)(2906002)(66946007)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0rQ9cJR1HgKmiWSEy/xwKBpJBsEFxXEilvhODqMurRM84vdFFbDXxJ+MkeGG?=
 =?us-ascii?Q?D1iD9ZId8D2EtRPfZWh/sUJzJC61jViChZ/X1AcUduM4pGW/Ds2UGnHSV8vn?=
 =?us-ascii?Q?rlBe5Hado7pG2Hwx9E4DfwEh183aJ31ZJ6Q83CxBwPdjngYXM3CJsfImAMmh?=
 =?us-ascii?Q?bF/FRg9FTDrfzv6I4LQj4mabKQM+aFa9EZ9wJHRjeFaqNrYVXsZ/zGg816wB?=
 =?us-ascii?Q?0p01wvy7AY+pXIspxZ2wouFzV83rPqVYDcCM5N+OMQWydk0V5P3b+O+DqXM4?=
 =?us-ascii?Q?PvCejI8B7vvMZ7K6r6hev0jHT09ICOKYbP3q2ScGZKiBzKmEBfRv9aJVomb2?=
 =?us-ascii?Q?neeR7WcSmn/JvEKSX4nbmT+mTGqhzvrAAOAzTwUr8kFkv0aZzTbil+w25Zi2?=
 =?us-ascii?Q?KKJO9LNrGkkwtI7A8snFrO1oyxC3vKpxwz2L/EvPDryC4WTyVe1nHZoFwmQ1?=
 =?us-ascii?Q?OaYqCvh2BD3chpJI8id+03BzxQU4ZQUWYZRwnmJb3o0c8rpnx533YMhDW7Ut?=
 =?us-ascii?Q?H2kUZrdJg/RmcyOF0Bj17icVJznqzJXp3CxsnrBmgnOsmVWD27+ZAJWEjPzx?=
 =?us-ascii?Q?CO3NtDGpYEWCBnl75HhL3e+u/K8Z3U2MGOIfOEm7sOKPDXq+uBjcyBc3i8Vd?=
 =?us-ascii?Q?QJ/mlKVHunQmf6pBf2UU2ApjZJZFldrenqGV/Aq60fLgB9InynvmV0IAdsAb?=
 =?us-ascii?Q?ZVkh2yy7rd/cYCYd55b0hHwo2PDk8BCC/GvL6GGtioB5nS9d/HPEDwEqYJu+?=
 =?us-ascii?Q?430/09sj5LrYiAn4BhYXPuTV7Z2oddKlWm5gtKp/TtYExdrvqAyTemfSCDTL?=
 =?us-ascii?Q?Ao3dacI2NZPwk00fvxwvAlv5y1qMQWOv0ORM30du8yLoX8z9/cbQy36ZyvZT?=
 =?us-ascii?Q?qSDtQOXrxBZBXmweVsGYAQIPijFHa5ddH28aTboA2r6EJwUE8wT08KRmeBEa?=
 =?us-ascii?Q?PrAO+n40ywFNJUXU7YE1z1ubSBHZGBlFGlBRjUuZqGR6VL5uAJ3CIyzxqSGM?=
 =?us-ascii?Q?ndI4KmmKw4/4cWKVuoSklaedmeC3UxGkd1t4xmWDCRXXSq2pXJuJyR6jJv6v?=
 =?us-ascii?Q?1uA3LehtyWTvg7G8Bm1gvW0hWyjtTHHjsFLi9wkyXrJaNuGNfZ0/HeceAZMn?=
 =?us-ascii?Q?I50ZRxpDQJE1zaiB3/jPzpcw4psQPbnZgu1IlFZg4/pDQRJZPEbJxgk30Fdb?=
 =?us-ascii?Q?9nvUvq78vvuKqfplnN35FyT2dL8LqG8fBGOoeeo9g5q+KnYn17kIJwld5miC?=
 =?us-ascii?Q?h+zhj80G18T3FzvM1BBqDo6X3L/GjJTni7qhioeyjbsCFytffDeoLrCJWA48?=
 =?us-ascii?Q?HhAbNuvha3sUr2AiqGCMNSnnEUTgRdHYJvTs3XeKET9nzjYev916HRfeiUcE?=
 =?us-ascii?Q?borahbZnPCsCxkeszpMrMssM1hgggS2dHCRoHNhfTFGPtz+tTFbEX1jyWCKE?=
 =?us-ascii?Q?m6va2S0vzoK3+uVCqlZoI8/CuYIPkY+szb7Fd/BPTalGMAyCRq7r++IgAOH8?=
 =?us-ascii?Q?lfiVDRgupU9WL6ibvyIMeyemhqP8zZYg0BbOtnG0qhgrq8F+aTM1F0txKMR/?=
 =?us-ascii?Q?DXAFEJ6DLVqCPpUSSOrdie4N64FB8WFaSDp9WBMgGM3mRTREcHK7Wpy6XIGf?=
 =?us-ascii?Q?Gw9pF/KMF9ze5vFrgiEUrToZjhgVZNmhfhTUadzZc/CxjKIpF2RjLk9WD3jL?=
 =?us-ascii?Q?D/RbJNzW1fkvIzi8u8jAr3NcbcsIFQxJrOKBJNihRT09WarXQH5hImotq+f8?=
 =?us-ascii?Q?5IymYfDLo9xOl0fqXh6TMhfE5Bj+dKM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2714a7ed-8c10-4c0f-a1bb-08da2fd147b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:28:32.5574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KokExx7FAV/FQGM0056PJ+BCGwYYnQIE4eeQYmWxaetBOyCy0eCu5/NklCWZwJw7rF0nzx6akAbfg3nwXPUGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1370
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_07:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=938
 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-ORIG-GUID: yq-JyuH1pDA7WtaSMcaZUL1iwjdQzqM7
X-Proofpoint-GUID: yq-JyuH1pDA7WtaSMcaZUL1iwjdQzqM7
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost_net_start() missed a corresponding stop_one() upon error from
vhost_set_vring_enable(). While at it, make the error handling for
err_start more robust. No real issue was found due to this though.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vhost_net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2..d6d7c51 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -381,6 +381,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
             r = vhost_set_vring_enable(peer, peer->vring_enable);
 
             if (r < 0) {
+                vhost_net_stop_one(get_vhost_net(peer), dev);
                 goto err_start;
             }
         }
@@ -390,7 +391,8 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
 
 err_start:
     while (--i >= 0) {
-        peer = qemu_get_peer(ncs , i);
+        peer = qemu_get_peer(ncs, i < data_queue_pairs ?
+                                  i : n->max_queue_pairs);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
     e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
-- 
1.8.3.1


