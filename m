Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154493C7289
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:45:05 +0200 (CEST)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jei-0002NM-4X
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3Jdh-0001fT-SM
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:44:01 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3Jdf-00073k-Rb
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:44:01 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso1975315pjx.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SSNMADkmWther4468dEjX615NeMNeGYsn1Z4M28P6yg=;
 b=wA2lZR3vjv0Yrc08uQQXyhTt8NCsVpRsBuX6p2ltEzobR3bDmyuyUy4xMC1+WFM3Qp
 LFIrn3MvIQcHnNukoB3qGkS3qMY2eEtryzjaNb8BoOxdT2rPGmTikb/KxntAyGVdf5/n
 Q0dTTgsUK4vK5ZNJkHc0VR63pl3A1UYNUlT1LLLAC6pFCkDYGu16GDAUsFM0rIwXonQY
 dg9RxuVKWEROBZc+MLNJ76k5zMjfOgU7iq3hUrN/u6QPCJjCbLC+KripBRsedy5U1oGb
 STmueFQUrTkerFpa7d+xDpGAQspun0os4R/srRL8z6wNSBVXWXOVD+UL64sEN34hJtg3
 fQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SSNMADkmWther4468dEjX615NeMNeGYsn1Z4M28P6yg=;
 b=WQ8XJwy6a1s+Z6Bw1JpkE4t1nFlXQWh2AlBccNM5PFTLjmTV37Fs8q2FYJ2juFQq6g
 ysEhGdUkpl4fV++iycCfjAFF3aQau/CgduElfBKeX8XemJD0DV9sSca4juUBduhynD6+
 /xL4xv8ljU168Rky2l69ToWqNWcXWRHK8JDQHuOF4CYy8OlKYOF3n++esacqQHje2NJ3
 kJl+5bS0LHhT0SAviCdebPQwEA5M7s0rDuGxvKt9o6tBEAts6UfxmdMXO5/2kvb0PF+n
 cVIUu5sS70rLoh9nuJXL+JJywMIFLs+vE5mAl5TxTP3q/OpEKVbU/4SeW8Gt3x/91tA5
 T6Jw==
X-Gm-Message-State: AOAM5317mvzLEg2ohkV75QvQ1RIPNAymndQgnBgU+MopHF4xCFi6DULD
 b1zAmgqa+a8ccH2wPZ6Bq/87WA==
X-Google-Smtp-Source: ABdhPJw8wZxlWDIcyC57gjRnR5AbEWmN2nava7D7+p9GZ+zpDYhk6XyhKtj3DriyFpn0xuXjejp+Sw==
X-Received: by 2002:a17:90a:a107:: with SMTP id s7mr322790pjp.1.1626187437307; 
 Tue, 13 Jul 2021 07:43:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y10sm17001456pjy.18.2021.07.13.07.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 07:43:56 -0700 (PDT)
Subject: Re: [PATCH 0/3] Atomic cleanup + clang-12 build fix
From: Richard Henderson <richard.henderson@linaro.org>
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
 <f186b5b5-8db2-a43b-d5cc-2563d76c7211@redhat.com>
 <67a16913-363a-8157-d5fc-1350702b431b@linaro.org>
Message-ID: <4cc4bbf6-d856-35ab-3687-3fce79b7f8d7@linaro.org>
Date: Tue, 13 Jul 2021 07:43:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <67a16913-363a-8157-d5fc-1350702b431b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.368,
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

On 7/12/21 5:37 PM, Richard Henderson wrote:
> On 7/12/21 2:30 PM, Cole Robinson wrote:
>> On 7/12/21 11:59 AM, Richard Henderson wrote:
>>> The first two patches are not strictly required, but they
>>> were useful in tracking down the root problem here.
>>>
>>> I understand the logic behind the clang-12 warning, but I think
>>> it's a clear mistake that it should be enabled by default for a
>>> target where alignment is not enforced by default.
>>>
>>> I found over a dozen places where we would have to manually add
>>> QEMU_ALIGNED(8) to uint64_t declarations in order to suppress
>>> all of the instances.  IMO there's no point fighting this.
>>>
>>
>> I tested your patches, they seem to get rid of the warnings. The errors
>> persist.
>>
>> FWIW here's my reproduce starting from fedora 34 x86_64 host:
>>
>> $ sudo mock --root fedora-35-i386 --install dnf --install dnf-utils
>> --install fedora-packager --install clang
>> $ sudo mock --root fedora-35-i386 --shell --enable-network
>> # dnf builddep -y qemu
>> # git clone https://github.com/qemu/qemu
>> # cd qemu
>> # CC=clang CXX=clang++ ./configure --disable-werror
>> # make V=1
> 
> Ho hum.  So, the warnings are where clang has decided to insert calls to libatomic.
> 
> So we either have to
> 
> (1) work around all of the places, which, unless we set up an i386 clang-12 builder will 
> quickly bitrot, or

Update: (1) is out.  There's a warning in cputlb.c vs a pointer that's known to be 
aligned, and it still fires.  I have filed a bug:

   https://bugs.llvm.org/show_bug.cgi?id=51076

> 
> (2) write our own routines, compatible with libatomic, using cmpxchg8b directly.  which 
> requires no (extra) locking, and so is compatible with the tcg jit output, or
> 
> (3) file a bug with clang, and document "use clang-11 and not clang-12".

So, Cole, with respect to (3), is this just general regression testing that discovered 
this (in which case, yay) or is there some other reason clang is required?

Assuming that (3) isn't really viable long term, I guess (2) is the only viable option.

Thoughts?


r~

