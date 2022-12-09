Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D633648612
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:00:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3fmp-0002nx-Ak; Fri, 09 Dec 2022 10:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fmo-0002no-8C
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:59:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fmm-0002Oj-Ec
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:59:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id bx10so5671022wrb.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bw7Aoc9TBGDKVnfCRbIvEXEPq1L1+c0oJWXZvopii8A=;
 b=PZ/MbZgvA3KjYr9FN+WF4BoQDz+iekWDezdDXBGRf+PIj2JMe/nn7Op8g/eVeLjyux
 NqaZkoE3hOfVRf4azSrXhbyG0p15SNczgl4BL6Iq3HjuHnP4M4n+PsXxdUo7hg4ZiHAA
 PWmLtmUxmIQHL1cONojfvQZ4bnsk+gOhMP2hGd/nfQ8LoWHI6ge+bEcxw+cuZ7IkzLko
 MTK2qbfuRSigzLW0axaw0QKCHqVgfHeLKXaPzprGgoExAFgMyc7Xw1+LE9oVvcPOR9V8
 54E1nvQnsVBz8DoLB5cslbpVofBvlr0xewfxNHoppfY18wLz8XTjFJBbHLH/VaCloQ80
 UEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bw7Aoc9TBGDKVnfCRbIvEXEPq1L1+c0oJWXZvopii8A=;
 b=hEG7lwbBn5DslFAwQi4uFa7yGPOxOo+MLf5whDAz0L4SpKjtAuQsQHNze6b9aZgXVq
 87U28LGaj9vjoqJDIQnszO1o7/ca+4E6AHDABTT4fcBNGO/uO83ZtAiHaWHBrLxPlgHr
 LIkEZFhATMMq7BNQAsST7I422UT7y9ilpRmB/BIO2eZst0J82ROEEL0aaUiMKYWzq2xX
 X07GC+7WyR8qDY3XV09EDq2aH1TUvr4s+mncGnSWDurYrcdtMh6E72kLO+1X/vkIRew7
 Do030PpXsKojTtF8FEXiMJHD12kexuS04poxk43QgmDyjvbzVqUrKwQf/WMkxnPPnm6f
 oWkQ==
X-Gm-Message-State: ANoB5pnpVnvRcEFzgo0DoiWNf0qHnKJ/KcBvNOZVj3JbpciC8s6UU3QN
 +T511eRmmrdizwa2luV/TUem0A==
X-Google-Smtp-Source: AA0mqf6QmDkkeGDigw4OTL9/GP74yN/xJFC5f2eWosphREMsE2BE2j92/zi7vEhYUdDtwhHsl7jhAw==
X-Received: by 2002:a5d:498f:0:b0:242:297e:5f01 with SMTP id
 r15-20020a5d498f000000b00242297e5f01mr5467490wrq.16.1670601578762; 
 Fri, 09 Dec 2022 07:59:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n3-20020a056000170300b002368f6b56desm2148302wrc.18.2022.12.09.07.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 07:59:38 -0800 (PST)
Message-ID: <fe2bc5da-5bb8-bf96-307a-839c10c163b0@linaro.org>
Date: Fri, 9 Dec 2022 16:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: Target-dependent include path, why?
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
References: <87edt9gnyz.fsf@pond.sub.org>
 <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
 <87v8mlez92.fsf@pond.sub.org>
 <55b06ba2-cd46-b9f0-c789-0cc39101a007@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <55b06ba2-cd46-b9f0-c789-0cc39101a007@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 16:02, Richard Henderson wrote:
> On 12/9/22 02:51, Markus Armbruster wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> On 12/8/22 23:12, Markus Armbruster wrote:
>>>> I stumbled over this:
>>>>       ../include/ui/qemu-pixman.h:12:10: fatal error: pixman.h: No 
>>>> such file or directory
>>>>          12 | #include <pixman.h>
>>>>             |          ^~~~~~~~~~
>>>> Works when included into target-dependent code.
>>>> Running make -V=1 shows we're passing a number of -I only when 
>>>> compiling
>>>> target-dependent code, i.e. together with -DNEED_CPU_H:
>>>>       -I/usr/include/pixman-1 -I/usr/include/capstone 
>>>> -I/usr/include/spice-server -I/usr/include/spice-1
>>>>       -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4 
>>>> -I/usr/include/PCSC
>>>>       -isystem../linux-headers -isystemlinux-headers
>>>> Why?
>>>
>>> Because of where [pixman] is added as a dependency in meson.build.
>>
>> Is it added where it is for a reason, or is it accidental?
> 
> I don't know for sure, but I doubt it's accidental.
> I'm sure it is where it is based on existing usage.

I hit a similar problem while converting units to be target-independent,
moving them out of specific_ss[] I got:

  In file included from ../monitor/misc.c:38:
  In file included from include/ui/console.h:4:
  include/ui/qemu-pixman.h:12:10: fatal error: 'pixman.h' file not found
  #include <pixman.h>
           ^~~~~~~~~~

The monitor/ dependency is odd because there is no pixman use in the
sources, only pulled by the headers:

   $ git grep pixman monitor/
   monitor/meson.build:9:specific_ss.add(when: 'CONFIG_SOFTMMU', 
if_true: [files('misc.c'), spice, pixman])

We require pixman for system emulation. The dependency is added in 
ui/meson.build:

   softmmu_ss.add(pixman)
   specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: pixman)   # for 
the include path

Due to the second line, I was expecting all files in specific_ss[] to 
have pixman path in their CPPFLAGS. The monitor/meson.build has:

   specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('misc.c'), 
spice])

Paolo, is it due to the [] that monitor/misc.c doesn't get the pixman
pkg-config flags?

