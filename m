Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC65F31E7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:23:54 +0200 (CEST)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMMK-0001xm-Pm
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofMHZ-0005w1-9b; Mon, 03 Oct 2022 10:18:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofMHW-0007Bd-Bv; Mon, 03 Oct 2022 10:18:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id b7so9359640wrq.9;
 Mon, 03 Oct 2022 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=RAcORxq9RdBQCcHgDexiQJOT4k3i/ts62UqVX+4RK48=;
 b=GGDEwTGe+3/oFdLiSfITqxHVZrZ+LsZjAa9W330uGANJW5Nz5MHOR4KG4lbe04owUl
 Y+HgNhfSOGBgBcf/0m67w7AviyGB+5n1OeR2ABO42lExDdoXTDw/Sr3wPuxVmWaU6OXD
 Q1waV+7rfunavVQAVx/u+vXm6fgQmoBEViy9637WXKaB6ms3kAPijlIxrdBunmLbC5Rd
 oK9i3w54zQE3wa2l4qaoO1wc1pfqZfYwWClcteuCe2jnTS0SqPMElWpwN1JdYcKSmCvR
 H6KwUlM5hVBe+F0TJZSLnuGOQtgK3/o4MQTjPkxW8Om+v1ApB+DtgNMLJrv4Z/D0SWdK
 SBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=RAcORxq9RdBQCcHgDexiQJOT4k3i/ts62UqVX+4RK48=;
 b=A7O1QMtfEynzVBoXqflBjGUPFX73BkxqChfWLXLM/avqf8XjvLJQcng+uAY2hz2KIj
 iAuxeuZCeTwGCruE3SRT0j4ZetJrfbTzKPQQLWdzQjVNrOn2ZGOjpIyrxDQIsOPoJPUu
 0TBksPyadKEcxTPUd2gqpiNllOlXfUR1vL6xSMd6OmF/00q0cowrBUgGx3+I334GW6DO
 YDsph1Qszrh15JOiF25TfyjFqOB/TVcltakW+Acna7gD7YiupX2IWHpSU75y5KcfYSOT
 O4My7xRNkiz5ZAaRWofyVbGUbp/FzwGCXZ14Ii7Qel8Om94koQF0mRkbzyVTXQR/M6SO
 oM7w==
X-Gm-Message-State: ACrzQf15/qeDTUR13dPESeKGHsR/RkwKrMPR7ufUU1W3gO+0Q9czihvk
 8HhbqHn+eOMowA76XYnz3S0=
X-Google-Smtp-Source: AMsMyM7DyV9mcfKC6LDI3QeWTQBueyG6hlEtpYxNC/VDpFQXigtNWyhXBT27lZtBIR4vKOvXatTjbA==
X-Received: by 2002:a5d:5050:0:b0:22c:dbba:9ab1 with SMTP id
 h16-20020a5d5050000000b0022cdbba9ab1mr11974765wrt.341.1664806731963; 
 Mon, 03 Oct 2022 07:18:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m10-20020adfe0ca000000b0022e36c1113fsm4247950wri.13.2022.10.03.07.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 07:18:51 -0700 (PDT)
Message-ID: <e2440ba1-b41c-3d75-d1e3-f58ae5a93322@amsat.org>
Date: Mon, 3 Oct 2022 16:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v5 3/9] target/arm: Change gen_*set_pc_im to gen_*update_pc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-4-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/10/22 00:03, Richard Henderson wrote:
> In preparation for TARGET_TB_PCREL, reduce reliance on
> absolute values by passing in pc difference.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a32.h |  2 +-
>   target/arm/translate.h     |  6 ++--
>   target/arm/translate-a64.c | 32 +++++++++---------
>   target/arm/translate-vfp.c |  2 +-
>   target/arm/translate.c     | 68 ++++++++++++++++++++------------------
>   5 files changed, 56 insertions(+), 54 deletions(-)

> -void gen_a64_set_pc_im(uint64_t val)
> +void gen_a64_update_pc(DisasContext *s, target_long diff)
>   {
> -    tcg_gen_movi_i64(cpu_pc, val);
> +    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
>   }

> @@ -384,11 +384,11 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
>   

Adding more context from previous patch to ease review:

 >       uint64_t dest = s->pc_curr + diff;

>       if (use_goto_tb(s, dest)) {
>           tcg_gen_goto_tb(n);
> -        gen_a64_set_pc_im(dest);
> +        gen_a64_update_pc(s, diff);
>           tcg_gen_exit_tb(s->base.tb, n);
>           s->base.is_jmp = DISAS_NORETURN;
>       } else {
> -        gen_a64_set_pc_im(dest);
> +        gen_a64_update_pc(s, diff);
>           if (s->ss_active) {
>               gen_step_complete_exception(s);
>           } else {

> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 6855128fb1..01b7536c7e 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -772,9 +772,9 @@ void gen_set_condexec(DisasContext *s)
>       }
>   }
>   
> -void gen_set_pc_im(DisasContext *s, target_ulong val)
> +void gen_update_pc(DisasContext *s, target_long diff)
>   {
> -    tcg_gen_movi_i32(cpu_R[15], val);
> +    tcg_gen_movi_i32(cpu_R[15], s->pc_curr + diff);
>   }

> @@ -2600,10 +2600,10 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
>   

Ditto:

 >       target_ulong dest = s->pc_curr + diff;

>       if (translator_use_goto_tb(&s->base, dest)) {
>           tcg_gen_goto_tb(n);
> -        gen_set_pc_im(s, dest);
> +        gen_update_pc(s, diff);
>           tcg_gen_exit_tb(s->base.tb, n);
>       } else {
> -        gen_set_pc_im(s, dest);
> +        gen_update_pc(s, diff);
>           gen_goto_ptr();
>       }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


