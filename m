Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62C2E346C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 07:03:24 +0100 (CET)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktlcp-0006uw-UA
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 01:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXT-0002e2-TK
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:51 -0500
Received: from mail-oln040092255073.outbound.protection.outlook.com
 ([40.92.255.73]:36821 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXS-0001fZ-6K
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNqbFvhU8bUEPIE3iG2zuHheBghk3znrRv9tzrjtd0XAyh7yXfxnp6PEsLmbPFwBtbJfCTgX7Jvv0Mlaluy/l9iKXh0jhIf2VPyfgXiylbICoSt64EQZ93QCpIs92xtEBW2B/AMVoAb3J2nbJaP7mg+VVSzeMQWaDr7UW3xmoHkezVQ1kpZce0hMVcbsIaEjdhp4GFT3V4GvmRwwDKLGvFEWB/KeNhXwjnR6xM8+z49HE+u63zWbehdEh0pOa8VPXxuDrlDh8fTD5wPfiKf1gDvM6yeAa9SgONQ42QAM3NNkMQaYmS+uoZIzDiSt3bkOTDz8TdQDLOp20e4BfyFpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byPI9q5zlkVC/ORLJZtFm4v6f/afHVUuizUxYRF/yYo=;
 b=YEOkRR8lWNiFeqYG0sb8UMKhPHHbix480RXIG2pkXuQ8TWV50UxbIqIFY6b7WuBtn9fBpCIVXvhK9+wjvxWl0wjlI3fgiL8k9QCKKyDAyc2Wlg4Y91oxG3X4cQ/gwxFRkwuf3t9D+meNgMdrVSuqiklboEp1S6iCWY1/LCXh9oZ6b8cO0mWQrrBH6Wcggym8KC9cuemJT/mY2WZhWS3UFSEdDIDoM6hXmEB3Zk6gJSTnGFbhuPYUYjDwYHuaqzu7lWhYE4eP5u4n5frlHvEGtCTyu9YUyz/nlMX1o3G4u2m/uI8iNcYhBlPNR2PKZFutJTYMnxfP1gzyhPcfAIgRuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byPI9q5zlkVC/ORLJZtFm4v6f/afHVUuizUxYRF/yYo=;
 b=HjzW+hWJNwl6l3MwiuiWQWlSNBqelrzF1hlpG8SLNW+R+bmyqR59K1VzE3/SaImsNA1JitHIUbJT7Uv5NhmZy5JvZEClPubO+jSDsKTEQ5GtQiNjWpK9cqQBA4sSRSTqf/yoULECOlUfMjSF6Obt+PNfz0/BIs1atkpn6QaaQ1QEk7Z1IZNQhkjboyn5cjfRfNFr7iagAH9e8xsPNEBv7AurqVLVMcx0iQ9ARwLgh6EEhZK85X8AW4t6XO5f9oH7OZUtNyM/+f6RdDdOnhe9N+q+AfRba5H/wU0ARi258NlYV8bDmyDJMYWvNtxDhKJX/MsxnaQMfTRaTLRx+jgY0w==
Received: from SG2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::49) by
 SG2APC01HT179.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::394)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 05:57:44 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::48)
 by SG2APC01FT037.mail.protection.outlook.com
 (2a01:111:e400:7ebd::367) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 05:57:44 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:50A7484440DCD2EC18006E7599FB1F8D710CD9A1188A8ABF74B603C0F72855F2;
 UpperCasedChecksum:4B04A9E3E5256CDBF2D8E63374E0064A5D556DAAA4349382422F5BFEF37AD05F;
 SizeAsReceived:7662; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 05:57:44 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] fuzz: add minimization options
Date: Mon, 28 Dec 2020 13:56:45 +0800
Message-ID: <ME3P282MB1745A07806012D35CC655399FCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Ye93vDVWuyHzax6fWAhY/gU9On8kOc5Mq48REj08MVZi6ZY043kSFcfQUw+RaGtl]
X-ClientProxiedBy: HKAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:203:d0::13) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201228055645.3666065-6-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:2110:d78f:cec3:aac7) by
 HKAPR04CA0003.apcprd04.prod.outlook.com (2603:1096:203:d0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 05:57:43 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f24529c1-3dac-4629-de4d-08d8aaf57e9b
X-MS-Exchange-SLBlob-MailProps: q+fD6XS3/UI4W5gxJ7aMBVnMbxNbPZnDjVC+JkmMhTs1avImAZFxBB1yTzEwZFX/24VfZZ2+gBAAyRhmmQZUHxmRs27dNFGnZC6XU7aWq+4v7fVxF4G/cBrcTC1o1Xyi6IqJTOg6c/LJAx8KJXFIOBkeWCMdVWQzEVGQxmt3No/BcUVUx5bTwwa1FBE3VfPbAbJr72RdRGiuh7BRw5XHpbz0bGOapVsIOyBjzuE8A9XCRzpq+uXLvVay3zKfHoPUrWuSPbO8kY5uZIUAa5zcJc4vL1DdVNU4egDK4dol0u2o2w1UTb5E2yMM0r76oATnQs6ipWfAtuHw6c2hEZZpxq7dkcSPqky6RSLWoVvs1ugplP2ugcVdiQk7Eg8qioyBLHEJkhZ2+kA+ts18CrC08hyml5zlW+O0GFydgQ0De9S+7i9DkYJ1ijMGQ3pQX6JAf/MDbXb69zEJxdnaBMeS7uGy6xCD3+K7UOADMifPDgoACWj+9yjVWM0li5c5AwOwjnKESNeGLlAmLD6/QJVqG5t/7GBDbo2dl3z2nIlxEsAUIDkt0MJ20R1Bqoy7WPw7AyO4uMYXTw7j+y4mrGIZ6hbpSvi56IP7t0mvjZsolBStDizKzYn/Uqjyarlicexx9x81jeeLa7yx6achTZkkYUFHGATJf2hEXKVlIZIGt7ekTwpcMqhPAReyLOSudwr/iSxIXuM2cpritqEIRh+Vcw==
X-MS-TrafficTypeDiagnostic: SG2APC01HT179:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bcIgxY6MM+bto1oyplD5+5V6Int7ibHdnhipNTu6amjttBujPQDaV7YBgafBacs/39b0E8rXNCw2wuXknlj1hS32ogaZ7GDPVZnA5TSQ2a3iekIS44UZKZqmYLlj2a8dQZ1rWcy6Ly4PQoYolz9teBeKwoWfiNj8JTTGdmlyb2SZHUi41AI87H1R9ojQa25ZCHK4xGZFRj/tlURsP+8bGykdiDa5KeK5mlFBZBYC3jVPHPygfFL3mHzBAWC2hN9k
X-MS-Exchange-AntiSpam-MessageData: w/x007DNkVTlQfibpY1DxjrP5l2Bn6U+PxxIwaN/aWgQNiqZUdtjgQcl/zXabilxtps7OXVLZzYbKBzp/mrKBlkQzijIW1jYv6zBi86TSvmAwPYTly9xbpjAQx5rPrXrrWQ3V3YdWgdJsEMev7lspCuNkXN3ONFWjiZtIO1CZeWOGcGVbKeoaBsXFjLpDQf+t+un8171/3rySTCaLvnZCw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 05:57:43.9763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: f24529c1-3dac-4629-de4d-08d8aaf57e9b
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT179
Received-SPF: pass client-ip=40.92.255.73; envelope-from=Qiuhao.Li@outlook.com;
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

-M1: loop around the remove minimizer
-M2: try setting bits in operand of write/out to zero
Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 30 ++++++++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index bcb32ee173..7947eb1d40 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -16,6 +16,10 @@ QEMU_PATH = None
 TIMEOUT = 5
 CRASH_TOKEN = None
 
+# Minimization levels
+M1 = False # loop around the remove minimizer
+M2 = False # try setting bits in operand of write/out to zero
+
 write_suffix_lookup = {"b": (1, "B"),
                        "w": (2, "H"),
                        "l": (4, "L"),
@@ -23,10 +27,19 @@ write_suffix_lookup = {"b": (1, "B"),
 
 def usage():
     sys.exit("""\
-Usage: QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} input_trace output_trace
+Usage:
+
+QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} [Options] input_trace output_trace
+
 By default, will try to use the second-to-last line in the output to identify
 whether the crash occred. Optionally, manually set a string that idenitifes the
 crash by setting CRASH_TOKEN=
+
+Options:
+
+-M1: enable a loop around the remove minimizer, which may help decrease some
+     timing dependant instructions. Off by default.
+-M2: try setting bits in operand of write/out to zero. Off by default.
 """.format((sys.argv[0])))
 
 deduplication_note = """\n\
@@ -213,24 +226,31 @@ def minimize_trace(inpath, outpath):
     print("Setting the timeout for {} seconds".format(TIMEOUT))
 
     newtrace = trace[:]
-
+    global M1, M2
     # remove minimizer
     old_len = len(newtrace) + 1
     while(old_len > len(newtrace)):
         old_len = len(newtrace)
+        print("trace lenth = ", old_len)
         remove_minimizer(newtrace, outpath)
+        if not M1 and not M2:
+            break
         newtrace = list(filter(lambda s: s != "", newtrace))
     assert(check_if_trace_crashes(newtrace, outpath))
 
     # set zero minimizer
-    set_zero_minimizer(newtrace, outpath)
+    if M2:
+        set_zero_minimizer(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
     if len(sys.argv) < 3:
         usage()
-
+    if "-M1" in sys.argv:
+        M1 = True
+    if "-M2" in sys.argv:
+        M2 = True
     QEMU_PATH = os.getenv("QEMU_PATH")
     QEMU_ARGS = os.getenv("QEMU_ARGS")
     if QEMU_PATH is None or QEMU_ARGS is None:
@@ -239,4 +259,4 @@ if __name__ == '__main__':
     #     QEMU_ARGS += " -accel qtest"
     CRASH_TOKEN = os.getenv("CRASH_TOKEN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
-    minimize_trace(sys.argv[1], sys.argv[2])
+    minimize_trace(sys.argv[-2], sys.argv[-1])
-- 
2.25.1


