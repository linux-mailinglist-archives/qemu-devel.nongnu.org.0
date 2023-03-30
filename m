Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4E6D05A2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:00:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrsv-0005Qf-T4; Thu, 30 Mar 2023 09:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phrst-0005Q4-CP
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:00:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phrsr-00070y-6a
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:00:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l12so18968401wrm.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680181203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ma3XDkiSXLvZWrR7r8V15Ik0qYtB7paYBPWPXT8XiT0=;
 b=ZwVtkTxOTovMciFYRHG7xiGL9T7xT8+xbgshuQPsLPF2xNKMq+0mOjR/G3hXmnkHxb
 VqxgHzPmXkE7Z27tX5XMBYwf0faLMtUxDgT7LBwgdG4amVLQD1ynYnnyXgtBpmh381XA
 uG8Hq4CJ80hYheKM1KjEWA7xo4Alh1HcRpjYJPrKkyhrGCxmQxAvwdOP5qDPOhMMpScs
 QRmfHB9VOoSi6GJJqQGS2ZDo0aTXzaqBDYxtrWsooL4r+COZQa7bKm4bc4J2RLcYwbLa
 Ge6WhEPS8+5dseH1faDX5u+y9CzLgNCqZ6NQmCAyY1Zy5uM6UH/Nff6BVJpK5bzcXdpv
 kMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680181203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ma3XDkiSXLvZWrR7r8V15Ik0qYtB7paYBPWPXT8XiT0=;
 b=IA9ZVTeNkXVOHc6D6vQAwRrUP8a9moJ61uqTWErC1eY/zl0DRyBNxE+KIF2GklVK/5
 WQ7OU09GUsj+EDqbL/VvFMmsY1sGHIVuKGaMfCD3NHpO7RazHGB5SoLQyKZVM2uMleg2
 cdkxSYLzDeO424DuUIFTriAYjYaGHVleigyoWWSbtEtBeQC4qDhofafCXsSWJyoSzWjx
 xayQgTUXklb1ILDGaiKrJ9wfaoLlh1YsjVcvXufco80d125a07lQSmJOWv29IDZDSmZm
 g2jerPt0A3V/5jgMjhFqoM1Q3kipzM/ME12bCJmSg2u6L+MB9y7BYa+HfRz2Q1v7JevJ
 NZUw==
X-Gm-Message-State: AAQBX9dhU0IqegZkeG+CEdbxhgElvBX3aRT57KJLvSNBipRCcwviJgAp
 5yjZAJP5eTL5woTB03P+3CSq6w==
X-Google-Smtp-Source: AKy350ZDUVbHj88EJiY9u0RdwFigGUru2sysBe981rTiRJBJ3G3n/XuE8VHZ376pO6pPfLzJPk+IYQ==
X-Received: by 2002:adf:f544:0:b0:2cf:f2f9:5aab with SMTP id
 j4-20020adff544000000b002cff2f95aabmr18948384wrp.20.1680181203327; 
 Thu, 30 Mar 2023 06:00:03 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o10-20020a5d684a000000b002d89e113691sm23797137wrw.52.2023.03.30.06.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:00:02 -0700 (PDT)
Message-ID: <6ac0c848-6206-c2f2-f718-68a08b5fe001@linaro.org>
Date: Thu, 30 Mar 2023 15:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 v3] target/arm: Fix non-TCG build failure by
 inlining pauth_ptr_mask()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230328212516.29592-1-philmd@linaro.org>
 <CAFEAcA_yP9ibO2NOC0pL4SNbPmHtB+TfPm0A06YfC4Mwec5xAQ@mail.gmail.com>
 <CAFEAcA9w0H+j2EbgFDXACno1OF-dCFcb1OuCNksci9vHqW=RPw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9w0H+j2EbgFDXACno1OF-dCFcb1OuCNksci9vHqW=RPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 30/3/23 12:34, Peter Maydell wrote:
> On Thu, 30 Mar 2023 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 28 Mar 2023 at 22:25, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> aarch64_gdb_get_pauth_reg() -- although disabled since commit
>>> 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
>>> gdb") is still compiled in. It calls pauth_ptr_mask() which is
>>> located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
>>>
>>> To avoid a linking error when TCG is not enabled:
>>>
>>>    Undefined symbols for architecture arm64:
>>>      "_pauth_ptr_mask", referenced from:
>>>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>>>    ld: symbol(s) not found for architecture arm64
>>>    clang: error: linker command failed with exit code 1 (use -v to see invocation)
>>>
>>> - Inline pauth_ptr_mask() in aarch64_gdb_get_pauth_reg()
>>>    (this is the single user),
>>> - Rename pauth_ptr_mask_internal() as pauth_ptr_mask() and
>>>    inline it in "internals.h",
>>>
>>> Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>> Reviewed-by: Fabiano Rosas <farosas@suse.de>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> Supersedes: <20230328133054.6553-1-philmd@linaro.org>
>>>
>>> Since v2:
>>> - Rebased (patch #1 merged)
>>> - Addressed rth's comments
>>> - Added R-b tags
>>> ---
>>>   target/arm/internals.h        | 16 +++++++---------
>>>   target/arm/gdbstub64.c        |  7 +++++--
>>>   target/arm/tcg/pauth_helper.c | 18 +-----------------
>>>   3 files changed, 13 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>>> index 673519a24a..71f4c6d8a2 100644
>>> --- a/target/arm/internals.h
>>> +++ b/target/arm/internals.h
>>> @@ -1389,15 +1389,13 @@ int exception_target_el(CPUARMState *env);
>>>   bool arm_singlestep_active(CPUARMState *env);
>>>   bool arm_generate_debug_exceptions(CPUARMState *env);
>>>
>>> -/**
>>> - * pauth_ptr_mask:
>>> - * @env: cpu context
>>> - * @ptr: selects between TTBR0 and TTBR1
>>> - * @data: selects between TBI and TBID
>>> - *
>>> - * Return a mask of the bits of @ptr that contain the authentication code.
>>> - */
>>> -uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
>>> +static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
>>> +{
>>> +    int bot_pac_bit = 64 - param.tsz;
>>> +    int top_pac_bit = 64 - 8 * param.tbi;
>>> +
>>> +    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
>>> +}
>>
>> Any reason for deleting the doc comment ?
> 
> Applied to target-arm.next with a doc comment:
> 
> /**
>   * pauth_ptr_mask:
>   * @param: parameters defining the MMU setup
>   *
>   * Return a mask of the address bits that contain the authentication code,
>   * given the MMU config defined by @param.
>   */

Thank you!


