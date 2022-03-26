Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA314E80FB
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:06:52 +0100 (CET)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY683-0005xl-7K
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:06:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY66G-0004qb-Hw
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:05:00 -0400
Received: from [2001:4860:4864:20::29] (port=44962
 helo=mail-oa1-x29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY66F-0001Ic-0j
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:05:00 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so10669578fac.11
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KBgZsciOFk3izWbimSZ1RycEo3M9AdalZlUh310GFZc=;
 b=VqQ2rjAxd4+OJPsQPmoSOesb1h+jowhgftcsnQyXmg20ghCZH5YzCS1xxWRtJOK9mp
 vHVLFcIcYc0LxSaOoYacQrDHT0ejWkrTPXNs0x/gDGzHC4wnZw/5H1nJWNAgamx2HWYC
 ND3Mp4MSDHVoGwjpzQT/mneJfqHNgW+w+Bzy2Z5EMM6TYpL4tN6USVqE/+t12pEXz2gR
 c03xoWpKjZgr7d5nMynQOnM8KDLNEDJ7M2LZRZS8xYZGWiKjN6v7O4q0AI3jvAxFU34k
 zIy42U7x5zlyEm6/XbjmUHDVL5uiDKWRVUPZiBqlUP4j+S4gVDEtbm49IHjufjh5RrHD
 9gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KBgZsciOFk3izWbimSZ1RycEo3M9AdalZlUh310GFZc=;
 b=oExP4PzAWyhgLqmS/t/a2363OMnd/97zRcKvio4k8PQrAa3IM23xMrMcB9HWx/uWjt
 ZFPottr79jmObkye8zIGvhuvZh+bVHUpTgEGCqA38Ip4GdIOjas2Ccta/PHwyy2jvn7Q
 tAVKF/tVuwv/wcwZBOOTkMjdAN9tCbLuSG4G4CSQlSHRSjr9OSel2g4xsNn642owhXUc
 z/mR1UrFF4EuqpB48XPAuoZO/NL4phLvWFZTx9Vuz0T3CI24dGk8aALyJPPVg6Bf3EaE
 lVnn9VYKtO1WNnDm2mQnqn+0NJvrcMKd/tboeLJGZZu0vCyyEY1fyp4SEuut2bJlGUy2
 RDXQ==
X-Gm-Message-State: AOAM531lsjFf3WEIdf0C/i2B0C2uFn9BcvhXIHqKOoA7G5LipBc7Cscr
 p/N8CqAkyiIgUZ/06XYF6WnfTA==
X-Google-Smtp-Source: ABdhPJxN9RyS+ag57ODoUZwUriJeA+kd4Sh3IkE+00w6T7yVCSKrbkv85LWi/W9I/MbsAkK6QtKs1g==
X-Received: by 2002:a05:6870:231f:b0:da:c15:fd43 with SMTP id
 w31-20020a056870231f00b000da0c15fd43mr6492798oao.135.1648299897613; 
 Sat, 26 Mar 2022 06:04:57 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 y143-20020aca4b95000000b002d9b530a96esm4358056oia.44.2022.03.26.06.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Mar 2022 06:04:56 -0700 (PDT)
Message-ID: <43660ac0-a920-0271-cd99-0100271f937d@linaro.org>
Date: Sat, 26 Mar 2022 07:04:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/6] target/ppc: Add support for the Processor
 Attention instruction
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <20220324190854.156898-2-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220324190854.156898-2-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::29
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/22 13:08, Leandro Lupori wrote:
> +    /* Processor Attention                                                   */
> +    POWERPC_EXCP_ATTN          = 0x100,
> +    /*
> +     * NOTE: POWERPC_EXCP_ATTN uses values from 0x100 to 0x1ff to return
> +     *       error codes.
> +     */

As used below, this is not an exception -- the exception is POWERPC_EXCP_MCHECK.  This is 
something else, for env->error_code.  You could probably come up with a better name, but 
see below.

> +            if ((env->error_code & ~0xff) == POWERPC_EXCP_ATTN) {
> +                exit(env->error_code & 0xff);
> +            }

This will want gdb_exit(value) as well; see e.g. semihosting/arm-compat-semi.c.

In this and the next patch, I do not see anything that makes support for attn conditional, 
and importantly, off by default.  Otherwise this seems to have the potential for denial of 
service.

> +void helper_attn(CPUPPCState *env, target_ulong r3)
> +{
> +    bool attn = false;
> +
> +    if (env->excp_model == POWERPC_EXCP_POWER8) {
> +        attn = !!(env->spr[SPR_HID0] & HID0_ATTN);
> +    } else if (env->excp_model == POWERPC_EXCP_POWER9 ||
> +               env->excp_model == POWERPC_EXCP_POWER10) {
> +        attn = !!(env->spr[SPR_HID0] & HID0_POWER9_ATTN);
> +    }
> +
> +    if (attn) {
> +        raise_exception_err(env, POWERPC_EXCP_MCHECK,
> +                            POWERPC_EXCP_ATTN | (r3 & 0xff));
> +    } else {
> +        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                               POWERPC_EXCP_INVAL |
> +                               POWERPC_EXCP_INVAL_INVAL, GETPC());
> +    }
> +}

Why did you decide to raise an exception instead of exiting right here?

I suggest syncing env state before calling the helper, so that you don't need to unwind 
here, and so that state is up-to-date for the debugger before exiting.

> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 408ae26173..5ace6f3a29 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4123,6 +4123,19 @@ static void gen_rvwinkle(DisasContext *ctx)
>       gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
> +
> +static void gen_attn(DisasContext *ctx)
> +{
> + #if defined(CONFIG_USER_ONLY)
> +    GEN_PRIV;
> +#else
> +    CHK_SV;
> +
> +    gen_helper_attn(cpu_env, cpu_gpr[3]);
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +#endif
> +}

You want gen_update_nip(ctx, ctx->cia) in there, like gen_exception_err.


> +GEN_HANDLER(attn, 0x0, 0x00, 0x8, 0xfffffdff, PPC_FLOW),

New insns into insns32.decode, I would expect.


r~

