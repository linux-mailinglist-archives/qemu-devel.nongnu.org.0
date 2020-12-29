Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA4B2E6D32
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:16:01 +0100 (CET)
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku4YK-00030C-8v
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4Tu-0008CE-KM
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:11:26 -0500
Received: from mail-oln040092255056.outbound.protection.outlook.com
 ([40.92.255.56]:56960 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4Tr-0005hc-J4
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:11:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu+b6B6gfwV5wZDqpwLd7rLCngzFvwplMd9LJlc4kh6HkMmGKg78RbX5VZUuJpkSYsdq2w0OAxY95ATqbewnRa9Uysj2va3KguXhb8SJxYebHjn0/Emlr7KPXxl3wWeFae2W/OlI+G+b3kcvDBMKCKeICxrg54nhHsP7w8ypBkp0B7lGhzAYMl4+6eYpuWYqj9+HN3VTJcAcHhW7ONU1PnTI5aRR7WZ4hE0RQiMmj0ftXjMhIWLwqZjIHrlQcyYuIIZ/GTthgWS4cTPhLNK1YMuQfF5OePBNAl1RCOAeo9p49o6vhHC2rTPgsbCHqlBbaHUFKuKPNZ9G5RtnnCKViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lwq/Wv2Xi8oD+fI0lO/167munApcJZXUgnXwZCDlFZA=;
 b=SyNSwqwZdO9lyOsEUWeiUG0TIU2NlrmzFuXKqH7dRq0xNCUw7A6w0bQJr+jXydnOLrhiAfO9cGBwpkGs7sgPuRWHsZo2DeRiGoFhosOZ4kNcoh+e/+0j7F2AiAsz4wa6Hk0V59AdDmmWiCOr7B6fioM4kehI72/3wwia16t26y3TStdFFurlydzywepW4BEH2RjUKKCFwRsRL8ROVRuubp2khJ+2nJcJse5S6XZZFzLEzOPkRS8qI3HUFUedaLoALYzstfqVffN/KFgTihIXaS2Jg5hQrpLyNPEabudYcB8xN+V4oUP1zVG6M9jWDg5vzzLc3k8L5JyDm49cSxGXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lwq/Wv2Xi8oD+fI0lO/167munApcJZXUgnXwZCDlFZA=;
 b=W5dyoRKyEoxeoRanUza0PeEeqG5BI884e5PaFcQ35kdDvdGlmkraIpl52MGUBDUASeZE995bzmQqqtmk3Cq9AIOWM0QJkjyI/8KOBV++p5HzEGHtpwnmOV+VTw9gO3pZ+HPolPGyFDyR8xm7M5wXODf9dR0xCNWCm62J4o9cY9MTrv0hs/jUeD7EQBgrwllYmoQrIamkVZPAG4EgeX9HaSQc2VYD4EB7Ekoohb5KRKuA5kV1C+z9l05h0ELLWn12Z7WrI2z0bGBGm6j23RAMP4t/JgdLwdAFTVY0pEgRVrIHjZJijHCTpIP+5ITi/JWbCll3L7223Mw3NR3enKRcAw==
Received: from SG2APC01FT031.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::43) by
 SG2APC01HT210.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::471)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 02:11:06 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.250.54) by
 SG2APC01FT031.mail.protection.outlook.com (10.152.250.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:11:06 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BA458ADE3EA70CC96A43C445345A00FA1FE4A7C7EB8667D0FA476AB308339114;
 UpperCasedChecksum:421C27A553187A4AB298E339C731E45B812E419DC0D65EF0D2E904424B17DFEC;
 SizeAsReceived:7657; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:11:06 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] fuzz: heuristic split write based on past IOs
Date: Tue, 29 Dec 2020 10:07:13 +0800
Message-ID: <ME3P282MB17458346D25787EE6C301F5AFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [w0Z9rD0rmFIWf+z3KjOnoGyiOj9hQaDfwDBzmTdDSl8LqEK6skroAcMCVQmkmXff]
X-ClientProxiedBy: TY2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:404:e2::21) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229020713.3699486-7-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TY2PR02CA0057.apcprd02.prod.outlook.com (2603:1096:404:e2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:11:05 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e631d7d5-d9f9-42b8-6468-08d8ab9f0067
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiRaJ+ox6yOiFxhBa7ZFYMmi4iQ5j3/PO1qZZR1+ERXa7c14KBiBQlvjDnb1ohQ3kuy+SB5vrHLJ+v24C9Hm8k13v1X+ylqaNTZKUMXW1QawnWHwrt3OPIa+80kJWe56nSfVYP/9hAHCr40CDF0/hmMMn/ql8W+mRtsoxwxM1ayXYR4AqRvg87/hVLrAJB4+k1duZG6kW+eYxQP5iucEEze8SAMW4RTFEyqvLa4318g9s3jkEISmEPDYg4qvDNXKBo+AGY2uhYwb5Nn4N/t8NzfB4zm/DbZWTit007t/RUL4vcAsjoxDWv9Cbi+f+cwD2O0SMjrlWKmCARYUL1Kf9XmT5YfSHRHvAFr4ggA47Rg0dL9Bv5sj1/+qf2pNQgkRhWbOdzT679fYlpnOmBvaUxmeQDcjPubE6mcUJQM7DV+hH0VxFAbXV6QOZ8x2whzM4FTlUjNhFwrsrMVp4IoEIhm7gcJiUWXnnrz4BHAh6jbYcrrsxxEdfVmv8UtpzXSTGYG0GqXU15udWTvkXPVRUXw7G2qLjNgE8IZJFfsRmC/VAUKmz79aWh3pQHmKZmVOTKT33KgeoK4lNMbpBxyu01TMXOw33vj7Uqef0XmxA7xgNfgNXifCCxvbCXrTvu/RAvtRQvfpvKakH8rQAMWKTZjhaQFOGLMmTqKFzk0SVFbnxhtuc62HTbCpUHGjLJVFv0N407UiG1XgMnMUMeg5O1XoHte0c0RP29Ss7YWuNb4OwEj8qaPKCX5HR/ytEj560gc=
X-MS-TrafficTypeDiagnostic: SG2APC01HT210:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yY8yHRpDCWSTEOigbASp9eaXtj2qSsWWtWUJ7jLxBzHPC7kbfxZ6Gxu59Foj6+am+RNoIA74K/jHVCFYCiX1NxA5UCzVuG4HhtGZ3EdSh9fgS103ss0hdfwb2/dWjSs3Urz1kO74Mr7HT+Q64hzQRpuLe8D3OjtbCK05Kshe4xG990E0qe2Tjuk1DLmoJZlerdm2wkRjJo0ntFgoDy7acsftQSq8rYGF6gtKFXmYbCxSyDU8zqgBPgAd5EmGSGRT
X-MS-Exchange-AntiSpam-MessageData: 59dUYIHR9dmbz+qezYUjvpCwJLoF2A6UinQHh2f3qKm+hQ0pK0OPejdhCh/sNa7alzMshKOHgFyGAdIY+RmpEdDZN2h1lKfrw6ZNH0Bh6YnIJZPwcTJZuydfPRrz/BPiSG0f4yXAEhcdSMQaPCSCx+sikmbm/ca2Te8gOYkKQitZDkQz0JisBipoX/rjuRrCAbyOhe6Xp978KpipAjoEUw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:11:06.6705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: e631d7d5-d9f9-42b8-6468-08d8ab9f0067
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT210
Received-SPF: pass client-ip=40.92.255.56; envelope-from=Qiuhao.Li@outlook.com;
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

If previous write commands write the same length of data with the same step,
we view it as a hint.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 050b9f2195..5a8e90a604 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -83,6 +83,42 @@ def check_if_trace_crashes(trace, path):
 
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
 
 def remove_minimizer(newtrace, outpath):
     remove_step = 1
@@ -147,6 +183,25 @@ def remove_minimizer(newtrace, outpath):
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


