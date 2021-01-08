Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21772EED83
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:42:42 +0100 (CET)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlTt-0003eB-Fw
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlQD-0001s4-7w
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:38:54 -0500
Received: from mail-oln040092253103.outbound.protection.outlook.com
 ([40.92.253.103]:63909 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlQA-0007Yf-0v
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:38:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXcXOFWJJ5xZRfCZ1rxwgc+MGkHpQOAzi6mvDu6J97Fhii1w2TJd4CluuHER4rhvKJSXJDUhG3J3rKvqVG5l7L+i7sBy0G1CGXy+lmBQy3IKgUg56tUFBykZDQvBJXfeutOsZjKHSppRV+vflKH0qOBJDYm1OwLHuXybIqslNoApIAgnS9yXotMYouCYEU9WD2TAV2Lek6Z581GXSLq+zH5ITudjJmFPiY9ea7tH/PTxhJ72PWSLaJDymYhp5zRq26usrXkuZXpq61f0sXMFHFmJASCfwQgMatTWhtRqeyxednake7rMrwhUHhMMAcCIp3E+pg8xosLXP8iTnZkTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q85JygrgDSxW8i/jWYljdA+7FRjGGda7l05OTF2aOxY=;
 b=XkfmM47wEUI0uiqEhd+z30pf2BNfYrlwnE1hc30fjt1/qlqAJ6kbQ6Td1B237b6P8P6M1ltPabS+Sli6xt4HoWB30PXtTYiOcSsmpoFTLzyGPiDQRQ8FuE3xYqEPU/vGoc5aJhPYopdl8uC1LSxf6R5o0E1nT9SGT21XWHz6d3d1+JhXDyBp6edZKrSIxxgss9tEgB7U9Nl/QfNFtZlxTnqz4+622hJRTDpHZRSKefOXexDnNgSqNrTftV378WYWnw0ZRmz6tCZl6fZIvOjPqXVrUtPJJaD3rotLT/MkyN+r78XiDf/YDnKFmnQcG/2QG7GOscAiXFl0+R5H7eMsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q85JygrgDSxW8i/jWYljdA+7FRjGGda7l05OTF2aOxY=;
 b=brhUpzBriFxoxeFlDZf/N49j/LYoEtln/xri/jhqfHsFBbXSY/LihG27XEjCjFq0cFrZ2H6YkfK+6ds7C1wCu7XHaENqre6ut3su4WAC9ONjKOsmfPpHXPv/4bYip3TopCQTYFWqKwrNK4dRFd5UWsYhssGmRIHtz/6eLWtodcT0DUsgOlkEzYzyt9FdDNjRJSh6wrOsSswkSLuLrmAwuqhvVb+qQUr/uJMDo9vpOTkSBOsqRkI0H87WCCOqUnCYcxKxWykkB34aSW7nXdMX7eCWcnc3hOF1i7l2WM9d8mGebT3JIB4XnDj0eO5DywWChZs80R6QSg0G19HMum+JCQ==
Received: from HK2APC01FT049.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4f) by
 HK2APC01HT014.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::159)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:38:43 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.248.58) by
 HK2APC01FT049.mail.protection.outlook.com (10.152.249.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:38:43 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7E518BB6E8E1FE1F704AE5658245745981404522AE7D49C95B0479792C14C4C9;
 UpperCasedChecksum:56E35A3230EAF1E8D2B859B966263FCF7FDBAB2E4166D1FE07B40DFB679D3201;
 SizeAsReceived:7671; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:38:43 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v6 6/7] fuzz: add minimization options
Date: Fri,  8 Jan 2021 14:33:30 +0800
Message-ID: <MEAPR01MB34943433E0BA454B7291B04EFCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [kYkxfQuqlLoynuz1zQO6d842qrp3zbtpf0tE9hMYySHNVaB3whnVjnQrOvdVn1eu]
X-ClientProxiedBy: TY2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:404:a6::25) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108063331.17035-6-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:10c6:c22f:85d6:f9d) by
 TY2PR02CA0037.apcprd02.prod.outlook.com (2603:1096:404:a6::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:38:42 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 057c1048-cd77-41a4-3e68-08d8b3a00aea
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwjCPv1UTKlQ2wyOuCRiSqc47S4KpmnOJbL8VPF/41CdlikSAMS9Jd2burg1S/IuRGvTxd9Jd10MkaSRGIImEsvimPQ0TMIy5RRQjdA9fV4/IeFwYhKc+Fpr4eB2neCNr14t/h15F8qP260EtYWCxt39nN1v6dP4urT0H+j20hQN8+RdYZtrJ1hbEabfEQ5S/BJmqJXYLUSn9vnopHJ0NGRzYe7Bo0o5xLU4r1+9zF/AkYSs8zYjuUXFzG1ahDP9KXY48nQGzTOQKYJ230SVJNgC5NWI/Z7BZjV5/MJ+3C32ye/W2ixSNSRTIIQ4/ZrT3kN7m6CefLM/VzkcpkJfLtAD2cyWTSQS0Hmbfq8qXNjx8n8mywIUQHxMYZpa/fy2vS/bad1qD7xS2UYP6eVLabK73JQEaZST2AzqYQYR2Vh0mnsXoG9AHo1tKIAZNsO1OxxB3YMkvqQi6l6J4+aYiLgpUOV/YHLmPnuxgETv7HbMwXHBzKFa0iWywTu3mXlpDiH6uhSQlZLNmVVX0vMhX40tMS2dyThGBhxVx7+aaQ13JeiaGObQZv7sHY5y2r4Eo9MTErmNKr6faM+SoFlEEVEmIEvx1IuW+4MA8ER3uzL0NBwINi5UiRGXRebwvPyQTx0Em2oGaI3CQ3oJGAsoCyovktkUNQaI8BWfwiDrvlxwph9mtPosTE3FyuXFVic8CBO8obR0nTcR1go4QJY9qZDBVSGMabxGnZQOLRQ5aXJ60=
X-MS-TrafficTypeDiagnostic: HK2APC01HT014:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tkj+OSJUX8j+jesql6g64PI3o+ilVSD3jDEEAEv5J/AXZiHDlEbffL94qnU9j+nS5Yh+PGlo46OYSoDK3PfcaEUuM2d5KA7P4uYxkUeZaosvuOhgZGwEFkB1yxZlmGGLZToKw3LcmgCsgh2MGU0D8QjovJFqdmLzRLtEX8Gt8Xg/i8XaxPBPQKYNKdNPhoCrqKrFpkbG3KoGsnW80HtPWFWZ16t5WN2H12Ac3IaR6mvqLAzk1bxq8OMGBF21XkwG
X-MS-Exchange-AntiSpam-MessageData: uw1AcCEFe9587jFIiaPbsQCPYIuftfexsUT7jtF2Gxn9gzOhkYwsA74h1eP9Xjr1SIGfC8CQdUWAAeYQ3AUePPYm9nrK0M6ibYEqB8vLkrRyc8fVLFkSMNIPhJE/QKBN/D5/bHl05SM3J/7A6GHiQUOqcmtYTYsEnHuxCT8E1vcezETChQH3xIVMVICxy+uCBqqMJ7dzdbiTNI1L9KaIUA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:38:43.1398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 057c1048-cd77-41a4-3e68-08d8b3a00aea
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT014
Received-SPF: pass client-ip=40.92.253.103; envelope-from=Qiuhao.Li@outlook.com;
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

-M1: remove IO commands iteratively
-M2: try setting bits in operand of write/out to zero

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 30 ++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 2325b38dbc..8661116075 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -16,6 +16,10 @@ QEMU_PATH = None
 TIMEOUT = 5
 CRASH_TOKEN = None
 
+# Minimization levels
+M1 = False # try removing IO commands iteratively
+M2 = False # try setting bits in operand of write/out to zero
+
 write_suffix_lookup = {"b": (1, "B"),
                        "w": (2, "H"),
                        "l": (4, "L"),
@@ -23,10 +27,20 @@ write_suffix_lookup = {"b": (1, "B"),
 
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
+
 """.format((sys.argv[0])))
 
 deduplication_note = """\n\
@@ -213,24 +227,32 @@ def minimize_trace(inpath, outpath):
     print("Setting the timeout for {} seconds".format(TIMEOUT))
 
     newtrace = trace[:]
+    global M1, M2
 
     # remove lines
     old_len = len(newtrace) + 1
     while(old_len > len(newtrace)):
         old_len = len(newtrace)
+        print("trace lenth = ", old_len)
         remove_lines(newtrace, outpath)
+        if not M1 and not M2:
+            break
         newtrace = list(filter(lambda s: s != "", newtrace))
     assert(check_if_trace_crashes(newtrace, outpath))
 
     # set bits to zero
-    clear_bits(newtrace, outpath)
+    if M2:
+        clear_bits(newtrace, outpath)
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
@@ -239,4 +261,4 @@ if __name__ == '__main__':
     #     QEMU_ARGS += " -accel qtest"
     CRASH_TOKEN = os.getenv("CRASH_TOKEN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
-    minimize_trace(sys.argv[1], sys.argv[2])
+    minimize_trace(sys.argv[-2], sys.argv[-1])
-- 
2.25.1


