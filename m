Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE842F4D09
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:24:52 +0100 (CET)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzh4t-0001kG-7w
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzgwe-00049W-Q6
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzgwQ-0007sX-Hj
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610547360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TKgfLNuUvsdw7Cvxnxl33qHmPgDU0Gmgww3LrK37CyI=;
 b=MSfrxriU4PlxTwave0uL8s1RKNJBEl7z7zFQRpiXzUDDzaYN7k1PtmiI78NmJMVUy7vgLS
 2EgHbPnwcuqRoP6rrRXOiHRjMV+UQXr7ngURq0T5388Ha/Ry144Ws+MQVbO2tovpJCfPpv
 CmPwuE4LK6PaVixGvoWSbHl325oqbvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-2H36RPrtPlK_to1BLS-F7A-1; Wed, 13 Jan 2021 09:15:58 -0500
X-MC-Unique: 2H36RPrtPlK_to1BLS-F7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76145800C7A;
 Wed, 13 Jan 2021 14:15:19 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D73E25D9DD;
 Wed, 13 Jan 2021 14:15:18 +0000 (UTC)
Date: Wed, 13 Jan 2021 14:15:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210113141517.GB255928@stefanha-x1.localdomain>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <afd6945e-2666-1b80-70c8-27564cf5ac5@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <afd6945e-2666-1b80-70c8-27564cf5ac5@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 01:51:17PM +0100, BALATON Zoltan wrote:
> On Wed, 13 Jan 2021, Stefan Hajnoczi wrote:
> > On Tue, Jan 12, 2021 at 09:44:03PM +0100, BALATON Zoltan wrote:
> > > On Tue, 12 Jan 2021, Stefan Hajnoczi wrote:
> > > > It is possible to repeat the --trace option to specify multiple
> > > > patterns. This may be preferrable to users who do not want to creat=
e a
> > > > file with a list of patterns.
> > > >=20
> > > > Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > > docs/devel/tracing.rst | 9 +++++++--
> > > > 1 file changed, 7 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> > > > index 4ebf8e38ea..8777c19d14 100644
> > > > --- a/docs/devel/tracing.rst
> > > > +++ b/docs/devel/tracing.rst
> > > > @@ -22,10 +22,15 @@ events::
> > > > This output comes from the "log" trace backend that is enabled by d=
efault when
> > > > ``./configure --enable-trace-backends=3DBACKENDS`` was not explicit=
ly specified.
> > > >=20
> > > > -More than one trace event pattern can be specified by providing a =
file
> > > > -instead::
> > > > +Multiple patterns can be specified by repeating the ``--trace`` op=
tion::
> > > > +
> > > > +    $ qemu --trace "kvm_*" --trace "virtio_*" ...
> > >=20
> > > QEMU options are single dash with double dash accepted for compatibil=
ity but
> > > help and other docs have single dash so these (and below) should be -=
trace.
> > > (Also a bit less typing for otherwise already way too long command li=
nes.)
> >=20
> > Is this documented somewhere?
>=20
> Maybe qemu-system-* -help ?

I mean developer documentation like CODING_STYLE.rst so we can point to
that when someone submits a patch that does not use the preferred
syntax.

> > I was under the impression that '-' is legacy syntax and '--' is the
> > preferred syntax. There are examples of '--' on the QEMU man page.
>=20
> -- is also accepted but they are the same as single dash options. Some to=
ols
> may have -- syntax preferred but not QEMU itself. If so that may be an
> inconsistency.
>=20
> > Let's reach agreement, document it, and then make the documentation
> > consistent.
>=20
> Since we don't have long and short arguments for the same options (like
> -m,--memory) I think -- does not make much sense. Also single dash is les=
s
> typing and there are other programs using the same convention (e.g. whole=
 X
> Window System) so I think the current one dash options are fine and shoul=
d
> be kept consistent. As long as we can agree on this I can agree with that=
.
> :-)

I'm fine with either (or even using both interchangeably) but want to
make sure it's agreed for all of QEMU so we can really follow it and
don't need to spend time on it in the future.

Kevin: You used '--' in qemu-storage-daemon --help. Does this mean you
want QEMU to stop using '-'?

Stefan

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl//AHUACgkQnKSrs4Gr
c8jAJwf9E2q/Wo1k2Ij4qagzarlsV5i+dpFmtjFv39Q8EV0C3yIK0cPEN7VKCPxd
pDgRdrfg2dRyDuHx3ijzF2VZQmuUSpO0OMDlDDdQjBcllhDADzqlJXetjw7jTSy2
u0f1Znmb6ZmSmexH7JJ7ZPGcKzR4b8u4YRtir1KWYvpEFTArbXccQM6uQkz0xPWv
jrrxjmpxhe1ZILeQJLMP5j/Bt794kO7fsB2Gj646ncVlk/gLAnnAWQGFBnHLb16A
0M4ED+g7xWW7933rE34ejrJzj26tUO3kYvP9nzqPabdnmXcR96etf3H7VYh7tDhV
zt5JYvFQG3wkG12ibg/7PSGo7BFB8A==
=QGaH
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--


