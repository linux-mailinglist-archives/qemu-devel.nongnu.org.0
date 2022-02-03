Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220554A8FAC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:17:26 +0100 (CET)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjTo-00013u-Kl
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:17:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1nFinW-00053v-62; Thu, 03 Feb 2022 15:33:42 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1nFinU-0003Ih-F5; Thu, 03 Feb 2022 15:33:41 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 2D846C60912;
 Thu,  3 Feb 2022 21:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1643920416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SG4mfTgcMbx+MjII4dHrn/5Edc9LwRsHIYmlJ+CMbwU=;
 b=ETll3oEpeUSAKVp49eD7XqNynxRay9lHopInJZNubOHRLn7b5Nu5n9vpYvGDOSJpfB3PNq
 wXwCosW1Ti3MI5wnhx4GQXo1zsn3lwEjc3+IetirbgwSZM7Pzk3myztAtVy0mGlfEvrWiV
 eRDMwixKt8+oPrNUkBkjUvsJoV6TalFv3FIVJI6OURvZPVTdBrsCCx99kmIvL3XC8Y7r1k
 nMZ8C6vCTd6oy/GYOeLCTI1RsA2b1Si6AfxOMsiib4RlCVo3lOHEqB9QXuTYaO8TlwjDA4
 5NKYRyuMcur2dmU5DzxbWKVsWsnPNeDbC/NbhJDszfuUu/qsZrCbDspgA7RepA==
Date: Thu, 3 Feb 2022 21:33:35 +0100
From: Luc Michel <luc@lmichel.fr>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2 2/6] target/arm: Make rvbar settable after realize
Message-ID: <Yfw8H/zcSshP4omo@sekoia-pc.home.lmichel.fr>
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
 <20220203140141.310870-3-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203140141.310870-3-edgar.iglesias@gmail.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

Oops I mistakenly answered on v1 :)

On 15:01 Thu 03 Feb     , Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Make the rvbar property settable after realize. This is done
> in preparation to model the ZynqMP's runtime configurable rvbar.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/arm/cpu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5a9c02a256..e30ae088fe 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1128,9 +1128,6 @@ static Property arm_cpu_reset_cbar_property =
>  static Property arm_cpu_reset_hivecs_property =
>              DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
>  
> -static Property arm_cpu_rvbar_property =
> -            DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
> -
>  #ifndef CONFIG_USER_ONLY
>  static Property arm_cpu_has_el2_property =
>              DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
> @@ -1233,7 +1230,9 @@ void arm_cpu_post_init(Object *obj)
>      }
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property);
> +        object_property_add_uint64_ptr(obj, "rvbar",
> +                                       &cpu->rvbar,
> +                                       OBJ_PROP_FLAG_READWRITE);

I think you may have a problem here. cpu->rvbar is used to define the
reset value of the rvbar_elx registers in register_cp_regs_for_features.
This is done at realize time. Changing the rvbar property after realize
would fail to update the rvbar_elx register values.

I guess you should also switch to a .readfn instead of a .resetvalue for
those registers.

-- 
Luc


>      }
>  
>  #ifndef CONFIG_USER_ONLY
> -- 
> 2.25.1
> 

-- 

