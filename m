Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD744BE94
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:27:40 +0100 (CET)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkpP-0005ql-JR
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:27:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkmF-0002W6-8d; Wed, 10 Nov 2021 05:24:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkmA-0005EZ-06; Wed, 10 Nov 2021 05:24:21 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9SwW8002010; 
 Wed, 10 Nov 2021 10:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=fNPkPN4B7NvFd0NIVZQrcjh/Vt8R8dlbUDX2yGPcKMY=;
 b=BVffv9qDK/Qm88Q84IcJIqrCAzSnFYS/NsUktxhOhBx39msj8eWuVXGuy3uutI9ZbgjV
 ez0St6wpkks28jWkJ0c5GcUr6zC7MDyXYcja80qnOsXbfc63+PM/6CFpiqhZjD62iQF8
 cJhxFZtrZZRMIztv4b74KT6ngvanXRB4og62l/t7Xkr190iaTDaMcDzMkvNhNcpCz74o
 SUas/GYtDK7AfM0AxeOH2o6Eqb2g3WqrWRF6nGA5xj508iE61rhm5JdagY5hhztrNoqJ
 BFTp1hGNwIowFhJgZv7mLaFOpP6gRbjAz+j90jgl0t0hweNKOVcHCXo4GQcUoRRkmEO3 iA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c880rsen5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:24:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAGbNd134555;
 Wed, 10 Nov 2021 10:24:01 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by aserp3020.oracle.com with ESMTP id 3c5hh52tvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbxVujjxct0wSZoLiFPVpPtZw9fv7Y3NoRYzZZ/9UJy/a5V0kG2qi+2hTtlNjlbWAQ0AuOIoakUz62QYUqOaI4+hrlovpS1VX8eDRRyVkvxkz8iyMaMn0y5uDnE3fw9Qcb8/BYqtZeSi2kT2o+D44IohRmdcCHgV1oXAgS8nqx6txCsWoxiMDx7t9j958FVEqkxTYemQuk4R1Xc5l0NyxKE5G+wTbECKPoyY/IHvl1xks57CwZGFQ83a+6a/uwSaGmW1BG22hY5PCKN6gJOw8TTcdxrz6N1UvCq0W91+pK7je7NUHUsW7kKbqYg2pA6MgvwZmqyWTliAYG9MDm+1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNPkPN4B7NvFd0NIVZQrcjh/Vt8R8dlbUDX2yGPcKMY=;
 b=DKkUfxPsPRsO3JLPOES0kQwNpHHdWWHBx2nF9HAyKlxVPGMWYMXD+7SS7Dx7RXaOmLrv5+7WR7ThKuNuSGOOLQZu6jEZv/OivvwfAL4aBrpo6X3YXlGf84WuS2T4FsJrmjsr4EnxHh5uhh9mGhDqF9v7xomgMlH7bRXxKyijxcjNg1Hn6fUYo7HuvlOWSTjK0x6BMGqylNg6k9w75jwiM+cc7uB1VssLUvBbQyQPA2J0SqTPU1vFjkyLaf+lpM5IaPOjY4wI5Hcb9fD6/B/WOzwwTkzR+c/qKwxgZkIZxppjageunhIktLHUG6Vg34VIpCq2II/LIgGRIloAkuxTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNPkPN4B7NvFd0NIVZQrcjh/Vt8R8dlbUDX2yGPcKMY=;
 b=jCiHn0MBR/zRPMLaRd7GDfosoTv6wdimvthfMSeieqSy5lm/GYYpm0R5mr+sZJrM3Qud46kYnBOnbmkP+4unE0RURVz+5xvOom+NFEy8O7djPPo6kR6eInqDY+DcMziCnuP8QdLfhK/ZVOMCi49cglQHgnY55igjkGHUX5VG34M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5895.namprd10.prod.outlook.com (2603:10b6:510:14c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 10 Nov
 2021 10:23:59 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:59 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 8/8] hmp: add virtio commands
Date: Wed, 10 Nov 2021 05:23:12 -0500
Message-Id: <1636539792-20967-9-git-send-email-jonah.palmer@oracle.com>
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
 Transport; Wed, 10 Nov 2021 10:23:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95097687-989d-424e-44cc-08d9a434355e
X-MS-TrafficTypeDiagnostic: PH0PR10MB5895:
X-Microsoft-Antispam-PRVS: <PH0PR10MB589598E5D99FE95CE1E4375FE8939@PH0PR10MB5895.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OuXRJR/25YnXlyqhD3AnJUHAMWslDfW/OBJyaJMRMfSKzAAedelpmN1MlrbiD++IVzWD3QuEmz3160iB3sAxP6aLbKRuAKRmV4aAfu+XilrHuBclyPTsbMAuNMh7NhSpfxEJPe7y6Yuv2sOFPn8hLsUdatZ9Vbv49kFVcBEOAlutKLA0R0CXP2DLT4rUEDVOLYUV5Ff9R5cIoeP16ncRxYSHWjgjX3lDLo1UGUZfByr1g/sSlc2HM7f+KUd5XHEVcLbh2Dxci8DFxtbAVI+eNdvbetf6UURMlyFAwhrR5q76ugQPuMK45ngt5pbFuwhJX/WuLQujghmWILl8ItJQ2f+/n4omWnf+bD1cW2r+2ryZFML0L/20xKFtqrRNPdzkN66yxMpPm+1AfIENoJDhv/jKSnLzGs8PTJuCitxKJaFI5koxAcvQddX8iqPwO9FQ62UUZSeszifG6UU5gdM2qPq3xe/FHGRLA26FLPpKencdMrqCxTOnEhZu6wJrGPw/3OBNn+zDeh0MkgX6/Bpmc+S7b3D9bBdMrcVWzBQEltpBYtzmPmJTRNUgp+qZl9TEH28Gjj9YcVZIr3LhP8WzKgBBGV35+KW38kVE35fyqx8ieCNLhIH27u5ymUkr3Kso5RLSq3mugBTF/B3mg7FP9EPZteJkBgaY9L/FAsEm4K4Xpx/M7XAdTj4ZOLozQpBfl7Ac0YtJqG6nkz1mH+X9yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(7696005)(44832011)(83380400001)(956004)(2616005)(7416002)(5660300002)(6666004)(36756003)(2906002)(26005)(186003)(30864003)(86362001)(4326008)(8676002)(38100700002)(8936002)(52116002)(6916009)(38350700002)(6486002)(66556008)(508600001)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UeB0ea0MLzV0z65eftkDLumsfZ2AeWdWWsTXxORTnai7Mm/oxAVi67PyFDIG?=
 =?us-ascii?Q?Amk7gjnMJjhbTYCZU0sx2SkQt35BluS6xs7notuNIsPYMzmOJFStXCae4gv9?=
 =?us-ascii?Q?no8xTmyev551pzMv4go928OFwQqsuogxAlyq8PMb5cvxXrPSbIWcOLteTJBc?=
 =?us-ascii?Q?G5dwzX65W3amG/2QixRboR+3ivmH1+TILebYClaM7cyBOPPZnrOi+G0EdoZy?=
 =?us-ascii?Q?BHTWaPf/yr+JcaODhq37TSl0wJrR7mA5rtveBmW85u5jHBhDn6+JWeUKHT1E?=
 =?us-ascii?Q?Xv4g44/AIkmaQtDxL+befmxAoGfqeuOvI9pCQHM5doK/G2PwvlhQ6l+M8hOa?=
 =?us-ascii?Q?5J23nWKy77dyDuGp+Yk7jwFvg6nzpaot1ux/of8d9sq1Wf0piVYIcVnrkNLO?=
 =?us-ascii?Q?O3vx5r+zHHV5mfH0QDYvxugtiskR4RPM3e77oc3x1qcWZZAOlbAIH3WyDa1Z?=
 =?us-ascii?Q?5pil/hLb7PMvjUP6UslGxZ1cwS09Eoi5g/RtvE7ooeCe4XrsL0XsjSAWgXRn?=
 =?us-ascii?Q?ESA7PZspNKjeXDQDW/lI1DqsUN9p1XiwqG6rcU3Kl60CMLQ2lzzB8Kd1N4AK?=
 =?us-ascii?Q?c1ZHOOWVGGnR8LikrI7DHPVrI88Ik7A55sK9YpZfSniKey+Dq4gIpvtRbAY5?=
 =?us-ascii?Q?dRIVZzJujv9bWFoE1co1HExRHVumXfBnhH9LiNRl4TKeHBroxeS3DgLG7q00?=
 =?us-ascii?Q?mncxqV7Pf1BBuVzUaPe63zJ03wiV6F0z8mW8uK2+iU5cwaPsrdg+18X6WmLv?=
 =?us-ascii?Q?Lm1QKGzq4KBMSHAGcSKMPZDJt18u0cJT5hYVaw46nyMjmoe49OrHIrLr0wXD?=
 =?us-ascii?Q?0rtQycDk5alJVKKy0G3FkqcctP9YEm/dUmUU79j3XJjVB+mKvoA8sjMNWAxq?=
 =?us-ascii?Q?5H6VF2BTsJfVR4ak0uXaiHxhoVvTUy9vzIvNxBTCwog50DocV8Bdi+KkYZuD?=
 =?us-ascii?Q?R3oXZXUavyyUvMJOEP2iqqvCRDxaqTOy+KGgVmCHJTBPG/0XPUaxxC7aeXxs?=
 =?us-ascii?Q?rV3Cxrzr8KSDjpCmQEqor6+kziDVH07Jh9Zzl9906+RWqIgCCBxnwj5OuSdo?=
 =?us-ascii?Q?B5ZaryJXcY3X39IrUlrFIsvWnlY9//5rBA/mNtW7A6jq67qJ2gs0YrHAPYHz?=
 =?us-ascii?Q?yzJSYBy+zB/DPcGzDYhwJu+cTbkcmt9mgebYJYRAcqqi+Wkcbzg9392eS0SQ?=
 =?us-ascii?Q?uGRpAAwU+yg553NcPW0iHDCJUtfKfVupjr9YvAL2VPHOxjjQB3X7eeg1x+s1?=
 =?us-ascii?Q?yFt8JXA3QBP/Fw/KLTXErnTpR1KqB4/vynVg/p5mNEwky+rt8SD+16Z8xN5X?=
 =?us-ascii?Q?7EeoRgv1OAmWn2Bqj9z3FsmXGxqzSk3PdD5DCiRRVFFpDJ0xkEklkW6vqLZb?=
 =?us-ascii?Q?QZie0jFAsUuH5Rc0iIu2D+hQgtN2o6ptZVe9D4mWEX/CXCacM2pelj2XLOVL?=
 =?us-ascii?Q?AAzK1ATQQyq8i9WjWlmQ//jzduAESIaw93A0vLXyGUFMR061qY3labhmQ9/J?=
 =?us-ascii?Q?FdmuD3SRJBEpmQmr43WNOVthQ6Rps8KLXCMI8zNDv5dMK3kpKo+yiI4LPwmt?=
 =?us-ascii?Q?OQwzWLygZUJc8CtHx8JQ0/hChGOcTLDNvDugiF9K5xcZaFoteLF2z+AAmpwd?=
 =?us-ascii?Q?Ep3AY0AiohZXpqv4aLtC0Do=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95097687-989d-424e-44cc-08d9a434355e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:59.1943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6/UooCKacDqtOglJUK7i1tJW2t1uR/EJYdHqriUCkDYFQ/YeIV3043jUdFRhWrp7nE/nU0fkH+XZx10iE6WaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5895
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100056
X-Proofpoint-GUID: 3yprltFA9DFSEFQm5Nzg8FDNT9lzva63
X-Proofpoint-ORIG-GUID: 3yprltFA9DFSEFQm5Nzg8FDNT9lzva63
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

This patch implements the HMP versions of the virtio QMP commands.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hmp-commands-info.hx  | 218 ++++++++++++++++++++++++++++++
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 358 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 581 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da..6bf7359 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,221 @@ SRST
   ``info sgx``
     Show intel SGX information.
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
+
+    Example:
+
+    List all available virtio devices in the machine::
+
+    (qemu) info virtio
+    /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
+    /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
+    /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
+    /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
+    /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]
+
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
+
+    Example:
+
+    Dump the status of virtio-net (vhost on)::
+
+    (qemu) info virtio-status /machine/peripheral-anon/device[1]/virtio-backend
+    /machine/peripheral-anon/device[1]/virtio-backend:
+        device_name:             virtio-net (vhost)
+        device_id:               1
+        vhost_started:           true
+        bus_name:                (null)
+        broken:                  false
+        disabled:                false
+        disable_legacy_check:    false
+        started:                 true
+        use_started:             true
+        start_on_kick:           false
+        use_guest_notifier_mask: true
+        vm_running:              true
+        num_vqs:                 3
+        queue_sel:               2
+        isr:                     1
+        endianness:              little
+        status: acknowledge, driver, features-ok, driver-ok
+        Guest features:   event-idx, indirect-desc, version-1
+                          ctrl-mac-addr, guest-announce, ctrl-vlan, ctrl-rx, ctrl-vq, status, mrg-rxbuf,
+                          host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn, guest-tso6,
+                          guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+        Host features:    protocol-features, event-idx, indirect-desc, version-1, any-layout,
+                          notify-on-empty, gso, ctrl-mac-addr, guest-announce, ctrl-rx-extra, ctrl-vlan,
+                          ctrl-rx, ctrl-vq, status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4,
+                          guest-ufo, guest-ecn, guest-tso6, guest-tso4, mac, ctrl-guest-offloads,
+                          guest-csum, csum
+        Backend features: protocol-features, event-idx, indirect-desc, version-1, any-layout,
+                          notify-on-empty, gso, ctrl-mac-addr, guest-announce, ctrl-rx-extra, ctrl-vlan,
+                          ctrl-rx, ctrl-vq, status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4,
+                          guest-ufo, guest-ecn, guest-tso6, guest-tso4, mac, ctrl-guest-offloads,
+                          guest-csum, csum
+        VHost:
+          nvqs:           2
+          vq_index:       0
+          max_queues:     1
+          n_mem_sections: 4
+          n_tmp_sections: 4
+          backend_cap:    2
+          log_enabled:    false
+          log_size:       0
+          Features:       event-idx, indirect-desc, iommu-platform, version-1, any-layout,
+                          notify-on-empty, log-all, mrg-rxbuf
+        Acked features:   event-idx, indirect-desc, version-1, mrg-rxbuf
+        Backend features:
+        Protocol features:
+
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
+
+    Example:
+
+    Dump the status of the 6th queue of virtio-scsi::
+
+    (qemu) info virtio-queue-status /machine/peripheral-anon/device[2]/virtio-backend 5
+    /machine/peripheral-anon/device[2]/virtio-backend:
+        device_name:          virtio-scsi
+        queue_index:          5
+        inuse:                0
+        used_idx:             605
+        signalled_used:       605
+        signalled_used_valid: true
+        last_avail_idx:       605
+        shadow_avail_idx:     605
+        VRing:
+          num:          256
+          num_default:  256
+          align:        4096
+          desc:         0x000000011f0bc000
+          avail:        0x000000011f0bd000
+          used:         0x000000011f0bd240
+
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
+
+    Example:
+
+    (qemu) info virtio-vhost-queue-status /machine/peripheral/vsock0/virtio-backend 1
+    /machine/peripheral/vsock0/virtio-backend:
+        device_name:          vhost-vsock (vhost)
+        kick:                 0
+        call:                 0
+        VRing:
+          num:         128
+          desc:        0x00007f44fe5b2000
+          desc_phys:   0x000000011f3fb000
+          desc_size:   2048
+          avail:       0x00007f44fe5b2800
+          avail_phys:  0x000000011f3fb800
+          avail_size:  262
+          used:        0x00007f44fe5b2940
+          used_phys:   0x000000011f3fb940
+          used_size:   1030
+
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
+
+    Example:
+
+    Dump the information of the head element of the first queue of
+    virtio-net (vhost on)::
+
+    (qemu) info virtio-queue-element /machine/peripheral-anon/device[1]/virtio-backend 0
+    /machine/peripheral-anon/device[1]/virtio-backend:
+        device_name: virtio-net
+        index:       0
+        desc:
+          ndescs:  1
+          descs:   addr 0x1312c8000 len 1536 (write)
+        avail:
+          flags: 0
+          idx:   256
+          ring:  0
+        used:
+          flags: 0
+          idx:   32
+
+    Since device[1] is a virtio-net device, we can see the MAC address
+    of the NIC in the element buffer::
+
+    (qemu) xp/128bx 0x1312c8000
+    00000001312c8000: 0x01 0x00 0x00 0x00 0x00 0x00 0x22 0x00
+    00000001312c8008: 0x06 0x00 0x01 0x00 0x52 0x54 0x00 0x12
+    00000001312c8010: 0x34 0x56 0xe6 0x94 0xf2 0xc1 0x51 0x2a
+    ...
+
+    [root@guest: ~]# ip link show eth0
+    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode
+    DEFAULT group default qlen 1000
+        link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
+
+    And we can see the MAC address of the gateway immediately after::
+
+    [root@guest: ~]# arp -a
+    gateway (192.168.53.1) at e6:94:f2:c1:51:2a [ether] on eth0
+
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..47446d8 100644
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
index 9c91bf9..343b266 100644
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
@@ -2165,3 +2167,359 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+#define DUMP_FEATURES(type, field)                                        \
+    do {                                                                  \
+        type##FeatureList *list = features->u.field.features;             \
+        if (list) {                                                       \
+            monitor_printf(mon, "                    ");                  \
+            while (list) {                                                \
+                monitor_printf(mon, "%s", type##Feature_str(list->value));\
+                list = list->next;                                        \
+                if (list != NULL) {                                       \
+                    monitor_printf(mon, ", ");                            \
+                }                                                         \
+            }                                                             \
+            monitor_printf(mon, "\n");                                    \
+        }                                                                 \
+    } while (0)
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    VhostProtocolFeatureList *pcol_list = pcol->features;
+    while (pcol_list) {
+        monitor_printf(mon, "%s",
+                       VhostProtocolFeature_str(pcol_list->value));
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
+    VirtioConfigStatusList *status_list = status->dev_status;
+    while (status_list) {
+        monitor_printf(mon, "%s",
+                       VirtioConfigStatus_str(status_list->value));
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
+    VirtioTransportFeatureList *transport_list = features->transport;
+    while (transport_list) {
+        monitor_printf(mon, "%s",
+                       VirtioTransportFeature_str(transport_list->value));
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    switch (features->type) {
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        DUMP_FEATURES(VirtioSerial, virtio_serial);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        DUMP_FEATURES(VirtioBlk, virtio_blk);
+        break;
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        DUMP_FEATURES(VirtioGpu, virtio_gpu);
+        break;
+    case VIRTIO_TYPE_VIRTIO_NET:
+        DUMP_FEATURES(VirtioNet, virtio_net);
+        break;
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        DUMP_FEATURES(VirtioScsi, virtio_scsi);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        DUMP_FEATURES(VirtioBalloon, virtio_balloon);
+        break;
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        DUMP_FEATURES(VirtioIommu, virtio_iommu);
+        break;
+    case VIRTIO_TYPE_VIRTIO_INPUT:
+        DUMP_FEATURES(VirtioInput, virtio_input);
+        break;
+    case VIRTIO_TYPE_VHOST_USER_FS:
+        DUMP_FEATURES(VhostUserFs, vhost_user_fs);
+        break;
+    case VIRTIO_TYPE_VHOST_VSOCK:
+        DUMP_FEATURES(VhostVsock, vhost_vsock);
+        break;
+    case VIRTIO_TYPE_VIRTIO_CRYPTO:
+        DUMP_FEATURES(VirtioCrypto, virtio_crypto);
+        break;
+    case VIRTIO_TYPE_VIRTIO_MEM:
+        DUMP_FEATURES(VirtioMem, virtio_mem);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (features->has_unknown_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_features);
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
+                       node->value->type);
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
+    monitor_printf(mon, "  num_vqs:                 %ld\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   VirtioStatusEndianness_str(s->device_endian));
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
+        monitor_printf(mon, "    vq_index:       %ld\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %lu\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %ld\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %ld\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %lu\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %lu\n",
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
+                   s->device_name);
+    monitor_printf(mon, "  kick:                 %ld\n", s->kick);
+    monitor_printf(mon, "  call:                 %ld\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %ld\n", s->num);
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
+    monitor_printf(mon, "  device_name:          %s\n", s->device_name);
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
+    monitor_printf(mon, "  device_name: %s\n", e->device_name);
+    monitor_printf(mon, "  index:       %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    ndescs:  %d\n", e->ndescs);
+    monitor_printf(mon, "    descs:   ");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            VirtioRingDescFlagsList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s",
+                               VirtioRingDescFlags_str(flag->value));
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
1.8.3.1


