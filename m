Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E934EBB53
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:59:16 +0200 (CEST)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZSIU-0000n0-Kt
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:59:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRto-0007hQ-VX
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtn-0005OQ-46
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:44 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U33v9M016596; 
 Wed, 30 Mar 2022 06:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=m6GCeEQu3gXORb0OmoxH83oO/Sjo+X/p6VekmR6QOyI=;
 b=kEVbKVkLGHvi0BN8618m7gK3nhOxquuURUQf2SoBmskzA+pvVNrht5H2Pz2VIxMfaXGV
 7yTp9sTdXbflkZ1O873hKoYAYQhqPJdtoRSmGxhwa5bkPHhaJNqtdK2nToHeokBZ7YHq
 LrtnWhoxJJCC7xfm50GtMvWX5w5qM3JnM5fzhZZ/LVRdEOfl0A8JiKHFva8Ks5aOM5Qp
 8CnPF6GB20f2XffYeah8xkvo1nCqalMjNM7EFeW4gJiNiuvu9KpK9dYsvgwofa4Nmeld
 +GJtGbbMYayxZtZw1HuKC7zRa78a7yewJU1+mTiu6XJCyaP28t8sjgq2aBxjSqyucRfi OQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1uctrp2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U6JEOQ016506;
 Wed, 30 Mar 2022 06:33:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3020.oracle.com with ESMTP id 3f1v9fk5vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXmBNWixHZfAjVTq2vCbR1nMbvs5fFgQoIRIqm5PMztVFVtD4YCr42JU8RP1+JmQ2ejLOnKJGgqKWqQa9BDcQZCAs0kKGGcwlUVYWAoWWpX473fVzlG1FKyylmw4YaMTCBAe+l0IEOSlZLuBSUKiAN5P7XcAaNpoQHfJg/q+F7QgmsbovZoJhQj2wgyb8uGkecC2wVpdzb3PEZoUO+RQ9/usE+JYje4gPbjWOv8NPdgfmke33xu5H2qAvPqURSPnp5/kZUNc1fubScukWq9itFd0/SvAvyihbuGJQ6aSOzII4CwFkMna9oqLp3W6EBOYGFEa8MmVrTWvk0Mpd2uW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6GCeEQu3gXORb0OmoxH83oO/Sjo+X/p6VekmR6QOyI=;
 b=YefoFfuNp0BwZWtuOWUcqlOV1TyDtKJe8mi8Qmp6idpH1cN4dc2HRuqIrreXmTdAGm8swNKfGJjnUQTLhYBCcAaUFszKYNJr2Bj59LZzCAIe5hVECNZU1PBKFViAboySFjIkLgDr4fcQd8crWGvUmSmMe0QVKUW+9aMYWWMaYaVTScNFCqOqColU3TC2xsMxvSzbnhb0+4Z8dWNFSRHi71zuMxqovUh5gbwyKuQJT4hKOFxIYQ0FqfhejWYY9pwpjPxxSrISRwTFMtL6NvrFxOWw2CXdoSAPCLcChkEK1VAMcgUJZs4aYK+piKD+bXm9RWoGzJgybY2P0182TiP9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6GCeEQu3gXORb0OmoxH83oO/Sjo+X/p6VekmR6QOyI=;
 b=bm4oEeNGnjrSqDnUKcEOps1PkgvGfBt8917haFXn4iEgytc0mB1KoxkYUe2e5FfY1XIWTYCSMSZGzD1YnARCb/Q5FTbe2x+lXOzzw0fCSy6vX+zZoQgS3psK8XEjhQs6WI28IAQ9IoRMMJEt56stRgW2awiF1Q+PcIyV+GG77hw=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3130.namprd10.prod.outlook.com (2603:10b6:5:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:33:36 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:33:36 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] vhost-vdpa: backend feature should set only once
Date: Tue, 29 Mar 2022 23:33:17 -0700
Message-Id: <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:5:190::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 093d6841-a77d-48f0-1a64-08da12173833
X-MS-TrafficTypeDiagnostic: DM6PR10MB3130:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3130BCAF7C5B3ED867262342B11F9@DM6PR10MB3130.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6W95GADPyhc2t8n/oawz5j2k7MAOdHNGftrAXgiZ8E8ddmjv3fiKnROo73cZ2LLhL6qax0IFZreV2sQz40rg57qg6k3/PEW9Cf3VJp0hFoGWjZPJIhQMd9YXrdT/4HE0OIVjSdy1bCWEneN2oiUskJga41cxn1nl7ZhgkJWtninTPt3bumWcItteyV+YdDhSBmDcXM6BahX3eMfZXeXZtKXIjxpXeVIC1S2ucJtMSB6GsVFVk8Vcy08snW5zOGwvmwZUzHpAXlrPAex+H7fSI8PLXO66Ak66b+EgiCda4iwvNKbDnWsKMOo6P3+4jxRe0bR0/g7jAnvOJt4Zoxr9Lx8Qma4slDJQ8lwnSpSEnjCBQcInn0UKjmVlf2IlzquFVSL/eHMr+3inuftoNW+q5a+szMulRwmLmooSyQc7eMcplpDAJBKG9e62+vvHvF0YPm1SfxPyWrdfgsqWZJmeex5uKShamDeV0myQX2yN5vCLurbhWHW8b/LXpyvVhPLJZB6P1jP/OOAm5jkOOdeSzhP00DMTSpSV7O5rM92IQV1NSrWDHO9qKqKinfIwm6R0AqFoFaKHX1GhNihBu0+rwLYG/+Fi2jACgAyK4x2jSlF6V9Szg6Fd6KH7vokfyEtPhtZMCyZWl1qTcuQmp4hRAV1cq7ZRzADcnEeQ1kJdWuZPzpGWvKv6bMkNuIn3xbINUvURTWdtqHV7sSqKpNFvEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(2906002)(66946007)(66556008)(508600001)(8676002)(6486002)(6666004)(6512007)(4326008)(38350700002)(66476007)(52116002)(38100700002)(26005)(186003)(2616005)(316002)(6916009)(107886003)(86362001)(5660300002)(8936002)(83380400001)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?muKTl8iOojCEqqYZMHz0HiiYDjhjwn0CPJaOmafNfrGCO1gEn7jiU6INRGrh?=
 =?us-ascii?Q?TRJRbmT5j6pLz/y3M1CcXP5vh/fRYiy7sn31GmYP2tAZGVlrCp5kfy4LAmcG?=
 =?us-ascii?Q?/lXKzmctDgUQIhUChc+D0dMUl5KaM0Z8k17ENErEIjPmMqeqURNXHtMGgwSx?=
 =?us-ascii?Q?v8Q4aytYP61v9IeRwiURM1npImLaKAFb41Wgsibgj2uChVPVZSkJaTEpy9nF?=
 =?us-ascii?Q?N6GQbJ2vm/jjOk129R4H66pgZaiY8CkXL1j46arIr8rcEZRNJnMhhqsSqZUa?=
 =?us-ascii?Q?lwtY6jA4PNcz0r4PDZfVFS7Tp5E7rgSPIDNnS5SdBozaiGWHpIhCOj7s7hjU?=
 =?us-ascii?Q?AgtO0QOl1MYTLDjFVyel1kLzKxweb8x4GAjZ5o6Wb3Vp/WsFseOakk+K/6Gl?=
 =?us-ascii?Q?IR22ANhiYQdwHz/YJN6jE0UvfrMP2+5Bzzqf1xgKmhtGqN6k14rpAsJaf7wx?=
 =?us-ascii?Q?Bch+Oq7cku4+RT5pB1WYEz27NSn657RyjDQkeOS51bSg8+caj/eWsnouW2e3?=
 =?us-ascii?Q?ajlZP6HuaPpXGSUYQSsyw6mYJsexBaR7ZbVoVwxFifm5pdA+Hn2e5Ni+0YPx?=
 =?us-ascii?Q?tGztiJ1ul8RyhjLDSa8f2k1uEyaf78Ok62UXZdeXsxvzJKifs+KA52BBoPI5?=
 =?us-ascii?Q?fdWxJNY2gA5eLIuSHB4IiSEQcl9gKhimbhLgNX/0eCOt01EHsrAkXZ7ZqbWB?=
 =?us-ascii?Q?8IIMun2qAByuSn/uR+E1n+k2Eb4TrBSDkDa6903CfwXvKPfCMw9WmFN2a0H/?=
 =?us-ascii?Q?3Te+JsSYhfNl/O/ZZMF/+3w5Qiop7aUiai5nagV3bObKH6pTFSJ/zoer0D4Z?=
 =?us-ascii?Q?QthwLY5wZCEnJ7DG5/DQHgy7/GOpcxmYf9TKCiMLfkDFvHsGegUWFiyp07zH?=
 =?us-ascii?Q?G8eukhhkIlS7x5a0ca0zfCwMhK3l6MEf4szda6ZZK1leKmBIRzivWFydyOge?=
 =?us-ascii?Q?+fqetaogSrnrrHJzEfS9XvJnBLSTNaYe9zYxskOjj7273IQWh/cKVP4YxPWZ?=
 =?us-ascii?Q?f+segpD5TJ5Q+KcAZv0IfDpauqQMAREbzTagB+JQeH+AjTMSirrx0eqdPgIp?=
 =?us-ascii?Q?XIY62UCZUUv4V9DusQa7z8hSIllGuZEmtevsvOo5OqmPP6/dHMBxW1iQfie7?=
 =?us-ascii?Q?p1OALdMcf19YiwYf127Nymy2OLbRftZEHrs4CI4lSSAOwmjq+aYb6ohRiqL1?=
 =?us-ascii?Q?6WbZe1GVHIrhiwP1N8v22oZ9VugdwAGir3fO5xpwbuXnrZvQ2+LWBV616ICY?=
 =?us-ascii?Q?x01kVbY17ONeDQi6LgLy+4rL1F7rGKINX16a8aeEbsYTHbyjq0KnbhbbgpiO?=
 =?us-ascii?Q?8oUhWjMTCrrndjkFTgoXMsW8RxPndExgPO0DF9iRYsRdB04NLm+Q1++k9xEa?=
 =?us-ascii?Q?j7VVrqCsxsqXFteGln9mpwwNMAhCvzzbE26V75UUtqDGk+c/yL+X3yic43hP?=
 =?us-ascii?Q?1cf7G5zfnxCvr+oezrS6d4H/upg8fU5eoZm3Xh1jQmwpkDM7hcQW9DkNkT2L?=
 =?us-ascii?Q?raJElgbQl8ZWP3Y2bAlXWxVxIt2/08nQNsG1BG2HGGnw8rHyN5oNamkQ5wGS?=
 =?us-ascii?Q?ynDw4Vw1j7g626E27AdBd4+4sdhIjTkxKn/Cdxg1/kIKWAWs9B4b4cUttA2R?=
 =?us-ascii?Q?75TLijTxFwa4XzUm3NP9HH6ZChTyUtTafu0SRGde3MPo6aeiRVm3DOppSk1c?=
 =?us-ascii?Q?O83VhSjV+9Xcn11Pz8xEKi8skUFf8DgMsHBJRt+BERmTPOG8tjfy/GrcbRs1?=
 =?us-ascii?Q?9M+6100jNJNDEawKOG1OgSQ+SFi+aAU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093d6841-a77d-48f0-1a64-08da12173833
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:33:36.3861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOZ1jd0lN3K3Bpdom+AA0yrTkMUUoBGXa/bOvhgKe0X3qsolcwa69gKPYm8b9JzOWJa6r82rtWL0rizTfqIggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3130
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300030
X-Proofpoint-ORIG-GUID: fIqAnHwXJu1OXyn4iHVSRwnqj07t8LS_
X-Proofpoint-GUID: fIqAnHwXJu1OXyn4iHVSRwnqj07t8LS_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: si-wei.liu@oracle.com, eperezma@redhat.com, jasowang@redhat.com,
 eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost_vdpa_one_time_request() branch in
vhost_vdpa_set_backend_cap() incorrectly sends down
iotls on vhost_dev with non-zero index. This may
end up with multiple VHOST_SET_BACKEND_FEATURES
ioctl calls sent down on the vhost-vdpa fd that is
shared between all these vhost_dev's.

To fix it, send down ioctl only once via the first
vhost_dev with index 0. Toggle the polarity of the
vhost_vdpa_one_time_request() test would do the trick.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c5ed7a3..27ea706 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 
     features &= f;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_one_time_request(dev)) {
         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
         if (r) {
             return -EFAULT;
-- 
1.8.3.1


