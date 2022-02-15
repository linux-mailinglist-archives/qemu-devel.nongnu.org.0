Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9B14B63D3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 07:59:41 +0100 (CET)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJroJ-0008Kq-U1
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 01:59:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJrj7-0005YV-Ru; Tue, 15 Feb 2022 01:54:19 -0500
Received: from [2607:f8b0:4864:20::22d] (port=34327
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJrj2-0001Aj-Fp; Tue, 15 Feb 2022 01:54:16 -0500
Received: by mail-oi1-x22d.google.com with SMTP id i5so19896377oih.1;
 Mon, 14 Feb 2022 22:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mwR2K4VxfqDD4S4XcVuW68Hpg8pTpcjfz0vEfmM78ds=;
 b=RZlIthFKAo2DMYme+lGeQ1lznVbfvcEk2lX1mVqZXRAMXhJR4nOcNL+22SpE8pEAEo
 IjxNqZ5fjJA3cMmspGFlcMQDkT/gOewvgA2hu5ruPa100pi19WW/aQUTRNPEllERqw87
 ig6SyiEZ9jLb8nj03gCHndFfKfH5+4b2/c+ROFkvYxOJZDtoj7AVIUNU4V6bu7F60hmh
 /b4Ylc6fEmiOb6Lsmr3aZSkRjWpR0A8xBwpkQ3QOVlVPcDshAgfg64Gva7Hztw+VlGoN
 rcTqMyRXrkIcrD0TLq9cmvjmHUBIxKINNOg5hiJdLQf8jkGfSAcDWo5/xcUaRIaHZ2Eg
 E45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mwR2K4VxfqDD4S4XcVuW68Hpg8pTpcjfz0vEfmM78ds=;
 b=zP/UfmkvNK7F0360P8uDS6xr7hoRWB60S6ggCyzgCZ5/0WclSL+6ngxf0FjkIKanSS
 dzsPAO8XLeacB0XB/L+ZU9H+qOQ8DGmyzXt7/5Qg80IaU0bVXmWJ4WHuiaR5yTt/G5st
 p3kKxLRU9JrbxlvXS5+Cc881559InIXKWy61uOmdQ38vsc4MRPpjjbpJhyeRCMs2em31
 YB9KbogzrvBFPHE5cH2laRCV7NF0t06CRjzwezJ6zIfBviJpPJh96y1vQVkWKD0sGILC
 HtMq4dQ/Q1pvx6dS2qMkxq4eCVShYXGocYrL3eU/Tla3Vf3l6Mi4EbqH0MetJdwFns2R
 OhcQ==
X-Gm-Message-State: AOAM533GMhIzA3E0gNKWXztF6iOHSgK6BY1r6q+vD7M2Tj/BeV2rEmZ5
 SOHxT6XW1qTSWfswQC4LiyCUUsrmU5kw2VBz9Z4=
X-Google-Smtp-Source: ABdhPJx4bftjN54a4Lb9HrdZe0LxrDtzB2X5QZRmygLhTXE1WzrJxFtMkNSMCL68zr0sHYJ829WrTC0XOHoW3fYRjBw=
X-Received: by 2002:aca:6083:0:b0:2cb:5570:7564 with SMTP id
 u125-20020aca6083000000b002cb55707564mr1046967oib.57.1644908049979; Mon, 14
 Feb 2022 22:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-11-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-11-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 15 Feb 2022 15:53:59 +0900
Message-ID: <CAMVc7JUiFBcvMeFXrgM=6V51JGQZFvynX5hwnZRWaPzPp+5hWA@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] audio/coreaudio: Remove a deprecation warning on
 macOS 12
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Li Zhang <lizhang@suse.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Roman Bolshakov <roman@roolebo.dev>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 3:57 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> When building on macOS 12 we get:
>
>   audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is d=
eprecated: first deprecated in macOS 12.0 [-Werror,-Wdeprecated-declaration=
s]
>       kAudioObjectPropertyElementMaster
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       kAudioObjectPropertyElementMain
>   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Fram=
eworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note: 'kAudio=
ObjectPropertyElementMaster' has been explicitly marked deprecated here
>       kAudioObjectPropertyElementMaster API_DEPRECATED_WITH_REPLACEMENT("=
kAudioObjectPropertyElementMain", macos(10.0, 12.0), ios(2.0, 15.0), watcho=
s(1.0, 8.0), tvos(9.0, 15.0)) =3D kAudioObjectPropertyElementMain
>       ^
>
> Replace by kAudioObjectPropertyElementMain, redefining it to
> kAudioObjectPropertyElementMaster if not available.
>
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Suggested-by: Roman Bolshakov <roman@roolebo.dev>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  audio/coreaudio.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e50..5b3aeaced0 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
>      bool enabled;
>  } coreaudioVoiceOut;
>
> +#if !defined(MAC_OS_VERSION_12_0) \
> +    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaste=
r
> +#endif
> +

This still uses MAC_OS_X_VERSION_MAX_ALLOWED. Apparently the change to
use MAC_OS_X_VERSION_MIN_REQUIRED went to "[PATCH v5 16/16] gitlab-ci:
Support macOS 12 via cirrus-run".

>  static const AudioObjectPropertyAddress voice_addr =3D {
>      kAudioHardwarePropertyDefaultOutputDevice,
>      kAudioObjectPropertyScopeGlobal,
> -    kAudioObjectPropertyElementMaster
> +    kAudioObjectPropertyElementMain
>  };
>
>  static OSStatus coreaudio_get_voice(AudioDeviceID *id)
> @@ -69,7 +74,7 @@ static OSStatus coreaudio_get_framesizerange(AudioDevic=
eID id,
>      AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyBufferFrameSizeRange,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>
>      return AudioObjectGetPropertyData(id,
> @@ -86,7 +91,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID i=
d, UInt32 *framesize)
>      AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyBufferFrameSize,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>
>      return AudioObjectGetPropertyData(id,
> @@ -103,7 +108,7 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID=
 id, UInt32 *framesize)
>      AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyBufferFrameSize,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>
>      return AudioObjectSetPropertyData(id,
> @@ -121,7 +126,7 @@ static OSStatus coreaudio_set_streamformat(AudioDevic=
eID id,
>      AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyStreamFormat,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>
>      return AudioObjectSetPropertyData(id,
> @@ -138,7 +143,7 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID=
 id, UInt32 *result)
>      AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyDeviceIsRunning,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>
>      return AudioObjectGetPropertyData(id,
> --
> 2.34.1
>

