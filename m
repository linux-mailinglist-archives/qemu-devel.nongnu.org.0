Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A584CFC43
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:07:49 +0100 (CET)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBDQ-00073R-Cf
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nRAFZ-0007Qd-4x
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:05:57 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:41444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nRAFX-0003NH-7p
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:05:56 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-q_9eHK1sO8WTRvz_AOHJzg-1; Mon, 07 Mar 2022 05:05:42 -0500
X-MC-Unique: q_9eHK1sO8WTRvz_AOHJzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 258E01006AA6;
 Mon,  7 Mar 2022 10:05:41 +0000 (UTC)
Received: from bahia (unknown [10.39.192.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E61580920;
 Mon,  7 Mar 2022 10:05:39 +0000 (UTC)
Date: Mon, 7 Mar 2022 11:05:38 +0100
From: Greg Kurz <groug@kaod.org>
To: Will Cohen <wwcohen@gmail.com>
Subject: Re: [PULL 00/19] 9p queue 2022-03-04
Message-ID: <20220307110538.1ac88f8e@bahia>
In-Reply-To: <CAB26zV0PP1Pv0wHBk+qp4C+v-Ykh22VnU5Ridw6WD8rZft7o_Q@mail.gmail.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
 <CAFEAcA8EN8sSSYYMh=u68-a7qXGaG-oSnAz2hT8kXXGtnDLnww@mail.gmail.com>
 <11201492.CjeqJxXfGd@silver>
 <CAB26zV0PP1Pv0wHBk+qp4C+v-Ykh22VnU5Ridw6WD8rZft7o_Q@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 16:31:07 -0500
Will Cohen <wwcohen@gmail.com> wrote:

> On Fri, Mar 4, 2022 at 3:16 PM Christian Schoenebeck <qemu_oss@crudebyte.=
com>
> wrote:
>=20
> > On Freitag, 4. M=C3=A4rz 2022 19:42:18 CET Peter Maydell wrote:
> > > On Fri, 4 Mar 2022 at 12:32, Christian Schoenebeck
> > >
> > > <qemu_oss@crudebyte.com> wrote:
> > > > The following changes since commit
> > 5959ef7d431ffd02db112209cf55e47b677256fd:
> > > >   Merge remote-tracking branch
> > > >   'remotes/alistair/tags/pull-riscv-to-apply-20220303' into staging
> > > >   (2022-03-03 19:59:38 +0000)>
> > > > are available in the Git repository at:
> > > >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220304
> > > >
> > > > for you to fetch changes up to
> > 39edfe337c418995b2932a9a14a612fb0c329dc5:
> > > >   fsdev/p9array.h: convert Doxygen -> kerneldoc format (2022-03-04
> > > >   13:07:39 +0100)>
> > > > ----------------------------------------------------------------
> > > > 9pfs: introduce macOS host support and cleanup
> > > >
> > > > * Add support for Darwin (a.k.a. macOS) hosts.
> > > >
> > > > * Code cleanup (move qemu_dirent_dup() from osdep -> 9p-util).
> > > >
> > > > * API doc cleanup (convert Doxygen -> kerneldoc format).
> > >
> > > This fails to build on my OSX box:
> > >
> > > In file included from ../../hw/9pfs/9p-util-darwin.c:12:
> > > ../../hw/9pfs/9p-util.h:57:1: error: unused label 'again'
> > > [-Werror,-Wunused-label]
> > > again:
> > > ^~~~~~
> > >
> > > because the use of the label is inside a #ifndef CONFIG_DARWIN
> > > but the definition is not.
> > >
> > > thanks
> > > -- PMM
> >
> > So basically it needs this change:
> >
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index cfa7af43c5..97e681e167 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -54,7 +54,9 @@ static inline int openat_file(int dirfd, const char
> > *name,
> > int flags,
> >  {
> >      int fd, serrno, ret;
> >
> > +#ifndef CONFIG_DARWIN
> >  again:
> > +#endif
> >      fd =3D openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBL=
OCK,
> >                  mode);
> >      if (fd =3D=3D -1) {
> >
> > Will, can you check why this did not fail there and whether there are
> > probably
> > more issues?
> >
> > If that's the only one, let me know, then I would fix this on my end an=
d
> > resend a PR ASAP. Thanks!
>=20
>=20
> These were just warnings for me so I didn=E2=80=99t worry about them. Wil=
l check
> where else it appears when building!
>=20

Compiler warnings are frowned upon in the QEMU community since they
likely point to something that isn't right in your code. As you
might see, Peter's build has -Werror set and so have the builds
in the gitlab CI. Please consider passing --enable-werror to
configure, at least when you're about to post to the list.

>=20
> >
> > Best regards,
> > Christian Schoenebeck
> >
> >
> >


