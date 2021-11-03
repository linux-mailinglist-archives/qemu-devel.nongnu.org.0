Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607464444A5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:28:56 +0100 (CET)
Received: from localhost ([::1]:55560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIC7-0001WY-6l
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miI5N-0006Bi-TA
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:21:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miI5M-00025m-38
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:21:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id i5so4155926wrb.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UaUJItEcNmSdpSs2HgZuxbYODIZPwG91o9CNmprLyw0=;
 b=ZeOtoe1tk+uu7SGjsjoSoyxEqtuAPco+Krl7P1INXvUQLkte6juCTtsWOaOBdYdV6Q
 nfxjcnNEeb3mxw8B+NUVKKkI+2ZcexFZbtD6y7pfKYmPW5SHsjsf0qT9c/6F6n24adZs
 fVWpNYJEfoltmy/6S/Y56edsNHzxFrcDWbIHshRVtEqI1zRJMoaCfTQ+bhXPk0ifPCE9
 uI6TH3wvY4Mhd88gL37lUSgwWGpLDaaiBjVSFcJui0+Lhe8Fgbi1+cCLSZ/eKffc/nM1
 sl7VFfpegC6ij8bF20Q5y+XW6PsGCfg1E09lLmpjXroxadn36sX80rm91hKkGaZtBjig
 Y8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UaUJItEcNmSdpSs2HgZuxbYODIZPwG91o9CNmprLyw0=;
 b=qsqD8WJc+jv0zDmLktbwYlMmB3MfdnlleAPIT2PjRvWNyZActfRC0MTntDzCtufQ9k
 8c37/8MD35PCJtJsM4ERdcyz4ptfyPAiAPPB2Iem96CJ6jJyGXgWCYznvi/kSDkoSojH
 z3ap44sLqfmXq5crp8kr2Rm+rJgPVV1Mu415PqGxeV2AgeWRVf3ljiJ4oWSUcJioNjU9
 JjkdrUa5JcQVTfR0yBXUrSG5SVWCZZiANKie9J7Lb0kM0n1SGL0xsfSIHYovoJhfUFrg
 TgD2etdcP9EQW6KSuAejHn2cBvuNU87QRvxnVXqYZJaI+1ClgugimIjDlMqoXngZPRNa
 3jvg==
X-Gm-Message-State: AOAM530qeb6fpUBbWMp06ehY+rfTzwERx83Eg3PAYqb+9gA71Lrtl5ox
 UBnEkaUSq2dbsbng3VhYOF4=
X-Google-Smtp-Source: ABdhPJwYniiBPxDTBE/2PjHhV60S1cTMXi22kyMHscMI1qCQmWEJdC0aZfqYHVB98yHjA8As6ap6zQ==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr32675197wrz.127.1635952914198; 
 Wed, 03 Nov 2021 08:21:54 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d9sm2213851wre.52.2021.11.03.08.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:21:53 -0700 (PDT)
Message-ID: <13397f73-9594-d363-e7ab-860477a832b7@amsat.org>
Date: Wed, 3 Nov 2021 16:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 16/23] target/mips: Extract trap code into
 env->error_code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211103140847.454070-1-richard.henderson@linaro.org>
 <20211103140847.454070-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211103140847.454070-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 15:08, Richard Henderson wrote:
> Simplify cpu_loop by doing all of the decode in translate.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mips/cpu_loop.c                | 41 +----------------------
>  target/mips/tcg/translate.c               | 24 ++++++++++---
>  target/mips/tcg/micromips_translate.c.inc |  4 +--
>  target/mips/tcg/nanomips_translate.c.inc  |  4 +--
>  4 files changed, 25 insertions(+), 48 deletions(-)

> diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
> index f91f7a96cd..7e7d26a91b 100644
> --- a/target/mips/tcg/micromips_translate.c.inc
> +++ b/target/mips/tcg/micromips_translate.c.inc
> @@ -1047,7 +1047,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
>      case TNE:
>          mips32_op = OPC_TNE;
>      do_trap:
> -        gen_trap(ctx, mips32_op, rs, rt, -1);
> +        gen_trap(ctx, mips32_op, rs, rt, -1, extract32(ctx->opcode, 12, 4));
>          break;
>  #ifndef CONFIG_USER_ONLY
>      case MFC0:
> @@ -2439,7 +2439,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
>              check_insn_opc_removed(ctx, ISA_MIPS_R6);
>              mips32_op = OPC_TEQI;
>          do_trapi:
> -            gen_trap(ctx, mips32_op, rs, -1, imm);
> +            gen_trap(ctx, mips32_op, rs, -1, imm, 0);

IIUC the microMIPS manual (MD00594):

               gen_trap(ctx, mips32_op, rs, -1, imm,
                        extract32(ctx->opcode, 12, 4));

>              break;

