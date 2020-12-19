Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730892DF12B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 20:02:21 +0100 (CET)
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqhUi-0007Eu-7C
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 14:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhPP-0005i0-LX
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:56:51 -0500
Received: from mail-oln040092255040.outbound.protection.outlook.com
 ([40.92.255.40]:42752 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhPN-000533-DK
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:56:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2py5ssXlwYW/v+J8q9na0kZxyGzrhm5jdtD/GRdgb0QnlhBJAfzOxgeBgTJs2EhfX+vtBRuWSAa6ee1GyHikHAXZAxVGVvt4VfU/SrJNnxECfNw0y2QdkzMNVj0/76MmXtaQUaDGIRCsBY5vsiSzzR/8Qd2WQLuJDAq71+uLenK485kSYNjwJqyZ7J+LIz2CXQEdNX3lb223dRYMTh8EvjXoTZAXqbsyI0wi4qzUCSfvDXg7xzsK3MeaHsp69R5xDMOry1knQv6CQbei73O/1GzTzGUMOJNbgNY/CIBcCpzGCjr7JG3sFZkb/i6h3myoNK6OBJOIf4TFRAn+lyxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md22MKEr96xc8yPL9OQe5UF0ttF2V88OlS/F08ekX6Y=;
 b=MIPOV7VnlDEudG9TS4olyYBt+cOOB6npv9BL/09sN0NDQUWw4YTnhf+cD6hmNn3pYXXLra3O6CAo7gH6qBREmnF7pvgE8lhAvL6hOI3ENC4E3hcBsFkFmwIXv21+EnEzhAzHzweETE9fD5eJnWDQkvcU9Q0B71GgBQ6UrUHX0c93jiJ7tAluxLTpqR3vkcrN3FtRsMVn6S2PUZaGt/hVTbL4bRsQ9vlV4L62RvL6afqS3jDrKs3/kt5qUQMsk16U5kTOzZFjt0/i4Cr3YSHmxtlYDwCQ/L9gtxHfOd4SJjuhXvmZ2S8iwwqGtj84K2m/IFLn0AIsKvyhPz+9ekESQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md22MKEr96xc8yPL9OQe5UF0ttF2V88OlS/F08ekX6Y=;
 b=jo57fynt0XlYiM7JojEYReYRDRVUigIVZheNRrl4YJtKRfgPbjTpkFRVQxgsL6kTwV6Dfzcr3eRDosxaTVBaqKRRXzks7Tq4+XFRYas7ZfETZhZlsbPDmw4cfQ2VOPgK1i3HigvUaGrBezk3N0YzQCYjgd/FhxY23cFfGwjq6DHhnG/T5xemwkEs5jWBxSU4BCgNGixMcmfLgqlCFpgM3z7/HWlIp/RUrmrRVjChOMkGaHJ2EtQwqgQpT8bpHE+olA4j9nHphdMp3WivJD5piSoMEqH1UjOvX4jJrCgq5Em40VcxGux7sG6ha3ljpXKJC5s6NJhW1F35ANDeBegkIw==
Received: from SG2APC01FT053.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4d) by
 SG2APC01HT057.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::294)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Sat, 19 Dec
 2020 18:56:43 +0000
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM (10.152.250.58) by
 SG2APC01FT053.mail.protection.outlook.com (10.152.250.240) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Sat, 19 Dec 2020 18:56:43 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:40D016675D38349A92E9850C116998C115744606F41047D728EDAC9BA33D73A1;
 UpperCasedChecksum:A165AA084CEA924A0715052D70EDB61C8C313E7A33F0A2606822E0BF2C1CB8AF;
 SizeAsReceived:7655; Count:47
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7]) by ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7%5]) with mapi id 15.20.3676.025; Sat, 19 Dec 2020
 18:56:43 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] fuzz: setting bits in operand of out/write to zero
Date: Sun, 20 Dec 2020 02:56:26 +0800
Message-ID: <ME3P282MB149243C4D0FE93B71E6B8AA6FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [wESVYiO0TFHioIepoU1gqzh5zN/QDEN0P9lzz4N8ui9jInR1ld5ciIJdNPCr1pg5]
X-ClientProxiedBy: HK2PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:202:17::16) To ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:a0::14)
X-Microsoft-Original-Message-ID: <20201219185627.426615-3-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:1079:e2bc:42d3:a57e) by
 HK2PR03CA0046.apcprd03.prod.outlook.com (2603:1096:202:17::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.19 via Frontend Transport; Sat, 19 Dec 2020 18:56:42 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 79d19edd-842e-4ac8-c15e-08d8a44fd39b
X-MS-TrafficTypeDiagnostic: SG2APC01HT057:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfRHtcX5UuZE7Q9TMVeMz7ff5FSzELRk2hmCxt6ly3KlSqhnc+Zlkwz6mtIf1LQplQwxH54KwEjT8hUGzzKo07UIYTqmIpQorABFGYdoJs72NIhsW2GUOEFGU1AeO7+hUErDUA6pGDlgFHbaVT9ClNTjyRLZe4fwJtIOEKpe/arLb2HQ8jjpSwMyDEKUl9YhEqcHwd57AXy7JvoItIdRccBWn7wvGAvTHKKpUaSLcx+l/oD62xiaV5rd+60wgCKt
X-MS-Exchange-AntiSpam-MessageData: F7+PBdmJL+GucIDDQLnwrfl/WsaVvE0Nt5+b42nhmoqLYrxCqz03GC/GCXwxyuOCk+Rd5TbyTOu+qGSywN0whbkXZDDRSGkaXplGniqfd+gIcbpcffNA6hAyy3XLe7dyvVVTh/lSQtkYdf8qnTT/cBRP4CEM+fNEKS4o6MjYK2NAPlpPGMq8L233yMEcW3Y6GC+ZWbcTVuLafe+GEu0SdA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2020 18:56:43.1561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d19edd-842e-4ac8-c15e-08d8a44fd39b
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT057
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

Simplifying the crash cases by opportunistically setting bits in
operands of
out/write to zero may help to debug, since usually bit one means turn on
or
trigger a function while zero is the default turn-off setting.

Tested Bug 1908062. Refined vs. Original result:

outl 0xcf8 0x8000081c            outl 0xcf8 0x8000081c
outb 0xcfc 0xc3                  outb 0xcfc 0xc3
outl 0xcf8 0x0               <-- outl 0xcf8 0x8000082f
outl 0xcf8 0x80000804            outl 0xcf8 0x80000804
outl 0xcfc 0x10000006        <-- outl 0xcfc 0x9b2765be
write 0xc300001024 0x2 0x10  <-- write 0xc300001024 0x2 0x0055
write 0xc300001028 0x1 0x5a      write 0xc300001028 0x1 0x5a
write 0xc30000101c 0x1 0x01      write 0xc30000101c 0x1 0x01
writel 0xc30000100c 0x2a6f6c63   writel 0xc30000100c 0x2a6f6c63
write 0xc300001018 0x1 0x80  <-- write 0xc300001018 0x1 0xa4
write 0x5c 0x1 0x10          <-- write 0x5c 0x1 0x19
write 0xc300003002 0x1 0x0   <-- write 0xc300003002 0x1 0x8a

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 42 +++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 855c3bcb54..f3e88064c4 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -172,7 +172,47 @@ def minimize_trace(inpath, outpath):
                     newtrace[i] = prior
                     del newtrace[i+1]
         i += 1
-    check_if_trace_crashes(newtrace, outpath)
+
+    assert(check_if_trace_crashes(newtrace, outpath))
+
+    TIMEOUT = (end-start)*2 # input is short now
+
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
+                # It seems qtest only accect hex with one byte zero padding
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
+
+        i += 1
+
+    assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
-- 
2.25.1


