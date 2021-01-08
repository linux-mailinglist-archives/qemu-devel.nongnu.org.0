Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5D2EEBCA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 04:17:17 +0100 (CET)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxiH6-0005nC-Ru
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 22:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiF3-0004e3-EC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:15:09 -0500
Received: from mail-oln040092255104.outbound.protection.outlook.com
 ([40.92.255.104]:27326 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiF0-0005ad-4s
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:15:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwHCBk/F4DJ4AScarpxO97f+bwPjGTRm1PkOj4N7fN/IEajoSGXOzpYRweVmaaIfuYrvpB54USRbqcdOybkNznHtyaEaViYrvMmmDW1Ec/vsCjHHnEDgscqbR/dudyxfy9og7C3oplaJKDXkCD1GzVRK7FYvNXVafinEPeywVTI/IajZ9En5cTxxXOKQW738Aw8zvPClOAWI9lU3NcKjwRdKVNj0FottMzt6L7wLyW02rha6WcsAuicfv04UCmCxkGjXY0Jcy/JRMSUe0bv36LsRG72agIB3k2ohxUiz4keSZbezxsoL+YgZZyrXRV5v7h4cr6hjlrPiCDmTcXdeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm32ZIxo3Md+p/XmYTEHUfPEhQxhGyPJf00dkeAsuFA=;
 b=TqqKiCAGt45BVdz9L1VLr+ZBDJVcoehOJaR7OaSwBSCBNl+ZYEX+1fuoFXLBVj6maVRtXwntSEOKcgNHUirqX8bRRyNA1CCqUSS5K6KITykQeRlV6j8zCr6hN3jVZ4U1i+FSW59eX2DwvGcGjO2gsQftYRTZgzQXfFJr0/PiuFpU94SUu0wkJoC6X6OsLzt4TSCBL3BRTf1vAl6d3VM+FBiDa56lYvSanP+npLJXt47qKB4MvAA08q9nRYJKDikiREpBEk3M00hPcQxUGXa2LWJI4hvUAGefn7IgzkBmFW00oqFzxxLahYyfg9ELXYXibXDlqTQluBFbNjBmuPjqLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm32ZIxo3Md+p/XmYTEHUfPEhQxhGyPJf00dkeAsuFA=;
 b=cnZM9XyX4wctIdw7rFxH/oHHJg5ejEtI4Rtl9VQtV08aD6vctYbez+pbbqKqN2SL//5Aiim3qbXd5jHyEXL/HM+ZbTWlW5yZ/5CBWQnSLerZp4hz5XvSKXrv1kVQz6TBWvQSL2yhXoNXGr60AQS+mEKpNUyArC0khut2mQ82Q00h6KlMAywcMQLsnMOGxctG0lrn9TJzTZpLB6YUZu8ihP1xLFX6I/6HWe+B7s9dMtgGXykstfSMZxeDtknJMkKZ6SE92aueys1tyilpCNKVJmSchpPy00A4GiEksSqpu3LEie9ZnGYn0eNEBaT9vD1IY0RaICK9SSxrJySugjOkfA==
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::50) by
 PU1APC01HT239.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::504)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 03:14:57 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.252.54) by
 PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:14:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DA4676385A3D5A9F15921165F7B9728008898490A271880F642672B41ED151C3;
 UpperCasedChecksum:77AE426DC03FD9DEC47536E0D8838A96B0F3A13BEAD11B6AD7040A10AFF52EC4;
 SizeAsReceived:7687; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 03:14:56 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v5 3/7] fuzz: split write operand using binary approach
Date: Fri,  8 Jan 2021 11:12:45 +0800
Message-ID: <MEAPR01MB3494663BABF068E8C49B9AF6FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [3gnl5EcxLaGUkN/iJme6vt9ZiiksYgJx1pu75nNPML2lff+AZYlQN8rYnJW/4lLD]
X-ClientProxiedBy: HK2PR0401CA0003.apcprd04.prod.outlook.com
 (2603:1096:202:2::13) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108031249.68381-3-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:40a3:2fc0:cdf4:4729) by
 HK2PR0401CA0003.apcprd04.prod.outlook.com (2603:1096:202:2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 03:14:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3d6c2082-94fc-4e48-0ecd-08d8b383937c
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNUOze3FI6XN1n/uGT+rrP37sEW9rR8NKYbxLm7UV8ZYXMhUgm8dDCHR6GrHxHdox/J4rb1pg3hyoZ0Et/isajaBVZ6ZBITcQj7Hg0wKeM6ieh53mZ2iJwJXpEYZNLpBKMAg7CUwIL8C47A907DC+oP1C1AkceplCtbO9TdI0vd46CstI4ReKh9Uilspv6zW7rg4md8m35YPkk5VRjfAkNEUZtPuY3/+lIQuH/Epz8+ar2xg6tH/hMI8Wl+tLENjefNoRRRzw6cH5IQA7k9YGsqJ90fXf4PW7ZNRGVXPtU+f/Rv5GHUm4Umm3QC55a3iNJDkf2sx7vuablRF+ttyI3V0vZL/zOzFjqu+ttRtNyRlcH0v7uEKNbWpN89waAns4dnqFITnFtx5VMShte9pM8eCktfsTM9Iikw5NMqjoKeP20diwN0F/sTMm1YIkxo/0N+mtqxUHbMjqRCFYyCqnf2yk9Ym3rnG9SX7M9yN0yDyCpFqk/3WF2/BDB4QXtSfnE5sWm6qyOpbEzGKH3TMGuuXDfgAPCvOyulH232khbR59bbxMP5p1bP+W4rioZ73RU8hYkrYwv7N7zWnQZtdfFMQekcplJzqSeNrNoCQtGX2nzU6fTSXLLvkCJJ3AlqZFbYJ6IjFrjRajECNBDD+KRRuc57B41KBdqlSo6GqkCiy3jqMPTZ5+/hmwnidWn0i30q3Rqkw6Ygn2+Z6UPjBIEspJh4ZIOkJ2Cs=
X-MS-TrafficTypeDiagnostic: PU1APC01HT239:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UyKe0N9ZOcM3Xg4UUl3dvTmFo4b8bVdgWqFzc1ZjvRS9JNDTt4o5XzSznN8t5VtH2IJ0IZ1KDIqOmknco5fn8ATzeuR7N194sL/e7zv517GYkWv/FU6oyGVNjtxP/LBlRIfmGIow+BKJ3OgfEQS7tcqo2oZKVDbDShHRmqGC8NqBXFtFfIv1U3C2L5awOuzSaoXZSqHggWf0hX1bND59iM23J2NkBhrUCcdOqazVNzbsh6WHof3sExmQRq+waoTM
X-MS-Exchange-AntiSpam-MessageData: hiH71sjfUqMaEQNI5OZJjU9+5Gqeh2klabr47+ugUdLA7axphK//tbDv7qrYVHRGgtkUHORjd2nTVJyopv0NorpBmXylsfxt/B7+8tfEvas40qguIDb+JMgLxa7DYeLWZqTGxcHAU8mw9Yme1NjsBqlB4e6f2acknFIt+48yGOqVJiqg6hT76Y1KbuJGSO5q6Yq6OYN6fHnzeUCwaSZ6og==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 03:14:56.8174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6c2082-94fc-4e48-0ecd-08d8b383937c
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT239
Received-SPF: pass client-ip=40.92.255.104; envelope-from=Qiuhao.Li@outlook.com;
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
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 29 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index cfe8f7854c..5cf39f4e6e 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -94,7 +94,7 @@ def minimize_trace(inpath, outpath):
         prior = newtrace[i:i+remove_step]
         for j in range(i, i+remove_step):
             newtrace[j] = ""
-        print("Removing {lines} ...".format(lines=prior))
+        print("Removing {lines} ...\n".format(lines=prior))
         if check_if_trace_crashes(newtrace, outpath):
             i += remove_step
             # Double the number of lines to remove for next round
@@ -107,9 +107,11 @@ def minimize_trace(inpath, outpath):
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
@@ -130,11 +132,15 @@ def minimize_trace(inpath, outpath):
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
@@ -143,6 +149,7 @@ def minimize_trace(inpath, outpath):
                 leftlength = int(length/2)
                 rightlength = length - leftlength
                 newtrace.insert(i+1, "")
+                power = 1
                 while leftlength > 0:
                     newtrace[i] = "write {addr} {size} 0x{data}\n".format(
                             addr=hex(addr),
@@ -154,9 +161,13 @@ def minimize_trace(inpath, outpath):
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


