Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6383FD932
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:03:10 +0200 (CEST)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOxR-0008Gq-6Q
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlR-00077w-I7
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:46 -0400
Received: from mail-bn7nam10on2134.outbound.protection.outlook.com
 ([40.107.92.134]:37985 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlQ-0002UE-4f
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVyBFBhkVPcrMOk6QqwW4zUlgCJqa2Y1bU4F2UuHQeoHAsNUGRpb0NApcsb1yKKz+O70cASjE+29gyKVL0xWsQsJB68YmQd+9tVN5GL5tl69mQDuDf35TSF7TD1yEBicvTy6NSuFilt7T4yj/ZZIUjKOwq9BxAM0hjhlMXj7H8Jh8CTj1KZVXu4aQay8Laf0IiCmtje95xwMDcjFg/8VVrXYCp9ArW2AK4Fx/Zz3+8XhVhCXY7j7M05uJoWTmBF4p2RPYlPTaHWxbkPptJHPWooSxY3tYSaAQ75KaNG0KU9CkQvgstoDX0mK1aA9xVq7TDxWw/OvBeTxLSzMS2a2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT/R1x1z+z1p3xQY7naIic6nQNwUSCMR6gBle7mPU5g=;
 b=hBEYtAgCF8T3ZzVqF4/ZWCSAQl1yiFbGTho8fO5v0tO5ybtBAcya0rzchuvM+wiHPiHiskpwd1iv9NwL1lZsbxklF6thW9ReY30QLtaCq9qzbWceEk6dfXgsq8ilGQn8OcjyJ6nn6LYC3HRQckBUOQqg/4jvaxMrCTLT9/VH/iOyPHJsUwYIGXZVjGj+AHrfjiVTOSIE9wego5Xo47DyEJXzkQR1Z9nIwhSc1J7kE8w3NjnTWlPcSVPmh6EaW+/nqmZ75jMuI7WXRRR2rvYDYex+Jwqz/rbX4fAy/srB9mf+RZFAPVhUzgVtfclSJvrBfWAfjGLEObC03heYJs6i7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT/R1x1z+z1p3xQY7naIic6nQNwUSCMR6gBle7mPU5g=;
 b=Rkq/XlbNY92ESn4+g+hIonM+TOHOhXfHatWvIkJVACUA4gJmWiXVihxaxM4IzylJ8fDnt5WT2Vt8Dgq+7xJQ2yGBdF2RVhrybvb1h8xe8BKUJ5ye5wjSRgJNgyeyGvp9JmioQlt0Yt7cidmiO9Hvv58YEdi9mV3RRbGQjJ+zb1B31IMgGgziKErtEsXXwv3EEt8ujoKcaJjuhwYg1Z+Jpys84kcowrTYecO+bs4TsYj5UaMvUJZRL6wMgEHdT0e3KfpFitaU32WNTlpJkuaaKZP3T+GTDc3Q/eJoXlsxKn1P4XpZRVeFZC4zJlVDxPZSHImsPjtrckWxvteF00K0VQ==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4224.namprd03.prod.outlook.com (2603:10b6:805:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 11:50:30 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:30 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 5/8] fuzz: use ITIMER_REAL for timeouts
Date: Wed,  1 Sep 2021 07:50:01 -0400
Message-Id: <20210901115004.34768-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
References: <20210901115004.34768-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfd13061-48b2-4736-6de7-08d96d3eb2b8
X-MS-TrafficTypeDiagnostic: SN6PR03MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4224DB58D74E2D8B579D5DE3BACD9@SN6PR03MB4224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G8dNsiaY+jdk5F3dQJqabKtkp5R1hBFtN5z0R2LLH6BAJvwJu7sx+fP/+DUrj4c1EKlqa4zqkoFKcpjqGA+6ZpEwF7pVM+JHLYnScQnKjIsbS8sd8yULMvNNXkAXctLlhgY4uK99bWvS/6J1Uxv+HJaQ1AucjUCevBxVCBKWAWW+LKIiFKlfUxysaucLJeyXqbjEbSfgjl+X6srN9AtZewVpba8jUbHhOfZ6nOasAohBaUD3pKs00vjfw0iccxqjgEvhFd0oa5iohITFMgKIquBtH40ZdFAm7hsoVKGeQC54lyxTCe/ae3zGAYRl4vGHB9ZpCwgs6LF4ENnyTFmQY0Mo4Hn3axoEDteLn9Y0cMUmD5M8w+sG5p+/dxCdLDpFiZioSrfzRaFQrtIRRoJ+nWCgG0jIkpvllVnieJpxLfbuBOlwGlasiBUKs93kr9RfdZ+eFR1qmAjBobQNDUIe7fs1B/R5jm/y6BhASze59iCsqf+hFWf1SJn60I2MDlLgFJoTj4w9SvYqQrdPoJL9b5JDGGoVkY2tTaAxmVR+GRoNK1/+nRaBSxsgkDKgFJjjAL/KBV9mJx9yt6eLK8bv+VR7uhvATFnRhCiAYjebqMLDB3j6GuLMms0YY1QA63CYIQ05yLFPDUS6sjkxvhMtJc2x42+D1BjPlHvg6XxYvWSWj/GS0DPvanZfVjGDwv6ZRdnpMh9F99aDuZs0Fy77Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(75432002)(8936002)(38100700002)(38350700002)(6486002)(4326008)(52116002)(5660300002)(86362001)(36756003)(956004)(2616005)(2906002)(66476007)(66556008)(54906003)(1076003)(83380400001)(186003)(316002)(6916009)(66946007)(6512007)(6506007)(8676002)(26005)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hJQ8uXefLXpwS5Sb9Ze1xfnU5+9JK5Pp2BEoccSe14PbNAGV0ObuqWf4xYKO?=
 =?us-ascii?Q?MaJOzxEmTaE7Fr9RvUyWeZ8Bezpq0ovxBIkSXi8rcSGHg2Jf4ZQB88B722dh?=
 =?us-ascii?Q?5v3x8hYgefcioG6OX9r7i/bRrP7Dkm6IUZ40uuG6hbL6CUw8xg+cecQtECr4?=
 =?us-ascii?Q?Zrq4NcFPWjz7dO7xRpGS49cioB+Un+XY+K0HccxSqNBWS2ieaMiRYL0wq//a?=
 =?us-ascii?Q?xdMHShijs/NyuFA6jFq1onWyke8vRr518lAaDqsFE7comc62KLWcR0ZEKzFZ?=
 =?us-ascii?Q?c5lgKw6vEpMnM+gkfKhjdUmI9SJWvW7x7dCeA8h0KWLp9dz3Jo2szG9EecNn?=
 =?us-ascii?Q?/uT6MbdjAoZJT464pkBgRl/XyAMM6ipCBqKmPfdKEO1OHDDv+J2b7bhf/P6g?=
 =?us-ascii?Q?GHKoSVncED6+Ci+xlz+M5Asah+eCcXZU815uoDSYRVO0hLM1WzIkLtJ2ChxB?=
 =?us-ascii?Q?G571HXOucx3PMBv/OvtLwZ9OEDLsO+ayAXjD0Pu+obixkz2jA7150DqZv8P4?=
 =?us-ascii?Q?/I5+K7AbP2ejIxH/8eA0ytS8r0lHC1051T7BzTrROduzemUT8r72KS4/brAh?=
 =?us-ascii?Q?E6yvX+P2fbTjSV+7wB25vURwPljEP1PYuwa36Nke/RvKUhTkCQdwXT1jpYlD?=
 =?us-ascii?Q?udrH0NKrqMDFNLSaT+PKny1UndS+9R9iT/PJy2gAKT26yEi7AmaOdSgu0DxM?=
 =?us-ascii?Q?xdTslnlzW5Kiz0zAmTqRETA9I20nHBVfh9hy4TYgFrf/fwSGDep/JvljmqfI?=
 =?us-ascii?Q?q7IooOSAET9LqEhTqKZjA7B80A06qCTthyD5OopxEB+5E5oiO8omXzhq8MMw?=
 =?us-ascii?Q?XicHGosE5k/T5GCuqhw0iAlG39qDMfCnazck30bVk39p1DHRHoEBZYQE/txp?=
 =?us-ascii?Q?X/nNBKexRdlGXETJDmasN9rM6Yxcd6+0+OJ4y4Wd/wsE85fuvpkZSjY7B8dV?=
 =?us-ascii?Q?rjpXNKD2Ey3iJTBuM3smH6MMmnCuw/+cWwPgXh2Xh3xfoKsyhUi3ULPF/h4v?=
 =?us-ascii?Q?n0u62G829Uz+xC4PCK2oI5isIsDJgzKvA65utqgYDxPfz9WXug6AV0ojcs3S?=
 =?us-ascii?Q?y89SXpWepe0vPtr/Q2C9cjid9P622qdisZMYCm5ZmpERVWIywXConH0uS2IT?=
 =?us-ascii?Q?NHc0Z8QtWoF3TpTP6oNc9iJBdgQe9QYmekcqaxrSjOeZnWjApT77cBjRXMu9?=
 =?us-ascii?Q?V0ni29TjQoZsuWjusUMSEYJvMs/nuflf9A2OGPB8bI01fbFaRGn7QktaVmg1?=
 =?us-ascii?Q?jjlOrp16l/XAQ99442RlOE1IAYUOvobxBAr+s5Uo2ODM1L9DEycozNKNdOF3?=
 =?us-ascii?Q?u1wh4xb0kTTvGNaw3bJjmZNr?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd13061-48b2-4736-6de7-08d96d3eb2b8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:30.5385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGoRk8v08A7NeOHRN1fESuebTDIrKMWuijfscQxG6Vcgm7CwITnpPXibNUamMJ2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4224
Received-SPF: pass client-ip=40.107.92.134; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bonzini@redhat.com, peter.maydell@linaro.org,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using ITIMER_VIRTUAL is a bad idea, if the fuzzer hits a blocking
syscall - e.g. ppoll with a NULL timespec. This causes timeout issues
while fuzzing some block-device code. Fix that by using wall-clock time.
This might cause inputs to timeout sometimes due to scheduling
effects/ambient load, but it is better than bringing the entire fuzzing
process to a halt.

Based-on: <20210713150037.9297-1-alxndr@bu.edu>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 3e8ce29227..de427a3727 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -695,7 +695,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
         while (cmd && Size) {
             /* Reset the timeout, each time we run a new command */
             if (timeout) {
-                setitimer(ITIMER_VIRTUAL, &timer, NULL);
+                setitimer(ITIMER_REAL, &timer, NULL);
             }
 
             /* Get the length until the next command or end of input */
-- 
2.30.2


