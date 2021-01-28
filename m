Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA59306C08
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 05:16:31 +0100 (CET)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4yjO-00077c-Hx
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 23:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1l4yi0-0006fA-0d
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:15:04 -0500
Received: from mail-oln040092254102.outbound.protection.outlook.com
 ([40.92.254.102]:4894 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1l4yhw-0004xM-3j
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:15:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS3iQV9ZC3KqUB9IMlLZeuCCf+TFRYQ7V8Xa8/rTP3Cdgt55PQzkGYv+lu/fw/clN5VYO4jgzrzz8iY1/V9i72Et2LK4jJ77lnm1X7x92XkQ8qjASo1gOZ6tpzx49cRBFQPFDqYLLxGd3YXMpwOt57mYxMPSwdIiXCc0F3yKIx1uoba7Uh4zcoIyaJ5bg2KrE7TG+0+ppmbTx8rqsoBveGzu6YwEqotmrRs5NySc09lDFNQkYc5AvU1VQMQQaUKTehyKcR3zXzEHbf2OzkC+oUEnXl8vcvYP8Q2xGVdT4WgYoB2ntpiEpb70/jQ2XQZx/OSOAICSZoLq9WvIrTCL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55rkEcUxJuwSzIzEIvid9tOgAKimQNy92K5+Lk7VMAo=;
 b=JNrEIfCMB2bC+EQlUXVg2dsNxL8p3jsPIvChdHZFfzIqZAcfcgYnen8We9PQsC/xsWA5IZH/uOxeUUjJu0mTRiFBKpPl3Bps9o9P5XyODQBN6Nz3YAvFSrdmPgrPuzU7e65GmWdemtTD+qowJQv1AI6p0QEI6dz2/hIPmuVpH8SMwNPC6TNnJ5IvuwQ6WPLVpHUwOxusQuAoRX9Gfi/Kzbi9uYe5CVOpOuPizKfbVFMox0AciITxA8y7aZVtjY2TgT8M/KL8Qqk6kBsDvdv8K1YM1uj8KVMNY1W/147g/r4lTYTLmUqTLtvGGEFfY0QxIg56ZxfnoTK6I1Czf+1GjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55rkEcUxJuwSzIzEIvid9tOgAKimQNy92K5+Lk7VMAo=;
 b=mGKNBPZPb8NHHMXPqLgpX/S0D6sj5xRNn3Z35+gwMv1P+3WDFuQntg6n4jgLaWNqWt4M2dzESQtCY0WCJnO996TrSNHJo9oipZaAz0ZZWUxMq3+JU+RGugUyE/+sJm480k27qOJuSkY0lUP/ugJDPKizMucmxXJibQOvJilnCVBHcRtcl4qvDCDcCujJGqNUZ7DbnLu92slwezmoBhfDP6Vd6MQTtBTOY2wn1xkZNWZAg3lCg2V70h/6G1sOFKegOQv8S7oDIIX1cD6L0QEQT0bw1ACaE8Cn/eZpcyNP5dorhZrFirlzGn3lSqWsoDHTGOamnSvPPuYRpnCMIGarsQ==
Received: from SG2APC01FT058.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::47) by
 SG2APC01HT025.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::426)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 03:59:39 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebd::4a) by SG2APC01FT058.mail.protection.outlook.com
 (2a01:111:e400:7ebd::373) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Thu, 28 Jan 2021 03:59:39 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:55B8ACD0A63FBD61D6A36C1C2391911AB2F4AB90F1069DAAFC7EF6A1D17321AE;
 UpperCasedChecksum:656F0DBD956D19C70E100D280C3F875061C447AFDA38D7FB6EBAE8048C02629A;
 SizeAsReceived:7349; Count:45
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 03:59:39 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: fix wrong index in clear_bits
Date: Thu, 28 Jan 2021 11:59:28 +0800
Message-ID: <SYCPR01MB3502E9F6EB06DEDCD484F738FCBA9@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [/ASFxnu3XeZ/KtLX/v0DdmoKAQ6ycqFe]
X-ClientProxiedBy: HK2PR02CA0153.apcprd02.prod.outlook.com
 (2603:1096:201:1f::13) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210128035928.2768554-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.238.31) by
 HK2PR02CA0153.apcprd02.prod.outlook.com (2603:1096:201:1f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 03:59:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 52bc416f-4e3e-4129-7584-08d8c341229a
X-MS-Exchange-SLBlob-MailProps: Zv/SX2iM+5Xjt/qJE5Lg7V0nauH390HWU2xcPjFNC0oPXZUxBlSqBFoXH+bu8GTJylQmKzvQqyYTrtqCYEPDSgBTT6QCPe/RDIE0MZgJFG2irIJKGEvLpgp2GsJurkipYEoifg/pDZy3A+btFShCT82UL3yCEwdeKh6EpNew3N09q5z7n23iHl5csAMRzslrKwgOM0UQ2epFV3w5SgbIyfYHYCoI1l9GEF0KejO4eGBEh6Cq7qA4Tx5AqNpwBhziMP00oighssp5rA0cbdL3hudd5UAk8Xrkl/DW5c6YRrMDZz74uYV2wAjwnGNlf+0T+hjPZAOGkgOJp5rJvRzjiu02CvWxZE4lNLrvMgMauBGBBE4BUQB1Rc6PeOhIZfwpxsbgwVXfR9yiEFleQ1KEmkHccTjnnIh/TKJ3itoc7rnrVeqLd79Iq4ElLA5JFeLGU09nH6UWp197BkkMrnJgsy4JmVOtsPf5VrzcCKJMjFvzUZg8VdYQHcy//se++mfyTqBQp6M3TgXj5GD2AtgRjJT9ZUTw2zSHIEAw1ANUN70AZLDnQXNwJc+aOe7ph65AfpZlsSGzHSxlTZlM93Onq6OB0OZhmwlJLlMYM+aeq2WMCnpQF/K1mFXKlIcn2sSWBkTtS+OfeAcj4bq3VtgsPk3XDup7gjfobr3Jzwy+YL85qFiKc19RQkfHxnoEkO1YEk5zuKG9ueE=
X-MS-TrafficTypeDiagnostic: SG2APC01HT025:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3IIKn5rkgAOBgdBz8CTYtpw6sDQR+WV6v+Xl6DuG4zKXCPMkxMY9foXb2X0EX/+k5DHS9D02bnW3SnCnRHjFenYVYK3ZJr49vkdto4XAoD9iYDp7qcj9uG3NbjycK78ZwpIzJqXTCJ2ixke2icawMZcyvZsx1owhKRQy+/fyWv9vjlwvzIlLOFCiAhrhUoqWrYrVgPFVnrhz9oKK3nWJcAY8RrmHtbt3EURnbrzgtDcFmQabqNVhRrIvVVS+O6/foz3zZ11em7i3yzaM7ni1Q7x79mNeNxBnLgx425+EwMfN4K30gvN5yLqcv35eM1KHdl1Tt3p/GlL6a+dQVzrmSniScoA9YGd/gMAgd9nBEmcYzKtKNjIIumvOrsyyPiPSj78XMfmNwT/FzSaKpH5i9g==
X-MS-Exchange-AntiSpam-MessageData: bmczxZurQgPvUlaOPyps35tYdPj+GuMv2tJjO2hXkpO2bcw6gJ5aaIQKcvX47OLKhIOMZ+Wa4jxL2u8QkaBuUTS4e97fDY0+jVIUcaHVmGLMyZty0i/Lv4G8mglmpdon6Hum6xcfFH0T9Y1uqw8+AQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bc416f-4e3e-4129-7584-08d8c341229a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 03:59:39.5702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT025
Received-SPF: pass client-ip=40.92.254.102; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>, alxndr@bu.edu,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 4cba96dee2..20825768c2 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -261,7 +261,7 @@ def clear_bits(newtrace, outpath):
                 data_try = hex(int("".join(data_bin_list), 2))
                 # It seems qtest only accepts padded hex-values.
                 if len(data_try) % 2 == 1:
-                    data_try = data_try[:2] + "0" + data_try[2:-1]
+                    data_try = data_try[:2] + "0" + data_try[2:]
 
                 newtrace[i] = "{prefix} {data_try}\n".format(
                         prefix=prefix,
-- 
2.25.1


