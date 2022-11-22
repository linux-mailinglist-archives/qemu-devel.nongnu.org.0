Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631BC633E14
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:50:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTeK-0008Vv-99; Tue, 22 Nov 2022 08:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1oxJbJ-0005pe-AS; Mon, 21 Nov 2022 22:05:33 -0500
Received: from mail-dm6nam11olkn20811.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::811]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1oxJbH-0000Hp-4v; Mon, 21 Nov 2022 22:05:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCR2GsC5flrVxqDkxvgUIlC1hUgzy6bogteSFrPySEpaKe98Ca47K+TXy2yJ0/N1GghlUVNmrSo1g5yAKOXFk+3IqAL2WlszJ//XRXSEpYtChRYg3bQo6QoiUStdOBE+B9hy1Bje81KYtiSGdb8bX8TKmWVYowkjoSt16XN4+lA2qp41qtqDvjU1vXjXBsZE6aaZhjszPxob/Ht1F2ErFb29bkeo1zWarlWQvkrD0QiH/pzOiWtsmyXJ5s0emVFAhV4bl7DqZn3TdmzL1aoSs+fuYsbdlOGIW4XYry6DG2FDA2K2aBnQK5WzNtetiNU023CNAOSzUi92pqJ/eJKk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah+xn56tt6K48JLBuBwrurm2zfGpGwFBTrLgugvhpno=;
 b=CfcIB6NYOFvWYQTsgqAFfkKUIuYvtPXm3wSRqQpYYfwY7RntOQyoV7wG6XoCzziGgRgDeqrF0ab+OS9oWEnDLmWqYfPuMZ2K4Tx5XKGEeSav4rSL9vMQ6A7Dj4sdVp/GIzQ4BQvRHXltAuFjjuQP1VX38Lj4gT4ql/qVfnJQghVULYEtuDGRvD1WH6Hek1ltDNni7g4Y8OOHnAvQkAM9nFC2btxmi2Dd5UQvsEWjKuNNmfK0JBCiq3oMKtNYVkYFxwd6T2kSidh+hZ5oINXawKwbHxtGgKJrA0sj4eS/IR3C6wSKYgOXe+5s60DAz5TlRebGBXzqBPrIdsk75foJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah+xn56tt6K48JLBuBwrurm2zfGpGwFBTrLgugvhpno=;
 b=LYcLUGjSZjRBbkYxOLjPuW/ZF6zh6XVhYPuAb5FaWBM5BzhA64lyKgdKvw8AV65peoqABTVhdBTso4g2HiwIMz0a1f8mCZO6L8na3Do8C7YcgdlDVSW+aw84AecgOHyARD5L/LjLWRJDc6gXMsfvumnnsPKqu8IHBBmNO9/hIFFHWgqZAMcms7M9dOAav8vfujbD9zhH2jZEEbM73qA3OrLFu+ipMAW9OVPE8jgXNWc5dvRirAWg9lQ2m+NlrrpOEQBMTM0MNEnFASyskR8yRx+ucQeB7PEbLVLAGHmDvChhgqww4GUXm6YbmyKOuuMStna8nSOjEo1apPkF7360dg==
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 03:05:23 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a%7]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 03:05:22 +0000
From: Zhuojia Shen <chaosdefinition@hotmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zhuojia Shen <chaosdefinition@hotmail.com>
Subject: [PATCH] target/arm: align exposed ID registers with Linux
Date: Mon, 21 Nov 2022 18:48:23 -0800
Message-ID: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [WiS9OyKcz00ltviuUyRNYQYq7GYeJNhW]
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
X-Microsoft-Original-Message-ID: <20221122024822.5756-1-chaosdefinition@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6309:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 3639f446-1867-405e-b9a7-08dacc366557
X-MS-Exchange-SLBlob-MailProps: dx7TrgQSB6eSv4UmQnMV9cVCGzYXm8r2MmKrYmjsTnDJx+4f366FEmDROppUfKbIOkafE1mu9GMWA1z8wSf2c6XQaQRc9iXgbFjBD5tV4tsJOAAk93m737x/aUKmz5XPpI89O9YU3hMNkPuDHT446RxcSeEUv6881b9OTRl0fuzdKobc90VHxAK3odRJM5WxD7g+9/boh1S83NeHgqSc5atsqEtL4RK5OuGsZg4OSdMYPCm5WaJePXeJGFBRXnMW0COw8K0XSfuQ77SQhz7mUXjyff86Fk+z8zI4m+strXrpZMd8VCnHwHXA8rC7Rcv7OK1CkrmeJPX+J0qd7AONZ92xWR23/furglVHxanQFFcWCbVL3S26Fn3YHQuVW6dsfbWRg9N/wDLSM56J3LPBisvsb462WgxIiyp3XQWq4bmwIZ0R+BpHKgYeH0MDP+1BWEHNLSH0+KqMziTPFYCqmAkHUcQ//lmA6uGkgdgXf1KXbfx9kv0JJgi6C1f1yHoDRsBn1mtvhT1WOcaokUTze/OuVgzyJWCRwgqBglgWHicAWh0d7c/qMK5ELrQYyWxzjMiKVIpy9yn8bqhnTdX9/pMZEQ4D8ea4k+FrYDHwg1efl5A4uN008AzU1im9NROEpQWzoDsoe2n2qMU6s82DflpnKaFNYMnaUlcYdgjEem4LCI6IhSFxEVNvncaN9FcWKrjA7qRLfTXBuJWaGWiFSacC8/LITDk6xF6mchA7d6mvfZovOcT2bVI4VOQwGGfvLleYsk8qOc8=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZ/0LFAmNaD8g4iGsq/4SVb0XcXTQCO/uAqMXavoYmNkgpIaCh6O59my81guipkgjhulYV+v0HZo5lKZvJYB9CrF67rZX4DvusCqHojv9KjgcB3PWb9kJXkkjXyYPM1iJz3zWfC8mPM0lzthgqtMv+FvXStLcpSfY5xtRVcDXTLzQW36IOEDolm2ZVSLNiI13qGWTX0hhlHzczEMxQ33u1aFc5hP/LKoV9+oUCEDsGVVhIjDdMQ6ZqugiAbdUEQ9hp/U1U8sz7dliJun3esdQwSp1k4VippIPZ12d2SrFpNrXMT7My9XXCiLOwMoTxLgcpx+6MNwjofdqzyBmvXCKt0zAD04LS6x4ex4Hzeh55iGB9PyQafhbhxlpndGu0IRXHy9BU92lAfAvqTTkrbz9tMDnn5DzXigtdvSgV3h2sd0oL6C3ZHGkza/NtNYf6iRfnkAp5rlPKQF5xx0MsozBVNAqI00PLateVmQ0ok8afSi/O0cg0faXei71rEuXwtwj0Nlo3EPLoStOJzzCcfC11cVCWLDsTmHBVZHHOL+L9/HlIv1We+cJdBfdZA/fXiMKWZpt5DH6+572foJA3uhsbfxdzkUQLkbu2ckvQMgWTQDtQgEDspv8T6e1KHbhM2zOWyZwkpifLQzvYo7ZVq3pA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gpvvFkJaxckp4xJOwQEi3bWmWxFWA2H/MIHiNip5uYHK6wrbTCLFIBEXHCFl?=
 =?us-ascii?Q?jPPX1RPSfe+u49UWRvAFvbuc6AXEGYDeDiOL09WNdxU6UGpXAuuScsdnhNwr?=
 =?us-ascii?Q?RSk0D3xMQSlDck8W4U78R3cC0JVg6Kd7VXz3+tdzu3DetybegFWzMEaDCFRu?=
 =?us-ascii?Q?vXGFjU0CNIJcX53Yd4XU1Z5YiPi/HG7Hlrn1zaQE9vuYOy01x2A3N4/eoFcP?=
 =?us-ascii?Q?e05JCJy98UtEcFElrnOvvU3qbXbJTsbDGXAJHwwpSBVIn5TvlrXF0HK04IM7?=
 =?us-ascii?Q?9EHxg4qojBtnVzkkL3vqIoQmpdXfybzLY04RdXCd5JyZXY53IJqjtX82vdTS?=
 =?us-ascii?Q?XCpK55WvRvxtAQzBngNX/Y6ralgVo2idCWHzyxhqsyBbGt6c69Ve+F3YZTG3?=
 =?us-ascii?Q?ir11ZAk06QYXRQA1/r5wKTTrTIvVh6s01KzINI4zFo0o56SROhYN4qphuIaq?=
 =?us-ascii?Q?UIIglqKm8/0ggxy+GcpSzUBGBMlLU6FEsF4yttYf61eu1Lqx5zffDUdq3cga?=
 =?us-ascii?Q?Xj+58lpzYtGoYV7r8/6xSvDOt+1HxmUUARrYGeVBccPjjXhu4hlSHEKBH871?=
 =?us-ascii?Q?+/F4zi02J4/VuV20++A9BQKq4ORVbkBDZMILao1Z7q+dQFpO8thgKXXlishC?=
 =?us-ascii?Q?WsE31C5qj1S45JnfXPFw/u1xM/Sr/daSvOwcCoYeQescWTFjtHqjgFS6w+kH?=
 =?us-ascii?Q?5rDrPF6AaVDMIfBjcvlTdtS1xjfJZ2j60hcCxqVz35ckEhfMof9K2JC4tQJJ?=
 =?us-ascii?Q?K7C2HrLcJpoyY9u06iMTDrsgLVQwVxyFmmH+3A2IftiUKJmk0HFJdK+CkiGt?=
 =?us-ascii?Q?Q90i1Hs0Wp8EPdfgtHcY63vJHB/TXMeC0TnUYXi2WzntlawBDt3K/ww9DIow?=
 =?us-ascii?Q?B+4mdWzcOTqdhwO+UnJ8mhg59nyJS7sGhQONu5IFXsHJMQvfLkF+F2P8HFK2?=
 =?us-ascii?Q?Ssy2bqPAmm7WL2nJV7EdDKqIHpO/F0F7cg7oy9EmPDPoj5W6CfpX/2SfGBD7?=
 =?us-ascii?Q?adn/utKm9mJMw0bMP1U4oUg4aev6afkgMwQ7aHhqHCYOLDTmbIjgVW/KiKE2?=
 =?us-ascii?Q?ALIX+EWKT7JxRCZaEUfaQrIcinwLe8H/iJTDozvTRS4Q9jSpx6e1PezJMtyw?=
 =?us-ascii?Q?VBvzR4MJ9B11zx42XX5436LeyQK8S3gqymt3NlJQ9fmSrZUP9KknR9Bazl29?=
 =?us-ascii?Q?DTscpo9XLFM+vsmvpsTO94V141GviR5jIpAnzF2YVUAERaP9cggCOmJfzZTb?=
 =?us-ascii?Q?khigv3OJo3LuTHy8ZO05nTB0dBYgjWG9Yj/ALYxOtgNc0YE35Q1SKxEcmzr9?=
 =?us-ascii?Q?vBI=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3639f446-1867-405e-b9a7-08dacc366557
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 03:05:22.8769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787
Received-SPF: pass client-ip=2a01:111:f400:7eaa::811;
 envelope-from=chaosdefinition@hotmail.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Nov 2022 08:49:15 -0500
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

In CPUID registers exposed to userspace, some registers were missing
and some fields were not exposed.  This patch aligns exposed ID
registers and their fields with what Linux exposes currently.

Specifically, the following new ID registers/fields are exposed to
userspace:

ID_AA64PFR1_EL1.BT:       bits 3-0
ID_AA64PFR1_EL1.MTE:      bits 11-8
ID_AA64PFR1_EL1.SME:      bits 27-24

ID_AA64ZFR0_EL1.SVEver:   bits 3-0
ID_AA64ZFR0_EL1.AES:      bits 7-4
ID_AA64ZFR0_EL1.BitPerm:  bits 19-16
ID_AA64ZFR0_EL1.BF16:     bits 23-20
ID_AA64ZFR0_EL1.SHA3:     bits 35-32
ID_AA64ZFR0_EL1.SM4:      bits 43-40
ID_AA64ZFR0_EL1.I8MM:     bits 47-44
ID_AA64ZFR0_EL1.F32MM:    bits 55-52
ID_AA64ZFR0_EL1.F64MM:    bits 59-56

ID_AA64SMFR0_EL1.F32F32:  bit 32
ID_AA64SMFR0_EL1.B16F32:  bit 34
ID_AA64SMFR0_EL1.F16F32:  bit 35
ID_AA64SMFR0_EL1.I8I32:   bits 39-36
ID_AA64SMFR0_EL1.F64F64:  bit 48
ID_AA64SMFR0_EL1.I16I64:  bits 55-52
ID_AA64SMFR0_EL1.FA64:    bit 63

ID_AA64MMFR0_EL1.ECV:     bits 63-60

ID_AA64MMFR1_EL1.AFP:     bits 47-44

ID_AA64MMFR2_EL1.AT:      bits 35-32

ID_AA64ISAR0_EL1.RNDR:    bits 63-60

ID_AA64ISAR1_EL1.FRINTTS: bits 35-32
ID_AA64ISAR1_EL1.BF16:    bits 47-44
ID_AA64ISAR1_EL1.DGH:     bits 51-48
ID_AA64ISAR1_EL1.I8MM:    bits 55-52

ID_AA64ISAR2_EL1.WFxT:    bits 3-0
ID_AA64ISAR2_EL1.RPRES:   bits 7-4
ID_AA64ISAR2_EL1.GPA3:    bits 11-8
ID_AA64ISAR2_EL1.APA3:    bits 15-12

Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
---
 target/arm/helper.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c8223ec3..ce6fd7a96d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7826,13 +7826,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .exported_bits = 0x000f000f00ff0000,
               .fixed_bits    = 0x0000000000000011 },
             { .name = "ID_AA64PFR1_EL1",
-              .exported_bits = 0x00000000000000f0 },
+              .exported_bits = 0x000000000f000fff },
             { .name = "ID_AA64PFR*_EL1_RESERVED",
               .is_glob = true                     },
-            { .name = "ID_AA64ZFR0_EL1"           },
+            { .name = "ID_AA64ZFR0_EL1",
+              .exported_bits = 0x0ff0ff0f00ff00ff },
+            { .name = "ID_AA64SMFR0_EL1",
+              .exported_bits = 0x80f100fd00000000 },
             { .name = "ID_AA64MMFR0_EL1",
+              .exported_bits = 0xf000000000000000,
               .fixed_bits    = 0x00000000ff000000 },
-            { .name = "ID_AA64MMFR1_EL1"          },
+            { .name = "ID_AA64MMFR1_EL1",
+              .exported_bits = 0x0000f00000000000 },
+            { .name = "ID_AA64MMFR2_EL1",
+              .exported_bits = 0x0000000f00000000 },
             { .name = "ID_AA64MMFR*_EL1_RESERVED",
               .is_glob = true                     },
             { .name = "ID_AA64DFR0_EL1",
@@ -7843,9 +7850,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "ID_AA64AFR*",
               .is_glob = true                     },
             { .name = "ID_AA64ISAR0_EL1",
-              .exported_bits = 0x00fffffff0fffff0 },
+              .exported_bits = 0xf0fffffff0fffff0 },
             { .name = "ID_AA64ISAR1_EL1",
-              .exported_bits = 0x000000f0ffffffff },
+              .exported_bits = 0x00fff0ffffffffff },
+            { .name = "ID_AA64ISAR2_EL1",
+              .exported_bits = 0x000000000000ffff },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
               .is_glob = true                     },
         };
-- 
2.38.1


