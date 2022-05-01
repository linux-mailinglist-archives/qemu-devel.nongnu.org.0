Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF851611A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 02:14:14 +0200 (CEST)
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkxE4-0000If-I1
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 20:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkxAX-0007YG-MM
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 20:10:33 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkxAU-0008BM-Ne
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 20:10:31 -0400
Received: by mail-pl1-x629.google.com with SMTP id n8so10006505plh.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 17:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UftRT56jgY+IMH+cE4HSGOtY4vSPK7FNsVF72hSXwkI=;
 b=VIwlB/fh3V8cYzA0Z7PurEQ5Lc0dj3p+34OR7hNKh1IwnWQJwTa3HDUeeh1opSaulk
 hx6Z+LSYPoHgUzR6fRVL6DMSMhGB05MnCBUQnNGiIElPIcIsvY/CNL98YNUxo066jndq
 avMRa4tFXfea87xJVM4X7q4gIY/34eBqwyej5lYGv9sIZZebwU1/egCJ381nC6bpv753
 X/bBhXAXnd3kixzTMZkpOm2IzqAB3yAK1gzXnexrrQbZW5YCIeUCawyy57c7WUrgchqL
 Blu+SG9hgTVZvXIX4oHmNvpbPiemDrc/xJQBmxFue74j58noPmHZV84IhRDVYqD6iwQb
 FDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UftRT56jgY+IMH+cE4HSGOtY4vSPK7FNsVF72hSXwkI=;
 b=hmy+0CX3uc2NM+FpFNRnjCoWb1fwq9IIkh8w1oV5jVgEzL+sDiWoaHt33ahHyWeqgF
 yYR3yVBgCUEofciQbZfTDyAqALZC6QKrSPlBnnruvru8+7zk9SXswXzI2OCpygw40tmj
 /pKAhbzuY8moXqPhSpUjHuYxfI0N7JpToujljsjVR6W8GrCyI5kcuchLiFUv5PXolW30
 xmOSCa/YGiXJxmGQLtOeeM7djWGf/Q//A/MxiD2T2l1RlguZRwXlBm1d4tBvyCaas90s
 T8UsuHVcjQR2lhjL7L+bdnGJpsZtJFypct1aJXJ5ieXu/HS4Fe5agenIuZXpRKBOvqQO
 csXQ==
X-Gm-Message-State: AOAM530WW/BiEBuj9RXl5r9xsUrZWPDuvSxKKl3cEcqN1l+5f0ocnk/h
 ttg8jvC0Pda8zh9DDTXILrKkQQ==
X-Google-Smtp-Source: ABdhPJzjA0mfyxwku2IROuEagugQDBSD/UkOISbS1iw/jv3pJ+6XYPJ+/8NcQqMlSpq/gKrSh1yUyg==
X-Received: by 2002:a17:902:f64c:b0:156:4349:7e9b with SMTP id
 m12-20020a170902f64c00b0015643497e9bmr5484500plg.139.1651363829053; 
 Sat, 30 Apr 2022 17:10:29 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a62fb15000000b0050dc7628155sm2054282pfm.47.2022.04.30.17.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 17:10:28 -0700 (PDT)
Message-ID: <42effcff-0ef2-3e4a-be27-bcf359f1c2a1@linaro.org>
Date: Sat, 30 Apr 2022 17:10:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 26/60] target/arm: Replace sentinels with ARRAY_SIZE in
 cpregs.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-27-richard.henderson@linaro.org>
 <CAFEAcA98sjUhUccvEAjAWeK+Z7-HER9LDz6LMSFMNuVnBSPW=Q@mail.gmail.com>
 <20b109b9-81fe-e8df-bada-c3a0ce920c45@linaro.org> <87k0bht9fu.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87k0bht9fu.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 08:36, Alex Bennée wrote:
>>>> +#define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)               \
>>>> +    do {                                                                \
>>>> +        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
>>>> +        if (ARRAY_SIZE(REGS) == 1) {                                    \
>>>> +            define_one_arm_cp_reg_with_opaque(CPU, REGS, OPAQUE);       \
>>>> +        } else {                                                        \
>>>> +            define_arm_cp_regs_with_opaque_len(CPU, REGS, OPAQUE,       \
>>>> +                                               ARRAY_SIZE(REGS));       \
>>>> +        }                                                               \
>>>> +    } while (0)
>>> Do we actually need to special case "array has one element" here,
>>> or is this just efficiency?
>>> Anyway
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Just efficiency.  There seem to be a lot of these.
> 
> If you moved define_arm_cp_regs_with_opaque_len into the header as an
> inline surely the compiler could figure it out when presented with a
> constant i? The would avoid the need for the special casing in the macro
> expansion right?

I didn't want to expand the code size with so many loops.
Anyway, I'm dropping the special case entirely for v4.


r~

