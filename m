Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE2E2DE52A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:54:53 +0100 (CET)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqH9g-0005sE-0b
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqEAg-0006D5-G7
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:43:42 -0500
Received: from mail-oln040092255040.outbound.protection.outlook.com
 ([40.92.255.40]:30256 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqEAd-00006V-Hq
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:43:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoSJvMEBtvVEE6vovDiVUHHbU2zaM5OCb9PUWTLUg+bhnIBC5vawvtwywaSZX9jEdvLUGsy0D8EWfCyzhT9dFGI8M0GjR8aQztJt/vD9qyJg4pQY44InmjwwjDa4zZ3pxvQeqdXNg8cwNkx7kySw73mhrG4bGAup422WmrxzGC84jaNKfqg/+LeE0yOOnxxtUo21VGcwcHJWMwcg4x8nTcxKrc/RaGz5b7w8Nbq0QqdhPEZe9DmSWWpBVfEAzH3JCB30sFhIXjwFWl7lX/1AJZ8HGFiuUIKSe8AiHS1GEWf3D34d1OqIznTgzQN//Z6Vy/4ZIHgXd3P5f8Dixz8Aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqlymTYb/QAOKwV8mcS/oAA8KOWRcbk1JPtzD/apFyQ=;
 b=aAFHVDtYAekHQpjRgfw6ifhwMe+sDY/fMWXwZoGwBXKLfz3VUO742cH0ZexO9v6hbGRVijDyRUFsRPVftn9oPiMqC1d6IFozlATIS2So3y+kPpD2UE12CnBbA8jVsDB3vaa6DMqAvwgTheGvJICERKtjww23Rb3xOWyX+XCEf2VCuMhBTKrnUPNxBH+h4g+eU8Xl907I5b7j0mUNJjVt+WJQTgucLrwltlrH3JTO3F6ZNHb5Jmmx3sx4iRW3mD8ILOVEZKA4Qs9oXXGb+ocYNdyz16Pc/hOfzbEBgXJP+FKewECYjm7IpKSNO0eZHFbDOMpdmoQ91XbDdMzzl+IBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqlymTYb/QAOKwV8mcS/oAA8KOWRcbk1JPtzD/apFyQ=;
 b=n7q+94YcvcxdVkgg1fpYIGKSUYtiSk9KdjHktj3IM/et2QTAuopPBmriqexxV64NEyCHFTLoAgP/+dIzYJ/Yb0xQPb9LjCnbknzereaMCgDE2tkCB96k11a6Oj9DFEl9YfzJ8/ZbFXcDF8iRHZORNi49fwufLJZEMSFKVxnLCdy41EIoo8LARlZXBzyIMnv0UcaNOh8oAZnQS/WnD2Vq19rE1lIapoIds1iPUkyIX6377eupsBLnDmf5sYDdQTiuz03MmBhhOPXZSJIBJcFUMt6M9MSyRQU08z+Xb56Tt08q1cFwUEg+pAN+TwMSZ9rs5mw2HB0xpOBDzqGZJUxLhw==
Received: from SG2APC01FT010.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4f) by
 SG2APC01HT123.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::419)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Fri, 18 Dec
 2020 11:28:22 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM (10.152.250.54) by
 SG2APC01FT010.mail.protection.outlook.com (10.152.250.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Fri, 18 Dec 2020 11:28:22 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1B8E588F3D11BD9D00FC02BD99D6DAD370BE433DF4DB9A2F4B7C3297B1CB2B34;
 UpperCasedChecksum:DC838F26DA25E1FDAFD8053A31C10D4A7552EA79A8054A3DD23F79814D12BAFA;
 SizeAsReceived:7372; Count:45
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d5c4:d768:ca83:224a]) by SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d5c4:d768:ca83:224a%8]) with mapi id 15.20.3654.026; Fri, 18 Dec 2020
 11:28:20 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu
Subject: [PATCH] fuzz: refine crash detection mechanism
Date: Fri, 18 Dec 2020 19:28:16 +0800
Message-ID: <SYYP282MB15010A2FC429B4B87D33A67EFCC30@SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [slsupJEE9FgVcWMIedEIcNCE9lDoutUiWdRUUt0ombPoGspYtX/Ulsn6h/BOJY8B]
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:da::15)
X-Microsoft-Original-Message-ID: <20201218112816.291192-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:556b:33c8:b773:5e62) by
 HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.19 via Frontend Transport; Fri, 18 Dec 2020 11:28:19 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 0a07a9e2-0a31-408d-460c-08d8a34805e7
X-MS-TrafficTypeDiagnostic: SG2APC01HT123:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HvaiO070RKY9JRzfJldDqp9FtVp+WAeqXbvf/S6H87YvJ00sfNydYdKCpzX+iv8OrYBPhUoj3vr7fv8+tGev1EK1Oxsi907eVdwz9kyyjURKwElL2TF/BsjucYKTCicfrVLu5nNq0epdVdSkSvTXW6BAMPvuA1Z8ZqAIYlK8RGd6ux/b2lRWye5CDmtGKLj3LeXV7PEGTnLzztM5uXFTtSZePCTimT007g+MIL2zqobDqUY1LmROdcFZuxHcRfJikYFlXmJ2CdnuCE7Kn6icySoS/dIgr6r0goyPR1+JmI4=
X-MS-Exchange-AntiSpam-MessageData: N+BXbmjZxQwPon20buqoJnQ+RFNp1yd6wGAs0teBYgQHU8NLyfZOI30DzSOMpgP4mVraghKK4sxfe+Y1Yyk7DOqBp3ELQ+2nlMXaiCLj8kwR5qBiYKWGemXGHKJseuOUz13bIJBrd+OL5FMjqyjh6sdA8CnGSpxKC/nAaRCL+6fsN9H+khkMOliSVI+/U3Y3ore4TKzRYFNoH5M3lwVOKQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 11:28:20.3885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a07a9e2-0a31-408d-460c-08d8a34805e7
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT010.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT123
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
X-Mailman-Approved-At: Fri, 18 Dec 2020 09:52:36 -0500
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
Cc: darren.kenny@oracle.com, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original crash detection method is to fork a process to test our new
trace input. If the child process exits in time and the second-to-last line
is the same as the first crash, we think it is a crash triggered by the same
bug. However, in some situations, it doesn't work since it is a
hardcoded-offset string comparison.

For example, suppose an assertion failure makes the crash. In that case, the
second-to-last line will be 'timeout: the monitored command dumped core',
which doesn't contain any information about the assertion failure like where
it happened or the assertion statement. This may lead to a minimized input
triggers assertion failure but may indicate another bug. As for some
sanitizers' crashes, the direct string comparison may stop us from getting a
smaller input, since they may have a different leaf stack frame.

Perhaps we can detect crashes using both precise output string comparison
and rough pattern string match and info the user when the trace input
triggers different but a seminar output.

Tested:
Assertion failure, https://bugs.launchpad.net/qemu/+bug/1908062
AddressSanitizer, https://bugs.launchpad.net/qemu/+bug/1907497
Trace input that doesn't crash
Trace input that crashes Qtest

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 60 +++++++++++++++++++-----
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5e405a0d5f..96629b42e5 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -10,11 +10,16 @@ import os
 import subprocess
 import time
 import struct
+import re
 
 QEMU_ARGS = None
 QEMU_PATH = None
 TIMEOUT = 5
-CRASH_TOKEN = None
+
+crash_patterns = ("Assertion.+failed",
+                  "SUMMARY.+Sanitizer")
+crash_pattern = None
+crash_string = None
 
 write_suffix_lookup = {"b": (1, "B"),
                        "w": (2, "H"),
@@ -24,13 +29,12 @@ write_suffix_lookup = {"b": (1, "B"),
 def usage():
     sys.exit("""\
 Usage: QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} input_trace output_trace
-By default, will try to use the second-to-last line in the output to identify
-whether the crash occred. Optionally, manually set a string that idenitifes the
-crash by setting CRASH_TOKEN=
+By default, we will try to search predefined crash patterns through the
+tracing output to see whether the crash occred. Optionally, manually set a
+string that idenitifes the crash by setting CRASH_PATTERN=
 """.format((sys.argv[0])))
 
 def check_if_trace_crashes(trace, path):
-    global CRASH_TOKEN
     with open(path, "w") as tracefile:
         tracefile.write("".join(trace))
 
@@ -42,17 +46,47 @@ def check_if_trace_crashes(trace, path):
                           shell=True,
                           stdin=subprocess.PIPE,
                           stdout=subprocess.PIPE)
+    if rc.returncode == 137:    # Timed Out
+        return False
+
     stdo = rc.communicate()[0]
     output = stdo.decode('unicode_escape')
-    if rc.returncode == 137:    # Timed Out
-        return False
-    if len(output.splitlines()) < 2:
+    output_lines = output.splitlines()
+    # Usually we care about the summary info in the last few lines, reverse.
+    output_lines.reverse()
+
+    global crash_pattern, crash_patterns, crash_string
+    if crash_pattern is None: # Initialization
+        for line in output_lines:
+            for c in crash_patterns:
+                if re.search(c, line) is not None:
+                    crash_pattern = c
+                    crash_string = line
+                    print("Identifying crash pattern by this string: ",\
+                          crash_string)
+                    print("Using regex pattern: ", crash_pattern)
+                    return True
+        print("Failed to initialize crash pattern: no match.")
         return False
 
-    if CRASH_TOKEN is None:
-        CRASH_TOKEN = output.splitlines()[-2]
+    # First, we search exactly the previous crash string.
+    for line in output_lines:
+        if crash_string == line:
+            return True
+
+    # Then we decide whether a similar (same pattern) crash happened.
+    # Slower now :(
+    for line in output_lines:
+        if re.search(crash_pattern, line) is not None:
+            print("\nINFO: The crash string changed during our minimization process.")
+            print("Before: ", crash_string)
+            print("After: ", line)
+            print("The original regex pattern can still match, updated the crash string.")
+            crash_string = line
+            return True
 
-    return CRASH_TOKEN in output
+    # The input did not trigger (the same type) bug.
+    return False
 
 
 def minimize_trace(inpath, outpath):
@@ -66,7 +100,7 @@ def minimize_trace(inpath, outpath):
     print("Crashed in {} seconds".format(end-start))
     TIMEOUT = (end-start)*5
     print("Setting the timeout for {} seconds".format(TIMEOUT))
-    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
+    print("Identifying Crashes by this string: {}".format(crash_pattern))
 
     i = 0
     newtrace = trace[:]
@@ -152,6 +186,6 @@ if __name__ == '__main__':
         usage()
     # if "accel" not in QEMU_ARGS:
     #     QEMU_ARGS += " -accel qtest"
-    CRASH_TOKEN = os.getenv("CRASH_TOKEN")
+    crash_pattern = os.getenv("CRASH_PATTERN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
     minimize_trace(sys.argv[1], sys.argv[2])
-- 
2.25.1


