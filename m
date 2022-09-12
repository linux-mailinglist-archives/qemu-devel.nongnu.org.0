Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F85B59D8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:02:15 +0200 (CEST)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXi8h-0006Kx-Mj
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhov-0007yG-Ld
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:41:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhos-0003jg-QG
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:41:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id h8so7913512wrf.3
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=wP14lCuaDYngwX2gNcOnhX6oyqbi8WGBDV4YYOE8daA=;
 b=NBUz9jDW0EXTDSQWB6W5qOtRB+tbLCn03o7vY05ZK0XnFb2FEtp4AWfH2Imgl8djt5
 j1qncTcxLEqNzPEgygtvzxOjbdEY8DwK31gxGk2ALqboaKc//B/h1xqZk1IllvStAtT3
 wi/msUzkbmlufbM2u7tSl29JW4pFpS5jrB7hmrMUQAXRVTapWy8lGILS4t1MHE9PNG9M
 QBwvzAysdr9V2DMoLWSYJJZiOdFKX0+nvHwPxKdsBeyOcsGv2PllJt8zF643Rn4PrMsm
 5My+TAMNNiM9eoB+xsdTkmNhlyTdWrbh1AhfuDa5FejI3g2laQ5foJNugMr+sKfCb+MB
 ybag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wP14lCuaDYngwX2gNcOnhX6oyqbi8WGBDV4YYOE8daA=;
 b=0s8yG+haIbP22ntPeUDLWB3qJ3JlF9Wf/m4Sg0ERJ7LByPoUvwJJ/CCUK51UNrRpxh
 Hg8Jaqc9jQ11p6nkGBFqyP0LqG6a4obJwtXymeaG0V6UBndxjORRSMVyDt9M+QctfN+E
 ikIcwXx3O2xVGwkGdVaurVNrXQ35HZ/elRSK0FZeOShHF7HsBdV6mWsB0nw5o3s713ov
 uhMIj4qQS0GurxsJdIcSf2jZw3WhgdFtnFzoiONNSXW8NvEnQ9fo1+1Q4xwum+UJgnhT
 eKkHM1aiy5wTNDn1W65hCvA0r4stR7w7r6TMjn+nUWBDLFlX0wKvnF32Z/tujA+momwJ
 zQQg==
X-Gm-Message-State: ACgBeo3LTRmVE0r3TM8633aCOp0vD6oDXQENEP69qnFqjWTn8wqJasC8
 FZyhIzHbkbmoCbix+GNWsSXQpw==
X-Google-Smtp-Source: AA6agR5zkZ7eD9V/Msmp51PPzdIlpxVg4/ep1h690EISyQku3eUnBw0rI/Quj2D8rsQFJ4JHGFnKlQ==
X-Received: by 2002:a5d:584b:0:b0:220:7624:5aae with SMTP id
 i11-20020a5d584b000000b0022076245aaemr14578085wrf.119.1662982901307; 
 Mon, 12 Sep 2022 04:41:41 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 fc17-20020a05600c525100b003b46a882171sm8532800wmb.33.2022.09.12.04.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:41:40 -0700 (PDT)
Message-ID: <e71dad48-2e9f-c679-fb3f-8229a8972680@linaro.org>
Date: Mon, 12 Sep 2022 12:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 20/37] target/i386: reimplement 0x0f 0x60-0x6f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-21-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-21-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> +/*
> + * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
> + * 66 = vp* Vx, Hx, Wx
> + *
> + * These are really the same encoding, because 1) V is the same as P when VEX.V
> + * is not present 2) P and Q are the same as H and W apart from MM/XMM
> + */
> +static inline void gen_binary_int_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
> +                                      SSEFunc_0_eppp mmx, SSEFunc_0_eppp xmm, SSEFunc_0_eppp ymm)

No need to inline.

> +{
> +    assert (!!mmx == !!(decode->e.special == X86_SPECIAL_MMX));
> +
> +    if (mmx && (s->prefix & PREFIX_VEX) && !(s->prefix & PREFIX_DATA)) {
> +        /* VEX encoding is not applicable to MMX instructions.  */
> +        gen_illegal_opcode(s);
> +        return;
> +    }
> +    if (!(s->prefix & PREFIX_DATA)) {
> +        mmx(cpu_env, s->ptr0, s->ptr1, s->ptr2);
> +    } else if (!s->vex_l) {
> +        xmm(cpu_env, s->ptr0, s->ptr1, s->ptr2);
> +    } else {
> +        ymm(cpu_env, s->ptr0, s->ptr1, s->ptr2);
> +    }

And a reminder from earlier patches that generating the pointers here would be better, as 
well as zeroing the high ymm bits for vex xmm insns.

> +static void gen_MOVD_to(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    MemOp ot = decode->op[2].ot;
> +    int vec_len = sse_vec_len(s, decode);
> +    int lo_ofs = decode->op[0].offset
> +        - xmm_offset(decode->op[0].ot)
> +        + xmm_offset(ot);
> +
> +    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
> +
> +    switch (ot) {
> +    case MO_32:
> +#ifdef TARGET_X86_64
> +        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
> +        tcg_gen_st_i32(s->tmp3_i32, cpu_env, lo_ofs);
> +        break;

Use tcg_gen_st32_tl and omit the trunc.
Alternately, zero extend in T1 and fall through...

> +    case MO_64:
> +#endif
> +        tcg_gen_st_tl(s->T1, cpu_env, lo_ofs);

This could also be

     tcg_gen_gvec_dup_i64(MO_64, offset, 8, sse_vec_max_len, s->T1);

to do the store and clear in one call.



r~

