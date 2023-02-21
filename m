Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11C69E248
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:29:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTcQ-0003Ev-Do; Tue, 21 Feb 2023 09:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUTcN-0003Ee-GK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:27:43 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUTcL-0001ph-SP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:27:43 -0500
Received: by mail-wr1-x435.google.com with SMTP id t15so4742330wrz.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fT9E/WNuLerxrLAUsvibwAPk6fl0N6dmviM9ciACLP4=;
 b=lsgmOurrzGUB/WsAY5jdkqY98AmPYZHa6Y3WstFdhQdDEHS97ylzsPuqcqX8zFobMM
 PvUsl3UbFKk7Qtaa/JaoxJdwWHVPP9CPjWrVlygkx6CXPXUrTGy/z9+23PBhLHPQOjww
 pZ/ejTnXwBwkCB0YvQZ9Z0QevILejid8ygu538LI3rXMjSSsXix2Iu4AI2rm0Jw8tmts
 jaKMzZln0HvOWCJGOHOJqiIKcvb32Xcd/YMppYcsNKUb1gC6QaL6BA2HpUiBh+S6epCl
 UTsoC4N+bYl1Nwd2E12hAYvGA/STUWiotE5EyEVT1w5J/ok3f9b8WBItubsGCWzWySsy
 wM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fT9E/WNuLerxrLAUsvibwAPk6fl0N6dmviM9ciACLP4=;
 b=0MlBVlDKNGuDZfAU0j/YlZAH3Aagigqv9/as4ZQwxCWZgqDMEAgZ6dkspZW1ykCH0J
 dqs0tyET0N9hwUJtaiA/iYKO5ny4r3QXt8yXKkKNtpTAQ2ZUOCKn2tsY5s5S0MVGF9Fn
 uekWtJHVsIufUqYTwTg6373zna3OqH5has+VOBk7Mrebxo5D4/X6Ue7H95OwImhKiJSl
 N66bpj41Ktx/HF+nIVWy1Pk1uQQXI96q9/uQZ93mCKQ3rpNQRislDk4eOP4oL1I33j5t
 qB/iEIreKquy8oYass4Iv8F61kSj1nBRS9+YzyPqjs+pSYl/E6ALWXEi2Q+fqrU9WcBw
 5YGw==
X-Gm-Message-State: AO0yUKWtkkMkD5pavocLd72jcz4/3OVjb94yNAGu7tLYeWZ/wY1dvAcF
 vyvKM2G5MigmwRJFn9dhIKGITQ==
X-Google-Smtp-Source: AK7set/biQ4h+w7lMOPHgplt0agdjBVoyP1dDuTvTIKfI2sA0jAfUCUP2ziZsjuykOg68g/YUXlTGA==
X-Received: by 2002:adf:dd4a:0:b0:2c5:5315:a7a7 with SMTP id
 u10-20020adfdd4a000000b002c55315a7a7mr4127729wrm.32.1676989659424; 
 Tue, 21 Feb 2023 06:27:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b15-20020a5d4b8f000000b002c561805a4csm6809232wrt.45.2023.02.21.06.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:27:38 -0800 (PST)
Message-ID: <56b649c3-1fd5-30bf-65b7-37f337d55cd4@linaro.org>
Date: Tue, 21 Feb 2023 15:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-3-pierrick.bouvier@linaro.org>
 <6de4e5b4-aeb1-3888-0979-01e4778eba93@linaro.org>
 <eb3116cf-dd6d-6a50-19cd-53614105e5de@linaro.org>
 <c09dcebd-9a23-9641-da7e-91fca4589607@linaro.org>
 <188d479a-7b54-d16c-3fe2-2e952ff1c8d1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <188d479a-7b54-d16c-3fe2-2e952ff1c8d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 21/2/23 14:16, Pierrick Bouvier wrote:
> On 2/21/23 11:33, Philippe Mathieu-Daudé wrote:
>> On 21/2/23 10:47, Pierrick Bouvier wrote:
>>> @Philippe Mathieu-Daudé, is that version satisfying for you, regarding
>>> your initial comments about setjmp/longjmp detection in meson?
>>
>> Yes, the meson check is what I had in mind.
>>
>>> I can integrate more changes if needed.
>>>
>>> Thanks,
>>> Pierrick
>>>
>>> On 2/20/23 16:16, Pierrick Bouvier wrote:
>>>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>>>>
>>>> On 2/20/23 12:12, Pierrick Bouvier wrote:
>>>>> Windows implementation of setjmp/longjmp is done in
>>>>> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
>>>>> perform stack unwinding, which crashes from generated code.
>>>>>
>>>>> By using alternative implementation built in mingw, we avoid doing 
>>>>> stack
>>>>> unwinding and this fixes crash when calling longjmp.
>>>>>
>>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>> ---
>>>>>     include/sysemu/os-win32.h | 25 +++++++++++++++++++++++--
>>>>>     meson.build               | 24 ++++++++++++++++++++++++
>>>>>     2 files changed, 47 insertions(+), 2 deletions(-)


>>>>> -#if defined(_WIN64)
>>>>> +#if defined(__aarch64__)
>>>>> +#ifndef CONFIG_MINGW64_HAS_SETJMP_LONGJMP
>>>>> +#error mingw must provide setjmp/longjmp for windows-arm64
>>
>> Per the meson error [*], this now seems impossible, thus we can
>> simply drop the CONFIG_MINGW64_HAS_SETJMP_LONGJMP definition?
>>
> 
> I think it's redundant too.

>>>>> -#endif
>>>>> +#endif /* __aarch64__ */
>>
>> This comment doesn't seem accurate. Maybe "64-bit"?
>>
> 
> I'd like to use windows-x64. IMHO,  it's clearer and on par with 
> windows-arm64. But I know some people don't like x64 nomenclature.

Fine by me :)


