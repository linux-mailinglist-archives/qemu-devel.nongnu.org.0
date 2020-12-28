Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B942E346D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 07:04:03 +0100 (CET)
Received: from localhost ([::1]:42146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktldT-0007zm-0a
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 01:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXU-0002eo-8K
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:52 -0500
Received: from mail-oln040092253103.outbound.protection.outlook.com
 ([40.92.253.103]:10006 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXS-0001fX-I9
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5lqkXRSlQNnDAx+H7BqQmJ8Hef2/Zsus2g202RZQgiYAeRRfwJTZzfEF5eWYcxH18Y5RVGLtT1++FhP7if3chq8P6YoSSPhYd8P3EneNH2r6uEfcRWHHjZTG0qh/kI7A6GCKCTMe+vMHqrUIBsXSxbnt+dEnkBp/IOeuBK1JTrr2HkiWpZpYZe3hrxywirsrCtV+pdx6baP0mYTWnNnGJXJ54oHLuDxrgRLVEBjOHrpHaBHwjBpyoiDKdx1OvO/c4HkKnxP6XLi7DA67vqICvrVpKuTPVh5/iNWJG0OQIaH2OifKufYDCvpzEE1l37xe9xjmhtgEhXr6b5CKGYxtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFsrvoV7Jngo5LFXYX/4IzlHeuzUHXohWC2dzMicIgU=;
 b=non594iXvvs4VGyiJh5p/3t8IIjCExgMjitv0rL7dpW5gVOgjIHjB4OahO5piDrA1x2CeEoYapo4KrUGEqzDNfA2JIHfqMfUuaX4yUuKIS5j6HUvP2QSzsLeDeoD2PAEbeha2sJipCeh0Qt9m1W8YMsbmg1sOv7qO6PzzcmIUWje7eD7jeWw34OejdvXx4qq61q7/gAbogtbPD+gCrhLYOjJEdPC2mfcNUOtsPaNG1xSK+G63eKOZL8AptqQ5YVKzo/3kjRZmfYl8Shqx+jvgknxmfy49ElYcpDtmhDrICKDw/JpvVmrMO88Xqs/AHRcHwOHD42wWyWhUhXnUsqunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFsrvoV7Jngo5LFXYX/4IzlHeuzUHXohWC2dzMicIgU=;
 b=o0jcYRfHVW+TnANGHwuzbuanTCVjgYJy54i2/Y0hulw5zoLaQBfItI5LoZh73He3PfNO05/KTnYn5Dw9pC9yWhIxffIYNJrp1XwbTBnJznIjWYxF4q/ywXvsf+g5OemYmaiS7wqsa2Gd0QRUcINF8JEvPrvZvo+zptEbzQ9U61cznokBQexFkD9D0UmnQcUTxULP4rsVed4P7GHZxGPizR1LKSkGi/jfBGlJ/StfSBmcAljGsHVlx6z8ERs9QWYwZtBJBorJQFcNW+t0IMHuG965/vFt1+54cmFMEqdZnyHrZN8XLGn9uBUJ5iXU1axo5Mnu/8qHKclzCNGPrYobng==
Received: from SG2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::42) by
 SG2APC01HT186.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::235)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 05:57:39 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::48)
 by SG2APC01FT037.mail.protection.outlook.com
 (2a01:111:e400:7ebd::367) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 05:57:39 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:47CC7726B6C9D72474F6327990F00A067115DA07FD878F7D8D4DD600E90F80F1;
 UpperCasedChecksum:87C065183590F00C2871E17428093DB8FC7E26620E7328CA7118160CBE794DC9;
 SizeAsReceived:7678; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 05:57:38 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] fuzz: set bits in operand of write/out to zero
Date: Mon, 28 Dec 2020 13:56:44 +0800
Message-ID: <ME3P282MB1745A45EC67FC3836792512EFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [hd6JtjxoBdlvrxe1LGj0sVrSbrHUYUT8r5q4mZksh7OJ4BxVYBs/Cnj5gA0YjSSy]
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201228055645.3666065-5-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:2110:d78f:cec3:aac7) by
 HKAPR04CA0005.apcprd04.prod.outlook.com (2603:1096:203:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 05:57:38 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 49790874-031a-467e-a040-08d8aaf57b75
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiQjHo/KsCc3LvvB0a1Ll3PYv9L7VzO8vNB12DO5S1KgkKq/deD8IUgiqJKH782ZBGcg3/JaJ+qye2MZOL3u8h5NQaxolkVpjyWMSKUD/kFCH+zcySqyqqMQq0jegd2pPWTs/U5ydQoNoALNBkoe8R9WWJkPIcMcI4p9ORwki+GY1zvs6HX7srSDhistPYeh8WczO7j2k/VkYd5jb8nONdq1o2WnHzoF9iQMJYgHNT/+gGgxT8cw9XhYgFOS+fM0+6Mh5aPyCx17d3tgbeUB3PbR+ha5oXwfkKQQD+E2lmctOcGx3ggD4wLHlDmuUD3LZFD2UMFvVrxqgZar0xCNlRTvmld8wZaapae+0DByvdyLYvKVY7Cp+yivozSwvHrk32qynQaU8jclaXCKYDMzF5HIpbp/G+KvYl9hPDr4s8LzCTAoc+iGGAD/weTmmIk+JFgeXkLivAnLI7Nu2jZKhFiSBVwNCBxi1B+gIUm3NiMaplTIHT47cctv4ACjCjoW/BdpDXK4SAsNyzOG7jH3EwGllNbft/HGaQr7zlsC2Fu3njCJtGQk3tLlMzQLijwTfDKaq8Y2qS6+uQJgjPJMpa7Xs3L51qA/RZ7BAo6/XpiQShSYcD3ryUiPQFx6n9zUdNq5jhCSfX8yYktEdsRHd9cfWCpCqZw9gxXoiVw8LOvkEgrCyif8G5za9yg02CT4Qp8v14PgGnBOjAR+70bCRXU4ai4V6zfD8OMcUe9H0a6ijE5uGoJh/df/7oz3fRobx+8=
X-MS-TrafficTypeDiagnostic: SG2APC01HT186:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xopGg7pkXUTCXXlhQnDtznO325e2rOq9e/FH2wRMx0QqnhT8rZvVDC93aPsPfg/xXeWxn28PVmGuToSU35ndmAFPzWiG5NHM4dnsObwRIZsubzJAQ37sAVZdVIQ5BqjswI7i5/OqV1WzdODtw9hnOy2hXIRBZTCG6K8BRjy2tyIDU3bwDuDe2UQ6IZuLrIeDr0WDCpprjIXh04Q8BrJl4Nw3WofO9mLbJHHV0HHLNAmwwq346v8KDPeUBdoLzTiH
X-MS-Exchange-AntiSpam-MessageData: QKCzQ7YqP/Q+OYmE85CJg2pi4MWnR75B4a0zOGuKMwfCcQyIYE40MaGDrEt87POTBp6vgHFUG2Xe36QmqeKZ/x8lRaQmflKJSYMTYB2s8nZqUu4pXK44gzFdTAhpjfgzOpsf/Ia/XPYRu9NUhg70l1aVShFLcouteHv/YZbJd33e5w0mQi8bdRxszDBAVCw6DY1msBf3+XSwmTD1MVabdQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 05:57:38.6905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 49790874-031a-467e-a040-08d8aaf57b75
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT186
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

Simplifying the crash cases by opportunistically setting bits in operands of
out/write to zero may help to debug, since usually bit one means turn on or
trigger a function while zero is the default turn-off setting.

Tested Bug 1908062.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 41 +++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 0cc88da933..bcb32ee173 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -164,6 +164,42 @@ def remove_minimizer(newtrace, outpath):
         i += 1
 
 
+def set_zero_minimizer(newtrace, outpath):
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
@@ -184,7 +220,10 @@ def minimize_trace(inpath, outpath):
         old_len = len(newtrace)
         remove_minimizer(newtrace, outpath)
         newtrace = list(filter(lambda s: s != "", newtrace))
-    
+    assert(check_if_trace_crashes(newtrace, outpath))
+
+    # set zero minimizer
+    set_zero_minimizer(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
-- 
2.25.1


