Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6FC512543
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 00:29:33 +0200 (CEST)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njqA7-0002kK-RL
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 18:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njq8t-0001j2-2D
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 18:28:15 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njq8q-0002s5-70
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 18:28:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 bd19-20020a17090b0b9300b001d98af6dcd1so6070885pjb.4
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 15:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fBQl33yL2VSaEDRSMSgWZ1xJLy64qqfXeBIoTYkKoek=;
 b=xKXCLigVRF/4CeUvii5No2+JrkS/iyYC3kg9bYdj2x+S6+rzsrZFH6GZxnfJKol6En
 oGPVkkuvJ1UVMuBtSV3PToBr3kjld83+ovOX/frgSW385wVlHzHfmQ5G5/EdH0DrzpmE
 b2ICDKd4n2Z6RVPrYB5RVNFMtRtUqOJumc2zE5W66w4Mb8yvYnUDLTaoeviWcb4J39WP
 p6AI5NzJQrz4jdk5XairMRzxVKPtmjuzcUzwe+WQKjrkoVsaq3jliXzkZFHBv+6ee9pH
 WIlQhjQBEDJlbaaocGXazLss7hzzcy+wBwJ4EyNaDpqXmLl1slZu2aio9pF+mqu7fxqF
 xZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fBQl33yL2VSaEDRSMSgWZ1xJLy64qqfXeBIoTYkKoek=;
 b=pH/Iaw7yP2i06WYWmUmF5gfYTh91Ov5kujqZDVjKVj/Wsq8VV9+Cdb5wOHXmaK92qj
 Tm8GhP7XUhD+ANDgHoZDJryQSiFMio9sz8l9QO/BpQwfFJsgH6Ckg8Gr4T4Bk3iZU9vr
 XwYQiNKmnHrRHvc8Hk7SdY8s2Rv/sapHPm2fzqBtHVXROvxbEUsKRataigCFZIy2GMBZ
 9URrT3Nxgoy53bxysNV0Y+vuEMtqPGgJI+W81RiOmiQiTtRg2Q4hr+ZfHtLLljqwB/8R
 /oZrdW+0h9eQ7PHD5UCbRFxNXJrwB97UR2QuA81b3QXx5LsoBTSUxvK/qLfjEaEekJpC
 I4IQ==
X-Gm-Message-State: AOAM5309HMgDBNjmYrvOorsE0H6SzeZ8lHyOL2rW/6o6PATKF+QupydD
 QKYHw4++qZ6RYfp6ERZww893Vg==
X-Google-Smtp-Source: ABdhPJwzCYUtQgslj5oAQ4XCTAtvs6MgQrYjNDMViU8dPidocXz76907+14TtHr0C6owtaBM27EuLw==
X-Received: by 2002:a17:902:8644:b0:15a:3b4a:538a with SMTP id
 y4-20020a170902864400b0015a3b4a538amr30716165plt.146.1651098490391; 
 Wed, 27 Apr 2022 15:28:10 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a637f57000000b003c14af5062fsm334037pgn.71.2022.04.27.15.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 15:28:09 -0700 (PDT)
Message-ID: <1983150b-bf4c-41ec-5332-55d8b0420503@linaro.org>
Date: Wed, 27 Apr 2022 15:28:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 2/7] target/ppc: Implemented xvi*ger* instructions
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-3-lucas.araujo@eldorado.org.br>
 <7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org>
 <d160958f-6703-8af7-aa8f-f3843d9b1066@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d160958f-6703-8af7-aa8f-f3843d9b1066@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 13:24, Lucas Mateus Martins Araujo e Castro wrote:
> 
> On 26/04/2022 20:40, Richard Henderson wrote:
>>
>> On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
>>> +%xx_at          23:3 !function=times_4
>>> +@XX3_at         ...... ... .. ..... ..... ........ ... &XX3 xt=%xx_at xb=%xx_xb
>>
>> Hmm.  Depends, I suppose on whether you want acc[0-7] or vsr[0-28]
> I mostly used VSR function here, but since I'll change the patch 1 to your suggestion 
> (which will require creating acc_full_offset) I'll make a few changes to create some 
> functions for the accumulator
>>
>>> +/*
>>> + * Packed VSX Integer GER Flags
>>> + * 00 - no accumulation no saturation
>>> + * 01 - accumulate but no saturation
>>> + * 10 - no accumulation but with saturation
>>> + * 11 - accumulate with saturation
>>> + */
>>> +static inline bool get_sat(uint32_t flags)
>>> +{
>>> +    return flags & 0x2;
>>> +}
>>> +
>>> +static inline bool get_acc(uint32_t flags)
>>> +{
>>> +    return flags & 0x1;
>>> +}
>>
>> Better to have separate helpers for these?  They'd be immediate operands to the function
>> replacing XVIGER (see below) and thus optimize well.
> Do you mean different functions or a function that receives packed_flags along with the 
> callback functions?

I mean separate helper entry points, which use a common function that receives these as 
separate boolean arguments, along with the callbacks.  Use QEMU_FLATTEN on the helper 
entry points to ensure that everything is inlined and the constant args are optimized.

> In this case it'd be necessary to receive 2 xviger_extract functions since XVI8GER4* 
> multiply one value as signed and the other as unsigned (and other integer GER treat both 
> as signed).

Certainly.

> 
> An alternative would be to isolate the innermost loop into a different function, like:
> 
>      typedef int64_t do_ger(int32_t a, int32_t b, int32_t at, int32_t pmsk);
> 
>      static int64_t ger_rank4(int32_t a, int32_t b, int32_t at, int32_t mask)
>      {
>          int64_t psum = 0, i;
>          for (i = 0; i < 4; i++, mask >>= 1) {
>              if (mask & 1) {
>                  psum += (sextract32(a, i * 8, 8)) * (extract32(b, i * 8, 8));
>             }
>          }
>          return psum;
>      }
> 
> That way we could avoid having 'rank' as a parameter, what do you think?

Reasonable.  I certainly like extracting uint32_t from the vector generically and not 
having to pass that on further.

>> Why are you passing register numbers instead of pointers, like everywhere else?
> Because here we are not working only with 1 register per register number, the ACC uses 4 
> and the XVF64GER* needs to use XA and XA+1, and while VSR is an array so I could do 
> ppc_vsr_ptr+1 I thought it was better not to access memory I was not given a pointer to, 
> so I passed XA so I can request cpu_vsr_ptr(env, xa) and cpu_vsr_ptr(env, xa + 1)

I think using cpu_vsr_ptr is the mistake.

It might be clarifying to define a ppc_acc_t, if only as a typedef of ppc_vsr_t.  The 
acc_full_offset function will compute the offset for this pointer and, importantly, will 
be the place to modify if and when the architecture changes to allow or require separate 
storage for the ACC registers.


r~

