Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C62DF12C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 20:02:21 +0100 (CET)
Received: from localhost ([::1]:60704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqhUi-0007FR-Ro
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 14:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhPS-0005j9-2n
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:56:54 -0500
Received: from mail-sg2apc01olkn0805.outbound.protection.outlook.com
 ([2a01:111:f400:febd::805]:6102
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhPP-00053y-P4
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:56:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0M/aQb4f9VLCdpiVP+gw8kVq5O4mVm6vhgZHsMIp8wck3BsomuaYXuhj6d3SonIngKKbHBTKUo9RgzgZgxQNAj0Gz0fkGvvVsLIBXcPOPEBunW9LyvvTIFCCoYXfe6Cpl5R4HuI12OQatKfwcFAiiceeJSzaYpN4q6yFyQQZv4YdFLUoeJto+zKwHSRBI4VD29IZ5z6aeHhQxS7+HdBGJxwh0OCWNtFQBu61XY9bNoIel/SXdkLeKsgCu6CvLbMKuOQ0cEOXAOaTNS5HYjODMbOijnnMDjZJZ1S5UmdeQqa1LMOHbzDrd0A1LT09qPtchTMGC8+IUvRFds6rXfTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4COuRNlH0U3x+uAA6WkZnDDGyJnIzTiOPY2Yvmjv6Y=;
 b=MlmG6w1yeTPr7jXO68K+KxB8u0y9fip+dFzhc9isOIIfnAG8CWFi0XEhWeV6x3aVqK31SDnWIWVJfYTdTaalkqmew2lCu91UcVrR3jtwL+uOYDPJ4TlOuAEFjQh8mQorOSB7wo8bvs90zEFqvxA81pium/APeW8CR/HMfzLZBFnL1BIUxnvv2akrna1gMAbul0AD8BXTt50FLVLjODkFNG+/qRam1VECXBLHh5qJGjlkl6kIeH44ilLv4l3+2ESi0AidpNQ/CP8Im8Q+ppOG8uqZUXAgU43soo3GkOJSOHNgUx9g27Ens82U7gWrH9ODDzWL1002qXh4nw4Lwrp1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4COuRNlH0U3x+uAA6WkZnDDGyJnIzTiOPY2Yvmjv6Y=;
 b=TSn36DNY00hv3nF2O6spDEwiJ+rgOry4snyuW8MRNTftcfW1kfliFoz80P0x3CSLbrUI7xmkF1duPi7U79Mlvee9BvRiXI6/f/aH4aYAp92NDHSe6lCIxFY/oFFOK2oQQ3Dfb7bKY+cpeVdf3ibcwvEcsaoUe5EQmiytD2Z0T2Z3Kmxe8sk8cEYBzWphl534fYhHTkU2Sq+nqeYOq9JNzQXbs1YjxQYjOMLzRrnJTt24Bn/t8+t7yPJLmjeVPH3eWaOyDTNC1dhgXRy1M6wCNxnbt2inNlC9XdJ0cKzyGTwJk1+vcr+vlJ7KEp88QR0EpPUYOuxp9IDk0sxnZpaJNw==
Received: from SG2APC01FT053.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::52) by
 SG2APC01HT102.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::253)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Sat, 19 Dec
 2020 18:56:33 +0000
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM (10.152.250.58) by
 SG2APC01FT053.mail.protection.outlook.com (10.152.250.240) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Sat, 19 Dec 2020 18:56:33 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7782C5DAF034113D8BF60F55FD3C7979E032494DABCDA5D9949D935A44E2F80D;
 UpperCasedChecksum:1C4A6562CAA0035725C4004B66DC987367855FF74B7DBFE1E2D0AAEA11186482;
 SizeAsReceived:7644; Count:47
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7]) by ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7%5]) with mapi id 15.20.3676.025; Sat, 19 Dec 2020
 18:56:33 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH 1/4] fuzz: refine crash detection mechanism
Date: Sun, 20 Dec 2020 02:56:24 +0800
Message-ID: <ME3P282MB14924A6558A105B7FBFA579DFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Gz29zdfRJ9CQqjVM072V1OkU6mnrPpQ2F11iposnh3trjv7w/s6cn3eha9vikojL]
X-ClientProxiedBy: TY2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:404:42::31) To ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:a0::14)
X-Microsoft-Original-Message-ID: <20201219185627.426615-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:1079:e2bc:42d3:a57e) by
 TY2PR06CA0019.apcprd06.prod.outlook.com (2603:1096:404:42::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Sat, 19 Dec 2020 18:56:32 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 65e94c4e-1e8a-4cf9-5c63-08d8a44fcde5
X-MS-TrafficTypeDiagnostic: SG2APC01HT102:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8gv7xPxhDJbSGfERRoKHqX/PlnGOKmRkLnS3LGxR9e9aLtH/QrEqo/DbZoSbsOy9BeUlfFg6qYcyAPmIkWKl/WjvvU08/CgHhSdwbL7Oo8ObX9BeAZoNSFAK/ubKpLyUNu4qUukrcUtjbPb+5gsezsNRBqx8QfQ1XYiUWyx1fr5pBCDHSY+M65LcqdEPp42P50PmwAtfdEFSSmJRc2qCIEcS+2QSLhDi0fIlM3R+D8iOa7zGJdCTdWG6RKEx9CfoOCmSbHRkff0zn7Cthtj0cr6C6YmGg+oHmunht6i31m0=
X-MS-Exchange-AntiSpam-MessageData: DlYdASImjoKS4I97RQUs1HZsb76rcap8LnfB2KWS8T4cNHTkQJP+8b+EFsyJzKhKxXvjHmLNkaNsHSeBprVy0HnScxQLODIVvKJLkt8lHkjXI2jtMqqEe4MBUnP9ehq3fs1z7dBuKJ3HwMozoBQqa4gTPZqw+wVllfYlLCx0CTglf3RVmczN1qcUYEIk7bea67T/Gd7GH2Bik5gWCZNGmA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2020 18:56:33.5641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e94c4e-1e8a-4cf9-5c63-08d8a44fcde5
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT102
Received-SPF: pass client-ip=2a01:111:f400:febd::805;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
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
 scripts/oss-fuzz/minimize_qtest_trace.py | 59 ++++++++++++++++++------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5e405a0d5f..d3b09e6567 100755
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
@@ -66,7 +100,6 @@ def minimize_trace(inpath, outpath):
     print("Crashed in {} seconds".format(end-start))
     TIMEOUT = (end-start)*5
     print("Setting the timeout for {} seconds".format(TIMEOUT))
-    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
 
     i = 0
     newtrace = trace[:]
@@ -152,6 +185,6 @@ if __name__ == '__main__':
         usage()
     # if "accel" not in QEMU_ARGS:
     #     QEMU_ARGS += " -accel qtest"
-    CRASH_TOKEN = os.getenv("CRASH_TOKEN")
+    crash_pattern = os.getenv("CRASH_PATTERN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
     minimize_trace(sys.argv[1], sys.argv[2])
-- 
2.25.1


