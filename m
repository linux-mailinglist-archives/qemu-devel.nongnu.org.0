Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7933C6786
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:38:58 +0200 (CEST)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m36Rt-0002nl-Es
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m36Qi-000274-Fb
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 20:37:44 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m36Qg-0006IQ-Dh
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 20:37:43 -0400
Received: by mail-pg1-x533.google.com with SMTP id v7so20073033pgl.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 17:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=THgrfmxcMhsy/85+wUM3iFA+w7ocvLyzY2mPeLFVkpQ=;
 b=cLrcwpG2k5ja7OQ0vGnf5M2nCWdxVAWG5OEd/eHr6km0OG7gB+um435xu2kTQ/41x2
 8cfzjboG53iHHrGanDLdpyQI6kTIc0mloMVSuKec1Ga152v7hjVcdr19/YZC1uXwnRg3
 PMivDUQnpTFS7WMF9ct8oL9D10NP02vTnZ48dvBzYKBc6U+2CBgei6QTUPguWPGMLFh8
 9FaqtaBzqz/icRbtvY+kDCgKElSxmsDVjqfJDzgbRYSTcE6pZdGo3Lbjwr4kZzRPUeqf
 iuciphnR3tYDhpkj6ml9Dec8eD6aFZQMZFXjJ9kGWANmxJO4gJd0REE8JoFgDTkgtjXI
 Senw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=THgrfmxcMhsy/85+wUM3iFA+w7ocvLyzY2mPeLFVkpQ=;
 b=jS/rGhR8ItwtpnVHTd2j3yPp1lnK6vGNzpE6qjI7s2wtiFvSeb150wPuNt3Op4mp9M
 Gn8WK4VDpSq4fTMBEG2oHgVxu5umvsSgN5DvyAzWW364Bxn32DT8nNIKXtfZwwchdXt/
 nxmO554LJevAnCjvvkBlb/gCHDiOJ+9f+dSRV+RWFYmiw0+Og4RaspTSqXTUDE4lHbxa
 nqSJQ/L/XGGjV3m5fdpq82z5hXYrYUp/Y+hmfIC+o9yZmb//pKLVx7xh49H5PZKllujf
 lJa7rVXcTg3BIN0fcMwt9EY7pJo1Sxd9A7Y9jqASLRY8vqGujXrcivmR1H8jIwfrux5a
 nNTg==
X-Gm-Message-State: AOAM533qxCpoyzcxtG/f32qn6CNsQloqZ58lmKgE3elB+ZRzj0n/fqHL
 J0hpxeaqNPdLd0GbDEdFuZgABA==
X-Google-Smtp-Source: ABdhPJySVQIh6Xn2MpO2jU1mHu/yZ4SHms3zviJWGgnBcNUMlXaRjy/8rtRLprG11l7/zoUqwieI2Q==
X-Received: by 2002:a05:6a00:1822:b029:32b:cf78:405 with SMTP id
 y34-20020a056a001822b029032bcf780405mr1659981pfa.80.1626136660677; 
 Mon, 12 Jul 2021 17:37:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n56sm16579450pfv.65.2021.07.12.17.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 17:37:40 -0700 (PDT)
Subject: Re: [PATCH 0/3] Atomic cleanup + clang-12 build fix
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
 <f186b5b5-8db2-a43b-d5cc-2563d76c7211@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67a16913-363a-8157-d5fc-1350702b431b@linaro.org>
Date: Mon, 12 Jul 2021 17:37:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f186b5b5-8db2-a43b-d5cc-2563d76c7211@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.479,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 2:30 PM, Cole Robinson wrote:
> On 7/12/21 11:59 AM, Richard Henderson wrote:
>> The first two patches are not strictly required, but they
>> were useful in tracking down the root problem here.
>>
>> I understand the logic behind the clang-12 warning, but I think
>> it's a clear mistake that it should be enabled by default for a
>> target where alignment is not enforced by default.
>>
>> I found over a dozen places where we would have to manually add
>> QEMU_ALIGNED(8) to uint64_t declarations in order to suppress
>> all of the instances.  IMO there's no point fighting this.
>>
> 
> I tested your patches, they seem to get rid of the warnings. The errors
> persist.
> 
> FWIW here's my reproduce starting from fedora 34 x86_64 host:
> 
> $ sudo mock --root fedora-35-i386 --install dnf --install dnf-utils
> --install fedora-packager --install clang
> $ sudo mock --root fedora-35-i386 --shell --enable-network
> # dnf builddep -y qemu
> # git clone https://github.com/qemu/qemu
> # cd qemu
> # CC=clang CXX=clang++ ./configure --disable-werror
> # make V=1

Ho hum.  So, the warnings are where clang has decided to insert calls to libatomic.

So we either have to

(1) work around all of the places, which, unless we set up an i386 clang-12 builder will 
quickly bitrot, or

(2) write our own routines, compatible with libatomic, using cmpxchg8b directly.  which 
requires no (extra) locking, and so is compatible with the tcg jit output, or

(3) file a bug with clang, and document "use clang-11 and not clang-12".


Thoughts?


r~

