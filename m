Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725284B36D0
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 18:28:46 +0100 (CET)
Received: from localhost ([::1]:38232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIwCT-000447-4T
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 12:28:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIwBB-0002dF-Tb
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 12:27:26 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIwB9-0004IE-C3
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 12:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=fl15YwWFNdfRsBhageop61xiyeKYUgJKOSjNL2gJSEg=; b=LhwqP97MhrdE5tzU3W3JukeSmM
 rsluo7W03nf9dOnNazukaMIBH6lonmTPnVzq3NwHM1O4sIaROa4fxJntzzjcukiRAHcj64E2bVLmb
 ZTx6a6KXlgZaz4Eas1U3IrmMiDUFgNZv43+h18JUMwqMf+2G5BiBN7tG6r4lOsliy5rJcbBQpINnv
 czdHz97h5fAeTRBQS7TFtu9eZ5JzxLEZYTYHpAw75RtCJHuaocdxWoapv4miDgh+WqRkPsZk2rxkG
 uwvvxfa5RnCqYzqvMf9viMK4g1nwDW7N0fOXO6vPBefSUPR9aS/ibzk3G8xc9R8/Aj6LDpaAN8eks
 Xn/SK7iOZPZEnNvr9quP8dNROYJKT+6RyqxvJ99P2uWW2i4g+Tq1UDR8Lr5p2rIbyDmh2KTuV3S+8
 n/qsY29OAfbYJbF3bjGoTh1T2/P/s5znG+/NDprx2PCccYDRmOa5JrGXc8keWW2vMee4/1Q8e3UAu
 xSPhYOWIcqDfQSGYEZBMHFJ8s4HvOD18BLhB3v7nEi6B6u21wLgd15RCDD283bEI6ZmNZkrMr/DDt
 sjN0I/MRbpswGfb6fk6/z1iEIqv1KF2akWZb/B4/qL1Mo2jT7kJUtBrzwyJaoB1fnfo5gW44mEKnl
 8bRxaSaYePqf03/i0n4BbSR2+hUpacIQPaW44bhhw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 Roman Bolshakov <roman@roolebo.dev>
Subject: Re: [PATCH v4 10/13] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Date: Sat, 12 Feb 2022 18:27:18 +0100
Message-ID: <2104509.vKTA94REe0@silver>
In-Reply-To: <ef7e75a3-45af-28a0-8460-86013bf2164c@gmail.com>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-11-f4bug@amsat.org>
 <ef7e75a3-45af-28a0-8460-86013bf2164c@gmail.com>
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

On Samstag, 12. Februar 2022 16:23:49 CET Akihiko Odaki wrote:
> On 2022/02/12 1:34, Philippe Mathieu-Daud=E9 via wrote:
> > When building on macOS 12 we get:
> >    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is
> >    deprecated: first deprecated in macOS 12.0
> >    [-Werror,-Wdeprecated-declarations]>   =20
> >        kAudioObjectPropertyElementMaster
> >        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >        kAudioObjectPropertyElementMain
> >   =20
> >    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/F=
ram
> >    eworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note:
> >    'kAudioObjectPropertyElementMaster' has been explicitly marked
> >    deprecated here>   =20
> >        kAudioObjectPropertyElementMaster
> >        API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain=
",
> >        macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0,
> >        15.0)) =3D kAudioObjectPropertyElementMain ^
> >=20
> > Replace by kAudioObjectPropertyElementMain, redefining it to
> > kAudioObjectPropertyElementMaster if not available.
> >=20
> > Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Suggested-by: Roman Bolshakov <roman@roolebo.dev>
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >=20
> >   audio/coreaudio.c | 17 +++++++++++------
> >   1 file changed, 11 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> > index d8a21d3e50..5b3aeaced0 100644
> > --- a/audio/coreaudio.c
> > +++ b/audio/coreaudio.c
> > @@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
> >=20
> >       bool enabled;
> >  =20
> >   } coreaudioVoiceOut;
> >=20
> > +#if !defined(MAC_OS_VERSION_12_0) \
> > +    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> > +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMas=
ter
> > +#endif
> > +
>=20
> Unless I have missed something, we have found
> MAC_OS_X_VERSION_MIN_REQUIRED is better even for a constant in the
> following thread:
> https://lore.kernel.org/all/524515d6-2fb5-15c1-0aaf-bcda3684cd00@gmail.co=
m/
>=20
> Regards,
> Akihiko Odaki

Well, MAC_OS_X_VERSION_MIN_REQUIRED would work as well, note though that it=
=20
would effectively result with older SDKs (Xcode <=3D 13.0) to this:

enum {
  MAIN,
  MASTER =3D MAIN
};

#define MAIN MASTER

int main() {
   int k =3D MAIN;
}

Which compiles and works (as both enums reflect the same value anyway), but=
=20
strictly the defined preprocessor macro would mask (with older SDKs) the=20
already existing enum. Not that I would care, just noting.

On practical side though, your solution (MAC_OS_X_VERSION_MIN_REQUIRED) wou=
ld=20
avoid deprecation warnings in future. So yes, maybe it's a bit better.

Best regards,
Christian Schoenebeck

>=20
> >   static const AudioObjectPropertyAddress voice_addr =3D {
> >  =20
> >       kAudioHardwarePropertyDefaultOutputDevice,
> >       kAudioObjectPropertyScopeGlobal,
> >=20
> > -    kAudioObjectPropertyElementMaster
> > +    kAudioObjectPropertyElementMain
> >=20
> >   };
> >  =20
> >   static OSStatus coreaudio_get_voice(AudioDeviceID *id)
> >=20
> > @@ -69,7 +74,7 @@ static OSStatus
> > coreaudio_get_framesizerange(AudioDeviceID id,>=20
> >       AudioObjectPropertyAddress addr =3D {
> >      =20
> >           kAudioDevicePropertyBufferFrameSizeRange,
> >           kAudioDevicePropertyScopeOutput,
> >=20
> > -        kAudioObjectPropertyElementMaster
> > +        kAudioObjectPropertyElementMain
> >=20
> >       };
> >      =20
> >       return AudioObjectGetPropertyData(id,
> >=20
> > @@ -86,7 +91,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID
> > id, UInt32 *framesize)>=20
> >       AudioObjectPropertyAddress addr =3D {
> >      =20
> >           kAudioDevicePropertyBufferFrameSize,
> >           kAudioDevicePropertyScopeOutput,
> >=20
> > -        kAudioObjectPropertyElementMaster
> > +        kAudioObjectPropertyElementMain
> >=20
> >       };
> >      =20
> >       return AudioObjectGetPropertyData(id,
> >=20
> > @@ -103,7 +108,7 @@ static OSStatus coreaudio_set_framesize(AudioDevice=
ID
> > id, UInt32 *framesize)>=20
> >       AudioObjectPropertyAddress addr =3D {
> >      =20
> >           kAudioDevicePropertyBufferFrameSize,
> >           kAudioDevicePropertyScopeOutput,
> >=20
> > -        kAudioObjectPropertyElementMaster
> > +        kAudioObjectPropertyElementMain
> >=20
> >       };
> >      =20
> >       return AudioObjectSetPropertyData(id,
> >=20
> > @@ -121,7 +126,7 @@ static OSStatus
> > coreaudio_set_streamformat(AudioDeviceID id,>=20
> >       AudioObjectPropertyAddress addr =3D {
> >      =20
> >           kAudioDevicePropertyStreamFormat,
> >           kAudioDevicePropertyScopeOutput,
> >=20
> > -        kAudioObjectPropertyElementMaster
> > +        kAudioObjectPropertyElementMain
> >=20
> >       };
> >      =20
> >       return AudioObjectSetPropertyData(id,
> >=20
> > @@ -138,7 +143,7 @@ static OSStatus coreaudio_get_isrunning(AudioDevice=
ID
> > id, UInt32 *result)>=20
> >       AudioObjectPropertyAddress addr =3D {
> >      =20
> >           kAudioDevicePropertyDeviceIsRunning,
> >           kAudioDevicePropertyScopeOutput,
> >=20
> > -        kAudioObjectPropertyElementMaster
> > +        kAudioObjectPropertyElementMain
> >=20
> >       };
> >      =20
> >       return AudioObjectGetPropertyData(id,



