Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3C3DD2EA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:26:18 +0200 (CEST)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAUDB-0000MW-UZ
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAUC1-000823-Cu
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:25:05 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAUBz-0000Jh-NJ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:25:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j2so20594381wrx.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H9MPoefbYKNYgKQ2b507otj4DSipDS0b3wpRypcZ8DE=;
 b=SSJ9T6Sux3fRsupaonphKs/aGFl0Q1umsD6TTxu2fxaOtbJ7XoZMknIllpefZ8WLsr
 cHOBwBNGUr5JRkuEcEjEBcB919cCKKBV+hxjZMU4nbwHhASP9B96OnbrU2Brv2aol9e3
 5/lf4Ocx0uRbioH5sq7mijsZZW7XVERqIalTRnuHGStnPS5Q82Y02JmKyGcK5UYYLpA/
 0W7GbOFpXl7DT2U6wZTd2LlzBT6pycWPM1C04zLNgivIsJ7V8alB7OUTCcBZwLqrpGZB
 btDgsAlYUK2CUGcVibPLr2AXOGluDlaH4DfiL3XdJIGEKHW+9wm/oj7SM+tdCezlLHkJ
 1CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H9MPoefbYKNYgKQ2b507otj4DSipDS0b3wpRypcZ8DE=;
 b=VE8MIQ0R0oreq3VsW7KOiVTuyeD4mXoxn5/IwQatBWGYwVv2u8Lr7ridpNfVxZCV+N
 ncFFkr3eTyQK0387uOYdKe9C/iDs3uZUYqu2Wtb7P/DR8xpHZifT+nr7SWrsuiK7QLW4
 zAyKMIDJtd6FaD58GWoJGEnD9z6tOUEGtrYBm6ZMIOgl068pvmU5mbyJsd2/bzv6DrhG
 tjytfqYwMuIaV7Eaulb/ag4p+Pvqv15j5Rm9nPyzMPJcivaptS67IqFAU/wcn92rvzSn
 MahI9f0Exn40utAWkDGWLvkeocY1dk1M/LLLdWh+TM2g0J510cz3klz3YmVLFXoCH+41
 G02g==
X-Gm-Message-State: AOAM531tpf7v6rRWJJ7N94385EOLQ0IM09d8/FkFYzDMKuVlisbM/61r
 /oJ8oMDFJSph9SZKq6lFarE=
X-Google-Smtp-Source: ABdhPJyvTy+wOWbt+z5K3qg2FTHMG5oUYg4z8oQP0X5RxmTBFSSzTanHQVk/MfRG2DUZiGVIIdeenw==
X-Received: by 2002:adf:f149:: with SMTP id y9mr16904709wro.413.1627896302468; 
 Mon, 02 Aug 2021 02:25:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c15sm10270964wrw.93.2021.08.02.02.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 02:25:01 -0700 (PDT)
Subject: Re: [PATCH-for-6.1?] target/mips: Remove MOVZ/MOVN opcodes from
 Loongson 2E
To: qemu-devel@nongnu.org
References: <20210731144155.2738493-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <47f2912c-4933-aa78-de1d-f85884fddded@amsat.org>
Date: Mon, 2 Aug 2021 11:25:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731144155.2738493-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.08,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, yangxiaojuan@loongson.cn,
 Mark Shinwell <shinwell@codesourcery.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/31/21 4:41 PM, Philippe Mathieu-Daudé wrote:
> Per the "Godson-2E User Manual v0.6", the Loongson 2E processor
> does not implement the MOVZ/MOVN instructions

I'm confused because I can't find MOVZ/MOVN in the 2E manual and
the 2F explicits the difference. However looking at binutils,
these opcodes are also emited on the 2E:
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=350cc38db21f1cd651a6d46687542a0fce5e0303;hp=569502941afa825c5278b320ccedeefc82e8ed0e

Cc'ing Mark & Maciej in case they can enlighten me, and few
Loongson develeper in case they could check, because I don't
have 2E hardware to test.

> However it's enhanced version, the STLS2F01 processor, does.
> See STLS2F01 User Manual (rev 1), chapter 13.1 "The compliance
> overview":
> 
>   The STLS2F01 processor implements several special MIPS IV
>   instructions as the supplement to the MIPS III instructions.
>   These instructions include two MIPS IV instructions (i.e. MOVZ
>   and MOVNZ) ...
> 
> Fixes: aa8f40090ab ("target-mips: enable movn/movz on loongson 2E & 2F")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index bf71724f3f0..34a96159d15 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -14156,8 +14156,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
>      switch (op1) {
>      case OPC_MOVN:         /* Conditional move */
>      case OPC_MOVZ:
> -        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1 |
> -                   INSN_LOONGSON2E | INSN_LOONGSON2F);
> +        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1 | INSN_LOONGSON2F);
>          gen_cond_move(ctx, op1, rd, rs, rt);
>          break;
>      case OPC_MFHI:          /* Move from HI/LO */
> 

