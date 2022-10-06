Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11495F6506
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:13:49 +0200 (CEST)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogOp2-0000g3-8C
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogOl7-0003iR-L0
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:09:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogOl4-0004Tn-IC
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=yjprnC1a1yDTDnr4yitmTw56fj35c6JRG4jeMySa57U=; b=CGBP15DYtT97sDLtmgIgMvsVn1
 lyp4Jo5d3qb5Cy+vL6UYSt9wVB8jeb+dVCYUzAD1MSzuxV8OgEwV/SUD6SLYPV8a2bruPBRtFs7Ci
 T733zvH0IzaxmNMzkYygEumujcWf5WNV7VKUVAe3ocHGzw6OW3M0Y7AI/YOGQIpok/WZOPQkLUsUh
 qW/y1hji+/l4iCBKP0aAC9obpk/dqMEKW/PM3l/7GxpfB33Ok+HzebyUeybMXAgsbRgZVTufellBr
 FjOmHgHxTNpiUF4tky7ojMHcONb2Yr9TUmlUEY2Iy7Bq8UoAhV7m6S5Cc/Cddaqza39HX25inJwKI
 NFHh1auR5lG8KJZtIfWC+iodwJAjUPmbJTaND70NdXri6m9zgR8xtPKgtoa3G66x2Qo/iLbYMg/hn
 AqFspiAsAT5BYsH82BUTybuSDYJd7NE0USHpizGJZJrSu3F4qsh4xeErhV3fvPdQBTX6qOSyhyoEF
 SOTnJjttrZTlbpcJG1jn7LHANpqvD4VB2fMl3AyxEPbvsEdxzQZlFFFqCWSPCf4NDyRbrkcdcLpcV
 hqNM7ARsGXUHiIlppH5toLERaXFqHGvHSYjI6G5EPjsfi66DUts3fG5B6G8IdpcgWTYcmfCo3RxWG
 IzcLmprOt+FQScZE8a9hW3drZUS8CpScG9oq7/R28=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 jb-gnumlists@wisemo.com, thuth@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH v2] build-sys: error when slirp is not found and not
 disabled
Date: Thu, 06 Oct 2022 13:08:58 +0200
Message-ID: <10154258.3f93qNG8Sz@silver>
In-Reply-To: <Yz6tatckDbvSxN40@redhat.com>
References: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
 <4315090.nadSx8SW9V@silver> <Yz6tatckDbvSxN40@redhat.com>
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

On Donnerstag, 6. Oktober 2022 12:26:50 CEST Daniel P. Berrang=C3=A9 wrote:
> On Thu, Oct 06, 2022 at 12:12:07PM +0200, Christian Schoenebeck wrote:
> > On Donnerstag, 6. Oktober 2022 11:39:02 CEST Daniel P. Berrang=C3=A9 wr=
ote:
> > > On Thu, Oct 06, 2022 at 12:33:22PM +0400, marcandre.lureau@redhat.com=
=20
wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > >=20
> > > > This is an alternative configure-time solution to "[PATCH] net:
> > > > print a more actionable error when slirp is not found".
> > > >=20
> > > > See also "If your networking is failing after updating to the latest
> > > > git
> > > > version of QEMU..." ML thread.
> > > >=20
> > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > ---
> > > >=20
> > > >  meson.build | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >=20
> > > > diff --git a/meson.build b/meson.build
> > > > index 4321b8f8da..b05080b051 100644
> > > > --- a/meson.build
> > > > +++ b/meson.build
> > > > @@ -690,6 +690,13 @@ if not get_option('slirp').auto() or have_syst=
em
> > > >=20
> > > >    endif
> > > > =20
> > > >  endif
> > > >=20
> > > > +# Remove this error after QEMU 8.1 has been released.
> > > > +if not get_option('slirp').disabled() and not slirp.found()
> > > > +  error('libslirp is not explicitely disabled and was not found. '=
 +
> > > > +        'Since qemu 7.2, libslirp is no longer included as a
> > > > submodule '
> > > > +
> > > > +        'fallback, you must install it on your system or
> > > > --disable-slirp.') +endif
> > > > +
> > >=20
> > > I'm still not convinced we should be making this a fatal error, as
> > > opposed to treating it as a warning we display at the end of meson
> > > execution, which is what we do in other cases where we want to
> > > alert users to something important about their build environment.
> > >=20
> > > We have this for example:
> > >   message()
> > >   warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!=
')
> > >   message()
> > >   message('CPU host architecture ' + cpu + ' support is not currently
> > >   maintained.') message('The QEMU project intends to remove support f=
or
> > >   this host CPU in') message('a future release if nobody volunteers to
> > >   maintain it and to') message('provide a build host for our continuo=
us
> > >   integration setup.') message('configure has succeeded and you can
> > >   continue to build, but') message('if you care about QEMU on this
> > >   platform
> > >   you should contact') message('us upstream at qemu-devel@nongnu.org.=
')
> > >=20
> > > This is just as important to show users as the slirp case IMHO, so
> > > it isn't clear why this approach is insufficient for slirp too.
> >=20
> > There is a substantial difference between those two cases: the user
> > immediately realizes that the missing CPU arch is not available, whereas
> > in
> > this missing SLIRP case it happened to myself that I was just testing a=
 VM
> > (without any networking args) and scratched my head why networking on VM
> > stopped working without any error message at all, so I started to check=
 my
> > networking, routing, VM network config, host config, found nothing, and
> > eventually git-bisected the issue just to find out that its because sli=
rp
> > has been removed as a submodule. And I am a developer, so imagine what a
> > regular user might think.
> >=20
> > And yes, with that warning it would have saved my trouble at least, but
> > considering that binaries are often auto built, chances are high that t=
hey
> > are at first rolled out without SLIRP and hence without user networking,
> > and hence still causing those wondering moments to users.
> >=20
> > > One irritation though, is that there's no way to get this text to
> > > display *after* meson prints the summary() data, so it is likely
> > > scrolled off the screen.
> > >=20
> > > I think 'summary()'  ought to have a way to register warning messages
> > > that are guaranteed to be the last thing printed, with boldness.
> > >=20
> > > In absence of that, we can partially mitigate this by using a custom
> > > summary section though.
> > >=20
> > > Consider this:
> > >=20
> > > @@ -3936,3 +3937,20 @@ if not supported_oses.contains(targetos)
> > >=20
> > >    message('if you care about QEMU on this platform you should contac=
t')
> > >    message('us upstream at qemu-devel@nongnu.org.')
> > > =20
> > >  endif
> > >=20
> > > +
> > > +warning_info =3D {}
> > > +
> > > +# Remove this warning after QEMU 8.1 has been released.
> > > +if not get_option('slirp').disabled() and not slirp.found()
> > > +    warning_info +=3D {'SLIRP': 'libslirp not present, "user" network
> > > backend will not be available'} +    message()
> > > +    warning('libslirp not present, "user" network backend will not be
> > > available') +    message()
> > > +    message('Since qemu 7.2, libslirp is no longer included as a
> > > submodule')
> > > +    message('fallback, you must install it on your system if you
> > > require')
> > > +    message('-netdev user / -net user to be a supported network
> > > backend')
> > > +    message()
> > > +endif
> > > +
> > > +summary(warning_info, bool_yn: true,
> > > +        section: 'WARNINGS =F0=9F=92=A5 WARNINGS =F0=9F=92=A5 WARNIN=
GS =F0=9F=92=A5 WARNINGS =F0=9F=92=A5
> > > WARNINGS')
> > >=20
> > > Would mean that meson/configures ends  with:
> > >=20
> > >=20
> > >=20
> > >=20
> > > Message:
> > > ../meson.build:3946: WARNING: libslirp not present, "user" network
> > > backend
> > > will not be available Message:
> > > Message: Since qemu 7.2, libslirp is no longer included as a submodule
> > > Message: fallback, you must install it on your system if you require
> > > Message: -netdev user / -net user to be a supported network backend
> > > Message:
> > > Build targets in project: 576
> > >=20
> > > qemu 7.1.50
> > >=20
> > >   Directories
> > >  =20
> > >     Install prefix               : /usr/local
> > >     BIOS directory               : share/qemu
> > >     firmware path                : share/qemu-firmware
> > >=20
> > > ...snip a page or two more summary...
> > >=20
> > >     zstd support                 : YES 1.5.2
> > >     NUMA host support            : YES
> > >     capstone                     : YES 4.0.2
> > >     libpmem support              : YES 1.11.1
> > >     libdaxctl support            : YES 74
> > >     libudev                      : YES 250
> > >     FUSE lseek                   : YES
> > >     selinux                      : YES 3.3
> > >  =20
> > >   WARNINGS =F0=9F=92=A5 WARNINGS =F0=9F=92=A5 WARNINGS =F0=9F=92=A5 W=
ARNINGS =F0=9F=92=A5 WARNINGS
> > >  =20
> > >     SLIRP                        : libslirp not present, "user" netwo=
rk
> > >     backend will not be available>
> > >  =20
> > >   Subprojects
> > >  =20
> > >     libvduse                     : YES
> > >     libvhost-user                : YES
> > >  =20
> > >   User defined options
> > >  =20
> > >     Native files                 : config-meson.cross
> > >     prefix                       : /usr/local
> > >     werror                       : true
> > >     vfio_user_server             : disabled
> > >=20
> > > Found ninja-1.10.2 at /usr/bin/ninja
> > > Running postconf script '/usr/bin/python3
> > > /home/berrange/src/virt/qemu/scripts/symlink-install-tree.py'
> > >=20
> > >=20
> > >=20
> > > Is that really not sufficiently alerting to users that they might be
> > > loosing the 'user' network feature ?
> >=20
> > As I asked before: do you rather want to risk a backlash, binaries being
> > auto built, and users filing bug reports because their network no longer
> > works and they don't know why?
>=20
> The current status is that there's no visible warning - just an
> easily missing line in configure outpout  "slirp: no". I accept
> that is not sufficiently visible as it.
>=20
> What i'm questioning is the length we have to go to in order to
> make it more visible to users.
>=20
> Implicitly you are suggesting that no one bothers to look at the output
> of configure/meson, because if they did, then IMHO the suggested extra
> visible warning messages would handle this scenario sufficiently well.

If binaries are auto built, and they are, then yes, it might happen that=20
nobody looks at your suggested warning. And as such affected users never ge=
t=20
in touch with build messages, they would simply stumble in the dark.

> > What is the real-world problem you see with making this temporarily an
> > error and then restoring symmetry later on?
>=20
> This is a divergance from our normal precedent for handling optional
> build dependencies, and it is not clear that is is justified. We have
> a deprecation process for dropping features, but in terms of build deps
> we have always considered that we are free to change those at any time
> with zero notice. We expect people to read the release notes and/or
> configure output, in order to decide if they're lacking features.

Yes, but that's not about deprecation. If an arch is dropped, it happpend
intentionally. In this case it's about preventing that default networking i=
s=20
disabled unintentionally by accident.

> Consider if we bump the minimum verson of any other library, perhaps
> liburing. If a user runs configure with new QEMU, liburing support
> will get automatically disabled if they host only has the older version,
> meaning their QEMU build looses the io-uring features.  This is not
> inherently different to the slirp case, as they have to look at the
> configure output to see the missing feature, and/or read the release
> notes. I don't want us to be in a situation where we have to give
> extra warnings every time we make a change to expected build deps
> that could result in users loosing features that their builds
> previously had.

OK, I currently don't know what the user impact of missing liburing would b=
e,=20
but the reason why I think that a temporary error is justified in this slir=
p=20
case is, that it's (ATM at least) from user perspective quite horrible to f=
ind=20
the root cause why this happens. I mean when you launch the VM without any=
=20
networking args, and don't have slirp, then you currently don't get any=20
runtime error at all.

If there was a clear and user-friendly runtime error already like

"ERROR: QEMU was built without user networking (https://somewhere/#help123)"

Then a build warning would probably be sufficient.

> Making slirp a hard error is setting a new precedent for how to
> deal with external library deps that I don't think is justified.

#usersfirst ;-)

Anyway, I am not entitled as QEMU bug wrangler. So if you rather want to ri=
sk=20
processing bug reports for that, your call.

Best regards,
Christian Schoenebeck




