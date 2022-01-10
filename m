Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D2489FE0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:08:55 +0100 (CET)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n702I-0004sJ-GW
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6zvP-00057l-8A; Mon, 10 Jan 2022 14:01:47 -0500
Received: from [2607:f8b0:4864:20::631] (port=40475
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6zvN-00021k-Dv; Mon, 10 Jan 2022 14:01:46 -0500
Received: by mail-pl1-x631.google.com with SMTP id l15so13356501pls.7;
 Mon, 10 Jan 2022 11:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UI+hx90zBN7RMzqr8Vym6vUxjQCrHSfTFoxWeDpFEX0=;
 b=gbSRcvZgPKPwrMMJONF8ZyshaUeZm4nEPz7QJOElAgTn2nYx2A0BPTavr55BtghPLn
 rb14OC5lgDk1Ly0YxQRs0/2zpJIhhyNpo7ubGUKgb6eHaQHefVZ0MXU5e6X6ieQpS7d2
 Nv1SiRa5KaAR4Da1eov9bfk6qhu2dZ4FDcbybKye/fHuokjVwoTpeBrd3aRFSt/OeDvZ
 kuP7/TsS1iw7Am11m3Sw7JW/oqqdRjJCNGShQgMkwdjs5b8QJOXZnHzP2kdAv9gh6cgr
 S0tWT6N5U+i6HOCKCTCTzWWulSxzrgdTRnlStjr30M6JNLa2D6mreAH2U8nREITtCGZA
 eqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UI+hx90zBN7RMzqr8Vym6vUxjQCrHSfTFoxWeDpFEX0=;
 b=FJoRBLKvd+Z1/EfHYI4ORgu9Wk/Koe4ZfKvdhLm9GWH2nrtA+N7Q01CQjVFTCufjCL
 OKoKjR3zRa5/56Sxt03gSy9u9r4aVlMQ/CX08CGYhpMZq1WuxxMrMh+kuyecYvnxnyu8
 eDkHzVrXRtRWJosohgtjkmSSwz/d0oVmiJLnd9VAo9O79n8rFK4sppF5rtVPc3Cp2gK1
 eja7X/uhiqiult9ANOkUh1wAgb4K33QhtgwNnzkJneMfSWL4QN3w+bviwJKCnESETcg8
 i++Q0DscIjFy/vihWzTe7R8JJAQtbHAdn+wwFuvbXnVR4EsMQfgm/eKUb1L9t6h4OGh2
 poVg==
X-Gm-Message-State: AOAM530kEFd/3BHHEuYV96pKHXruMAAeOLVet7yJWb51O+9BO1ZAbtdS
 MBcrEtXJDcO1OD8CgZIajdM=
X-Google-Smtp-Source: ABdhPJw8ltep8PA6By3Bv5Z4Ed8TB7xSNlPqOzvEtXmp2nQhCKQSoklaILedWASG/Vy+Iz0m5A6czA==
X-Received: by 2002:a17:902:e98b:b0:14a:3d97:e678 with SMTP id
 f11-20020a170902e98b00b0014a3d97e678mr849830plb.40.1641841303683; 
 Mon, 10 Jan 2022 11:01:43 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 bo15sm3204332pjb.16.2022.01.10.11.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 11:01:43 -0800 (PST)
Message-ID: <524515d6-2fb5-15c1-0aaf-bcda3684cd00@gmail.com>
Date: Tue, 11 Jan 2022 04:01:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <20220109170612.574104-1-f4bug@amsat.org>
 <CAFEAcA94iQ_-dkNaQD62qSb_5emY5mq=OvR8jAbDkcW0YwUoeA@mail.gmail.com>
 <9c016476-6679-5d23-296a-6546930087cd@gmail.com> <2798332.tR5H1UBy9i@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <2798332.tR5H1UBy9i@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/01/11 3:46, Christian Schoenebeck wrote:
> On Montag, 10. Januar 2022 19:20:15 CET Akihiko Odaki wrote:
>> On 2022/01/10 22:22, Peter Maydell wrote:
>>> On Mon, 10 Jan 2022 at 13:14, Christian Schoenebeck
>>>
>>> <qemu_oss@crudebyte.com> wrote:
>>>> I'd suggest to use:
>>>>
>>>> #if !defined(MAC_OS_VERSION_12_0) ||
>>>>
>>>>       (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
>>>>
>>>> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
>>>> #endif
>>>
>>> This is also how we do this for existing checks of this sort,
>>> like the one in osdep.h for qemu_thread_jit_execute().
>>>
>>> -- PMM
>>
>> If I understand correctly, Many macOS-specific codes already no longer
>> complies with GCC because they depend on modern features GCC doesn't
>> provide. The most problematic construction is block; it is extensively
>> used by Apple's ABI and API and you cannot avoid using it even if you try.
> 
> You mean Obj-C blocks? That's working with GCC for decades. I am not aware
> about any recent changes to Obj-C block mechanisms by Apple.
> 
>> Also, note that MAC_OS_X_VERSION_MAX_ALLOWED defines the upper bound of
>> the supported version. The lower bound should be preferred here because
>> the usage of the new identifier is applied regardless of the version of
>> the host system. It is in contrary to the usage of
>> MAC_OS_X_VERSION_MAX_ALLOWED in osdep.h where the new interfaces are
>> used only for the newer versions. The lower bound is defined as
>> MAC_OS_X_VERSION_MIN_REQUIRED. Practically there is no difference of the
>> two macros because they have the same value in QEMU and
>> kAudioObjectPropertyElementMain is a constant resolved compile-time, but
>> it is still nice to have the code semantically correct.
> 
> For this particular enum: no, MAC_OS_X_VERSION_MAX_ALLOWED is the correct one.
> This is about whether enum kAudioObjectPropertyElementMain is defined in the
> SDK header files. That's all. And the new enum kAudioObjectPropertyElementMain
> is pure refactoring of the enum's old name due to social reasons ("Master").
> The actual reflected numeric value and semantic of the enum is unchanged and
> the resulting binary and behaviour are identical.


There are a few problems with the usage of MAC_OS_X_VERSION_MAX_ALLOWED:
- The deprecation warning is designed to work with 
MAC_OS_X_VERSION_MIN_REQUIRED. You may verify that with:
cc -mmacosx-version-min=12.0 -x c - <<EOF
#include <CoreAudio/CoreAudio.h>

int main()
{
    int k = kAudioObjectPropertyElementMaster;
}
EOF
- The programmer must be aware whether it is constant or not.
- The macro tells about the runtime and not the SDK. There is no way to 
tell the SDK version and that is why I suggested __is_identifier at the 
first place. However, now I'm convinced that 
MAC_OS_X_VERSION_MIN_REQUIRED is the better option because of the above 
reasons.

> 
> There are other cases where MAC_OS_X_VERSION_MIN_REQUIRED (a.k.a. "minimum
> deployment target") would be used instead: macOS APIs that might be available
> to only some, but not to the entire macOS version range officially supported
> by the rolled out binary. Did you see any particular case where this is
> incorrectly used in QEMU?
> 
> Best regards,
> Christian Schoenebeck
> 
> 
Assuming the correctness of the use MAC_OS_X_VERSION_MAX_ALLOWED is 
irrelevant with the nature of the identifier (constant or not), the same 
problem is in ui/cocoa.m:
#ifndef MAC_OS_X_VERSION_10_13
#define MAC_OS_X_VERSION_10_13 101300
#endif

/* 10.14 deprecates NSOnState and NSOffState in favor of
  * NSControlStateValueOn/Off, which were introduced in 10.13.
  * Define for older versions
  */
#if MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_13
#define NSControlStateValueOn NSOnState
#define NSControlStateValueOff NSOffState
#endif

Regards,
Akihiko Odaki

