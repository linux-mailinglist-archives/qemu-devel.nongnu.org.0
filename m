Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88B65993E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 15:03:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBFxU-0000L6-Rd; Fri, 30 Dec 2022 09:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pBFxR-0000Kl-68
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 09:02:01 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pBFxP-0005Jf-FW
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 09:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=y8O8tWxNV711rDLcj2IbWfu2PvH/TWG3OuyR4S26+zo=; b=IGIdloQEPbK4Ox9/pgzd3FqJRI
 ON1wOVd8jWmLar2xodCrByd4jimsYjn8RKC8m/TlcjvUXvqJ7WZdMxGNE3k6vDFHZwS4qJdZkk1FR
 Xq+I4UsKT3JE6d4nX+KCPRsDdldTWoW0LaacN6qS1hacacUJ6zpswEr9cweUowqBuZdj0T1ZUq0Nn
 akalibG8AKOMKPxBXzbJfeKhi6Z1W36UtLCoTnp1Mr6uJj4xnTeWJC7Qa/NXTVJPXYMhKwdZyo9oq
 Wv2ldC6qoulUnP2ScWvskT28B2sd7oN1ER+RYZWezGUXV7Qxp7mmpctycu0iwIXh1frZuv5kkDCRP
 nfXBO9IUvN76Kb2z3sNcK8ElPAeJsDGP3TJh7bgUZjyODyiN++pONV8ICorC2uIkFeeB3qHVQT1ug
 iFuRswEraSaldHXmJlTMylJyv2ub15Idink4f9zCe9VpWfxPB9mguIekNMUNQQ8MTt2cpW73HTd5i
 JgHZF1EIHFSnQg8IAfZB2uYrOo/4rxKMVShfz3Bwa6Se9ua5dvBVivviriCmxs07xmyt7rTPTgClI
 HL6jVaRUNu9LORKXVPf6i9Y8UrVwhPZvuaa4vjwfX44ULQfB9aHqomsyAxVzVVDE0GcV4605T2n3I
 21OoISI3qTxqwREMnnhmEJr4AGzvFs6ydFlGBadyE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH] ui/cocoa: user friendly characters for release mouse
Date: Fri, 30 Dec 2022 15:01:56 +0100
Message-ID: <2747646.NkXQSxgv1M@silver>
In-Reply-To: <50787eef-d8a2-2790-749c-407e90e1d46f@linaro.org>
References: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com>
 <50787eef-d8a2-2790-749c-407e90e1d46f@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, December 29, 2022 1:31:09 PM CET Philippe Mathieu-Daud=E9 wrot=
e:
> On 27/12/22 17:15, Christian Schoenebeck wrote:
> > While mouse is grabbed, window title contains a hint for the user what
> > keyboard keys to press to release the mouse. Make that hint text a bit
> > more user friendly for a Mac user:
> >=20
> >   - Replace "Ctrl" and "Alt" by appropriate symbols for those keyboard
> >     keys typically displayed for them on a Mac (encode those symbols by
> >     using UTF-8 characters).
> >=20
> >   - Drop " + " in between the keys, as that's not common on macOS for
> >     documenting keyboard shortcuts.
> >=20
> >   - Convert lower case "g" to upper case "G", as that's common on macOS.
> >=20
> >   - Add one additional space at start and end of key stroke set, to
> >     visually separate the key strokes from the rest of the text.
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >   ui/cocoa.m | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index e915c344a8..289a2b193e 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -72,6 +72,9 @@
> >  =20
> >   #define cgrect(nsrect) (*(CGRect *)&(nsrect))
> >  =20
> > +#define UC_CTRL_KEY "\xe2\x8c\x83"
> > +#define UC_ALT_KEY "\xe2\x8c\xa5"
> > +
> >   typedef struct {
> >       int width;
> >       int height;
> > @@ -1135,9 +1138,9 @@ - (void) grabMouse
> >  =20
> >       if (!isFullscreen) {
> >           if (qemu_name)
> > -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %=
s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
> > +            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %=
s - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)", qemu_name=
]];
>=20
> I was a bit confused by the control symbol at first and tough
> I had to press '^'; thus I'm not sure keeping 'ctrl' wouldn't
> be clearer. The UC_ALT_KEY symbol certainly is. Anyhow,

It _should_ be clear to Mac users that "^" =3D=3D "control" key on a Mac ke=
yboard,
as that's how it is presented for keyboard shortcuts in all Mac menus. But =
if
it's really irritating then we can also revert that to either "Ctrl" or
"control". It's a quick change.

I just got itched by the "Alt" hint actually, which is not printed on any M=
ac
keyboard.

> Tested-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>

Thanks!

> >           else
> > -            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to r=
elease Mouse)"];
> > +            [normalWindow setTitle:@"QEMU - (Press  " UC_CTRL_KEY " " =
UC_ALT_KEY " G  to release Mouse)"];
> >       }
> >       [self hideCursor];
> >       CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>=20
>=20
>=20



