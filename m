Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039243524D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 20:02:45 +0200 (CEST)
Received: from localhost ([::1]:53366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFvH-0003ym-7m
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 14:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdFsB-0001kN-S1
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:59:31 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdFs6-000634-PZ
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:59:31 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t21so8643805plr.6
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KBEUJmqs0FA77aURgMWjnR3HUCt71GM+gEmQsqXoAkY=;
 b=C8M4s67bXBeO56C2YGEz0tQKDuR6ttaQVOJzionKBwXBFyI7ZGKpfGDYkeXuS/UfDU
 fiFDjcTPi2Y5m6Y/+VhgnzWfZ+qa5540uDtQKRr6ttyeQYQNk02DKHn3QpX9LM8IXhtZ
 Jpvn+eSyS39JA7CIAA52XjXN8Ag0isBdt2cDdTEZ4/E1Deh/CDsQOY6CYBDKbTFjqw1V
 wbFE3Q5p+odoAS0prF/9Dlqb2ay0HMW7kMVNtISvSKo3my8UEpG95GTJlfDrZg2qoPoM
 uh1ja0XhM3jXSy4I/aUu2/7C2oKk1x7s6eKHcNlcj7spLFoP5Dy46SSKZYOeNvTbE2SY
 onAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KBEUJmqs0FA77aURgMWjnR3HUCt71GM+gEmQsqXoAkY=;
 b=WD+CUGYTguDB8toYwhXB1ln0KusuyVJoeAPgGFjWFBM0S/nPNuG8MLat9uJOCoiozy
 Pxvd23CunrKihRmxH5aeGSbPZZMs9g2omGmeXpf7sRzCjoN4joGo89yCd075INX7gGb1
 3VkheNzwYn46Wo35//3pzTY/KF1axDblQoqcuG+TiJQvT0JTv2vPp3TZa18/JQyur88Q
 r8isVF4qeF0aZXWheGoUXBSaHSmzIDM2cv9lgBjlILyuVllGgNCVYEHrjdoyKUQU8tjl
 hdAWMSWCsy1nMED9UkPBfU5uqu0clos0DtckWQ1LXFYAxXdt7PL8GvkLiFsfBC8u3Ker
 GyGw==
X-Gm-Message-State: AOAM533mbBckOPTN9z7tIXMpuG+pAxGTS/RQwCJs31KSBrCfQrAP9iHq
 2MQ0FVCBVzV68dpNt/6pxn7bZg==
X-Google-Smtp-Source: ABdhPJxQoDGlusm49icfOaH3hlErwBlL6sZh2SC9VXv5zrG2aRMTKFmBKMNnpVjFAWuBoe00mUbfTg==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr390401pjb.135.1634752765266; 
 Wed, 20 Oct 2021 10:59:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w13sm6500105pjc.29.2021.10.20.10.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:59:24 -0700 (PDT)
Subject: Re: [PATCH v3 12/21] target/riscv: support for 128-bit U-type
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-13-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcc439d2-68db-200d-0fc8-44a73979c4ff@linaro.org>
Date: Wed, 20 Oct 2021 10:59:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-13-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> Adding the 128-bit version of lui and auipc.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 92f41f3a86..b5e292a2aa 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -26,14 +26,17 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
>   
>   static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
>   {
> -     REQUIRE_64BIT(ctx);
> -     return trans_illegal(ctx, a);
> +    REQUIRE_64_OR_128BIT(ctx);
> +    return trans_illegal(ctx, a);
>   }
>   
>   static bool trans_lui(DisasContext *ctx, arg_lui *a)
>   {
>       if (a->rd != 0) {
>           tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
> +        if (get_xl_max(ctx) == MXL_RV128) {
> +            tcg_gen_movi_tl(cpu_gprh[a->rd], -(a->imm < 0));
> +        }
>       }
>       return true;
>   }
> @@ -41,7 +44,19 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
>   static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>   {
>       if (a->rd != 0) {
> +        if (get_xl_max(ctx) == MXL_RV128) {
> +            /* TODO : when pc is 128 bits, use all its bits */
> +            TCGv pc = tcg_constant_tl(ctx->base.pc_next),
> +                 imml = tcg_constant_tl(a->imm),
> +                 immh = tcg_constant_tl(-(a->imm < 0)),
> +                 zero = tcg_constant_tl(0);
> +            tcg_gen_add2_tl(cpu_gpr[a->rd], cpu_gprh[a->rd],
> +                            pc, zero,
> +                            imml, immh);

A runtime computation of constant + constant is pointless.

I think you should refactor these into a gen_set_gpri, and hide the sign-extension into 
gprh there.


r~

