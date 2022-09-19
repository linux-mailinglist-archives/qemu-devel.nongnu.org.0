Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6000B5BC46E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 10:38:47 +0200 (CEST)
Received: from localhost ([::1]:40476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaCIg-0005mL-CS
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 04:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaBu1-0002WC-Vd
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:13:18 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:41560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaBu0-0008Gh-43
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:13:17 -0400
Received: by mail-oi1-x231.google.com with SMTP id r125so13702189oia.8
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5fs6QKs+p+SneebccwPdfymr37rR2dofDDbY8qbClCs=;
 b=V8gcmRUpRDMHmiFxxpl+QSpR4aS3ena22WJ7A3jWbYBH7AZ6dDs5v5ho3xQzH2Jy/A
 jjl24yIfw8AR1FaqkoQ9dS5QN7hKtki95veA8jG7mvNA7namSCCucIIj7NtFDgn3lgvy
 69pv+4CDJNX533bFWYuJl0xunXpgJHmMpnSIUXlUptu5bcGc+h8zJNf6U7+3FVJiUtEI
 rC3SCE3B8IIm6MtCMtcqtqJEG6FoYUsarIl/ne5UATiOFvGXYtA5iLVo3hlMjZhx9FBe
 iDcSdlWEAoh0vH4ob4RyRw7LPT99PTLfQxmVG3txowb/jkSjPDgnf9Qi+6hLDMKcJAX2
 4lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5fs6QKs+p+SneebccwPdfymr37rR2dofDDbY8qbClCs=;
 b=Wtxiw8XqefUg9TeObdyAEDW3lp4/kVTa21NNVtoHpN+aPa9vvSND1BKZkRKXnjaaj6
 ZZ8Mx6NHEIJOVjp450qeKQfU7g90y7LCSgMMt9HJIbKNQBewKvu3EhTrqEPBkNmVQLaI
 Hcnrzrw78UoviCQ81PANBAVdZBtAMauPie6Ol5YmXx6yYVBzbANVFSNxB4Gp/7iMRDSb
 dvz2sFCd7L7a3Q7x2qB3Xr8I41YmbM40vhiM8HFHH4JvAg8DJdEiwugWGeJ9qXNekFm5
 MWeKgDvT7GjEe2sixXjyM1qzNnaAmQgNG7jcpbjUePEhombiPyAkydHjMaCXLidltJGV
 amwQ==
X-Gm-Message-State: ACrzQf2j6EpEJ9SCkxBSgYt6xlJvIwb1GO56pFgJa2X0MS1d4Y52rSr9
 UaFNGbRZTYWkkpY/jyNlakhvrw==
X-Google-Smtp-Source: AMsMyM4uMM32Mk94oUOyffT4oO3qZ1QsbFWag8JgMqPfbCO/ZjSJcB7GNB11fUP0T2216RHgh096+A==
X-Received: by 2002:a05:6808:199f:b0:350:4b77:ea38 with SMTP id
 bj31-20020a056808199f00b003504b77ea38mr7438017oib.269.1663575191820; 
 Mon, 19 Sep 2022 01:13:11 -0700 (PDT)
Received: from [192.168.199.227] ([172.58.107.41])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a056830124e00b00655fd5b878fsm9626042otp.74.2022.09.19.01.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 01:13:11 -0700 (PDT)
Message-ID: <d38085fa-d062-d6d7-3098-7933cd099c1d@linaro.org>
Date: Mon, 19 Sep 2022 10:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] target/m68k: always call gen_exit_tb() after writes
 to SR
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
 <a7eca9e4-e08d-a903-92ec-3ed49c233d5c@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a7eca9e4-e08d-a903-92ec-3ed49c233d5c@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/22 00:29, Philippe Mathieu-Daudé wrote:
> On 17/9/22 13:25, Mark Cave-Ayland wrote:
>> Any write to SR can change the security state so always call gen_exit_tb() when
>> this occurs. In particular MacOS makes use of andiw/oriw in a few places to
>> handle the switch between user and supervisor mode.
> 
> Shouldn't be safer to add the gen_exit_tb() call in gen_set_sr[_im]()?

No.  For halt we need to raise EXCP_HLT.

r~

> 
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   target/m68k/translate.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>> index be5561e1e9..892473d01f 100644
>> --- a/target/m68k/translate.c
>> +++ b/target/m68k/translate.c
>> @@ -2373,6 +2373,7 @@ DISAS_INSN(arith_im)
>>           tcg_gen_or_i32(dest, src1, im);
>>           if (with_SR) {
>>               gen_set_sr(s, dest, opsize == OS_BYTE);
>> +            gen_exit_tb(s);
>>           } else {
>>               DEST_EA(env, insn, opsize, dest, &addr);
>>               gen_logic_cc(s, dest, opsize);
>> @@ -2382,6 +2383,7 @@ DISAS_INSN(arith_im)
>>           tcg_gen_and_i32(dest, src1, im);
>>           if (with_SR) {
>>               gen_set_sr(s, dest, opsize == OS_BYTE);
>> +            gen_exit_tb(s);
>>           } else {
>>               DEST_EA(env, insn, opsize, dest, &addr);
>>               gen_logic_cc(s, dest, opsize);
>> @@ -2405,6 +2407,7 @@ DISAS_INSN(arith_im)
>>           tcg_gen_xor_i32(dest, src1, im);
>>           if (with_SR) {
>>               gen_set_sr(s, dest, opsize == OS_BYTE);
>> +            gen_exit_tb(s);
>>           } else {
>>               DEST_EA(env, insn, opsize, dest, &addr);
>>               gen_logic_cc(s, dest, opsize);
>> @@ -4592,6 +4595,7 @@ DISAS_INSN(strldsr)
>>       }
>>       gen_push(s, gen_get_sr(s));
>>       gen_set_sr_im(s, ext, 0);
>> +    gen_exit_tb(s);
>>   }
>>   DISAS_INSN(move_from_sr)
> 


