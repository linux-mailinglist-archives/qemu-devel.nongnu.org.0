Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A42B9511
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:48:14 +0100 (CET)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kflEL-0008JE-ET
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kflCB-0006xk-TD
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:45:59 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kflCA-0005Hi-5I
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:45:59 -0500
Received: by mail-wm1-x343.google.com with SMTP id a186so4644345wme.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 06:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=idwSIaEiQ/TOBjH/BpUKcLra5ueAosLnF0Uy1mAJ/S0=;
 b=uPUDjd+bNxptkn63fjY5o5t7sw1dT2uWWBUK2cENyBFvjbxu8qXjFsQmiozvzmcuK0
 j/ozPUq9Ekv0jXqgP9IKQWvpmtEQakaTXcgrxr04dh+gXy3pZX2ftlbTpWwoG1RoldYP
 y9QSB8wbd93jwXyEAwW6fFi0zmc6YyBME1DFeUM8JaLiW1TAkD8N54d2tcFYDw9oGD5j
 QzXXLOqAjk/+c8OhDnXpwZqZv8D+nvlHGei3hIQgEeNiMMziNrcOq5+T8dpDP4k8pKNm
 eNxp4qFhsRZk5QJyFA1lT8bJh/w+Y2wPP4X6CkmT0wefBlumYHp+HojKlaGR7mnLX4Bu
 C2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=idwSIaEiQ/TOBjH/BpUKcLra5ueAosLnF0Uy1mAJ/S0=;
 b=RSJau01FT5L43DL/Rsk+FN9hq5Pjw1IbifiapnD+zAhv8GP3HKlMTQSFfOFMuSpxW+
 drNrVMTT3Z7eEZ3Q5ZiHp7q3kQ2MNPxF4HN9TeA2SDw+dgyC/Sk+qR50bLjaLTb7nxHn
 mV5isWS4KsaqfuAsaDFhtSbndYSMAIwOVP2rcKug/i2CxtlgE1/wB6+G4FeBd0qlOCtR
 tvzrzmE7fXzEJcz56cfUXYFD6fnAj2LBbPNV1xKH8QggLu9Fsn4vI3DiE8IEdpg4WNQC
 XsQhXMF/bshjT7uFZ8cfc9EQzejN68SVjAmtllDZlzAqkpldlH8frQbZJPfuS06sT2ND
 eHWg==
X-Gm-Message-State: AOAM533zCN2bYA4gvWm78pcxe7DNXDQubUZFGba0pQzB8CA2qoS+m3Kj
 MWFHac0cXqc7QXMq1UFTJbM=
X-Google-Smtp-Source: ABdhPJyUFFZvtdKvfjcCKs3RSW4cl1BpAjfZB9/nJDHEOTU7WfwDXa8pI3voJNAN/HPi/mKlymyAVw==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr5087550wmd.135.1605797156504; 
 Thu, 19 Nov 2020 06:45:56 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id l13sm41375657wrm.24.2020.11.19.06.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 06:45:55 -0800 (PST)
Subject: Re: [PATCH] target/mips/helper: Also display exception names in
 user-mode
To: qemu-devel@nongnu.org
References: <20201119131824.1898439-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <04e0cd99-5789-86f2-cd4b-e1bc7a10d9d2@amsat.org>
Date: Thu, 19 Nov 2020 15:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119131824.1898439-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 2:18 PM, Philippe Mathieu-Daudé wrote:
> Currently MIPS exceptions are displayed as string in system-mode
> emulation, but as number in user-mode.
> Unify by extracting the current system-mode code as excp_name()
> and use that in user-mode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/target/mips/helper.c b/target/mips/helper.c
> index 063b65c0528..f566bd6da50 100644
> --- a/target/mips/helper.c
> +++ b/target/mips/helper.c
> @@ -978,6 +978,7 @@ hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
>          return physical;
>      }
>  }
> +#endif
>  
>  static const char * const excp_names[EXCP_LAST + 1] = {
>      [EXCP_RESET] = "reset",
> @@ -1018,7 +1019,14 @@ static const char * const excp_names[EXCP_LAST + 1] = {
>      [EXCP_MSADIS] = "MSA disabled",
>      [EXCP_MSAFPE] = "MSA floating point",
>  };
> -#endif
> +
> +static const char *excp_name(int32_t exception)
> +{
> +    if (exception < 0 || exception > EXCP_LAST) {
> +        return "unknown";
> +    }
> +    return excp_names[exception];
> +}
>  
>  target_ulong exception_resume_pc(CPUMIPSState *env)
>  {
> @@ -1091,19 +1099,14 @@ void mips_cpu_do_interrupt(CPUState *cs)
>      bool update_badinstr = 0;
>      target_ulong offset;
>      int cause = -1;
> -    const char *name;
>  
>      if (qemu_loglevel_mask(CPU_LOG_INT)
>          && cs->exception_index != EXCP_EXT_INTERRUPT) {
>          if (cs->exception_index < 0 || cs->exception_index > EXCP_LAST) {

I clearly failed to fix the cherry-pick conflict =)

> -            name = "unknown";
> -        } else {
> -            name = excp_names[cs->exception_index];
> -        }
> -
>          qemu_log("%s enter: PC " TARGET_FMT_lx " EPC " TARGET_FMT_lx
>                   " %s exception\n",
> -                 __func__, env->active_tc.PC, env->CP0_EPC, name);
> +                 __func__, env->active_tc.PC, env->CP0_EPC,
> +                 excp_name(cs->exception_index));
>      }
>      if (cs->exception_index == EXCP_EXT_INTERRUPT &&
>          (env->hflags & MIPS_HFLAG_DM)) {
> @@ -1490,8 +1493,8 @@ void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
>  {
>      CPUState *cs = env_cpu(env);
>  
> -    qemu_log_mask(CPU_LOG_INT, "%s: %d %d\n",
> -                  __func__, exception, error_code);
> +    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
> +                  __func__, exception, excp_name(exception), error_code);
>      cs->exception_index = exception;
>      env->error_code = error_code;
>  
> 

