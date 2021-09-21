Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB354130EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:48:31 +0200 (CEST)
Received: from localhost ([::1]:51810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScO6-0007Ub-7O
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mScLC-0004tN-AQ
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:45:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mScLA-0005nd-7U
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:45:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w29so37276699wra.8
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dqrR/yqGz5yGeCuMzX7WmGrVbksvk4sPBuRVJV9SBhk=;
 b=awDwxtYAzntPxMKnF2YHUXTclTAs509Dfk3u8aU5EUebzGdshUyFpHqR+og4lSyClG
 6dUFJdc9yIinv04oY7zuR097Ef7gXWUDnJsq32y4QbYCaqQlXvFPhuRb+AaPgfkNWOs1
 +AZ17x9hG9e7BeAkzqDxEZQqCeJM5hIKD3jPwb2N2AtR8LENH4JtBsB9vr7nkOAlOdNo
 ay6MUzNKZQaNGj5vlWK1u0QMn+HZhBnv61EtqNIeuU1CGMRUX9uYaduJC1DmwH6kOBCg
 vMriCC9CdVNULea6+ErimZ5JXlsrdQMJ0CfA0n1QWKmO0K0cEKyoFQLQJm4wT6il/1ok
 zMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dqrR/yqGz5yGeCuMzX7WmGrVbksvk4sPBuRVJV9SBhk=;
 b=C7jgvp3JqE3pozRmMQD6sWl3m0Fd8ET3guIJ55+mc7arsEbd57QPBT4c8p2CoQoxfR
 yDOBJRSUYySYP4YucVPtBE96p5twNvmxwVI5PZQcMwAmboqKYk8cW6dHZZ2/gNaTUKhK
 icbft6TaaGD6IXHa+A/4Afm7yt4uGJ18wJQLnPf4Eag41IsNc7Xb3djqURoNUqSc7LAh
 qoc0HrykYA9HSKUfqEgME76FSKO3LCqX2EPryEymu6XcNZrgp7ttApiTEjxy834HciH6
 DKhwZ81/t9w4+PH+tcahK8j/D2JSKZVBMxfNyRtSZkicd1pWwkA16o8nkF40OFReTvjG
 4CgQ==
X-Gm-Message-State: AOAM5316vYBrJoTTY2/ENW/2BdKaHsXaFM8BE8pLWg1q+U3rWMb4GAkH
 l0Wpr0vQTFcqfPLV/IQKuXU=
X-Google-Smtp-Source: ABdhPJwiKlMmUo8tyQqww245zp6BIeVpLyfOjN5wpdoZY4rfZB5m10rIt4yq7RlVql3Vcc3qG9kt/Q==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr33696526wrq.136.1632217526752; 
 Tue, 21 Sep 2021 02:45:26 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id r5sm18275804wrm.79.2021.09.21.02.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 02:45:26 -0700 (PDT)
Message-ID: <90d882ac-968e-26f0-e5a4-8a2a401119cc@amsat.org>
Date: Tue, 21 Sep 2021 11:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 01/31] target/arm: Implement arm_v7m_cpu_has_work()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-2-f4bug@amsat.org>
 <CAFEAcA_UfuKjXamxH-Y-4rs2mu+JM=7p8tGc2QixzPzDqZxcWg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA_UfuKjXamxH-Y-4rs2mu+JM=7p8tGc2QixzPzDqZxcWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Michael Davidsaver <mdavidsaver@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:34, Peter Maydell wrote:
> On Mon, 20 Sept 2021 at 22:44, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Implement SysemuCPUOps::has_work() handler for the ARM v7M CPU.
>>
>> See the comments added in commit 7ecdaa4a963 ("armv7m: Fix
>> condition check for taking exceptions") which eventually
>> forgot to implement this has_work() handler:
> 
> Huh? M-profile and A-profile share the same arm_cpu_has_work()
> function. Some of the checks the code there does are perhaps
> unnecessary for M-profile, but they're harmless.
> 
>>    * ARMv7-M interrupt masking works differently than -A or -R.
>>    * There is no FIQ/IRQ distinction.
>>
>> The NVIC signal any pending interrupt by raising ARM_CPU_IRQ
>> (see commit 56b7c66f498: "armv7m: QOMify the armv7m container")
>> which ends setting the CPU_INTERRUPT_HARD bit in interrupt_request.
>>
>> Thus arm_v7m_cpu_has_work() implementation is thus quite trivial,
>> we simply need to check for this bit.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Michael Davidsaver <mdavidsaver@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/arm/cpu_tcg.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>> index 0d5adccf1a7..da348938407 100644
>> --- a/target/arm/cpu_tcg.c
>> +++ b/target/arm/cpu_tcg.c
>> @@ -23,6 +23,11 @@
>>   #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>>
>>   #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>> +static bool arm_v7m_cpu_has_work(CPUState *cs)
>> +{
>> +    return cs->interrupt_request & CPU_INTERRUPT_HARD;
>> +}
> 
> This seems to be missing at least the check on
> cpu->power_state and the CPU_INTERRUPT_EXITTB test.
> 
> Is there any reason why we shouldn't just continue to
> share the same function between A and M profile, and avoid
> the extra function and the ifdefs ?

The only reason I can think of is I should have been resting
instead of posting this patch :/ I'll re-use arm_cpu_has_work()
which is, as you said, harmless and safer.

