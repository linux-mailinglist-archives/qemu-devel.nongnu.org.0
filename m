Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ECA52A883
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:47:08 +0200 (CEST)
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0Lb-0006L9-LH
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.lugou@provenrun.com>)
 id 1nqyZg-0002DY-5a; Tue, 17 May 2022 10:53:24 -0400
Received: from mail-mr2fra01on061f.outbound.protection.outlook.com
 ([2a01:111:f400:7e19::61f]:43415
 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.lugou@provenrun.com>)
 id 1nqyZe-00046y-3X; Tue, 17 May 2022 10:53:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4oNxDcdT8JHf3Nm0f+OAypIX7FUJsapvHZWRga+nrsu5YlGDWwO04K50erLfXuk2MgVynYQMHkk2svkHMBPC/Hf2ZyxxbvaRRsMPh2+xDi2WyXmYo2UJuWexfQTryiERD8/kb1Yi+ETqpqgB1JzRqARZlWZWWpMQxAy4YEoxoh8AVl9fe81aTAtvOpWGc273EERj3CPD6iDD2qHokWF2idM8deFBSdiwD+vvjDM1WNMi5ELDw/57+kM/1rSjQc7+oR/oo9WZ0xOV+r+dUZrR5nl65D9ooarfBOZlIcbdCm8EoaZK1q02MolJ6MN6n9UUs5vQYALNLx7PWGAZzUB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc41E76hr3tCQJDkvGWX/0HNAiLGB3Z9IMzZOZL48lw=;
 b=aUdm+zfWwdaqlxiNzGtOvXZ//ORtHOTL42fHzNb4YkhCIA7x/exIAaRQqnWmUVyJkCx0SNzOFKYX4RQx55YG3YZuCaxSt5XTRl/MlcKKeCzYbVwmXI/uNzCBRLW0lUXo017TMxnPSkUTv3ql99mTbWZUa8DHC3d8GfEYCRaipgkVYiZglc9ZE4uFSJjoq9webTmc3+I63zVVXQmaW6B4giP8MKyza236Cjq6Qs8ltU/2zwMv1s5f5Rp9qHWaOA8wRoUkDbPvClnWeqja3PiKuO6ke79nWlVZlEVBW+NIlxxcSTWjxQrVhteyjcT/H5GIot8CKYhPWvS4uxfo4MLxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=provenrun.com; dmarc=pass action=none
 header.from=provenrun.com; dkim=pass header.d=provenrun.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=provenrun.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc41E76hr3tCQJDkvGWX/0HNAiLGB3Z9IMzZOZL48lw=;
 b=XHauJPXA4yYvXkHdVhxdZRnbvTyg49Ik3WCTVpY13MT86SbjAgL3SM0PYKpfI7FnJImrCd8VByt3pXOut4OAEAd6nnqji7yyyQZ/Ov53QWywrnDsGoAZSGMFVWpv6xdluSAm3hNMCjvvdF40W3o+8K0wbZPpj0D/7mgOIkxsLyOPfqxhzkfrnJhrQMOQKonoWiUk0Ntz0aWkuDrhcPIK/kn/Szk1+c3Me081HPYC2cWQglYqbW39IZPJUapuI+1gXE+hVUY3Xb2fmhnotKxm05m/PrvMuhk1ciohDL71UGt3fY0sQyrfU7PsILDemhP5SedF7cbNX7hukcsiwmo0fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=provenrun.com;
Received: from MR1P264MB2531.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::7) by
 PR0P264MB2711.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.14; Tue, 17 May 2022 14:53:17 +0000
Received: from MR1P264MB2531.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f09f:b7ee:d841:b4c7]) by MR1P264MB2531.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f09f:b7ee:d841:b4c7%3]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 14:53:17 +0000
From: Florian Lugou <florian.lugou@provenrun.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Florian Lugou <florian.lugou@provenrun.com>
Subject: [PATCH] target/arm: Fix PAuth keys access checks for disabled SEL2
Date: Tue, 17 May 2022 16:52:42 +0200
Message-Id: <20220517145242.1215271-1-florian.lugou@provenrun.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::34) To MR1P264MB2531.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:34::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a5fbf16-4eed-4b0a-d4c0-08da3814f9dd
X-MS-TrafficTypeDiagnostic: PR0P264MB2711:EE_
X-Microsoft-Antispam-PRVS: <PR0P264MB2711999683946EDB8727DBC3F7CE9@PR0P264MB2711.FRAP264.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dEGFmZjkefVDVUBxKX3kr6S0V/Rjqs5waQbaUY7dwpbhfrQj52tqxOUtTPPt4pCOa6yYVg7AY2QqQ9omIiiPgEfMyZBEaFzXZ6zIvfzPebgkP1ReFJDTGnJ4XIwsnfJCoxKxzwnSL9H3rRLEdFSwHw9AUA1s/TgikAYnbwML1tsCWQt+Bgg3DLq2YCdMWuDKR+LfgJmCkWT544eZM1IMxf5hhiJNb8CEHMZFReOzR2x0E//lrtvUNBRhGOd6IZogWJfuDvZVkuQx13/KEYXgV2BsxqfQwP8V5P8UEQ/JaoDKCu7s5InSRJvPpVMgXAtE1qucYmd9i3qkk9uWrizEoqslG7j4kYc9bYGYw1uXf3UfKr2FGmRDv7Q5cRxCp7xrhQk1hEdg3/F/rmUKXMoNviby/fiSN6zEF0Vaa9/9iFiEsgTb7uY2emfTHeGUXx+9NppIz/5FUMxiRwgB5q7hWvWPGr3UV5Fwt+eDhLZLH3HAMHGVQd4ey6nxGlJtAK9IgnaQlOOs/fHDGa0aY73H9+WDnNgt8z/jbNIyUe9ZB1w0VcWbVw4zbZef5r75vG73BsC5x6pQ6661wtOs6kgjqjhMLDcf497Mui3Bk+BuY9ChiuemMDoPVinf7FcuueTqeBb41zsDGQklXZrv1XP/LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2531.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(346002)(136003)(396003)(366004)(376002)(39830400003)(316002)(52116002)(66556008)(66946007)(83380400001)(2616005)(1076003)(186003)(38100700002)(54906003)(5660300002)(6916009)(6666004)(2906002)(66476007)(508600001)(36756003)(107886003)(8936002)(4744005)(41300700001)(86362001)(4326008)(8676002)(6486002)(44832011)(6512007)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xcdJY7ZztQme29lR8Kl/sOY6udHAklfK7GVuCkVtusz1fuoGk0ZjEWzWkPL7?=
 =?us-ascii?Q?jIzVqJ1Sahl3RkF/XxvuPEXVFlG03lWFECiXs1qn0lOImCqdU7VKjhkwiahU?=
 =?us-ascii?Q?gPCp9hPQ6IZY19WsMTsJuVrM0s2y0Ie3ObLy/M0i26dWggzcKt2XntQk8vnN?=
 =?us-ascii?Q?pNK4FDi/z1oeJvHvY8UFcqA7UPNRqUoPdtrsUXU6u5Sot2dAkR2NhJxkC115?=
 =?us-ascii?Q?3whvnPCPUy5ivVi7SRWb5ilYrlXoTM5AJ2Da1NX8JC/Md9QzgNhYF5axVAQy?=
 =?us-ascii?Q?naNXDCuHJXPZdB7pmu2W6R3l+m44bftKdxDwVAB+jVdVBZZLSQHQntxp2R9G?=
 =?us-ascii?Q?O3itySLSsstAw4U2U9CkIKyi3i2YwecD89xvTfekX+yDCoeSWWBy+yoxSJjU?=
 =?us-ascii?Q?jhMLMPviK3AtEH0LONFU2Ab7LHLo6fJrG6xTVR0x+SEQDQI+LtyHU3mP9pYr?=
 =?us-ascii?Q?33ew2bbPLXgc/60v6cP1iyjJ26qkmxfl7UBpB2D7rZ+iR9/y1Y9ZerDrLI/c?=
 =?us-ascii?Q?uYROpPkbiZ8BQt3WoIY9/d4xCaD1gqCZxcjwciJ1EDm2j4EQe/JsYDqLXUPy?=
 =?us-ascii?Q?BKS0T5D2emQDf1sEtDNjnWDMw5K9qCHVYzBESTGvnkkZ3Ad9rUV9uQ/dBVn4?=
 =?us-ascii?Q?n70WbDxbIbqlrvpyfK2WJ5fInQ/ls3oSCNtyQgaqBMckMGfBW0r4EnntJe0j?=
 =?us-ascii?Q?yxONaVD9zcZ1N1ncMV71KTfIneHyG+Zx8keMh4YMsVzmiAcJgj7qV8ss9Nz/?=
 =?us-ascii?Q?RDJb3wch1KXhK9w/XQplr4ZV6p0TpbCERolz3DO4ewvrDA4JK7ESpyCIS3Yo?=
 =?us-ascii?Q?HaEyC+/UiVMmjcBQFd99sh9kBhPJocJEJBoZHKw8Q+EQf9QUE3u6DJbzsMFG?=
 =?us-ascii?Q?BMo5+dApbcPnPgOoZnvBNGqc1aEPXVo2PpXBBZWZx2S46MDBeBIN/NucyPEk?=
 =?us-ascii?Q?4qE+OTXRwOPLbYKRVnC5UsZoekRwvnbVQXeP5blqNb73uR0MnebumT7OqHDZ?=
 =?us-ascii?Q?7/JvMK8N+5ngE28ADGM71tz9h1t6lR4lcjcpRsQo52pVhzfuwuQ9eC3nCNXj?=
 =?us-ascii?Q?rOx8Rp3v21hCXQ1CfausYdBeSKhMmWITc1Efu1bmtVXy1OMsij9SwiF4uhFg?=
 =?us-ascii?Q?kNiDabEs5ItRjNR1qEEU1DRYSg//dm/DV4HqzKrDuml005qwnq51pd+ZiKZ/?=
 =?us-ascii?Q?wA4CHt98izL1yIBVcikikJoCo9HhwwD+DHxG0cNw7shLr/CdTSvZ3YlR7W3i?=
 =?us-ascii?Q?Jeb04cr/9hA2qnmfsuJdZqU+XCZwaFlvOnRicmX4XUmkiVFYs0F9mh9Nvfes?=
 =?us-ascii?Q?EcqU/IQNLNq2j+6ez9ojuK9LRX9TMhH/VIlfQJxfViH/+xt1rsbJj3NdC71c?=
 =?us-ascii?Q?XG5Vlktg/Yxmzvkor1t59/HjTbfhM38ws8UZqCM/TDbFSF6w59zB0p0D606L?=
 =?us-ascii?Q?w7GOpRh/YeIz5VkCiTX0m7Me/kGGPU5wKpDCp/Ak+6yroGk1SSQa+gAkASVx?=
 =?us-ascii?Q?s0xz/4umMkgY/pnRS0XgXUtGydJ1TItga4QYEvr9buyU56qm4DO3YGh0GH+e?=
 =?us-ascii?Q?MorxRBlJ+HUFKAyhq77oiDDy/HezLdwSOHsJ0L2bSrz8y/L5kKR9vK3zqSlJ?=
 =?us-ascii?Q?FWOhrreZ8T+MXmfv8XBLekceaDBgzDO88cGk8cMyyhWhfTR0oEXnLJjWqPF3?=
 =?us-ascii?Q?6gTL8QzNJeoU8Yf+gItYjKm7T7fEKn/m44Af10fuh6d8ECgwEGNtczxXcLck?=
 =?us-ascii?Q?MJ7AtPXM9JphvBsL+ooxUjIS6d9Yv10sz3DjqhdeZynmMKQLhnwirftSExec?=
X-MS-Exchange-AntiSpam-MessageData-1: jdoTWv0e1+CVILVge/oIcu8ys+GwL4mc7p0=
X-OriginatorOrg: provenrun.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5fbf16-4eed-4b0a-d4c0-08da3814f9dd
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2531.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:53:17.1099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff654c30-3eb4-4445-b89f-a54a92b1f03d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 574gRgpPeFJu1uylVy9sq4Iclx5J/IYSQqF5EN1axlfAKTm70HfnpXAe6rS2UEFq5+rT/AjPk5lsdSwhM4WV0IXnvZjsyoS0RRZhKFOO+I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2711
Received-SPF: pass client-ip=2a01:111:f400:7e19::61f;
 envelope-from=florian.lugou@provenrun.com;
 helo=FRA01-MR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 May 2022 12:44:59 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per the description of the HCR_EL2.APK field in the ARMv8 ARM,
Pointer Authentication keys accesses should only be trapped to Secure
EL2 if it is enabled.

Signed-off-by: Florian Lugou <florian.lugou@provenrun.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 432bd81919..29f73c7343 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6758,7 +6758,7 @@ static CPAccessResult access_pauth(CPUARMState *env, const ARMCPRegInfo *ri,
     int el = arm_current_el(env);
 
     if (el < 2 &&
-        arm_feature(env, ARM_FEATURE_EL2) &&
+        arm_is_el2_enabled(env) &&
         !(arm_hcr_el2_eff(env) & HCR_APK)) {
         return CP_ACCESS_TRAP_EL2;
     }
-- 
2.25.1


