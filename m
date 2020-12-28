Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9032E346B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 07:01:58 +0100 (CET)
Received: from localhost ([::1]:37514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktlbR-0005pa-8H
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 01:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXJ-0002JH-Qt
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:41 -0500
Received: from mail-oln040092253015.outbound.protection.outlook.com
 ([40.92.253.15]:53207 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXE-0001Xw-0Q
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgpFR3Sf1ei9lwxMdcxy0/eylLGeNyivKswS9tZbwA6g2DEJjqzKfAI4WyYbmYHpSMh62LYMkyCQ8dmI0EnXVFNfg0frhOjLtInbnqDQUt5ljTYnSZXVULVpHqtdabe+0OHZ2uP/p3VPTxDH1XdTbjoh1ay/zo98LcG9fCzLmudlPE7Lu+TIOdnupiubUjk0k83DeRGRKui/z8tcQKoxbgPLNK3P8Qd26mvUivEj3PY+Qa+e9EH74uiC+/eivEUFqjWc2D1Q8ztvHDW6sclrOPc3WwXthBI3E/d+wxZua4HlMUGTLczDQuHOIVY+KKZRm32THyGEzliFAipRVFC7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6Uoex6Bcow+egTwG4xV6wycu4ec4nZsiO8l8ynn6No=;
 b=TLRFqpqlmBHEPmsJLjrO8Lam6QTM40N0OJZ0El9jKk8WW8DqDUFP3Cfy3Mv3Hokqfg3oNQpzrYWYP8ToYogqA22O5Ror1SKdMzPGGZKT/0QAfy2Rn5XC84/dFnH4pf0nIDDrkBOoMVI98InDoJ4eG9pylHt0ol7PMqRuhXxi7xwF8dgRhmvtlNIYJ6oiC2nYScuuRRtM78oHFFiuOPz1ThDgvZrE55CcP2VmW2IR84blXv6LpbT09mpaZQ/HbKYA+FakhemEqobAlCZxOJy9wtP1Xmgt+SiGjAo33rnZxr8IV7kW1/br/M6ykdD9w1UqitHoJ4pmoVDpFXt9wQIMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6Uoex6Bcow+egTwG4xV6wycu4ec4nZsiO8l8ynn6No=;
 b=Yma2KHCKT4WNT3H7HqX1aoPmrBunq92JaBkd/kPnIy7bF0NEFpOkDEN8SEp3lUtr6frw9d6KNGtadGlksiuud9vzGN+fY7ywmBJHIZ7L5YoyhlbTNokmuuf9C52WoEO+ZLdFxYiWexkNzUcT+ZrHG/pwqSUbGGY38ulDhObrjdxQKRB8FQgMIJEcg7sTxg02fdeju3BjYsWY2lkrd1wmX0j8fuFCFWi4MvQ90Rpv5p2ftUNT9WCTvc5jWSYvu3rnjAqH6qLoaYx8ajMup0rSiXIbPnTCrARuvrXgzPlVWRm6vsk2HN9dJF0q6RVC/VjFpZneZmk0il28zxD+kjJJ7A==
Received: from SG2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::48) by
 SG2APC01HT178.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::397)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 05:57:24 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::48)
 by SG2APC01FT037.mail.protection.outlook.com
 (2a01:111:e400:7ebd::367) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 05:57:24 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2A178126F2552A1BD6C29AAAD3B075BD698D5C30690016E88943A7F7BE893DFF;
 UpperCasedChecksum:41EB4CDFF177B12D7DDB454F9043F4024B98EACDE41857639E9AC45DCDAF5D75;
 SizeAsReceived:7677; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 05:57:23 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] fuzz: double the IOs to remove for every loop
Date: Mon, 28 Dec 2020 13:56:41 +0800
Message-ID: <ME3P282MB17451BBF43D35A0E67F10C98FCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [kdvaz1c35+0B/RjEAc9jA3F5Yxi1gthVEEDONDjWGwVlDvr/ZxlRwT0/x3V6uGWV]
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201228055645.3666065-2-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:2110:d78f:cec3:aac7) by
 HKAPR04CA0006.apcprd04.prod.outlook.com (2603:1096:203:d0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 05:57:22 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f5cc260a-5ad2-4e12-f065-08d8aaf5726c
X-MS-Exchange-SLBlob-MailProps: pt8ZUcDWjMXJ9A9ttpcs4oXvu424G+c84rcNKPtQbKBjAUO0G33MY4V+3fze0hZJ1E6tTsToQ7ZWbDLON/y6K8tz57YQVS74YBJYNsWtD/twBIkynFbh3Tejx8fTZnQL9hkjs4mpjyUaxpzrmsAuHeZinF2VrDp28XGe/BKyDXrY9HQP+RH5pryPljVp6YRAvbZs2ynlA7CtUHsKFDwka6U2/YHdHAVQO62lWCiEDIRdlAOVVXqGdyU9ZXCyxAzLfxKUrXovsRGInhrrrDXngvMlm5b3kmZZ0HxoJPDNIeQHIUugdPMkC1IOAmzzzRjCXA8cXGJrZHKTMcX5bTPYxk9xqZVyUY895lcBAg5qv2wWygnaI/4ptsTXExJAVuUeF0PpwkRZy3wru0PR/5jm4aQNKZbANUA9CXrqYerlQUiYWko7qbxxB9qH8eu9P6sDKrkvwxfgnTJrTnli7QJAKojmw1wyt0WQzjUDQRvoK+tx9teFOFJTog2MnCXG8PxaeM7FzHb+aSjVgqSxeSdpyWTT9IFGfqMFsacEBiXJmXD2SURCNXFGRJEcjJuKonH60e5HYv76aIKkajoPGxGqJ2CuzwLDJBIE1vKNTldni4cXRYotwJKoLjJbyo1W8Ymr/tNi96M6R4Up1QIPkekXKQsRV3RL+jnItqeYxfJtvZ8psg9NZuq0v9aAbAr6XbioUCAY77JrD/wTDu4e6e7fCdwCrMYY2Xv5Kc8+WV5Af2OspxOgzl01GcFgZPI9llRCj2bncA3iKvYl2QKpTQSuFAo7dR8oYu+LxYAQlOUfYg7gE/nonLzAKYRYYQUUba3o5e70AEzvOTPtYF0h8SAh7/gxh67pn15CORe++jMjeVklFHdavqh2P/fsYsBoeTVVCNJo0opBTVToQnGmO2J+NgvE+Ahwge2Vm5rEkHaRmfvV7+XlqP1q993gV8lzELDl
X-MS-TrafficTypeDiagnostic: SG2APC01HT178:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKiF+rgbFTdmHweBuu2C//dkRjmhOp3d46IwpATlpcFo7zwHhc5PSmkss2RxTGUazgZVzHIG72jguq+WLVLiJD47LZXVFeD84WCDRuM1lxSZvw+vLcU/9MsTSelO6Mimzbq2NOCTeomC5Xh2I++JAZLh/291Q29HZXlPoStah3GT2crFV91vxLR2UrB1EAagBtER1U273V1jmPtjXg9FzeAJPlDntyGjoD4AdMH/f1C+NVUEpy2y3R0aiMPeTXulIA/QR9aQqEluWWv85JqsViiopMhJ6lvQq4vd5i12zyM=
X-MS-Exchange-AntiSpam-MessageData: PID2cq9JMhx9O3M3PUugBrq9RvidErkhVFHwpz8zKGl/kEDStW+7QLAAf/x1Rzr7bZdANdKhKpZupLTCnDIUkI2XWBeXkI54yTwl6bmct/1fBbFTF9giq34Y7RQZ1xNK3iieqXQW4vVhvKWJlozw1I2sp4yWfXARbHQhZZADyiI/PUSFfl8ICBseH4SnhBtBOh8jRGCDpJhOCUUrQ/SDUQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 05:57:23.5450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cc260a-5ad2-4e12-f065-08d8aaf5726c
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT178
Received-SPF: pass client-ip=40.92.253.15; envelope-from=Qiuhao.Li@outlook.com;
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
index a290dc0579..71fb0cef32 100755
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


