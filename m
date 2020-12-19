Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAE42DF12F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 20:07:41 +0100 (CET)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqhZq-0000Pd-SF
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 14:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhPL-0005h4-VQ
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:56:48 -0500
Received: from mail-oln040092255040.outbound.protection.outlook.com
 ([40.92.255.40]:42752 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhPK-000533-2M
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:56:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yn+F2nx2eYOIGzf0Us5RDvIe4If3A4jUl2PBmKqlkJLIObPHwmEdzBrbZzFhyLnL0DWS5zqVMwN5Wxi3Q3cIE+k849PrgKk2RHdWnQWzMxOLTE1ZloPwUHHDRSRF1PAWv4BUTBRi5y4oUgWtt9yiuALRJVCZn09RcVFEFTO9rRgmzHyANrBvp4s7uLOzI1S95fVrCWF3BIWvn7SfKFnBnkq3HXQ5ly6Wrtn4dCT9R8jmDnc7m2G6G19tUkXKWY0wx3LfiJZftfGZWVXVqTfk2vuYez3BRuaTyCRZNGpeFhtYOzI+txyvKMIVYVIzS7RQg6OOoTxh+VA/IbLQyfdiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbXD7nJRBh+aBV9kpgMFpgs/dVx/+dfExKu+I9kH/iQ=;
 b=i1Mw7yu9+Mi0gp/LO0hHvr05BVY4PTCpZja9u8Ynl/EETGaxOXLQDdGAq1ml48aRaSBpZXGQDkoF9fLBd+ojcSHRd45s9+KPxtrywzyJUpRQg1c5XiX4eNed9f0LczcJER7bqnkrjKEyD+SVvptQqqXpWLSV021g9PCDfbUlBl77OcsI+cuPvCFBUdqjcC0jAf98J3Osfl1y6sAx4LiCwBChpmuKNY2/DAk7Vf+madbVdFTJCN8ObQjdl/EvvsRDv1WIUiW/Nop9EluNHk1hzGi08Hoo3R8Dvd+Dx/Bgi5IrnqQklqabZSKa+wkh81CZSn8CPUvPwCAebdckVim4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbXD7nJRBh+aBV9kpgMFpgs/dVx/+dfExKu+I9kH/iQ=;
 b=fBIToY3qk0ioIlYftUHIB2iao6f+aOfOB0+pLFPt/eCVwKwbO8tCydaQIHMbp1m6sv5fO2F8YrNr3MJF2l/gQy3VBagb5lQ6x07AmVfo6Q18FYJOngBsBwQxiiBNMo/lOxN1xkwKNnSShiApHF7FTmnzNpb2HKxXZOnQmnocFyAACD2rR3/0t++iyZM5sFTZVeBryGSRx/UWcd7HfvaMqhCvd0g7zdMiCBwNqX2JvnZ8keCnL0fPhUY8G2tCAItSdbIR3NsnAsKPWhsAHlsAI0guQANElRASIcsDuidd76FsyX4QHhQxHqYmzgOn7HuD7HCyp9LNTc1/ocIf2ysqEQ==
Received: from SG2APC01FT053.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4d) by
 SG2APC01HT057.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::294)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Sat, 19 Dec
 2020 18:56:38 +0000
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM (10.152.250.58) by
 SG2APC01FT053.mail.protection.outlook.com (10.152.250.240) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Sat, 19 Dec 2020 18:56:38 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:0D5F90FD6C5CD639638846DDDC41779085427FE59809E71B2CBA565801537764;
 UpperCasedChecksum:333E3C4EBAF4ED471C97CB45951C3FD76D26155192F6A20CAB84F8D580B8D0A8;
 SizeAsReceived:7654; Count:47
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7]) by ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7%5]) with mapi id 15.20.3676.025; Sat, 19 Dec 2020
 18:56:38 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] fuzz: split QTest writes from the rightmost byte
Date: Sun, 20 Dec 2020 02:56:25 +0800
Message-ID: <ME3P282MB1492172012FA8E0D08819C07FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [W5anXRpZJMIKpmSCzQjlq1T+Ic4pQD3T+mpaAdy6mYqEW5fIyRfA2rI8TOzF+XcD]
X-ClientProxiedBy: HK2PR0401CA0018.apcprd04.prod.outlook.com
 (2603:1096:202:2::28) To ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:a0::14)
X-Microsoft-Original-Message-ID: <20201219185627.426615-2-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:1079:e2bc:42d3:a57e) by
 HK2PR0401CA0018.apcprd04.prod.outlook.com (2603:1096:202:2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend
 Transport; Sat, 19 Dec 2020 18:56:37 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 17bb6789-c32f-45c5-553c-08d8a44fd0d2
X-MS-TrafficTypeDiagnostic: SG2APC01HT057:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0F1JJfSWK5c1iDnVGlQKQZBm1rPcWxBdOLJ/pd63R5bk+qjU4wIlz+1OeE1QDIi7sd9ekMbXw7J3Jei9NbWGKJxvrxCZAcCNQSDCEdjulU+Jxqd/Ue+vhv2OzZ3LUCteePQKR4JCHWeS5yG+XLbFK2ci4qrWx/hh+BqlmJAiujnMOxh89HNXgkZwJT7HNCgHe8RINElNl038K0cKKggZfw2OpBPlaqIEUv5tPGjnnIRXRXqWZDIALBkW0VeY497
X-MS-Exchange-AntiSpam-MessageData: vlOGbmYwc74bqhzBZfF1i+bgg/75Kb2f3B+V2mds9X3k0a02t7Lg0iZcfKTrRUweFJ/xm59ia27vtk9nAWLhK//h7GXLnE6wtHLdMOis1WoGiXa+1WfoT8Djf0J51AMwSkpyg2TYtgEtYWwq4xUzuGtBVDjf4ZeeO33D4+G7gVAxbnONAX/xcPSr003x9K9oe97m8a/uNsbBPEMkRjHs4g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2020 18:56:38.4537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bb6789-c32f-45c5-553c-08d8a44fd0d2
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT057
Received-SPF: pass client-ip=40.92.255.40; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we split the write commands' data from the middle. If it does not
work, try to move the pivot "left" and retry until there is no space left.
But, this is complete for ram writes but not for IO writes.

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

Therefore, we should split QTest writes from the rightmost byte.

Tested with Bug 1908062. Refined vs. Original result:

outl 0xcf8 0x8000081c            outl 0xcf8 0x8000081c
outb 0xcfc 0xc3                  outb 0xcfc 0xc3
outl 0xcf8 0x8000082f            outl 0xcf8 0x8000082f
outl 0xcf8 0x80000804            outl 0xcf8 0x80000804
outl 0xcfc 0x9b2765be            outl 0xcfc 0x9b2765be
write 0xc300001024 0x2 0x0055    write 0xc300001024 0x2 0x0055
write 0xc300001028 0x1 0x5a      write 0xc300001028 0x1 0x5a
write 0xc30000101c 0x1 0x01      write 0xc30000101c 0x1 0x01
writel 0xc30000100c 0x2a6f6c63   writel 0xc30000100c 0x2a6f6c63
write 0xc300001018 0x1 0xa4  <-- write 0xc300001016 0x3 0xa4a4a4
write 0x5c 0x1 0x19              write 0x5c 0x1 0x19
write 0xc300003002 0x1 0x8a      write 0xc300003002 0x1 0x8a

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index d3b09e6567..855c3bcb54 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -140,7 +140,7 @@ def minimize_trace(inpath, outpath):
 
         # 3.) If it is a qtest write command: write addr len data, try to split
         # it into two separate write commands. If splitting the write down the
-        # middle does not work, try to move the pivot "left" and retry, until
+        # rightmost does not work, try to move the pivot "left" and retry, until
         # there is no space left. The idea is to prune unneccessary bytes from
         # long writes, while accommodating arbitrary MemoryRegion access sizes
         # and alignments.
@@ -149,7 +149,7 @@ def minimize_trace(inpath, outpath):
             length = int(newtrace[i].split()[2], 16)
             data = newtrace[i].split()[3][2:]
             if length > 1:
-                leftlength = int(length/2)
+                leftlength = length - 1
                 rightlength = length - leftlength
                 newtrace.insert(i+1, "")
                 while leftlength > 0:
-- 
2.25.1


