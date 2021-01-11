Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD00A2F0CC3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:13:33 +0100 (CET)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyqSK-0003wI-S0
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqRO-0003VX-L6
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:12:34 -0500
Received: from mail-oln040092255103.outbound.protection.outlook.com
 ([40.92.255.103]:17825 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqRL-00033P-1i
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:12:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gd7VcXdA9EHSkmrYtRIXoC3I95pp/0eMDthoGevM5NDob9jfeLzihpNrmzkxXjx9YNrYQNcTVADIdU1opB2R3M/BTy+TsnTRColL5rZwKFCpCbXTRYdmpTK/IpkY/WZxTB0b/2+L9Zu0NNwjOJkW5CrUgBWPjMWROCE6mAiGkRsWmJ1XeiCBrmXsDiBpMwg5PBNBwAg5qdTH22oYpARSZqyMpYG8kZCY0UBhvcY7hM9ez1xEjYTbrx5S6ZGZT8zEn//CAFR50ji+7EVnkbaDPaG+APV0y3SIUU+tBNKI3lNutbVkuO+nHRuAxHleRbhcScOVSF8Gzj61zy5orJVIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwJXB6/eqTwXMwRYiTY3utbq1jPv07QKC4mHI9Pi4dA=;
 b=Jaa9mMq5aVbJBBILWVBt75UtnodKH4BzWfoInCREJm2eiKws9PBhlU6qgyViNu/cDSd9yJkQG+G0pjCbzPFVbhzJZsEm1H0l7q2SupaQepufIf5HdugI/PWn1CfzdvFwSppGxiCn1BgBjDW4/i3Qfxggd8vqLCYKtyq53uU8/t2dDOP9EObeUluyQJjZvq/RIN1UCdSDpL9cZwKezet94phVXD35+jcoQnKNzBcBxWKZk6IPvpwJKuLLFl7YmJIBF3JdP+whCAs/DnO64rgmpdI6v9Kllu7+2yiCstSKf45vg9zPLBqmt3UPFkXup7n//ZxBEyez5PSsKAhB75MTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwJXB6/eqTwXMwRYiTY3utbq1jPv07QKC4mHI9Pi4dA=;
 b=frqJnMKfS9+UU4Y7gp0fXZ3YzLPaIgxUZBjwIn9wOabdlKv4TjyfOuYT5sCJ/5RsXMtpvggrdcSAekg3WHrPA3dN52pUP/jA2Q4VYQ1hYnBjs/MEM5Oxb/iNYDPIxSoZf7PXAl8DHikYEuAIkTr7RKc5AmuQRID/RMD790gnXRsKZ/degsNGp8oSZLCsqm4m+fyHUrJyfdCpRiO3FQIUU5vG/5oaOe+3z4GXlAMP68OuEie0XyDDltyubhyB6oaKuXsHaoc6ZKp+0Fzlao5giH0M0rbkMcQGgD1/TxbRcwhMlspHkfZn3TEO3QHJvzZn6Gl9YOQMy+bVo1fHLu7UPw==
Received: from HK2APC01FT046.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::42) by
 HK2APC01HT187.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::317)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:12:22 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com (10.152.248.51) by
 HK2APC01FT046.mail.protection.outlook.com (10.152.249.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:12:22 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:59C557EAC96F31594027613CB558D58C53350723A42E2B103AC8BAD714193386;
 UpperCasedChecksum:61BA08611D152365717D640C9ACFCEE00109DAF4D71223AEB8CEC49CF6A9D91B;
 SizeAsReceived:7569; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:12:22 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 1/7] fuzz: accelerate non-crash detection
Date: Mon, 11 Jan 2021 14:11:46 +0800
Message-ID: <SYCPR01MB350251DC04003450348FAF68FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [OoGnRoo7KNwjp87rIRc39VhIBlGHa4c+]
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210111061152.176206-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0178.apcprd02.prod.outlook.com (2603:1096:201:21::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:12:21 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 0c42a82a-b1ed-46bf-b5d8-08d8b5f7dbda
X-MS-Exchange-SLBlob-MailProps: /mB5ds43bCFukvp7s0pXhQHGyaaJwPQxJG3eApK9Bggt0F7U2IMASA4va0Pojtwsz8IVJMTHz8eeBbZsmSbSZOXjLf6vmchk5S465pH0coAmZnW/utubVFa0hMniQL3RRRYX3aWYcHEUTAbVkyVzmkAcorcFYDBSxJBXjm2Rjp4lxzlbg5tziAsvlJGH8cOA0nkpXuzOonUCM96Y0s4FwttrdCU6YL3NBvtpKXCdYu78lsLBNRPmYxLHqln+/UWgDWhuBIhhW/Hc/aNCJ0jaF7mkawV/3WG589M+NnIwZya6jPrE0yjcK+SU6XJwt7ALJYgr9S8puLcKpZ2ZV44F2fhUFn0wOAofRRH1Feflrf5VHJgIHuHog+WZBnYeX4SbjavFT8pW1q2k/De7VyhAK/pub5J0Dm2tBBI3CKytNejkgOOB83gbW0M1PVLzQaRMu5/bp2/TXt5eluzdebPSdzUR8yugry5eqlKeiIUmBAvioirXVlduSnJzLJCwB8jha/mqVYMMGOopWufRJonpfkPy8lyutx0IQxbRW+mm3Q+RR/q56lJ9UBprcXjmL2SFV9j9ZtakMVoQpD7WTqQOy256e1TDlsgEh4NF5Bm8IUBYTteOXScQGQSfHVwcmbP8dXxcPkeIVBYcFbJE+TaUC74zaH1aYO/prCUXOSFH3/mHZV/ugLEJ96wrFV8UIwI+1MUCD4pBi5oYmJPXMUPY1uxNCrzv2hXQ06RnVepphU736LvlIvEYNO0v/37ILUNZyn4LfL9aWs8ITMVD+GlxB7oGv9P0sO1ID7W3bwpnirYHeg8BUxGunsvTbO8hZiS59HrvVnruXzBCXx2x51KCPTghkuWhfECKxDlHcsqpfDloE/AD7G2+c6ktwysvZi6myZzbT2cTmsuFAG0weXKliryYPJU7PdbJf6JgOkyKkZ8=
X-MS-TrafficTypeDiagnostic: HK2APC01HT187:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1+Av7J7fPDvtQIp0VzCZ6ibvSXO0Z/x7Pv1Hrz1aYoWq9bma3SVM5EHZvBDe0tTHBBLIbK9iZQF4W0XTdCYQDtHCJWisxm9TEyXZiGXsvElAMcyX3U4iHjaOdYeB1q9XsVYK/hnsMzkTu5Uh39b+pQE/nH5DZKvIq+mdx7z57mQHi13kq/9ehEyXb0xcZNxYZ9PdInmXykBM/snypp2aVNaxLUnP/FfTCoGTG4XDy3X4HPfYrtXeCC6k6RxFcx5Wp7L2zXCmrqVnPU1vCsKpoRObTTHzh6z3u8kjRkD2ous=
X-MS-Exchange-AntiSpam-MessageData: tEF7w5gMZxkuOMOFisNkRv0mL8AcxWbhZxbVI9AmnsgZI+aFerpnXl5QnO6nCo2VOwBEHl48cTevPASujk80GbGiMRvRy7Jm/ju9a7CUHpCAkjT6W0vupoEvZhcb+P0lySeZI+j2e2qAIhqZfGI28w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 06:12:22.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c42a82a-b1ed-46bf-b5d8-08d8b5f7dbda
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT046.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT187
Received-SPF: pass client-ip=40.92.255.103; envelope-from=Qiuhao.Li@outlook.com;
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
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 42 +++++++++++++++++-------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5e405a0d5f..a28913a2a7 100755
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
 
@@ -41,18 +47,31 @@ def check_if_trace_crashes(trace, path):
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
+    for line in iter(rc.stdout.readline, ""):
+        if "CLOSED" in line:
+            return False
+        if CRASH_TOKEN in line:
+            return True
+
+    print("\nWarning:")
+    print("  There is no 'CLOSED'or CRASH_TOKEN in the stdout of subprocess.")
+    print("  Usually this indicates a different type of crash.\n")
+    return False
 
 
 def minimize_trace(inpath, outpath):
@@ -66,7 +85,6 @@ def minimize_trace(inpath, outpath):
     print("Crashed in {} seconds".format(end-start))
     TIMEOUT = (end-start)*5
     print("Setting the timeout for {} seconds".format(TIMEOUT))
-    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
 
     i = 0
     newtrace = trace[:]
-- 
2.25.1


