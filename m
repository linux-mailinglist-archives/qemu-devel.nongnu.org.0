Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720E0629799
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:39:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouuGN-0003gH-Ud; Tue, 15 Nov 2022 06:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouuGH-0003dw-2F
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:37:54 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouuGF-0006wI-54
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:37:52 -0500
Received: by mail-ed1-x535.google.com with SMTP id i21so21451450edj.10
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UGd9AR2ra5VOSNrKQ4PCvDdPIDeHM4zy5g18m02XjWY=;
 b=V8lROYTN3SOZ4Y1pWLKkIc6zZ6b/cK43EW55eRRoqqivM1PvlWIGGbrSB/LSXwGtTy
 5HlANkA4LajjDVrku01a9qcVxShQRPK6BD5W3kRcpMh0p2aDKi3VFW8bv+YTkQdcHBG2
 JL0aDsQuG4j+CbR57ufSYFITa/SFgteumUzFmCEFXbCwh+zqOnmZW/RlE3mLxtPMK2e9
 0j9IGTFCIZJJ4X5Rr9od/suW5tDaqo8EMMGS0fuWI6lWaN0HCq/uFQvE94jMBRGQbwmH
 FqlgR1OJnj4xaezRwfctO0ZKykoi9eK3Uvzbn1mQt0tkhtk8oN81asjdLqexoIHYrMcP
 wSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UGd9AR2ra5VOSNrKQ4PCvDdPIDeHM4zy5g18m02XjWY=;
 b=BtjzjgD7/1+/zWO2nfCT8twsVatCmSoH+ZcuyfOclOfF87vBMwbCptS0bDFF2ysuJ6
 /3KCp8mh4x5JxBE+046m+9MUkWpi4BUQe4x6olWjz4p47zYVjZmMGRsjes4zLg+HWVvX
 G9pI1g4OYk2q4pSFSPsJT0WADW4p27uMaFFdtJ7WHrNDC7/UHMDWMCdCDEy9dsXSLNBw
 W4uVftDEteh5ZX6XIEtBPGY16NHW83fA5Zee9eT9mritzr4QTxcveFwLl3mV5VukOQ+8
 CD3VIIkUev88/Dfe06Mm4Ls3zTCnh0txUgG12yIV0Yf9iLb7vrWRnTb4fRYVTGY7ZUDP
 3KaQ==
X-Gm-Message-State: ANoB5pm5HmcvPFWCl8YWA/NUvT36X3/M8W+EBwmCqS6jsH2Z3oa/bNNP
 57bGLd4nU70NVCNRJe+0fvpbNQ==
X-Google-Smtp-Source: AA0mqf66JqkBKUxfDlsacQQEaTXUENplOMj+JkocOvS4Kw1nVZFCfQ/SABiPT0JyNQDsSGJ/ExsbcQ==
X-Received: by 2002:a05:6402:380c:b0:467:481e:9e2 with SMTP id
 es12-20020a056402380c00b00467481e09e2mr14810882edb.352.1668512269517; 
 Tue, 15 Nov 2022 03:37:49 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170906314f00b007aea50205a0sm5345759eje.187.2022.11.15.03.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 03:37:47 -0800 (PST)
Message-ID: <e1da1500-f8c7-48ec-52bb-d3ac49d07a4e@linaro.org>
Date: Tue, 15 Nov 2022 12:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v4 4/7] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, tobias.roehmel@rwth-aachen.de,
 Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-5-tobias.roehmel@rwth-aachen.de>
 <CAFEAcA-kCEySTWUGXwqA=aw4E+TBjbUaewsLe5ExtXj0xja0Vg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-kCEySTWUGXwqA=aw4E+TBjbUaewsLe5ExtXj0xja0Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

On 14/11/22 18:19, Peter Maydell wrote:
> On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
>>
>> From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
>>
>> ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
>> tough they don't have the TTBCR register.
>> See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
>> AArch32 architecture profile Version:A.c section C1.2.
>>
>> Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
>> ---
>>   target/arm/debug_helper.c | 3 +++
>>   target/arm/internals.h    | 4 ++++
>>   target/arm/tlb_helper.c   | 3 +++
>>   3 files changed, 10 insertions(+)
>>
>> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
>> index c21739242c..73665f988b 100644
>> --- a/target/arm/debug_helper.c
>> +++ b/target/arm/debug_helper.c
>> @@ -437,6 +437,9 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
>>
>>       if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
>>           using_lpae = true;
>> +    } else if (arm_feature(env, ARM_FEATURE_PMSA)
>> +            && arm_feature(env, ARM_FEATURE_V8)) {
> 
> Indentation looks wrong here. Generally the second line of a
> multiline if (...) condition starts in the column after the '(',
> so it lines up with the first part of the condition.
> 
>> +        using_lpae = true;
>>       } else {
>>           if (arm_feature(env, ARM_FEATURE_LPAE) &&
>>               (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {
> 
> For instance this is an example in the existing code.
> 
> We are inconsistent about whether we put operators like '&&' at
> the end of the first line or beginning of the second line, so
> pick whichever you like best, I guess.
Personally I find the operator at the end aesthetically nicer, but
few years ago Eric Blake reasoned that moving it at the beginning
was more explicit (to reviewers) thus safer, and I now I tend to
place it at the beginning.
Maybe part of the justification was cases where copy/pasting new
conditions in pre-existing could introduce a bug when the operator
is at the end?

+Eric/Daniel who usually give such good style advises :)

