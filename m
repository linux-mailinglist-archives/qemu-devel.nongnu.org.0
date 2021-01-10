Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520E2F0773
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:33:28 +0100 (CET)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyaqV-0005Kv-6f
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyae7-0005JM-KL
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:39 -0500
Received: from mail-hk2apc01olkn0815.outbound.protection.outlook.com
 ([2a01:111:f400:febc::815]:19200
 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyae5-0003yV-BZ
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9KrEkgkhWQFy+WQoRdvWtCpJVare/oR43BVDq3HusdZ/6gvbtnhYGV8nA6rIL6V//xOSRatfFUaRxvxrChTWe00VEWG82NYoLXPIhCG//whiuCJUxU1Z1kyYzcizosyWnqcg2TRoevsUGIR/9IkkT/rX1ulI3CurFYGFs1WWkszu3h2GfW4A0U0fUY0nFyIz7XhjH85tJVS1Gz1r1lFvAKGRl+QmE43zJ5Xo1k5IkDv0Bh/wtY+zNFV+JJ0z3gHEpQAybb3qt6UUaFVBa45HXE4Y+7i4BPU4FyBWmrQSfQD2hG4CA4UECOFX60NObyKuMgf2qFqa1UUeKFU2cPQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARgnu0gW2qtYaEL0fn7nj0CwiHsnY/V7KV5fmDEbdb8=;
 b=YL0ec9wtlUWi312BKF1BoyKhAcziv0vByhUcqVuHF+gHhFNgFb74gJRYrgVniZMe4VcWm+BpaaZCuY5FiKJOkXQScO2Z+YG3DndiHgBG6GBdsWpwA0KUPZhVP4rhn/EKM2nW5CSfSWWa25XrnLvo2wPrMWa2XnZohvhk0ADrRnk+xyIf3QCnBK5m6LATCmOT2cJLsPJW2AAws4fmiIpdPK8S45b6zAz89xzMGeGvFDypGWr8jvRbRfSyTQsz8F+RR9DsOwzOzSQojLT/xeMDanfYOr1MLyBhp6W+QLvMISyF50sVfWEzjkMRKzGpH6pEegc8VWuwX0jMscVumMIsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARgnu0gW2qtYaEL0fn7nj0CwiHsnY/V7KV5fmDEbdb8=;
 b=mUh5AXN55j5M4mcQ+c10nFWNPq6fR/r3Y5migmmAmanMYO/j7mM3EYAFMdEIEmBZHsx56DUpNZAw+n5+O/x4kuBYeqcGwXDV8mRpNyzg0WqjtbHtSQzmvLqWUE/UavR0SWf4NwE/MrozRmvytyS7haXxsdgEsgcp9La6CN9U8/H2kSNwQhcl7A1GD1vyq9ojT5QNP4qR6UeYn8mf0nLGyiDDZ36lD+pgNqyNhRJP5Axz/R8HWSBsw3tsZX1pSDvK98cRLAIfYskxe6udBQilXj72p8pA4+mXWmuRbE6N2V8OZmfB7oZsn2iSA7FPFfTFrjRgUCA55W9WBZor8FBHaQ==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4b) by
 HK2APC01HT169.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::236)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:20:18 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:20:17 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2DECC59FFBFA58AF5B7546919E066092F38921EAB7CDC2FB0E6B974685087C51;
 UpperCasedChecksum:7A981745749DE3118E33A991E5F40E8F18BA05CFF2348EA560FD34545B650A4A;
 SizeAsReceived:7584; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:20:17 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v7 3/7] fuzz: split write operand using binary approach
Date: Sun, 10 Jan 2021 21:19:33 +0800
Message-ID: <SYCPR01MB3502DD5999E46269A00C4276FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [BMKMREuUyEsTwTS70U2W/iqFuur2s7Bd]
X-ClientProxiedBy: HK2PR04CA0061.apcprd04.prod.outlook.com
 (2603:1096:202:14::29) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210110131937.98351-3-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR04CA0061.apcprd04.prod.outlook.com (2603:1096:202:14::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sun, 10 Jan 2021 13:20:17 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bd4a8bc7-2dd7-4048-cadd-08d8b56a7941
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNWt8qMG3IjM1nlahHjQ+yeyZi0K9+WSlJp1Kmxz/ypV8F5I3pAbvBgO3bcOQMaN1VjHNdD8OWD8supT+3iOD+PouKBaY9kcxUcGa/ZmCBOATTsA5NjErpYLkCRTxG8WVV2Cm7ENzoGD239FJ0tsSQmvkeH792eDFiPfBjnkeZErNAQ9YPFjtmwt9UTZqMR5SwMAXK7HFqh+pB4mBRWOTqB3pvZoxBRBbXEGZ5/+MrpZzEPAqFw0B0voWe8I6UYcgYLLMz5n3JBCaertWHcNTqt5EFmvxIdgtOXtsXhrcAyoJUBREwkmMM2PYDRe0YVaYJP3z3B+xGOzby7JwiHOn5oezP+cKVBi6OS0+oMKh6aQSdH5Sd9GzCF9S/woZjvq4EmYg3bQWClYs5Lyf4REkSCqMFBj6MWTh0B/eoLt1khgCC73kroe09jPQByQ6tVZemBOn5N9LHI5Ue08zglyjfO2VwmXM19Npc87sx0R2Lp+0228C20iJHMCfgJxBuPPxCLxgRDcNCq1rxtJaQU2Ojp8Rn/VWzWAB2cm/Bh4qZlmRS/suJThjYg2wXEIOXl95jMkHJSakXUiuhsKtiY01aNOVu2ekiC9NazTDSIHQBaij1zJ1szH/EneI6+xxYFjb7rKPYTtkwCo87NTWzFJtC8aOTVfPJxwb6K0Rv1XntP7BCdmFW46EKIyBc/zt1EZ+s8dYh9zYyfPoI94l2oj21tOFgW7Chry8QE=
X-MS-TrafficTypeDiagnostic: HK2APC01HT169:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4LdL1k38wyGTyMT4a2fX4Xi3RNlOu2f/w5FS2m73mTFyqpgaWSfoMz9N504o6l/MEbGE2fLJJuIkREYuwYzKcHxxEqcWoVMot+EkX/TA/wZBMng8qLUH0hhmrv2qb0VGCM1yVdG33d9CU68xXF7UrFBY6NYoCCtIyQm38snoz2KXtD3Bhj7j+GzXcpmUo05/8stMiZqqcR7JVYjFKACnynwNdVbQK1SyWW3q6RgibhgYqGdavz3ORz63+rDHOqP
X-MS-Exchange-AntiSpam-MessageData: Te+OdJL4R2W2T8k2D8ZTux73OHvhkVpInyimKLS4FhM3ZGbl27Rv9Tc+mXYcKQDTI9LhHOBfR+s96k4cB/nIrYHwtbUJX61UQKQCcTanYPWn/7HA1jdgQrWa+59FZU/2IhEY6WJfnwGuyV2dT0KWQA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:20:17.7711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4a8bc7-2dd7-4048-cadd-08d8b56a7941
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT169
Received-SPF: pass client-ip=2a01:111:f400:febc::815;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

Currently, we split the write commands' data from the middle. If it does not
work, try to move the pivot left by one byte and retry until there is no
space.

But, this method has two flaws:

1. It may fail to trim all unnecessary bytes on the right side.

For example, there is an IO write command:

  write addr uuxxxxuu

u is the unnecessary byte for the crash. Unlike ram write commands, in most
case, a split IO write won't trigger the same crash, So if we split from the
middle, we will get:

  write addr uu (will be removed in next round)
  write addr xxxxuu

For xxxxuu, since split it from the middle and retry to the leftmost byte
won't get the same crash, we will be stopped from removing the last two
bytes.

2. The algorithm complexity is O(n) since we move the pivot byte by byte.

To solve the first issue, we can try a symmetrical position on the right if
we fail on the left. As for the second issue, instead moving by one byte, we
can approach the boundary exponentially, achieving O(log(n)).

Give an example:

                   xxxxuu len=6
                        +
                        |
                        +
                 xxx,xuu 6/2=3 fail
                        +
         +--------------+-------------+
         |                            |
         +                            +
  xx,xxuu 6/2^2=1 fail         xxxxu,u 6-1=5 success
                                 +   +
         +------------------+----+   |
         |                  |        +-------------+ u removed
         +                  +
   xx,xxu 5/2=2 fail  xxxx,u 6-2=4 success
                           +
                           |
                           +-----------+ u removed

In some rare cases, this algorithm will fail to trim all unnecessary bytes:

  xxxxxxxxxuxxxxxx
  xxxxxxxx-xuxxxxxx Fail
  xxxx-xxxxxuxxxxxx Fail
  xxxxxxxxxuxx-xxxx Fail
  ...

I think the trade-off is worth it.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 29 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 3c11db4b8a..319f4c02d0 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -98,7 +98,7 @@ def minimize_trace(inpath, outpath):
         prior = newtrace[i:i+remove_step]
         for j in range(i, i+remove_step):
             newtrace[j] = ""
-        print("Removing {lines} ...".format(lines=prior))
+        print("Removing {lines} ...\n".format(lines=prior))
         if check_if_trace_crashes(newtrace, outpath):
             i += remove_step
             # Double the number of lines to remove for next round
@@ -111,9 +111,11 @@ def minimize_trace(inpath, outpath):
             remove_step = 1
             continue
         newtrace[i] = prior[0] # remove_step = 1
+
         # 2.) Try to replace write{bwlq} commands with a write addr, len
         # command. Since this can require swapping endianness, try both LE and
         # BE options. We do this, so we can "trim" the writes in (3)
+
         if (newtrace[i].startswith("write") and not
             newtrace[i].startswith("write ")):
             suffix = newtrace[i].split()[0][-1]
@@ -134,11 +136,15 @@ def minimize_trace(inpath, outpath):
                 newtrace[i] = prior[0]
 
         # 3.) If it is a qtest write command: write addr len data, try to split
-        # it into two separate write commands. If splitting the write down the
-        # middle does not work, try to move the pivot "left" and retry, until
-        # there is no space left. The idea is to prune unneccessary bytes from
-        # long writes, while accommodating arbitrary MemoryRegion access sizes
-        # and alignments.
+        # it into two separate write commands. If splitting the data operand
+        # from length/2^n bytes to the left does not work, try to move the pivot
+        # to the right side, then add one to n, until length/2^n == 0. The idea
+        # is to prune unneccessary bytes from long writes, while accommodating
+        # arbitrary MemoryRegion access sizes and alignments.
+
+        # This algorithm will fail under some rare situations.
+        # e.g., xxxxxxxxxuxxxxxx (u is the unnecessary byte)
+
         if newtrace[i].startswith("write "):
             addr = int(newtrace[i].split()[1], 16)
             length = int(newtrace[i].split()[2], 16)
@@ -147,6 +153,7 @@ def minimize_trace(inpath, outpath):
                 leftlength = int(length/2)
                 rightlength = length - leftlength
                 newtrace.insert(i+1, "")
+                power = 1
                 while leftlength > 0:
                     newtrace[i] = "write {addr} {size} 0x{data}\n".format(
                             addr=hex(addr),
@@ -158,9 +165,13 @@ def minimize_trace(inpath, outpath):
                             data=data[leftlength*2:])
                     if check_if_trace_crashes(newtrace, outpath):
                         break
-                    else:
-                        leftlength -= 1
-                        rightlength += 1
+                    # move the pivot to right side
+                    if leftlength < rightlength:
+                        rightlength, leftlength = leftlength, rightlength
+                        continue
+                    power += 1
+                    leftlength = int(length/pow(2, power))
+                    rightlength = length - leftlength
                 if check_if_trace_crashes(newtrace, outpath):
                     i -= 1
                 else:
-- 
2.25.1


