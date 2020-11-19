Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48EF2B9CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:25:50 +0100 (CET)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfrR7-0002z0-6u
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrPp-0002Ry-MG
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:24:29 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrPn-00014U-Qo
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:24:29 -0500
Received: by mail-pf1-x434.google.com with SMTP id v5so1681363pff.10
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UN2sc9tb+6RlOX+6EMA/SQzkzvoMg4bkWWxAoMrHQdk=;
 b=ElCiirAWrKG2BXlNr8BLuvWPgHr1YBRJ2Uaq0wJpwsGPmuBA2ffLwyX6rKYGwA+biF
 IzSXTDUUmSHjC1OBpiSWgvI5wDbrq5JuL6uqTRCVKj83F0Fu0dx5OgXpfLWx/iqdtmkB
 degEOkcry8yciCnTD9jcP6DmoUxlr3uN3qgo18R1VsGAXRRHnguosPtBUKtvJQ9VfRWk
 7oCFYC5XaodFc09BukvKqveJsvyNtLIQInQkcie/gCKOWZlszQwHhGhWIcJx+KZGLu3B
 tSRTioo2KdmGiz87cxwXK7m9ucjRPSrN77BlKnrr5w9qdO17Bmtp4lyZDftHpkD17TJU
 Vjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UN2sc9tb+6RlOX+6EMA/SQzkzvoMg4bkWWxAoMrHQdk=;
 b=omOylT0u+aq/z0uY+MR3wV+rw85CPoyj7JrRwg+8leygCQjOHDcsOpGzuSBIjI74BA
 ecffKP1odnqWq/uUikjebNQi6zchjx+3xByzVBkBSh6GmjdcS+OJ8OeEKgtc57uc6ADF
 rwp5WQ30d+EOhgGafinp94jRESHy5FaseCao4hXtgQ+3WuipgmZsaNnI9UEANicRCjgV
 uVbkvIOnG8wx7LglyeOY9TvcDo1Eqj5yqFd8Byzov/gusC7PMbs0sjk+4d7OQ7DVLRfo
 E2QFc2N/SCptYgNajPdgS7CUErLZCrCuEto1SzAtbAOkJoHAb81gzOIUWCxqsylvZIYL
 6JjQ==
X-Gm-Message-State: AOAM53050rdUfdIqqMOHp4RZtxcgmiYm2fp+OAVuNwtPNK1vvTr53cyp
 HJfucoxFkwJJe8vNdY3adijxRQ==
X-Google-Smtp-Source: ABdhPJzA4qXnq6+38rI4pTrP0bTJUQhQQagZZidic9xyw93SicJmuv09WYrjRAg7RLCsf2R/IvYw9Q==
X-Received: by 2002:a63:1619:: with SMTP id w25mr14149781pgl.34.1605821065958; 
 Thu, 19 Nov 2020 13:24:25 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 26sm580478pgm.92.2020.11.19.13.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:24:25 -0800 (PST)
Subject: Re: [RFC 11/15] target/riscv: rvb: generalized reverse
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-12-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92347abb-7acf-b24e-6072-ff59d97bb6ba@linaro.org>
Date: Thu, 19 Nov 2020 13:24:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-12-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static target_ulong do_grev(target_ulong rs1,
> +                            target_ulong rs2,
> +                            const target_ulong masks[])
> +{

I think the masks should be placed here, and not passed in.
What you should pass in is "int bits".


> +    target_ulong x = rs1;
> +    int shift = 1;
> +    int i = 0;
> +
> +    while (shift < TARGET_LONG_BITS) {
> +        if (rs2 & shift) {
> +            x = do_swap(x, masks[i], shift);
> +        }
> +        shift <<= 1;
> +        ++i;

Cleaner as for loop:

    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1)

> +    static const target_ulong masks[] = {
> +#ifdef TARGET_RISCV32
> +        0x55555555, 0x33333333, 0x0f0f0f0f,
> +        0x00ff00ff, 0x0000ffff,
> +#else
> +        0x5555555555555555, 0x3333333333333333,
> +        0x0f0f0f0f0f0f0f0f, 0x00ff00ff00ff00ff,
> +        0x0000ffff0000ffff, 0x00000000ffffffff,
> +#endif

You don't need to replicate every entry.

    dup_const(0x55, MO_8),
    dup_const(0x33, MO_8),
    dup_const(0x0f, MO_8),
    dup_const(0xff, MO_16),
    dup_const(0xffff, MO_32),
#ifdef TARGET_RISCV64
    UINT32_MAX
#endif

> +target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
> +{
> +    static const target_ulong masks[] = {
> +        0x55555555, 0x33333333, 0x0f0f0f0f,
> +        0x00ff00ff, 0x0000ffff,
> +    };
> +
> +    return do_grev(rs1, rs2, masks);

This one is broken because do_grev iterated to TARGET_LONG_BITS == 64, and the
masks array is too small.

Fixed by passing in 32 as bits parameter to do_grev, as above.

> +static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    return gen_grevi(ctx, a);
> +}

While this is ok for an initial implementation, it is worth noticing the shamt
for rev8 as a special case for tcg_gen_bswap_tl.

Otherwise, this needs the same gen_shift treatment.


r~

