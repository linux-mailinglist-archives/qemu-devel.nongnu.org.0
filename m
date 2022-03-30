Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37B4EBAE7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:39:24 +0200 (CEST)
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZRzH-00028n-HY
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:39:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtm-0007cN-O6
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtk-0005Nd-Ly
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:42 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U353cY011976; 
 Wed, 30 Mar 2022 06:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Fj8lLe7Wz4qrPIyFrBEKjcKcu/bE8EE+RviLkO5qPLM=;
 b=ODOyd1FvTSiZCcO2exFQbQ5k+sfLX6jtPyxCPEeWLQfwzahg0OWfoWwQxjKSSv1QClTl
 DCccsL5qniiBPPfL1ejwMhb4hXYJEMlMMTDx51z5gL6Cour+2Dy+1CXv/pXC7iC3g8yD
 kbQN/zf09jKmFiy6nnWfLZG3zdP8rmvz3t8YRRfIZ7Z5cF1XG1Cf27saJB7AwSD0Av2X
 1+Y83cG0Hl277Yo6lLaDsX/yU+9NhIch7uA+ZZgIDT2DxpL0i7zP5kIDpdXIh18ir89c
 4/pr1TgHhk1Xr4Go+wDazE/+L0+A7rvsGo1gR/Yti07VX2aRWAk7nXWGImZD0P7oVKgy Ig== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1sm2gkk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U6HG4j113239;
 Wed, 30 Mar 2022 06:33:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3030.oracle.com with ESMTP id 3f1rv8egkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sm4dQE+knvH5Rvp5GZrI9lLdXlYDYha1yo1xYqRVthLra1uQlF+NDRp8o7LV1g+qQNuMhRb71/PIpdQahMTD4lrcZLqyYj5IbUK4tbzB7y/cwMJSBQswaEB5p9WeHv0BmqQl0DFKc2LeqXA6uuqXzSULvkOcfXNbuESj2daHV70SC1wfyNcljuZP95uG3TD5jbAWxCWaVoWx5GelgJWJ2k4a253oLhpxmoncBqhDAg1szw1HxqStS1MI0Z4WQkNJneWT+Y0y8q2jZFnzqtDC84lbtKxzBdVC6V6zpJXjsd7q7DVlF3WlVnbsUWc7isVY4FBwGkXeDYjWM2BfupyhWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fj8lLe7Wz4qrPIyFrBEKjcKcu/bE8EE+RviLkO5qPLM=;
 b=NaB2uujuDvVZTStTsXbrP1K50PtCTq5WbnfK7SUAahSQAHlwRp5a9xUWkBEh8wD+52Xy9otDSQhacbjn97fwLpzFQ4L7DxrEIBDMB6CIZsSmjGR7B5obVHUdcmmZ2adM3JKVQEU+ejv5sTPebQ9Rv7ID4lstb86wS/GPllqcrcrObYYz7B8I1OA+G1ftJdoKr8TF73qE0ivttQTeqmqn8MpwYhS3Sf3ThRAWpYRO8f/PLU2QRmoM3jcpr2Cj1iVtWRyQUubiIIb8coelPocqgfAOScZ7KvWsNQcgsxARYckuzy4dzFM677c+AvLkUU5WdwXAtrIdo5p8T81PMX/X6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fj8lLe7Wz4qrPIyFrBEKjcKcu/bE8EE+RviLkO5qPLM=;
 b=H0JaQ9yfh/j+ESXftaoZGbNiNJYxGSLSCSCGSiZUO4lAAuLVGPzIrrokAhooz071cijm1l/0AOW2McEGmwYrIXd2s6OufZF+jMAzaK9OdoGm+hVxb4cuqnG+R3k1TyXzcNMO9xFdYk5FJhM6BLLxJ6LNq0jHwgD4NDpEeCk5x+8=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3130.namprd10.prod.outlook.com (2603:10b6:5:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:33:35 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:33:35 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] vhost-net: fix improper cleanup in vhost_net_start
Date: Tue, 29 Mar 2022 23:33:16 -0700
Message-Id: <1648621997-22416-7-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:5:190::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9d952f0-6276-45d5-11a3-08da12173785
X-MS-TrafficTypeDiagnostic: DM6PR10MB3130:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3130B726F19CF5DEC79E9FD0B11F9@DM6PR10MB3130.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bibs51/Q+cfn8eEvrcMml9nWwQqbacxrvR8x3dH4wKFxVvmT/jzUA6UFujmLS9XSHOurGcT1WHYrAcDD9hEGg3qvcP7/8rgKC9mOCcJ1xkRw5hJCzi47QOJ6QlvKACuUCY6GgFwgLvYgkE6h3t/+UoyyznvYlGa6/8cYhlGKyI5FSRXHWVHlc96GwGbpr6ZOqTeTFuiSO1ZffQlm+rKFJc2AkbxYTXf/crEi/ObQs9ZBrM0NcLYPmBIzH1RMHBbTicGHaNZ0iwzOvNMMfkJGFxa8NBjDdw7GuBGZ/irWZ3eLeqlwSPtNS+cAtovvd2qAWmg82iW65tmLm8LeZ/8CAQ6bcC2rtdsNtgdnBhXzYLBYtkDh3IbtWXDnKbSzrm3bNtn8CVBjldyHL56kOGoEu52vmdjnXbJTl1Kbp1/qxt+m5Bor7xUl+VZw6skCFP8kwbf9HGHq3CMlK6QKXrlyjSkyMoySQVa+iAg65LFo/cAod02UR5CLHRmDVCzAs8e5ACANjt33gLSRktHqEuyuFhHK8u7BHYcHQTOCNhSh0POyuQlw5C9Wpe4qDQlOJlX125cFSfhAkL8f+mOcgfKm9abP58w/wGt8uuUIE+4QUtsUxzANcWA55codV3ajHn93ojQqoGc+eMYhy0aI5cEWm+J335e5E6fCuDQqiaJ6EuMCntWgke0PQehenHFoBZpDu0tTe5x0gPyfUrJPXrDj5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(2906002)(66946007)(66556008)(508600001)(8676002)(6486002)(6666004)(6512007)(4326008)(38350700002)(66476007)(52116002)(38100700002)(26005)(186003)(2616005)(316002)(6916009)(107886003)(86362001)(5660300002)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w78EkSB9NV6NxNJqDZBCDgi0iDs1qPYgQF+uTf5kdm9HFukHbh5LhhqIEy+a?=
 =?us-ascii?Q?bwYQODFzT7bq7fw/EBweWP9J2xFNzTpYTL86MrZc8PbqEpc+ZIK9ZUVDWn+f?=
 =?us-ascii?Q?ss3cImZIQlN0udugTNmlYiJpHbRFFNLeznqhpJfU5vxOU4KNNWGPVNavjpyj?=
 =?us-ascii?Q?Ma/wedokdXe2PKXViVSgu8Jg0K/dXV8GIpTKDTDIcH6IXvNADMhDWexQPIKo?=
 =?us-ascii?Q?n35QXnxwTtZC7fSiKJMRfIW0KqXQYqXn3uj37VWzrmBXHudd0C5vLn07iPkk?=
 =?us-ascii?Q?mizcS1vaeVcEVLZgITFdrSSGUYbhtA3z+n0kTgAIqk3PYxfFT/Bx70W/nO9U?=
 =?us-ascii?Q?rPS/e7QfNjCJPdLrZvTUVoqLCGglZNmZyRH8RpcfqugOsuvKRy6nxGCCkqnV?=
 =?us-ascii?Q?LBxZqY7yFnBpzaRH8HKr7vWOtKdP7yENpgFzl/RQL1xZ9VgitOr9fjpsw0ho?=
 =?us-ascii?Q?Ug8KE+a5kn3DbQ7z0nz7KMCLnAULC0pEUKX1l314uoHMo3Y9vye8LaNc/lUj?=
 =?us-ascii?Q?cQnC1JXYB5EjSB06gh08zZwMDRAdcp/psmw0O39t+BNdh6+9FascqfuFCTHo?=
 =?us-ascii?Q?9s+1Jf9FD14gdlPL6tXNpG+q9iZ4Wj3qfkRf2sLV5qz7Oa+2+lMnmDKa1t4w?=
 =?us-ascii?Q?W387AHAXI6upZ2LwZz32cLSUbeHfgMlI/PBnsu5R68ujrDpZq9lbH+erUjjh?=
 =?us-ascii?Q?giZbRxssSN9FV62H7xNDwBp8GAuElLL0crFczzf79QXnjC1CKPqQt0SIO5hj?=
 =?us-ascii?Q?U86Pt6SBxR4N1ugYPRGHC47aoyKUat0UB3kDopVuvhxouq+h0HuuC9eS6Otb?=
 =?us-ascii?Q?BPV5JyFTbXkpcHiaaWuKIzbALn9nWqH3EgyFcHrBEwAgqaXSZJ/ikHbqp0Ta?=
 =?us-ascii?Q?weciUJs+XJTJ5zpUZ/CGbzrNEMEhAOdXrfoo7+Az/dtnIh8R6VXvKnQAt1XE?=
 =?us-ascii?Q?bdLIE9KObY+JCpv0Elz7WHFgarWSQJBkBYVx3Ve+tiOWyFXCsOLRUVAxVYIJ?=
 =?us-ascii?Q?cC4sVQWeAYzvEAzXouIj3GlgRh3GAWdmxPrJOXrKuTsPhmNqiNWT0a5B43hO?=
 =?us-ascii?Q?6r/BJwnemhajqRMIvOx7TX5xngPX/LLFuW64Ajbi0fSJYOaN5rqvpaojZq35?=
 =?us-ascii?Q?P6iv3yASbQZ42dj3d1XvCU+fXjmBuBPGH+FCnRObl4xeisYEkP1D6vZfzZyn?=
 =?us-ascii?Q?05WKIF1bC/8lR4rXPKqMF5Il/hco51KLNOZDhHP1v8GOWvnHX2QmH43i/kAa?=
 =?us-ascii?Q?C8Owd3i/HylMYqTtKUVbKQeZe2tEyFP5sqymR4FD3xW/tdxj7t0OPtKvyycC?=
 =?us-ascii?Q?5o1IN2a92+FJjiYnfCypCbM4ID4U/NMqgMpgt5zHw99PnJPm5HMYx+6kgbS6?=
 =?us-ascii?Q?oxXo+tIDvbsOJv2GEhLJ9NcaKryC1DVu2zm8Pf4P/AiduwGsqJ+6Mwn7VwnR?=
 =?us-ascii?Q?HXdJdaoMLZaRQGhW0bKTc5HopaLum6l6EgmH+b/YUwTsJruR6qn8ZTh0VrOb?=
 =?us-ascii?Q?95bt3Hlt8qzA5fcNmYayXl+jJcNPIvWc+bJ92Z2qHE8yCesVNCL9E6sxYZZW?=
 =?us-ascii?Q?3kCPhhz/uCfr14IIAQS7AgY7Fbu9PmfOCeb312woFIu5CffPpLtdahj0t6Jx?=
 =?us-ascii?Q?q/fqIQ1Ob/sNmBiZRN+COoxnCu6Jy5wgS6NuOhbLt8UUNSYYBFdAbhejxlUs?=
 =?us-ascii?Q?V3hcD9OoK7Fag9bwWsA+DxiP+unmig9sDZDz7ylFeKzzyKv2tDvs7gwp22M0?=
 =?us-ascii?Q?PhL1CaOBe11Z9JMyaZXll3Ul0qBTSt8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d952f0-6276-45d5-11a3-08da12173785
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:33:35.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlzYDl19bJqoL/S1K7jGg+nQhBMAO4wZ+rswN8T1KTee6R2aYNKX12y75Ij+OWndedpO71Y01fB8I7nkgTgX1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3130
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=962
 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300030
X-Proofpoint-ORIG-GUID: TyWzHYmltIDt9ticOuIsZ1ya2WbU90m5
X-Proofpoint-GUID: TyWzHYmltIDt9ticOuIsZ1ya2WbU90m5
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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

vhost_net_start() missed a corresponding stop_one() upon error from
vhost_set_vring_enable(). While at it, make the error handling for
err_start more robust. No real issue was found due to this though.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
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


