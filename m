Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4043D3105
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 02:48:15 +0200 (CEST)
Received: from localhost ([::1]:59176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6jML-0002tb-OT
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 20:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6jKt-0002F0-HF
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 20:46:43 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6jKq-0000wv-CW
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 20:46:43 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so1599518pjh.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 17:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/R5rah4tkAdVOq6tK1PV1BI4oJJF8Mi6kCIPlhKWN44=;
 b=JP9y5Nr+t0rnShu0KD1tUSorGeajRCfgbc5q2ChXTA1AkuYOsM1Nmi1P1M879W4qj+
 Y6yb0ntYpBtVhpzTFLzbqURPpGJ9fx6uKl2cCGYzQF82l168J/DNEIrW4fgCqv1x87gd
 9CzGprvv1a5hIk7RN4RWT3cV88IMuDkmBGz8FVOF5q5MJufSr3epePdAVLk1FGS8WeqT
 IRy1b4UAmzHRnK4pq5s7tUYKFwf/JDsxVjhoJ1Afjz9Xs5nopBMiRQvJWEaHjcW8QHgi
 0QONKIRyHWZdEXAiaxvOrSqQr/52ONcfXunEgrP9XPEFdF28zZKhDor/T9XuBcUWX+KY
 Brng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/R5rah4tkAdVOq6tK1PV1BI4oJJF8Mi6kCIPlhKWN44=;
 b=fq8dakqPFMNd8kUApOrqbRowvMPqF4vL+nr5H8fj9RUYx8hTpHRo/XFOFJspM/qrCm
 7hyjKlz9UNzz4BHqz0hJr7tHxfdAR7+KnMdciZzTdGOSaLt/CEMUustEr/k4p8te69U4
 Lc0A7jPsNeMbOAPGKV3kmm31pycLfZ0h1icfTnaxgLgILlRC2nytZsb2F89zrCF9eA3R
 8Nqx+UFS1wKfBWmz/IpyU9xbIQYAi0bBGuypA0wdk5mljo9xs9L4Mrj9Ljm1Z0hPouoQ
 Kypj+DJ+4vNCVbhcJAvQAfsE7U9t1BSHzW8VF1tqIOAiCj9IsOhzxRLBCQyop3uCzVbw
 qXrQ==
X-Gm-Message-State: AOAM533+uocyYYEB/ftt6oBGFyd8YNVIJtiYK/Qy/qTVI/+XhAGPLNMq
 5v8loXThUEcCKf1HCERjWT3BAA==
X-Google-Smtp-Source: ABdhPJzjwmCoKkrdsEoxaQts7gWx4PEedY5bcSg1mubNxqXyEaxu9empAed5Cb9XHgmFDufEw6/vXw==
X-Received: by 2002:a17:902:c20d:b029:12b:565f:691e with SMTP id
 13-20020a170902c20db029012b565f691emr2126358pll.75.1627001198272; 
 Thu, 22 Jul 2021 17:46:38 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id h24sm32623390pfn.180.2021.07.22.17.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 17:46:37 -0700 (PDT)
Subject: Re: [PATCH v2 07/22] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad086e2a-3bfc-aa4b-d873-68d159ea2cbe@linaro.org>
Date: Thu, 22 Jul 2021 14:46:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> +/* Fixed point arithmetic operation instruction translation */
> +static bool trans_add_w(DisasContext *ctx, arg_add_w *a)
> +{
> +    TCGv Rd = cpu_gpr[a->rd];
> +    TCGv Rj = cpu_gpr[a->rj];
> +    TCGv Rk = cpu_gpr[a->rk];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    if (a->rj != 0 && a->rk != 0) {
> +        tcg_gen_add_tl(Rd, Rj, Rk);
> +        tcg_gen_ext32s_tl(Rd, Rd);
> +    } else if (a->rj == 0 && a->rk != 0) {
> +        tcg_gen_mov_tl(Rd, Rk);
> +    } else if (a->rj != 0 && a->rk == 0) {
> +        tcg_gen_mov_tl(Rd, Rj);
> +    } else {
> +        tcg_gen_movi_tl(Rd, 0);
> +    }
> +
> +    return true;
> +}

Do not do all of this "if reg(n) zero" testing.

Use a common function to perform the gpr lookup, and a small callback function for the 
operation.  Often, the callback function already exists within include/tcg/tcg-op.h.

Please see my riscv cleanup patch set I referenced vs patch 6.

> +static bool trans_orn(DisasContext *ctx, arg_orn *a)
> +{
> +    TCGv Rd = cpu_gpr[a->rd];
> +    TCGv Rj = cpu_gpr[a->rj];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    TCGv t0 = tcg_temp_new();
> +    gen_load_gpr(t0, a->rk);
> +
> +    tcg_gen_not_tl(t0, t0);
> +    tcg_gen_or_tl(Rd, Rj, t0);

tcg_gen_orc_tl.

> +static bool trans_andn(DisasContext *ctx, arg_andn *a)
> +{
> +    TCGv Rd = cpu_gpr[a->rd];
> +    TCGv Rj = cpu_gpr[a->rj];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    TCGv t0 = tcg_temp_new();
> +    gen_load_gpr(t0, a->rk);
> +
> +    tcg_gen_not_tl(t0, t0);
> +    tcg_gen_and_tl(Rd, Rj, t0);

tcg_gen_andc_tl.

> +static bool trans_mul_d(DisasContext *ctx, arg_mul_d *a)
> +{
> +    TCGv t0, t1;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = get_gpr(a->rj);
> +    t1 = get_gpr(a->rk);
> +
> +    check_loongarch_64(ctx);

Architecture checks go first, before you've decided the operation is a nop.

> +static bool trans_mulh_d(DisasContext *ctx, arg_mulh_d *a)
> +{
> +    TCGv t0, t1, t2;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = get_gpr(a->rj);
> +    t1 = get_gpr(a->rk);
> +    t2 = tcg_temp_new();
> +
> +    check_loongarch_64(ctx);
> +    tcg_gen_muls2_i64(t2, Rd, t0, t1);

If you actually supported LA32, you'd notice this doesn't compile.  Are you planning to 
support LA32 in the future?

> +static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
> +{
> +    TCGv_i64 t0, t1;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +
> +    tcg_gen_movi_tl(t0, a->si20);
> +    tcg_gen_concat_tl_i64(t1, Rd, t0);
> +    tcg_gen_mov_tl(Rd, t1);

Hmm.  Better as

   tcg_gen_deposit_tl(Rd, Rd, tcg_constant_tl(a->si20), 32, 32);

> +static bool trans_lu52i_d(DisasContext *ctx, arg_lu52i_d *a)
> +{
> +    TCGv t0, t1;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    t1 = tcg_temp_new();
> +
> +    gen_load_gpr(t1, a->rj);
> +
> +    tcg_gen_movi_tl(t0, a->si12);
> +    tcg_gen_shli_tl(t0, t0, 52);
> +    tcg_gen_andi_tl(t1, t1, 0xfffffffffffffU);
> +    tcg_gen_or_tl(Rd, t0, t1);

Definitely better as

   tcg_gen_deposit_tl(Rd, Rd, tcg_constant_tl(a->si12), 52, 12);

> +static bool trans_addi_w(DisasContext *ctx, arg_addi_w *a)
> +{
> +    TCGv Rd = cpu_gpr[a->rd];
> +    TCGv Rj = cpu_gpr[a->rj];
> +    target_ulong uimm = (target_long)(a->si12);
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    if (a->rj != 0) {
> +        tcg_gen_addi_tl(Rd, Rj, uimm);
> +        tcg_gen_ext32s_tl(Rd, Rd);
> +    } else {
> +        tcg_gen_movi_tl(Rd, uimm);
> +    }
> +
> +    return true;
> +}

Again, there should be a common function for all of the two-register-immediate operations. 
  The callback here is exactly the same as for trans_add_w.

> +static bool trans_xori(DisasContext *ctx, arg_xori *a)
> +{
> +    TCGv Rd = cpu_gpr[a->rd];
> +    TCGv Rj = cpu_gpr[a->rj];
> +
> +    target_ulong uimm = (uint16_t)(a->ui12);

You shouldn't need these sorts of casts.


r~

