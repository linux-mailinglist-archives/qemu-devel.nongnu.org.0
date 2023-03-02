Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599E6A80E5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:16:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXguJ-0003pc-O7; Thu, 02 Mar 2023 06:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXguF-0003pS-Oy
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:15:27 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXguE-0003xT-0g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:15:27 -0500
Received: by mail-wm1-x331.google.com with SMTP id p26so10425258wmc.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677755723;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u2z9TYtZpjLI4JA8rkm4ry9GzWWtG+Luw+P3ql7RtXc=;
 b=YWvphZFcUqSFyUtiZ0ILqimxyL8J8MhbWCucOT7/pm7awyHYdH5ClV6kh1ZPF71dGI
 9cq5gRPnLIjXhY7E9mMoiAFG8V6Qw51DARoTWOzhqx0DK3AHXQ/Co3c8chxhpnkSJBVo
 SVHdLiImYns0RD7qW7RuRi0VUYqFfpjOLDPKHkHGdbKJLBAR7CZbofmnrAGwFuE3e1Li
 rhhGtoJU2QHYikTuEmALBmiwJD4e181sPqCnP/vWYb8zvG/xBuLBmK+uLYisrW4DEZdq
 GBQ/vU3gAq2aAg4o3IvchtZgCgH0G56xZdyQBZvTGq59I7kGw2OyJsWG5lhE7rmEyCeM
 G78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677755723;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u2z9TYtZpjLI4JA8rkm4ry9GzWWtG+Luw+P3ql7RtXc=;
 b=j/U2z4oo1bSDgmPjsZ/TPfFIzqhNN6htwz2OZ0P2CkTRnr1LIRklYFbUgGaPZspTOD
 Gzkeo02OV3IOycJTzi5OElvQ3iUZCfPmLh+0iiRTUokijUxz/cua2uwzRl8tJcPnqg9n
 cDKAbKTAaYzgFqQhNb2u3vf3qnCdfhP9Hs83R/FRewVFjHstt4LHXP/CncFda1tSV+Or
 qOgw99A3P0gaewYHAKyU0h+kSO0oZYWq963H+JtqE9D1FV4aDHM7iN3mEyJQtWtnFAet
 sH0M0xkWbqfppl/X59AqHuAA1MltKLTX3u0eBlk6t0R7m5roCM65fng3UediwXDk+vwE
 8A0Q==
X-Gm-Message-State: AO0yUKXkwVXExWwl5emDNEGhpxd1yArULjTFUiLTZq9yqnyB4hvyKqst
 3FejH0InaDNRDlfmY2tchMe34w==
X-Google-Smtp-Source: AK7set/ktKqM/55jtfwdJMWNJg05JOxUxhxDHLnnwr46Rshw2+kcjSnybJooNOdUcv7PtHFMVWIyiA==
X-Received: by 2002:a05:600c:444f:b0:3eb:1ba8:7cfc with SMTP id
 v15-20020a05600c444f00b003eb1ba87cfcmr7830965wmn.30.1677755723656; 
 Thu, 02 Mar 2023 03:15:23 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b003e7f1086660sm2775892wmo.15.2023.03.02.03.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:15:23 -0800 (PST)
Message-ID: <eb6e47c4-546e-b191-d142-009b52b1e3fa@linaro.org>
Date: Thu, 2 Mar 2023 12:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado, 
 windows)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 2/3/23 11:56, Peter Maydell wrote:
> On Wed, 1 Mar 2023 at 19:47, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>  From the other thread:
>>
>> I think the underlying config needs updating:
>>
>>    .git/modules/tests/fp/berkeley-testfloat-3/config
>>
>> I'm surprised the git config for submodules doesn't carry the metadata.
> 
> Yeah, in my local repo that I merge stuff with that file
> does still have a github URL:
> url = git://github.com/cota/berkeley-testfloat-3
> 
> So I guess my questions are:
>   (1) why hasn't this been a problem up til now ?
>   (2) does this mean that if I merge this then everybody will
>       need to manually go in and update this file somehow
>       to be able to pull the updated qemu master ?

I assume you are not passing --disable-git-update or
--with-git-submodules to ./configure.

I am not, and each time I run 'make' it annoyingly calls 'git
submodule update':

$ make check-qtest
   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 
tests/fp/berkeley-softfloat-3 dtc

Maybe we should also call 'git submodule sync' first?

