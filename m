Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A561FFF6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 21:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os9AT-0003H4-DS; Mon, 07 Nov 2022 15:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os9AR-0003Gv-U5
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 15:56:27 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os9AQ-0001bG-7Z
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 15:56:27 -0500
Received: by mail-wr1-x42c.google.com with SMTP id y16so17972995wrt.12
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 12:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eBVS+JWnpPDNmZjxQmuPnZe2Xj5IV54Uxa302JNPBmo=;
 b=Wx4ATbMRm/Bj6d2jHCTa+YGkt1TmXih8RyYDh6aTvZAYGYp3i3OYIRt0HuIHiQMCC3
 IrwdkDpBSDXv9fagHdCLYxVcJi05jvwHu3Z7Z8cxGRL5ox3G+LtTfyqRshbhzAX0C3/w
 QNOa4lPvy0r6hZlEiAxK9y8S+bLsfIIdiebDPR0ulk/Z1fbqXC5fligxHFdyKGu2ARr6
 KUdGO5dA7x9kVHu+Ns480E9m1xfjclQC3j1kWwxRrkbNj4ByUUH9mpeMnNfAgz61TIpA
 Ed2spCdmWWWwaDAI8mtA2i72gzFPs3yODdIsl1/L1r0Pkz+yKtsGYq4RerWFmakOEy0u
 nKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eBVS+JWnpPDNmZjxQmuPnZe2Xj5IV54Uxa302JNPBmo=;
 b=hIqt5Jsq6hxwlcuvnOiX7Z+5kBcu8ao7tmYcqzFfxWC8arHIRilZRtJqg3gbDeZN1k
 usozgPkQzCBhWl1CbY1lUt76SillTqmXyBXiodQHDUnEQX1i6XWZ5DmP8Hsqm4Cdfjww
 ALPyLK1FZPT5JrKef4+GJRnuE1h5gWOmF7c9GL5iKidM6jYL7x4txYSc6H3uvRPQ+4Vm
 6kBs/GblE8iWUvnirJXUaSiUZ/fuOgILERC4b5GEZ0h4AgvzUh8V0zFKK0kq3mXDKQm1
 YHfRCTGSM4ZpPjT/HLUkBCCgk/sEQZs3UoMZQXxIud6EmxN+AHPfNE8XhD/fpcKESe2/
 r5Yg==
X-Gm-Message-State: ACrzQf10mpRZPKtxMrNMUpPFMkpkCtaKv6ZcEW2mFjMErMn0GjDdutrt
 FPsmD3pEQwqWYAIgsHdBaPpPSw==
X-Google-Smtp-Source: AMsMyM4/Erzn2M621lUk20jHEgSRfZZC/3rTKyjN39T98QXzv2rINW8ABD3IISEz+A7AtRNFZZlnMA==
X-Received: by 2002:adf:e78d:0:b0:236:debd:f681 with SMTP id
 n13-20020adfe78d000000b00236debdf681mr25144696wrm.17.1667854584231; 
 Mon, 07 Nov 2022 12:56:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iw14-20020a05600c54ce00b003cf71b1f66csm9244663wmb.0.2022.11.07.12.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 12:56:23 -0800 (PST)
Message-ID: <f2008aa6-7852-86e2-ff55-faf2591bdf85@linaro.org>
Date: Mon, 7 Nov 2022 21:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RFC PATCH] tests/docker: allow user to override check target
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221107145227.1210499-1-alex.bennee@linaro.org>
 <ba915fd0-c542-cd7d-eb53-e4c2959429ad@linaro.org> <87o7tifyrp.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87o7tifyrp.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 7/11/22 18:40, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 7/11/22 15:52, Alex Bennée wrote:
>>> This is useful when trying to bisect a particular failing test behind
>>> a docker run. For example:
>>>     make docker-test-clang@fedora \
>>>       TARGET_LIST=arm-softmmu \
>>>       CHECK_TARGET="meson test qtest-arm/qos-test" \
>>>       J=9 V=1
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    tests/docker/Makefile.include | 2 ++
>>>    tests/docker/common.rc        | 6 +++---
>>>    2 files changed, 5 insertions(+), 3 deletions(-)
>>> diff --git a/tests/docker/Makefile.include
>>> b/tests/docker/Makefile.include
>>> index c87f14477a..ece0aa77df 100644
>>> --- a/tests/docker/Makefile.include
>>> +++ b/tests/docker/Makefile.include
>>> @@ -184,6 +184,7 @@ docker:
>>>    	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
>>>    	@echo '    EXTRA_CONFIGURE_OPTS="..."'
>>>    	@echo '                         Extra configure options.'
>>> +	@echo '    CHECK_TARGET="..."   Override the default `make check` target '
>>
>> s/target /target./
>>
>>>    	@echo '    IMAGES="a b c ..":   Restrict available images to subset.'
>>>    	@echo '    TESTS="x y z .."     Restrict available tests to subset.'
>>>    	@echo '    J=[0..9]*            Overrides the -jN parameter for make commands'
>>> @@ -230,6 +231,7 @@ docker-run: docker-qemu-src
>>>    			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=$(NETWORK)),--net=none) \
>>>    			-e TARGET_LIST=$(subst $(SPACE),$(COMMA),$(TARGET_LIST))	\
>>>    			-e EXTRA_CONFIGURE_OPTS="$(EXTRA_CONFIGURE_OPTS)" \
>>> +			-e CHECK_TARGET="$(CHECK_TARGET)" 		\
>>>    			-e V=$V -e J=$J -e DEBUG=$(DEBUG)		\
>>>    			-e SHOW_ENV=$(SHOW_ENV) 			\
>>>    			$(if $(NOUSER),,				\
>>> diff --git a/tests/docker/common.rc b/tests/docker/common.rc
>>> index e6f8cee0d6..f2769c1ff6 100755
>>> --- a/tests/docker/common.rc
>>> +++ b/tests/docker/common.rc
>>> @@ -63,12 +63,12 @@ check_qemu()
>>>    {
>>>        # default to make check unless the caller specifies
>>>        if [ $# = 0 ]; then
>>> -        INVOCATION="check"
>>> +        INVOCATION="${CHECK_TARGET:-make $MAKEFLAGS check}"
>>
>> Why pass MAKEFLAGS here?
> 
> That was just preserving previous behaviour. That said I think MAKEFLAGS
> only ever has J in it and perhaps for check_qemu we never want to parallise?

If we ever can, we certainly want to use it on CI :) And keep the 
non-parallelized version for manual runs. Anyhow not something to worry as
of today, since IIRC 'make check' + -jX  doesn't work well together.

OK, now I see you changed the full command invoked, so CHECK_TARGET
isn't a Make rule anymore, but a full command. Maybe rename it
TEST_COMMAND?

> 
>>
>>>        else
>>> -        INVOCATION="$@"
>>> +        INVOCATION="make $MAKEFLAGS $@"
>>>        fi
>>>    -    make $MAKEFLAGS $INVOCATION
>>> +    $INVOCATION
>>>    }
>>>      test_fail()
> 
> 


