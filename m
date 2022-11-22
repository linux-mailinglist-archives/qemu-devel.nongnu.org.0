Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83379634B0F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 00:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxceO-0008In-Vn; Tue, 22 Nov 2022 18:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1oxceJ-0008IM-VF; Tue, 22 Nov 2022 18:25:56 -0500
Received: from mail-dm6nam04olkn20830.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::830]
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1oxceI-0002SN-1v; Tue, 22 Nov 2022 18:25:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTfJPyWiqsQHqNDy6msQR+DRfrcbrFG0VotlU429gEJvnZT+vyLQjZqefDlnlAUaFdMWa2j+6ssbRsWQIQlpUgOPvLn6X6U8DpNy9M3qIGr2ynPHAMffS6/xpCYJEmG/e6X7fZ8c9zQvvjGJ2Aley/x/lph/oqFXHhJv2Pgi3lk/SU+HoOCos5tLEHhAmeexJzoHH0QVmVXMrf93wmDxx66zFrvxx+a5ncRG67lUEX4pAdiWnQIH+M8Dy+dFSwi8yVI3DNMm0zWMbiU+REuT5mxCPNSMfysfYl3joDHXDRZiozenCqmGdqE2J3nlKAOiJYbcRoG8sBcGn5s6Tuwipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEIZnGfCOIESqBIaJhm1AfHrqZDpjZg/IFaWEOkocU4=;
 b=jE7nEd/XAgMXfCUvBfffCjRvySwLG6var9WEoR+6SiwRhnT6aaBv9u2w34RzDwswwmciOYgMHANAgizoNw+68fIBSR+zUYfXd/WnTkRI8axSrqw2brprzuyibEmjnbtBef1QOTnZm5TN2Rxi/ADYbC8KohaVODJgDcaK1UoYj0XaWQo6SZbT+ydGU9KVlyz1Vu2K3sYilN3KVINEp4dW4EPLPB7y29+9QULRjlaB/skR2R3QwjT2YucWoAYZFOeLmVtPXTlWdhzIVfpVkt/SIJTHowHC/OJyqFZ/F9caAkENSbSEiCZ6xTJZ0X6uzbPw+k1MF/TioIf6dH1CObBlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEIZnGfCOIESqBIaJhm1AfHrqZDpjZg/IFaWEOkocU4=;
 b=jxjwF2dNboHDoNz8PN/lNuuaSfXCw/fjx+77oVxPmJsphJrgolV4D1Wkpq7vJRRHICnDMoTYbkplJdVmev1ntc2XmGqZlQIAh1bzkosddlHd/AarOTs0LPMkR2dMowLX2NXdQoSFfguh5SkKi7YGWnjYWx9GwKgbhJ+CqAAjhSPjUZb1aQR7yxY8Xeg8V7C6ddv+cczmE9U2NWHiXM+d/LVQjYoHQsBzmburJNBVx217Ld8o1sbNVXkjSzrzXF1ii+9zkLEuemFfpypyOzXAIQDpNdosK9PGCCKWrQN2VCjbEPhTSFin4megKr3e7ouw4gQ+5c9v22rJjgIVUYzFLA==
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.18; Tue, 22 Nov 2022 23:25:51 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a%7]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 23:25:51 +0000
From: Zhuojia Shen <chaosdefinition@hotmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Zhuojia Shen <chaosdefinition@hotmail.com>
Subject: [PATCH v2] target/arm: align exposed ID registers with Linux
Date: Tue, 22 Nov 2022 15:09:15 -0800
Message-ID: <DS7PR12MB6309BC9133877BCC6FC419FEAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [pE1q3l6pHUrDutyp0V+C8HaFjtRkGSWz]
X-ClientProxiedBy: BYAPR08CA0052.namprd08.prod.outlook.com
 (2603:10b6:a03:117::29) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
X-Microsoft-Original-Message-ID: <20221122230915.13567-1-chaosdefinition@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6309:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: d3329629-e6f6-41fa-dadb-08dacce0e49d
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwWbbou6HBxIYezIxL6R5N2bhZXcuf/+fJVGCnE0AaReus9PTyEGLZODrrBUNPd6tJmWG5RTMJsJ2Tp7c12ISkGZ04uJkNlCbjZNr69Pk20fQMSCRiwjC5PGHYti7aGTMkXZk+MsNXGzFj41mnFlnUvhp/qu+67+MVwEdjGDn28USNh0ySofgw+l115oqQcqF+IgIccUzvi9Fl4qLcABwBafc/rKy383pG76cnRYdsNuAAltmMKl+TtiDZcXrEAhYF4CzM5Lck3nOmc7kqty9VTUMLY3CBVi7xBrOS6+5xXOmLeA/JMoZKbkVvG6fIC6yzSICiCIGqCgE7KcHFTLqo6JdCaboO3UxHeyiYTqYAjp4o+ZkhfA7xxyiNWncvuU45p6GLcRMAnxjZqIJzJ01yQcOIEthvung5R3e1PovVme1mU6QC+SpJm/ayd31wVfO8wEM+EvlAW5iWE674N5PPd57IDOuLIclYyrgCy8yxjXlo3x58u5dpaJw6uAhsUTTlHx48r5z7podtoza2hARCSueope9SYEdLHEm0Boj4RuTIXtX0x6yUtKh1WvxBMsntRgu9JB8Rdq5jgqLPUVA8B0xwCYFfWPA7U7Ok2TcUIHkseVLnHQEDZkk4lhlgaZYmYhDWo6kI+ACDrwLKOWVvjByyvsiN4evSY75W+Ya1Vq+3nZtcVTHp9rNRYXXkImf1SYCplNtvjfmIHFWaSr738k/CeuopVpAjEHPZjiXE9/zvt7Wknw9p18DJFVp8I+4vw=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vDZyUD9giMIjJJfxKwkH4QFWWtpNC5Ey0Sl/6x+6X3WGBGvR8q5xfwo5FJk1DLfXIsIA+Pb1bXykgVztqB7KQfjjxYh2eZ9k+4HB5VtCL/ZTCvikKxVvEzEPGAdsKfWVfKQpABBbhW1RcA1T6dRQJB8+5tYKLZVS60rHGlatIDSpg7wAJOXxV6yBXsNdv0XlKzCBAkes2tc8d1Bmn8a4yF+OCMseUcyVlEUpZfdN3gxMfueOsJ3wjE6+d+G9xeiFQb8s/E55ImlOYHOYUTJo0S+wTII0S7xip5s07ZBPIl7EqutaxLQe1T6HQgXwAwow/gciIULpG9sxXOXKODcIa7kZHYrYyPlQjvKR1UCB+LI8t3GMh/HaX0mujzOFC7rjz/buqC0P0Q+yr+1IzMzX6HlJWfqMs5GVJnLtCaG2JurzwyjHXw2/SLPU1LUizF3o8v7KVEqiEtGJdsFGZfNuIGWftp1f9R3lPZuPAAIhuzene5L1hD7LYmSLQNua7QKLjhkTl4FXfIO4f9GxUsSP7gHLJS59v4C7wqoRBBHzgkqYx5AsMZsWspSgFE8XMroFkxri/PV/aBnS1nFN0Eav9ZXmnbxa//CpC71Dc562ujaSX/2uQtj0+NhyBMIrMZcNMXLEX+cgcAhJ8VMCW6L7JvDHzWHOM3H2Q1r4RVsZZeM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SxPr3AoVsTIheReVrZTtisaw3zMDXDQd2Md2TDR9g/HkMziOcpXRjfXydUok?=
 =?us-ascii?Q?tWMPNLyC36mj0SCJ0J8Mug5LRqzhlmC8/KpNfei3sklG3euP0mKhkW1NfK2P?=
 =?us-ascii?Q?bIrNRas51gLeIYIAityegQeB57Gx6j/vHM7DpDTwuzsLBoTT5DBiHKJrReGd?=
 =?us-ascii?Q?KbWaL4nonIfhTOjs7c8wlln4+cnN6FJBRPC+Ysyx8D/0MFHUQuJEZilHGRzz?=
 =?us-ascii?Q?k2EMXeK8p7DWHXHDukWnh7KLu5y9YTshuVvQ3AYo9q3TWm5IGoiG29cQblX/?=
 =?us-ascii?Q?YCFIhKNZk/HoZW7DxddU5SI5G76i997sLmJreProLsmalozJ8RMuyfiVkEQZ?=
 =?us-ascii?Q?byTmNkWOR5UJmL/AMwY1ITnmk35NM3Nd8Kfz6Na1rz/vlqcRByMVR8kaMMJm?=
 =?us-ascii?Q?hdmCTz2X5KnIsMsl0ueRropZYunCS1Lky7dFoOw7cKaQ3HUlWQgJP3K6Ti70?=
 =?us-ascii?Q?eqcGPODjMXThq4SF1j9h2h8YYsMcQqOfBkjb5co09Ch0+NJVMMcL8gNB9yLx?=
 =?us-ascii?Q?kCoF7wAMbrq6p/lZduprmp/KBt/nPK6eUDas2IOGsRMcCZ71Vors7TQKwOMF?=
 =?us-ascii?Q?bu9mg+DEBCsSh/cqRmvD97R7SpJZxQGXzi5EWMjI219n/1mZNqSnzn92y6rV?=
 =?us-ascii?Q?r1efNPo9DJnUS3zDcsVz5Bss9Jt99QE0IpQVogGIVKdboc7IN5Qb6+Ug64SG?=
 =?us-ascii?Q?UYQ6CwSx8mstqG/GyFphe3fHJOdiX3sXDsOI3WWVFqmKY0vjh/oODdqHgyd4?=
 =?us-ascii?Q?hLvkgDf8rbOpuh/fm6kN1bcLTsbk1CXF7L5R0u+Qtp4yndcQkT6ScvN3Twbt?=
 =?us-ascii?Q?/WQUQccN82JBlGe9khN+onF7tnqkm8CDkeXU4iN5wtUZOX3Ua0FXo4JCKRI2?=
 =?us-ascii?Q?uYUpByHlgfOPPmHpMWRf9CpW/QKyP/tS8OVEiFYhVHqxGMZOXFD1k4m4/QdL?=
 =?us-ascii?Q?cakRjStJuEJt8qT6CNGogCCyO9DM4QVUVu+RbcnPHVku9cUajTtqpXujCEnz?=
 =?us-ascii?Q?a9fJUyL5fOGAMSYa4DeWYDFXu22HD/GbysooIQcad7tFaNgrOQatiQIAx7gV?=
 =?us-ascii?Q?cOdva5O3vC2SbPAeEwOl+JuJZTKEValZkAYIKwpW48WDJAvSXw+oNSBGNCRb?=
 =?us-ascii?Q?R4WLma/WvAeM4ofqKzSJlhYgZJMzvmjp78OJTPbBR5BwRBbOr/xtsQWlREDm?=
 =?us-ascii?Q?d86oyWaFLkBPIXnIZxZXZCTGdqhyOSyGb+Zb7ACvvlik8XBnRCx+imY428c9?=
 =?us-ascii?Q?5xYbd4YutgXY55B2nEnEwUKeX3sTbpPmjlXhv8vzxJFTZiNQ09HWmdNfe0Re?=
 =?us-ascii?Q?XcQ=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d3329629-e6f6-41fa-dadb-08dacce0e49d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 23:25:51.0230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
Received-SPF: pass client-ip=2a01:111:f400:7e8b::830;
 envelope-from=chaosdefinition@hotmail.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

In CPUID registers exposed to userspace, some registers were missing
and some fields were not exposed.  This patch aligns exposed ID
registers and their fields with what the upstream kernel currently
exposes.

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

The code is also refactored to use symbolic names for ID register fields
for better readability and maintainability.

Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
---
 target/arm/helper.c | 96 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 79 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c8223ec3..82e45be04a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7823,31 +7823,89 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo v8_user_idregs[] = {
             { .name = "ID_AA64PFR0_EL1",
-              .exported_bits = 0x000f000f00ff0000,
-              .fixed_bits    = 0x0000000000000011 },
+              .exported_bits = R_ID_AA64PFR0_FP_MASK |
+                               R_ID_AA64PFR0_ADVSIMD_MASK |
+                               R_ID_AA64PFR0_SVE_MASK |
+                               R_ID_AA64PFR0_DIT_MASK,
+              .fixed_bits = (0x1 << R_ID_AA64PFR0_EL0_SHIFT) |
+                            (0x1 << R_ID_AA64PFR0_EL1_SHIFT) },
             { .name = "ID_AA64PFR1_EL1",
-              .exported_bits = 0x00000000000000f0 },
+              .exported_bits = R_ID_AA64PFR1_BT_MASK |
+                               R_ID_AA64PFR1_SSBS_MASK |
+                               R_ID_AA64PFR1_MTE_MASK |
+                               R_ID_AA64PFR1_SME_MASK },
             { .name = "ID_AA64PFR*_EL1_RESERVED",
-              .is_glob = true                     },
-            { .name = "ID_AA64ZFR0_EL1"           },
+              .is_glob = true },
+            { .name = "ID_AA64ZFR0_EL1",
+              .exported_bits = R_ID_AA64ZFR0_SVEVER_MASK |
+                               R_ID_AA64ZFR0_AES_MASK |
+                               R_ID_AA64ZFR0_BITPERM_MASK |
+                               R_ID_AA64ZFR0_BFLOAT16_MASK |
+                               R_ID_AA64ZFR0_SHA3_MASK |
+                               R_ID_AA64ZFR0_SM4_MASK |
+                               R_ID_AA64ZFR0_I8MM_MASK |
+                               R_ID_AA64ZFR0_F32MM_MASK |
+                               R_ID_AA64ZFR0_F64MM_MASK },
+            { .name = "ID_AA64SMFR0_EL1",
+              .exported_bits = R_ID_AA64SMFR0_F32F32_MASK |
+                               R_ID_AA64SMFR0_B16F32_MASK |
+                               R_ID_AA64SMFR0_F16F32_MASK |
+                               R_ID_AA64SMFR0_I8I32_MASK |
+                               R_ID_AA64SMFR0_F64F64_MASK |
+                               R_ID_AA64SMFR0_I16I64_MASK |
+                               R_ID_AA64SMFR0_FA64_MASK },
             { .name = "ID_AA64MMFR0_EL1",
-              .fixed_bits    = 0x00000000ff000000 },
-            { .name = "ID_AA64MMFR1_EL1"          },
+              .exported_bits = R_ID_AA64MMFR0_ECV_MASK,
+              .fixed_bits = (0xf << R_ID_AA64MMFR0_TGRAN64_SHIFT) |
+                            (0xf << R_ID_AA64MMFR0_TGRAN4_SHIFT) },
+            { .name = "ID_AA64MMFR1_EL1",
+              .exported_bits = R_ID_AA64MMFR1_AFP_MASK },
+            { .name = "ID_AA64MMFR2_EL1",
+              .exported_bits = R_ID_AA64MMFR2_AT_MASK },
             { .name = "ID_AA64MMFR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64DFR0_EL1",
-              .fixed_bits    = 0x0000000000000006 },
-            { .name = "ID_AA64DFR1_EL1"           },
+              .fixed_bits = (0x6 << R_ID_AA64DFR0_DEBUGVER_SHIFT) },
+            { .name = "ID_AA64DFR1_EL1" },
             { .name = "ID_AA64DFR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64AFR*",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64ISAR0_EL1",
-              .exported_bits = 0x00fffffff0fffff0 },
+              .exported_bits = R_ID_AA64ISAR0_AES_MASK |
+                               R_ID_AA64ISAR0_SHA1_MASK |
+                               R_ID_AA64ISAR0_SHA2_MASK |
+                               R_ID_AA64ISAR0_CRC32_MASK |
+                               R_ID_AA64ISAR0_ATOMIC_MASK |
+                               R_ID_AA64ISAR0_RDM_MASK |
+                               R_ID_AA64ISAR0_SHA3_MASK |
+                               R_ID_AA64ISAR0_SM3_MASK |
+                               R_ID_AA64ISAR0_SM4_MASK |
+                               R_ID_AA64ISAR0_DP_MASK |
+                               R_ID_AA64ISAR0_FHM_MASK |
+                               R_ID_AA64ISAR0_TS_MASK |
+                               R_ID_AA64ISAR0_RNDR_MASK },
             { .name = "ID_AA64ISAR1_EL1",
-              .exported_bits = 0x000000f0ffffffff },
+              .exported_bits = R_ID_AA64ISAR1_DPB_MASK |
+                               R_ID_AA64ISAR1_APA_MASK |
+                               R_ID_AA64ISAR1_API_MASK |
+                               R_ID_AA64ISAR1_JSCVT_MASK |
+                               R_ID_AA64ISAR1_FCMA_MASK |
+                               R_ID_AA64ISAR1_LRCPC_MASK |
+                               R_ID_AA64ISAR1_GPA_MASK |
+                               R_ID_AA64ISAR1_GPI_MASK |
+                               R_ID_AA64ISAR1_FRINTTS_MASK |
+                               R_ID_AA64ISAR1_SB_MASK |
+                               R_ID_AA64ISAR1_BF16_MASK |
+                               R_ID_AA64ISAR1_DGH_MASK |
+                               R_ID_AA64ISAR1_I8MM_MASK },
+            { .name = "ID_AA64ISAR2_EL1",
+              .exported_bits = R_ID_AA64ISAR2_WFXT_MASK |
+                               R_ID_AA64ISAR2_RPRES_MASK |
+                               R_ID_AA64ISAR2_GPA3_MASK |
+                               R_ID_AA64ISAR2_APA3_MASK },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
         };
         modify_arm_cp_regs(v8_idregs, v8_user_idregs);
 #endif
@@ -8165,8 +8223,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1",
-              .exported_bits = 0x00000000ffffffff },
-            { .name = "REVIDR_EL1"                },
+              .exported_bits = R_MIDR_EL1_REVISION_MASK |
+                               R_MIDR_EL1_PARTNUM_MASK |
+                               R_MIDR_EL1_ARCHITECTURE_MASK |
+                               R_MIDR_EL1_VARIANT_MASK |
+                               R_MIDR_EL1_IMPLEMENTER_MASK },
+            { .name = "REVIDR_EL1" },
         };
         modify_arm_cp_regs(id_v8_midr_cp_reginfo, id_v8_user_midr_cp_reginfo);
 #endif
-- 
2.38.1


