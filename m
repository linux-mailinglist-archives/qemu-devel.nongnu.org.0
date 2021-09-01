Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7343FD917
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:57:24 +0200 (CEST)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOrr-0000Fm-8K
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOqI-0006TJ-Go
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:55:46 -0400
Received: from mail-dm6nam08on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::71d]:59953
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOq4-0005WW-9E
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:55:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKqBRt1qyXREqvMDB2lCfSJVMxLt43VNg2PM7Cml/nIVvZPFjPr6rwNrMHh36FgvyHubdjdRNEypxcaZin/aRkodH016F8UU24iwUa9iPV0mMtaLzNuaOMEetFgn0DP3R7wpLPn3rkt6730q0jaovMej2NIJhYeHnfFGJhT51MynCJgQV6oIBs0qnCzJlkJetrHTy4H/uU0D9e51CfzP46GPyxiEtLDfI5jbUqqXn7SHvsNGpyO1Wi5jxGRwixd30KVLP4/Y3CikjWxa4rBvG5WXCARGFAokynrNo8FSgl/QC9k168LtV/OPs/5s4O0oMAQvq++cOqSrbDl+4ZZizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmPJ+fD4N3a/Adp1pQJyGkU/mGVHfc5J0H8LriDEbPI=;
 b=nBEf4zTS8zYc5FTfCMNuv8dNg4dS5+su5emZvPTQksHD27MwhpWq1OAEd1aUepwlR2qolMo0q5VAmH/X5vNIoAElDUUY9oR2+UQqvib1kgGKdSI4Ye2/uqoKjab5+SzBrBVb+AxooK0vW9jVJmazDDO2KHj0QVoOBt/nlY6uy84cL/Wc5r8FgJFeyA5AvYBDa+yVcN77Qh3+s+eBHwYOAp89HDunOHa4d2F85gEWKez3NuZXFnS8VTFcCZ5epqPlr40qYUYkRIf5XhzWoNtn4JI598I8d3dNx335fpwoG/Vg2FzWexGb/Nb5bO/rn4AjBgA7t3BYsWZwu4F1Y99qtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmPJ+fD4N3a/Adp1pQJyGkU/mGVHfc5J0H8LriDEbPI=;
 b=N/G4l4SEi4VXE2/bUe899m994FJOd3Kj/ZIZvz7BmDl+QnbO/qb3xIf0pzw1zoLa0LKYeKeTWURrnRWaTYDZouJOQDazoxJJ4ueuFcjd+55YXi3ek3a0EFlDz36AlUqJ9LFL69TSEK4unX9zBTC9yDdfRhVDO91gL9QDDNACOsAg8SUENnAcDq2Ugau+TCG3gB2BBZATI6veyeNfXRnJomlb5CzCiTGjaczFl7en37NvPVs0+ocZ35bjgsNQlGcScucp7X9oyIURfbnXrhdvL/8LVJDnpqeKYKzjgFqJBfkE4upfSU7BMivPTJRSxMM2vrZZ4cGCLpv/zGHMSGOBwg==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4224.namprd03.prod.outlook.com (2603:10b6:805:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 11:50:28 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:28 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 2/8] fuzz: adjust timeout to allow for longer inputs
Date: Wed,  1 Sep 2021 07:49:58 -0400
Message-Id: <20210901115004.34768-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
References: <20210901115004.34768-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5eb0f3d-6000-4334-b0b0-08d96d3eb160
X-MS-TrafficTypeDiagnostic: SN6PR03MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4224CC7E0C7E430266C2203FBACD9@SN6PR03MB4224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2hMVi4MFRcmRPPMpqQVtUNcJd4Q29rA09/UfyGjiEx45qio/gPsBgfbRNioZ56KW32jvvD1yL6WxP0GWSt7D0KZi8SLoKN133cCy0p6dUKiwBvxHzN4fDwYjYacfWHTSjREogOYswm15eQN2Tp85AaXi2jBGWuP9PtDX3oXTFxJaH9kmXhKPqcH4jzC5ARpO3w0gebMDFzLUbRqXqNIme+6CHLcv6A6UHCq7q/+P9F1sdD9rTF/ipLwRq1jHcyiJGdTrAXBxtCjWlmnori8WF9PGbEvnhSf4jh3113uia2zJRYas6oimOyY/pMOTq+blF/l2HmT1AovnThqJidG36fGycrXAVdF1a5DekWt8G8oW6xI2mAVplcHxwNCD+U3dJ/fy1G2imANKwc5oGmReCrGVyLkmM3CpniGfFmYQ3klw14MHleqBQFsKtXVmh5yV7HkMfmGFgoPmP7ACctUQZqPZn3MX4rk8pJDdDC1sgZq2SIRyl7AaKKQrWTbQco6QCL/8siCqGHAEfkwQ6/9tJq+X6WyY9ipe4DiPB7xgAhQ7T2Cbe1VMyyhSAsg4T2jfeP0FCc60FvN/32hSpCfifT6FMjBrU4QOSlKwyymqr2Q4U8A2d5kT0BTSOkIMgaQg5Qsg9z5l5LxKX7vSYNuEnQ0rnMCIOPPnY0QkmKfyO7dPWOuIzLsmpD5LWWSbyTKWif4vYAbjAIbclZHevXU3/0Y7tfGdYqEOiB/CclMYuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(75432002)(8936002)(38100700002)(38350700002)(6486002)(4326008)(52116002)(5660300002)(86362001)(36756003)(956004)(2616005)(2906002)(66476007)(66556008)(54906003)(1076003)(83380400001)(186003)(316002)(6916009)(66946007)(6512007)(6506007)(8676002)(26005)(478600001)(6666004)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JQqdyS24REEAkJo9mX7kQ+pnOLg8OLYv//7YUro35GSLqtcv/d603mUbOKd7?=
 =?us-ascii?Q?SVbjXb3nduRop+UHK/N4+jkFtiek3UPCNrhn1w+N8uXJzPwWGpJNySuAeLSQ?=
 =?us-ascii?Q?CqFC7JXOGAQvEKGExHWbj+BjzcuwF83aTFf49V97fSOfYhu+soug7QC2l1y5?=
 =?us-ascii?Q?Ygd5lOVhb/8U83iYEqfi2tfP64tAXLCdiALx2geXgtZ/8Fe5y/6F/IB1D8iN?=
 =?us-ascii?Q?3w0JYXSL8dV2W7QviexW0ouAKslhOdRRp+DIqOIkdzz9Y5E2HPGhPSljClv6?=
 =?us-ascii?Q?Vwvk10w3l/GvcCs6afs4nw3yObTvFVBTbs9Dq05+ozSY0PgTuLQbOj+zQV+e?=
 =?us-ascii?Q?5cCPXJjf2Z9QSln7myPsETlbYXdgppaJB5BUKhmgySMRi37JgizYQ+VWXj0t?=
 =?us-ascii?Q?X94ly2HABER/+ikoo9Kq/08Ydj3WNpDkjDZKSD+Euw8NjmRt6s6a8vwNOyK8?=
 =?us-ascii?Q?/zHCSKVJIy+iyyOYU8T/21A6/0jBJuB09Xyj7oIujfRaedFkGZv40JzZckss?=
 =?us-ascii?Q?7qsH+ha50XZ3QBY/LjXERtOlarTZKvVPWg2ARjAn621BFQlR/dQm9L29Xrir?=
 =?us-ascii?Q?FfnDEZTtan8VeW3bT7DtnKtPlLKnrBxURwBEiN5bE8NRDkYC/xvMJU2yOJlW?=
 =?us-ascii?Q?RTm3UN8xtbHqCcPqWfTTkpYhIXvVPYBt/eO5LYMz0mS7L7n0apmNq3ZofIrd?=
 =?us-ascii?Q?I3B8bpN+yZYlV+tDP+iCt4f6+gO6RmKGC2imLIQB/nCKapAqhtjuxUNWQLb+?=
 =?us-ascii?Q?w0em4+eNT2uaLrKQ7wDMdYsccxtQ8UTc2AeUFNQmUojuIb+pRvhZYcjeZaeH?=
 =?us-ascii?Q?OYzZ2e+M65lIPFUnQxqS8ouseJgTu2zroTIPQNRix24pzz6MefV0mv4fUjPI?=
 =?us-ascii?Q?tZ5vY5DXWchnXsb39BaX0tluE9YPEZ69zuf5YylSAd5CKvB14Onl7sjYFo8j?=
 =?us-ascii?Q?vC2UHI2j7G3CSubsxhMypZyxMc2zng14Q7PXwimrJcfqb92+aEBChVW6zv5s?=
 =?us-ascii?Q?PqqYOfl3kqHZm8Dd00LFeSfQD8TeWc0dvKQWU/BVVUZFfFsSJYAQzMBj5ZI4?=
 =?us-ascii?Q?96b8rdnI+2n4U5bC5zzHDwHyL1LwgzvaO1oOBCT998YxLxz6XD1v5kt8Mh5K?=
 =?us-ascii?Q?jgAAR3/8QVUEyma9oTXmc2s2d+pUARUlXXcZmNrBP8MaxvWAvmsU1AwV04Tr?=
 =?us-ascii?Q?ICPMaQ+3aZBux5eu4Gv85Oj80KwxUSeLjVZT0eL4w/cS3Mrm+BtO6iPTXGc7?=
 =?us-ascii?Q?T9CuZLmGMtzxrOm/rES8Wn1CQeQYnNKgtrgsFgrzNg7pQjrrLTcOSMDmOGgf?=
 =?us-ascii?Q?i6+XMlUOuZzR/lZQRHij1gPx?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eb0f3d-6000-4334-b0b0-08d96d3eb160
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:28.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNyHNF+1/0YkDCxtRZY5wpa80yo2pTKWw+npDqwjZjc7I7hJnISLzQaGk6mThjND
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4224
Received-SPF: pass client-ip=2a01:111:f400:7e8b::71d;
 envelope-from=alxndr@bu.edu;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bonzini@redhat.com, peter.maydell@linaro.org,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using a custom timeout is useful to continue fuzzing complex devices,
even after we run into some slow code-path. However, simply adding a
fixed timeout to each input effectively caps the maximum input
length/number of operations at some artificial value. There are two
major problems with this:
1. Some code might only be reachable through long IO sequences.
2. Longer inputs can actually be _better_ for performance. While the
   raw number of fuzzer executions decreases with larger inputs, the
   number of MMIO/PIO/DMA operation/second actually increases, since
   were are speding proportionately less time fork()ing.

With this change, we keep the custom-timeout, but we renew it, prior to
each MMIO/PIO/DMA operation. Thus, we time-out only when a specific
operation takes a long time.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 0ea47298b7..80eb29bd2d 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -668,15 +668,16 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
     uint8_t op;
 
     if (fork() == 0) {
+        struct sigaction sact;
+        struct itimerval timer;
         /*
          * Sometimes the fuzzer will find inputs that take quite a long time to
          * process. Often times, these inputs do not result in new coverage.
          * Even if these inputs might be interesting, they can slow down the
-         * fuzzer, overall. Set a timeout to avoid hurting performance, too much
+         * fuzzer, overall. Set a timeout for each command to avoid hurting
+         * performance, too much
          */
         if (timeout) {
-            struct sigaction sact;
-            struct itimerval timer;
 
             sigemptyset(&sact.sa_mask);
             sact.sa_flags   = SA_NODEFER;
@@ -686,13 +687,17 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
             memset(&timer, 0, sizeof(timer));
             timer.it_value.tv_sec = timeout / USEC_IN_SEC;
             timer.it_value.tv_usec = timeout % USEC_IN_SEC;
-            setitimer(ITIMER_VIRTUAL, &timer, NULL);
         }
 
         op_clear_dma_patterns(s, NULL, 0);
         pci_disabled = false;
 
         while (cmd && Size) {
+            /* Reset the timeout, each time we run a new command */
+            if (timeout) {
+                setitimer(ITIMER_VIRTUAL, &timer, NULL);
+            }
+
             /* Get the length until the next command or end of input */
             nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
             cmd_len = nextcmd ? nextcmd - cmd : Size;
-- 
2.30.2


