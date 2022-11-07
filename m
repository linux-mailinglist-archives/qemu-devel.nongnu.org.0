Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ECC6203D2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:34:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBYy-0002Nm-7f; Mon, 07 Nov 2022 18:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBYn-0002K1-0H
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:29:45 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBYl-0003Um-DB
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:29:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id 5so7800398wmo.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1nmuA0FzL6S1MHgrNGUzoScVkaX6irOoUrUCRNJ/M+w=;
 b=cPBTN9Ebj6am+UpChqElh7KpssAKB51OUMHABpju6CpaCGc6m5F0yaSRnkHfKeVTbS
 mayLt+1+iK/fIHy2aDKJFgYYxy3Mf2xM5vqCUzg92OX4SwHm9klkFE/elUUkR83Tz8Bs
 X9G/hAWiXFPR4t0w1btPrpn2u51MVQDaU/q5qSsFFKULkccsa5M/NRQnh3G7owl6cefm
 1yVieUHzMfMNzN6hMpeMYznnr/XJmIPhih9zgYw39QMVE0q0Cn82gXNeNzNFBOlChCMG
 8jrdBvEggK8MPJy5aFuLSBT5/APjLRK5ZSrynCshs0BLSuOHbBDPWg9VZl3bkc65vWxn
 2hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1nmuA0FzL6S1MHgrNGUzoScVkaX6irOoUrUCRNJ/M+w=;
 b=MQ4W3le+wE1i7TnuUn1VFMcq+5lC+Sdea69vHAkk+G/ftAEPD2pIc68xWUh/Mc0rJm
 j0tmGkWZdrHaODFCEfeXNzDbK5JJO08P3R7RNMG4z7vzGXZff8fkTyAuZxZCyNHle0oF
 OMzpACLQRY08ed/1Ag6K3mret04G5dez3XKR7qyW0WPrX7EIpoTnUIGWXjsMnwwxwSJd
 dBcz+0827ul1NxJ5Cw+5iH16iGZfsI2UbfDrZW8yRjeTC8j/8wBA80pswvz/T+V1WIAn
 6YMiKyFsLoOqUfklV5gW0nXXtNxEMySIHHx9xSYs3QTvYR/8fPtaZIXmxU+gHAkQVT3v
 vajA==
X-Gm-Message-State: ACrzQf0iurl1vpfhz244vTN5DR/qNHgDnWEubvz+pEoBPUfH55WSy2nL
 nfVWle3Kza8ObEfOMNqtaA7zsQ==
X-Google-Smtp-Source: AMsMyM4olQF/X0pxi+zwl2d/O2HeOa4tyeJZW9FhueqaK4Q4OdDOrbWccBAEllqkU9HEWKXqWa5D6Q==
X-Received: by 2002:a05:600c:3d13:b0:3cf:4d63:243d with SMTP id
 bh19-20020a05600c3d1300b003cf4d63243dmr35147478wmb.24.1667863781480; 
 Mon, 07 Nov 2022 15:29:41 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a1c7905000000b003cf6e1df4a8sm9123664wme.15.2022.11.07.15.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 15:29:41 -0800 (PST)
Message-ID: <c8ca4542-31ce-d5f0-84d0-127ae3f4e050@linaro.org>
Date: Tue, 8 Nov 2022 00:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] target/mips: Don't check COP1X for 64 bit FP mode
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
 <43f4db9f-786e-c45f-f2a0-fa46fd8fa24c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <43f4db9f-786e-c45f-f2a0-fa46fd8fa24c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/11/22 23:47, Philippe Mathieu-Daudé wrote:
> On 2/11/22 17:57, Jiaxun Yang wrote:
>> Some implementations (i.e. Loongson-2F) may decide to implement a 64 bit
>> FPU without implmenting COP1X instructions.
>>
>> As the eligibility of 64 bit FP instructions is already determined by
>> CP0St_FR, there is no need to check for COP1X again.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   target/mips/tcg/translate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
>> index 2f2d707a12..e49d2a25a8 100644
>> --- a/target/mips/tcg/translate.c
>> +++ b/target/mips/tcg/translate.c
>> @@ -1545,7 +1545,7 @@ void check_cop1x(DisasContext *ctx)
>>    */
>>   void check_cp1_64bitmode(DisasContext *ctx)
>>   {
>> -    if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X))) {
>> +    if (unlikely(~ctx->hflags & MIPS_HFLAG_F64) {
>>           gen_reserved_instruction(ctx);
>>       }
>>   }

Did you test your patch? I'm getting:

../../target/mips/tcg/translate.c:1548:49: error: expected ')'
     if (unlikely(~ctx->hflags & MIPS_HFLAG_F64) {
                                                 ^
../../target/mips/tcg/translate.c:1548:8: note: to match this '('
     if (unlikely(~ctx->hflags & MIPS_HFLAG_F64) {
        ^
../../target/mips/tcg/translate.c:1551:1: error: expected statement
}
^


