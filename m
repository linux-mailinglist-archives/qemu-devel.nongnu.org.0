Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C624B6E7C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:15:54 +0100 (CET)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJycT-0003c5-O9
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:15:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJyYN-00075r-2Z
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:11:39 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJyXy-0004a8-I1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=EYGpwzbin/SpCHWu6C+bOyGw+HpODDHfIyueZzl56Ts=; b=quME1pXF2kP8p4oan7u99RfyYw
 PCuqg3TpNC1Bv7c42yj68VwsCDgLVbxxnhz6tX7m9hBwVd8pSbTPUtFmzmNAlSPGXjA9VqsZP8XBt
 FSd17lccXJ203DkmpEWSlRsWPF8i2osJS0fVB6ISHPLkdsk/gh/d8K/rug6VEHxpydzkWGgKidg6P
 bF2sCEvJY5netUGeB0q7qBtjuR28+2yIExCWio5lEV6rMRdtP0uxSDX8D7o6sNoyvnajCU5Msx5NE
 mh7HX3vSexLpnSfDhJCC4AsVYUPLggMAQ5FAh4iwQp8PFoCF0J0EVFLkmhI14XpOV1Jii5MCgdui9
 2YKiGTOA/h2xNdwBYEiomyk/zfAP7jDqt5sV7zPI1f1tf49JM7q6/GwRnnbAW0kWMCNABiLIsAUcF
 akeyaxP3qgBsDqdko4tbX9BjZ8l+DkAG8JvB7ufw+HHZiHGzqK1J4lz/+yIN/3vmYObKxglEyFCOQ
 pEeVRijKQ0IJvxiFWuYzW66r0yWtOcTNv3AHP58dhh1pkJ0b+/FIAs2wXcSutH/x494lQofPEhtOJ
 zhh7S7jGhoJc1hS1T4tqys5hzvklkuNj5vPlatDxpZOVoalHB4JBZNXGFK+OYfuCPdyWu/9tz5h96
 9cp0fYTdoHmhUguEsa0zo7QDPFeXj7/Tng6Zdi4Dk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
Date: Tue, 15 Feb 2022 15:11:08 +0100
Message-ID: <2344563.XbXamImqsm@silver>
In-Reply-To: <CAFEAcA_58__sVrAdN410PvketwTLyyYb=OZ4y2oWDjMYGW+J0g@mail.gmail.com>
References: <20220215120625.64711-1-f4bug@amsat.org>
 <5430167.XuPm0vUgvV@silver>
 <CAFEAcA_58__sVrAdN410PvketwTLyyYb=OZ4y2oWDjMYGW+J0g@mail.gmail.com>
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

On Dienstag, 15. Februar 2022 14:45:00 CET Peter Maydell wrote:
> On Tue, 15 Feb 2022 at 13:18, Christian Schoenebeck
>=20
> <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 15. Februar 2022 13:06:25 CET Philippe Mathieu-Daud=E9 via=
=20
wrote:
> > > We globally ignore the 'initializer overrides' warnings in C code
> > > since commit c1556a812a ("configure: Disable (clang)
> > > initializer-overrides warnings"). Unfortunately the ${gcc_flags}
> > > variable is not propagated to Objective-C flags ($OBJCFLAGS).
> > > Instead of reworking the configure script to test all supported
> > > C flags in Objective-C and sanitize them, ignore the warning
> > > locally with the GCC diagnostic #pragma (Clang ignores it).
> > >=20
> > > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > > ---
> >=20
> > What about this instead:
> >=20
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index ac18e14ce0..df9b9be999 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -652,9 +652,7 @@ QemuCocoaView *cocoaView;
> >=20
> >      /* translates Macintosh keycodes to QEMU's keysym */
> >=20
> > -    int without_control_translation[] =3D {
> > -        [0 ... 0xff] =3D 0,   // invalid key
> > -
> > +    int without_control_translation[256] =3D {
>=20
> I think this won't zero-initialize, because this is a function
> level variable, not a global or static, but maybe ObjectiveC
> rules differ from C here? (Besides, it really should be
> a static const array.) That said...

That's a base requirement for designated initializers to fallback to automa=
tic=20
default initialization (zero) for omitted members. It's like:

	int a[10] =3D { }; // all zero

It works for me (including on function level) with both GCC and clang, on=20
Linux and macOS:

#include <stdio.h>

int main() {
    int a[] =3D {
        [4] =3D 409,
        [6] =3D 609,
        [9] =3D 909
    };
    for (int i =3D 0; i < 10; ++i)
        printf("a[%d] =3D %d\n", i, a[i]);
    return 0;
}

Was this ever not the case?

> > That warning should only be raised on overlapping designated
> > initializations which strictly is undefined behaviour. Because which
> > order defines the precedence of overlapping initializers, is it the ord=
er
> > of the designated intializer list, or rather the memory order?
>=20
> This is defined: textually last initializer wins.
> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html
>=20
> > See also:
> > https://stackoverflow.com/questions/40920714/is-full-followed-by-partia=
l-i
> > nitialization-of-a-subobject-undefined-behavior
> That's about struct initializers; we're dealing with array initializers
> here.

Yes, but if you suppress this warning globally, you shut up the potential=20
warning for the linked case as well. And as demonstrated there, you would e=
nd=20
up with different/unexpected behaviour depending on the precise compiler be=
ing=20
used.

So I still think it is not a good idea to suppress this warning globally.

Best regards,
Christian Schoenebeck

> > So I have my doubts whether this warning suppression should be used in
> > QEMU at all.
>=20
> The warning is useful in the pure-standard-C world where there
> is no such thing as the "range initialization" syntax. In that
> case trying to initialize the same array member twice is very
> likely a bug. However, if you use range initialization then
> the pattern "initialize a range first, then override some specific
> members within it" is very common and the warning is incorrect here.
> We use and like the range-initialization syntax, and so we disable
> the -Winitializer-overrides warnings. The bug here is just that
> we are incorrectly failing to apply the warning flags we use
> for C code when we compile ObjC files.
>=20
> thanks
> -- PMM



