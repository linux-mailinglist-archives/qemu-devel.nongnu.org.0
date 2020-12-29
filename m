Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D85A2E6DCE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 05:43:54 +0100 (CET)
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku6rR-0006aq-2s
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 23:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6pW-0005LH-SU
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:54 -0500
Received: from mail-oln040092255064.outbound.protection.outlook.com
 ([40.92.255.64]:61472 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6pV-0004kD-2C
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByszR5Eg/i2UkwyzKiICblDPmm6lUoesLosCa8W1/X/oG5RZ9oWsA3c59pyqceKOnTRZNVIWkn9xIS1TqBWDRBtyvTNl4rrFoCsrhHmcHvU0M/MIuK2feVZe6amF+cH9bgTWTOWnXQExUCYh7Rgr9DmH8Hfxcs4LGFREl3msaUCHFJXE4VDMSTJbVekjVAR3nAbmL/pnpX5kJ45HTPK2BsO1YcOK7Iz8+N3nL6n7G8kxagC7DvuQvKzF2JXpDN7YfgODZI7/bYSNRNRII3Eo4oiB0e1lfDNmNggSs8Ef83mMQ9I0ovEamUfiW8y8mRJfswWES5U19O2R/r08bVbprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eam7v6KP/A9AX7ABhV9voi/p1k7ztgEpYwwuTaaksI=;
 b=C+z1MTViMwcWzAvteyYmH8UQCegGUFkQNG7Ftq/2wQxDDtDapaFddhRJuIYNBJAkqRcRV7cWVI+H5d7Jrhbib6n0f94P9sbAMCv4RnMDmQLOH3hA66T0UMQ2hobc3+OGBMFE8Ewo8drmUSN6+cglJD4ILBwChLETAsMZ38c/u5bLrNXz2EsOl1Y19vzOsh/eLlDxtdo3zrsLe19LoSO0QAsc+yGyNi9HlpTk7OTNgIXOQeBgu0f7CPrCmHBW6wrk+6dBk2do5H08cX6wmIKBKib7W/ezlazzHa3R/ziXmoC3VDu6cLiEK+i72nowK5bxz6kf7rVZ8OwVxDYS7GwzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eam7v6KP/A9AX7ABhV9voi/p1k7ztgEpYwwuTaaksI=;
 b=fJAZ9dD/ruAumsi14fH7NK7PtqBiYB8737sMAjuSHL+Wa/ZtaCRj72A74M38pmTtCqju7BmswQNO5ZM/Hl1eIRo3/yegp09Ap9W8enO17WRlTdqCrdLYEyHzbIaa5hFEKtK00V3XqljjbGA+a41f+fPl/MUcNFA5E3aEiWwv8u98b86KifRiQc3jBVi8ppdB7wuTRf+97tXt513LaZVb/FLqM/UpHzrIy6BKmyCB4rm0JM0wMu2N6jKcI6gGGM9ZlDb7IZivKOcAekc3GZJcjPxyccn4XA0nCDUtkhfWV9Anwf46JGDoRgFTkj01jRTD9E+DlESxNIwG9kZEXv1Vaw==
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::41) by
 SG2APC01HT138.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::436)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 04:41:41 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::44)
 by SG2APC01FT025.mail.protection.outlook.com
 (2a01:111:e400:7ebd::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 04:41:41 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DB7C933314428AE2670398319F3042D3D6523734E6941B8A7E0F05581CD62494;
 UpperCasedChecksum:2881717F600188A005C6F66E863A5F96D5A3206B58ABA76F45C5837968C4FCDF;
 SizeAsReceived:7668; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 04:41:40 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v4 7/7] fuzz: heuristic split write based on past IOs
Date: Tue, 29 Dec 2020 12:40:44 +0800
Message-ID: <ME3P282MB174588DE27F32E918F71DA1BFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [nZ0CUZLx7DHSAsKDW6bkwbdwlvwh6/IFrDqEMp7D8dyMGkIKu8BDNjN4lFQzwYAS]
X-ClientProxiedBy: TYAPR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::32) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229044044.3706227-7-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0068.jpnprd01.prod.outlook.com (2603:1096:404:2b::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 04:41:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b778307f-02cd-4ae7-c2fe-08d8abb4091a
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiRaJ+ox6yOiFxhBa7ZFYMmi4iQ5j3/PO1qZZR1+ERXa7c14KBiBQlvjDnb1ohQ3kuxqR8PbJE4mRYo0HxV2P18Ag6qJQ6DiR4lakRgX8oX1+wSTk1xItVVymBUzO36qDj26KL/yITKqKs5uHBy6yZCWizLnFt6l4UcsVeMZ4JBq5q+gUCD3FBS1Xql71kZ5getXpCTP8m8j8NQ9g/NMKI8qXhZ6HcKb+Dra+vZIG1ykx3B8fGelMtFRLfNtLlvqvxnWA4O9z7z2q2xC6B4+qQGmTc7F2dfElq/nwjinlVJlQ546Ts0twL1wK0mM86vnrBva5qUBDJ//1L5qG2dQBdOasX/BzqjrAbUZTRxLGM6dIbhYddvzD7+FFghckSN1CnT4TIopfd2mtIn3K+xv4dmAW0LAGIrUAaiDeJD+5gngfql2R0gdDq6oHf11bOV9NELHGP80lAMndsLOCK7BUAOaUoGKtfVxcmaqbQluHO5CTV0Ln23+v8PMem9hFh0sypsrmdgFI+g+SSywfVK+WMnWWkxasCSILGKSu7VerJ1LyDkxKZsMrRBRti4soaJPeczv7Qdj/YDJe9IoXtZ63UJaTPLpeZczjI7uCCBHoXZ+ztaW+VPCIH0kLjm5lcxrvsneWFmyUU2hP5d+z7f13f24jdLx+q+qgeD3oYdTK8uS84vciFG5iDWmNq9dmegImTL8VTuEnWJzrdn13+Nj6NqLWYT7mzx30EZPl8WywDuy3RoFFSC84RkISx8VTWBl6yA=
X-MS-TrafficTypeDiagnostic: SG2APC01HT138:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8IrLlZwIseZUk8exP7HVTJZBCqVpr10YQOs+Uf7ebApyRvFEtxe3LDvTd+tKq6g4+84wfDHhlU9m0iIXmX8QXgElQpIHPOlxP/eT17+3sok3LBXvFx7yrVyLfPdultUTvO0JoBx44tt973fCHJzM5M9R5LdJ0lo8335jCpkQr24/zbJlf7kjOJl6AxDUkGji9FUB9o2mc/ZFco+sxf3atZ1pc4t7Jata6oHSUL+mntfonhhsuo1VWIL2LQ8ag4F8
X-MS-Exchange-AntiSpam-MessageData: UjK1t+dFmHqq6jgiMjHcBmbQ19pHxxRe8Wgne6BscVGSsXkHfHV6t7/SPveGfDuUQ6m+o/BzRRCEU2c9jkBuwQWMc4hHHiDuKHrMN//m1jpA46gmH3LLfBJSZU0WBjQ005K8AAj8Ht1db6TleBkGgmobU7Q/txEznW6xrnNkOs1S3tsho/p6aQ/k+Q5cBpgb/wnfy1prkDnizWom2jBhAw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 04:41:40.7848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: b778307f-02cd-4ae7-c2fe-08d8abb4091a
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT025.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT138
Received-SPF: pass client-ip=40.92.255.64; envelope-from=Qiuhao.Li@outlook.com;
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
 scripts/oss-fuzz/minimize_qtest_trace.py | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index a681984076..6cbf2b0419 100755
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
 def remove_minimizer(newtrace, outpath):
     remove_step = 1
     i = 0
@@ -148,6 +185,25 @@ def remove_minimizer(newtrace, outpath):
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


