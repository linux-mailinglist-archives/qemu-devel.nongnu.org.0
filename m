Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D013D5EC5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:55:09 +0200 (CEST)
Received: from localhost ([::1]:38204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82we-0006bi-C6
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m82um-0003t4-46
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:53:13 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m82uh-00030k-Ku
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:53:10 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so20413389pjb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qFg8GB5l+tf/mVM73GyHHtwPNjzeLskhxwZD1ZuA7LE=;
 b=OEu96tjkzDUv0MqV9rJB5cGFpTSXO/Jl4vEgyyz/pxMqNiulnhF20DrWFHzvscUjHR
 Gc+J/K0uB3YxlafbGN4tdKaoKYdkSD0ePBbdfqMNgtfTAvpfiPebIGgFoVXyQ8W33TNk
 RnlZ2HWdn2rPRRgSsj3V9MqGCIhBPg+IahptfnYBHnXbEsbXomDrULrY3gHFsvDekjMq
 6cpTE0UQRtAJHmyCcK/tz1Xk6daU+YolcqQpDljs7Bt3iWt+Dq8wfMheJcdj+gwDpFmO
 wDjqWAVdBgKxCk462gJObDkLt8FwTCrHyFIIoYz9dnPGhOgoCOrn1KP4BKQDkZosrb7M
 QjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qFg8GB5l+tf/mVM73GyHHtwPNjzeLskhxwZD1ZuA7LE=;
 b=pgXxUjbs+zJ2xQCN7GLEtmqLvKulu4CUmgnWLbF5Zzp88STpSi5/xfIUe4Vn/T55jz
 7ymSje5nFXS/rgpjEoS3CVqa3uzxn0p0bu5X/cT1o1OFpKI7/HD0mgh6b9ALKUN8yFe1
 X9r+QUx59IlPwbM8kMEXTtRhYgKXyFvOJgkfKfT4hwPP+LVIrL7Pq/IIy07wUqVR26Te
 rPlRNqYXbe2RPxhADU4Pcu0oWtxsWv/zMNm7b9sSp328tfeZereeZbzkLOfToxD8NwW4
 AZcv4DuiqN9ho/c+oFWB5RcKOjyqWh/29mG57nwuf5BU4Aws10hTJ7SO1I/72OgLpIj+
 rf1g==
X-Gm-Message-State: AOAM532MsClU0m4c7aJxkSgxcqc2XU0Y7l3YDbcVly0Bmpitp8H50Qyg
 RZtarM1bP38jtv/Ct9F0G9/4bQ==
X-Google-Smtp-Source: ABdhPJyCLCCk8l3cVy4IHYamPMRyrEJ1oMP6TWrXIKKQLbrtnNuxJ4P13BNkb43T/stwEW8MvkYJbw==
X-Received: by 2002:a65:420d:: with SMTP id c13mr2563667pgq.123.1627314786088; 
 Mon, 26 Jul 2021 08:53:06 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id f4sm84239pgi.68.2021.07.26.08.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 08:53:05 -0700 (PDT)
Subject: Re: [PATCH v2 07/22] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
 <ad086e2a-3bfc-aa4b-d873-68d159ea2cbe@linaro.org>
 <95b0ee7b-ca4d-2ee1-85cf-2c49160d3a5d@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dce97537-8e36-4bab-7c89-4c2f7aa6f814@linaro.org>
Date: Mon, 26 Jul 2021 05:53:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <95b0ee7b-ca4d-2ee1-85cf-2c49160d3a5d@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 1:56 AM, Song Gao wrote:
> Hi, Richard.
> 
> On 07/23/2021 08:46 AM, Richard Henderson wrote:
>> On 7/20/21 11:53 PM, Song Gao wrote:
>>> +/* Fixed point arithmetic operation instruction translation */
>>> +static bool trans_add_w(DisasContext *ctx, arg_add_w *a)
>>> +{
>>> +    TCGv Rd = cpu_gpr[a->rd];
>>> +    TCGv Rj = cpu_gpr[a->rj];
>>> +    TCGv Rk = cpu_gpr[a->rk];
>>> +
>>> +    if (a->rd == 0) {
>>> +        /* Nop */
>>> +        return true;
>>> +    }
>>> +
>>> +    if (a->rj != 0 && a->rk != 0) {
>>> +        tcg_gen_add_tl(Rd, Rj, Rk);
>>> +        tcg_gen_ext32s_tl(Rd, Rd);
>>> +    } else if (a->rj == 0 && a->rk != 0) {
>>> +        tcg_gen_mov_tl(Rd, Rk);
>>> +    } else if (a->rj != 0 && a->rk == 0) {
>>> +        tcg_gen_mov_tl(Rd, Rj);
>>> +    } else {
>>> +        tcg_gen_movi_tl(Rd, 0);
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>
>> Do not do all of this "if reg(n) zero" testing.
>>
>> Use a common function to perform the gpr lookup, and a small callback function for the operation.  Often, the callback function already exists within include/tcg/tcg-op.h.
>>
>> Please see my riscv cleanup patch set I referenced vs patch 6.
> 
> I am not sure  that 'riscv cleanup' patchs at:
>    
>     https://patchew.org/QEMU/20210709042608.883256-1-richard.henderson@linaro.org
> 
> It seems that  gpr_dst/gpr_src are common function to perform the gpr lookup. is that right?

More than that.  The gen_arith() function, for example, performs all of the bookkeeping 
for a binary operation.

For example,

static bool gen_arith(DisasContext *ctx, arg_fmt_rdrjrk *a,
                       void (*func)(TCGv, TCGv, TCGv))
{
    TCGv dest = gpr_dst(ctx, a->rd);
    TCGv src1 = gpr_src(ctx, a->rj);
    TCGv src2 = gpr_src(ctx, a->rk);

     func(dest, src1, src2);
     return true;
}

#define TRANS(NAME, FUNC, ...) \
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { return FUNC(ctx, a, __VA_ARGS__); }

static void gen_add_w(TCGv dest, TCGv src1, TCGv src2)
{
     tcg_gen_add_tl(dest, src1, src2);
     tcg_gen_ext32s_tl(dest, dest);
}

TRANS(add_w, gen_arith, gen_add_w)
TRANS(add_d, gen_arith, tcg_gen_add_tl)


r~

