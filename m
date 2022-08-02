Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C406358770D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:19:40 +0200 (CEST)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIlFj-0006ls-3Q
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIlBJ-0004RA-Pv
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:15:05 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIlBI-0004Me-89
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:15:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id v18so12515157plo.8
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 23:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=k5TbxnbZJ7PGdY77U4jAGfY5xep7RpCKvNCRkthx8J4=;
 b=OxG/0suQji8bdmI4OWuKImnIxC5KwIwGbgI5vEurG7sf0kw6VStDt+URW/UtMS9JOQ
 9sUQlWleVEOVE/X+5CnOjGJWWIiRBCpQfnrOyunDvJuhJA5nTL6BqX2l847MuuXNyDIf
 s5ZsYuogvlgjf7gCR4gMYSfGbX0D7x8XIei15WEdDRZGeKWAI65ZP4I4AluIWO2jluZP
 hHCZsFV5EYxzM2KGH87ioV4m3HX7kAs9jb60W5bW052eI2hICz4PiA7dnOylXENnMyS3
 kw1LS4arlYizBW7ceUieBt9YRbo89IbPOM2Uc39QbD6sKse90RWDqyXcaJrjnVWL5fZA
 8tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=k5TbxnbZJ7PGdY77U4jAGfY5xep7RpCKvNCRkthx8J4=;
 b=LlUvbGk2k9QKOiMwfohymAEUsp2GRKWdLGr34w/gDp1qga/kpi1dfR/MUl1dfaO1pX
 KyVLa5jNl2XZQIXYGKMXDz4TwfpegByrAKS2kIoitMxICW9ruB+8MfWch8P/cTX5y2nF
 Zc5oMe47b058Y1fRgczlkSkLP01XZUT7t7xdwTJFsGssi8JOHCm8391S+cglwiaAu6/s
 l0p7twQk0ww4QQuLltQi7c/TnyEDzw9Xg1wH/oxtcMsFB5QmNM+L7LHJvibGsOhrUD/+
 ZSBKdgI1CbjkNppjwdZc07hDacO7i0bP4spkQS6MJqAt2z26j2WRXjQXLfiT4pofeHfq
 ZhPQ==
X-Gm-Message-State: ACgBeo25H5ClllidfPt57X9vZ1Z6zbeqGphYNJcYiIOYRAriGXbiZZdz
 F6jeo9G9xwRfOBnZ3AFIwho=
X-Google-Smtp-Source: AA6agR5yehzjqeaW15xLuaJYoFGPdSfOlRi9hMiUjWQeYXLVnmYjJ/wXhKhH9BUhrCvLJCX2ESx5Qw==
X-Received: by 2002:a17:902:ba83:b0:16a:2917:73de with SMTP id
 k3-20020a170902ba8300b0016a291773demr19581006pls.2.1659420902679; 
 Mon, 01 Aug 2022 23:15:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y127-20020a623285000000b0052cdb06c125sm7580884pfy.159.2022.08.01.23.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 23:15:02 -0700 (PDT)
Message-ID: <b09cbe40-3602-04e3-2d18-0584310d424e@amsat.org>
Date: Tue, 2 Aug 2022 08:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] linux-user: Set ELF_BASE_PLATFORM for MIPS
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, laurent@vivier.eu
Cc: qemu-devel@nongnu.org
References: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
 <20220801200928.73741-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20220801200928.73741-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/8/22 22:09, Jiaxun Yang wrote:

"On MIPS, AT_BASE_PLATFORM identifies the ISA level (since Linux 5.7)."

> Match most appropriate base platform string based on insn_flags.
> Logic is aligned with arch/mips/kernel/cpu-probe.c in Linux kernel.
"... aligned with set_isa() from ..."

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   linux-user/elfload.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index e7666c5c60..8a4ac9787f 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1050,6 +1050,37 @@ static uint32_t get_elf_hwcap(void)
>   #define elf_check_abi(x) (!((x) & EF_MIPS_ABI2))
>   #endif
>   
> +#define ELF_BASE_PLATFORM get_elf_base_platform()
> +
> +#define MATCH_PLATFORM_INSN(_flags, _base_platform)      \
> +    do { if ((cpu->env.insn_flags & (_flags)) == _flags) \
> +    { return _base_platform; } } while (0)
> +
> +static const char *get_elf_base_platform(void)
> +{
> +    MIPSCPU *cpu = MIPS_CPU(thread_cpu);
> +
> +    /* 64 bit ISAs goes first */
> +    MATCH_PLATFORM_INSN(CPU_MIPS64R6, "mips64r6");
> +    MATCH_PLATFORM_INSN(CPU_MIPS64R5, "mips64r5");
> +    MATCH_PLATFORM_INSN(CPU_MIPS64R2, "mips64r2");
> +    MATCH_PLATFORM_INSN(CPU_MIPS64R1, "mips64");
> +    MATCH_PLATFORM_INSN(CPU_MIPS5, "mips5");
> +    MATCH_PLATFORM_INSN(CPU_MIPS4, "mips4");
> +    MATCH_PLATFORM_INSN(CPU_MIPS3, "mips3");
> +
> +    /* 32 bit ISAs */
> +    MATCH_PLATFORM_INSN(CPU_MIPS32R6, "mips32r6");
> +    MATCH_PLATFORM_INSN(CPU_MIPS32R5, "mips32r5");
> +    MATCH_PLATFORM_INSN(CPU_MIPS32R2, "mips32r2");
> +    MATCH_PLATFORM_INSN(CPU_MIPS32R1, "mips32");
> +    MATCH_PLATFORM_INSN(CPU_MIPS2, "mips2");
> +
> +    /* Fallback */
> +    return "mips";
> +}
> +#undef MATCH_PLATFORM_INSN
> +
>   static inline void init_thread(struct target_pt_regs *regs,
>                                  struct image_info *infop)
>   {


