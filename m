Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A335EB56
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 05:15:06 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWVzd-00032r-88
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 23:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWVyI-0002d0-5V
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 23:13:42 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWVyG-0005zS-Eb
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 23:13:41 -0400
Received: by mail-pf1-x42c.google.com with SMTP id a85so12347221pfa.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 20:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UHqEgRmkG/wUkB8gH1KDikR5pfAqgCIrGztC2L+7fKc=;
 b=pHP5NrMnOka6Whk3sAt7na+Lb2wfqf8Ok0II+C9fOaAZqUmD2cNv77sksRMiHEhDyI
 f3AeYJG7Mt041oIcHllDbd+N4Fiv3q9HfiI6ra+MXx6CkTj9zkTuFJNU8kJNO5ddjXvj
 UCSbRuNxK1CS1qIj0TZ+2oPIu6JGtk6EX3airdEPeTC1Of1bdkcgl/QGtkSRA83zHFqA
 fV078GzxStahGTs0jpPPrf1zy0XDnxe7oOtYfKL/AaPieBOb/R5SjN9Mrap2kgfEk7Ou
 obB9mIosy0vqXNo9C9K4Blu8XEccipV58bnWJi12tRMae0J4GU0ou8FEGBgfjQ38J9cS
 Wi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UHqEgRmkG/wUkB8gH1KDikR5pfAqgCIrGztC2L+7fKc=;
 b=WbYEgHSbNfOMrjtfB194X3F+t/JMQeE2zEuUjE9+9Slw4RnAm94Wb7vfqEQzdujbsw
 41Jo0fJgUqt7MyLpRyBmdeWBehQ6gZYI7y0bjstCJSBTJXL8H5CHt/tQC+FWsSmz48xz
 rqEIcAYtY3cCSyke+AhRBBVn7/by0J7WrEywK5gXE1PsKlz4Id42fOAnmGPGbFRUs8/+
 U0kYunq4QbEvDMa2nJ96ftJ6pYdxrUpzevo5YBuPIaGfIHvil8oeGFX5t/BGlmVTVRXh
 EABlkhIKdYknmMnmcECkCExQNKtPiX/r1lpTiP/gFOG+QuwdDOjJEmYBRQLhYNXUOsqS
 +Y0Q==
X-Gm-Message-State: AOAM5336Jvaa88ddm/OG4DkjdD0LYguhSsvBUegmYxYzOAoFu0IwNPxM
 kQzbpUSkPFEssLZN1BVs03jQbA==
X-Google-Smtp-Source: ABdhPJyxLGvxnjRCtmQOdauVE/rsEADkyTC5MGzDxQj0woH6EcdYaWzGViPyDGAMJIuz2Jv8mqsKSg==
X-Received: by 2002:a63:fe12:: with SMTP id p18mr35638247pgh.425.1618370018881; 
 Tue, 13 Apr 2021 20:13:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b7sm15872997pgs.62.2021.04.13.20.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 20:13:38 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] target/riscv: Remove the hardcoded MSTATUS_SD macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <2d6d0483c1a1e7aedd1c410b34812ea8e076cb33.1618356725.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5948b55e-a769-59f2-8ef5-0b0e33dcb4b0@linaro.org>
Date: Tue, 13 Apr 2021 20:13:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2d6d0483c1a1e7aedd1c410b34812ea8e076cb33.1618356725.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 4:33 PM, Alistair Francis wrote:
> +#ifndef CONFIG_USER_ONLY
> +# ifdef TARGET_RISCV32
> +#  define is_32bit(ctx)  true
> +# else
> +static inline bool is_32bit(DisasContext *ctx)
> +{
> +    return !(ctx->misa & RV64);
> +}
> +# endif
> +#endif

It's going to be soon enough when this is used by user-only too.
I'd structure this as

#ifdef TARGET_RISCV32
# define is_32bit(ctx)  true
#elif defined(CONFIG_USER_ONLY)
# define is_32bit(ctx)  false
#else
static inline...
#endif

>       tmp = tcg_temp_new();
> +    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> +
> +
>       tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));

Careful with the extra whitespace.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

