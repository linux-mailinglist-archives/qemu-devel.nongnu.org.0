Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8CB2EED87
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:44:46 +0100 (CET)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlVt-0005D4-Dm
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlTR-0004ET-Cy
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:42:14 -0500
Received: from mail-sg2apc01olkn082d.outbound.protection.outlook.com
 ([2a01:111:f400:febd::82d]:20208
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlTP-0000fr-N2
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:42:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+n83vPmBZO/O40E+qeHNqev2RC8rkGO0oyGjPgcDGo5msngr/pWwEGoZnf1MabHXMCVvaZzYanQloZU4haD3eWyZP7ddEQqrlTemSsivOI30IzLCo/4pOHcdQoZDWs9dSo2e3NF9nHXyeD5pMnBWpOz02KptIA0dFO8Al5qIHVujXiOoVF9N1ngmYRzmJyllvLEJOoOLX5Ksp8VTrlcCaAw6KnPspzozqIQEBUqrph/O8O6LpfZgpD7/lWdu2nCgEx6rPr1eiiGHhKVQp+6SWMqMgdftegrY4wgC0FkACG8ztwRF7dC6ezXkupXX8iL0JeMnFkZI09Kz6FHL23e3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cu9eeRDkUNgzD5Sxv6bAWMSNk3ZwO7FBGcQO0e/UC3U=;
 b=QMTWXxgwAJ2JrscujzdFbspWbmq8JJdKZJNoyaxWnemNE58G3G6gQioBSrQkn5hCRElk2twD75A0sIs6IY0rOn+My8c26HDOD3ROxemfyNTl64lm/l5hw9E6u/6EFJlWoEaQUtu+VAMLmTp3/9KBgq3cjoHZ163v0jQ0cT5xXtm6u2ymXu0xLoW/6fE+3cLmLGJlgOT1Mb2iBkkOY8zSRhrXW/4iIZ/lXMCt3k7NK0qTMwaWKuXp++4MvLzUC8PpLWu/j7EvahZrqwzAZ8EBAyzlocbyufudtYli3KrVcIvfK0TQ2LVFTqoTKnVmD49ecadb9TMwJsLsAjU4w+BXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cu9eeRDkUNgzD5Sxv6bAWMSNk3ZwO7FBGcQO0e/UC3U=;
 b=FTT6rPutjdv5QHvnFvopH1oTh7QG46HYT4zDtZ7tCfGeoBUEbkJFT+d5OjwJGET8yUIR3WZtWYL1aREqa8j+PUutITTC8aPdWpXuZaVGIJio1O2ylKexBcykUhyeiyHYwDsXLkdMIvvh4TMib9WCrzBmPLL8yWgZa9VwHb9s2C5RVzOVb0stufiPjSjvnAP6d2412q5epUkeDG5fQa6FCHw7u7jJLcUQkw9CKjfaCD07/098VGcIgSlVP+/mMRJuXQfAyQysM1QukACGjwehydH63stUWilGZRZcHLmY1BxKpDnuwaKL2cW67d8TqlyY18Qgl2XXcjJ6b/+tpOnXmg==
Received: from HK2APC01FT049.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4a) by
 HK2APC01HT022.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::376)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:41:49 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.248.58) by
 HK2APC01FT049.mail.protection.outlook.com (10.152.249.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:41:49 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FC26241FBBE71D79A8C06EF949CC5366B98CF773FD24ADDC590E1E7593392473;
 UpperCasedChecksum:2778D213E1CAF12C2C3B6D1B7E540223C8FD5FF0AA06ABF5192CC58FC7A5BC4F;
 SizeAsReceived:7677; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:41:49 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v6 7/7] fuzz: heuristic split write based on past IOs
Date: Fri,  8 Jan 2021 14:33:31 +0800
Message-ID: <MEAPR01MB34944249FC7DF106543BA3ABFCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [OId/YKAN8HDIjj7qKcsuMe87WBhx7557Ptd5+dd1D/fhZlnA5cc1Xe5Tw4BdKgfK]
X-ClientProxiedBy: HKAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:d0::28) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108063331.17035-7-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:10c6:c22f:85d6:f9d) by
 HKAPR04CA0018.apcprd04.prod.outlook.com (2603:1096:203:d0::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:41:48 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5e939182-f38c-4b80-7086-08d8b3a079c5
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwhVEmwSfFHOGHjTc0/O1ppqjSp8wfTbi/reQoe56AtEzST12vugJ8la3bQZRgNZYf455b8N2B36wKwURrn4VkeW6O6Q4P4Z+cKWCIO8sP2DeecHoZVa3SW7UJIZB3RFWEG/kmNwov8LF+xqK2yhbQql7ZxC9FWa/5+QiBeyIumasxXI9HnoY3uwb9Mnghf0C31h3zy53ObiN3RsaV5M+ValdTiWll6vpYyrISyBe0e/CtsYNGVdv1Lcr73hMm49JrK81T8+zOxB/rGL3fIOxEWedM5Bvnl7JIvaMBTxOQLsVh/h0hmTEehSPGEx9pjpquNbhakSCXjQqaKr1vVaqbUqo+8KwZaH/BoluYL2yuAac8c+hcHKO3uhX3sYPcA5qbJmjWrIwMlJLckW711Wm38zur0uCxr5GLvFhoHu4WbwZROQTFoHfXLp6H4YoZVtTseqyf4MQZMBoECqQjIengSHT9+nmUjx9u0eVMKGevVnz5rTT5Fx1nh6o7+krPJ7zFR2H/dkJ5dq7i+vuG76kA1b9IBPchVs/rOZDPO6bA1iw9sC4qKLQmNCWrv4MZEZWczEhNRCooCr2pkloikSlusqVh2uzJkGpTk1/oiDq/vG0r3L5+F1j+g1uxmVdg9WMk3y3yeg718X4BTaLnHaSAH1x7RNj/Q1w252aM0ajQyewxQIar1CQT3vC8ngiDeaoKGg3ApjinE2WOrvtlu/uGnURReNU4eYKhiSMHofWkMVk=
X-MS-TrafficTypeDiagnostic: HK2APC01HT022:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qsK31uiQsq0z2oaJPdWCU+UsLaT9k68HH9INCbH2srvDE3RR7Oh8MUKmPaboDnV9VtXTfEF4xbfky4Tn5B/aqoyLT6N7QfY+bgmcduYBqW9exmKLy+iiGzEdLPr+3EE2/M/wrGqVy3hQ16fLpBcDxN/uXxIIJVrYkoH4VbUTr9hkQGRH1jONEtdgoCgYc2plMGkD2RBvTr7ylS15WexJLR3w99f1/pPfBvKCbXOZbnLjvypFqqM+TMYns6oF+bae
X-MS-Exchange-AntiSpam-MessageData: cxMvQCFQOLuInbf00a5CVuQzu6zQ7UMTZ3CfGgZRiYjnBLKOWGS2smoAeKixy+4hb4eI/1ASw/3Gx5cqtAx4jMxJeKSenpN72+NtZXWGv6mEW7CBYgUTK25TWq/+KvSGLtJICGol/8TwfR3duxwV7EhCKvApCLGCo1oEOchoUurKVzf9nEPZARStXLofV708dOy24NHYryyn72PhI49pCQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:41:49.1737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e939182-f38c-4b80-7086-08d8b3a079c5
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT022
Received-SPF: pass client-ip=2a01:111:f400:febd::82d;
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If previous write commands write the same length of data with the same step,
we view it as a hint.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 8661116075..408ae2ac67 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -85,6 +85,43 @@ def check_if_trace_crashes(trace, path):
     return False
 
 
+# If previous write commands write the same length of data at the same
+# interval, we view it as a hint.
+def split_write_hint(newtrace, i):
+    HINT_LEN = 3 # > 2
+    if i <=(HINT_LEN-1):
+        return None
+
+    #find previous continuous write traces
+    k = 0
+    l = i-1
+    writes = []
+    while (k != HINT_LEN and l >= 0):
+        if newtrace[l].startswith("write "):
+            writes.append(newtrace[l])
+            k += 1
+            l -= 1
+        elif newtrace[l] == "":
+            l -= 1
+        else:
+            return None
+    if k != HINT_LEN:
+        return None
+
+    length = int(writes[0].split()[2], 16)
+    for j in range(1, HINT_LEN):
+        if length != int(writes[j].split()[2], 16):
+            return None
+
+    step = int(writes[0].split()[1], 16) - int(writes[1].split()[1], 16)
+    for j in range(1, HINT_LEN-1):
+        if step != int(writes[j].split()[1], 16) - \
+            int(writes[j+1].split()[1], 16):
+            return None
+
+    return (int(writes[0].split()[1], 16)+step, length)
+
+
 def remove_lines(newtrace, outpath):
     remove_step = 1
     i = 0
@@ -148,6 +185,25 @@ def remove_lines(newtrace, outpath):
             length = int(newtrace[i].split()[2], 16)
             data = newtrace[i].split()[3][2:]
             if length > 1:
+
+                # Can we get a hint from previous writes?
+                hint = split_write_hint(newtrace, i)
+                if hint is not None:
+                    hint_addr = hint[0]
+                    hint_len = hint[1]
+                    if hint_addr >= addr and hint_addr+hint_len <= addr+length:
+                        newtrace[i] = "write {addr} {size} 0x{data}\n".format(
+                            addr=hex(hint_addr),
+                            size=hex(hint_len),
+                            data=data[(hint_addr-addr)*2:\
+                                (hint_addr-addr)*2+hint_len*2])
+                        if check_if_trace_crashes(newtrace, outpath):
+                            # next round
+                            i += 1
+                            continue
+                        newtrace[i] = prior[0]
+
+                # Try splitting it using a binary approach
                 leftlength = int(length/2)
                 rightlength = length - leftlength
                 newtrace.insert(i+1, "")
-- 
2.25.1


