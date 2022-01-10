Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8958E489421
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:47:54 +0100 (CET)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qLJ-0002Bk-75
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6qHs-0008BK-GS; Mon, 10 Jan 2022 03:44:21 -0500
Received: from [2a00:1450:4864:20::333] (port=38615
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6qHq-00060y-EP; Mon, 10 Jan 2022 03:44:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso9219870wmc.3; 
 Mon, 10 Jan 2022 00:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BB3e3hUqxn2Z7IJZZwcmdxyP9sm3C9oO8lZs3wR6l7E=;
 b=PBcAuXrWY7OZhwiMVGF5jMVfMhNKI6OXLFVWkr70jj1OR8sCwBejEkI5XzOjiET+Av
 hQ17Um3/lJs9CYixhC8EhsSzEp8VjhnyGBwUb2uGSRkkXFQ4K6zSjGs4s5xbslOS1Vo4
 DORfswBN2gkjuAqLNQ2/dJUIQRVwaIdxaO8hA41QixQogalnzoSNoYr0G7K4HvDsYmtc
 FxUkCpBwEfVICUKYL3uYd+6qdbQjbXlTpbaq027AYfb4E/flS23gU2fu/jExcPUtoaiO
 II33dAX+mHslzGj8B5Iy6HySwNlJnIcA7hWVvJbTjXKCTtUaWpWDaR+d6uMnSM/aBfzL
 4gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BB3e3hUqxn2Z7IJZZwcmdxyP9sm3C9oO8lZs3wR6l7E=;
 b=PA4ovY9oFs2d/t2wf6p77jZgPddxsuowqMsDEW2a+utgx10Xtp2INxEu/rYov3h+KK
 bENSV9GED4yOZObvXxvOv8gOZCVAfX3hI4stqmXuhwdik7Jz9i8m/dxBOC0iMoy5ndrE
 rRMJBvuD9lybtrBZpoF4IjKQUQ1ChskahXVElkfn59foolu1tc1KV7t2vXTc8qVsGWuw
 Vc2yUZnFdoLYX2Y3qx2Sy9867WTcZcG78vFB5kEYr9Nx9synTgPCr5R6fMGJSBNTttEC
 TZngTbFBYOMQJYZj7M1C4j2ttcMqb8X8LLe8uGKDM+W97jMh8UvcNYAflk4k8iWGoWGf
 fkJw==
X-Gm-Message-State: AOAM530cwpqn8DR0Vtfuo3yD433uXa7WbQeFUUGuGWt+/o6udmRzCV4c
 MG3RcIcs6Co5PKGLSBC1068=
X-Google-Smtp-Source: ABdhPJwFMDdZdtCyUI+G+woKO0Fg91RoJr+IZfYUSojSnOp+mqce06RWNevPaHUrK4f/feCueqra2w==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr11945549wmg.150.1641804255878; 
 Mon, 10 Jan 2022 00:44:15 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id n14sm6366167wrf.107.2022.01.10.00.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:44:15 -0800 (PST)
Message-ID: <742a1bca-1150-c277-c498-3815ef956f58@amsat.org>
Date: Mon, 10 Jan 2022 09:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
References: <20220109170612.574104-1-f4bug@amsat.org>
 <20220109170612.574104-3-f4bug@amsat.org>
 <b5b9df3d-0213-0a62-12ab-4e48ec88c0d9@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <b5b9df3d-0213-0a62-12ab-4e48ec88c0d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 09:17, Akihiko Odaki wrote:
> On 2022/01/10 2:06, Philippe Mathieu-Daudé wrote:
>> When building on macOS 12 we get:
>>
>>    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster'
>> is deprecated: first deprecated in macOS 12.0
>> [-Werror,-Wdeprecated-declarations]
>>        kAudioObjectPropertyElementMaster
>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>        kAudioObjectPropertyElementMain
>>   
>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5:
>> note: 'kAudioObjectPropertyElementMaster' has been explicitly marked
>> deprecated here
>>        kAudioObjectPropertyElementMaster
>> API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain",
>> macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0))
>> = kAudioObjectPropertyElementMain
>>        ^
>>
>> Use kAudioObjectPropertyElementMain (define it to
>> kAudioObjectPropertyElementMaster on macOS < 12).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   audio/coreaudio.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>> index d8a21d3e507..c836bc9dd37 100644
>> --- a/audio/coreaudio.c
>> +++ b/audio/coreaudio.c
>> @@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
>>       bool enabled;
>>   } coreaudioVoiceOut;
>>   +#if !defined(MAC_OS_VERSION_12_0)
>> +#define kAudioObjectPropertyElementMain
>> kAudioObjectPropertyElementMaster
>> +#endif
>> +
> 
> Semantically MAC_OS_VERSION_12_0 defines the numeric value of version
> 12.0 and its existence does not mean that
> kAudioObjectPropertyElementMain is defined. I suggest the following:
> #if !__is_identifier(kAudioObjectPropertyElementMain)
> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> #endif

OK, thank you!

> Regards,
> Akihiko Odaki

