Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87162D69F6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 21:16:47 +0200 (CEST)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK5pm-0008IY-9r
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 15:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iK5oC-0007PF-5T
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iK5oB-0001xL-4E
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:15:07 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34621)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iK5oA-0001wV-VO
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:15:07 -0400
Received: by mail-pf1-x442.google.com with SMTP id b128so10932630pfa.1
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e93wkwG0HkPCKwmBCpkvboT2RX+XxELhxVuTIwX89fE=;
 b=ipMxbr77UHJDHLXy2/ZqWR0VIOI3+L+t+WrpfGR4Jel1pivi7afMuZCdSHM2SlBg2F
 gwWdI502lZ7kFCKJfksMn7WSisazDmpBrWgXbNb+L/EW/oT4bbv8fAlH4rigBfnWFgju
 7yrYyKLPiYI0YNucblC/z2KN99r9suT9XJuC5g3n3x138Su+6q4FkBd4+7sde07I/H9L
 EYV5Njo2YzAoWleEiff4vueaCpFKPqIEpPWH/d7BrHMDsw+nNgqNFWLeHw4X06NFJ/8N
 aDzRqicPdC+a16PVmJYAARFEW64wRWdacjKoWOHXwNxBgVT8P5tX6cHOwot+4mGmV2vK
 VqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e93wkwG0HkPCKwmBCpkvboT2RX+XxELhxVuTIwX89fE=;
 b=PNCbZXpA/0Yzn/aDOdTR0q7t7cxLgAABNLM5tmPbK21/UbmjwA++RNImCcO4WWNg5v
 r3/g5VFEfwXlkA54xz1wBGGqA1Z5l9vJCCG/XX0lO5BtqZRXnZgloKiubx8CiH/CMnyI
 w1bmc36+Ch+AMDJNg5FyMeNSI75bBeYwEfyqCUVmz58LRT4pW4oURnHqaiFOaZUAjZyt
 OHH/fc3RQjfurBXSal7ajAEjHyYFR27Nx8wxWG8f6P5JmheyvzAfklG+X+7i5csGj1Cc
 bO1ZDsdGxqY0vKYdtdfuFkAaOArysKjhvJ2Pcqpxnr2otPd3h7rJFAzQ4Jtx/dU4Wezz
 +Oeg==
X-Gm-Message-State: APjAAAXjuB+mQDPChRkIZ6Z3z7Yon+OdLoTF2r4UrqNfIU8DwTHk/8Qe
 cvRVia2B4QgLvPdvaiRxy8TR6iHRZ0U=
X-Google-Smtp-Source: APXvYqygZJydYDmTMun8JMuX9GYEqcz2fjHLLuzygYA1CANWOV3veLqdNokKHvZB9EImAaWBoE+N/g==
X-Received: by 2002:a65:434c:: with SMTP id k12mr35412626pgq.141.1571080505338; 
 Mon, 14 Oct 2019 12:15:05 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d19sm16638408pjz.5.2019.10.14.12.15.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 12:15:04 -0700 (PDT)
Subject: Re: [PATCH v6 18/20] target/arm: Rebuild hflags at CPSR writes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-19-richard.henderson@linaro.org>
 <875zkrm9gg.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1aa62e90-6915-c0e6-7a8e-22308ee48f0d@linaro.org>
Date: Mon, 14 Oct 2019 12:15:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <875zkrm9gg.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/19 12:08 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Continue setting, but not relying upon, env->hflags.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/op_helper.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
>> index ccc2cecb46..b529d6c1bf 100644
>> --- a/target/arm/op_helper.c
>> +++ b/target/arm/op_helper.c
>> @@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
>>  void HELPER(setend)(CPUARMState *env)
>>  {
>>      env->uncached_cpsr ^= CPSR_E;
>> +    arm_rebuild_hflags(env);
>>  }
>>
>>  /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
>> @@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
>>  void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
>>  {
>>      cpsr_write(env, val, mask, CPSRWriteByInstr);
>> +    /* TODO: Not all cpsr bits are relevant to hflags.  */
> 
> Do you mean by this we could check which bits changed and avoid a
> re-compute if we wanted to? Is it likely to be anything other than the
> SS_ACTIVE bit?

Yes.  Well, there's also NZCV.  But neither case happens particularly often, so
it's probably not worth worrying about.


r~

