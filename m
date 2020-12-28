Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D02C2E346F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 07:05:46 +0100 (CET)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktlf7-0000Vy-BD
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 01:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXf-00032L-JZ
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:58:03 -0500
Received: from mail-oln040092254014.outbound.protection.outlook.com
 ([40.92.254.14]:44241 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXd-0001k9-OZ
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:58:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJK46GGvXZCxXmmYI9FQfEuadMICE9Ru9oAkMd29AeSsjKbTZgq9pauxep08+0RECpZzXwUQkfvazsRP9u2x8JebICGzP6mLyfemQGKv0XayRltiNbrNqmaZ/lpHPqUteF6dqvuOq4agGJMCFgwUcv6joZedczMjn9wL45JO3Rf08qGTfrg5m3MLrGWmAe/uunY6ha/liDEem7oNB4JO+xnt0uW4cCAaLOgBFzl+1ZfxdwOuaMGvfLPLX47zkNsKSKuBSQNQYuyhSn+boW85gg3yA2i/apEOqutg2mESetB4MWUU5AjMjb02iMfjlPDUCnPz42uClIy53yHtTa03Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kukI1o8KbIFeNFPrMKG/4Qht3ke+jRbT5E51xZ+sfMQ=;
 b=SPcg5NwKuTxZu6pvTRovSqkv+X3E7Anpj6J+fXJnex90zLqsCdTbCMhlh6IdkSeP6M9pgOKgPIjFaOPFwUYYtxA5U4b729Xx3s3PvIbWchxTsM2jQN1djKPgVVHv1W+cHMpaSaDuqs9RDlcIYWycmmG7Nt5y24ndVA6pyGe2fdyZ0wgxx/bjE7yozMYzZhE5eoxqAreM6lbYltiF3vH0npWNRlaqFWoR4p40D2nWchOAZ84xNxjM30g8k6+LoyJDs5caxlBci2+/UlN3+BqnB0t6jkETn2NdS6oypmaVfJp/j67mYgvVBdsGAenB1aeIB7XWGEBfu+gkMNT0IJgHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kukI1o8KbIFeNFPrMKG/4Qht3ke+jRbT5E51xZ+sfMQ=;
 b=EvadugHKvrPr74FHkEqLlk9YpparnswU8JLI/I2zkMAFNfKIPwNzy/WK+UI0UJI4Hi0KBvkD6Q4VAhAssENm05CeN10UL8tuvY1K0I8suT6YhwD+jCdS7P2fg5bLyFeKmdbXYD2ZcuLMd9lC8O/952jFMMirz/xRHnjHq+a4FD1Vi+Zbe3OVM3NUWZr+jS1OfJ2eJ+klYfZmwfrTiXKzmJBu0KU1/D9bsL2PjvrQyTTQ8xqNmvfWODJFZvtXqdilZ47F/yd07Q94Z8EWfDhhmuLyGNUQBF1Vgk+/YaAAJbTLg0OpqrsG4tS3pl5izloZ/Sp/YpQ3hLV5g8o3XEms6A==
Received: from SG2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::46) by
 SG2APC01HT086.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::278)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 05:57:48 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::48)
 by SG2APC01FT037.mail.protection.outlook.com
 (2a01:111:e400:7ebd::367) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 05:57:48 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:27114EAC282DA4FC7C3132E8674F750045C638B50FCCAB488104C8C24BA61E17;
 UpperCasedChecksum:0C78EA6D43D6E512E11F4AE64040A69792D32F10B8FA83A5947D3B522F6A16FD;
 SizeAsReceived:7658; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 05:57:48 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] fuzz: heuristic split write based on past IOs
Date: Mon, 28 Dec 2020 13:56:46 +0800
Message-ID: <ME3P282MB1745A7A4C940E515BBECBD43FCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [nwPTw1kI7r45AX7Ixklljl2O1QzpmU1rcLj6ieNn2NFkJImxZtjncAgdBsVZ/JHV]
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201228055645.3666065-7-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:2110:d78f:cec3:aac7) by
 HKAPR04CA0005.apcprd04.prod.outlook.com (2603:1096:203:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 05:57:48 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 214c03ba-801b-44a3-e223-08d8aaf5816c
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiQjHo/KsCc3LvvB0a1Ll3PYS95vrscV5B+BJ/DRHyxuxnsK4sI+pjoqvNEYv1WlCfvVfXv5T9bmD55+ttracWgF+YcqGWkiIRclMrzZRbxoDzP6NPBrSI5uBzruEfzqiEwP2mM8bE6kb3QKh16mw9FFdXy04TmuylbAArC0xNLQ3MggG59bI9VfzehJxQbvBeV8GgtXyspXzRyx7y4qksI0uu8rQPDuBNsSTviubz/Gkz3iCkUyV//ELvq0kIaLMTY8owFjICw8NmCxPwWnMzhJficgQ3w9Q7HF20PEbRJ26ebIYrQieE/0vUOQ8F73NBqhMny5DV4qPeTnIpLksg4/OId3izRj4+S5nN49EVgnk5Qipl6vKC7I6SMPtuo6j/qbCoyOCX8HmXqGcIQXxzp0X0HVuLTfe/4QQcCMVO9I/eJSoE71n+YdoS15ZyP+7sE/cMTla9g52vx+qDfo20/bXUsrOg/Vr+JMs+8IOikIhqJerTUawfIZV64gOAuugOpRwe9NEzze2HkvL9239cK/+kHpEm4UTOP47g8yy45FJjXsLi0ktENDynKuoXUsNA3sBhuGp7soOuLThq6TH1slbz+lFXfWs4gutEOHKpYq3zZdx3zWicSogLrNT1Z7fOD2wDqEfnt9zFiKae7eedO2lVkt2Ce95s5XAzsjVbT+22LoPoZ0y8ECmkioATVXsuPPNIHIj7dV3CCfUYGmSUIYTaaRF1nUDnzRH/V77rHBHpTsRKerog7IZhFA9nLHjEA=
X-MS-TrafficTypeDiagnostic: SG2APC01HT086:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJATc8QT46LbixW0JvI4kBYC6bmEa+LJ1jnjeuoTL2m+0Kwk2eruHpxJrdxqHBBwK3aOC+cAP+yo/QwkU+JfLW3TQa/gpWch+F0X6aCym5dJzg7DNI6/A4x3JkCwoWcRYktET389D0wQNVP8kxI2QGWwyz+GJwTbhO0pHGXMSMjETEeHTWswfri2omNtwedyyXLk41+Qv2eNLywYlXItkZAMs/SdRFRFDJZOxZ0BRYpm/d6Uv0a+oCOlhzBLPrr5
X-MS-Exchange-AntiSpam-MessageData: Yp8qYUorWvkKmE38q/V4wwE+qlDvc3umyp+SnScQZyq4Ov8XgXIItgafLmtJMl+k3gShNn0SWZDdQudLkTZYAudzhXBy9lqj2/jTa+uI/9xKOCksp6mvXtF8e5bsr7Lq5TomMJn8ahlj267riFDpkw1OMW0MouQwM1Bse/h+06M6DlzPhBwgkBjH4OebX0pJnkmhOMib0NMNpVQv0+tTMg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 05:57:48.7095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 214c03ba-801b-44a3-e223-08d8aaf5816c
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT086
Received-SPF: pass client-ip=40.92.254.14; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
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
index 7947eb1d40..98bcd0cc8a 100755
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


