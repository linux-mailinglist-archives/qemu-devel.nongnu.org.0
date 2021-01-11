Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10012F0CCA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:19:00 +0100 (CET)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyqXb-0006MK-Vd
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqU7-0005Dv-TT
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:15:28 -0500
Received: from mail-oln040092255055.outbound.protection.outlook.com
 ([40.92.255.55]:20704 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqU4-0004Fx-Hm
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:15:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvAGfU5Bgp8OG+5Uzor/hCm4dEazo777qtYoZRae4zewEVEfQ1Xde5Orz4FnDMWS1oSYBokYqYl+17B1tfJ1PsEA5XqsGaFOIe/TzyiCmXI+xfaEHKd7lZRQlD5OncZWfDB5TqlcEymLR1q0ciqYZ0GXDo/kyrSSH8wzRvtboG6bol2fBF6ZRsHqBymhrntMzTaKqVi/6OMPUCU578cqjZx3rbZk7B8ebJ5QiKeJu4MANrvTUh1k6c3+E3/U3nVvVDf0+1bf2dFNgAyEu4P5vuER3s+sO01G78aOqKVz77xe0P5Zs7xYXVUeKPIurbr9Ph+Pm+sHLDRc9MYYcnMxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69VvBKSI6Qqwnihmzlhyqr0ckajgMlwEgGgSwuzTTGQ=;
 b=fSqQybAKzyzCjSP2fJJA+Iei2Nw0YQw4Rh0sw7AuojNVPviyneAoh36OgybV/ikXF0RGoOMzxvPVrmJDM9J6w0gY7kc3z/g5TcCp8fE6Xiud0C4E+J+uwy5dTMIk5j0zMNB4RFG67E0cuJopIeJ2vSwxna+FOvCivF/veMCpZZCebVRBVzkKbyxrpVWwjwSlFSDJweLdyaIQBOlgwnhg3TKnhZfUH9wSJroGrHAXGGyGzFZFwmw0+Xc4CgRVEyvU5ETl79+A+kSZn2pGqAnefYw5I/WQjidWSuX1q9iKlo97eECZwGIHXZ9bjDcXQA9rW4wbsBrz9iQVhyTAij+Y8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69VvBKSI6Qqwnihmzlhyqr0ckajgMlwEgGgSwuzTTGQ=;
 b=sG0G6KJGMy9/6LCv4ffQYW1XtPsskH2kVfYaRkOAcUn6WGUXudhRg2mqkwdZCeJpEOdjdjnsIpRzIbe59gRykV6BasCCXb/b5YYzSml9LR7WaIPNPN7LTUzCq5V9xA94UDcWmiNj7khxbkX93ZdwkLJdpRo+qHxhBTHG9CCgh3sMn5I7jtEZNkMFbLW7tccdeUlTT4fGPMLWJxGQUkSnHYVSV567V8OLJPcKOwl5Sm2vvw9tPAYTDyL4wBRDHNDti3IG7EiScsUZbQx0gqKtBUYrMoNkkq9wqce/KB154OJTejD9weXmF618YRZ29hOu56txDDSdhCjsmj/mccSvUw==
Received: from HK2APC01FT054.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::48) by
 HK2APC01HT180.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::467)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:15:12 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com (10.152.248.59) by
 HK2APC01FT054.mail.protection.outlook.com (10.152.249.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:15:11 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C65FAD93FB17E6C7A63A55E2151FB6609623A29315651B40F3BA729B50D13269;
 UpperCasedChecksum:B1B5DB160F9F68979D7E4E40F8B3D7DB15D5B247F20FC6A5B3D4CAD01328D1DC;
 SizeAsReceived:7585; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:15:11 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 3/7] fuzz: split write operand using binary approach
Date: Mon, 11 Jan 2021 14:11:48 +0800
Message-ID: <SYCPR01MB3502D26F1BEB680CBBC169E5FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [vgaaAggLYURjz8phGbTt6jqBFEQCzoQ3]
X-ClientProxiedBy: HK2PR02CA0143.apcprd02.prod.outlook.com
 (2603:1096:202:16::27) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210111061152.176206-3-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0143.apcprd02.prod.outlook.com (2603:1096:202:16::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:15:10 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e940858c-3e0e-4b7d-a626-08d8b5f840c0
X-MS-Exchange-SLBlob-MailProps: q+fD6XS3/ULYlaWyz2NXCmXZW2G0IxobxkE1bq7b2w8xQJoMNIFGLfAF1pL1PUdz91g3o+6CvoJ/8B55b1Wts5HOhOA2jMxlH6zrzGekkURn0amdvhctuWNY16z8RfUqI3heQsxsBtCmP9d9S2l1PQgSzG1JBEvlxbQoZ0AQTUINN/SO9zW20SVu65LXn2p4Qi6bSj4eEPx40JiaDXSsyLlpSJmqIKmgS2uUrfh6UJdm0LOU5EOSUPm8OYlw6WD+Cc3qQIV5CSokLj8K+c4qYupa4mm66NzCoJihZ6rAx5rRsyWF0BXwkOC3rnhLy2WlkTN/y0IyGUxxsAf/T9nYKSQtnb4gIFwZn6qjIe3TkXf4nNIIr2IFHqBnKdBIkFT7aCquTkaPFwkoE0MX0wqZ5as8G6HpjA0zCbIEMCOFncpy0W2j3EHlKFxrevH2mA5AkZZfIwgGBT+B2iLWwTLXAoyV5/dcg6Hc4Xzl6sHyRgMhBCerVr/okYGZL/XLb/KIuTHT+X2RUm1WkPQYcjrez4UHfLTlQQOkdW97rQqdRFeZePZ/JGJx88o/72QYmJ983k/7xO2hZ77bDVcWmHQ3Tn+LvJ89UGhM25jJzIuMyKZj7rO0cL23y6B1pLokpbrDA58cKZ43shAdwCTYRXU01apARDyk5w47BJDxDPkwmNRP1MmFERb6XXJUZyGcOr6PMRtEqosizDUnAlZ+eSdkHQ==
X-MS-TrafficTypeDiagnostic: HK2APC01HT180:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WzqZyfm7FaVfqGFsnE4T3vrrBDHtoE7mitwoIplopN5Y3puTf0HjY2Mgl7kfS1CXlsTQrGZcUqOg2KK4pLAY2egkwEL3EXj7IRus+c63DQYXw9RDb20mletALIyRjj8avpr2IUHtAhx7fA8ySz8qW9neNWTgD80dfentKjpcqSu2WbIzNh9Rtmme9PwcI8F1uwNdZVojsIX82Xgeshc8gopplwldGcXaIiS7YZ1dGWK2UcCQf44HP2vlTPSAtppq
X-MS-Exchange-AntiSpam-MessageData: pGNfeiBa7KCtznHFd8J27pomZKY0WhEMs9LUMRerVUmYG4/4mvBaWNGlvyv+4L5kXUJvWLmod9f1xlNlLb92Ym+VR3mqE2ZNoru+sv6KrUz/GFPI86MT6OqLMDruUkzVNgsutgXGcwKzghml1RCUSQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 06:15:11.5329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: e940858c-3e0e-4b7d-a626-08d8b5f840c0
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT180
Received-SPF: pass client-ip=40.92.255.55; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
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
Cc: thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
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
index cacabf2638..af9767f7e4 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -97,7 +97,7 @@ def minimize_trace(inpath, outpath):
         prior = newtrace[i:i+remove_step]
         for j in range(i, i+remove_step):
             newtrace[j] = ""
-        print("Removing {lines} ...".format(lines=prior))
+        print("Removing {lines} ...\n".format(lines=prior))
         if check_if_trace_crashes(newtrace, outpath):
             i += remove_step
             # Double the number of lines to remove for next round
@@ -110,9 +110,11 @@ def minimize_trace(inpath, outpath):
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
@@ -133,11 +135,15 @@ def minimize_trace(inpath, outpath):
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
@@ -146,6 +152,7 @@ def minimize_trace(inpath, outpath):
                 leftlength = int(length/2)
                 rightlength = length - leftlength
                 newtrace.insert(i+1, "")
+                power = 1
                 while leftlength > 0:
                     newtrace[i] = "write {addr} {size} 0x{data}\n".format(
                             addr=hex(addr),
@@ -157,9 +164,13 @@ def minimize_trace(inpath, outpath):
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


