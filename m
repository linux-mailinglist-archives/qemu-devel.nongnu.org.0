Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305C5EB45E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 00:13:20 +0200 (CEST)
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocwLn-0001es-0j
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 18:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwG8-0002c8-1y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:28 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwG6-0001Em-AJ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:27 -0400
Received: by mail-ej1-x635.google.com with SMTP id bj12so16948133ejb.13
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=V2NaqWqTWERW8QWjllM1Xv601/uEFNufNhrG5S8QsY4=;
 b=ERfRbQ08SCyY3scdS+S2b8IGIPBuiAm5XNJr5TtHJu9ryzZpnskpM9if/HP5rhcuBC
 Wapd3zQn30NDjcSFX8kG91ovvBhvCeVTN2IhTeRsVS0youWSubr701TcpV1CbqPbQ5qZ
 3tKuoJ4FMgD9/FpCLdwMI7FzQvlY45AHmqNsghBymmETKyUil6+jA05AV5tlf+bf/KuO
 Z6Me6F6FM4AJ1j0vtoRTP93cmTBusoHY8h9wA+NhVWZXmbCr1X3Y0qVWzPtPf9RqOXvl
 dhLtlvSFCoSJT50CfR/BQsME+YvxYj91w4HyQizlXxaumbyb+2wcOtt7F3lLVVfh2PEm
 csFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=V2NaqWqTWERW8QWjllM1Xv601/uEFNufNhrG5S8QsY4=;
 b=tIKHXi4m1CSe0rVgAw6Ijm6hkraDFAcAYg3RuadebMcN/mx7YHHAW0OPZGB5cTHWQw
 lpsZqPeclzK8mj6A0QzbnY25tQF3SRF8ESD6czFiZ6F4hczBaYGN+O2PHVKCUOG5d3MR
 xmLQfV+7geQGYe+g0+kz2BPKqhQMj4Zt9do9atk8bJJ6gzUOy20PaG9EVjo452w+BKDq
 XUZLmXW28+8TpbHprhrEo0Mt2FZnoP5kYDZhm2/u75v0H/ZqEpVll3oLVmkLY9EAL7PY
 Z18aGI7UH7Z4eyVWBCMiU2L7H55P1yRAegY+ET1Y4uBNsNgyE/NYDuVO0mf9hV6XbXn8
 vuug==
X-Gm-Message-State: ACrzQf36Z/tOGpTNLJOzGMUO/zPiocpztocqw9GQM/3CWhBcr98jCEij
 9DWUeBGltJSgHFArUpgopCgRrQ==
X-Google-Smtp-Source: AMsMyM4sNe1euQoPXLK63y7hNLHEYMoaS++A+DAfFoXtTlyvtne3pln3NM49BHSukXLsaXpSpODJNA==
X-Received: by 2002:a17:907:a46:b0:782:1c1c:8141 with SMTP id
 be6-20020a1709070a4600b007821c1c8141mr20259906ejc.549.1664230044716; 
 Mon, 26 Sep 2022 15:07:24 -0700 (PDT)
Received: from [192.168.190.227] ([31.209.146.210])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a17090633d500b0073c0b87ba34sm8750943eja.198.2022.09.26.15.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 15:07:24 -0700 (PDT)
Message-ID: <75bb40e3-cebf-690d-cc91-64b637056bfb@linaro.org>
Date: Mon, 26 Sep 2022 07:46:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 22/37] target/i386: reimplement 0x0f 0x78-0x7f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-23-pbonzini@redhat.com>
 <dae44515-adf2-78fb-fd91-dd310849b6a7@linaro.org>
 <CABgObfYEtHGkJN9q=xg1oMUcBWOqoy0wQCfuV5ye_m2hhf8YOA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfYEtHGkJN9q=xg1oMUcBWOqoy0wQCfuV5ye_m2hhf8YOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/26/22 07:24, Paolo Bonzini wrote:
> On Sat, Sep 24, 2022 at 10:43 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>> +static void decode_0F79(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
>>> +{
>>> +    if (s->prefix & PREFIX_REPNZ) {
>>> +        entry->gen = gen_INSERTQ_r;
>>> +    } else if (s->prefix & PREFIX_DATA) {
>>> +        entry->gen = gen_EXTRQ_r;
>>> +    } else {
>>> +        entry->gen = NULL;
>>> +    };
>>> +}
>> ...
>>> +    [0x79] = X86_OP_GROUP2(0F79,       V,x, U,x,       cpuid(SSE4A)),
>>
>> These are not -- they're AMD New Media.
> 
> What's the CPUID bit for these? Neither
> https://github.com/intelxed/xed/blob/main/datafiles/amd/xed-amd-sse4a.txt
> nor the AMD programmer's manual makes any distinction between
> EXTRQ/INSERTQ with register operand and the same instruction with
> immediate operands.

Ah, a bit of confusion on my part, mixing up SSE4[12A] and the Intel SSE41 instructions of 
a similar names but not identical function or encoding.  You patch is correct.


r~

