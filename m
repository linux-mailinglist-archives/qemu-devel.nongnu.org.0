Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51A6ACFB3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:02:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZHxj-0001lT-Og; Mon, 06 Mar 2023 16:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZHxN-0001kb-DL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZHxK-00032h-32
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678136469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPYBE/F6bekEqc0cSEsdGjcBYe3qKfSfbLdt6PWZI/s=;
 b=HxRkY8RtPXfJDQDMm6ynGURQbMk/5gKe1IaWe7a7uI0lKLKvMdEgKhyEI/U97BBw1YRvUN
 KER9oG3WoD8PHvzXGMYbmBgOhADkXo2tWca6n84aSvciMJnrEBEhltsIz5/8jx2DD+skMV
 SQl4Ic5MfU+PZdT7R0OxwpywwnqaAF0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-xTSztFXwNr2l7veolSIa3Q-1; Mon, 06 Mar 2023 16:01:06 -0500
X-MC-Unique: xTSztFXwNr2l7veolSIa3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D620E3814588;
 Mon,  6 Mar 2023 21:01:05 +0000 (UTC)
Received: from localhost (unknown [10.39.195.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4009CC16029;
 Mon,  6 Mar 2023 21:01:04 +0000 (UTC)
Date: Mon, 6 Mar 2023 16:01:03 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] block: make BlockBackend->quiesce_counter atomic
Message-ID: <20230306210103.GD78491@fedora>
References: <20230227205704.1910562-1-stefanha@redhat.com>
 <20230227205704.1910562-2-stefanha@redhat.com>
 <aae7c810-dcfb-d4b0-7da9-20c96f7f5a75@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sogQrIhmF8g9Qvoz"
Content-Disposition: inline
In-Reply-To: <aae7c810-dcfb-d4b0-7da9-20c96f7f5a75@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--sogQrIhmF8g9Qvoz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 04:29:54PM +0100, Hanna Czenczek wrote:
> On 27.02.23 21:57, Stefan Hajnoczi wrote:
> > The main loop thread increments/decrements BlockBackend->quiesce_counter
> > when drained sections begin/end. The counter is read in the I/O code
> > path. Therefore this field is used to communicate between threads
> > without a lock.
> >=20
> > Use qatomic_set()/qatomic_read() to make it clear that this field is
> > accessed by multiple threads.
> >=20
> > Acquire/release are not necessary because the BlockBackend->in_flight
> > counter already uses sequentially consistent accesses and running I/O
> > requests hold that counter when blk_wait_while_drained() is called.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   block/block-backend.c | 18 +++++++++++-------
> >   1 file changed, 11 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index 278b04ce69..f00bf2ab35 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
>=20
> [...]
>=20
> > @@ -2568,7 +2568,9 @@ static void blk_root_drained_begin(BdrvChild *chi=
ld)
> >       BlockBackend *blk =3D child->opaque;
> >       ThrottleGroupMember *tgm =3D &blk->public.throttle_group_member;
> > -    if (++blk->quiesce_counter =3D=3D 1) {
> > +    int new_counter =3D qatomic_read(&blk->quiesce_counter) + 1;
> > +    qatomic_set(&blk->quiesce_counter, new_counter);
> > +    if (new_counter =3D=3D 1) {
> >           if (blk->dev_ops && blk->dev_ops->drained_begin) {
> >               blk->dev_ops->drained_begin(blk->dev_opaque);
> >           }
>=20
> [...]
>=20
> > @@ -2597,12 +2599,14 @@ static bool blk_root_drained_poll(BdrvChild *ch=
ild)
>=20
> [...]
>=20
> >       assert(blk->public.throttle_group_member.io_limits_disabled);
> >       qatomic_dec(&blk->public.throttle_group_member.io_limits_disabled=
);
> > -    if (--blk->quiesce_counter =3D=3D 0) {
> > +    int new_counter =3D qatomic_read(&blk->quiesce_counter) - 1;
> > +    qatomic_set(&blk->quiesce_counter, new_counter);
>=20
> I don=E2=80=99t quite understand why you decided not to use simple atomic
> increments/decrements with just SeqCst in these places.=C2=A0 Maybe it is=
 fine
> this way, but it isn=E2=80=99t trivial to see.=C2=A0 As far as I understa=
nd, these aren=E2=80=99t
> hot paths, so I don=E2=80=99t think we=E2=80=99d lose performance by usin=
g fully atomic
> operations here.

Good idea. It would be much easier to read.

Stefan

--sogQrIhmF8g9Qvoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQGVI8ACgkQnKSrs4Gr
c8grqAf9HBOJ38MRsU7VFkvCbOEhJJjEe50BYxf+JYJbkf2MKWxAsKNbRcAeE8wt
bnTh3lHJl3/Z5Kfh26e42xosZOffiL+2jYZC0dg1pDO32vIcE5ETvPpZasxBfwcA
7a8juPDdTGwXbeUHG6k7vqTkwCZ/cEK7VMXWawHhWa2tlHiQIX9fn2rN+19SNXZr
yi8rpLbn7ITU7Jut9SntdoiLGa4fdpJ9ycd+yXuRtZfwsHksiE0Fo2KycZu9wtZh
HRdpnGwPRw+hv9IXe1b0P1x4ElnHdd/YT6OgwEiPIObnz5MBW1GteMOBFAL2Apx8
g9Cn/7jrzvaAHKbbSOFQd09gp33cyA==
=isyc
-----END PGP SIGNATURE-----

--sogQrIhmF8g9Qvoz--


