Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA782EED7F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:37:23 +0100 (CET)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlOk-0007oB-Pd
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlMZ-0006bE-5u
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:35:07 -0500
Received: from mail-oln040092253108.outbound.protection.outlook.com
 ([40.92.253.108]:51664 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlMV-0005lX-4x
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:35:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQiASwPuRv6vCneedXQjE8OxPmYVcu07lBxSpWM/jdn6NHMk6XiDmqA6YuK62Hma9IOyHwfAEt5Cr2+D8Dw7069Xnurry42bMxjZjZFpzYqz3YwZk3+sXn3zNJMLV57BeNT/4qGzYrpPvlVDr0/Wsd89My7a1cIfDPrcJR3HB4JcYse8aVSB556pB+RRNPcECp026eUttpWGh4OS3I7JgfJ977sv+XhdLCxagFbH9FClbh571tf2aPvEEZEY7jVAtHCXc9c1O0Av4w6UN8X5HYzQo7/dM+d89FhgP3P4FpaGBgmjq4iMc1Z7qgJhUIqF/gjGTdCMEi8qY5Z6xYlBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd/Z9AJfpvYyLX4pXY5FUgkJgXZEJOgZen2QAZyw3ZE=;
 b=PpVKiZZtRGTsgMj+dzZVwEnPaFvMw4pP6YTRcqRmBgrCNUDdbaJOSf3mNuPrfq/Yx06nwiMe918P5I1gcMBCN7m/VrtLrLywj2RQD9MFWElrRI5QuaomwkguLAoYrlQqso+ffDZuWlZX3OsMej5ew2qjuN2MJC9PelJFcQwOPKTbslOj9JutMQYsuc4tSMzYqtO/YVoEjiee9POHY9WqLoy/7bSWJOmlclviv0rGyd45+qFGQI4+5D6JB9YYqsyAQrXykIR4kkRvyufFyUpxYWbhENr+SBL9pBxTsH7qpx23Ui4JIz0NRKh6sKLw2+jyoBwrXznNsdl0UAKfIzhKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd/Z9AJfpvYyLX4pXY5FUgkJgXZEJOgZen2QAZyw3ZE=;
 b=nU9lxg5XEpXMHw5Y4MDh3zttnGYW1qGr8FEQnDm/b7b/4UUksOeCEKEoFJaZpsiDi10D3+E5behN6LJyF+QeRxQMfQQSiys/C2EIAKIvmBGP5lo3DuvIDHLIKwWKRJmUE9lH7VNwB9UobQZSLaiptdGbKCfffsPS8E6KnTqqh5Cwe5ifYv4W18Bdr23dMA1W9RJDpfd1OOZ9myd16KI2M1D/ZcLf68rIJBr4Jaa2WjaGXP9KDb2QE6t9BGTX+2Iq12T/AYCoiIWNrnCQ1IloN3Mm9uB8pW1B32yHgYjNTLS1dLLwZP/iYej+vfmLSQEY5f0bYwD9JmvgFcOdXsv2QQ==
Received: from HK2APC01FT027.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::43) by
 HK2APC01HT013.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::158)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:34:52 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::46) by HK2APC01FT027.mail.protection.outlook.com
 (2a01:111:e400:7ebc::179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24 via Frontend
 Transport; Fri, 8 Jan 2021 06:34:52 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:49C1729C429EBB106BE969C0500FC6979A9A4C3E1CBA8325F3E1E862EC3E609D;
 UpperCasedChecksum:9F71C14E560A0CFDE363C8B0ACB2A9FD0B7B21C18217EA31FD5FA61A928D050F;
 SizeAsReceived:7645; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:34:51 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v6 2/7] fuzz: double the IOs to remove for every loop
Date: Fri,  8 Jan 2021 14:33:26 +0800
Message-ID: <MEAPR01MB349465205BD9869A6F62676CFCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [s2ZIUxKQXvZeeW8MEpVAilrfRSJy5OUZFf7Pi/ey8YtZ7+53en854VGErcgBLZW+]
X-ClientProxiedBy: TYAPR01CA0016.jpnprd01.prod.outlook.com (2603:1096:404::28)
 To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108063331.17035-2-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:10c6:c22f:85d6:f9d) by
 TYAPR01CA0016.jpnprd01.prod.outlook.com (2603:1096:404::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:34:50 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 7e53df00-1b94-424c-2068-08d8b39f8111
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?KE5ywuOaN5jiCpCm+ROEFRq2FG9qaSQFWYDFNIHdV2bf+MftdUSYDDPjTA3t?=
 =?us-ascii?Q?6X7eTgnXKfOiZ8xtktUdbUXiCzEfXcV/Z54+XRXUjPz2PwGE2d5eqbjRBU3N?=
 =?us-ascii?Q?+xPCR+67uXCKSrRbrAvTvg1+W4la3peARwvjPmMB8SWhPqttQgyr/rlenWbe?=
 =?us-ascii?Q?h51lWqQdsRYXYBJubCdGwvZJ9ac9gvGBaczwCTBQgF1jEaDwNSZh8/DWK5wo?=
 =?us-ascii?Q?Ah+varCQm95xcTvXeKW3KmKxncmoEOFgyoI520E0t9A6hck5pA/ZDC0BFS5K?=
 =?us-ascii?Q?jrxFU5XJo72RnsQZCPnIgREV8hW9i48SPSnWSMXSD0n7UHuZcEEGqZbdq+EU?=
 =?us-ascii?Q?nUzbQE8BZYX5jzUzIziCPWICCqwJBldG3IqjUcBPLOygmXjuTzi4ioIHjQsI?=
 =?us-ascii?Q?MqOX5/KeCH3lfpm+WIQHGwJ2FiFnS4TZPsnYzslUMYDdzwmVdYTcDx5Z3lhg?=
 =?us-ascii?Q?1snGnKMqRupknoDz4pqQRBCUzS8+IEftOY22KBrSgAqaXP2/zE+wdRLzMnLq?=
 =?us-ascii?Q?JbEmhmSrQcXU4h/JXLeX74jhiK2Avb4HFd8/r4t/r8gnyTD6X++4DC14Qr3M?=
 =?us-ascii?Q?C7oopTVFiC76Q0Skm1E3CN0Z3MeVX6vOiR83zmaysr9DSnGhD5x2at8wQPwU?=
 =?us-ascii?Q?7aL9sOIYlvUN8AoY4+MjooMGejkyIiBMR4sbsJBmHgnG24+f+8ryJkbB0EYz?=
 =?us-ascii?Q?mBstcu+T93ym+LcUWkncTWB6UaYp2DdvWaSg4FJbMSmMEyBCRFFs/wCHllwl?=
 =?us-ascii?Q?Ga+k8AEjGFMWWBL6xjRbgamZi3h02U45imh3UlGulLZTA8ll0i9OwMT2GWx0?=
 =?us-ascii?Q?yoC2QV+r6X58no16dJbvOU8CCr64SLgLmCqpUUVsFUX/M752S7ACtQZ8gIBS?=
 =?us-ascii?Q?QhQ38wCPxhmWNN54wfurMnfEn6N5VEBEWrfJTq4lvKFZI6tnCktPWOnuk9c0?=
 =?us-ascii?Q?Pw+i7X1ZIHKA39aBOEITZLy5urhZvXqn?=
X-MS-TrafficTypeDiagnostic: HK2APC01HT013:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yrplImr5awU7EPFnZLAf9c2U0eFMg6xVPxh7BQzLB7XQ1ONvzkyzMKHuKwNv5tuySkJMrOUiJe/8k07AkMfewb5oqLLKma98uWxdh1XPil+OiZYNC7OrfZHdS+P/UbnfPYFfc7olYNgF9CMF4KHt6uaz3tE19Cb8Htwr3arNwShbpKWHZWmlAA30WFeYNSylYRcrTRIlHc6jCCLuyPA4Yax1pPvneWUMi8No6OriKFhuSJfjwGVq0Hl4G17T1K90YhPwAp6ZpteB7HVazDQrFMmurNozJUzyPR7LDTYm+JA=
X-MS-Exchange-AntiSpam-MessageData: XvKlWNMlb2ST9NQmFShRKD1o5WXOJpmRgO5CSy21Px+kTVN/zhehR8LB31118odTRtdSULZsIpGGD7rUcUIpyOneu9hBABsyoEsSL+MWUHslF0rhlLKOgch0RroU+7zTwnPDABasb5fG329jKpMnJo5N1SiPDZgHDv14NO6BMi6v07ZdlGaLEZ+OiHLcD/FhkXKe4o/TFvBr0K7Y3Z5SMA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:34:51.9060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e53df00-1b94-424c-2068-08d8b39f8111
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT027.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT013
Received-SPF: pass client-ip=40.92.253.108; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of removing IO instructions one by one, we can try deleting multiple
instructions at once. According to the locality of reference, we double the
number of instructions to remove for the next round and recover it to one
once we fail.

This patch is usually significant for large input.

Test with quadrupled trace input at:
  https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

Patched 1/6 version:
  real  0m45.904s
  user  0m16.874s
  sys   0m10.042s

Refined version:
  real  0m11.412s
  user  0m6.888s
  sys   0m3.325s

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 33 +++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 57dcaaeba3..cfe8f7854c 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -85,19 +85,28 @@ def minimize_trace(inpath, outpath):
 
     i = 0
     newtrace = trace[:]
-    # For each line
+    remove_step = 1
     while i < len(newtrace):
-        # 1.) Try to remove it completely and reproduce the crash. If it works,
-        # we're done.
-        prior = newtrace[i]
-        print("Trying to remove {}".format(newtrace[i]))
-        # Try to remove the line completely
-        newtrace[i] = ""
+        # 1.) Try to remove lines completely and reproduce the crash.
+        # If it works, we're done.
+        if (i+remove_step) >= len(newtrace):
+            remove_step = 1
+        prior = newtrace[i:i+remove_step]
+        for j in range(i, i+remove_step):
+            newtrace[j] = ""
+        print("Removing {lines} ...".format(lines=prior))
         if check_if_trace_crashes(newtrace, outpath):
-            i += 1
+            i += remove_step
+            # Double the number of lines to remove for next round
+            remove_step *= 2
             continue
-        newtrace[i] = prior
-
+        # Failed to remove multiple IOs, fast recovery
+        if remove_step > 1:
+            for j in range(i, i+remove_step):
+                newtrace[j] = prior[j-i]
+            remove_step = 1
+            continue
+        newtrace[i] = prior[0] # remove_step = 1
         # 2.) Try to replace write{bwlq} commands with a write addr, len
         # command. Since this can require swapping endianness, try both LE and
         # BE options. We do this, so we can "trim" the writes in (3)
@@ -118,7 +127,7 @@ def minimize_trace(inpath, outpath):
                 if(check_if_trace_crashes(newtrace, outpath)):
                     break
             else:
-                newtrace[i] = prior
+                newtrace[i] = prior[0]
 
         # 3.) If it is a qtest write command: write addr len data, try to split
         # it into two separate write commands. If splitting the write down the
@@ -151,7 +160,7 @@ def minimize_trace(inpath, outpath):
                 if check_if_trace_crashes(newtrace, outpath):
                     i -= 1
                 else:
-                    newtrace[i] = prior
+                    newtrace[i] = prior[0]
                     del newtrace[i+1]
         i += 1
     check_if_trace_crashes(newtrace, outpath)
-- 
2.25.1


