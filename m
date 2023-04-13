Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52C6E0D57
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 14:18:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmvsn-00047M-C6; Thu, 13 Apr 2023 08:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pmvsh-00045D-PB
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:16:53 -0400
Received: from mail-tyzapc01olkn2081f.outbound.protection.outlook.com
 ([2a01:111:f403:704b::81f]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pmvsc-0003sd-J4
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:16:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIWc37QNo9RR6Op1dI7mVs5tbKw708Q6tr79k6id0sTt/AMd8399Ll9FOKTY27rGvtzdJxb5ZaJLAjOpAmC7KNC/jHBWCxQH3dDb9KbrySFhqNjLhrfYZJoRJiX8AKYlzuedxOwgeZhzruhVbg+19kmd4teCGyEa1v+YblK4q63wVNi2O6IKlAWRtfEL/Vr20v2LRgtgpmt7NsBQAwsxxJOYoNcyfJAVbaQYrcvMIow0N9FWFu63L9iut7HVJXjeZ4pXpWzMdJ7XEZK055vTcqDhEZpeFBnMY7+p8izmES4C0VtFqUZrV1kX9YAVyw5F/+Vpgcb2KeQsg1R54SEpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShcM4q0GPE4UDPBInMjKBxYqkSBf7VBN/7Hws361QCc=;
 b=FR//VC2kOs9ZQ/h3Z5/2Vmhrw4Ah7sRw+RCD7AMQxVVcsPcDnpPNKoGwZRYD7K0/SNzFf1+sw7rL+JWZmAhT5DrFQlAzqkVp6I/giLTD4lMSiEY8MsVcJGuBv/dJTJguz0Peu1uI8Zs/z525M0waEqjyMbO48+nwAqPnAPCqjOvZhcIAzZ68qAyULfUAHf63oQ52hHeFa3vzjMfDMtTAV4MtbSIUP5kctBH32FthNlO1i+JPrhgz0EUyoepEOuX2yzCK+TrL2L4TeBIbu1+t2dCWh1D2uwC9DoL5Dm1ketjNR17leRRqAqQY7dchMv8NSA6o0+HGD6gDLBSqh0N/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by TY0PR06MB5804.apcprd06.prod.outlook.com (2603:1096:400:265::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:16:41 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::12b0:2e9a:1b1f:2555]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::12b0:2e9a:1b1f:2555%6]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:16:41 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yohei Kojima <y-koj@outlook.jp>
Subject: [PATCH 0/1] qemu-options.hx: Update descriptions of memory options
Date: Thu, 13 Apr 2023 21:15:20 +0900
Message-ID: <TYZPR06MB5418DC69BD2E73B51C9584119D989@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Iu8JEFoCH8GIAyN88aZnqbOX0fk4kfdJCmjZt9E8mJN9qWPqQX5Rf/vdlRZN95AK]
X-ClientProxiedBy: TY2PR0101CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::19) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <cover.1681382291.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|TY0PR06MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 5face987-c5ff-4f4c-15db-08db3c18f028
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vxBRvxJGLHx4Em7/Q9FPSAHLsh/nAf9QOFfr0VYtrjnPcXzcZngCVhN8A8VR4gEpYjMaLZtP5/PK0h+cm5qrGQFRelzdGVGPgNEFnPwzCb3ezR0cJMzz2llzeQS5dcrDyVq9KocdSU88AhHOcjZ7hvGtJs27oTGEuyk84suLMdeP3Jz+rthUDus2Bx8T5LbCTKW2bDhzPdgzJvHcXjt4c78ZkgvAHPpp7PMZqzjQSMs9QjwF9CbmSrWUE4H+5qNMyYQZj1B8a+9wEALg0gIa5TRfudlXDbKTt81Qi8F2It4s17m6TMDmoLUmILpE/awmR2rFWolzQwUH2p24gmHmcn/VoPXheUfeA9ulYkVFGLoYvId03PhcOsWsPx/K31sZk6ge0fy4uM0uGGur64IOEV4V2TMvHRlugphMPk3BIIhGXW/PWPBTyhdD3K7RpSii8YhYkmMz5dBhfgzlo2TEyFZy+RxdhJLL1SEG9CrwbyEO9G8Sxa3IrAMJQaQQ/3gvgkR8Km1n9V9hjoL8NkqLkpMBpUsYsww/4c3MXopQv85vKSHTMAQMc1h7gffT4rmiJcQWn6/YDaprAgFIp6Vz7UhNef38vlAyt9R2ToTmAjZerXn2rSZK7S/XfwBff3tM
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Orp9tku7pSMh+inRc2qCTdZrG5cYkoAyO3ThQ8ApzIpfWka26qM6409hwikJ?=
 =?us-ascii?Q?IpV4zdVxiqWhZenZSfhhJdghm/TxzXG15O8hE0VFVjx/7hjwOGMyy07dsZNi?=
 =?us-ascii?Q?Cw/J2BZUI7ja8gCBIQIbRL4e2pF/zszGlYLv+KcM4bP2foj4XhIdoesv7iMT?=
 =?us-ascii?Q?QDW26Q6oRYgcZrnIJbVMceklUZ9Cw9MadcPUFcdcmXtW9gpacRbzX3SE7Sj9?=
 =?us-ascii?Q?aMwosChPoVf2ul48GJhQ7IjzFoUnGjdK6XBnXlfkXqxxX9nUpKd2gWy83nAx?=
 =?us-ascii?Q?P5beo4cDxvYWQsNCUNx82IhqtDuJvdGvK3xi9OFPryxhsWdTpgpvPuQaeO9+?=
 =?us-ascii?Q?c7wbzH4mChKc+RdZFtLc3mXreIXwaV0upw2bgR99Pwr5O8bDe03/neZ6/yrs?=
 =?us-ascii?Q?rExRTfkAC61Xny2hRCwgtUr1jUkPIvvvLbKyi4TEwTdU1y2Wr+LOFFu0OxfM?=
 =?us-ascii?Q?ocluYG3PHaAyFg3DNr+lbKL9nup1DXJP+wBz4RVL3lIELIOBTEB0H+9XFgK3?=
 =?us-ascii?Q?rBnR4lnBaCGM69gCejebfLJgZggTmEO1mlJzsi5iTLiT+Ms7Kvc/xvAdwrHZ?=
 =?us-ascii?Q?s9arOFdmYmHP/yRvVPnuAEsdVderQ8T8FQ920Q9TEwB67snXvL5+6DE52lO6?=
 =?us-ascii?Q?s+cAO7EJ79lcPTV2O18HLOtb/X9disIksncSNQk+oWs3U2kyrRIUS7g4cv5I?=
 =?us-ascii?Q?3RhFj05ghOTKvl5IboCJY5Jug2OWQ9Ffz00NoFA5U3DrjILRazw7V7YY8ag8?=
 =?us-ascii?Q?QkL9gyJIUY93xOttLxDGWL6xN2ABC1TTqoF+DavqAfFulU4b13xp93Q/uykU?=
 =?us-ascii?Q?qjWXFtUnwvktDBhvWJAO/UKN+kaLXa1E8zlTBSGnoyNBUYJtViKZRjOWPGnv?=
 =?us-ascii?Q?mbqlxNkPHkTmXswxl5DwWEbGPLPdVoPWqinJtIYQiJkezISl8UNlkyEKk61w?=
 =?us-ascii?Q?oQzDKbmDeCX0Zl8kg1OHFqX7B/dt0VWqQ3Qm/K5BD1jJFnVNEyMBqjngHn2c?=
 =?us-ascii?Q?zDxrHwNvDBzjewDL0zAW1tflXD9fWnS1ohKksm4kCbOeiwueseqrRC8n9gYe?=
 =?us-ascii?Q?WIXxVzka78G75pLnHJis/eoYAjIKodKj7weHTOeAG0ZgsFpFF0K9GhfhNOCj?=
 =?us-ascii?Q?H7E9Ds71Clz2BzjIMoARh1nBG/IVviXxijbCxZi0FKq3MzMPqkrUc1fUj6Xb?=
 =?us-ascii?Q?Zrc46P3Ki3fRTu3NDYF8l82IeESuU7Yr+YHH93ZVLjHiK+3efUWr9duYFVP7?=
 =?us-ascii?Q?nEEml9EguAWSza2zFivy77rHwZPC/bhjd2TR+GMPQg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5face987-c5ff-4f4c-15db-08db3c18f028
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:16:41.1820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5804
Received-SPF: pass client-ip=2a01:111:f403:704b::81f;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch updates an outdated description in qemu-options.hx.
The patch reflects the changes in qemu behavior already described in
another documentation, and it also changes paragraph structure for
further readability.

ChangeLog:
v2:
    * Moved the description for the legacy `mem` option below example

Yohei Kojima (1):
  qemu-options.hx: Update descriptions of memory options for NUMA node

 qemu-options.hx | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

-- 
2.39.2


