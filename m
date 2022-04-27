Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACC5113BA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:44:58 +0200 (CEST)
Received: from localhost ([::1]:46358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdI9-0005Sl-Qw
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4X-0005Is-Br
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4V-0005w0-FN
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:53 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6q87n003700;
 Wed, 27 Apr 2022 08:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=HV5vixaLCPMyjEeOVsQnU7Kg4xPbsigllEAwbq3oHVxaAeKJve5ZD7fSGSg9yQ10RuXo
 phVMmb404/NI1S/9Mfsund0z12xTt68YsRI/Oa+5ywOx1BADBMMxhnf+4TY9Iap1UKh0
 nsGWrkOIeadNO4y8dhTVCQx5DQvFDm3cGTb6Aigbz5UsBaGfqXcPpI4hVkHm/ziptedw
 zZ3Ah6ToAlcH9zuHcJ0KmWqTG7KK4kWeEl7XfjtH80m08B6QXUpGBnL3FHu0hrCwTuDi
 VkN4ia7VqavtSj8mklqPcUsxRDZvdyIKVpc1U0+MHPSz/gU+dyo4GTnJdk9g3kiT3OsN QA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmbb4r1ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:44 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R8B8bv028095; Wed, 27 Apr 2022 08:30:44 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w4b4f2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNKgZ2K4+8idevnpLJ8lACcwluFIK0PkI1Ghp6+lyihSdElaVGRMp08krLawbb8+orcjbA6Nb4U57iFRP5MH+ye1diQ77d+0Qa+5owZaKiiRgoI6HRPtUbPBvXRhCIsTH4XYKPo95cIIDlQnYkj+OoyFi/aiRPGjzhm7EsgotFPFltgA7Xpp5pltAO23+4FUc/FYvLOSolOI1Q9BMgVPb4fGTGxKuiU6SEWIegqwUNu0v+vxF/scENAWLig/OhFpu11g1201MWXJADI+0g56PBFhCZ5+yOvngw37wOSApNTsxGORElR/3j2wv71CdeKhXfZZWCpGXrAuruxkNOfZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=MrAS0Kwe87kU9yaXSu77BLeEPUteQ02WhW5nmUh6x/9EGWeAQYEATxWy3mpOcHAnh5QBuCcMckfFH6IafbKlQ65y/WkduiK1J4Zc2tTgIySyWWjKYIJ6RwndfY+5NcQacn/b+TUSIIJXAsEbeBuYaSqDB0fIJyVRH1jqQ7wMet/QpMajxzRTJ4FlZZH16EKI8R/fBjX5X6KDA8rkWH4+kNr9DwGDH5+TtyXALm0aYNrbfdb7NiYS82Gvu3Jwg/VWBHlTLoWqVmPVC0S72U1b1fwXrPNCBpK3qNW+IcCr21QakUpwTwo3m4EPdP/yc7Vob/AEZH9BQN01onu+HGQOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=Psj2jFprz6kWQJOyoXNn2dwrFFMciY4gK5nYgoX7lobSTqE999O5PlLvWRUYUXt1EAT9duxL/0Hxc6M0f24tmGZBUr1Oz8JAnXHim8s+NmJK1/EgIkflsTsP1WUzM2lRL8xvcvG6vrpsbJwjMNrvx9kdoBi8xk9WADA2A4Dg/Nc=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB2007.namprd10.prod.outlook.com (2603:10b6:903:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:30:37 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:30:37 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] vhost-net: fix improper cleanup in vhost_net_start
Date: Wed, 27 Apr 2022 01:30:15 -0700
Message-Id: <1651048216-3365-5-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e6e7889-87fd-41db-8667-08da2828349c
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB2007F90EA478EBDD190424F8B1FA9@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89p/BhrHQouI+3xqGvsz2g+a3ZPoPkkZwlNHqjfWxYOy2h16VWSOjG7tPnGQvxlK494iyYziXWkEHxGhzslAlUNanbuQyctd6vXzLPfNCme0dlQOf5Xbc0KnyptUm0rmZl6z36bMKJNG4bqCITs9Wgvikq0jAMQ7Jji0celjhsaoN3XAsMtGonfcIHIIKQ2L8ih3ZyZQEQnLBXRwF8PzeGL72xtkA2BbiSVe0R5oTjU4NX41SAdPW8fLoVFjvQrCChCUM6cUI2CUa35CX+VxFzxsG/TAQTzv5hPx5LR8OfpBfBteslIAxd9lTQWsqtt/I2a+7WGae4t0yJNCdPi6JL2K9yEjIN2RukYZeZOSqFfWIptjEFF2w3MURbJlj3CYj2uwBlSW95Pe8Wc2NpQgHeodrMxEwKzyZw5Cs0SANiZ0bNfCPqzpJpbxiB5DRCQHcVizHlFCBx1OXFs55uWTUS2c2WHZl7u3Q065XwV6qPrXaxX4m3KlY+b5pmZZk0xvnAdAq/YCgiYzwC606u+0l7TgYfyNSUiBQVg/784hEgLyz9w8BEdWhduHUqDlXyKg6rPFT0G3Uw2tMXmTn4iKNsb60k30sNj1CnqvBTIaIhxC6G/cANNir70+tBZzmmr2Jvxrb8Z6tRX63anblGB10+HQGb+7pxdWhEItkwW8k0bTQZfRMtKcCMfmHmLoJIHelSExuTya1jIfSE4rYe0Rag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(36756003)(2906002)(316002)(508600001)(38100700002)(107886003)(4326008)(6666004)(6506007)(6512007)(52116002)(6486002)(83380400001)(8676002)(186003)(66476007)(66946007)(66556008)(6916009)(86362001)(5660300002)(8936002)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k8B6VGI4OCuqJaZ357+zHCW94+YOpWE3gQ0I8ZkD/KO8j141eUaPnolli/z5?=
 =?us-ascii?Q?KDfB7ieZkLO2XIEPtHsMiQbM1KFRZd0g+4wZOG8gmNetGBqxDaQt4fxA39gK?=
 =?us-ascii?Q?awnqvyGSYgyNfr1OmGfPO2amMrlYigCLe4Z8+z89zc7YzKpo5Q/9rWWoOXgx?=
 =?us-ascii?Q?bTAnWVZQRNf/wqA4paejfOd2agm0GYEJT7dmma+uD19Hf031JKqpY2qF506r?=
 =?us-ascii?Q?DrTomme5rVJDGWpMbED6Hjx0F3FbvSyK4D9ZtVEH0g8YEXaOPiKlakgmU9bM?=
 =?us-ascii?Q?i85Ozo37SegaMr4w117dyYuVyDB1aJPl3X0/CxlAHyUspmm3ShOfRs0SWP81?=
 =?us-ascii?Q?FAnPofDmjNZYTL4PVb8LuP6su5LidDZDsUan5F23XF0zvuxvrRCILPKaBfb2?=
 =?us-ascii?Q?Y9dDqKeuNsNsRBPiX95XzTCgBhq3Eng3y7Gm/cJ7eJNR4UMyzw/Ctzs1NE+k?=
 =?us-ascii?Q?CdzHpI5KX+u4B7BAkVJPgNSm+/OdEz4UL3FKutHAEy1pdcFGaftgdUYfFkZY?=
 =?us-ascii?Q?/EsKUpo32ghVeJQ/DgxHUhZvO+wwu7yV0PrQXtZywT1H3YF5yh4KFIpLaB8n?=
 =?us-ascii?Q?2ZoPoRZGsEsXhWgwWV82SjY8ny12gtv9ujaf1oV+KeRdA6P8m9OHGXBfO26W?=
 =?us-ascii?Q?q125IoNn+/sv/Opa1k+AQlPWUX0sYNTDFRSobZDTjeSb3R6bgV8rRlWT5NU3?=
 =?us-ascii?Q?uEFocwbGrMIIZdrRiULVkCi78bs3DPBvqc1Lz6RpkkgIt3A5EgkN1uT86Evr?=
 =?us-ascii?Q?jIY5gaiiYJUGB6qbQ5RwJIqEJf0KrKV9fyRoS7OtPiGOq8+MpzewQbJL/fxA?=
 =?us-ascii?Q?k0jFdKmxF+5/Tg2eZVPJ4Tk8+IfKeqnN1p+W5NmtCViR7GtYbXTU4/nUjYtJ?=
 =?us-ascii?Q?eq/5cWwXWF393UmtLufJWPi00IcXj+l/n8/xVCEXMS7opIYCJ5Fl02jhpK4C?=
 =?us-ascii?Q?4Q93FJz87np8047IbyY68+s87u/vdxN9mddIg2yq3qiip4NbroVtFdY5TqGj?=
 =?us-ascii?Q?yGtd0NNrzmHD0aipI9TLKLKpIKbAXLhBG97YLMA66KaCR0bCSQqFtLZxi2W6?=
 =?us-ascii?Q?KM+H6Uu6oCiu2t71xPAyaGCffxqIbpG01mhnKe1cGe+88Guv/akU7jACNTL8?=
 =?us-ascii?Q?EzfubPRjA+spoVzb/QOu3L2kCtsdgfmdMOJdvZlpw3QR+QeNVQzHYPlAnQge?=
 =?us-ascii?Q?Ts7vUDoWTV8Qrer8uvITtPa/Kmtqw/E5L1Vmo9Kle8Tlh48nEu5To+MrupFp?=
 =?us-ascii?Q?toh5LZQwx6SpVgSZ/H+l2XzJ5CrgyVjJ+xkfgJLR9iNqKoOka4MyIlKf2qRE?=
 =?us-ascii?Q?U1kyQFcqJs+5w2ituOqv/ilO1+RkEv38sBQxDf5+DzLoF+OtCWbUKUig4Pyc?=
 =?us-ascii?Q?wDbTkx9A0au3NYczLdPYpqaARajpBZ/WsBqwU1nD8eqJ4u6VcfHKd9udm3wH?=
 =?us-ascii?Q?T/9mrvkVDJw5aR1/qfpiklZKZfj5k7jdf5RP+kH7k57SPTs+sHgHos0d5mgO?=
 =?us-ascii?Q?n34riKxLRb9us9zTsFqnFWtJuENZOv3MG6j7JeI4+L68yBZGIhtC6ryOHu1S?=
 =?us-ascii?Q?CGY0u3rBSNSl4Osw4MCn+Jc+n/jK0xPHdapOLNSv9T9RZNrJkSgcOuACzaRb?=
 =?us-ascii?Q?/tiobXozBHasDHnDDNjwHmmV+oYzjmwzuo7uPtw8wDZQ7uXOYw8Lj6/emnFa?=
 =?us-ascii?Q?IfqwYKFPsMhzTCQwXJNZqbOYY2NwR2VB+a1DzxcYsq9CgnShwnx2HQVOW12W?=
 =?us-ascii?Q?2/Qqf5g9LXF25NwPrgtT0B2xGAw9C1E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6e7889-87fd-41db-8667-08da2828349c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:30:37.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZLPlqtvzC/FaLwQjIPFlrM9PWI3M+ntvoDBQBMZI1JopwW/dTQG83t6XWQTLUS/GbwXr+oYUc/748behEepeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_02:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=928
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204270055
X-Proofpoint-ORIG-GUID: sriJ2bByb47hRjxpcRZvywxcOVXMJOob
X-Proofpoint-GUID: sriJ2bByb47hRjxpcRZvywxcOVXMJOob
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
Cc: mst@redhat.com, jasowang@redhat.com, eperezma@redhat.com, eli@mellanox.com,
 si-wei.liu@oracle.com, sgarzare@redhat.com
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


