Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3186A82AB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiCc-00013V-CN; Thu, 02 Mar 2023 07:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXiC8-0000qe-LN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:38:10 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXiC4-0005IR-Pz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:37:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id v16so13563490wrn.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677760675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3hidhCmQ11JooBLAoRh5u80e03CU/Q6IvKMgsuF37l0=;
 b=TmL73WRZE9WUv53bzZawcRI6IBw1mE/taN2QX+mBV1tDw2RNerAmU3L+blsptSzm3Y
 l27pGVahHYzP/cL1thUobTvy88NEa2l+L4vCBZDB1XHoizlhMFdL83fftgkbBx5uXdpg
 iABaVKp5+m1nGOFxj5iHOE3JY5wDI7LsjBXeGBca3zsgthnggQk0J6GQMQcQe84c68XU
 ndhBP6TYuQvNauTab47UFkJgI/+7hO3rZwtT9mzXDtxwezk0xBQKliTs+6dQaj6JGBtD
 bC2UA0+O7YZ4ZSHAJE9kjRxaaO8abMTBDTCDj5DTKMzrOpSDEandsrIMDMrMWCCZGO4Q
 Vi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677760675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3hidhCmQ11JooBLAoRh5u80e03CU/Q6IvKMgsuF37l0=;
 b=myAAB4JiKEY3afSIwzhVFCrnR9HNn28AduIqw1yvY0uccbBdqO/O/7r1YLFPlQmT16
 nP4RjxqbMiBY+IMspwamYgRgNkHqZ8zzbNbTeDnNmvnS5RWZokF9a71DV9O+cbU7RwjX
 4DmLmE/UrfrByKVLsuJrZMrOsaxY6yN0st4jjf1fOPSOvd+17+xkA0cMjxuxaTR42q2K
 WgfriNl1+OXofUTKiEpW9BnDGI4qxIZDX2C+fPb1mB6OPnxkvJsgEXsmT3v5FAFz7rsx
 9ED/mYFu947GHFQGEUIDMaXl8w8AknTOYIeAwER3C6J1oXMX0+Jj8X3eXb5Za9RySwg5
 zj3w==
X-Gm-Message-State: AO0yUKUy6lkk4AQqGvGJH3FFJp4FJmay6aCab1WIe2/kUoY7bt74EPRp
 2BvEiBGfEOXSr0e7PaQ5PywsBg==
X-Google-Smtp-Source: AK7set/GbMqaVIGKaxLfu/x2W8zZde0YeDiABzFPQ215yYQUOzoVD1BQYShwSkwpH14yN7hApHxWPw==
X-Received: by 2002:adf:eec8:0:b0:2c5:52f9:8e9b with SMTP id
 a8-20020adfeec8000000b002c552f98e9bmr1360076wrp.29.1677760674909; 
 Thu, 02 Mar 2023 04:37:54 -0800 (PST)
Received: from [192.168.230.175] (148.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.148]) by smtp.gmail.com with ESMTPSA id
 w9-20020adfee49000000b002c7107ce17fsm15649397wro.3.2023.03.02.04.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 04:37:54 -0800 (PST)
Message-ID: <2e6a7280-fb4a-428d-c16f-5e211c6d11e3@linaro.org>
Date: Thu, 2 Mar 2023 13:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado, 
 windows)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
 <87lekfbdi0.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87lekfbdi0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/3/23 12:24, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Wed, 1 Mar 2023 at 19:47, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>>  From the other thread:
>>>
>>> I think the underlying config needs updating:
>>>
>>>    .git/modules/tests/fp/berkeley-testfloat-3/config
>>>
>>> I'm surprised the git config for submodules doesn't carry the metadata.
>>
>> Yeah, in my local repo that I merge stuff with that file
>> does still have a github URL:
>> url = git://github.com/cota/berkeley-testfloat-3
>>
>> So I guess my questions are:
>>   (1) why hasn't this been a problem up til now ?
> 
> Well this is the first time we've had to tweak testfloat since Emilio
> introduced it when we first added the fp tests.
> 
>>   (2) does this mean that if I merge this then everybody will
>>       need to manually go in and update this file somehow
>>       to be able to pull the updated qemu master ?
> 
> It will depend on how old their checkout is. I don't know why git does
> just honour the metadata in .git-submodules - maybe there is a command
> line stanza to reset the origin repo of submodules?

    git submodule [--quiet] sync [--recursive] [--] [<path>...]

    Synchronizes submodules' remote URL configuration setting to
    the value specified in .gitmodules. It will only affect those
    submodules which already have a URL entry in .git/config (that
    is the case when they are initialized or freshly added). This
    is useful when submodule URLs change upstream and you need to
    update your local repositories accordingly.

    If --recursive is specified, this command will recurse into the
    registered submodules, and sync any nested submodules within.

