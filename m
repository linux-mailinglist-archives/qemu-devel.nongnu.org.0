Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5295736373E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:03:52 +0200 (CEST)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYChz-0000Kl-DN
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCgS-0008Fn-7Q
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:02:16 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCgQ-0004Pq-5r
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:02:15 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso1431290pjs.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+4ql3yaMlMZFC/SvDjSUSOLBf4+y0jKAfeqSY1adxkM=;
 b=X1WExEaC4/Fd1wMXE3R1xXjWhK5k7BRWL7+IUIa9X3zrRP5rvWyYILNtvWpcJeBVWI
 k+/p0gfI72wK3gK7X/lKAhAahYdxqORi0BCJaZqpA7SwUPN02UNlSq/xXtYOqGIrloQa
 4/WqIKgAY5nwutqU0cobfmZme2ZUetKWf6zXb8bmQkQxSabZoYj6ioHltSdWm8oL1CD2
 peEjY0nCn+phrxDyp9Thu8b+yb9VWtmre61zuGezmYKbB1dZVwSoHfFPfML8KTVP64bv
 VBisA3MfQAf9Zl9W6KbxQYe0Dxlvez7iwizn3eP8x9EN9bbBX1r280XpDEZCeLIgy2uT
 X8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+4ql3yaMlMZFC/SvDjSUSOLBf4+y0jKAfeqSY1adxkM=;
 b=WQTOkSOcAmMbO//TsfUj2erW3HWQdeDlMzVlXL2SP+aZkfBYfF30/iMze06US5EO5O
 UuMxdC2WEzzI2jrlN1TWk6R/o+U3D1NaAZs2GivjFTapT1BwGgV5OkrDxLlk5xoQ7p5l
 VvlUEA8qW1/SfyqTX7n+q7VqufwIY+C9ia8KQpqciibkWFskXucF5kkv5MLzbylneio0
 +I4dVR29CExMMwBH3zSnYNbsaNERPXFYzD1mEN9NbcBhiw791libTqd4/yfHdK8gXvzM
 g/Nh6shYMoxInpxhi49RqT609KgosgqTwnl1xi3iSmJqRcfbxGREHM5A1tN52rSa0Vlu
 uzlw==
X-Gm-Message-State: AOAM530FD7Lb77Vh3NPA6f+i73IrgcaXE9d13AeKcLouYnN6Sy9l+Fu+
 7AbRhOiZ+R7mXHR7bDw/N71HDA==
X-Google-Smtp-Source: ABdhPJxJfSaEi9M9EkLHdumzR0fTQIe9TfML0P44GBihg6Cif9dSZoO3VdgapQI/DcDWogqCnb5+tw==
X-Received: by 2002:a17:90b:1e0d:: with SMTP id
 pg13mr2030627pjb.121.1618772532662; 
 Sun, 18 Apr 2021 12:02:12 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id y29sm10199042pfq.29.2021.04.18.12.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:02:12 -0700 (PDT)
Subject: Re: [PATCH 05/26] target/mips: Restrict mips_cpu_dump_state() to cpu.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d279b9a2-fdca-d616-6cb9-240b38f2bbb4@linaro.org>
Date: Sun, 18 Apr 2021 12:02:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> As mips_cpu_dump_state() is only used once to initialize the
> CPUClass::dump_state handler, we can move it to cpu.c to keep
> it symbol local.
> Beside, this handler is used by all accelerators, while the
> translate.c file targets TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/internal.h  |  1 -
>   target/mips/cpu.c       | 77 +++++++++++++++++++++++++++++++++++++++++
>   target/mips/translate.c | 77 -----------------------------------------
>   3 files changed, 77 insertions(+), 78 deletions(-)
> 
> diff --git a/target/mips/internal.h b/target/mips/internal.h
> index a8644f754a6..1c5674935aa 100644
> --- a/target/mips/internal.h
> +++ b/target/mips/internal.h
> @@ -79,7 +79,6 @@ extern const int mips_defs_number;
>   
>   void mips_cpu_do_interrupt(CPUState *cpu);
>   bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
> -void mips_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>   hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>   int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>   int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index f354d18aec4..ac38a3262ca 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -145,6 +145,83 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
>   
>   #endif /* !CONFIG_USER_ONLY */
>   
> +static void fpu_dump_state(CPUMIPSState *env, FILE * f, int flags)
> +{
> +    int i;
> +    int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
> +
> +#define printfpr(fp)                                                    \
> +    do {                                                                \
> +        if (is_fpu64)                                                   \
> +            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
> +                         " fd:%13g fs:%13g psu: %13g\n",                \
> +                         (fp)->w[FP_ENDIAN_IDX], (fp)->d,               \
> +                         (double)(fp)->fd,                              \
> +                         (double)(fp)->fs[FP_ENDIAN_IDX],               \
> +                         (double)(fp)->fs[!FP_ENDIAN_IDX]);             \
> +        else {                                                          \
> +            fpr_t tmp;                                                  \
> +            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];              \
> +            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX];       \
> +            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
> +                         " fd:%13g fs:%13g psu:%13g\n",                 \
> +                         tmp.w[FP_ENDIAN_IDX], tmp.d,                   \
> +                         (double)tmp.fd,                                \
> +                         (double)tmp.fs[FP_ENDIAN_IDX],                 \
> +                         (double)tmp.fs[!FP_ENDIAN_IDX]);               \
> +        }                                                               \
> +    } while (0)
> +

Code motion, so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +
> +    qemu_fprintf(f,
> +                 "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
> +                 env->active_fpu.fcr0, env->active_fpu.fcr31, is_fpu64,
> +                 get_float_exception_flags(&env->active_fpu.fp_status));
> +    for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
> +        qemu_fprintf(f, "%3s: ", fregnames[i]);
> +        printfpr(&env->active_fpu.fpr[i]);

... but since this macro has exacly one use, can we just inline it here?  Or 
turn it into a proper function?


r~

