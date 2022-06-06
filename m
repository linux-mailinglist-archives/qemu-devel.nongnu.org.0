Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC3D53ED4A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 19:54:08 +0200 (CEST)
Received: from localhost ([::1]:46674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyGvX-0000k7-8G
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 13:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyGsc-0006PY-H4; Mon, 06 Jun 2022 13:51:06 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:36178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyGsa-0007nI-QW; Mon, 06 Jun 2022 13:51:06 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-edeb6c3642so20049502fac.3; 
 Mon, 06 Jun 2022 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6R2AOZAoR7Dln6WoAAmDCpU/kaPB7BaX25+Cqed+C5Y=;
 b=cvivOtC4UJVMtk8QNDa6Vcov+1eBW8Un/zR5pf/MQOYDbvNFWEh4nPQk3Z9xORRe34
 4tGBWUTWYrpzVoNxTjLpuzw/X0NSQeCugxujN2srjhgSHqeHTELoQtiZY2bdAeRoJy39
 rHXoQ2xUY/CdQ8j7Ue5Pml1f80nXGsEb7NchuyjUORABjfBbyvQbIGziFLWIY6ktXU1J
 /JNBrEPEPKZNO/EV5XMt34POzeiFinIItFSOiHnNMEFDi/Kg4bj6NZ1joj4P+y0Nbktw
 SgBjcQJ8IjqMVhi1zVGR5enGEzs5L2rhshvL0uNPMI7Zvl4M+RN4rqzfYdmzy3d1VLOf
 uCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6R2AOZAoR7Dln6WoAAmDCpU/kaPB7BaX25+Cqed+C5Y=;
 b=A3J3ZRzUkpxvvNQEcJrbPdA0wdIR7vLmgBzVW8LHbbKbzlJ7uw0gkQQCXm6fYfdhrQ
 oHmpbWFbAbd1+ROW2kKmeNtGmGnAsKBNDu/A8uM6nmDEBFHqfQmOf8ldlTi7l5WmDZOv
 9wtd8av/+/ccmHXOPNMnFhVxOZO9Uxxiy72xpj8ixSAjqnVNMpJ6rjMkFDZn1mMj3dXF
 1bbEK0AJzbgsp8iLXqncoHbckHwsrfCLr0LtS7SjggeBjfj3IWvlINI3CxQM9zjUUPA5
 TS8gkPaaOk8uHMmR+vwrBCF/U10Dr6E0I97Y33hb74sRiO+hlZSRnNAZwGVVgqgnVGZ7
 BG8w==
X-Gm-Message-State: AOAM5314TzGGBY42UoykURH/G2qvIzdFYoT4rZqrpv6QaB0Kd9UpWakt
 IwyFDWGFZ2idZXaaZ0xySc+JCURbCxo=
X-Google-Smtp-Source: ABdhPJyoZdIo6K7vAAS/LyNC5I73bGTiIMq3AQIc0UnumZBdi7C2SNGx1powHpj2Rt/JBgXjwmaioQ==
X-Received: by 2002:a05:6870:3482:b0:e2:d03a:41e8 with SMTP id
 n2-20020a056870348200b000e2d03a41e8mr30671370oah.79.1654537863162; 
 Mon, 06 Jun 2022 10:51:03 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.74])
 by smtp.gmail.com with ESMTPSA id
 f71-20020a9d03cd000000b0060be7487954sm4031460otf.26.2022.06.06.10.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 10:51:02 -0700 (PDT)
Message-ID: <add7db64-071d-ad4a-cd4a-1924a8e7cfdf@gmail.com>
Date: Mon, 6 Jun 2022 14:50:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc: fix unreachable code in fpu_helper.c
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220602191048.137511-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220602191048.137511-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 6/2/22 16:10, Daniel Henrique Barboza wrote:
> Commit c29018cc7395 added an env->fpscr OR operation using a ternary
> that checks if 'error' is not zero:
> 
>      env->fpscr |= error ? FP_FEX : 0;
> 
> However, in the current body of do_fpscr_check_status(), 'error' is
> granted to be always non-zero at that point. The result is that Coverity
> is less than pleased:
> 
>    Control flow issues  (DEADCODE)
> Execution cannot reach the expression "0ULL" inside this statement:
> "env->fpscr |= (error ? 1073...".
> 
> Remove the ternary and always make env->fpscr |= FP_FEX.
> 
> Cc: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Fixes: Coverity CID 1489442
> Fixes: c29018cc7395 ("target/ppc: Implemented xvf*ger*")
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/fpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index fed0ce420a..7ab6beadad 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -464,7 +464,7 @@ static void do_fpscr_check_status(CPUPPCState *env, uintptr_t raddr)
>       }
>       cs->exception_index = POWERPC_EXCP_PROGRAM;
>       env->error_code = error | POWERPC_EXCP_FP;
> -    env->fpscr |= error ? FP_FEX : 0;
> +    env->fpscr |= FP_FEX;
>       /* Deferred floating-point exception after target FPSCR update */
>       if (fp_exceptions_enabled(env)) {
>           raise_exception_err_ra(env, cs->exception_index,

