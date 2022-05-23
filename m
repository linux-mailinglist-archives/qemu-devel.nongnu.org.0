Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817E5311AD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:46:18 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAG9-0005Ed-9e
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntAAa-0001Fw-KJ
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:40:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntAAN-00062q-7K
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:40:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id z11so4595746pjc.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r1Q3HWCqqQIAI9RGYdJyOJWKKL2UV9ejD/VdtBP4W1w=;
 b=GmXmUmeNlVEXkQLZgXcaO+uVlxq9QE+cOKdvEKxvWvSxDIwv7mnEbnHXmuJEGnrR2Z
 EIlF9C1vEjA54l0uStjr7c4W6lI6z4+R6yvgrq/0d6ES8zZHHyQuGqJhqC/NEFNq0gWN
 uIf9djQExEjZOP18E1CzTVhfdAkocVp49PnwlzJxoTHpz+E+6uYQOAjKMbigoaY+UF7K
 DgX8DbfPWgUvCioTEe+krkYW81UTqxK9Mu7VceS5FSLURiQHGsZKvP7JrVlCUTVEjaiB
 6WARvh9bH2mfbP14kBKhUAY+jpt4V+BgpjKtR1JSS+QiYJJ/ES4tQfRzDkR4itg3ce3W
 mF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r1Q3HWCqqQIAI9RGYdJyOJWKKL2UV9ejD/VdtBP4W1w=;
 b=Ey35Ej/L+UC3deqCLG7lYp31P5yvYMgJjlznIeh5uXZO7D1DHdfWHm71NoUtl0QzGm
 J8d//upSfsgk/oLsPwVAqPkyl0rax7TxWSnx+IsAY/AdptX+ewFTtYHnv1XLQeSiRJxs
 xrs1QUb6gzbS88P/iQNgdXGTjgDZ+eZxtyuPwfkJzJlQ1PEZBXdjP+hUqI5qRVQXgf3S
 Gv2O1s4g+qdyGXOJYJHHPe0gudZE4PJ9hQgtdqNaF4+Hb+5KQSocogiHPt4//DjJVxNL
 YHJ2u9PYkkEVpx+Ad0grnVJGDlv66N3QpeZ0t6in95HOAr5TRJyd2Sg7BlDkHb6d2prB
 gnow==
X-Gm-Message-State: AOAM533OmgMY/IVguA4IO/6tTjY/IBSBgOUWFLw/n44+KayLabolfBN2
 eIqhYsQfGV7ToKWmD2fJtspEIw==
X-Google-Smtp-Source: ABdhPJyirh1xqiKD4Bx9S3cunrIkm4TCtpL+lcriL/w5YOc++mHEUd72etNTkIRtehltRaY2oTq0KQ==
X-Received: by 2002:a17:903:11c4:b0:15f:14df:a919 with SMTP id
 q4-20020a17090311c400b0015f14dfa919mr23446235plh.21.1653320414257; 
 Mon, 23 May 2022 08:40:14 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a170903125100b0015e8d4eb1c8sm5364998plh.18.2022.05.23.08.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 08:40:13 -0700 (PDT)
Message-ID: <88fd254f-2009-92fe-fc29-df7ba54ae4db@linaro.org>
Date: Mon, 23 May 2022 08:40:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 20/49] semihosting: Split out common_semi_has_synccache
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-21-richard.henderson@linaro.org>
 <CAFEAcA_kPbHMrO17LjkQAvtBcyQ0oC7XwuhxDOuqQuAPmUJuzA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_kPbHMrO17LjkQAvtBcyQ0oC7XwuhxDOuqQuAPmUJuzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/22 05:51, Peter Maydell wrote:
> On Sat, 21 May 2022 at 01:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We already have some larger ifdef blocks for ARM and RISCV;
>> split out a boolean test for SYS_SYNCCACHE.
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   semihosting/arm-compat-semi.c | 20 +++++++++++++-------
>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index 9ea985beee..c53cb1891f 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -224,6 +224,12 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
>>       CPUARMState *env = &cpu->env;
>>       return is_a64(env) ? env->xregs[31] : env->regs[13];
>>   }
>> +
>> +static inline bool common_semi_has_synccache(CPUArchState *env)
>> +{
>> +    /* Invalid for A32/T32. */
>> +    return !is_a64(env);
>> +}
> 
> Condition seems to be inverted ?

Oops, yes.


r~


