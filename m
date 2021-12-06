Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C9B469604
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:54:52 +0100 (CET)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDW7-0001l3-2T
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:54:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDM9-0000WD-Qi; Mon, 06 Dec 2021 07:44:35 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDM6-0001wK-6E; Mon, 06 Dec 2021 07:44:32 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6B4SJ3006615; 
 Mon, 6 Dec 2021 12:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=8AAaM2LvTJIng1XrMlNccoRzSFO7cCbEaVik86vz2JQ=;
 b=iOG2h52Y+zOE+TYRbsG6TUQhtNfoyxSHTjGDb1cF+03ujR/1ojsmtCOPE/kSqr6zej3X
 n8t9/z2cfCjjqVmdn94bK0qD38qWz7393Y0EIP8PUBaLr9FFctD87+VRoffuCHIaEBeY
 GRf40AqPvc3ZNHoNcFOAIkWs5snNOycxN8CucQee5bqU1CV4AuLjXM09YA/1b0k71oqk
 1oGD7y554MaYb+UAmKV5OQ/ieA1PnmwZs+oaZ0kUpaFgbLfnQG5hRN6/gfAQpuoKJEOt
 0v2w+bY0sRpWyjzMkAm3sH+bbg/I207Lla6Tt+6LF6vxI1+YvEI+hVZePz7JO2m2NUh/ 6w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csc729t8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6CecWk084171;
 Mon, 6 Dec 2021 12:44:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by userp3020.oracle.com with ESMTP id 3cr1skys29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyyMAlQmIyuEbsVZiz/SC2iQSGdKAT03PW0gKjRiFbspLln7dpd3Q7MY1A3t4sUszE/bHBpnzR6Vn4e+Ta4GR7/DgqulVhuGio0fN73DPvkTgZqr4K+6UT2VJ9utxFu9n8a5FQYO69ReFJX+Fx3lR88C1I8AZjuQ1blAAMThjd1lULHOKlFacS3dmJK53TjODRZEYJ3SXoieFZuTUuBexj9tWbtW62UfJeUCKqAHXFcJra1VramLzA0PJtsRGvi/qQ2BtkB9h6q6ZJEguGsBz2JcIxctYZG/uk/1fPZnsEeM4IimzZTDQWWx2WM38CqzIPgDl25JJtwOMBqxM19pWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AAaM2LvTJIng1XrMlNccoRzSFO7cCbEaVik86vz2JQ=;
 b=DIaYrS1et4rnxF2deeyjhMHPU/u3CpGZuZOtnS/YXzzEW2s+1c/cEqDRquYm52SzYb+rvvQFErWAwU4OzyL2/BXF9A50ZQ9Lw84oq64JDZ1J5/0C78yi17ODSF17PyjJyIjkeJORCNIba4Twi6hWZBKpa7LIWCMGtQ//zbdWxZOsx/YVF8k9GUP8GB46y2c37BD3hWyAkELdYLKOhiWPxrpMWCdWitsFutCKSnUdfl2ExOkx7YeNsvABdkXYFqghkuhi/2pCt6KKztDBWr16LyGVQIWwhOxy+6bv7lqMcytkKWnFOD+qb4zgTlh0JgXXj6j8HD1S3WBTC/99HYuKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AAaM2LvTJIng1XrMlNccoRzSFO7cCbEaVik86vz2JQ=;
 b=k+PAJt6FMbQCkOlBaRsnpds+vNQt50vXLu605+Tfh8E0ETVVDJXMF1Ux86EWABWHFm1S7+zLmeg8Sm/S73nTfGcm3dLm9ljuOi4bY52r2iKIB65Fn17nDUi90WoixWJuy3mpOFLD0ondrqVXW+ehY7RjJeerAhzkE2pBFbuvUqU=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5820.namprd10.prod.outlook.com (2603:10b6:510:146::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 12:44:15 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:15 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 3/8] qmp: add QMP command x-query-virtio
Date: Mon,  6 Dec 2021 07:43:21 -0500
Message-Id: <1638794606-19631-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::35) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.42) by
 SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ff5b328-ad36-461e-c895-08d9b8b61c78
X-MS-TrafficTypeDiagnostic: PH0PR10MB5820:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5820E5DFEB17D732C46ECD70E86D9@PH0PR10MB5820.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1oSssp+zcRKqAJCLQfWF0ZzBTKCoZE+xtBmxrzXp+rAReZYPtqIoaXmq+z3GdVse35/udzKZLAm8PzXcxFgx5CSGVw4jikrv4mrPfUhiPkRndGxYmQN4xPMTU1IM/ysWgFQ1fZmNh9wxLxGoB/m5yti3P6621qakgG2qJFzXtbplPqus0RDX6gepgc+Az3wWVJSSCv9arqnh6I1zVJlH6mM0kvSH+9RkRgGRaf0FVOHF1UdNG4WPaqCOXpzbP3T5yTD4cwE0OpMKTCkhX4twCnnKwD29fqfjRp7kFhCm8JHdRq2+Ys3t7AOyxSiAH+39T4SnxNrk+nmGsHsFP47ZC2uuoAT6Iyihba42OyEOJasZV3WDlejT+mEwec9sQLAyuBW55O864D0AgDVGb0/51K6PdyBfcS9EZZ3iDdbdHkXX8ouIFaQyIjiWw/DTYYO10lRI18bkLTjtCbrtaC90Z9rLfBK4i5epwhkzCOiknr+IPNgnw+8wFayFs8Dlrh7qk3nne9mvhCNxWLoGoJ0sqiD51sPvrSrDSPLU8MtY1iSAhGwkW7EIjj50ZlXzBMtc5aT7H3AyfbmGZ+7y48GFT8htmV9uN2qkST5doCY+l71Nu7UDX7RuT+VR8oOOwqxp/Taio8N2ueDOyBHq9lc4S26jHQyxCL+cZejHGZYwxQbtEUYuhuNBGQ7c1k4mmq0p2j/LxHTudH23I0855o0qrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(6486002)(6916009)(508600001)(7416002)(316002)(36756003)(956004)(8936002)(4326008)(2616005)(38350700002)(38100700002)(7696005)(52116002)(26005)(186003)(6666004)(86362001)(8676002)(66476007)(5660300002)(66556008)(2906002)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r9h/+z4vXLZgZDWM52HOxr82Lbsnk3nxJTr5Vu2fBTzubWjgnVkVeHx4j67W?=
 =?us-ascii?Q?gPAMuXpQ7l2oo08tyfq155yeAmielujhQfxfzguB9cmgdWJv+CA+EfOl0nUu?=
 =?us-ascii?Q?GGxZFbn3BcODR93uZv3RtQhSP2KWBtEMuve2FB8TsAzyHH+iFwDbWrn8QX79?=
 =?us-ascii?Q?dn/tIbqX3MkQceyo0AAgZfQbutuKjqRuFZf81oHaCI/th3clA0HUFNiYWiuf?=
 =?us-ascii?Q?VohG6UQo3CGR3tRM+/upytzlwQBC5ExeQltPSGWyvGrkFzw8eRX/igzfpMxw?=
 =?us-ascii?Q?o1IAoPPKH0w102eQtbhbmM+/MuvIr0zQ1mP5eGtG/IM7gqQ0gQfdqhXGHAy4?=
 =?us-ascii?Q?YmwwwDeNrA8bxsS+Eh2rLQcZx+34POLj18u4AJvv4/kaZYDNfGi9JswAg4ux?=
 =?us-ascii?Q?eBECcTu5cgxLEJ07dbLEUIF1vyAFxtn37rm9BMjKcRcAxlRVr7EwF1QDfaPp?=
 =?us-ascii?Q?3BPKVVDlhxU/rp4kTsnkj/+XQXNozlU0BOmvFt8C9NYFQejrtIFD9IjbSaDF?=
 =?us-ascii?Q?tvZ45tsQd5UVPuMinyZwD12iwLNiPCi7+uC5IYQmB/m9T+fPzv1iHr0KXhjp?=
 =?us-ascii?Q?w6qK0OvBpeGfqxPnPTvxA6qRBrFhPZDSuqm5ejutS8GtdEHcARrM2jLN6UjT?=
 =?us-ascii?Q?Nq9TV1Sjf/X47SjIK7J7V5xJQGhnTPjo4Q3k8uKrdBkNGv0L/f8xTt38ZCRU?=
 =?us-ascii?Q?heHZmtlRNiuKzitSgDx7xX+qVavBNgpxp3dyhX6Bi4L5TdemB0u9Esr4es4e?=
 =?us-ascii?Q?Vx/tlzNW2bEab2VajCQsM5JVP8FUQSTf3LLfIQPBkbF1n+wG9VDwXV2ZBUVc?=
 =?us-ascii?Q?iMewRyPE94Uopbez2aZ5NPUS8lPlJYsfULlByitBRxJN7wfcggAk0Z+Bqe2g?=
 =?us-ascii?Q?hkZMyni8csVr/WOcd+nAQK/+Qdg0gOW7yJld0gK29e83Fx67EU3atV0BeYUN?=
 =?us-ascii?Q?A8D/OUaJrNtnxfx9E8HRI9adHkCKJrqaC7R/v1+6TfiL7/9krQHnkOZS2zbQ?=
 =?us-ascii?Q?SSV6t4RqYk77aXgo4IHrkoAQkyCBcFd+uPpe4/LThih+eoeYAqLxplGAujie?=
 =?us-ascii?Q?9ysOkMqNMG0knH04bdDGWcJK60jSNGxOz7P3+wmO5UqUdB17ihgquSvOELKg?=
 =?us-ascii?Q?4mepdRfuRayWLZy1qKNQdkNP1Y7+PAXePfFom2Qyt9LMakrCN2g8YxSqU4Y+?=
 =?us-ascii?Q?9Jj6HwiDF3YHZOjLMYe4f+7Gj7Fr9HKxwQmesbyzW8LsRx9T7xurZhQwX+pQ?=
 =?us-ascii?Q?vqkFZmrOt4W/oO6hA2FgLK62hW7rAVJSnEX1OOcFwtLPdZgqK1lvGaO99U4O?=
 =?us-ascii?Q?cN/CyjFN6Mlh+KfY+txywtep5dORt+hYOkNmMK7rK2YPPbgzQQ7oHLuDSD5o?=
 =?us-ascii?Q?xrWr6SP5JCuGn6RA5rRAMwFQo589oaQTwzt/50V5ELcg8jajmbMRXRyY5dr4?=
 =?us-ascii?Q?sAQELXiccPUAi1cKnRjL+Ph1FP1S1WT4LzhKkNxAc7SY8ImOnZmmiIwz3bMy?=
 =?us-ascii?Q?uU9K4+fOxswRlKpgRPi3p26RJxle7+g+wMjkeVyEyVBfg5kMEd0wfe+lLZl3?=
 =?us-ascii?Q?yoUTyVS4sMqHCkg/0TYRTCZjoIKypTyXWMqzhg1vDGs12bu/QkdlWTSCKNdm?=
 =?us-ascii?Q?cPUfkCPf6hS/FOmHucqJLKA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff5b328-ad36-461e-c895-08d9b8b61c78
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:15.2803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFxswqNvI9d82fLT7o2FBzF9AMl7H/FVWKefwgyYIDMhSugdSF2hFNv4QJlF4BFpZQVKVSLgnji/9HP6/qYTQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5820
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060078
X-Proofpoint-ORIG-GUID: zs1y--zu3SjHAKOQfFGo6jeLsic07rCB
X-Proofpoint-GUID: zs1y--zu3SjHAKOQfFGo6jeLsic07rCB
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

This new command lists all the instances of VirtIODevices with
their canonical QOM path and name.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++++
 hw/virtio/virtio.c         | 27 ++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 115 insertions(+)
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
index 867834d..76a63a0 100644
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
 
+/* QAPI list of realized VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3700,6 +3705,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3714,6 +3720,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3887,6 +3894,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3897,6 +3906,24 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
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
+        node->value->name = g_strdup(vdev->name);
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
index 0a12bd5..3b4eb85 100644
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
index 0000000..5372cde
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
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
+# @path: The VirtIODevice's canonical QOM path
+#
+# @name: Name of the VirtIODevice
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': { 'path': 'str',
+            'name': 'str' } }
+
+##
+# @x-query-virtio:
+#
+# Returns a list of all realized VirtIODevices
+#
+# Features:
+# @unstable: This command is meant for debugging
+#
+# Returns: List of gathered VirtIODevices
+#
+# Since: 7.0
+#
+# Example:
+#
+# -> { "execute": "x-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
+#            "name": "virtio-input"
+#        },
+#        {
+#            "path": "/machine/peripheral/crypto0/virtio-backend",
+#            "name": "virtio-crypto"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#            "name": "virtio-scsi"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "name": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "name": "virtio-serial"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio',
+  'returns': [ 'VirtioInfo' ],
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


