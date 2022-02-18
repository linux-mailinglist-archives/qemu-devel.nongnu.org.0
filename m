Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16414BBF73
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:28:14 +0100 (CET)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7zJ-0001oe-M6
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:28:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7yE-00018T-8S
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:27:06 -0500
Received: from [2607:f8b0:4864:20::1036] (port=52869
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7yC-0005Ww-BW
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:27:05 -0500
Received: by mail-pj1-x1036.google.com with SMTP id v4so9317694pjh.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TKMN7bsdUw9+aLOGq7ATXjF7CFb22LcTZXWp9d/y4Xc=;
 b=A2sqhmlQenYX5wCZrlQEjHjd3egUVOGhJcKw0fC6/fcHUfhudmEtXBVztVFNBG88mT
 4iS4zQwoMrMVAILEJL9h+XS8IGT8jvTHFMECBdp3YRyaRW4szw0i8GpYotzit50gmpAX
 YUmHN8i1o/hnV0w6aOCRcIdlhZ8p/iPjjiSaQRY5z9M0Yzx/cR6Xj/7XRz3eACMF3hkO
 F209a8CgZhCYQv4bevf1tVJ212JdenGuSWY4OWP/Kwawn13RR4baz6q9VeZnfMzwDX1+
 9uVUDCb+W1Pb0BEvuVoAOuR5GU7c9zOBGh+aeVxPOp3btZFycPH6QiJJvTD4pFc9Tk1E
 5w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TKMN7bsdUw9+aLOGq7ATXjF7CFb22LcTZXWp9d/y4Xc=;
 b=uCQF/ktyHEkWSpGM5NITYcpASH+6GfAoeQjDWYV9gcuF1nflYcOJ2kTvHdh4g7cgu3
 O8RW1vFPEGcwzmGwepvhNo2ZPP59Wcyamsm3kuGMT2zmna8jumLGEuc3El8Z7AMT3mz9
 o1XWannyB0Bv2jJOSJeOqETs49p+EfqedRG0Wi806VWfvJfStDdB7+DNXUuypqZPct9J
 yf0MNzHSXWbE01rLd7VZdaiJvW+f23bkZlTAX408mhgz3x8Dbxn+sr4Xnm5g0qnKLKd1
 YV5NLIEOJSWbJyCUsl9tROk5Gy0rqBnAKipupnswBMDHCkx5B1cUa6ty7lwL/bb1XZdw
 k+VA==
X-Gm-Message-State: AOAM531OF6t31VRTmYoJ2ISFozpagJe/d301C1tfettOVDdXlkkytSK0
 yASZyloPgh6daH9AL03HZ7c=
X-Google-Smtp-Source: ABdhPJxwH6PajNyWCQMlxhJxLAFryKUAhlfJ3yvTh/Ojj9FjikfxInwvaxD0Mcu8Fcf9crfVhGRDBg==
X-Received: by 2002:a17:90a:1a46:b0:1b9:2e0f:1e54 with SMTP id
 6-20020a17090a1a4600b001b92e0f1e54mr9633920pjl.37.1645208822960; 
 Fri, 18 Feb 2022 10:27:02 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 e20sm3633742pfn.4.2022.02.18.10.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 10:27:02 -0800 (PST)
Message-ID: <a33f36ba-0f22-af5d-b2d1-c0bd8ec281cb@gmail.com>
Date: Sat, 19 Feb 2022 03:26:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 08/15] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220215080307.69550-1-f4bug@amsat.org>
 <20220215080307.69550-9-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220215080307.69550-9-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Roman Bolshakov <roman@roolebo.dev>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/02/15 17:03, Philippe Mathieu-Daudé via wrote:
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
> Replace by kAudioObjectPropertyElementMain, redefining it to
> kAudioObjectPropertyElementMaster if not available.
> 
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Suggested-by: Roman Bolshakov <roman@roolebo.dev>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   audio/coreaudio.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e50..1faef7fa7a 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
>       bool enabled;
>   } coreaudioVoiceOut;
>   
> +#if !defined(MAC_OS_VERSION_12_0) \
> +    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
> +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> +#endif
> +
>   static const AudioObjectPropertyAddress voice_addr = {
>       kAudioHardwarePropertyDefaultOutputDevice,
>       kAudioObjectPropertyScopeGlobal,
> -    kAudioObjectPropertyElementMaster
> +    kAudioObjectPropertyElementMain
>   };
>   
>   static OSStatus coreaudio_get_voice(AudioDeviceID *id)
> @@ -69,7 +74,7 @@ static OSStatus coreaudio_get_framesizerange(AudioDeviceID id,
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyBufferFrameSizeRange,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectGetPropertyData(id,
> @@ -86,7 +91,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID id, UInt32 *framesize)
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyBufferFrameSize,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectGetPropertyData(id,
> @@ -103,7 +108,7 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyBufferFrameSize,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectSetPropertyData(id,
> @@ -121,7 +126,7 @@ static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyStreamFormat,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectSetPropertyData(id,
> @@ -138,7 +143,7 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
>       AudioObjectPropertyAddress addr = {
>           kAudioDevicePropertyDeviceIsRunning,
>           kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>       };
>   
>       return AudioObjectGetPropertyData(id,


