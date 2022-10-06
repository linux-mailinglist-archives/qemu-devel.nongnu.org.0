Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F25F6442
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 12:17:55 +0200 (CEST)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogNww-0005nh-GX
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 06:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogNrR-0000vP-Ui
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:12:15 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:58719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogNrP-0003rA-C4
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=BQ5wQmYFpOUGGBVazS0b6ycGCPB4TXFJaITvsP35DR0=; b=qk9Ep3a/0s73WfzV4wC8pjqLz8
 T829+uUHxkOBm6Atl/sGzL1bZ00tvaZ3o8/TjGjbO+lxD7RutTh/BVCmAO1m0p3yf8KBeve8CGjAT
 +wuanfxVuVat7EMu5jufQhXpHsq8o3YJvTrC1S8u8mWcshirLwbpeqZGTyuZzOv9vhBdZQVH4efV+
 b2MWqK59B9OuKvzamh5vojSE6RIV2IJCaFkHcK4k+8SUMzmOPoRWSz0r8mfO/sTtUyDAcsg0z+/YA
 9TtL8HmDeqyKG0z3KfrTvNbuZEiz26eJ1BaWDqFalkbCZg29Ju9KBUKizkuWrJgjYpQ4fNDxwQsaI
 gjWLi3SUX4OgBs7AF7WfhqL+TS0VHWnUEAOgwyWRiURh6y+Bs3cf0xB2jpJJY949ALXx0Kc4BxBTq
 XKUDwCJf4/oiLBw+K4YRRh5S+a3nkR1pAJx7BUJcRND+fCQE/O4fBr6XNchewse0RV2i+gS8qhhaK
 JVqmYpi29vPB417ToD+zz5ZX9nI/pgTVsi5bHAf82krv5iI53eAyhaMqr6Ni9tuLrCtbGEKbzYPDR
 xYUApaLdd4+IJEB13ChCPL3mWW6ZXm9Uq60jyxEAKAY5F7AD4/A9/19SdE5MRj8WL836fuyGVSPHZ
 IEj8qrHZuo43uZ4BC8lcwOKAJ/bQKTkId5UzBm+RI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: marcandre.lureau@redhat.com,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, jb-gnumlists@wisemo.com, thuth@redhat.com,
 jasowang@redhat.com
Subject: Re: [PATCH v2] build-sys: error when slirp is not found and not
 disabled
Date: Thu, 06 Oct 2022 12:12:07 +0200
Message-ID: <4315090.nadSx8SW9V@silver>
In-Reply-To: <Yz6iNj5vTrMlunD2@redhat.com>
References: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
 <Yz6iNj5vTrMlunD2@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Donnerstag, 6. Oktober 2022 11:39:02 CEST Daniel P. Berrang=C3=A9 wrote:
> On Thu, Oct 06, 2022 at 12:33:22PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >=20
> > This is an alternative configure-time solution to "[PATCH] net:
> > print a more actionable error when slirp is not found".
> >=20
> > See also "If your networking is failing after updating to the latest git
> > version of QEMU..." ML thread.
> >=20
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >=20
> >  meson.build | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/meson.build b/meson.build
> > index 4321b8f8da..b05080b051 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -690,6 +690,13 @@ if not get_option('slirp').auto() or have_system
> >=20
> >    endif
> > =20
> >  endif
> >=20
> > +# Remove this error after QEMU 8.1 has been released.
> > +if not get_option('slirp').disabled() and not slirp.found()
> > +  error('libslirp is not explicitely disabled and was not found. ' +
> > +        'Since qemu 7.2, libslirp is no longer included as a submodule=
 '
> > +
> > +        'fallback, you must install it on your system or
> > --disable-slirp.') +endif
> > +
>=20
> I'm still not convinced we should be making this a fatal error, as
> opposed to treating it as a warning we display at the end of meson
> execution, which is what we do in other cases where we want to
> alert users to something important about their build environment.
>=20
> We have this for example:
>   message()
>   warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!')
>   message()
>   message('CPU host architecture ' + cpu + ' support is not currently
>   maintained.') message('The QEMU project intends to remove support for
>   this host CPU in') message('a future release if nobody volunteers to
>   maintain it and to') message('provide a build host for our continuous
>   integration setup.') message('configure has succeeded and you can
>   continue to build, but') message('if you care about QEMU on this platfo=
rm
>   you should contact') message('us upstream at qemu-devel@nongnu.org.')
>=20
> This is just as important to show users as the slirp case IMHO, so
> it isn't clear why this approach is insufficient for slirp too.

There is a substantial difference between those two cases: the user
immediately realizes that the missing CPU arch is not available, whereas in
this missing SLIRP case it happened to myself that I was just testing a VM
(without any networking args) and scratched my head why networking on VM
stopped working without any error message at all, so I started to check my
networking, routing, VM network config, host config, found nothing, and
eventually git-bisected the issue just to find out that its because slirp h=
as
been removed as a submodule. And I am a developer, so imagine what a regular
user might think.

And yes, with that warning it would have saved my trouble at least, but=20
considering that binaries are often auto built, chances are high that they =
are
at first rolled out without SLIRP and hence without user networking, and he=
nce
still causing those wondering moments to users.

> One irritation though, is that there's no way to get this text to
> display *after* meson prints the summary() data, so it is likely
> scrolled off the screen.
>=20
> I think 'summary()'  ought to have a way to register warning messages
> that are guaranteed to be the last thing printed, with boldness.
>=20
> In absence of that, we can partially mitigate this by using a custom
> summary section though.
>=20
> Consider this:
>=20
> @@ -3936,3 +3937,20 @@ if not supported_oses.contains(targetos)
>=20
>    message('if you care about QEMU on this platform you should contact')
>    message('us upstream at qemu-devel@nongnu.org.')
> =20
>  endif
>=20
> +
> +warning_info =3D {}
> +
> +# Remove this warning after QEMU 8.1 has been released.
> +if not get_option('slirp').disabled() and not slirp.found()
> +    warning_info +=3D {'SLIRP': 'libslirp not present, "user" network ba=
ckend
> will not be available'} +    message()
> +    warning('libslirp not present, "user" network backend will not be
> available') +    message()
> +    message('Since qemu 7.2, libslirp is no longer included as a
> submodule')
> +    message('fallback, you must install it on your system if you require=
')
> +    message('-netdev user / -net user to be a supported network backend')
> +    message()
> +endif
> +
> +summary(warning_info, bool_yn: true,
> +        section: 'WARNINGS =F0=9F=92=A5 WARNINGS =F0=9F=92=A5 WARNINGS =
=F0=9F=92=A5 WARNINGS =F0=9F=92=A5
> WARNINGS')
>=20
> Would mean that meson/configures ends  with:
>=20
>=20
>=20
>=20
> Message:
> ../meson.build:3946: WARNING: libslirp not present, "user" network backend
> will not be available Message:
> Message: Since qemu 7.2, libslirp is no longer included as a submodule
> Message: fallback, you must install it on your system if you require
> Message: -netdev user / -net user to be a supported network backend
> Message:
> Build targets in project: 576
>=20
> qemu 7.1.50
>=20
>   Directories
>  =20
>     Install prefix               : /usr/local
>     BIOS directory               : share/qemu
>     firmware path                : share/qemu-firmware
>=20
> ...snip a page or two more summary...
>=20
>     zstd support                 : YES 1.5.2
>     NUMA host support            : YES
>     capstone                     : YES 4.0.2
>     libpmem support              : YES 1.11.1
>     libdaxctl support            : YES 74
>     libudev                      : YES 250
>     FUSE lseek                   : YES
>     selinux                      : YES 3.3
>  =20
>   WARNINGS =F0=9F=92=A5 WARNINGS =F0=9F=92=A5 WARNINGS =F0=9F=92=A5 WARNI=
NGS =F0=9F=92=A5 WARNINGS
>  =20
>     SLIRP                        : libslirp not present, "user" network
>     backend will not be available>  =20
>   Subprojects
>  =20
>     libvduse                     : YES
>     libvhost-user                : YES
>  =20
>   User defined options
>  =20
>     Native files                 : config-meson.cross
>     prefix                       : /usr/local
>     werror                       : true
>     vfio_user_server             : disabled
>=20
> Found ninja-1.10.2 at /usr/bin/ninja
> Running postconf script '/usr/bin/python3
> /home/berrange/src/virt/qemu/scripts/symlink-install-tree.py'
>=20
>=20
>=20
> Is that really not sufficiently alerting to users that they might be
> loosing the 'user' network feature ?

As I asked before: do you rather want to risk a backlash, binaries being au=
to
built, and users filing bug reports because their network no longer works a=
nd
they don't know why?

What is the real-world problem you see with making this temporarily an error
and then restoring symmetry later on?

Best regards,
Christian Schoenebeck



