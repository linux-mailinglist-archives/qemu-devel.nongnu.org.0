Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218352F0766
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:25:26 +0100 (CET)
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyaij-0007kz-5h
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyae9-0005Ky-Rs
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:41 -0500
Received: from mail-hk2apc01olkn0815.outbound.protection.outlook.com
 ([2a01:111:f400:febc::815]:19200
 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyae8-0003yV-4F
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAMKkGGE6ucX8fTsu+B+TlPOSdpdhBSqBd4GKRMVr3My87tcofBdvdD+tLIkmxRT06I7A8XIteos2dA4p5YmVxZKup7pQOebx3ZuZrz2MMEg+CEUCBEIZ+jPU1t6NuwU6W5mXVE+ALWAio9ext1OLpz7bsFD6EH+Dx/Fvkj1RgJuRvM8F1BPhZlYsvi5qHK8ttrZ5TBu3hnPz5So+rSDPkezYmy6g1vlItFRB0L6ScU6iyb8SZZebfPWgRsfug/KbWHqAlMRr0ZaGoooKGIEJPZ66fF1ZU15qAp3eqtwJ5yI2WtsjKs2xMVDk/DdP/eeNMqsB4U0xfFJMlPDQ2pmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZjkbaPLeqhK0KeAaMyIA5RNpZ7SNgRCGiZKM5L69KA=;
 b=Ui9+AR5L9f9Jk4aRlZMad2tBjcISqJSTyv7xryxY+XpgIyYVu72SJzFFZ+taCSLbrICVsuMFxQaCCy+n42QX368FjONu/dCqQZL+u2YCCpU1JN4XrYZDI1y/j0ggRH7s+uM4ZuwVTOxHK6cYNvnh+xQdfYS/kV0mxqnNoSTCHxPUHGdClSEqkDDNN+URJ5emH3RUIPNPN0U4r+L5BTxn9lD7H/UzkrWhhuK+Z9/2XDnftXgRoCfx3Xbkwc3p0KlP5jnCS4mcpk8CLrShir2AHIFGod8z3XUITaetvA5Y6tR+t1Ypwj1IPhS3XraZGQIfB6YzT71HzydXNPKRjxi1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZjkbaPLeqhK0KeAaMyIA5RNpZ7SNgRCGiZKM5L69KA=;
 b=qGtsqC+ZBWw8zDz2EQhVl+m3xZVDsPgEFsvVWXgdP63p5PbakhxBUkKaz+RMxKAKunf3V5botMENblHbuq7aVK4+R6JY6k5lkZRmEEoGF75TK6XlsV8n32046MJtlZ4BQQz4ptpjmSuWXZCk3rSStZaJ35+k7PyPZneE2C1y3p83nov/Vjc3AhfQSzUZSRI+nt+Q8trgtKu0bhzOt9LQeuuNVaKL/Kh2+aCgG9XlsGi5UHNqIhbM+zHvua/s/UMajKTpn3kmdueUFov7bxAldqcXVX+eWX4IsLnrGxY+nCSV9UrDAa4gEwpPa05wzZOMSMDOrS4YkmW3kj+wAYkWHA==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4b) by
 HK2APC01HT169.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::236)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:20:30 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:20:30 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:5CC3F1DB4FB88A2A736CFBF856BE4191D9892B4BB6275673C716F4D2B00A25E2;
 UpperCasedChecksum:6CDEBA692185F7F4D1197D2386E7223A62EFE448488FB6C7C26EA1F01D208DD0;
 SizeAsReceived:7574; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:20:30 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v7 5/7] fuzz: set bits in operand of write/out to zero
Date: Sun, 10 Jan 2021 21:19:35 +0800
Message-ID: <SYCPR01MB35022F88F8FC933F708EECD4FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [RQu6Jco7q1FcKAEz6aELuj3j0K8KA+kV]
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210110131937.98351-5-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sun, 10 Jan 2021 13:20:29 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b083c2ca-c127-44ba-567f-08d8b56a809d
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiSygBPrM25OmO0bBkd81GAbshGJbSqDQOIc7u8er8zgSR3G5AbKuSBeFmt5Y/G7gwFEKOv5SJbq+IHWZCL7N7QLXouBzqN9s1g6eyjfXfH7jPiQNjr22+HEzcIFJS2Bb5/hoK8uRhS1l2b3YrV+g7M4OUXk3GpDy7rP5h+6SCvtCLJli43wLcLJO9T58u9kbHTA1mR4O5po4Gx7nImMrCEwGMUHDvl8bdF4SRZcr/EFsRwQWR0s3Kf1vwVINnC4te4nx2VYbYMxJF/kv4h0Io9kLdCMvtrtFqBg7hszGmZ6iJBZfrVs93xq53zzTEOiFtg9POEVNF95OqiRNeNx0+EbUo9zE8+IVluN86AI8SA3eCMV+t77/ArmtDziUDIQUduirMkdcSsRTH4i5e1UVKt0U0O+zVTIUuarFC4rONC+J7v0sVSwreCM+hKyQTSbbCO2QS5aW/gSk63OlVIS0UF46jJkVkgP+yN48t0095a2QHhgplNTYF8+tuQ4vQZBTwYuGqQRsMLobmPzDSbq+0emdWHEvFE57binezW35yr/3qlok3jT+jdmzX/5w5f3HanY1cTMlBQzQDswAAtgEO4O7rTBY4yPn3VkrB3u/SGWF0OqdB07pglu2uf2fUPDlvncWVBzXqSOAhW7PncrCE9IYKCHmqJTKcZ5++gpC2xTCA+jl6A7czD3/y4M/2JXSjPyYpfwpk7JBXpuMKH0Wv9rjRVXbtJs6glKnqV+J/pKS8E296h0FqIVHz/9FFGluXw=
X-MS-TrafficTypeDiagnostic: HK2APC01HT169:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdiV6Jkeky8fxPSXB13HrTyNokFLSezlneHF7FidRLYTxgblLAJH0WBSJGU5Y4nhq20usXesx5lebVGLenZ6u2vNfOJJ6xDEcjE4eovs9o4yONzIaB7zaG+KBP232HFrfa6PZ4l/Q04axhwWiuyphzr6rkIkim1B5y8rW4ipOsZVSQ1O/k0r5ZoGi8yAzk7EiC+eTI/LQK5rJhlgJRFQDz6m3xwFB+0NYajt3O9WCi/XKVR9I7qXDXCbokOY+VWb
X-MS-Exchange-AntiSpam-MessageData: neDKhctVbmqM6vYj87pyZVjQQsqV2fzbn6uGEj3rlE1f9cilGXLlSaQqx/3l3L+bq6FGWMuyVl6FzrwqJbYfycovJApEPbfhTycq4Sv7USl7+Da8igauQKFufl7d0voRFCpQcojhj1MqH9Z6ff3Ppw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:20:30.1561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: b083c2ca-c127-44ba-567f-08d8b56a809d
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

Simplifying the crash cases by opportunistically setting bits in operands of
out/write to zero may help to debug, since usually bit one means turn on or
trigger a function while zero is the default turn-off setting.

Tested Bug 1908062.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 287266fe39..f86bbcf6b3 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -168,6 +168,42 @@ def remove_lines(newtrace, outpath):
         i += 1
 
 
+def clear_bits(newtrace, outpath):
+    # try setting bits in operands of out/write to zero
+    i = 0
+    while i < len(newtrace):
+        if (not newtrace[i].startswith("write ") and not
+           newtrace[i].startswith("out")):
+           i += 1
+           continue
+        # write ADDR SIZE DATA
+        # outx ADDR VALUE
+        print("\nzero setting bits: {}".format(newtrace[i]))
+
+        prefix = " ".join(newtrace[i].split()[:-1])
+        data = newtrace[i].split()[-1]
+        data_bin = bin(int(data, 16))
+        data_bin_list = list(data_bin)
+
+        for j in range(2, len(data_bin_list)):
+            prior = newtrace[i]
+            if (data_bin_list[j] == '1'):
+                data_bin_list[j] = '0'
+                data_try = hex(int("".join(data_bin_list), 2))
+                # It seems qtest only accepts padded hex-values.
+                if len(data_try) % 2 == 1:
+                    data_try = data_try[:2] + "0" + data_try[2:-1]
+
+                newtrace[i] = "{prefix} {data_try}\n".format(
+                        prefix=prefix,
+                        data_try=data_try)
+
+                if not check_if_trace_crashes(newtrace, outpath):
+                    data_bin_list[j] = '1'
+                    newtrace[i] = prior
+        i += 1
+
+
 def minimize_trace(inpath, outpath):
     global TIMEOUT
     with open(inpath) as f:
@@ -188,7 +224,10 @@ def minimize_trace(inpath, outpath):
         old_len = len(newtrace)
         remove_lines(newtrace, outpath)
         newtrace = list(filter(lambda s: s != "", newtrace))
+    assert(check_if_trace_crashes(newtrace, outpath))
 
+    # set bits to zero
+    clear_bits(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
-- 
2.25.1


