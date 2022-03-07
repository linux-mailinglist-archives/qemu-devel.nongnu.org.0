Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B44CF7BB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 10:49:13 +0100 (CET)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9zN-0004U8-0c
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 04:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nR9xP-00036e-Nu
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:47:11 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:46959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nR9xL-0000Ji-35
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=uKSYNOftRL55koW4BoDn5NgLJoM/dQdkgI31dOruGIg=; b=iKYfrmOHSFupM0pn2eaJdZwVkM
 rViiaLZcGZHjPaeGTwwo3o5bNNTHCJbhCPXj24/ES+2mn4soMFOMv+iuWRJQpq4+tZ17qGaRffei2
 O09EcejJZiARYBTcEdQW66HzXV6xFzruha4rEv1HyQLVQejpOmQfJuL9G5wKx0aWsLDjqIdxSj/ic
 P6OnhHMF9NXWWc9kcIhrwvnd/goKP+Vu92EIYWml/0UebQdPRkboBpvESVQ3rrtECv6ptC7qOgv1n
 BgCc1k/Niw2faJ2qmyCuZfz+ONd8SkEjG/Z1qQz2ob72QrkeVy9SUu7DSVZjrUA6T6QVvK8v3no0m
 42Ap98arV23w8XpbDBeX5tvXhj4fKFiprXc3x24tJrlbtWRgwxfcISl6XpKpCHCqcCkkJBt4tDikz
 Y1ldVWQHLWlOF1hk0WWSxa4b+ZZAIKKxNDxzJ4lN8pUx5fY0EjxXQQVKRON9XkvhyCsc9O/fwHtAi
 CfafJZMHaNtbjbjGN1tAwwGw7u6yhHCT/yym7qjyq6xlLizlgvZuhzUVYZa3F8S++gTAYlsa5dQEQ
 kzmh3BSr6f24U+1Bu9Xkjmo0+ZsiGYcn54lgeTMOkiIEU8QFKn/czEBw9+NJYrCv70x05/z69cFC6
 yiKlSrhbFJCAT5vPtj4eIt74sbl64r7VsYFbDFmaQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 00/19] 9p queue 2022-03-04
Date: Mon, 07 Mar 2022 10:47:03 +0100
Message-ID: <26995890.vgOASWZ4Sn@silver>
In-Reply-To: <CAB26zV061-xniKvdO5x0r9WpLE3Gu2gVjyrp1TWJqQZjcKd9-Q@mail.gmail.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
 <CAB26zV0PP1Pv0wHBk+qp4C+v-Ykh22VnU5Ridw6WD8rZft7o_Q@mail.gmail.com>
 <CAB26zV061-xniKvdO5x0r9WpLE3Gu2gVjyrp1TWJqQZjcKd9-Q@mail.gmail.com>
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

On Sonntag, 6. M=C3=A4rz 2022 21:59:55 CET Will Cohen wrote:
> On Fri, Mar 4, 2022 at 4:31 PM Will Cohen <wwcohen@gmail.com> wrote:
> > On Fri, Mar 4, 2022 at 3:16 PM Christian Schoenebeck <
> >=20
> > qemu_oss@crudebyte.com> wrote:
> >> On Freitag, 4. M=C3=A4rz 2022 19:42:18 CET Peter Maydell wrote:
> >> > On Fri, 4 Mar 2022 at 12:32, Christian Schoenebeck
> >> >=20
> >> > <qemu_oss@crudebyte.com> wrote:
> >> > > The following changes since commit
> >>=20
> >> 5959ef7d431ffd02db112209cf55e47b677256fd:
> >> > >   Merge remote-tracking branch
> >> > >   'remotes/alistair/tags/pull-riscv-to-apply-20220303' into staging
> >> > >   (2022-03-03 19:59:38 +0000)>
> >> > >=20
> >> > > are available in the Git repository at:
> >> > >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220304
> >> > >=20
> >> > > for you to fetch changes up to
> >>=20
> >> 39edfe337c418995b2932a9a14a612fb0c329dc5:
> >> > >   fsdev/p9array.h: convert Doxygen -> kerneldoc format (2022-03-04
> >> > >   13:07:39 +0100)>
> >> > >=20
> >> > > ----------------------------------------------------------------
> >> > > 9pfs: introduce macOS host support and cleanup
> >> > >=20
> >> > > * Add support for Darwin (a.k.a. macOS) hosts.
> >> > >=20
> >> > > * Code cleanup (move qemu_dirent_dup() from osdep -> 9p-util).
> >> > >=20
> >> > > * API doc cleanup (convert Doxygen -> kerneldoc format).
> >> >=20
> >> > This fails to build on my OSX box:
> >> >=20
> >> > In file included from ../../hw/9pfs/9p-util-darwin.c:12:
> >> > ../../hw/9pfs/9p-util.h:57:1: error: unused label 'again'
> >> > [-Werror,-Wunused-label]
> >> > again:
> >> > ^~~~~~
> >> >=20
> >> > because the use of the label is inside a #ifndef CONFIG_DARWIN
> >> > but the definition is not.
> >> >=20
> >> > thanks
> >> > -- PMM
> >>=20
> >> So basically it needs this change:
> >>=20
> >> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> >> index cfa7af43c5..97e681e167 100644
> >> --- a/hw/9pfs/9p-util.h
> >> +++ b/hw/9pfs/9p-util.h
> >> @@ -54,7 +54,9 @@ static inline int openat_file(int dirfd, const char
> >> *name,
> >> int flags,
> >>=20
> >>  {
> >> =20
> >>      int fd, serrno, ret;
> >>=20
> >> +#ifndef CONFIG_DARWIN
> >>=20
> >>  again:
> >> +#endif
> >>=20
> >>      fd =3D openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONB=
LOCK,
> >>     =20
> >>                  mode);
> >>     =20
> >>      if (fd =3D=3D -1) {
> >>=20
> >> Will, can you check why this did not fail there and whether there are
> >> probably
> >> more issues?
> >>=20
> >> If that's the only one, let me know, then I would fix this on my end a=
nd
> >> resend a PR ASAP. Thanks!
> >=20
> > These were just warnings for me so I didn=E2=80=99t worry about them. W=
ill check
> > where else it appears when building!
>=20
> When building using 9p.next, here's the full extent of warnings I see. It
> appears it's just that one again at 9p-util.h:57.
>=20
> In file included from ../hw/9pfs/9p-xattr.c:23:
> ../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
> again:
> ^~~~~~
> 1 warning generated.
> [3690/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-synth.c.o
> [3691/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-local.c.o
> In file included from ../hw/9pfs/9p-local.c:22:
> ../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
> again:
> ^~~~~~
> 1 warning generated.
> [3692/6798] Compiling C object libcommon.fa.p/hw_9pfs_codir.c.o
> In file included from ../hw/9pfs/codir.c:26:
> ../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
> again:
> ^~~~~~
> 1 warning generated.
> [3693/6798] Compiling C object libcommon.fa.p/hw_9pfs_coth.c.o
> [3694/6798] Compiling C object libcommon.fa.p/hw_9pfs_cofile.c.o
> [3695/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-proxy.c.o
> [3696/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-util-darwin.c.o
> In file included from ../hw/9pfs/9p-util-darwin.c:12:
> ../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
> again:
> ^~~~~~
> 1 warning generated.
> In file included from ../hw/9pfs/9p.c:30:
> ../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
> again:
> ^~~~~~
> 1 warning generated.

OK, I'll fix this (single) issue on my end then exactly as suggested by me,=
=20
and I'll send a new PR today. Thanks!

Best regards,
Christian Schoenebeck



