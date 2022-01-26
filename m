Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E231549CC7C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:38:31 +0100 (CET)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjRO-000731-V0
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJC-0005nW-DV
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:02 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJA-0000b7-7f
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:01 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q9Vep6006719; 
 Wed, 26 Jan 2022 14:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=6S69sfqhj+MNqQfiQKHNvzBaCqzvS5fgzF90oG8m3Zo=;
 b=0Y+vi/mYm2HMagiu/fH4SeJgXJJUsW3tWUNVntfQJaXBaiW9jSV+igweGjDioSlp0wqa
 w3oLC7d/TLpgTh9x0x/3Q/iJR0jCvYb0XEEOXxsUQLEgcwhsd8OgJBkwT28D4TZ4CZkW
 in06t9RQ01AYnuKfS5G1DdvhrVhK7VzkY8yKE/2V9yU0REg3V1aF6zzYRXt2nKstGgq3
 NON20qojepRGzmrjh+cFLX+5+fLUUiiI5iT5jAkQL+HyULMTl9n7c8vF98CSW4koVYhh
 TCfM9NRJfbVRQVKUEr9QSJzWcPdp/EyVU4ijwDTZn6vU4kykvaLubWEh2e1xE8fZ54Pz aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjerb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QEQoxJ181401;
 Wed, 26 Jan 2022 14:29:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3020.oracle.com with ESMTP id 3dtax8fy4y-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ0nK5un8S/0z1QCRg0VqOdEblIBCYX+qvS6D17oE6ZZ2XTN5Ry5OIlmqpXLcIozBMH/AfT/zZJJf3u7Wvb61UUSeJSVFcq1l5x0uigxnEyEnHFTtv/9TX8e2wlvRt7tqen9jUVsS/iyoYijjXUgV4duv/v7cukbMlAG4HH0VKZsObIG/ktvRFjdfmitU8eE9tXjMAfFSE9u+5PGU43V08HRrqQcKRZiajcuGn8y5xqYRmOi5G8LyyyjAkGN0P7RW0FnLFs+x2p/OSYxrh5bz7l5eI/SY0ddkZKLIiV0NACWeHzbzLzDjTQDYehijYkQKr3Sk0yNfqw4h6557TjojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S69sfqhj+MNqQfiQKHNvzBaCqzvS5fgzF90oG8m3Zo=;
 b=f1Q/er+YQ/ueTQXCLAepOhoD4+ZLYfrqU/E8+1qKcQNwXinaDKQFYl6hOqcV5xNlOXfGYp/+Yk/CoGzxt+jNPKQ+PGDOxeEudHP+148SNOH0K96zwRE0QHiW7DfxBDT5ZnrctiEOaMHByJx0UtWOXqilbk2BTKojOtQYIKqPqs4Stg7ZjRPusn3v89J0yUJgKF92yNUQIYXqR1WQpL7Xr7Nz/mPTILhaOyPwHDjM+tp+WBqnMbs3nwm5vXM/xnqkkIQCoxvRfg9zTrlYRxUB63DhbqGLfkwsaoRwD8Gdu4HChbDzeFrFWb6afGWWQHc8FzXiuTWPiaAvoyeYWdCLdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S69sfqhj+MNqQfiQKHNvzBaCqzvS5fgzF90oG8m3Zo=;
 b=EUimvkNm2uXqXMpfiBmx2HCwexo0UiOni+iXPRV9AvxSABgkmPukx5FOErpRkAtJi7lpXsqRV/ZNO4U4wWlVOV9QlwGl2STCt5UV1yS2Ozm6zIVwdnsLVzznpBOiAlDcnE1A24P3tvzTitpKHzTjt/Hl1qDDJvu+AFRHTFw2lhg=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by CH2PR10MB3990.namprd10.prod.outlook.com (2603:10b6:610:11::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 14:29:54 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0%7]) with mapi id 15.20.4888.013; Wed, 26 Jan 2022
 14:29:54 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] softmmu/cpus: Free cpu->halt_cond in cpu_remove_sync()
Date: Wed, 26 Jan 2022 08:29:44 -0600
Message-Id: <20220126142946.667782-3-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220126142946.667782-1-mark.kanda@oracle.com>
References: <20220126142946.667782-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0019.namprd05.prod.outlook.com
 (2603:10b6:803:40::32) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c603e90-fbe9-41f4-179c-08d9e0d85218
X-MS-TrafficTypeDiagnostic: CH2PR10MB3990:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB399025D020608C14B3EB6240F9209@CH2PR10MB3990.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHx325R47RpszYRR56PP6fTJ7ldjcb0ERE15EGNvrkn351AviwwmelDz4XVQmuuDBTdFt1lyShLs/TsJZ1tvDjBPQuCLCaF94NJrrhJtCxnm1AG9PwuThhqx4lXAbMJ7lesWnbF8LH80fnwmDTtKhqynNXynMWTVxqAK5UsAHWHX1AkALUBgp8UPwvv5UDjBSfdObr8UZ/HDfrqpbaYzZpYczQR0CWUcYS6K7iz0IYNCtwvf0mZ85/YLaFXly0gcAAjS+aPei1cGPgVkPtYEQvazXYTjCZyKjtmqvw9iFZLMmr3xFutvsvrHtKhwXkfNDW974pTl4L6vmq1ddJSD8qHJzElGInlhVDevZRZ64X6PqbgSfICNaBx9efEnWSQkDLmdHpqYGWR8J0G/7dcfAu6AZlQN+E2FqTIxBcF8PnTwKYi5UdIwp1oPNzKSGM1rKTlImQ+hJ6r6RqLroqRfEi6XuRerwIL10Hx58Zwy9dkHMwVf5hSAEfwoW8XS5uNqyUTkoEKG8NrCGV1igeTU1LM4NiCjsSLZpu7d7jo/auZocFFnsusoGQ5u+Ty2e+vJ4n4S0oqL429Pty4g2vc37bAS8AqtMKzweUd+FbMGbxYvWYXlBXRtf6MVVJsCIQnpvkL29RBF2ogbqI98esFGjNL1vWBbWuq2qM/Cj2Nh39jrdr0JQj/hLWr6hKIfL44tGcrjAwXN3i7le683N3if6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(83380400001)(36756003)(26005)(6486002)(316002)(66476007)(1076003)(186003)(66556008)(6916009)(66946007)(2616005)(107886003)(86362001)(6666004)(6512007)(6506007)(44832011)(52116002)(4326008)(8676002)(5660300002)(38100700002)(38350700002)(8936002)(2906002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FRnkME9xtOO93d8bvayIkaX7lDQxjBKde8QWdwzXio7iFijHJ52+4tvCvywy?=
 =?us-ascii?Q?rJWT55kHjSqEtVNVyDkqsJhudoVNM4zdNwzJ5xWZp2kR6aVeE+UAKGbCR1pu?=
 =?us-ascii?Q?VcGbwPPtedYvd2hcirekG4Lfj0GAAA+HewKk5rVFrB3+XjLz9hp06biHihnv?=
 =?us-ascii?Q?8gbba+Rwjtz3yHyyyDb2Fq44jDm0ZiWX5oINLQHX3UDnlF6G2S5srtGiqTQ0?=
 =?us-ascii?Q?yajtzPxS7RTnC+lKv1eBL4Qt4lwGR0safBLAAFdbALXROW6eNqQMAfMwN7x4?=
 =?us-ascii?Q?oXxRZlUOwQnPKJkTI5hAonwp0XT4t2Or0qZtEeSqmvnK1onyTpe2Q7UAt7Li?=
 =?us-ascii?Q?LN3hfJKBbcykXrNbkZvCRAhWRn7E6uzEuSL8Bt5ActbzYNQIVcMYuJ9sUh6T?=
 =?us-ascii?Q?HGspAE+2dgz4vMECiwl4JRRk9zmCRdFZqdojwILNR3+66Y5UvknpmGvlvUau?=
 =?us-ascii?Q?NTxKSkE3K+W6XU8u2MmNyrH1/3sBmXwfzQUJVK989XieOrEFaBAS/GsiTFgE?=
 =?us-ascii?Q?yH6UffkIxYhPFFeYaa9bOWlz0pMhpvFrnL5PGKmF6T9bAFOITpYuGA4g8qM5?=
 =?us-ascii?Q?5A0mN8OXyiQA7JeZ67xShQjxBJWtcyihf3ZD2OImjQmhTCrr8rn9oAkxo3uo?=
 =?us-ascii?Q?fBLGfXUaJyj6pJEYcnDs9n5JW6T8oUqxexY4LpZScP1sJA4zoYSDEuaFi4Oi?=
 =?us-ascii?Q?lWks0BRYFq3V7RrjT5GW6W3bxGu7dBzzKal8KXEX7xPEqnp9yRGkgbrVkQ2Y?=
 =?us-ascii?Q?MScEZx/NYaITnBbH3MDILAhU7mc5ST9mC+ySisa+US6ALUaVugaB19yG9tgE?=
 =?us-ascii?Q?lgooH/oclO/jFjx4KpIfJav5PDGm5HE+pwL/q6Fzl07mhotBdmtLOi1AzNKY?=
 =?us-ascii?Q?BOpvn+qegBH5JOeOvwL5JNccpNZ2GO3hq+U6j0gqBpjRBu4sB9OohnyIFjdy?=
 =?us-ascii?Q?udIBAana2au45HV//hTtSU5jw1DhJCrR8wEAqaKbLNEYA1X3WtQpVMsf78Ua?=
 =?us-ascii?Q?MA4jN6KrkGntR1wxEcK7w7BVOIK5m/Gv9YfMljcfNAUODZRu7x6stDrbcTvy?=
 =?us-ascii?Q?zYWUSzseVKHGStd+SP/gc8puJszrQ0JVrGvezvAPKQgqIEoGAlXj27ulhprJ?=
 =?us-ascii?Q?YTuuArhp+PXdUvIXek/bH2YSc0U4Qe30ZBFHc8cVTF4wKEyV5GRzCKLi9D7x?=
 =?us-ascii?Q?E2Ssu/VG0I2wJsnMInCCdzsn0TR/JMucJ+d6dyxgirIJ5WFxzdDKm9cY+dUz?=
 =?us-ascii?Q?6izRBeqlb4Gotq0Mn36nIDoFq4pXHJwvtRCC9cwOpP9Vu9122w2H0BXoDkXw?=
 =?us-ascii?Q?zqsTg5c0ZOCKiXJYhAZJaIpHV0QrER+3GAU5sDe3R5Z6E7nKBWD7Bxzuy+Uj?=
 =?us-ascii?Q?+s48hGE/Oi/Rn4NS6EnMdC23B9vfYTc2zpcPig981YMNG22Pq6MQA89HF108?=
 =?us-ascii?Q?ouJnCEewMwUpn1VkcwveZUoq1pXDshyCtVtAnPFFMfe/Sj2crZ0ei9SNiY1A?=
 =?us-ascii?Q?jESbb8QMqky7dRV6f+hNXGfkXy1mKMbyWuI21THzlwfTOyK8WXC2WhhD7dfc?=
 =?us-ascii?Q?UM1wTYAFMWUQPaJD18soFUx3QchowbVXWXiMExAq3oXBck1NMXjgkg7DTT7o?=
 =?us-ascii?Q?QnOL2MAkQ2cQczXOk/jwAf4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c603e90-fbe9-41f4-179c-08d9e0d85218
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:29:54.5597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8gz9EjzO1LbSQeZjleDdJr9h+hqtICrE6R33iL2F9joaU0HmMBKfYiyxYT0jP0yADkyZ/kjnQ+ubiZs/nuiAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3990
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260088
X-Proofpoint-GUID: P6mBp7rDWaOsq-X-xVq_cVpP2XGULX9t
X-Proofpoint-ORIG-GUID: P6mBp7rDWaOsq-X-xVq_cVpP2XGULX9t
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vCPU hotunplug related leak reported by Valgrind:

==377357== 56 bytes in 1 blocks are definitely lost in loss record 5,017 of 8,471
==377357==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
==377357==    by 0x65C14CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377357==    by 0x8B5AE0: kvm_start_vcpu_thread (kvm-accel-ops.c:69)
==377357==    by 0x7817AF: qemu_init_vcpu (cpus.c:634)
==377357==    by 0x7185A3: x86_cpu_realizefn (cpu.c:6447)
==377357==    by 0x8E46B7: device_set_realized (qdev.c:531)
==377357==    by 0x8EE36F: property_set_bool (object.c:2268)
==377357==    by 0x8EC3C5: object_property_set (object.c:1403)
==377357==    by 0x8F075D: object_property_set_qobject (qom-qobject.c:28)
==377357==    by 0x8EC72C: object_property_set_bool (object.c:1472)
==377357==    by 0x8E3F7F: qdev_realize (qdev.c:333)
==377357==    by 0x43F3A2: qdev_device_add_from_qdict (qdev-monitor.c:711)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 softmmu/cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 1d8380d4aa..edaa36f6dc 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -604,6 +604,7 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_thread_join(cpu->thread);
     qemu_mutex_lock_iothread();
     g_free(cpu->thread);
+    g_free(cpu->halt_cond);
 }
 
 void cpus_register_accel(const AccelOpsClass *ops)
-- 
2.27.0


