Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485FA68928B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:47:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNrhi-0008Ag-5C; Fri, 03 Feb 2023 03:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNrh9-00087p-Pn
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:23 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNrh8-0007HW-1N
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d14so3952858wrr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 00:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uv7zud42CeIiEwv0EBFKMyqntl+B/lWXbIA6FVJXo54=;
 b=PPCCi/ATM5vK2dMDEgW9seIduhhet+cEOoZPh897JETk3PL15eT/2CrFbHh6mxITpg
 Sd4nIc1/xIazxBsaSbtFA6hRoWGYI1u1huegFHQ5pUR4aok/jMJHTRYtc4+6laMAiylB
 BbzuKUwPVfuLmKv+cn2KUpUwbF4V6tEpzWyw0le57lbT1z4z0j8eqTBP9yGMoFne8UaY
 G0wynNMxkO1gcOASHpq5sE8H0Bmjms24DwZOCn1DQLF2R0oH9vjlFpAViFM6hYHpe3ie
 tDosL8GEFkgHZtN2eAu5Ed8CRYnOwVYV6Sx6DtPn2TtBimEGFllg9R5XCEMQyM6TmKOv
 bP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uv7zud42CeIiEwv0EBFKMyqntl+B/lWXbIA6FVJXo54=;
 b=gFvz/KTjdPwCdkitnbSUPZkNhmaQ7qjvBI1sgJoJeylhjDQWe6QVCYw2daWww0GfO9
 /Kl+4nnAK7G5vXw6F8jifPunNev8teXWQvpTZPyVUOYvltUxDj9x4FJ33W7WAnz2PwWY
 xZSlKHvd5x59CnYRuVsVlWffqLvo35taiF+TWDiwdcGmsWbwtjwWdbryVLJJA2BJs1NC
 pC6bcKhUmud8wnt6ZxA8fI7Goe/Vlt4vx5aMd8+1FGMUg4HTT216eEMsQTWrIF0CMMkY
 SipblQcY6M90YEopFxE/PyYcpdYUld7rYn2p49WHv6fjmfWHTluyTJiRZGbupgveSl3G
 2W5A==
X-Gm-Message-State: AO0yUKXTU0ZYxKTWFaGA7KxCxD0+A27QOcxLxDFCzA8oOZSTuSISmbnq
 KSsBh9H7n6Ny6lJfMyKheJ5tzA==
X-Google-Smtp-Source: AK7set88mxJLY4iaJS1SBD5U4BjsE+KElzvx/xn2TK0KNwvqO8yuDlA1ZssgKBBLDi5QtuGsJUnirg==
X-Received: by 2002:adf:ef85:0:b0:2bf:f7ee:41cb with SMTP id
 d5-20020adfef85000000b002bff7ee41cbmr6595275wro.12.1675413916282; 
 Fri, 03 Feb 2023 00:45:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d6b83000000b002366553eca7sm1426567wrx.83.2023.02.03.00.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 00:45:15 -0800 (PST)
Message-ID: <60fc9b2e-d736-6430-6c43-d0bb46189811@linaro.org>
Date: Fri, 3 Feb 2023 09:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] gitlab: call ninja directly and reduce build noise
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>
References: <20230202175903.2119702-1-alex.bennee@linaro.org>
 <875ycjlwo8.fsf@linaro.org> <b674695a-793b-cceb-9083-72544fc1d67a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b674695a-793b-cceb-9083-72544fc1d67a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 3/2/23 08:58, Thomas Huth wrote:
> On 02/02/2023 19.59, Alex Bennée wrote:
>>
>> Alex Bennée <alex.bennee@linaro.org> writes:
>>
>>> A significant portion of our CI logs are just enumerating each
>>> successfully built object file. The current widespread versions of
>>> ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
>>> string to the ninja output which we then filter with fgrep. If there
>>> are any errors in the output we get them from the compiler.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   .gitlab-ci.d/buildtest-template.yml | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)0
>>>
>>> diff --git a/.gitlab-ci.d/buildtest-template.yml 
>>> b/.gitlab-ci.d/buildtest-template.yml
>>> index 73ecfabb8d..3c4b237e4f 100644
>>> --- a/.gitlab-ci.d/buildtest-template.yml
>>> +++ b/.gitlab-ci.d/buildtest-template.yml
>>> @@ -21,7 +21,7 @@
>>>         then
>>>           ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
>>>         fi || exit 1;
>>> -    - make -j"$JOBS"
>>> +    - env NINJA_STATUS="[ninja][%f/%t] " ninja | fgrep -v "[ninja]"
>>>       - if test -n "$MAKE_CHECK_ARGS";
>>>         then
>>>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>>
>>
>> This is too much for gitlab as it trips up on no output at all. 
> 
> I'm also not sure whether it is really safe to not run make here at all. 
> Some parts of our build system still rely on the "make" magic, I think, 
> and you might miss them if only running ninja. For example 
> pc-bios/optionrom/ does not get compiled without running "make".
> TBH, I also think the output of the file that currently gets compiled is 
> still valuable in some cases, too, e.g. if you want to be sure whether 
> certain files get compiled in one configuration at all or not. So I'm 
> rather in favor in not doing this change.

FWIW I kludge that by using 'make print-x && ninja'...

