Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA964B36DA
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 18:42:30 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIwPk-00024t-Kf
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 12:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIwOn-0001Q7-2O
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 12:41:29 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIwOl-0002Fp-4N
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 12:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=qMAkXOu02/WFtM3jirc40ScFiLbXjCc9myz6/S0kPEg=; b=s0rFdux44H6JQuwX8TA7LRTI0T
 MIqVie3JIsPtPXc3+sVfiWbj0tMK+UHM8+ujYs4u9Dxp2SrwUlkfpckbICTh9wHkDVydtbzmqIDSe
 P/ZT9J8xhWI7iVEsC/Kp817y19NNOE5gKlwUmtDVS89rtjfhR0GeofhFvwuRSw7jeYmX+gJxFhK5q
 j/whyyv3v9wPz92ZXsnGhMsbtr7vXjCJsAvd+R3yVdIzHVHumfR9SYjpuDhcE8l4ameakb803AG4B
 GcNCn+Gj+sZiYWxVbPJYDlhOjBI1bfRoQgSWNbB3rM5I8vOikiyvyYhET+63CWDrNF7PoyxE6wAcr
 phJP5X5kbkgKE4uAW3KOGgdtDjdcgDFwzGLxD3AUeCDN1LMJkGk0WbAGwjhqNAO9fFgFHWpFK+mHJ
 gf6z9wRhQ6KrS7A+ZTGLFmjlMOPmoJJvqPEBG59JRM9G6+ECupDKWA2dFn8wkc4v9FNR++MLPbEYz
 ixTTF8bvVlwKLBUEwFtHBNW5sfedOCHIFpwwCu03vqSugcOidNrysu4smXbWzNOqNNujjLqBkwqsP
 6givWPdcwFVl2hkGvhs1wfQMpvZVs7XquPvxD1PcpV14f/S0AUwgGEMXoGCiausix5X06CrK4k3aI
 fvgd7LReSSEwqXoP7qimRiJjIVPHAZHOEYlVAbS6c=;
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
Date: Sat, 12 Feb 2022 18:41:22 +0100
Message-ID: <16783907.PEdtDGfWnU@silver>
In-Reply-To: <2104509.vKTA94REe0@silver>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <ef7e75a3-45af-28a0-8460-86013bf2164c@gmail.com> <2104509.vKTA94REe0@silver>
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

On Samstag, 12. Februar 2022 18:27:18 CET Christian Schoenebeck wrote:
> On Samstag, 12. Februar 2022 16:23:49 CET Akihiko Odaki wrote:
> > On 2022/02/12 1:34, Philippe Mathieu-Daud=E9 via wrote:
> > > When building on macOS 12 we get:
> > >    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster'=
 is
> > >    deprecated: first deprecated in macOS 12.0
> > >    [-Werror,-Wdeprecated-declarations]>
> > >   =20
> > >        kAudioObjectPropertyElementMaster
> > >        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >        kAudioObjectPropertyElementMain
> > >   =20
> > >    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library=
/Fr
> > >    am
> > >    eworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note:
> > >    'kAudioObjectPropertyElementMaster' has been explicitly marked
> > >    deprecated here>
> > >   =20
> > >        kAudioObjectPropertyElementMaster
> > >        API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMa=
in"
> > >        ,
> > >        macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0,
> > >        15.0)) =3D kAudioObjectPropertyElementMain ^
> > >=20
> > > Replace by kAudioObjectPropertyElementMain, redefining it to
> > > kAudioObjectPropertyElementMaster if not available.
> > >=20
> > > Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > > Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Suggested-by: Roman Bolshakov <roman@roolebo.dev>
> > > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >   audio/coreaudio.c | 17 +++++++++++------
> > >   1 file changed, 11 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> > > index d8a21d3e50..5b3aeaced0 100644
> > > --- a/audio/coreaudio.c
> > > +++ b/audio/coreaudio.c
> > > @@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
> > >=20
> > >       bool enabled;
> > >  =20
> > >   } coreaudioVoiceOut;
> > >=20
> > > +#if !defined(MAC_OS_VERSION_12_0) \
> > > +    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> > > +#define kAudioObjectPropertyElementMain
> > > kAudioObjectPropertyElementMaster
> > > +#endif
> > > +
> >=20
> > Unless I have missed something, we have found
> > MAC_OS_X_VERSION_MIN_REQUIRED is better even for a constant in the
> > following thread:
> > https://lore.kernel.org/all/524515d6-2fb5-15c1-0aaf-bcda3684cd00@gmail.=
com
> > /
> >=20
> > Regards,
> > Akihiko Odaki
>=20
> Well, MAC_OS_X_VERSION_MIN_REQUIRED would work as well, note though that =
it
> would effectively result with older SDKs (Xcode <=3D 13.0) to this:
>=20
> enum {
>   MAIN,
>   MASTER =3D MAIN
> };
>=20
> #define MAIN MASTER
>=20
> int main() {
>    int k =3D MAIN;
> }
>=20
> Which compiles and works (as both enums reflect the same value anyway), b=
ut
> strictly the defined preprocessor macro would mask (with older SDKs) the
> already existing enum. Not that I would care, just noting.
>=20
> On practical side though, your solution (MAC_OS_X_VERSION_MIN_REQUIRED)
> would avoid deprecation warnings in future. So yes, maybe it's a bit
> better.

Correction: it would result in this masking scenario with recent SDK (e.g.=
=20
Xcode 13.2.1) and targeting a minimum deployment target macOs <12.0 (not wh=
en=20
compiling directly with Xcode <13.1).

Best regards,
Christian Schoenebeck



