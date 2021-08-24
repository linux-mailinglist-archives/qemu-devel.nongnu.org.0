Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C63F584D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 08:33:28 +0200 (CEST)
Received: from localhost ([::1]:41234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIPzz-0000ym-3f
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 02:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mIPyh-00006i-8K
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:32:07 -0400
Received: from mail-ma1ind01olkn0828.outbound.protection.outlook.com
 ([2a01:111:f400:fea4::828]:62240
 helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mIPyd-00066y-J9
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:32:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Up0uzVt6xqxrtf/6d3p0zcAs8fksVZYBpAId5KClMTz3FGPGnCIwfUPpjk47VHDMLuznt6q0tfgGKOC8Z+eH4ndoo4hdHpCoephQNcTSh9jGAb8awgTFFPfHeuUag3EgWH52nKiPqURDg7vI1ei49qyJyYODi6ls+w2Tl9z+4xxDBWyBY1PP84IAwXjdwTFrj+/JP2myQGBMlbPiZriYn9lthHOzOmv/1SnO4fNmwktE2nywzKHbgmkG4gJc5crzDTpCDr8SoTcKNwcdf0QMmS7Yj/Uc08j2tyWWxyBFQgJEJc0QrEVIPsZVDxqF6ZR203DSfdbHjN7pFUsJXBwQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VaS+rPi2TOslQq/AX143jrFGBulInsz9AKOEr2rIH8=;
 b=K90VRJPkJtxfgl/SUhRh/4ZZxd1vbLGIjOQNnzga+QuJKoVXK55Lfp8wJe2GXY8tpqlxqfP+5IloartgMmGr9mNqJ76tsk/eayO7oTNDewy9VpwzwMKUfMjfe+jTOkHNXT6DEzLcwywEn14BfCCjMLLlGC46FmsLYGtNxjObqrIP7b26854elYepot/7oL9W6QuZrIQKZhZp6UJN0r3BiQqFZFITqagMTVmYRyiFx/hHUViK07thoDYdo56voVfbjwAIE04o/SneZm2bN1euatCt+L5SNyKMWfeAUlXP9Ec7HEjHBgM/hBNnC/6rtODwVHPMYxaHxWQpPH7cIcHKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VaS+rPi2TOslQq/AX143jrFGBulInsz9AKOEr2rIH8=;
 b=Cy+eaB79Vz45p4Bu7gDxMmciDa3sfk3Vok7OJiZqoWN7jnJosIumKMn+GrP0WWR5bBVsHJqmtIJ85LNl2T/p38dKPP//Ef4uRez5pL97vSs6DIW7guzglUcLoC/h/YcZkAFa+urItynxK2nWKXeTCMTnV4Qiq3i5MsYAHNpI3XTC59BbHoZz8ZdGJczVAS5UJL0BbUnduYD3EW0CX9nenV7YwZdzAVI+Ly/WDb/3QBrmi6SEyAA20BwVhRUzkKlspliL0Fg2/OKCIwKNYIS9TzIJgaCouB0vEXpMjL5JSav+XTHoEYaDSE7TtnaE26V8UZHkOTznUS5oKwjZMC5Zbg==
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:72::9)
 by PN0PR01MB5468.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 06:26:52 +0000
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c]) by PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c%6]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 06:26:52 +0000
Message-ID: <PN0PR01MB63528E3A58EA06BD1B242486FCC59@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Subject: [PATCH] MAINTAINERS: add fuzzing reviewer
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Date: Tue, 24 Aug 2021 14:26:39 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
Content-Transfer-Encoding: 7bit
X-TMN: [89Y13qTbDpFUNtCqUj8wFSwXS9/HTuIw]
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:72::9)
X-Microsoft-Original-Message-ID: <2ca4ca212a1927249ed8bc36f7ac87102fe6616c.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.250.209] (104.192.108.10) by
 HKAPR04CA0005.apcprd04.prod.outlook.com (2603:1096:203:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 06:26:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a13516c-90d6-48e7-ef20-08d966c82938
X-MS-TrafficTypeDiagnostic: PN0PR01MB5468:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t057ZUN8eKz7qtBDTZrDZiDATbl+U0fYtAKhVFo1+KHSs9dPpOCiVULMon3dBgUhBRpHajq2j0Gb57lxCC2CLV/tnjGmXjKO5HV5vZTV/Yauoen74BlKAwCeLnIQSJoUSejfFaSsYoXWrzJYqy513w49E8dd0UwKVpvFTyarHSZ0aEeCf9CZdjWE3WYIOmunZnO3Ec4WB1lcqxSbDzqHren4+38YPZClt6CTZC0BoyDV8TRIhQghK4sumPN2wWIFX/n/tNETUWp6CTv6WebCkKfrCoY14t+lZKOzipKCIVQcDkjxJ51aPpnlkP7RCaEX6xAG2NWkjgk1AjAp1ia1C/l7AjBrTJdV7rkDF6A12LQoouraNHcGQmblwR9meGGek3RBjwMcnLCLIrwNjtQmKAWFU6kMzSH6XM78C06r3UvrZLYlYHWUctzX4SEYQWmuEto2Qah1CUInAxyyQjQHoHyTra66DYU3wzae7uH/XEc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N2KABlC6YgoFP0f5uSTkXhH52vSe9kXwN6eyIo9WNE7AQs7oyz8Zd2XN9AajBemWymmrUmcxouDdkpHuiBKiPiKMNfRANMb+KlZfjkNXZ2oagZV4W4rcSP/Ahxcl3ealJAErbOAHtVbxdx/VTrw6Ew==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a13516c-90d6-48e7-ef20-08d966c82938
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 06:26:52.3144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5468
Received-SPF: pass client-ip=2a01:111:f400:fea4::828;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=IND01-MA1-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: alxndr@bu.edu, thuth@redhat.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To keep me cc-ed when something changes. Suggested by Alexander.

https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03631.html

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3697962c..3a979b1bc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2706,6 +2706,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
+R: Qiuhao Li <Qiuhao.Li@outlook.com>
 S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
-- 
2.30.2



