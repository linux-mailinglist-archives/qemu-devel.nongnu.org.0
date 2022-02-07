Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A24AC308
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:24:21 +0100 (CET)
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5sL-0000KQ-1p
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:24:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nH5BO-0005tp-RW
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:40:01 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nH5BN-0000IZ-2R
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:39:58 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-3-UKJeUlNkuH0Lpabn4p1Q-1; Mon, 07 Feb 2022 09:39:51 -0500
X-MC-Unique: 3-UKJeUlNkuH0Lpabn4p1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB3584DA40;
 Mon,  7 Feb 2022 14:39:50 +0000 (UTC)
Received: from bahia (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AFF970D24;
 Mon,  7 Feb 2022 14:39:32 +0000 (UTC)
Date: Mon, 7 Feb 2022 15:39:30 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Message-ID: <20220207153930.33b3ca1a@bahia>
In-Reply-To: <39149990.XXmQAQaIKb@silver>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <9265b724-d9c3-7c06-20ac-177feb63fee9@amsat.org>
 <CAB26zV2sx-9PGhk5Rbz-q+sQJ8yxqOOO32J_k5vb7_sPNgFBnQ@mail.gmail.com>
 <39149990.XXmQAQaIKb@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, hi@alyssa.is,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 07 Feb 2022 15:15:46 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 7. Februar 2022 02:05:32 CET Will Cohen wrote:
> > On Sun, Feb 6, 2022 at 4:22 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>
> >=20
> > wrote:
> > > On 6/2/22 21:07, Will Cohen wrote:
> > > > From: Keno Fischer <keno@juliacomputing.com>
> > > >=20
> > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > > [Michael Roitzsch: - Rebase for NixOS]
> > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > > [Will Cohen: - Rebase to master]
> > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
> > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > ---
> > > >=20
> > > >   fsdev/meson.build |  1 +
> > > >   meson.build       | 14 ++++++++++----
> > > >   2 files changed, 11 insertions(+), 4 deletions(-)
> > > >=20
> > > > -have_virtfs_proxy_helper =3D have_virtfs and have_tools
> > > > +have_virtfs_proxy_helper =3D targetos =3D=3D 'linux' and have_virt=
fs and
> > >=20
> > > have_tools
> > >=20
> > > Why do you restrict the proxy-helper to Linux?
> >
> > Only because porting the proxy-helper to macOS is outside the scope of =
this
> > particular patch. While some initial concepts around it have been
> > considered by some of the contributors to this patch, those implementat=
ions
> > weren't tested enough and the security implications weren't considered =
in
> > full. We assume that this could be an additional implementation later o=
n,
> > if the functionality is considered important down the road.
>=20
> In general that's fine with me. I would have probably made that
> "targetos !=3D 'darwin'" instead of "targetos =3D=3D 'linux'", but I leav=
e that up=20
> to you.
>=20
> On the long term we will probably deprecate the 9p 'proxy' fs driver anyw=
ay.=20
> While it had some good ideas, being realistic though: nobody has worked o=
n the=20
> 9p proxy driver/backend for many years and it is not in good shape.
>=20

It definitely isn't indeed. Also it is super slow by design
since the round trip of a 9p request involves QEMU on both entry
and exit:

   [guest] --> [QEMU]--> [virtfs-proxy-helper]-->[QEMU]-->[guest]

A more modern and efficient approach would be to have a vhost-user-9p
implementation : requests would be directly handled by the external
process, without QEMU hops. But this a fair amount of work.

> I can imagine that due to the ground being laid by these series, that we =
will=20
> also open 9p for BSD, but that should be done a bit later and hence does =
not=20
> belong into these series.
>=20
> But once again: it would not have hurt to make your intentions clear eith=
er in=20
> the commit log or by in-source comment. :)
>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20


