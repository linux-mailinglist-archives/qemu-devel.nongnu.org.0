Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6FA68D565
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPM7G-0004WU-NQ; Tue, 07 Feb 2023 06:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPM74-0004Rp-N7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:26:14 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPM72-0000yE-HQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:26:14 -0500
Received: by mail-wr1-x434.google.com with SMTP id k13so5809746wrh.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SGBnIvqipp616HNAPW5U1H37qtbipmGiadcF4aifNfM=;
 b=Bdl4TbS3gDMsSF8l4APvf+6BoEAYo6R+dnFWOjs+U8wOT7sFAiiH3TTZuzbIpNiHQa
 AiSaxfK/eB7vK3gKhucXnxP7EIDQir0uLat1r/99/S7DO5wdzxGBAZ0KQXAPPz0vFzG3
 cOqqsuIA/xr9EjRkaYcaOFG96soZ25UaGGAUub1PT2H5eVQcnKnmWoJiaGTVRMzJPh2Y
 D61pHPSQmPvqBRr7JCSp4ONcZ/NYobu6XvxXcOU+y5E/zW3I0HJlfpNknbEDe16ZfgIo
 J8hq3TLiK9U3RhDNHMzyABqj45LVj79Y28TDusWiBhcax+ibiDbGUr+ESw5eMkLTjWCr
 PiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SGBnIvqipp616HNAPW5U1H37qtbipmGiadcF4aifNfM=;
 b=IV6kfVYY3ylP4qpP7M0ngfJtPiRjN/GQ5wNFxoDVon+Mb4bdHQSx70Joypd9rV4BaK
 BanM0F7SxVDS4+9h9VwzMMJkoqHfqf5oGWLZ5ca9el+bQhSR9Iv50SjVRN7GuAx3z27Z
 wOWzNVp1xfDrGWfxoyLI+Y8lOHxYu/KtpHg9R6R09aaI0YTD68bHPoMhJY5hBgHQ1mqX
 thvXrivw/VCDv1QkiZS7nbMAqTnEYGwixfF3DaZiM1nly00UIRa/zhPy866DYudwThrK
 TxQczOVDFn3S8sgtqgaty5jaCrXe1llaOyTX30p9yMPYQwG+5DIltJfgeBTPucUC5QZy
 mmXw==
X-Gm-Message-State: AO0yUKXwZOaMGnHZXX48y8xWexrnCG6Xn8uyv4M0kuiTl3SJc18D8Zza
 w6NiWjbhZ/FCNf8CBrMPrfGSqA==
X-Google-Smtp-Source: AK7set9MdqYqfvOgnbSk+2+BsYnoI65GI+tj4ZvH/pEVeV7SmsHX9oW1trrGm+XkxIlAodP9WiS1mA==
X-Received: by 2002:adf:e407:0:b0:2bf:963e:f9b5 with SMTP id
 g7-20020adfe407000000b002bf963ef9b5mr2323142wrm.6.1675769168818; 
 Tue, 07 Feb 2023 03:26:08 -0800 (PST)
Received: from [192.168.46.175] (62.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.62]) by smtp.gmail.com with ESMTPSA id
 t1-20020a5d4601000000b002bdfe3aca17sm10994971wrq.51.2023.02.07.03.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:26:07 -0800 (PST)
Message-ID: <82cdff33-4a41-cfae-2235-f6d4345f4f1c@linaro.org>
Date: Tue, 7 Feb 2023 12:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] Replace `TARGET_TB_PCREL` with `CF_PCREL`
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org
References: <20230207104352.11055-1-anjo@rev.ng>
 <20230207104352.11055-3-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207104352.11055-3-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/2/23 11:43, Anton Johansson via wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   accel/tcg/cpu-exec.c        |  8 +++----
>   accel/tcg/internal.h        | 10 ++++----
>   accel/tcg/perf.c            |  2 +-
>   accel/tcg/tb-jmp-cache.h    | 48 ++++++++++++++++++-------------------
>   accel/tcg/tb-maint.c        |  8 +++----
>   accel/tcg/translate-all.c   | 14 +++++------
>   include/exec/cpu-defs.h     |  3 ---
>   include/exec/exec-all.h     | 27 +++++++++------------
>   target/arm/cpu.c            |  8 +++----
>   target/arm/translate-a64.c  |  8 +++----
>   target/arm/translate.c      |  6 ++---
>   target/arm/translate.h      |  2 +-
>   target/i386/helper.c        |  2 +-
>   target/i386/tcg/tcg-cpu.c   |  6 ++---
>   target/i386/tcg/translate.c | 26 ++++++++++----------
>   15 files changed, 84 insertions(+), 94 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 9c857eeb07..0a84934ed4 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -186,7 +186,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
>       const TranslationBlock *tb = p;
>       const struct tb_desc *desc = d;
>   
> -    if ((TARGET_TB_PCREL || tb_pc(tb) == desc->pc) &&
> +    if ((tb_cflags(tb) & CF_PCREL || tb_pc(tb) == desc->pc) &&
>           tb_page_addr0(tb) == desc->page_addr0 &&
>           tb->cs_base == desc->cs_base &&
>           tb->flags == desc->flags &&
> @@ -238,7 +238,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
>           return NULL;
>       }
>       desc.page_addr0 = phys_pc;
> -    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : pc),
> +    h = tb_hash_func(phys_pc, (cflags & CF_PCREL ? 0 : pc),
>                        flags, cflags, *cpu->trace_dstate);
>       return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
>   }
> @@ -257,7 +257,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
>   
>       hash = tb_jmp_cache_hash_func(pc);
>       jc = cpu->tb_jmp_cache;
> -    tb = tb_jmp_cache_get_tb(jc, hash);
> +    tb = tb_jmp_cache_get_tb(jc, cflags, hash);
>   
>       if (likely(tb &&
>                  tb_jmp_cache_get_pc(jc, hash, tb) == pc &&
> @@ -460,7 +460,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
>           if (cc->tcg_ops->synchronize_from_tb) {
>               cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
>           } else {

Possibly:

#ifdef CONFIG_DEBUG_TCG

> -            assert(!TARGET_TB_PCREL);
> +            assert(!(tb_cflags(last_tb) & CF_PCREL));
>               assert(cc->set_pc);

#endif

Or maybe clearer, use tcg_debug_assert()?

>               cc->set_pc(cpu, tb_pc(last_tb));
>           }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


