Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC745B6C7E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 13:45:52 +0200 (CEST)
Received: from localhost ([::1]:42724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY4MR-0002B0-Ay
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 07:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY4Ew-0007Q5-T6
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 07:38:06 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY4Eu-0001GV-Tl
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 07:38:06 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1278a61bd57so31246207fac.7
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+uVKTPLsxOvzT8GErzEUIbpMU77IKvoVfLTg/E1wFlI=;
 b=i0M76RTcpI4nWLQ3hrDFisbXBJ7mT77ZRGRsaU+9V85bPLEpTiuWNvqYDe4jDQGRsD
 GwXeTZE5ck4Qk+6ZD08WDazwOf7th1PDxba5fB1v10BhxBfi3mrU/gbG1txFTsQ8YNnX
 5FflVnc/3jA9uc7k14RQhD9xc7720u7gNT90qe9xYbp2owcPgOrS4joA1yFCLhjCVlD0
 vz/1+NkKATK7mqJWiOc1Awy9XrQapxN4X553R79MSvTC+liZoN15NjlKwPxyDxISwZuG
 vvS4UY17WFrXT1802rG4z9M9TM6VnmdADv29nvR7zfx29twUf73iMCto9v+4BqPNnzMk
 XnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+uVKTPLsxOvzT8GErzEUIbpMU77IKvoVfLTg/E1wFlI=;
 b=IRqXDnA8FgBa3B4rryQ2M78L/ie0mcBn5BEIkBHuTjlYIGgs7NgZsUtMsqF6z1Zk0m
 QWNbMrSGHtO1P3CwUhEUpq5Sf1vG2I9KMeF9k9p7mVaxwZqQklIcicvDQUxlOH0xh5Qm
 Z9SpSeqZikbUbfCsJ4BMQIQIDvL4RL3FvbakDTHGSJUzVyk4TuOMXjKQ3dv1qXgtisng
 V88RSrLfhPV/hfSqtcmxWGCCcF3QftGZ7izG+P2q2bsWvUOh8GW4UJ4z+/L1LydPdlDB
 r54POF29a1ukMpuM5Hxz85BcR9pJEmPOCaP1mUm9tknYzLlySL2sckZkZhdsW3rrAbpV
 xB5A==
X-Gm-Message-State: ACgBeo3W6IrmcxWb2kHR14CH2ugUcBSzcHthUOhfOd6IYKRgSAl2YIQ7
 C8229v73ZJAU/Yua+efijv3vBQ==
X-Google-Smtp-Source: AA6agR6t8aCYq7NpYOZCGd0AUuSmIaLJb+5XNikSLcCnuq5wyCj0Jua7zyOReUS6mW13Ng66ZIXhPQ==
X-Received: by 2002:a05:6870:d2a0:b0:11d:37d7:9c76 with SMTP id
 d32-20020a056870d2a000b0011d37d79c76mr1492248oae.57.1663069083436; 
 Tue, 13 Sep 2022 04:38:03 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.188])
 by smtp.gmail.com with ESMTPSA id
 x28-20020a056870a79c00b00127616039e7sm6973020oao.29.2022.09.13.04.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 04:38:02 -0700 (PDT)
Message-ID: <461f5fc7-c090-8156-5309-bf15ad6dd476@linaro.org>
Date: Tue, 13 Sep 2022 12:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 20/37] target/i386: reimplement 0x0f 0x60-0x6f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-21-pbonzini@redhat.com>
 <e71dad48-2e9f-c679-fb3f-8229a8972680@linaro.org>
 <CABgObfbXST=bQ-FwVZvThn7nFkGXPfFNZDydKLnPkCBNid5Emw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfbXST=bQ-FwVZvThn7nFkGXPfFNZDydKLnPkCBNid5Emw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.628,
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

On 9/13/22 11:56, Paolo Bonzini wrote:
> On Mon, Sep 12, 2022 at 1:41 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/12/22 00:04, Paolo Bonzini wrote:
>>> +/*
>>> + * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
>>> + * 66 = vp* Vx, Hx, Wx
>>> + *
>>> + * These are really the same encoding, because 1) V is the same as P when VEX.V
>>> + * is not present 2) P and Q are the same as H and W apart from MM/XMM
>>> + */
>>> +static inline void gen_binary_int_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
>>> +                                      SSEFunc_0_eppp mmx, SSEFunc_0_eppp xmm, SSEFunc_0_eppp ymm)
>>
>> No need to inline.
> 
> Yes and no, the compiler should indeed be able to figure it out, but
> both the assert() and the calls are meant to be optimized out by
> inlining. So this kind of function would be even an always_inline
> candidate.

Yes, I get that, I just prefer by default to allow the compiler to figure it out. 
Obviously there are parts of the code base where we use always_inline and more, but this 
part is never going to be performance critical.

Over-use of inline generally leads to Werror from clang, for the unused function case.

> I'm not sure about that, because there are quite a few cases handled
> by more complex gen_* functions, which are helper-based (so not simple
> calls to gvec functions where you have maxsz/oprsz) and are not
> handled by the common gen_*_sse. For example gen_CVTPI2Px,
> gen_MASKMOV, gen_PSRLDQ_i, gen_SSE4a_I, gen_VCVTSI2Sx, ...  All of
> these would have to add extra code to set the pointers and to clear
> the high ymm bits.

Fair.

> For gen_load, however, i can delay the generation using something like
> 
> static inline TCGv_ptr get_ptr0(DisasContext *s)
> {
>      if (s->ptr0) {
>          return s->ptr0;
>      }
>      s->ptr0 = tcg_temp_new_ptr();
>      tcg_gen_add(s->ptr0, cpu_env, ...);
>      return s->ptr0;
> }

Sure.

> For gen_writeback, keeping gen_writeback eliminates duplicated code
> and keeps the phases of disas_insn_new separated, so I prefer it
> slightly. For now I'd rather leave it as is; with the above get_ptr0()
> function that creates s->ptr0 lazily, perhaps gen_writeback() could do
> it only if s->ptr0 is set (suggesting that a helper was used), while
> gvec helpers would use the oprsz<maxsz feature. There's something to
> be said for keeping the initial implementation simple of course,
> especially since it's already slightly better than the code produced
> by the existing decoder.

Also fair.  Let's ignore the max argument for now, and address it in a subsequent phase, 
where we also convert more operations to gvec.

>> This could also be
>>
>>       tcg_gen_gvec_dup_i64(MO_64, offset, 8, sse_vec_max_len, s->T1);
> 
> Yeah, it can be something like
> 
>      case MO_32:
>          tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
>          tcg_gen_gvec_dup_i32(MO_32, decode->op[0].offset, 4, vec_len,
> s->tmp3_i32);
>          break;


Actually, this doesn't work, because minimum vector size is 8.
This will hit the assert in check_size_align().

I've just realized that we can't just extend i32 to i64, as I was suggesting, because that 
will fall foul of big-endian host (L(0) is at the top half of Q(0)).  So best to keep your 
zero + store.


r~

