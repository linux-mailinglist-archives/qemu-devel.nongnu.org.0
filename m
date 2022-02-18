Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD864BAF3E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 02:49:16 +0100 (CET)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKsOZ-00042d-6P
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 20:49:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKsLw-0002nf-Ed
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 20:46:34 -0500
Received: from [2607:f8b0:4864:20::52e] (port=37842
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKsLo-0004bp-UE
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 20:46:31 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 75so6553489pgb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 17:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UzTa6FUzl9cUH8d4WDVf4JN6NZm4r4pOESta1Sw9U7M=;
 b=gNKqRzOlvXnKaY/E6MRDoy+iHxQaBNmF1+N6Evm1ygZ91YoKKI/oUgESBLlQ8Pb31B
 tu4sk5pB8HdqfAK2AiQ+AJ7ic/C+qJfX2YC7Im+RLt9SCtKOH6DlHGlkepCZY/GosT17
 fLZ0uzc+lf8jmczcrAFKFcj7rOrVwxrE28d4q0rS5yQ9YVBQZALZ4CxvgTb++hcWh5Vo
 hxlxZq6bbzpGjLcKc0UZYqenWienWnTI1woog11F+RTT3AofulQvxbJOKJuPAmf0COkH
 NjQFf3BG4MPFprM38qeJiBN2BgF3AyHmpoH9sICS/8MzTY1cFySEntHpGdPOafpKIHgM
 4mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UzTa6FUzl9cUH8d4WDVf4JN6NZm4r4pOESta1Sw9U7M=;
 b=Pb4x7ZdA9HBqBFeD5ZysW9m6FKMG7X5C2S5N5SkVUmZgtSLKOwYSrWJPMDBkTltg6M
 O7Jfk3lnFBGqFaomCHElYkhL9YQq4Xc1JwfJAx2P0UdLw31p7KJ5NQNHgobwamRwLwu/
 UxfygRgTiZGygNwx6QlNoQX6JbsqU2Dgz81bH89CtpWrrgAIvmnedFqw5noqInc3FS28
 flVvkI2wwhrDBHWu/OG7B+ABB1BMkif1j3UFAHZxTiBCyHaIrgjMhY0YTqvr3CPyix/I
 aKzqbgc4yei5ahVxkAnDwpOfw2uc8Wgm5zTTFGvdXolgeFZ6Shs8BaiPPzhA1I+3pCva
 6oBg==
X-Gm-Message-State: AOAM5336Xg+jGXeskti1ZOnNQ8ghYQq6WGvU98p1LDp1KbQGTNKmKV5A
 lUHGgwS9v1iCvQ4vIQCkOTEEaw==
X-Google-Smtp-Source: ABdhPJw8/bhN3yVE34X2Pqs5Q8wC62sxQbgagcxg9Y3EzIHFyn86s6XMinhnNLnOCbEBpFTrWAbM1A==
X-Received: by 2002:a63:ed4c:0:b0:373:1bea:2711 with SMTP id
 m12-20020a63ed4c000000b003731bea2711mr4473307pgk.178.1645148783263; 
 Thu, 17 Feb 2022 17:46:23 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id j12sm8857695pgf.63.2022.02.17.17.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 17:46:22 -0800 (PST)
Message-ID: <94417e74-a2e8-f23d-b4fd-e53c9d3c8323@linaro.org>
Date: Fri, 18 Feb 2022 12:46:15 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
 <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
 <5356ac8a-cfbf-cfcb-13c5-872ecaf7bed2@amsat.org>
 <996032dd-4f00-6480-a485-80d49fb70c67@gmail.com>
 <02c7d441-815b-2fd8-21dc-8357b5cd6ebb@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <02c7d441-815b-2fd8-21dc-8357b5cd6ebb@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Andrew Jones <drjones@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 04:18, Philippe Mathieu-Daudé wrote:
> On 16/2/22 17:42, Akihiko Odaki wrote:
>> On 2022/02/17 0:08, Philippe Mathieu-Daudé wrote:
>>> On 16/2/22 11:19, Richard Henderson wrote:
>>>> These should have been supplied by libgcc.a, which we're supposed to be linking 
>>>> against. Something is wrong with your installation.
>>>
>>> I don't have gobjc/g++ installed, so ./configure defaulted to Clang to
>>> compile these languages, but compiled C files using GCC. At the end the
>>> Clang linker is used (the default c++ symlink).

This is another form of compiler mis-configuration.
If you don't have g++ to go with gcc, use --cxx=false to avoid picking up a different 
compiler.

>>> Could there be a mismatch between Clang (-mno-outline-atomics) and GCC
>>> (-moutline-atomics)?

I have no idea if those options do the same thing.

>> I think you have to instruct Clang to use libgcc instead of compiler-rt and link the 
>> objects with GCC. Here is the documentation of Clang about the runtime I could find:
>> https://clang.llvm.org/docs/Toolchain.html#libgcc-s-gnu
> 
> Thanks for the pointer. And the next section is
> https://clang.llvm.org/docs/Toolchain.html#atomics-library :)
> 
>    Clang does not currently automatically link against libatomic when
>     using libgcc_s. You may need to manually add -latomic to support
>    this configuration when using non-native atomic operations (if you
>    see link errors referring to __atomic_* functions).
> 
> I'll try that.

-moutline-atomics is *not* the same as libatomic.
You should not need libatomic at all.


r~

