Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A3348A10A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 21:42:44 +0100 (CET)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n71V4-0006mT-Tr
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 15:42:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n71SD-0004wb-PE; Mon, 10 Jan 2022 15:39:45 -0500
Received: from [2607:f8b0:4864:20::62e] (port=46637
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n71S4-0000jR-8K; Mon, 10 Jan 2022 15:39:37 -0500
Received: by mail-pl1-x62e.google.com with SMTP id w7so13757105plp.13;
 Mon, 10 Jan 2022 12:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EB9fZtGbzpyP8qznYgVF8fgLOun4W7A51EkqoLJdB60=;
 b=A2e8489y56kZETouL9FuAAQbpj/3JqdLn6I4/D52Dy9MtIQqmYCh1B+yBjQErz2+Ay
 vTsAq+lY/r8fbB5xTHGtgomSe6N3RglJhPaWCWM1tcNu4JPkThQGFYMypCEAOhrLtqQJ
 H2Pf6XBJsIGGJrB581VBqqsn13KNCujCuHLGPizYAeyhV8ux4nQOK9AIEiGrHM2fQ763
 f8gXKSlnJfmsltYIps0nuq/7ewFz9H/PJ+xOMHCuK2toAFenAzM7mx7p5XuGpnWrEsop
 ofsKgHhWNpZ+Kb10x0dPG/08rCO5CNp9DzEcAtS4yk0nGeTuwKmH40/hmY5qeDlJEplF
 /iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EB9fZtGbzpyP8qznYgVF8fgLOun4W7A51EkqoLJdB60=;
 b=PbuR8Mc+tEpe1GdDIsFqJOL4XSyHR31ymoeybNP1A8lxj19WcpUsIbnSz7aY0i4QDx
 sSK4wz0s5kb81GcxwUcG/T6d5XtB4pOnCNNg0rMjbqi2XxQSs6fURTkJPgmHBHKGTklz
 7gbalaf4wbTzxKvS4lma4jF5peMF667uTrQF8jh9lmL8E2DO7aqJyVZOhxWiF0RKWgM5
 exfSAIGYdjTIpfd3r/iRSXT7NOt0BH1/Rk5qVv5FBau+hIqNwKTWHrwCozEFi3MJYL9L
 b5X+6EGdQkjWqNL7rgqIxNsJmcFyQdpFk9JQEUJBAmvrJptZEduoqhNw+mLgpTK777xx
 2ZgQ==
X-Gm-Message-State: AOAM532ozDS6LeoTi+rjlZTARXMAUTL4e9wQ2IA2mfNpjfFsqdohUAqg
 sjo/KvbdrTJ8sOgg930jUXk=
X-Google-Smtp-Source: ABdhPJw4Sk6WtYLOkP9uFBLoz+naPPOtkpJLDIKwZQLAYWpy1dKhAn+BSqGQCLuHj7IVNu/9VbeNVA==
X-Received: by 2002:a63:243:: with SMTP id 64mr1186868pgc.557.1641847173299;
 Mon, 10 Jan 2022 12:39:33 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 h2sm8170221pfh.55.2022.01.10.12.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 12:39:33 -0800 (PST)
Message-ID: <246f1f6f-3674-e3dc-3a8e-f53795fa58cc@gmail.com>
Date: Tue, 11 Jan 2022 05:39:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20220109170612.574104-1-f4bug@amsat.org>
 <2798332.tR5H1UBy9i@silver> <524515d6-2fb5-15c1-0aaf-bcda3684cd00@gmail.com>
 <5230139.pYjDmQ3FvW@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <5230139.pYjDmQ3FvW@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/01/11 5:22, Christian Schoenebeck wrote:
> On Montag, 10. Januar 2022 20:01:40 CET Akihiko Odaki wrote:
>> On 2022/01/11 3:46, Christian Schoenebeck wrote:
>>> On Montag, 10. Januar 2022 19:20:15 CET Akihiko Odaki wrote:
>>>> On 2022/01/10 22:22, Peter Maydell wrote:
>>>>> On Mon, 10 Jan 2022 at 13:14, Christian Schoenebeck
>>>>>
>>>>> <qemu_oss@crudebyte.com> wrote:
>>>>>> I'd suggest to use:
>>>>>>
>>>>>> #if !defined(MAC_OS_VERSION_12_0) ||
>>>>>>
>>>>>>        (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
>>>>>>
>>>>>> #define kAudioObjectPropertyElementMain
>>>>>> kAudioObjectPropertyElementMaster
>>>>>> #endif
>>>>>
>>>>> This is also how we do this for existing checks of this sort,
>>>>> like the one in osdep.h for qemu_thread_jit_execute().
>>>>>
>>>>> -- PMM
>>>>
>>>> If I understand correctly, Many macOS-specific codes already no longer
>>>> complies with GCC because they depend on modern features GCC doesn't
>>>> provide. The most problematic construction is block; it is extensively
>>>> used by Apple's ABI and API and you cannot avoid using it even if you
>>>> try.
>>>
>>> You mean Obj-C blocks? That's working with GCC for decades. I am not aware
>>> about any recent changes to Obj-C block mechanisms by Apple.
>>>
>>>> Also, note that MAC_OS_X_VERSION_MAX_ALLOWED defines the upper bound of
>>>> the supported version. The lower bound should be preferred here because
>>>> the usage of the new identifier is applied regardless of the version of
>>>> the host system. It is in contrary to the usage of
>>>> MAC_OS_X_VERSION_MAX_ALLOWED in osdep.h where the new interfaces are
>>>> used only for the newer versions. The lower bound is defined as
>>>> MAC_OS_X_VERSION_MIN_REQUIRED. Practically there is no difference of the
>>>> two macros because they have the same value in QEMU and
>>>> kAudioObjectPropertyElementMain is a constant resolved compile-time, but
>>>> it is still nice to have the code semantically correct.
>>>
>>> For this particular enum: no, MAC_OS_X_VERSION_MAX_ALLOWED is the correct
>>> one. This is about whether enum kAudioObjectPropertyElementMain is
>>> defined in the SDK header files. That's all. And the new enum
>>> kAudioObjectPropertyElementMain is pure refactoring of the enum's old
>>> name due to social reasons ("Master"). The actual reflected numeric value
>>> and semantic of the enum is unchanged and the resulting binary and
>>> behaviour are identical.
>>
>> There are a few problems with the usage of MAC_OS_X_VERSION_MAX_ALLOWED:
>> - The deprecation warning is designed to work with
>> MAC_OS_X_VERSION_MIN_REQUIRED. You may verify that with:
>> cc -mmacosx-version-min=12.0 -x c - <<EOF
>> #include <CoreAudio/CoreAudio.h>
>>
>> int main()
>> {
>>      int k = kAudioObjectPropertyElementMaster;
>> }
>> EOF
> 
> That's actually interesting. On other projects I definitely saw deprecated
> warnings before on API declarations that were deprecated at a version higher
> than the project's minimum deployment target.
> 
> Did they change that?

I don't think so. The behavior is documented at:
https://clang.llvm.org/docs/AttributeReference.html#availability
and the example refers to OS X 10.4, 10.6, 10.7. Probably they haven't 
changed the behavior for decades.

MacOSX.sdk/System/Library/Frameworks/Kernel.framework/Headers/os/availability.h 
says manually defining API_TO_BE_DEPRECATED can alter the behavior so 
that may be the case.

> 
>> - The programmer must be aware whether it is constant or not.
>> - The macro tells about the runtime and not the SDK. There is no way to
>> tell the SDK version and that is why I suggested __is_identifier at the
>> first place. However, now I'm convinced that
>> MAC_OS_X_VERSION_MIN_REQUIRED is the better option because of the above
>> reasons.
> 
> If you make it dependent on MAC_OS_X_VERSION_MIN_REQUIRED, people with older
> SDKs (e.g. Xcode <=13.0) would get a compiler error.

__is_identifier is the only option if you need a compatibility with the 
older SDKs while specifying a greater version for 
MAC_OS_X_VERSION_MIN_REQUIRED. It also applies to 
MAC_OS_X_VERSION_MAX_ALLOWED; they give the possible runtime versions 
and not the SDK version.

> 
> You are right about the deprecated warning not being emitted in the example
> above, currently not sure why, but I still think MAC_OS_X_VERSION_MAX_ALLOWED
> is the way to go in this case.

The page and the header file I referred the above would help 
understanding the behavior.

Regards,
Akihiko Odaki

> 
> Best regards,
> Christian Schoenebeck
> 
> 



