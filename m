Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD073514CE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:33:51 +0200 (CEST)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwWE-0002Xo-5H
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lRwGM-0003MG-LM
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:17:26 -0400
Received: from 13thmonkey.org ([80.100.255.32]:60841
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lRwGK-0006ST-LY
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:17:26 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 3F8B3C139C5; Thu,  1 Apr 2021 14:17:22 +0200 (CEST)
Date: Thu, 1 Apr 2021 14:17:22 +0200
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 1/4] Add NVMM accelerator: configure and build logic
Message-ID: <YGW50ugBOV+GIe+3@diablo.13thmonkey.org>
References: <20210331200800.24168-1-reinoud@NetBSD.org>
 <20210331200800.24168-2-reinoud@NetBSD.org>
 <5251852d-19ac-11d1-6343-6e1156d81f3e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1M8JQhQOgUbwGJNZ"
Content-Disposition: inline
In-Reply-To: <5251852d-19ac-11d1-6343-6e1156d81f3e@redhat.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1M8JQhQOgUbwGJNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paolo,

thanks for the review!

On Thu, Apr 01, 2021 at 10:28:19AM +0200, Paolo Bonzini wrote:
> On 31/03/21 22:07, Reinoud Zandijk wrote:
> > Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>
> > Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>
> 
> Incorrect order for the S-o-b headers, you should be last.

Oops? there is a prescribed order in those? Will change the order!

> > ---
> > @@ -886,7 +887,7 @@ for opt do
> >     ;;
> >     --python=*) python="$optarg" ; explicit_python=yes
> >     ;;
> > -  --sphinx-build=*) sphinx_build="$optarg"
> > +  --sphinx-build-3.8-3.8=*) sphinx_build="$optarg"
> 
> Oops. :)  Another occurrence later.

Ai ai ai, a different patch krept in! In pkgsrc all patches on a single file
are normally combined and thus they krept in!

> > diff --git a/meson.build b/meson.build
> > index c6f4b0cf5e..e33face775 100644
> > --- a/meson.build
> > +++ b/meson.build
> 
> The meson.build parts can be simplified by applying this patch:
> 
> diff --git a/meson.build b/meson.build

Thanks! Will try it out and add to the patch.

> > @@ -625,7 +641,7 @@ if have_system and not get_option('curses').disabled()
> >       endif
> >     endif
> >     if not get_option('iconv').disabled()
> > -    foreach link_args : [ ['-liconv'], [] ]
> > +    foreach link_args : [ [], ['-liconv'] ]
> >         # Programs will be linked with glib and this will bring in libiconv on FreeBSD.
> >         # We need to use libiconv if available because mixing libiconv's headers with
> >         # the system libc does not work.
> 
> Independent changes, should be posted separately.

Yep, those shouldn't be in this patchset indeed, see above.

Will try to fix it and go for version 7 soon.

Is there a way for `qemu format-patch' to preserve the comments made in the
previous run? It would be handy if it would paste in the old patchset's
comments in the new patchset :)

Reinoud


--1M8JQhQOgUbwGJNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBluc8ACgkQgpw3AEPI
qmiH4Af+LyvPVb+ipiTX1w1fV1JfjAivBy/cjvM0+cWxpVW2FbpuRzxfBE7VPCUg
z9AqfH3Lo6+2PD7ncOm7PApfxJ2pr8b1PiCi9KVL9cLJPeDZTFow9mIZNCYDrBwt
jgAoO4aYB0iqxYJvxbfljv59/1sYJgJQ6J7BEXt/d7EggZ531SGSGeSgTXjsE8Ik
QmMCO5zAuT7aFMRwdjJjgam7EA3Y1P41MB/7sUyVpYFOcX0a1a3MOnVJ0b2bsEQI
imwqRjSVFSXRIAwoaaxN74Zt/KDYA1TZOuTU5Qe1itBeZzwtPDwVxeOJ1aQvdu/E
SI8B/x8XSmOuHLUXldHgAR18Bs+MdA==
=KyoY
-----END PGP SIGNATURE-----

--1M8JQhQOgUbwGJNZ--

