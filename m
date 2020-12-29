Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293642E6D2D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:12:16 +0100 (CET)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku4Uh-0007sy-7x
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4RF-0006Fz-26
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:08:41 -0500
Received: from mail-oln040092253108.outbound.protection.outlook.com
 ([40.92.253.108]:35648 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4RD-0004pf-5q
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:08:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8m5wSfUtGbDEViC/REQ8oxKQ7gkAJuXMDMXFRCu9ScZdGRzHWbuAtcfAMWEmEXffA4ZBSnucaX37ZMlDYk8OiiEj8cTzu/p6SZOwgeKl1plNue2soAjH3tS7ftk4bdImzXnBGk/nBToNG6MdSheneyjOIWfO0/ExAeEgsBmVxjrGGrmE5X1SwdYQwilvubjn/aqztTuikqqm1RP+l7Mj3kYk9+VV2H7FQd5ZAa7bsOqI7w/W/fXf2DbOvJIclAogfgI0HKAU8v41116URyf0mcoP5161fOjabQ/ygNxoWmlQUn/zI8UHI+D3lbnmqnysi3EjjhVL69Op8akl1Jc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG1GmprGsMl3k4rRNoIj6GXzWL3roc1+FGD8fQ/FZ5E=;
 b=LyziaiHz06+IsnxBAnRpHKx5drmzZs0RiDk6SSxFII56biWbMpAz47G8p2hDLSHw4VEZXQC3Yi4+SyHvDh5wafXanJQ3hS2ysqEb2BeR/Yg9cG29TArXeXEbT6dyZ0S/hyqxK5GTZh12hWulMVU2rHE837D2NHT1k5OkQ/v1DBQZvQ8Huk8x9/2shx0jUSCDbZhQFBHHt9BR0WZD3w94tnQISyD810H0J77UWyEa7aEs4h16ZwTgIan6zwMfpFm3/CtGrvtb731XU0rwfHZdqLTfJVjt+AC1w6mp2LSEt1LqR6dWjmt0DeO0OtlJ48/tHiVKQXur46DQhTIC7cPDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG1GmprGsMl3k4rRNoIj6GXzWL3roc1+FGD8fQ/FZ5E=;
 b=NJ3D4R0jh1jXeNgp+zUBbtjqDPhijuuAQ5vuun6rSlrwmqk17rR7bNIx9XbWvY5fXAWnbANA4EQGFYbp9Z/l3huf04N/GLlLxjXnSiI/f8o8KSKJm7GwnUOWvXvtlgSG5SdBZV15uOTLqMrWENReGtweeOqdEOtXWEmjom6dt5rBBwt5R5aekB7RwCXLsAI1cH7gJwmJXPSuqpdF8XvHfx3XU3C//Oa3DAR6L6AarVhhAqA//9I2atDVxpaxv13z4kMrIrbQfO3RtTjfycB3gMQE2vPHQrytiSwBLuP8ZXnX384Usei6mGroM82DY6DcKUp17zNOSQxkeidfz+py/g==
Received: from PU1APC01FT004.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::52) by
 PU1APC01HT052.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::304)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 02:08:27 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.252.60) by
 PU1APC01FT004.mail.protection.outlook.com (10.152.252.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:08:27 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:44493461393B22DA0F9F33541550F7C018C5240F51EC3C6D024A3918FD22CE2E;
 UpperCasedChecksum:DD1A0F80C348227DFB5D8684E61CEE0F8C7E9077C9FAC40D02B0DB3B1B93BC02;
 SizeAsReceived:7677; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:08:27 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] fuzz: double the IOs to remove for every loop
Date: Tue, 29 Dec 2020 10:07:08 +0800
Message-ID: <ME3P282MB17451FC0D6A332FC443931FEFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [9K4rYLNmkE0oII6OU/+lWli/jLQzOB8twJkK9we2bY2o1+EdQhhbOY4qVFZyCuCe]
X-ClientProxiedBy: TY2PR06CA0036.apcprd06.prod.outlook.com
 (2603:1096:404:2e::24) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229020713.3699486-2-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TY2PR06CA0036.apcprd06.prod.outlook.com (2603:1096:404:2e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:08:26 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 826c1b5a-7667-4080-9d82-08d8ab9ea139
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?KE5ywuOaN5gUKW4Ngaj7XpCefOhcv0ruVZnfG8mmZVeJim02NEm/Ja8/qxDQ?=
 =?us-ascii?Q?evFlw8W0w3tSjVQ/yxeeZdTHy2Bi4uha06zJl3QyoWs0riWoWnHaYalNDj9X?=
 =?us-ascii?Q?I1D10T9er7BHQ2CqJbam5k68H33Cqd237Og7xLLGG/STHk+wIoh6I8AnC5wx?=
 =?us-ascii?Q?yJNfKFH7yqE/wnwaff2BoXWDjtPK/wkQwVXpVOevLBtGje2MVRVuQrmAX+Dn?=
 =?us-ascii?Q?+I03OphxYb17R5qMDs0YA85dQN8H7b5tHUTSuHxjdcRQyeuGhmk44k5paEsi?=
 =?us-ascii?Q?8uHFJ1a8+a6/F75muMqYEi0oXRdmcC2KRc0pyKGNGDChnkz4xy9zOR36AdZF?=
 =?us-ascii?Q?3aTrwFP/NnHVfpQz412MK/dX44Bf6+OW957Vfo0SKEOab6Gf+cVoqUpzGfhj?=
 =?us-ascii?Q?DhpqrxTrisqhWbo5YWZia9mH2kokF2X9WqwmtK6Sy6E21ghTJV3oIDsAE+VO?=
 =?us-ascii?Q?e1ZgekCuNA7QBOjRByuSVZuQdcLlYPjnGgLVZXLyHNq653ToruEY+sl1l8oM?=
 =?us-ascii?Q?fLxQm6PwMBhnh1R0DOqQqJ0TEEHOxN8GwmvlykrocbFMkeITHiUdgjP9c81t?=
 =?us-ascii?Q?GF2JZILcGS7x21xJ44Eliig2fjoJr3aAKfgEYy4WsVXlopuJ3NVvPfkdistY?=
 =?us-ascii?Q?j9+LnzGED+zYWM2bMUss1ffekTZ+Xa4cv9z2drW1uBFCEZOW127aGVM5ROpw?=
 =?us-ascii?Q?jcKl3xEsyu6Jo8kDM1+JnKELoiSY69VcgyzPiduQi4VmECnJ5COqhS3bzZ1v?=
 =?us-ascii?Q?iMmfHSvQCyoTA/NwELg1yA6S0o1vVGBzmCmlMg71l83cB42cS3fIT3VXDCFA?=
 =?us-ascii?Q?7u7puB1VIVl1nLCxqiFFVSPhf9Ucii2fhATOWOQV8zbqJfM8/8fJ0JNp4tpL?=
 =?us-ascii?Q?O1fZjm/jJKENQpL4Klt0Y0EYvYfDlldvyr7KRI8I/Awwz7/KFXImi7ntvn7V?=
 =?us-ascii?Q?rq+1RNHZYmotKcU+7+pUpRpwg1EMy7yy?=
X-MS-TrafficTypeDiagnostic: PU1APC01HT052:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LvyPlxkBMXqPmb+8DvJgVxU/nXP/tlEHGHTo+8JBY0fB+9VC3OVauge8sNpSIKQ5klGeBAfOJD+S5VAdabhrta9tltPxL8s+4fnHSnZ2qhCgvGJO+DMKArjFcVOi2FhOtiCN1uVX9kzz/ZiBZnn4pZHzrQHw87HMcYBWFHBdGj2FinSIK5ZaNfkGgZyfZ1i7KItpVdg1kljK8MRnCMPhwNDCiC9ytkXH16n3n/FHYRBdD4QrsS+CpFqWtSSL7jCZDMsMF6lgjHnpu2XTTgRY2l34pnv32RanOHc67btVdWI=
X-MS-Exchange-AntiSpam-MessageData: Hn02vfpHMEHc1FTO3mg7APz9rIpwL1iY7AJXvtFcGsVF76K0M8521lTvHwnQ8MCLVZLRaTsbzzRHV5NkXb+8/ApmaEzb1EGRCElgAa6eadlI9XmFQ8XxDljhSHSJvhRuzWc3JdKByfx+osE/cdZp95q72XBLv1/2GuaQ102+kBoY8BDuW0dCCmrG/2kgAQlGpaBN3oHQhi+HQ8OUFdvkjQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:08:27.0388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 826c1b5a-7667-4080-9d82-08d8ab9ea139
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT052
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
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 33 +++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index aa69c7963e..0b665ae657 100755
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


