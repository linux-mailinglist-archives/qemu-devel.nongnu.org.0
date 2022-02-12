Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E74B3544
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 14:23:50 +0100 (CET)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIsNR-0002bo-07
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 08:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIsFs-0000NA-JR
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:16:01 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIsFl-0000gM-3O
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:15:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=dFQSnebVYdxPQDDiMAM1FMa2FIJPbmNnf2BtQ6jOfyA=; b=ID4DJXUWziNpGj/KtndGp+3ndg
 ORMummaJqkiXGkV642++DIvpXCwZqjDZx77EPSFdffomq9I+XLwVeEpT0GrQdnb4hGCC910zn7LIg
 bxvile6VLpvAZURMJnN48v+6dxPGzqZUSjPmtypc1pXnmUFK3w40MG3nillOaOM2nWFF8+tkf9zOa
 74ZRcgoI/X44C8TNkz4vzKAY1g2Jsyc0qtt4gMf1NirDi9UxqAUNH8sR1fbOAsG+LMfqRolXIa0tn
 ns8qLhz0cqPXzSbSZ9ym/OV4KguGuFs0UQHpmaSwtbstqVWzkglBElggeSb+5QyUcNxm1Rev01R0F
 ekblh6BJI5Er2PCjlzrCZQ9nZc+TmF9lLpx4pTNVG8K+zA0Xw4YmZX8+yn3bNMABo8ziJdKv6yWWY
 xxFjtyZdhV9Kza720MUxqP60ULrsMn8UkDBxolIOgXRR2NTSsjnZSbOAI5fPi4lDF8SCGtg7Y84hS
 Db3EQnWtecuOhCUJ2AT7dBECDMp1X8f1YAh38NPhflwef2hh3RG4REOxbhu7uEUrINZ4j9jy5ZlHI
 iBa463F3HGmwf8bqqQuEEPRWPPzw3wuSjx1lr4FXTNfUyXtDhGylMP/gu4+C8sDSdhg9fYjCFW4oF
 3C1UsVRz1ltjKKyLVvXgAmlo2tD46yKxkEIYlMN3w=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 Roman Bolshakov <roman@roolebo.dev>
Subject: Re: [PATCH v4 10/13] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Date: Sat, 12 Feb 2022 14:15:47 +0100
Message-ID: <11748985.P5lqhIUtUT@silver>
In-Reply-To: <20220211163434.58423-11-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-11-f4bug@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 11. Februar 2022 17:34:31 CET Philippe Mathieu-Daud=E9 via wrot=
e:
> When building on macOS 12 we get:
>=20
>   audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is
> deprecated: first deprecated in macOS 12.0
> [-Werror,-Wdeprecated-declarations] kAudioObjectPropertyElementMaster
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       kAudioObjectPropertyElementMain
> =20
> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Framew=
or
> ks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note:
> 'kAudioObjectPropertyElementMaster' has been explicitly marked deprecated
> here kAudioObjectPropertyElementMaster
> API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain",
> macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) =3D
> kAudioObjectPropertyElementMain ^
>=20
> Replace by kAudioObjectPropertyElementMain, redefining it to
> kAudioObjectPropertyElementMaster if not available.
>=20
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Suggested-by: Roman Bolshakov <roman@roolebo.dev>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  audio/coreaudio.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e50..5b3aeaced0 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
>      bool enabled;
>  } coreaudioVoiceOut;
>=20
> +#if !defined(MAC_OS_VERSION_12_0) \
> +    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> +#endif
> +
>  static const AudioObjectPropertyAddress voice_addr =3D {
>      kAudioHardwarePropertyDefaultOutputDevice,
>      kAudioObjectPropertyScopeGlobal,
> -    kAudioObjectPropertyElementMaster
> +    kAudioObjectPropertyElementMain
>  };
>=20
>  static OSStatus coreaudio_get_voice(AudioDeviceID *id)
> @@ -69,7 +74,7 @@ static OSStatus coreaudio_get_framesizerange(AudioDevic=
eID
> id, AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyBufferFrameSizeRange,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>=20
>      return AudioObjectGetPropertyData(id,
> @@ -86,7 +91,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID i=
d,
> UInt32 *framesize) AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyBufferFrameSize,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>=20
>      return AudioObjectGetPropertyData(id,
> @@ -103,7 +108,7 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID
> id, UInt32 *framesize) AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyBufferFrameSize,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>=20
>      return AudioObjectSetPropertyData(id,
> @@ -121,7 +126,7 @@ static OSStatus coreaudio_set_streamformat(AudioDevic=
eID
> id, AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyStreamFormat,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>=20
>      return AudioObjectSetPropertyData(id,
> @@ -138,7 +143,7 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID
> id, UInt32 *result) AudioObjectPropertyAddress addr =3D {
>          kAudioDevicePropertyDeviceIsRunning,
>          kAudioDevicePropertyScopeOutput,
> -        kAudioObjectPropertyElementMaster
> +        kAudioObjectPropertyElementMain
>      };
>=20
>      return AudioObjectGetPropertyData(id,



