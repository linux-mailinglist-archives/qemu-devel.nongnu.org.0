Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD5489329
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:19:15 +0100 (CET)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ptZ-0003Zz-NC
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:19:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6psW-0002gX-Fr; Mon, 10 Jan 2022 03:18:08 -0500
Received: from [2607:f8b0:4864:20::634] (port=34679
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6psR-00028Y-3L; Mon, 10 Jan 2022 03:18:08 -0500
Received: by mail-pl1-x634.google.com with SMTP id x15so11205655plg.1;
 Mon, 10 Jan 2022 00:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HYWq0AOwNLb6/W+M9Som0ZxCeuR7iEPlCYABFEEJxi8=;
 b=J6HRHpH8OfkI6FC9/2BwjOU6ap1JHFydEGri6XnikWX6+onZ9z9jsTWNwQaNfUA9tf
 DNCDGGKVcLwvoKTrZwScUj/eQvIUzuHoRnse+j2oG6iy0tr4mHNMVC0OHeoaLzSiudM2
 j0C9oGEZq4RDQmaMWQU8m/5ZBZFWmRL5Q0jBRP2tryRZGQ468FWys3mdlPAV58PZ5JIg
 PV8LDKDsLq7v5AyQp1Sycu341tkeT0iM/+J9Dx71o682UAAuh38gVtiJ2v7VGbKUmjhR
 uQ2GBLNZw8Km9mEmlUxoQz7hKKpFdrxqFGGlTUsvwhi9GRNwYahShp1AQ85oGhXfmcDN
 Q1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HYWq0AOwNLb6/W+M9Som0ZxCeuR7iEPlCYABFEEJxi8=;
 b=xVlz1NpDYGXnx5TSvMDmiuwNE+/lgzHv/7WVUNf3v18ud5wH0QI45afut0xnCbLfZv
 /96yTad1Xys4d/J0RziwuJYZezDTMF9h4AIFCCS1go2dPoRnYgM2W9gV3/XcCW3nksdH
 plZinnPVAHk5zWM1CN/11omttkPkm77PD+DzEFyBK3w39ejPAVjK4HSfc3/tCAlSmLBO
 4K1qD34kEfdwYFexMwTA5QKWroOC9wets8840gYifSu4ZR0r7l/lmVAq6JSub+4h+9/b
 1CfT2ITHrknSVTdMnZt0tv+NLuyFiQ+TB15DVRdSV69d6Pc1FRCeKVsOfZeg5xGQybxh
 bSxQ==
X-Gm-Message-State: AOAM531cCFjHJH1IbQH0Nvl77TELlmk7VqvDfvJA5rOR4E+NjG0UJosP
 2IlVN/c1zi3logdgYzdqvqQ=
X-Google-Smtp-Source: ABdhPJxyPkRJ0pIzSYv8mD8nJRhbBd01aTHm86qZQp4It4f2MTK1nIVGGL+Z9C+1U9IDtcWEeIMd6g==
X-Received: by 2002:a17:902:c64b:b0:14a:2206:9a87 with SMTP id
 s11-20020a170902c64b00b0014a22069a87mr7657338pls.165.1641802680974; 
 Mon, 10 Jan 2022 00:18:00 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 p37sm6313720pfh.97.2022.01.10.00.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:18:00 -0800 (PST)
Message-ID: <b5b9df3d-0213-0a62-12ab-4e48ec88c0d9@gmail.com>
Date: Mon, 10 Jan 2022 17:17:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220109170612.574104-1-f4bug@amsat.org>
 <20220109170612.574104-3-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220109170612.574104-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x634.google.com
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/01/10 2:06, Philippe Mathieu-Daudé wrote:
> When building on macOS 12 we get:
> 
>    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is deprecated: first deprecated in macOS 12.0 [-Werror,-Wdeprecated-declarations]
>        kAudioObjectPropertyElementMaster
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        kAudioObjectPropertyElementMain
>    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note: 'kAudioObjectPropertyElementMaster' has been explicitly marked deprecated here
>        kAudioObjectPropertyElementMaster API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain", macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) = kAudioObjectPropertyElementMain
>        ^
> 
> Use kAudioObjectPropertyElementMain (define it to
> kAudioObjectPropertyElementMaster on macOS < 12).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   audio/coreaudio.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e507..c836bc9dd37 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
>       bool enabled;
>   } coreaudioVoiceOut;
>   
> +#if !defined(MAC_OS_VERSION_12_0)
> +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> +#endif
> +

Semantically MAC_OS_VERSION_12_0 defines the numeric value of version 
12.0 and its existence does not mean that 
kAudioObjectPropertyElementMain is defined. I suggest the following:
#if !__is_identifier(kAudioObjectPropertyElementMain)
#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
#endif

Regards,
Akihiko Odaki

>   static const AudioObjectPropertyAddress voice_addr = {
>       kAudioHardwarePropertyDefaultOutputDevice,
>       kAudioObjectPropertyScopeGlobal,
> -    kAudioObjectPropertyElementMaster
> +    kAudioObjectPropertyElementMain
>   };
>   
>   static OSStatus coreaudio_get_voice(AudioDeviceID *id)
> @@ -69,7 +73,7 @@ static OSStatus coreaudio_get_framesizerange(AudioDeviceID id,
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyBufferFrameSizeRange,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectGetPropertyData(id,
> @@ -86,7 +90,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID id, UInt32 *framesize)
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyBufferFrameSize,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectGetPropertyData(id,
> @@ -103,7 +107,7 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyBufferFrameSize,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectSetPropertyData(id,
> @@ -121,7 +125,7 @@ static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyStreamFormat,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectSetPropertyData(id,
> @@ -138,7 +142,7 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyDeviceIsRunning,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectGetPropertyData(id,

