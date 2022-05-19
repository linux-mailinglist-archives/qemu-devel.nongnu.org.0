Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9252D706
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:09:36 +0200 (CEST)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrhmQ-0006Ip-Se
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrhek-0006vO-2s
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:01:38 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrheg-00030D-AA
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:01:35 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ds11so5606939pjb.0
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VFnRLzhGRgOsqKCf1km/rcHk8BImVp8LD/M50YdThzQ=;
 b=Frt8UFM8xnu/TJH2AOpD/Yu1d7r9Jvw+tEI2aSCQ+ZWRZc8lZO5YJeW1UWYrsYMrqJ
 HnkJXBiAV4k6fpi/HwiHG3MdN8Izw/v67LBEhwtOmkiWDf6NCOhJbb9Ajc6gGACwZEvW
 OyQKpUnkM2sbUINoDIkYoRRkEUt2t4/1F7DoR9+MPwpUmf/CiOOIHdzJfj0YlqE7Cv97
 XjyBq7fXERHEUFd/gRbg7zp+9ggxWza3kVr6+wBWVUw9t9fZNaBL2QzMCTByHmHLaHfl
 d4/RZnu6FK78D5TSipzbBWuPl4FY+bZfETyHBGSUUJm8zX5odPzSubHNqaeZvObA9ehE
 DutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VFnRLzhGRgOsqKCf1km/rcHk8BImVp8LD/M50YdThzQ=;
 b=Wj47XM74aguz3nuJsPOx7u4nDI2wedlIf7MtJ0Jy7ApFrhPwTtoTv4f2e/3UYeznwn
 2LEnMqP5iCCMuLbHhmlerJMoCW/Bud85RO7cTnGzxSMeP+iZclMqkJAdIn4TZLwj1pwT
 SZHWSbLGUolG2pNWzeWFIupdBLp89aua/1tEgPwssPLIXjULUMhKBT8iZ+XBGtkizITk
 UqpCQBB8gX5pLnoWXBOU2g7/oMZ5HRlSix5B8QSyJFiQKzfKLr2HMguPj4VaEU+/fbct
 hmc00BUhAtYMmVEHVMZU6xc20IZKYQkUBjDeq+wlQN9945zbhGdlX2L5in81StcLFl6S
 0GOw==
X-Gm-Message-State: AOAM531HlepApS28jFjtN5Ht/xdXJIKWygudNZP4ZJBnMI5eyIggfo3/
 Z4/s1fQW+5ULsPuvdakUru/sXA==
X-Google-Smtp-Source: ABdhPJwU2QsXwjV+x8xFEgYsAaCv5nLwgootqHLIn/q1phdUuhasOp+gN4GamHqXy4jRNeWSWSQ+mg==
X-Received: by 2002:a17:90a:f3c2:b0:1df:8d56:d8ce with SMTP id
 ha2-20020a17090af3c200b001df8d56d8cemr5506181pjb.86.1652972492276; 
 Thu, 19 May 2022 08:01:32 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a17090ade0300b001cd4989fecbsm5703617pjv.23.2022.05.19.08.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 08:01:31 -0700 (PDT)
Message-ID: <184a5c35-081c-9f85-a344-02c04766340a@linaro.org>
Date: Thu, 19 May 2022 08:01:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 6/7] target/arm: Remove fp checks from sve_exception_el
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-7-richard.henderson@linaro.org>
 <CAFEAcA_oX3RRc4mLtBZc8SH9pjAM_cDQzqgzoqxH+8+Rct68mA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_oX3RRc4mLtBZc8SH9pjAM_cDQzqgzoqxH+8+Rct68mA@mail.gmail.com>
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

On 5/19/22 04:36, Peter Maydell wrote:
> On Tue, 17 May 2022 at 07:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Instead of checking these bits in fp_exception_el and
>> also in sve_exception_el, document that we must compare
>> the results.  The only place where we have not already
>> checked that FP EL is zero is in rebuild_hflags_a64.
> 
> aarch64_cpu_dump_state() calls sve_exception_el() and doesn't
> check against the FP exception EL.

Yes it does, just 6 lines above -- fp_exc == 0.

>> -/* Return the exception level to which exceptions should be taken
>> - * via SVEAccessTrap.  If an exception should be routed through
>> - * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
>> - * take care of raising that exception.
>> +/*
>> + * Return the exception level to which exceptions should be taken
>> + * via SVEAccessTrap.  This excludes the check for whether the exception
>> + * should be routed through AArch64.AdvSIMDFPAccessTrap.  That can easily
>> + * be found by testing 0 < fp_exception_el <= sve_exception_el.
>> + *
>>    * C.f. the ARM pseudocode function CheckSVEEnabled.
> 
> We should probably note that the pseudocode does *not* separate
> out the FP trap checks, but has them all in the same function.

Sure.

>>           /*
>> -         * If SVE is disabled, but FP is enabled,
>> -         * then the effective len is 0.
>> +         * If either FP or SVE are disabled, translator does not need len.
>> +         * If SVE EL >= FP EL, FP exception has precedence, and translator
>> +         * does not need SVE EL.  Save potential re-translations by forcing
>> +         * the unneeded data to zero.
>>            */
> 
> These comments say that if SVE EL == FP EL then the FP exception
> has precedence, but looking at the pseudocode CheckNormalSVEEnabled()
> it seems to be the other way around:  eg if CPACR_EL1 has
> "disabled at EL0" for both the .ZEN bits and the .FPEN bits
> then the SVEAccessTrap() is handled first.
Yep.


r~

