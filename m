Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95D397825
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:34:44 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7Ln-0002uy-Ah
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lo7Ja-0007fK-SC
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lo7JZ-0005mU-8F
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622565144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1eKK0pibdtM29gnGfrIIsBDOUDGLBQGZlc8PlznAgOA=;
 b=UnHpjujGcD53kSEX4xz9nt18Q/G4g5RkOfoJpPveggE7DN91PTMT4cSealJ8wOF5glpzpN
 FOjNRbYrwKwhFwCQ0UxTi4O9QMN5XAfA0N7RMB69xnI9usFgO4TT+nWPB+ZBoWSVdCl8w1
 oQhRUFiyJRiS9RfjupLJJCz1rpEtIlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-Oh0NDZz6NH-MUet1pgiO6g-1; Tue, 01 Jun 2021 12:32:21 -0400
X-MC-Unique: Oh0NDZz6NH-MUet1pgiO6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 327E19250A;
 Tue,  1 Jun 2021 16:32:03 +0000 (UTC)
Received: from localhost (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C31205D9CD;
 Tue,  1 Jun 2021 16:32:02 +0000 (UTC)
Date: Tue, 1 Jun 2021 18:32:01 +0200
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] block-backend: add drained_poll
Message-ID: <20210601163201.e7cvtapzakaatigs@mhamilton>
References: <20210601055728.90849-1-slp@redhat.com>
 <20210601055728.90849-2-slp@redhat.com>
 <YLZZTgcWUliRhtT2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YLZZTgcWUliRhtT2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6wikvloxaswz7n6e"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6wikvloxaswz7n6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 05:59:10PM +0200, Kevin Wolf wrote:
> Am 01.06.2021 um 07:57 hat Sergio Lopez geschrieben:
> > Allow block backends to poll their devices/users to check if they have
> > been quiesced when entering a drained section.
> >=20
> > This will be used in the next patch to wait for the NBD server to be
> > completely quiesced.
> >=20
> > Suggested-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >  block/block-backend.c          | 7 ++++++-
> >  include/sysemu/block-backend.h | 4 ++++
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index de5496af66..163ca05b97 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -2393,8 +2393,13 @@ static void blk_root_drained_begin(BdrvChild *ch=
ild)
> >  static bool blk_root_drained_poll(BdrvChild *child)
> >  {
> >      BlockBackend *blk =3D child->opaque;
> > +    int ret =3D 0;
>=20
> It's really a bool.

I'll fix this in v2.

Thanks,
Sergio.

> >      assert(blk->quiesce_counter);
> > -    return !!blk->in_flight;
> > +
> > +    if (blk->dev_ops && blk->dev_ops->drained_poll) {
> > +        ret =3D blk->dev_ops->drained_poll(blk->dev_opaque);
> > +    }
> > +    return ret || !!blk->in_flight;
> >  }
>=20
> Doesn't make a difference for correctness, of course, so whether you
> change it or not:
>=20
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>=20

--6wikvloxaswz7n6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmC2YQAACgkQ9GknjS8M
AjVewA//WFWR6LgJFZ4sZt9wcPJjdRsyfGYPkXWOnyX1XPQh84T5cdeJRzD9MAAV
0T/sEeA8zFoFX3r7TAkFm6BAaS6M/t3PLT2TuafocaBRo0qUl3SMyePJPlSHjcZp
OMvCB8/hqyykl1h3BxEfNS6tSiZWaxtXVnIFQP9kXmqgM9LBk88KUTQr0ktqByfN
X5SByXg04sPlfjPUFBDY/bJND5Wgi4md+NDC/pcDcSZRAsY5HIHi8CnYiTahmgjx
4dTiu+UxfzjSu56/trdzXXfCjCCaYiKxPb1Byb5wXPL/XEleDkonV7EOap9taHg+
L8Fg+PuuB4VO+itU7C+wXrD9Vp1A4iF6KiAIBX3fa85VJfTbcC0Yb4q1d5SFcsuF
0GaAA6omjFDJ/2bqqon03jrGaQ3G0iPRTGURo+6H0DxS2PdAnJd+6XlMLEvdFS5/
xdAtSOVxBblCQ3zhk0+gjC6vizzRP+qsHHP8cIbH6tQNM8O/m1bQSYVfi4bV/+TG
A6SmcONdqv1fLP18c9KVwS12HXofWMS15nAtV0YifB3qBJqPgz5rNbNIJb/T81n+
yycNpyufjj9Axz1EJspqXzp3X10r6A7gCqtsbfZUcRvEza4LpkP3ICBlNS3wntSy
Cn3w1hGnHqSHnoVYxRvc9J92FLNGPgaYAKdRgbqAuYlyhFPiVY0=
=M5qZ
-----END PGP SIGNATURE-----

--6wikvloxaswz7n6e--


