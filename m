Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE15F2FF5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 14:00:24 +0200 (CEST)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofK7T-0003iy-CI
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 08:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofK20-0007kg-TN
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:54:44 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:42139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofK1y-0006dr-4I
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=DjMT4rChuW+UJtQ301a6BbdLLRCAaAOYzqghIfp6pVQ=; b=EmEuW0udFFBxo5S28xnLviU3Fa
 e/qB5/WVL2PlR6YbYoDbqW9QI9tltwFgmnLXV8ibsJAJlELIFoPtYKQcqbit6Mp7//XaOv+w7+lRP
 4IbA9Jp9D+/T8odD2BApEceurb1yoV5HkPSn4k2yl/jOWGwXMI9n3mFeSaBJcy4KTbbItwMdqJU0a
 0k2kmirDR4ph9jeXd2PngSaXd12rj/tys7jYl0/2J2zBFxZIZ1+LOaRC3hoVues73fNMv5HS382NB
 hnpPawEeOdl7osFFwbw6onJL/6HPZlVfn/sHUjil5Riqe8tMJtEOMK6E4Mr2WmnSm+uZnitorDnQt
 BZ33HTm59HIY77x22NaWFsH8axbHfK/338Su/HucL295Cau7hiCl1l3cSEpjIbdhRqRnGyt+HsRGQ
 znax3vqddVDYscTj8dO93SpFpdluiCiYWEPF0X2DWbRbKZkg7AFftVKn3xyFIUHfYg8levrccw+jO
 05SYie0XvBpudA1fx6ZiHKBil/gjb+PlwYqDttwkiYzOl4Ui02JrZKy3HR/j9k+Mntfx4tkuIFyti
 TlYNSUG6K6AHWg6hSI1mcuR8s30yELh5Mcia9ifRmNLnBl3iI0KnXE7KFDDmtWzosQCYFGBZ7g26X
 P9+dRvW/yNX0FE7Z1uEtlr+LHq5XFv3H+SohpCeFk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, jb-gnumlists@wisemo.com
Cc: thuth@redhat.com, jasowang@redhat.com,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] build-sys: error when slirp is not found and not disabled
Date: Mon, 03 Oct 2022 13:54:38 +0200
Message-ID: <1721294.avtG3GjGtf@silver>
In-Reply-To: <832398553.RmnqxNm477@silver>
References: <20221003070534.2180380-1-marcandre.lureau@redhat.com>
 <YzqXuhJWloERf6Wm@redhat.com> <832398553.RmnqxNm477@silver>
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

On Montag, 3. Oktober 2022 12:48:35 CEST Christian Schoenebeck wrote:
> On Montag, 3. Oktober 2022 10:05:14 CEST Daniel P. Berrang=E9 wrote:
> > On Mon, Oct 03, 2022 at 11:05:34AM +0400, marcandre.lureau@redhat.com w=
rote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > >=20
> > > This is an alternative configure-time solution to "[PATCH] net:
> > > print a more actionable error when slirp is not found".
> > >=20
> > > See also "If your networking is failing after updating to the latest =
git
> > > version of QEMU..." ML thread.
> > >=20
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >=20
> > >  meson.build | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/meson.build b/meson.build
> > > index 8dc661363f..565096001d 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -657,6 +657,12 @@ if not get_option('slirp').auto() or have_system
> > >=20
> > >    endif
> > > =20
> > >  endif
> > >=20
> > > +if not get_option('slirp').disabled() and not slirp.found()
> > > +  error('libslirp is not explicitely disabled and was not found. ' +
> > > +        'Since qemu 7.2, libslirp is no longer included as a submodu=
le
> > > '
> > > +
> > > +        'fallback, you must install it on your system or
> > > --disable-libslirp.') +endif
> >=20
> > I understand the motivation, but this goes against the main principal
> > of our build time detection, which is to "do the right thing"
> > automatically. If libslirp is not present on the host, then I would
> > consider the need to pass --disable-libslirp to be a bug.
> >=20
> > I think this pain that people see of loosing slirp support is going to =
be
> > a pretty short term problem. IMHO it suffices to print a warning message
> > right at the very end of configure, after everything else, just for one
> > or two releases.
>=20
> I guess that many users would find it a bug as well if this core feature
> just stops working. Even if you add a warning; what will probably happen =
is
> that packages are first built without. You want to risk that backlash,
> users filing reports, etc?
>=20
> What about using this error for couple releases and then restoring symmet=
ry?
>=20
> Independent of this particular patch here, there is probably still someth=
ing
> wrong with slirp detection.
>=20
> - in the first run it detected correctly that slirp was not installed
> - then I installed slirp and it detected correctly that it was installed
> - then I uninstalled slirp-dev and slirp and build system still said:
>=20
> slirp support                : YES 4.4.0
>=20
> ... causing ...
>=20
> ../net/slirp.c:41:10: fatal error: libslirp.h: No such file or directory
>    41 | #include <libslirp.h>

Oh, it's because Meson caches this build dependency result. From
build/meson-logs/meson-log.txt:

Dependency slirp found: YES 4.4.0 (cached)

https://github.com/mesonbuild/meson/issues/2643

:/

Best regards,
Christian Schoenebeck




