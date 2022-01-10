Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF4489AD2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:53:02 +0100 (CET)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6v6b-0000tG-Ld
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6uxF-00056b-CK
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:43:21 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:44417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6ux7-0005ps-Fd
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=sH6kohoE4IDloVZWTALrbYYo8BlkkrHbTxiV7+9exUU=; b=mW9cpKYN8G5hsA2ATOly5aFU68
 RlPSbnZD/hZgzAbufd3HVBVKj8Yb2jrCoz8l59BPdgorqZOrL4qEijZ+g5a8+sW/F0B0AQ3Jf/Uwz
 PYS9vyE5jN4sMESNi2jt0KpAgSNqHA0TGjM4Az0JzlBXuF+ZZiW/pTuSfRxCfwbzj27FuxRSTVRtm
 ILC5AIkfQjFSA2P94gW6B4/cQZqktSWFx30uawzNbrtABMDBGkUcUuT2wwWQA3MKiTtJEKNbuLDdw
 d5iSBhKYnOIFVGPu7Z3czV6cARqlvxqVb+Gyk92EDcMxz5uqaV/Ds5qO2uG5MuWaRiS/IyQrrSQRX
 Hxj8NNwhHv9K6cdLpraXmNfvNsc859NkPT8uRx2mmdwFc7ZjnHXEf05731yZ5LAAjVtFyBviXD8QW
 MAc9/BCTrXCeMw5ehytg20mLej+IZzELs/7j81AkjK+aXz1Bi0xqMnbF6Yp7dKOxZTYFEiSz9TkB9
 MFhL5ncoJy1xY/dVQiVwbv9UEXm3BDXpNxUEARCTvG2maCb8LWJoN7lv5lWUhnxCCQS4SU11vsVeu
 /MlM/JI4FW6Q5ejnt5lGGviB05AZm/3uljBiPCKokQVpEDBT81IVoG7X2NoE3EnWM8AA4pExvhpyO
 k/BysqBz7cwj0bZLegPgqf7hUJMrQWMykP255wjBI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH v3 5/7] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Date: Mon, 10 Jan 2022 14:43:09 +0100
Message-ID: <2320709.qF9rzA1ROV@silver>
In-Reply-To: <da52a8ca-6132-022a-0b3c-8bcb0d5e4620@amsat.org>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-6-f4bug@amsat.org>
 <da52a8ca-6132-022a-0b3c-8bcb0d5e4620@amsat.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Montag, 10. Januar 2022 14:20:56 CET Philippe Mathieu-Daud=E9 wrote:
> On 1/10/22 14:09, Philippe Mathieu-Daud=E9 wrote:
> > When building on macOS 12 we get:
> >   audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is
> >   deprecated: first deprecated in macOS 12.0
> >   [-Werror,-Wdeprecated-declarations]>  =20
> >       kAudioObjectPropertyElementMaster
> >       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       kAudioObjectPropertyElementMain
> >  =20
> >   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Fr=
ame
> >   works/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note:
> >   'kAudioObjectPropertyElementMaster' has been explicitly marked
> >   deprecated here>  =20
> >       kAudioObjectPropertyElementMaster
> >       API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain",
> >       macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0,
> >       15.0)) =3D kAudioObjectPropertyElementMain ^
> >=20
> > Replace by kAudioObjectPropertyElementMain, redefining it to
> > kAudioObjectPropertyElementMaster if not available, using
> > Clang __is_identifier() feature (coreaudio is restricted to
> > macOS).
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > ---
> >=20
> > Checkpatch:
> >  WARNING: architecture specific defines should be avoided
> >  #10: FILE: audio/coreaudio.c:47:
> >  +#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >=3D 1=
2.0
> >  */
> >=20
> > Should we define __is_identifier() to 0 for GCC on macOS?
>=20
> So apparently yes:
> https://lore.kernel.org/qemu-devel/2147921.xlN1UyrzLN@silver/
>=20
> Christian Schoenebeck suggests:
>=20
> #if !defined(MAC_OS_VERSION_12_0) ||
>     (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> #endif

Note: line wrap. So don't forget a backslash at the end:

#if !defined(MAC_OS_VERSION_12_0) || \
    (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
#endif

I guess you would have seen it in the editor anyway, but just to be sure.

>=20
> > ---
> >=20
> >  audio/coreaudio.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> > index d8a21d3e507..73cbfd479ac 100644
> > --- a/audio/coreaudio.c
> > +++ b/audio/coreaudio.c
> > @@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
> >=20
> >      bool enabled;
> > =20
> >  } coreaudioVoiceOut;
> >=20
> > +#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >=3D 12=
=2E0 */
> > +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMas=
ter
> > +#endif
> > +
> >=20
> >  static const AudioObjectPropertyAddress voice_addr =3D {
> > =20
> >      kAudioHardwarePropertyDefaultOutputDevice,
> >      kAudioObjectPropertyScopeGlobal,
> >=20
> > -    kAudioObjectPropertyElementMaster
> > +    kAudioObjectPropertyElementMain
> >=20
> >  };



