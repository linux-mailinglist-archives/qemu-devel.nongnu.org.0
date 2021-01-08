Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697FB2EEBD2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 04:20:26 +0100 (CET)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxiK9-0001Ux-GM
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 22:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiIP-00007F-Td
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:18:38 -0500
Received: from mail-oln040092254066.outbound.protection.outlook.com
 ([40.92.254.66]:34240 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiIK-0006pt-GT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:18:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNpUlV1EMAVZh4ru/W6ngaZObh56nLzLH9uOdlCqw7bhqpn5RPLixPp6APrei/4fDSfQPk/iiZeT5Bp3CqeEeq7t7VUGtc17vuRfDnSd+sh3Mt5yEO7qHORZbxCZ/dbSGXCcxqrCUS1LQ053zTg5FR1ck49bdBDFsFVYaTzwxAc/DcwBOf6Hx5ixHSOqi2nNSI2/k/rG0auuLyYRl7pBZ0r7caSfr/0u/GKCQZQph7i9AQVGIO8GdW8N/cSt0POU3rXxkvtlmoIm0A0ak1OjRPDFA4EVOR9izueGyR8ZmUX3MuDlO2j6r6VDfKzlibLDwft1iY5P9dBPPtKWya7G6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XTiontcXcl/sXd8NsJSPTBEjBlvNG9gWFbSN0ODnC4=;
 b=MQZW6E+QhTseJz8Zh0rOOV0II/pFbNn2R1kIam2f0Gjkhhtw4K9he2iymIdcwk5nt/JLko71miyw+9dXSy40cfehx9pYPO6s7eCs5Yku8tGhBAf7OSrVmMJSH9yYW33UH01sjHFvyUmW+TNJ2GCn4o92IwmOdc01PZ/1H4HVROyVM+Pi1fx0ekthd8qfT6f7iv+H40AnHVlwl4XI5SQLHoGmdC0GNMYuNFul/BNhFRapnZFx1MmbOKkRWtpkwL0U2d8iysbP4MF+U5UCQ9Mdz3EqHlA5VTKcpzKmyn78k3H024sV9kUIjvnh0fA6hBAz0TAxTNHNlrd/xX7+YMbUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XTiontcXcl/sXd8NsJSPTBEjBlvNG9gWFbSN0ODnC4=;
 b=rzePrAbe9zXprcFqTE3aF2n/4mCYz/GOivlt04up6qFMUqnCrbBaRQMKCZ3ZzHEf8t27tHwd9CjA+LeTulW7y0pTzBeB/EohY5ZncNREALGFAYNCRhGLo3rcJo9SzzzfB1fBkSkjIpK8lpP41sRX2KjCcBw2zLLTz/Qhdpsgb1MhcGBf1ob5plUEZq5BIRNVlkYG50dE1UVhGYoEZJNmKgDbXZtwVEXaJM2EbNK3xfFpYWg+CQNPeZMMD07ahh7X/St+bOSBSxvbnWkilMFCpZfwapv0NHD3gOAlkjtCAz3T3qBjsPgFslUqrws9RIHFUtrUBmkGMiPF9ODXSagSrQ==
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::49) by
 PU1APC01HT044.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::390)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 03:18:20 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.252.54) by
 PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:18:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8BE70C2AE17927D1AC72ACD4AB5BF71EB203EFFBCC8C9922697FEF8A2D5DFEEF;
 UpperCasedChecksum:B966827DAC738978C36DAAA1E17BA6F1CB82A44613965FFBCDBF0C0E2D788E9E;
 SizeAsReceived:7670; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 03:18:20 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v5 7/7] fuzz: heuristic split write based on past IOs
Date: Fri,  8 Jan 2021 11:12:49 +0800
Message-ID: <MEAPR01MB34947491156D2FAD87C0EF2CFCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [fAjHALQQsT0TtC/Iw8VSJH6gDAaykidXXN0aDI9b5yZkhKaahyFe3cPzazFXHQy5]
X-ClientProxiedBy: HK2PR0401CA0020.apcprd04.prod.outlook.com
 (2603:1096:202:2::30) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108031249.68381-7-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:40a3:2fc0:cdf4:4729) by
 HK2PR0401CA0020.apcprd04.prod.outlook.com (2603:1096:202:2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 03:18:19 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 12510e80-15c4-4b09-71d2-08d8b3840c8e
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwhVEmwSfFHOHzogkw7n/eb6NP0bIyotz4Rl1rPUY0qmZtwy49kHYPIytVOiy4Z88Fd1jh79EoF4Xp2L4WFuQFLlW4+NUr/x1W31kEDRxIEY6+1zPvTl+/DN0PBoLZ+AAwxOE9kAiOxzbDXU2d4GKVPgvlF6dYzpRinvMG4SnTzcuMY6HHuTWY5xt1Yx4EYTNH2xwTwiFGMB0948FHgNd8SoBMhqy6vPyn75QJ3we/9BQs1gLbd9lk70DGJwuS7A8Nd5pVDmYHvj7CYaz2lgjTxBbUgrFg6AW+6YuwfMu0SbqVX1J0W5za5yWDhi7UbK5oUAiGjDXmgMU9RQyDfcDvDoFqjwLJRn6Sn/n99vMIBvT1h2Kcx/FcdccuIxY9Zc0pmFrHUXCTFeWmhbrc6pxTrQcssQi3NqmfOoFnyZil3NSSMQHPj2CtKtN2mfG5cF80ZIfnXrUmUesfskeph1LplEQNWodeZGFi9RHI4DuQztXTpsABwp4rkwsNw9cUw2XIhmFs0BRbuIXN0lFYoXhTM1igufcMLramj871zjZd/H7Dl0gCCqmXds7MHzVVqPSvDIB1pGiD8Nf/zZEs4rygPg/e7IsZEBOe5F8W4NvvH18RpkGrKrmTIo7aXo339eFxbKRicpfGUc6VBUmtUvovzZ5JWkliksKYSGaBImxwyXT0kDjtdZjzM18epNQcuioVAU1fG9S2CGQCDlO+I54WIfKfm2sA7yKyGZCet8lyGPU=
X-MS-TrafficTypeDiagnostic: PU1APC01HT044:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +n9oawzMQ9lKg6SGkEvAwKbDw4XU/a0yH6ShBufSZFtNSI4r5cCwG98URPNsHJOpXIC97CovGyt1Yo0TZWAyhnrSIgRG7D+MCCpF3tFuLGEtcOg7kWwvFHxTQAbH8CnXJlKq5fgUrWoI1ZQirktcv5oUF7QaD2w2N78OiVPUSv23eBcxcB8S5OH8cIQZjOz3z8w3ICnrAZDvj8bFv9ErfLR6iu7N4/xdeIos5qHlFw5LHt/Fv39r64T+8dGdKbQr
X-MS-Exchange-AntiSpam-MessageData: MUKIAM3WKSfcCQV5IyyPKIDVYalb5XoCgjBHUa0mWvQEGYQqM9FqTCXRcz2vsiSWa81JHm6hVJBGFAAmTKsusjlhSJn9tB6KTEJUSHdlI+aRhkxsBTQcLn2nQAmVF/T4tilTNe1iuZqsFAlGKCHY5OYjwESOzmVwG2NrmyphttU60nM0WHuqGFxwVM7NiLsw0YvYmLoMMIRkuDpNdfDglw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 03:18:20.0082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 12510e80-15c4-4b09-71d2-08d8b3840c8e
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT044
Received-SPF: pass client-ip=40.92.254.66; envelope-from=Qiuhao.Li@outlook.com;
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


