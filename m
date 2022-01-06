Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A83F48644F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 13:24:04 +0100 (CET)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5RoJ-0004S9-5q
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 07:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5RmM-0002oQ-Hr
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 07:22:02 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:43937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5RmI-0006YA-Cj
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 07:22:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5A8FD2254C;
 Thu,  6 Jan 2022 12:21:47 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 13:21:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00221386dc3-ca12-4f1c-bea5-dc11c36342e2,
 49C0EA974A1AE1209641D977CC9A370E508CB387) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <722ded34-a09a-b94a-3182-64686ad0150c@kaod.org>
Date: Thu, 6 Jan 2022 13:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] target/ppc: Remove xscmpnedp instruction
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
References: <20220106112318.13864-1-victor.colombo@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220106112318.13864-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2df72e2a-2b73-48b7-911a-b67fb92bf37f
X-Ovh-Tracer-Id: 16058428899404712809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, matheus.ferst@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 12:23, Víctor Colombo wrote:
> xscmpnedp was added in ISA v3.0 but removed in v3.0B. This patch
> removes this instruction as it was not in the final version of v3.0.
> 
> RFC to know if you think this is the correct approach.

Usually we deprecate a feature for a minimum of two releases before
removing it. It might be overkill for this case since the P9 processor
implementation is based on v3.0B.

I would simply remove the instruction since it never existed on any
supported HW. I will wait for some more feedback.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 1 -
>   target/ppc/helper.h                 | 1 -
>   target/ppc/translate/vsx-impl.c.inc | 1 -
>   target/ppc/translate/vsx-ops.c.inc  | 1 -
>   4 files changed, 4 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index e5c29b53b8..f030858cf9 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2270,7 +2270,6 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
>   VSX_SCALAR_CMP_DP(xscmpeqdp, eq, 1, 0)
>   VSX_SCALAR_CMP_DP(xscmpgedp, le, 1, 1)
>   VSX_SCALAR_CMP_DP(xscmpgtdp, lt, 1, 1)
> -VSX_SCALAR_CMP_DP(xscmpnedp, eq, 0, 0)
>   
>   void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
>                          ppc_vsr_t *xa, ppc_vsr_t *xb)
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index f9c72dcd50..8f02cabaf5 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -400,7 +400,6 @@ DEF_HELPER_5(xsnmsubdp, void, env, vsr, vsr, vsr, vsr)
>   DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
>   DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
>   DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
> -DEF_HELPER_4(xscmpnedp, void, env, vsr, vsr, vsr)
>   DEF_HELPER_4(xscmpexpdp, void, env, i32, vsr, vsr)
>   DEF_HELPER_4(xscmpexpqp, void, env, i32, vsr, vsr)
>   DEF_HELPER_4(xscmpodp, void, env, i32, vsr, vsr)
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index c08185e857..fbef496257 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -1092,7 +1092,6 @@ GEN_VSX_HELPER_X1(xstsqrtdp, 0x14, 0x06, 0, PPC2_VSX)
>   GEN_VSX_HELPER_X3(xscmpeqdp, 0x0C, 0x00, 0, PPC2_ISA300)
>   GEN_VSX_HELPER_X3(xscmpgtdp, 0x0C, 0x01, 0, PPC2_ISA300)
>   GEN_VSX_HELPER_X3(xscmpgedp, 0x0C, 0x02, 0, PPC2_ISA300)
> -GEN_VSX_HELPER_X3(xscmpnedp, 0x0C, 0x03, 0, PPC2_ISA300)
>   GEN_VSX_HELPER_X2_AB(xscmpexpdp, 0x0C, 0x07, 0, PPC2_ISA300)
>   GEN_VSX_HELPER_R2_AB(xscmpexpqp, 0x04, 0x05, 0, PPC2_ISA300)
>   GEN_VSX_HELPER_X2_AB(xscmpodp, 0x0C, 0x05, 0, PPC2_VSX)
> diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
> index c974324c4c..67fa7b2e41 100644
> --- a/target/ppc/translate/vsx-ops.c.inc
> +++ b/target/ppc/translate/vsx-ops.c.inc
> @@ -197,7 +197,6 @@ GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubmdp", 0x04, 0x17, PPC2_VSX),
>   GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
>   GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
>   GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
> -GEN_XX3FORM(xscmpnedp, 0x0C, 0x03, PPC2_ISA300),
>   GEN_XX3FORM(xscmpexpdp, 0x0C, 0x07, PPC2_ISA300),
>   GEN_VSX_XFORM_300(xscmpexpqp, 0x04, 0x05, 0x00600001),
>   GEN_XX2IFORM(xscmpodp,  0x0C, 0x05, PPC2_VSX),
> 


