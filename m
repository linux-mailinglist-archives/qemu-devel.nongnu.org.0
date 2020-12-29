Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8381B2E6D35
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:17:51 +0100 (CET)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku4a6-0004PV-A0
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4TC-0007GY-5t
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:10:42 -0500
Received: from mail-oln040092255086.outbound.protection.outlook.com
 ([40.92.255.86]:24420 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4TA-0005Ql-Iz
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:10:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doprTGn4uyexKvBctHFzDU2zZYQCX1HFyOErEOjLm3yEpbMQNJ/9ul+R6J4Lo+CraOc8q1CL1lc4Vulzuebeeu3pfQwyvXwgnlr9g+b+CX+E1uzSf+yd0ti4cPpohTDd8GSISef7nfwx7gD+YVrQievmXFQC+AAtj0wd1izDqUG2lnLka6Ha6VewhHZ+jLKxvCIBskrIpO6PtFJpucT9SJ0qUea9WCig3oGwXeUNNijem1pl6ewOr6bYjYScJPDaYKwha9gja0norpIksAX2xk9i6qeNvR7SZbDiaZvhFYkCLDoj10ZkVnTk2nR0amytO3q6Etd6TwLgisxZ4daBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFFrsXyOqwEN+9+LuRl97Z4XXwqRLuRZWbhWWfOejTY=;
 b=IDDJJ1UkZFBGhbXOXsWsTPkrD+OoHT6AZUUkLE+m1+JiN7GYjnInCOBge1wHJ7DhnTJwD+7yxMKJ7zrYwp1tOJHfmytHDjtzwrkMfzTj9KFR78Fz7CvbCiB1M3My33+EsrWDLNwuWlj9VeaEBYGSLug3Zy4oF9SMBayl1uCluLk93o0iRQGJsNHfAP3AZZoMkWR1xHK3quDOsCPsHXjH2bERBl6ypFoRBNoVECh783gqLHpquNbmy/GgZAO14Z/NaLnni26yaKVImT5L4A2CCqLeMLAaVdnTD+8Z5yG48kRYViO9cBP7HaPhxkQZaJ0RCbIXGxor0C7bDfkJP/tR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFFrsXyOqwEN+9+LuRl97Z4XXwqRLuRZWbhWWfOejTY=;
 b=WRPp5ATFALcy2D8G1v3JMEdRMD0tZeWNDp4j5ijJLQNpREq15Amzqb3bK0OSnZmBhUOpO32Ic0APa9Bu6+sMFX1Vnk+PZhsFyj5a3K2Od5EEvvTF6pwlDrJBGagnYw3hbTHpEDrJ02BuiZFAr3KkFE8YOLK6jRz9hUlFb5u2q11y1RfXo9Bdl/cCPZXOWMg4/CN8WVvutn4qHEOpL7FAn3/gUsVg3gPwQKk2v7eyo+224BSgeikq5xRfORQ2zhmfxe3kx7qb9pLMkJ+VdsJun+k+mbM8GoHqy6IVi0UlaT4Ta9g8sMSKGM6dL3MZ2mL5Sk1s73+ZJnep9P2WY/3YsA==
Received: from SG2APC01FT031.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4a) by
 SG2APC01HT127.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::299)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 02:10:32 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.250.54) by
 SG2APC01FT031.mail.protection.outlook.com (10.152.250.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:10:32 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:15B8999518A8AE751B818D7F2963264CA6EB3A95F3BE2E67200B4C73B5D4A0D1;
 UpperCasedChecksum:6ED3CCCC2516E34B0CB248DC617314B265F5B9BAD001CBFE0D488BFCF0BEA42D;
 SizeAsReceived:7678; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:10:32 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] fuzz: set bits in operand of write/out to zero
Date: Tue, 29 Dec 2020 10:07:12 +0800
Message-ID: <ME3P282MB17450BF9D0CA83A197CD2550FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [dDuz+XTxC8iulmyDdc4PAyWGXlvaEOBRDGBU71KPz1vG/knrMy3KLnD27EAFrPkd]
X-ClientProxiedBy: TYAPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::19) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229020713.3699486-6-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0151.jpnprd01.prod.outlook.com (2603:1096:404:7e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:10:31 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4faaeb05-87d6-4eaa-e6ae-08d8ab9eebcf
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiRaJ+ox6yOiFxhBa7ZFYMmiFdisKjXH2mGj/R4HiUiBkxcRJasARBjKNv58/WNGBNCOC5XQLUx7qBk+SnL5A7QQk4/o4R80kf30dTnV4zGzu0GDfHH3KDQwM6ct4XQy46XciXuQZ/zO7xMe99Lu2SdOKjdaSPZCYSrRWkZykNUD3B9hXWF+is1UYSM8zqivQv9XRFF+MpXQoMB7wcyRa83xiDAEgUxECta24N81xgjIrMu8rXZMdTvZZ1bxhUeU/Nkno2SRljMXh1FY21f9bxVoH03+05zI4o2wX82GJvEDMoQSkBpAFG5KYy82GRTRR7fUSV622rt5Mnv+OCa27rLBTZTOqWej0Mt3QGLtlbi992jqF9kT8LTGZjNqCFd8P+nXhjwnwkegQEeslTIXQg7w4umI8m0nzlSgjCpEU6DL6ElhvB51uAkAHVgr42T7yNP8CUdjjk5WwXiPD5izF5oNAnZxDssuezhgEl0hfuQ3v0HcbO35hUt8n/v8+Tq3FnB5GamDj1UuYGL6WReO+c3L9yRdx6DA+cDCAn7i2E9W2yOjigYWZTHyhCQIpjVEQTSjBk03DmXcAsle3WEPQJqfUPB5BqsW2z/AMi9iQcqrFOFbaJrX0/Ioc6e4bPyyYSSTQtXvzCSD44lny8BYXhn6BAZe9V1psYS9Kq4fyW8L7qz+37D/y7GuU3ff1av83Q+UKftAoFGa5znKG4RnvrLRMVtXisVNyiQaM0XUMiOHc+Xx4GybR6Kc0zDYigNVMqc=
X-MS-TrafficTypeDiagnostic: SG2APC01HT127:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYNPc4r3JQtulz3jw0OTNLCpVQ/dMLUGw4MU1+Ddkbroy5nTjOKdYYl+C+06B48y7FeRa3VDr+xUphyYV2J4/gSlalnFNfuHDF/fxwPxD7SH9GA4MxbTXoYQjXw/yBN5EB5r3W+CSq6Z1wJIoaL3TRh6FTSRfdl023XsUrixxHeFlGXhQRT1SP0+fo0qWG6/B1Zo5YnZZZIywcR6Extlcai9UqswjnLaM+Sh2oCtupvGFR/9IuetwJMnxh9dwihe
X-MS-Exchange-AntiSpam-MessageData: SPDBEf3gB13q8sDnXD979G1zBsL2JK/z4auDj9S52prFP3TTJSx68K78US6Ck9tsqfHbv6XHrCMva0vINc/97cKOpG7rAcxU4VFIBiCU9ovrBMMDe49udDB7xgKbPFkArxRkJbg30EpnKaQTiA+HT5UIlTILj7rXzGGKDg/2y5+FFw/gbHJukYZbdXNgjc0xz0TCMvyKdZfRWVDJ1Uv9AQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:10:32.1562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faaeb05-87d6-4eaa-e6ae-08d8ab9eebcf
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT127
Received-SPF: pass client-ip=40.92.255.86; envelope-from=Qiuhao.Li@outlook.com;
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

Simplifying the crash cases by opportunistically setting bits in operands of
out/write to zero may help to debug, since usually bit one means turn on or
trigger a function while zero is the default turn-off setting.

Tested Bug 1908062.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 4273ee7505..050b9f2195 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -243,6 +243,10 @@ def minimize_trace(inpath, outpath):
         set_zero_minimizer(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
+    # set zero minimizer
+    set_zero_minimizer(newtrace, outpath)
+    assert(check_if_trace_crashes(newtrace, outpath))
+
 
 if __name__ == '__main__':
     if len(sys.argv) < 3:
-- 
2.25.1


