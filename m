Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9648BEBE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 07:59:51 +0100 (CET)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Xbp-00082R-H4
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 01:59:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7XZo-0007Lb-64
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 01:57:44 -0500
Received: from [2a00:1450:4864:20::12c] (port=44609
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7XZm-0006Sb-EO
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 01:57:43 -0500
Received: by mail-lf1-x12c.google.com with SMTP id o15so4657675lfo.11
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 22:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=g7KbRKOxITdSE8FeP9zvg8j5YeMLNfa6XHb+rwqSKSM=;
 b=EE+cVsK7esjii5UaeM2gWfWByE2ZE+5KEx/LmVTANue4RYJCKSzKnbUa3VHY/zMSVI
 9b12SqoBewn8Y+rG/r88mUIRNNpkhqUNnUqOQymHUS75eOCSvOkYesAH6gMFWmIwjer/
 5WtsnEmaXoyWT3lRT5AppE3qR/WrISIZim4KxwpaM0WpUDp43qSrP4caTmqc1NsuOpp/
 KKE9auQhrDQyMAc7JnvuUwNda4vaaF8IFFmddqsitEa+7f6giGnJIlV8BU17HhXp7gSv
 aoPkYUxOCNqLAuYNVi1ems7FPx1NVHexRpwWX7/0wdE2nVPvkTPLyE2uOQYRIik8yvJy
 yaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g7KbRKOxITdSE8FeP9zvg8j5YeMLNfa6XHb+rwqSKSM=;
 b=CLm0bE0k82oF0/OITv4TB6+SCrW9gjY6ZQfBHPioSC75SZ77SjtvP24jtrHTDRB7aa
 QQc4NTCmCpA17MiPisDSLOojZHfCLDCBhi8XkJi/psTXcw2pMQWJPNpUwn+ksT91oFPv
 k7JPBYiAm8PguTGAvNwK4Cl46AJaDU/jEcvaSGgtwRRwbR6zpLKbJZ/c0TzyPd2oPh+K
 N/3YnV92P7vFoBUYUO/2SPUgsqS+DyIDQ5BVIHYdGxxmLy0WdcfRRl3ftsWUvtU3tv6X
 cYNvW7aq1ncdALmVbrX0lpjQj2vOnVUVVKnUIOqQ/mkSSZybQy+Mg1OXZYDv9fneuoSE
 x/Og==
X-Gm-Message-State: AOAM530Y4SmVJMgEz/8eKX+NX5ZsIaWJGGdG4/o5T0pSjSk/m6uANaaQ
 QQHHQmdiMpg17FeMxi0Ae3IGIQ==
X-Google-Smtp-Source: ABdhPJxwYszI6sgMk8d+A5OSk8gZ0gI2xGn5bf56k9j3+1vCd1+VMXj749uGm1j6zY188olkB9pEtQ==
X-Received: by 2002:a05:6512:2283:: with SMTP id
 f3mr5913534lfu.568.1641970659985; 
 Tue, 11 Jan 2022 22:57:39 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id w5sm443155ljm.55.2022.01.11.22.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 22:57:39 -0800 (PST)
Date: Wed, 12 Jan 2022 09:57:36 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v3 5/7] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Message-ID: <Yd574PyTQpqHXsdo@roolebo.dev>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220110131001.614319-6-f4bug@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::12c;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x12c.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Checkpatch:
> 
>  WARNING: architecture specific defines should be avoided
>  #10: FILE: audio/coreaudio.c:47:
>  +#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >= 12.0 */
> 
> Should we define __is_identifier() to 0 for GCC on macOS?
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

Christian and Akihiko are right you need to replace it with macOS version
wrappers:

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 73cbfd479a..7367a2ffd4 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -44,7 +44,8 @@ typedef struct coreaudioVoiceOut {
     bool enabled;
 } coreaudioVoiceOut;

-#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >= 12.0 */
+#if !defined(MAC_OS_VERSION_12_0) || \
+    (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
 #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
 #endif


And in the patch 6 you'd do likewise:

diff --git a/block/file-posix.c b/block/file-posix.c
index 1d0512026c..c0038629a1 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3325,7 +3325,8 @@ BlockDriver bdrv_file = {
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);

-#if !__is_identifier(IOMainPort) /* macOS >= 12.0 */
+#if !defined(MAC_OS_VERSION_12_0) || \
+    (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
 #define IOMainPort IOMasterPort
 #endif

This way it the build would work also on older macOS.


Two more issues are left:

1. Linker has corrupted paths to clang directory (happens on all macOS versions).

Monterey:

[732/737] Linking target qemu-system-mips-unsigned
ld: warning: directory not found for option '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0'
[733/737] Linking target qemu-system-mips64-unsigned
ld: warning: directory not found for option '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0'
[737/737] Generating qemu-system-mips64 with a custom command

Catalina:

ld: warning: directory not found for option '-Lveloper/CommandLineTools/usr/lib/clang/11.0.0'
[102/105] Linking target qemu-system-or1k-unsigned
ld: warning: directory not found for option '-Lveloper/CommandLineTools/usr/lib/clang/11.0.0'
[104/105] Linking target qemu-system-ppc-unsigned
ld: warning: directory not found for option '-Lveloper/CommandLineTools/usr/lib/clang/11.0.0'
[105/105] Generating qemu-system-ppc with a custom command

2. QEMU tests show FENV_ACCESS warning on Monterey:


[409/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testfloat-3_source_test_az_f128_rx.c.o
../tests/fp/berkeley-testfloat-3/source/test_az_f128_rx.c:49:14: warning: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignored-pragmas]
#pragma STDC FENV_ACCESS ON
             ^
1 warning generated.
[410/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testfloat-3_source_test_abcz_f128.c.o
../tests/fp/berkeley-testfloat-3/source/test_abcz_f128.c:48:14: warning: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignored-pragmas]
#pragma STDC FENV_ACCESS ON
             ^
1 warning generated.

Regards,
Roman

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

