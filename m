Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B102EA956
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 12:01:20 +0100 (CET)
Received: from localhost ([::1]:48410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwk5X-0002PJ-Rq
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 06:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwk3O-0001YQ-Q4
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:59:06 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwk3N-0005LH-9A
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:59:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id c133so2613080wme.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 02:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WDRc0KDAkXpAN2Ob5WcxVYBWDkE4V075/vWTBrhNfhs=;
 b=Vu5BuZUXHMF8WRtz0pAUn1TddUBefDfygs0g3rR7GKioTuT14OecVwJmJ9+slBGx9L
 oTLgXGLXTqYPwkHJ/ejKlW24JHUbPfKiuq7re2FJzANHIewRZVRe0Iy/WyGDBtLfkb4S
 v/9PhU0qqS2cAxp9pZZ/4ziDCgssWkxXExW025ibLjwQSCxVfUYAthVFZ7oGQ/4G/bli
 REE2rHvJUG6UBzhMc63ngqhrrHtXrfLELYx0dG1A4Uwqfj59wgjY84mTcUpyyH/QVwQq
 RBqBDF3G/Vh2yXr92CaHN/P6Vm/+erkhprTD4G96LN0iePLZ964jpXbbCIQqJujCAtUj
 iWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WDRc0KDAkXpAN2Ob5WcxVYBWDkE4V075/vWTBrhNfhs=;
 b=RiGJI2UxEDbdUiRh7mJGzKBLlpFSuap8NVrDZ6RWl9/ren552H4wuI9aq1KLi5UH4W
 pwBlaip14Xj8IQv6VeG+By1N4qjF7PN+ms2EeaKG7rG3/MHn2x6gsfJdEhNCbli9sGp4
 wxNoaU4pSyaMzQXhsMPfZ6G/LsFCnl15Y3OqfeRoTjZmN/0a9UxOgOrAw+UdYQL5wPdx
 Xp7a7wU/RR+FFTlWmnLZ2PjqxjrJV2ODd3q/H4niVKcxGFTbgHfPQDp0nUUj5q0bNuso
 zATrf2LB9lptbEIIHImu8ddOBD1DSFzU8bP9w1Sv6cDZI4AHrTsfveCO1MC6jlcwcWDx
 rljw==
X-Gm-Message-State: AOAM5326STCnLnwLEmlzuwSIDHhqfDMN2nj0aV7llVIdPJKeWMuZKq8U
 Fn2vztXxPEhWmUsDym/S/r1S00KvvqQ=
X-Google-Smtp-Source: ABdhPJwwUe18XGsVMhpYjQUp1AykVXYeoJ42TisAnB3XVLQpGETosTSayZp03ULGI4fhmmkWOiRl8Q==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr3017801wmj.42.1609844343578; 
 Tue, 05 Jan 2021 02:59:03 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s12sm3571531wmh.29.2021.01.05.02.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 02:59:02 -0800 (PST)
Subject: Re: [PATCH] tests/docker: Include 'ccache' in Debian base image
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20201213211601.253530-1-f4bug@amsat.org>
 <21650cc2-8e1e-067c-fc89-ec7904dc87eb@redhat.com>
 <5b4bca2e-366a-fd5a-f334-39c0f342e284@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c25922ac-6553-1e2e-9c2b-7af2e933c3cd@amsat.org>
Date: Tue, 5 Jan 2021 11:59:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5b4bca2e-366a-fd5a-f334-39c0f342e284@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/14/20 2:39 PM, Philippe Mathieu-Daudé wrote:
> On 12/14/20 6:44 AM, Thomas Huth wrote:
>> On 13/12/2020 22.16, Philippe Mathieu-Daudé wrote:
>>> Include the 'ccache' package to speed up compilation.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  tests/docker/dockerfiles/debian10.docker | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
>>> index 73a3caac9cd..9d42b5a4b81 100644
>>> --- a/tests/docker/dockerfiles/debian10.docker
>>> +++ b/tests/docker/dockerfiles/debian10.docker
>>> @@ -20,6 +20,7 @@ RUN apt update && \
>>>          bc \
>>>          build-essential \
>>>          ca-certificates \
>>> +        ccache \
>>>          clang \
>>>          dbus \
>>>          gdb-multiarch \
>>
>> Don't you need some additional setup for this? Like caching the
>> corresponding directory during CI runs?
> 
> I hadn't looked at CI (too many CI series in fly).
> 
> w.r.t. Docker this is in use since 4 years, see:
> 324027c24cd ("Makefile: Rules for docker testing")
> 36ac78e65a0 ("docker: Don't mount ccache db if NOUSER=1")
> 
> I suppose we forgot the package when introducing debian10
> base image in commit d6db2a1cdf6 ("docker: add
> debian-buster-arm64-cross").

Should I do something else with this patch?

Thanks,

Phil.

