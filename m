Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987AE5F2F26
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:55:39 +0200 (CEST)
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofJ6o-0006C6-EN
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofJ07-0002pp-29
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:48:44 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:49699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofJ04-00041b-SH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=r3t4cbEsF03a0u2uPL/2MC0MiBlirWfXpJ2kmZQ64mk=; b=ohp6up0nbE5xTKkouwgyYfSgyB
 f7+pHgc4T03dHzccJBp9SDPqviFRCjq+Q47/0eaeybCOFcYaRta8rOAgBF4kapsl1S4WqNWkaQQjI
 RtZvWDxC0016+PygRa6lLR5walTQW66OSPZukaqW9WxjOZQ8e1MgQVZj3m7L9ma/gPMQ7VRl+z8Xx
 0JOtPb6oCzOa7cbdDeXQwp6bke7/fLwTJBt3xuL6TgF5lQfU1s3X22BF3SD36ECO9wBk8J709xChs
 dizziDzQnwhie0HBZp/Lj9uzu0KXG1HjyV9QrlUkjCPb2YVvRqSXQsGBfOsOQHkdZvQVoI+/FvEA2
 qzLe0kldf+ZIp3DEoeLE6wGg4j3QmKRCJmN+P4TLZTH0YzEkjPmSH8eZwnKb0aHLwTl0EKhwuKgcA
 i9MogDv9FIPEzRoG5MZRnt9Jg/FRaM1Ebt1aXxlbA82NhC1fbUZy/27hsO2ZKi/TTs9z1uD+tuNSL
 qnIlgD4a3gdSe7EYmkY2b3dNJcV1ifEanIfo63gRFM3uruwH4+IomfbI3ezSW499Ca8RBu13ttkdj
 aUt1n3L2kmO/sJupcGVO35VCe3JklUi6yOKhVtJCl/lkffgxawu8qfCL/KeAf97/qv0ZIJ2jhC8zF
 JPopSGAaThGDNnX5kuaxsUgVpNsxV1/omCOaJJ6Ng=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, jb-gnumlists@wisemo.com
Cc: thuth@redhat.com, jasowang@redhat.com,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] build-sys: error when slirp is not found and not disabled
Date: Mon, 03 Oct 2022 12:48:35 +0200
Message-ID: <832398553.RmnqxNm477@silver>
In-Reply-To: <YzqXuhJWloERf6Wm@redhat.com>
References: <20221003070534.2180380-1-marcandre.lureau@redhat.com>
 <YzqXuhJWloERf6Wm@redhat.com>
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

On Montag, 3. Oktober 2022 10:05:14 CEST Daniel P. Berrang=E9 wrote:
> On Mon, Oct 03, 2022 at 11:05:34AM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> >=20
> > This is an alternative configure-time solution to "[PATCH] net:
> > print a more actionable error when slirp is not found".
> >=20
> > See also "If your networking is failing after updating to the latest git
> > version of QEMU..." ML thread.
> >=20
> > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >=20
> >  meson.build | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/meson.build b/meson.build
> > index 8dc661363f..565096001d 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -657,6 +657,12 @@ if not get_option('slirp').auto() or have_system
> >=20
> >    endif
> > =20
> >  endif
> >=20
> > +if not get_option('slirp').disabled() and not slirp.found()
> > +  error('libslirp is not explicitely disabled and was not found. ' +
> > +        'Since qemu 7.2, libslirp is no longer included as a submodule=
 '
> > +
> > +        'fallback, you must install it on your system or
> > --disable-libslirp.') +endif
>=20
> I understand the motivation, but this goes against the main principal
> of our build time detection, which is to "do the right thing" automatical=
ly.
> If libslirp is not present on the host, then I would consider the need to
> pass --disable-libslirp to be a bug.
>=20
> I think this pain that people see of loosing slirp support is going to be
> a pretty short term problem. IMHO it suffices to print a warning message
> right at the very end of configure, after everything else, just for one
> or two releases.

I guess that many users would find it a bug as well if this core feature ju=
st=20
stops working. Even if you add a warning; what will probably happen is that=
=20
packages are first built without. You want to risk that backlash, users fil=
ing=20
reports, etc?

What about using this error for couple releases and then restoring symmetry?

Independent of this particular patch here, there is probably still somethin=
g=20
wrong with slirp detection.

=2D in the first run it detected correctly that slirp was not installed
=2D then I installed slirp and it detected correctly that it was installed
=2D then I uninstalled slirp-dev and slirp and build system still said:

slirp support                : YES 4.4.0

=2E.. causing ...

=2E./net/slirp.c:41:10: fatal error: libslirp.h: No such file or directory
   41 | #include <libslirp.h>
      |          ^~~~~~~~~~~~

Best regards,
Christian Schoenebeck



