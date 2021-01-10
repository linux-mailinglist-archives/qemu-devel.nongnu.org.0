Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1512F0763
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:24:45 +0100 (CET)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyai3-0007Do-GX
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyae4-0005Ik-60
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:36 -0500
Received: from mail-hk2apc01olkn0815.outbound.protection.outlook.com
 ([2a01:111:f400:febc::815]:19200
 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyads-0003yV-5A
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMP9UnB54XBpQRxxbAnxDB3/fIjSmXNNjm736ULT3yn+kPIfiTPPquJAtzGpEUrW/XgWV0QrqUBmXqbQeRz25bM3A2FKLy729kJQMDnS0274N7W08bg7tW+pAy805SVbadxcA2P1pnWgbuK0RtnBDX7MoUa36Nk2PRWykYWdxulkyJa33Bodmnn73FhujuGth2TBeA3mVnvVHzKfmdoyRNZBsQx77S/BLFDJvU8QRvoZF9/8N9CAktvZv3pqUN79bmOUTR3b/j5GoAtwuiU84Jk2iQY+lX3zxc1N5CGWLL7gIjVAM8fJvWIfW9DqrJXAw97RwxE8cDZu12dg3VU/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmWPhbr2A9dl2tv4GeP7FLGqD6awY6aDQw3lPLYbZQ4=;
 b=LNgolhePPzUzwODIw1QKNenMSURbdkW5fgaGSTQpNr32rTmWg/jotG2B8cQ5xYFfM/sFTayH816rDNAGf1PY5y332leEhcEM+5wLTe5nxa9vwsHykdlZpk+RR6WlNHaHIP4mvLMisHfv95CkhpBeEP0O7gIxqpubhd0KCru5Fm3HJxqaqIXV/CkUJ7INNmqy0OoGSTwAsMwF/tKm70p80cUktDfaNFvnn4zvE+CRq6tUjWaavCCFLR1LwFlJ3y2FpQQ6oD14kQa7yUXMYEZD2tCKAYDOuAlt3mKN/WwwSl8nUIAYbOxKkmrODpZ/oPmvQxUnN+JAnWditrJTDBc9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmWPhbr2A9dl2tv4GeP7FLGqD6awY6aDQw3lPLYbZQ4=;
 b=mTT6Nz6O+wcKcFYu6m9WpMnmmzjWgerjJz62zuzY/JIJbEtSONo7iKqKU4fD4EKoNnyQ2DgHOaquM5wS6Xzx/j2pTZgLCrnV10hcazIVP2T04Skr2FztkzpeCr3kaTcHBijU2tobOpMKcZ08KTSlsfbfB6hrV7k5/ACe0PJ3skeB8VrOBxNmqAoVZPNH/pQHux+3ek6H3XYc5T2U0LT+ej7iHAjNOOXg+yV7g8vvJJ38CsBdvDcIEn35rrQIILhtCGhvXRjBqGN4aBBmFpNz6uYfXsWSEkdtWVyjdz3FfNHmCe+P62kHbbhVbTVXShX+6JaKAwcLkE9OP6BGTB5mhA==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4b) by
 HK2APC01HT169.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::236)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:20:05 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:20:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:99FB900A1C812FB8579F4230941B2D298C7708A999C9C8CD06A8247DC8A263AD;
 UpperCasedChecksum:9ADB6431074DEE33C95054EBBFB2512C2F811359CED5633F27E476DD21438A18;
 SizeAsReceived:7547; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:20:04 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v7 1/7] fuzz: accelerate non-crash detection
Date: Sun, 10 Jan 2021 21:19:31 +0800
Message-ID: <SYCPR01MB350261980788DDAFE5F45E06FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [76+PZH3vo3KYpSfeX/yVHSbQiOQ/QaWY]
X-ClientProxiedBy: HK2PR0302CA0021.apcprd03.prod.outlook.com
 (2603:1096:202::31) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210110131937.98351-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR0302CA0021.apcprd03.prod.outlook.com (2603:1096:202::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.6 via Frontend Transport; Sun, 10 Jan 2021 13:20:03 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d598e955-4d0e-43ff-8863-08d8b56a7131
X-MS-Exchange-SLBlob-MailProps: pt8ZUcDWjMUUvYT8pgQ1QLOhg7myynsEZETeCxjQbBxAWUTyac2rXdL4bbwnboEjSeIFbHUZREvgqZT75ILjQiHoVwZZdrcOj5SGbKnB1Ddk8WQRN1vAc4gEx3noBN4DM3VSvJ9tin14PsfWXF2AdsJdOJNYFrGLUfCxjLUvohWs8UK/W+TgWCaOSND5DhyXU5cLEExUHz9BzA2PqVu82iwblzDBS2CYkuhcX+iS7nlsK4ny4Ss/bEyQA8jvwJtU2TMBaFNfc4RLberMyeIZgQsyoN8tsHVVdYG/IgkWjyBdYeWqv8/JcPG4EyQLdFnALLS8MiUAiN6rU9asgGoJfB8gE6z7pFSYsJjLMvqCgwkqF9LUNq2Gp4RCK2rytJTTokEs/oN3Y2kDSkRU06SIQQk7hTudkDjGgKfcb0p+7ykWGLJXxeNS0pTE5oBihycU+Qz/BeNGQI00WFYN6PVhiblWvIGRgk5afTcj9Ayv4T3jI2ghWTlsyKbwsXl5LqAg0VTzJQQmNRNtliu5WDWu+Lmub8na6JAH3LELgQZNLJQsEtyIJjDswmtSNZH/PyfzKMtV1YivosiNn0pcol8MvbnvsJAbnGRdyPwh4QMjiNOfOAaQt7Hwj/bKMoQxocIIoOQWrWMoIo0ErY7wVJn891JYVgliv4rdFuybqZGlKfs4EoqCey6QAChKeOchiN+h/dv3ivxNb14qkMaCntDOk8+bgFXn3xDNlnKOHvrQEFz5vA5/7lGALqoHXd+aNSH+7TIsz4LRvbOZKg8AJ08/mwiLBAfzmgCGAQrAmSwhZ25/RbfnWV7jdlf3maWmo5mi9tA3C3rtwe2VT0Tu4STqpehpQWCzkoDRr4+fLqPTqgZVzrhlZ/BT+X5p4teOsw9NrDbJUDOVQAJBQ7XO/ETfxi9Pp6OmRy5D/4HvZpL/H5zKgCf3nzd4ZPclPhziydBq
X-MS-TrafficTypeDiagnostic: HK2APC01HT169:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/BqvPoYsSKhnJCAYQ6OOMrmFf43h9a70q7i2+EL3Org+lDK8hxQNGKd6KNeLY7Lov8cORyrD0RCFCmSW6+oJCpRNTpFgAkW5nXrPuOoB2Mim9VZtmU2/lGJ42INOhMFPT4Ck47kr6OpAOHH3a7OfUwugxPFfCOl2fj7Pe710rjHlHJHPHQL1VD6bQyDXTusYmRsKrKbhcFKrye+lqCs9hm+IHlXaW+luIPokaDAF1Zk8ZmUuS5ckZRDgY4zhFk+OBlqzUwI2rX98bazbfit7PC/fe8XDa0e3D5joNfL5nQ=
X-MS-Exchange-AntiSpam-MessageData: qdvQRUFphQiJ4aNuTgctTr0Ob+jVmNQAliEJ7vp5Qc6oLH/HLDwJbi187NG9SWREtubbzeALsTLddXBEruBPfFYoS3adEohI/zxt4dP9m9ahw4dzdYIiji8IlCh0dpBpcGHoQC7pFNRZG3ZPGu7RDg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:20:04.1948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: d598e955-4d0e-43ff-8863-08d8b56a7131
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

We spend much time waiting for the timeout program during the minimization
process until it passes a time limit. This patch hacks the CLOSED (indicates
the redirection file closed) notification in QTest's output if it doesn't
crash.

Test with quadrupled trace input at:
  https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

Original version:
  real	1m37.246s
  user	0m13.069s
  sys	0m8.399s

Refined version:
  real	0m45.904s
  user	0m16.874s
  sys	0m10.042s

Note:

Sometimes the mutated or the same trace may trigger a different crash
summary (second-to-last line) but indicates the same bug. For example, Bug
1910826 [1], which will trigger a stack overflow, may output summaries
like:

SUMMARY: AddressSanitizer: stack-overflow
/home/qiuhao/hack/qemu/build/../softmmu/physmem.c:488 in
flatview_do_translate

or

SUMMARY: AddressSanitizer: stack-overflow
(/home/qiuhao/hack/qemu/build/qemu-system-i386+0x27ca049) in __asan_memcpy

Etc.

If we use the whole summary line as the token, we may be prevented from
further minimization. So in this patch, we only use the first three words
which indicate the type of crash:

SUMMARY: AddressSanitizer: stack-overflow

[1] https://bugs.launchpad.net/qemu/+bug/1910826

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 43 +++++++++++++++++-------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5e405a0d5f..97f1201747 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -29,8 +29,14 @@ whether the crash occred. Optionally, manually set a string that idenitifes the
 crash by setting CRASH_TOKEN=
 """.format((sys.argv[0])))
 
+deduplication_note = """\n\
+Note: While trimming the input, sometimes the mutated trace triggers a different
+type crash but indicates the same bug. Under this situation, our minimizer is
+incapable of recognizing and stopped from removing it. In the future, we may
+use a more sophisticated crash case deduplication method.
+\n"""
+
 def check_if_trace_crashes(trace, path):
-    global CRASH_TOKEN
     with open(path, "w") as tracefile:
         tracefile.write("".join(trace))
 
@@ -41,18 +47,32 @@ def check_if_trace_crashes(trace, path):
                            trace_path=path),
                           shell=True,
                           stdin=subprocess.PIPE,
-                          stdout=subprocess.PIPE)
-    stdo = rc.communicate()[0]
-    output = stdo.decode('unicode_escape')
-    if rc.returncode == 137:    # Timed Out
-        return False
-    if len(output.splitlines()) < 2:
-        return False
-
+                          stdout=subprocess.PIPE,
+                          encoding="utf-8")
+    global CRASH_TOKEN
     if CRASH_TOKEN is None:
-        CRASH_TOKEN = output.splitlines()[-2]
+        try:
+            outs, _ = rc.communicate(timeout=5)
+            CRASH_TOKEN = " ".join(outs.splitlines()[-2].split()[0:3])
+        except subprocess.TimeoutExpired:
+            print("subprocess.TimeoutExpired")
+            return False
+        print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
+        global deduplication_note
+        print(deduplication_note)
+        return True
 
-    return CRASH_TOKEN in output
+    for line in iter(rc.stdout.readline, b''):
+        if "CLOSED" in line:
+            return False
+        if CRASH_TOKEN in line:
+            return True
+        # We reach the end of stdout and there is no "CLOSED" or CRASH_TOKEN
+        # Usually this is caused by a different type of crash
+        if line == "":
+            return False
+
+    return False
 
 
 def minimize_trace(inpath, outpath):
@@ -66,7 +86,6 @@ def minimize_trace(inpath, outpath):
     print("Crashed in {} seconds".format(end-start))
     TIMEOUT = (end-start)*5
     print("Setting the timeout for {} seconds".format(TIMEOUT))
-    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
 
     i = 0
     newtrace = trace[:]
-- 
2.25.1


