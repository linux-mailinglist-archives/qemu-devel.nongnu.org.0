Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D24B35D6
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 16:25:16 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIuGx-0003ox-D9
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 10:25:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nIuFk-0002fu-HD
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 10:24:00 -0500
Received: from [2607:f8b0:4864:20::102b] (port=52093
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nIuFi-00067G-1S
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 10:24:00 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y9so10619119pjf.1
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UVukT6qfKksUzcgdzBfQ5thDePNhWPhFlfBK97SyLzY=;
 b=MlhDVIFfM4XvCxe8NADIwrGcmEQRw2tXbGNct0VSEveAML4MmB2pdlUgg0P0vyKS94
 SNiiSvUBxinjxSxIgj/Tvv78bY8SYSDNljgP7dpRJtZtO2XzuKa4y7rDV6DzpuSsB1yA
 mbIS6rKOm2qZb/fOZWRJvLhENQfKN0b8B1Rxsuz/pFwd9k909QajW5Wgzj6/UjXVvpN4
 fMxU8Pdli87CvNXL2pz+vKxTmfpH87zw7V3JHD/5UpdpOFWp5SHmVWQiQdtuKpsqH8nJ
 H5bbPaw/Y6f/lCu+u+wkxqaqohfGezxyd5Ph+XpJnoyXH4cxnBAWgD0t3WfvgZ7VMu/c
 A8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UVukT6qfKksUzcgdzBfQ5thDePNhWPhFlfBK97SyLzY=;
 b=rnmZlzNkuGhjQegrsy3XM4YcL8qhFlv9ebq5fWL9m9F2OsZHkm2MRd8YMS2WAfgU7Y
 yew5PPjwqPKSlu8C948rPqYnRVdNre/IVJ5EwgLI49D0RiMWqIW5guzfye6t9cfmxj19
 IcBX59PAtNiUhjZDTzcQv4Hxa0gYa2VwwlFYAGRPE/FVceCp6K+0SZt6oWtvoG5Jsfnn
 xp+5pL+53nuU20ZTLuQgbQZrFblT7PeAiqrmc1L4LvRnCvOtox88C+2EkMbeXCpkU/Bn
 C0vw2/1tFPh1SpqtiYPkzC4m0f7u/MQA18LQq9tz1ssW7MzqbijBRA1FwXvDwZ/sb64s
 qQGw==
X-Gm-Message-State: AOAM530UD7g9VWZ8GO/me3nhLMy8IAqWm6tJ5/BmQZT41iHyq21ifr//
 06fmWa8apLCtlWIQ/TbqMoQ=
X-Google-Smtp-Source: ABdhPJyP9tEoeMLYf2oCIAQjH4tvsErjc0/JeH9O3ZlnzE1gLhrLI8gU+5IwmOk90q+aZTp5XMAFSw==
X-Received: by 2002:a17:903:41ce:: with SMTP id
 u14mr1955760ple.124.1644679436133; 
 Sat, 12 Feb 2022 07:23:56 -0800 (PST)
Received: from [10.0.2.15] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id g20sm32203294pfj.196.2022.02.12.07.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 07:23:55 -0800 (PST)
Message-ID: <ef7e75a3-45af-28a0-8460-86013bf2164c@gmail.com>
Date: Sun, 13 Feb 2022 00:23:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 10/13] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-11-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220211163434.58423-11-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Li Zhang <lizhang@suse.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Roman Bolshakov <roman@roolebo.dev>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/12 1:34, Philippe Mathieu-Daudé via wrote:
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
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   audio/coreaudio.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e50..5b3aeaced0 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
>       bool enabled;
>   } coreaudioVoiceOut;
>   
> +#if !defined(MAC_OS_VERSION_12_0) \
> +    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> +#endif
> +

Unless I have missed something, we have found 
MAC_OS_X_VERSION_MIN_REQUIRED is better even for a constant in the 
following thread:
https://lore.kernel.org/all/524515d6-2fb5-15c1-0aaf-bcda3684cd00@gmail.com/

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

