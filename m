Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810F343E272
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 15:43:10 +0200 (CEST)
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg5gT-0001El-1W
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 09:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mg5eU-0000A5-98
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 09:41:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mg5eO-0008TS-Hh
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 09:41:06 -0400
Received: by mail-wm1-x331.google.com with SMTP id 192so4295166wme.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWDv8ZoJGz7hJepmeXOrt6g6P7aWMovV/FVV15GsKMA=;
 b=OObpxl3s6ouXauDkH1f2FfvypqNcxZSMNj5RcKUgJSibr1BCeJFFDJ1U1iA/YSNuzD
 f8LvvLq4RFroy0wZ/IgNSTMxPm2QSdRiK5+wiAV8Taj3HSNnTrxvPyBLj3BvDxp1rT/K
 bhnLyKtQBpkSace+IoRWph2/RSQIsUYTz5ADcEcuPbjkAs7dpmNWuqljid1/Vbda8eTY
 zsbq5QfImd4xExZeQNBPVF0J5WmREbJiXoiG4Juc/xYq1igToGfjSZEFxpd3R/6MUmMR
 ntxa+6jEkeIaDHH0kPxCNGnVrqo35GF9R6s1WoOQkMQlRrBGEDsFYQWUjufyhORnNzsH
 EA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWDv8ZoJGz7hJepmeXOrt6g6P7aWMovV/FVV15GsKMA=;
 b=0dewtw1jGRAXqIlvn9cbGoyux8PnkcmZXdKF+hX7N9I2UsAW6pH6iYuCxcrSNfHZ/V
 ZfWMf0jGlWOBzRD5M2TNtUjV2usOqS8EBOXbkU8PACOpSQ/FEIUdJtVK1PamyxXXx7l7
 Rezm99tKROdIB5rOEVfRy/YpCIayHEDCA84A8lgOf+msmQF0RvNlo/lL9c0ydf98seyJ
 DoUTtK/zNC3DgNr389Hfd5VZgX5i2GW6NRk58dA4yyYzQbPzwo6g5jlSB2pfznu3r8Oz
 MTDG7DX2Z1uzxibJ4GZWzzP1YBjjOmpeS/O/W7d8tEe4GQmNbehMY09CxjFliu4fFRaQ
 C7Vg==
X-Gm-Message-State: AOAM530LYedoo0bXD/kmX+0s2+V2tZigvRihXt1I2dthvUZI+B7um2IQ
 52MuKuY3wy2YXxHVhvP8VPs=
X-Google-Smtp-Source: ABdhPJw1TDWXj+atkPshzj+YaH8eHu0APMI0lN55EAzLnbRwDvYivJqpEBPpBPfOWUvm1ZyQpZ8yHQ==
X-Received: by 2002:a05:600c:4ca9:: with SMTP id
 g41mr4547246wmp.139.1635428458720; 
 Thu, 28 Oct 2021 06:40:58 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m12sm2999583wrq.69.2021.10.28.06.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 06:40:58 -0700 (PDT)
Message-ID: <1e76dbaf-fd04-b82b-8d83-331a0272f319@amsat.org>
Date: Thu, 28 Oct 2021 15:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 21/32] target/mips: Convert MSA 3R instruction format
 to decodetree (part 2/4)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-22-f4bug@amsat.org>
 <5125d756-1496-bd9a-cce6-83c2d63c6ce6@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5125d756-1496-bd9a-cce6-83c2d63c6ce6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 00:02, Richard Henderson wrote:
> On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
>> Convert 3-register operations to decodetree.
>>
>> Per the Encoding of Operation Field for 3R Instruction Format'
>> (Table 3.25), these instructions are not defined for the BYTE
>> format. Therefore the TRANS_DF_iii_b() macro returns 'false'
>> in that case, because no such instruction is decoded.
>>
>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v2: TRANS_DF_iii_b() uses array[4]
>> ---
>>   target/mips/tcg/msa.decode      |  11 ++
>>   target/mips/tcg/msa_translate.c | 195 ++++++--------------------------
>>   2 files changed, 48 insertions(+), 158 deletions(-)

>>   +#define TRANS_DF_iii_b(NAME, trans_func, gen_func) \
>> +    static gen_helper_piii * const NAME##_tab[4] = { \
>> +        gen_func##_h, gen_func##_w, gen_func##_d \
>> +    }; \
>> +    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
>> +    { \
>> +        if (a->df == DF_BYTE) { \
>> +            return false; \
>> +        } \
>> +        if (!check_msa_enabled(ctx)) { \
>> +            return true; \
>> +        } \
>> +        return trans_func(ctx, a, NAME##_tab[a->df - DF_HALF]); \
> 
> Either reduce the size of the array by one, or place the NULL in its
> proper place at the beginning rather than the end of the array.  I think
> the latter is in the end clearer.

Yes.

> You could just as well place the checks within trans_msa_3r:
> 
>     if (gen_msa_3r == NULL) {
>         return false;
>     }
>     if (!check_msa_enabled(ctx)) {
>         return true;
>     }

Indeed, thank you.

