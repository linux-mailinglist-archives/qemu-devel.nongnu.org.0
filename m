Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC17B5784C9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:06:41 +0200 (CEST)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDROT-0003I7-1T
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDR5b-0002O1-1L
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:47:11 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDR5Z-0001I7-9b
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:47:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id fy29so20186190ejc.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FF2HBjxjvrcFCH3enjW7R4rb3Gbjb7hy+7moESVcCzk=;
 b=nOw/s75eVp++4KwoaFWtL8Gfc3kVgXOuwfsePy2SUKxvAg/yri9pZ04zKof2rWtrVs
 T8hm/TNLbG477D9zhyHiPHIns+YaobcQZJjTN1o2eJb7PoRJZBd8n9CB7zjn0nOkXEPu
 WbXFYG3zYHnEFeXIZvMP8jSz/JO3Npzje0S+3wyiUMwyeKNiahCJFi7a4xAAorcR3fOn
 QVncFJ5/s+HGPz4v7i+BeGHmg0pGCaolp2T57BpzP2PWgzYgXf5sN5BLpuxbUnNT/AFH
 0e4KL8KDjsvljB/GfhVtCZ1KqMmrMxA6NoATg320gR3QzzQ+jt/2CeMz+ucI8UUin7WY
 gJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FF2HBjxjvrcFCH3enjW7R4rb3Gbjb7hy+7moESVcCzk=;
 b=bqzizIGoV93CDVdSc+EGgCGuOtO1E0BmeJDL4FriUQ842eJRIDTRd8ak0IEyi3ihGV
 21xLmMGHSvf9CouG0fB0tZ3eGFebpY2XSC5OQ9U7R+LuO3EKxfx5A4L3jQi/DSf/3KJ9
 377sScMEj5pLgH050GxH/kua6elHBpmgE0QulhDoOgiN3xPYS+4ZXysuWkCuQ4qIWdiY
 o3dOFsCWt/0CEM3/mgbLE1mNOt6b917XR6Pf6MBeU19cWbV/pkQkrp6KsJSQyyEeiJkz
 4ox8EffMfJ35dHaJj+8+OBIPOx+y7REksTxqXD8k6XHjeDAZI0vHzXWcrS19GokApH3w
 Vy0g==
X-Gm-Message-State: AJIora9NMrbFWwRKCBEAD5b9vxqqH8X57Te0OVIDzXxXJw/ngzoH9RgI
 ++r125e4XYHZWjoyrPW2OneTUQ==
X-Google-Smtp-Source: AGRyM1siZOuIXBpXM7bkuJlsfRc9Tw7BxbGlXRtVxHlYB3EtDzBkQA7hNsDsFeovzCutgHLkKt8Ivw==
X-Received: by 2002:a17:907:2855:b0:72b:700e:21eb with SMTP id
 el21-20020a170907285500b0072b700e21ebmr25981018ejc.270.1658152026614; 
 Mon, 18 Jul 2022 06:47:06 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 z13-20020aa7d40d000000b0043adc6552d6sm8555607edq.20.2022.07.18.06.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:47:06 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:47:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH V3 6/6] target/riscv: Simplify the check in hmode to
 resue the check in riscv_csrrw_check
Message-ID: <20220718134705.3irtvydqu6nn4uys@kamzik>
References: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
 <20220718130955.11899-7-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718130955.11899-7-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:49:04 -0400
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


Hi Weiwei,

We still need the s/resue/reuse/ typo fix in $SUBJECT.

(That's maybe something that could be fixed up while applying?)

Thanks,
drew

On Mon, Jul 18, 2022 at 09:09:55PM +0800, Weiwei Li wrote:
> Just add 1 to the effective privledge level when in HS mode, then reuse
> the check of 'effective_priv < csr_priv' in riscv_csrrw_check to replace
> the privilege level related check in hmode. Then, hmode will only check
> whether H extension is supported.
> 
> When accessing Hypervior CSRs:
>    1) If accessing from M privilege level, the check of
> 'effective_priv< csr_priv' passes, returns hmode(...) which will return
> RISCV_EXCP_ILLEGAL_INST when H extension is not supported and return
> RISCV_EXCP_NONE otherwise.
>    2) If accessing from HS privilege level, effective_priv will add 1,
> the check passes and also returns hmode(...) too.
>    3) If accessing from VS/VU privilege level, the check fails, and
> returns RISCV_EXCP_VIRT_INSTRUCTION_FAULT
>    4) If accessing from U privilege level, the check fails, and returns
> RISCV_EXCP_ILLEGAL_INST
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/csr.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index cf15aa67b7..0fb042b2fd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -312,13 +312,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
>  static RISCVException hmode(CPURISCVState *env, int csrno)
>  {
>      if (riscv_has_ext(env, RVH)) {
> -        /* Hypervisor extension is supported */
> -        if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> -            env->priv == PRV_M) {
> -            return RISCV_EXCP_NONE;
> -        } else {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> +        return RISCV_EXCP_NONE;
>      }
>  
>      return RISCV_EXCP_ILLEGAL_INST;
> @@ -3279,13 +3273,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>  #if !defined(CONFIG_USER_ONLY)
>      int csr_priv, effective_priv = env->priv;
>  
> -    if (riscv_has_ext(env, RVH) && env->priv == PRV_S) {
> +    if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
> +        !riscv_cpu_virt_enabled(env)) {
>          /*
> -         * We are in either HS or VS mode.
> -         * Add 1 to the effective privledge level to allow us to access the
> -         * Hypervisor CSRs. The `hmode` predicate will determine if access
> -         * should be allowed(HS) or if a virtual instruction exception should be
> -         * raised(VS).
> +         * We are in HS mode. Add 1 to the effective privledge level to
> +         * allow us to access the Hypervisor CSRs.
>           */
>          effective_priv++;
>      }
> -- 
> 2.17.1
> 
> 

