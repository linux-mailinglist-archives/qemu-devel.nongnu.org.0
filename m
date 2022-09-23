Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188C5E7303
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:37:36 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obaRT-0000Ug-7Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obaMg-0005S1-3a
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:32:41 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obaMd-0004f1-P5
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:32:37 -0400
Received: by mail-pf1-x432.google.com with SMTP id u132so11286748pfc.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=moA84A0eikLETycYiFaTzVS4fuR9x4kzw7DVfy6xJpI=;
 b=EMG8hPWIQBFbI4dO+dqSMwC9r64bxjO/ZcMRBHY+ACoOCnuGAaU1YBBeJpreyGXCbc
 NN5D7x1yCKSoqX0J8zHLi48aLmlOkRnTMygzyjFXrhhipBS1moclkZ8EN/EMKpeEw70U
 giLo3dSKkpwQmFpwDY6EczDBoxLrNGvPBIonDGERgX5X8Yn3EDFs3AwIxzyFt/FdAFyn
 ek/saX7tD1Mp/iIfIlFrkbaisznBXvpkRshtM3U26zlMpODo62k9/TotmD8HWLpSiPF6
 qjBsvypeZ857j8pDn946UUeQeAlzaopSzM4KAphuV5RqePx9W+pnuYXJLFxRVQDxcaxy
 se/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=moA84A0eikLETycYiFaTzVS4fuR9x4kzw7DVfy6xJpI=;
 b=UqbSLHhNmtDwRr4SfER7q4CDN8qQlFRFij1V677wXpM1xRfsR1RxXI7bUHZmviPQPy
 V47i/FpbxcrOUSSFwgrQNGLPhClkvNUcG8bn2QDz28XEgzml5TYIQntde2HLvUuqyPyJ
 l44rLazYGGBeKHKhd3PB+57Zdd+pxkW66gkj4axfvcMAboGYuGVstZ4PbB7pzYg7WL6e
 GP1OzoOFPWZJBwL8Q7F+3m9tTCwxPYftZyEa6llWP5AJs4hTy529AVPGH8d38n9ZeXY6
 0shFQB+nusXDhva3ZQjwDzBYcw6ONYmOBdd+ScIZfgb9HDIZXBO+MSOSDXAzTBERW6bO
 yTdQ==
X-Gm-Message-State: ACrzQf2hjvfGfkDApoqapBSgDJ+BDcTBtvVsTp3u+kS3mQ6th3UpVw0R
 JwMfEqETIde40VzJaeP6IJK/WrbxUytd5Zibtxg=
X-Google-Smtp-Source: AMsMyM6dTRQ04U+eHJfMUv43YN102jBzqJyAlyuUz5k2URM+c+K+saf9TPYATSYqWV5ckgLK9MYkM/5Fz3stn/G836o=
X-Received: by 2002:a05:6a00:1496:b0:546:2856:6cf5 with SMTP id
 v22-20020a056a00149600b0054628566cf5mr6917638pfu.31.1663907554292; Thu, 22
 Sep 2022 21:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220901010220.495112-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220901010220.495112-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Sep 2022 14:32:07 +1000
Message-ID: <CAKmqyKNf-0dfBnz-STp4bmhGeYa4Ck4XEgcbZzzN6qhy5xqrZg@mail.gmail.com>
Subject: Re: [RFC] hw/registerfields: add `FIELDx_1CLEAR()` macro
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair Francis <alistair@alistair23.me>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Sep 1, 2022 at 11:03 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Adds a helper macro that implements the `rw1c`
> behaviour.
>
> Ex:
>   uint32_t data = FIELD32_1CLEAR(val, REG, FIELD);
>
> if the specified `FIELD` is set (single/multi bit all fields)
> then the respective field is cleared and returned to `data`.
>
> If ALL bits of the bitfield are not set, then no change and
> val is returned.

I feel like the value is operating over the entire field.

Say for example there is an interrupt pending register, with a current
value of 0b0010.

If a guest writes 0b1111 they expect ALL of the bits to be cleared
(for a w1c register). I think the macro should handle that, instead of
requiring the exact bits to be set.

Alistair

>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  include/hw/registerfields.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index 1330ca77de..5a804f72e3 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -115,6 +115,34 @@
>                    R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
>      _d; })
>
> +/* Get the max value (uint) discribed by `num_bits` bits */
> +#define MAX_N_BITS(num_bits) ((1 << (num_bits)) - 1)
> +
> +/*
> + * Clear the specified field in reg_val if
> + * all field bits are set, else no changes made. Implements
> + * single/multi-bit `rw1c`
> + */
> +#define FIELD8_1CLEAR(reg_val, reg, field)                                \
> +    ((FIELD_EX8(reg_val, reg, field) ==                                   \
> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                   \
> +      FIELD_DP8(reg_val, reg, field, 0x00) : reg_val)
> +
> +#define FIELD16_1CLEAR(reg_val, reg, field)                               \
> +    ((FIELD_EX16(reg_val, reg, field) ==                                  \
> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                   \
> +      FIELD_DP16(reg_val, reg, field, 0x00) : reg_val)
> +
> +#define FIELD32_1CLEAR(reg_val, reg, field)                               \
> +    ((FIELD_EX32(reg_val, reg, field) ==                                  \
> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                   \
> +      FIELD_DP32(reg_val, reg, field, 0x00) : reg_val)
> +
> +#define FIELD64_1CLEAR(reg_val, reg, field)                               \
> +    ((FIELD_EX64(reg_val, reg, field) ==                                  \
> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                   \
> +      FIELD_DP64(reg_val, reg, field, 0x00) : reg_val)
> +
>  #define FIELD_SDP8(storage, reg, field, val) ({                           \
>      struct {                                                              \
>          signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
> --
> 2.37.2
>
>

