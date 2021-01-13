Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07152F45C7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:28 +0100 (CET)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbCd-0006JY-4d
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzbAl-0005MG-F7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:06:31 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzbAi-0003Rk-9F
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:06:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id r3so1081609wrt.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sSEeIgERkxoF+y3HCc7GwFwdVjsB6PEcViFmVsNhs5M=;
 b=UiN2cSYEAuejWWyvsjxN798JJ2I6a1Oqb3xxmlgvdS+vfoY3XHRxKcK69zgCFdhDXu
 IY7ajK6XYnQHqF8wazj5nCxeFIJlCjAFJmlr9xXw/IPSK0iIL2r3Pau0DjPD1ExNBHmV
 /73tL+7VhJMdct65B/SBeLYYqIJBwY1C/cb/SrbhW0Vct8emQIXBkBtYl9upCclrT4nM
 rDQOSYJPL4BzRCljDRN7L3sa2iTLMCPSsTdXJFnoydQw33PzR63g7T/INHP7ytYkM3cg
 m2JHMLL71LvlY9MiCnoOaMDmvlETuXStUWy3qDHw3OBVHZU9dJ4jPFRnVjzLuuVlVgkq
 Dnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sSEeIgERkxoF+y3HCc7GwFwdVjsB6PEcViFmVsNhs5M=;
 b=ifKiCqTpkuRql+wwaZJ+CnktYNzE9tD7rSJ5BcY0iRWNIEdFKis42BioG7qz0Hv11F
 cls4DCLpANf2CBVtbJ+rKZqK3KvQJtunDBOz006qyA8kNuQsIfG1S8DWdt6oFfnzhmiw
 IeMbpgj0sTLnFhTSLazSwGfHQvj2od6K4GZ1z6i1Svd44DL8EN+FEAgoY6/A4Ace6p4T
 RsU1q67jQJSbkQ2vJKPyP2sIb0l7teW0H2mZEbN/epejwV2n2fDw/XAh9FvCzpEIbw1R
 8hp85MR0xOxhjZ/B0i/bPkZOWO2nutAfrKCArbScjmEM+Mv7pWE1hws+aSijxw7nFHoi
 bT6w==
X-Gm-Message-State: AOAM533+z3QCheq1s7s6O4i+XgymZ2dk2ZWuAYTji8E4Uq4AtLar5WSL
 MB7z5SCSlKWMibxKcCVV6LY=
X-Google-Smtp-Source: ABdhPJx09ThihIjFfv+VL6Q7EQOuRysVZ2Ocoh4hTBK/ENUtrTNrjo6oP9yPhJQbETl06RoyQh3Suw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr1127100wrr.319.1610525186325; 
 Wed, 13 Jan 2021 00:06:26 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id s13sm1912940wra.53.2021.01.13.00.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 00:06:25 -0800 (PST)
Subject: Re: [PATCH 0/6] target/mips: Convert Loongson LEXT opcodes to
 decodetree
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <0e1b22ca-7ca0-f92e-2d43-fc10eafd565f@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d58c8ba9-56e7-06da-c074-ea225fd45a39@amsat.org>
Date: Wed, 13 Jan 2021 09:06:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0e1b22ca-7ca0-f92e-2d43-fc10eafd565f@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 3:15 AM, Jiaxun Yang wrote:
> 在 2021/1/13 上午5:54, Philippe Mathieu-Daudé 写道:
>> Loongson is next step in the "MIPS decodetree conversion" epic.
>> Start with the simplest extension.
>>
>> The diffstat addition comes from the TCG functions expanded.
>> The code is easier to review now.
>> IMO this is also a good template to show how easy a decodetree
>> conversion can be (and how nice the .decode file is to review) :P
>>
>> Please review,
>>
>> Phil.
>>
>> Based-on: <20210112184156.2014305-1-f4bug@amsat.org>
>>            "decodetree: Allow 'dot' in opcode names"
>>
>> Philippe Mathieu-Daudé (6):
>>    target/mips: Re-introduce OPC_ADDUH_QB_DSP and OPC_MUL_PH_DSP
>>    target/mips: Convert Loongson DDIV.G opcodes to decodetree
>>    target/mips: Convert Loongson DIV.G opcodes to decodetree
>>    target/mips: Convert Loongson [D]DIVU.G opcodes to decodetree
>>    target/mips: Convert Loongson [D]MOD[U].G opcodes to decodetree
>>    target/mips: Convert Loongson [D]MULT[U].G opcodes to decodetree
>>
>>   target/mips/translate.h       |   1 +
>>   target/mips/godson2.decode    |  29 +++
>>   target/mips/loong-ext.decode  |  30 +++
> 
> Hi Philippe,
> 
> Thanks for the template!
> 
> Just a small question, where should we perform ISA availability check?
> Before calling generated decoder or after decoded?

The check is done before in decode_loongson:

 bool decode_loongson(DisasContext *ctx, uint32_t insn)
 {
     if ((ctx->insn_flags & INSN_LOONGSON2E)
         // if ISA available ...
             && decode_godson2(ctx, ctx->opcode)) {
             // and opcode supported
         // return success
         return true;
     }
     // else keep going ...

     if ((ctx->insn_flags & ASE_LEXT)
             && decode_loong_ext(ctx, ctx->opcode)) {
         return true;
     }

     // finally return false, if nothing else decoded
     // gen_reserved_instruction will be called in the
     // main decode loop.
     return false;
 }

> 
> Loong-EXT is a super set of Loongson2F's Godson2 and MMI instructions,
> how could we tell it?

MMI instructions are currently handled by the ASE_LMMI flag,
a different decoder (which will also be handled by this function,
similarly to ASE_LEXT).

Regards,

Phil.

