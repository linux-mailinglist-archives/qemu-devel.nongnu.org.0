Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831DC489A30
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:42:16 +0100 (CET)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uwB-0000pT-BU
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:42:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uV6-0002vT-O1; Mon, 10 Jan 2022 08:14:16 -0500
Received: from [2a00:1450:4864:20::432] (port=44962
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uV5-0000Z6-2g; Mon, 10 Jan 2022 08:14:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id k18so26641160wrg.11;
 Mon, 10 Jan 2022 05:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gmf4xqJXxyXkF5qfeJlThsXlOj8H8mgs/1ID34gLhaU=;
 b=VFfQOOEeoZm4tfr4WaS/vkVQ4PjCthqlupXLH+3db5L/FFMiIdcd3R9QPGDEeDmVx6
 6VnE7KLoiOCt7UqZhfLB85ggcm24eWrq093s8GLqzGPDxKLS83L5WgIQTH4GCD27ZTh0
 lXHuisbMzgXrhUYxvbUyAjhjFZwiQNHmIJVmYkgHm9BWS1pmL8LSXmLQgXcBRHtP7zQR
 gXHv5rTKeMxNxcNqBUEus/JxMQiR2HJmB6fbPvB7DIBVUJpawACGakoOkciGBtjz8KtJ
 W+1KY2ZpZ5juDFeVHI6utUOgiaF+tzzIforYavnsvIX7P4h7+ep2CdvI0E+OEHDJUoqL
 TkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gmf4xqJXxyXkF5qfeJlThsXlOj8H8mgs/1ID34gLhaU=;
 b=awKTdOzyarUsD/j3lB8z1B/QuS7l2qxJaoYrRjVvbngAdVpvQt9vDLHePfWx6QITGE
 2Vz42gn01Wd+3jWNLzvqW1D66zD+vrkxUGBmwQYyS75DJeoqITpWx/WZwa15YLzj0f2a
 s+COumi8LxFN2wvqrgzH6gG1tx+gXLBV9wgzFm8aJ8+sdNZLnFN2bBNxCNsK8CZJ/dpq
 hsf2EOwEN5mbPFpAoyctAMEL32YWiGKQW4x26/UsLDgrWX7bWhxKhcP5Wa1yYJ3MSZrB
 rAexgDjU0tgjEd2JLwLixC8RiWthZvXmIlQ3Yzh5mt3Ag+TQLhMmJrZRkjQ4ZLWK/G76
 SLjg==
X-Gm-Message-State: AOAM5303wDV/PaFnXEqnajWvuLsbyQK8Q8QXUJDF6yZo+0MZKQq+mp+8
 qq6/NvmDJZuoBMXwUOEU9Xg=
X-Google-Smtp-Source: ABdhPJyPwAI4U2deVCkQkwexUqzVzCEUqHZYWPk44TkYMF1wGnPpngXxE8a174cF/mphYu1+6c3qxg==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr64946473wry.246.1641820453539; 
 Mon, 10 Jan 2022 05:14:13 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id e13sm6753801wmq.10.2022.01.10.05.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 05:14:13 -0800 (PST)
Message-ID: <4aeeeb4d-e778-6878-9e6e-c381c02f97c0@amsat.org>
Date: Mon, 10 Jan 2022 14:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <20220109170612.574104-1-f4bug@amsat.org>
 <742a1bca-1150-c277-c498-3815ef956f58@amsat.org>
 <4993ab11-570b-2bd7-a9b9-c6ddc9af5802@amsat.org> <2147921.xlN1UyrzLN@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <2147921.xlN1UyrzLN@silver>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 14:07, Christian Schoenebeck wrote:
> On Montag, 10. Januar 2022 13:24:06 CET Philippe Mathieu-Daudé wrote:
>> On 1/10/22 09:44, Philippe Mathieu-Daudé wrote:
>>> On 1/10/22 09:17, Akihiko Odaki wrote:
>>>> On 2022/01/10 2:06, Philippe Mathieu-Daudé wrote:
>>>>> When building on macOS 12 we get:
>>>>>
>>>>>    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster'
>>>>> is deprecated: first deprecated in macOS 12.0
>>>>> [-Werror,-Wdeprecated-declarations]
>>>>>        kAudioObjectPropertyElementMaster
>>>>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>        kAudioObjectPropertyElementMain
>>>>>   
>>>>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frame
>>>>> works/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note:
>>>>> 'kAudioObjectPropertyElementMaster' has been explicitly marked
>>>>> deprecated here
>>>>>        kAudioObjectPropertyElementMaster
>>>>> API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain",
>>>>> macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0))
>>>>> = kAudioObjectPropertyElementMain
>>>>>        ^
>>>>>
>>>>> Use kAudioObjectPropertyElementMain (define it to
>>>>> kAudioObjectPropertyElementMaster on macOS < 12).
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>>   audio/coreaudio.c | 16 ++++++++++------
>>>>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>>>>> index d8a21d3e507..c836bc9dd37 100644
>>>>> --- a/audio/coreaudio.c
>>>>> +++ b/audio/coreaudio.c
>>>>> @@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
>>>>>       bool enabled;
>>>>>   } coreaudioVoiceOut;
>>>>>   +#if !defined(MAC_OS_VERSION_12_0)
>>>>> +#define kAudioObjectPropertyElementMain
>>>>> kAudioObjectPropertyElementMaster
>>>>> +#endif
>>>>> +
>>>>
>>>> Semantically MAC_OS_VERSION_12_0 defines the numeric value of version
>>>> 12.0 and its existence does not mean that
>>>> kAudioObjectPropertyElementMain is defined. I suggest the following:
>>>> #if !__is_identifier(kAudioObjectPropertyElementMain)
>>>> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
>>>> #endif
>>
>> Apparently __is_identifier() is Clang specific. It might be acceptable
>> since this file is restricted to macOS. Similarly for the other
>> block/file-posix.c patch, the section is conditional to  __APPLE__
>> being defined.
> 
> Correct, __is_identifier() is a clang extension and does not work with GCC
> (tested). I would not use it. People on Mac usually use clang, but there are
> also cross compilers for macOS binaries.
> 
> I'd suggest to use:
> 
> #if !defined(MAC_OS_VERSION_12_0) ||
>     (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> #endif

Uh I just posted v3. I didn't test GCC. I'll wait for more comment on v3
then repost v4 with your suggestion, thanks.

