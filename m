Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64FE48B5FF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 19:45:58 +0100 (CET)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7M9d-0002qQ-5w
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 13:45:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7M0i-0001Te-Bp
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 13:36:44 -0500
Received: from [2a00:1450:4864:20::129] (port=40621
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7M0f-0004yh-QC
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 13:36:44 -0500
Received: by mail-lf1-x129.google.com with SMTP id s30so31741104lfo.7
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 10:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4KLXKILUBNcoqlNFSwz/ug3tJZbxcSM2XDX0XC2nm60=;
 b=dmvfOLbA5jI1YFaDB45yVToyBMt2iHphHsWeMNK82ccaNfVBW6Y40yjvgLHd11fUob
 IUX4ZgMdDYxLbl2Z0DiW2iwXddbFqxRi7qv3wGtiQJNKAh9hyq1Wl4LsUgrfrZFtOrnL
 TcdO368vE+vqD3fRpK4Jp2t65ohJQ3ERPUdMdDn6Os1uJwt7HWhCpPfdWv3dMlHEnG32
 CgXwawPf+kHSrvlEtXOyNyoCgM8zSF2AnXK1U6dwcjkDGOzTiH+4102qvarRglf/zFEe
 oVlw/Q3zcLRjKQYMAg7RCj9F7n+AHAtr3h0qKXUxggd/5NSdXPljy6s3//vam7kMGq+J
 GG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4KLXKILUBNcoqlNFSwz/ug3tJZbxcSM2XDX0XC2nm60=;
 b=i9D97ZWn+1qKstRjVUuccMUF5uMunKwIJ1uRQfpRR6c0bDE7SEMYC891iPy1TztcEC
 3fwehGnRcYTrNtU066f0pGvXjjo3QrIyUZgGRlHQdn1rDGX9KD8Ijb3eNiJ8Uqf0XWP3
 bn3m2O07HaCfHuEQYicSw1/AWXIIQ08A/5Hejm5DhitWD73udwL2evJx7Y3dqRjlXXL9
 9B12sIYa8zP+7iF+WisgH3UoWcXzZ94ojOCblmAVgJnFbUjPH2m9eLvQ2bWJmyWPvX6I
 tbQlhOapwKKwP8cfrcMjYmWZlLdd374EiG0ha/otgp9lhdeTSWnqoFm6LYLohngYkYjH
 JMew==
X-Gm-Message-State: AOAM532Pg6hSdW5nOf/DHnZQEzUmjVr9DfpiiWAmhpZXsGH6/a0hwLkt
 mymiBvxhj+z0wlqkFxIDm68SJg==
X-Google-Smtp-Source: ABdhPJwMUaI/yGY5h0whsiQ4Wx9oJLVKuireKyI7dN1aM3ZF/fi55tWtzOjEqk5HPqQyhZc6LvHuVw==
X-Received: by 2002:a2e:908b:: with SMTP id l11mr3818164ljg.62.1641926198493; 
 Tue, 11 Jan 2022 10:36:38 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id q13sm1406908lfu.303.2022.01.11.10.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:36:37 -0800 (PST)
Date: Tue, 11 Jan 2022 21:36:37 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v3 5/7] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Message-ID: <Yd3ONZCzVoR3b4xj@roolebo.dev>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220110131001.614319-6-f4bug@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::129;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x129.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 02:09:59PM +0100, Philippe Mathieu-Daudé wrote:
> When building on macOS 12 we get:
> 
>   audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is deprecated: first deprecated in macOS 12.0 [-Werror,-Wdeprecated-declarations]
>       kAudioObjectPropertyElementMaster
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       kAudioObjectPropertyElementMain
>   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note: 'kAudioObjectPropertyElementMaster' has been explicitly marked deprecated here
>       kAudioObjectPropertyElementMaster API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain", macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) = kAudioObjectPropertyElementMain
>       ^
> 
> Replace by kAudioObjectPropertyElementMain, redefining it to
> kAudioObjectPropertyElementMaster if not available, using
> Clang __is_identifier() feature (coreaudio is restricted to
> macOS).
> 

As of now it breaks the build on Catalina/10.15:

FAILED: libcommon.fa.p/audio_coreaudio.c.o
cc <...>
../audio/coreaudio.c:54:5: error: use of undeclared identifier 'kAudioObjectPropertyElementMain'; did you mean 'kAudioObjectPropertyElementName'?
    kAudioObjectPropertyElementMain
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    kAudioObjectPropertyElementName

But __is_identifier itself works... Weird.

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Checkpatch:
> 
>  WARNING: architecture specific defines should be avoided
>  #10: FILE: audio/coreaudio.c:47:
>  +#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >= 12.0 */
> 
> Should we define __is_identifier() to 0 for GCC on macOS?

Clang documentation has this snippet:

#ifdef __is_identifier          // Compatibility with non-clang compilers.
  #if __is_identifier(__wchar_t)
    typedef wchar_t __wchar_t;
  #endif
#endif

We can also add ifdef around just to be nice to GCC if it ever comes back on
macOS :)

Regards,
Roman

> ---
>  audio/coreaudio.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e507..73cbfd479ac 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
>      bool enabled;
>  } coreaudioVoiceOut;
>  
> +#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >= 12.0 */
> +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> +#endif
> +
>  static const AudioObjectPropertyAddress voice_addr = {
>      kAudioHardwarePropertyDefaultOutputDevice,
>      kAudioObjectPropertyScopeGlobal,
> -    kAudioObjectPropertyElementMaster
> +    kAudioObjectPropertyElementMain
>  };
>  
>  static OSStatus coreaudio_get_voice(AudioDeviceID *id)
> @@ -69,7 +73,7 @@ static OSStatus coreaudio_get_framesizerange(AudioDeviceID id,
>      AudioObjectPropertyAddress addr = {
>          kAudioDevicePropertyBufferFrameSizeRange,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>  
>      return AudioObjectGetPropertyData(id,
> @@ -86,7 +90,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID id, UInt32 *framesize)
>      AudioObjectPropertyAddress addr = {
>          kAudioDevicePropertyBufferFrameSize,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>  
>      return AudioObjectGetPropertyData(id,
> @@ -103,7 +107,7 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
>      AudioObjectPropertyAddress addr = {
>          kAudioDevicePropertyBufferFrameSize,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>  
>      return AudioObjectSetPropertyData(id,
> @@ -121,7 +125,7 @@ static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
>      AudioObjectPropertyAddress addr = {
>          kAudioDevicePropertyStreamFormat,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>  
>      return AudioObjectSetPropertyData(id,
> @@ -138,7 +142,7 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
>      AudioObjectPropertyAddress addr = {
>          kAudioDevicePropertyDeviceIsRunning,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>  
>      return AudioObjectGetPropertyData(id,
> -- 
> 2.33.1

