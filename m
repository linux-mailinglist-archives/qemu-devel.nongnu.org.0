Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E72DC5D7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:03:47 +0100 (CET)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpb9N-0003vb-QZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpb5L-0002JV-1U
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:59:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpb5H-000646-Pl
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608141570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2paNNhfOwsP4jxy5MErdBz5uhsXcfsW3AJeh1qVPtU=;
 b=b9Lm/KgFksJ5tXJDZJ2W7hDeWBGDgo1n/bEE7ZeBrVoX1OT7fh1ZbSiXPdQ0NEE7rfBzCJ
 RVxeXeEBjLZRc4lJX63R1Ba+7KejfqEhT68OKXTkO5U5HWnEPQtgH+v1zdm5m9i78RUHlX
 mnd6Wl09IlUO1ZaaAcxWW0hGxvjkFys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-zmKD_wWDNPWQN-J_w8i8Nw-1; Wed, 16 Dec 2020 12:59:28 -0500
X-MC-Unique: zmKD_wWDNPWQN-J_w8i8Nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22D1E1926DB7;
 Wed, 16 Dec 2020 17:59:07 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D36A31754A;
 Wed, 16 Dec 2020 17:59:04 +0000 (UTC)
Date: Wed, 16 Dec 2020 18:59:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 1/3] docs: generate qemu-storage-daemon-qmp-ref(7) man
 page
Message-ID: <20201216175903.GG7548@merkur.fritz.box>
References: <20201209103802.350848-1-stefanha@redhat.com>
 <20201209103802.350848-2-stefanha@redhat.com>
 <20201215161106.GJ8185@merkur.fritz.box>
 <20201216162142.GB707467@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201216162142.GB707467@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 afrosi@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 16.12.2020 um 17:21 hat Stefan Hajnoczi geschrieben:
> On Tue, Dec 15, 2020 at 05:11:06PM +0100, Kevin Wolf wrote:
> > > diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/inte=
rop/qemu-storage-daemon-qmp-ref.rst
> > > new file mode 100644
> > > index 0000000000..caf9dad23a
> > > --- /dev/null
> > > +++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
> > > @@ -0,0 +1,13 @@
> > > +QEMU Storage Daemon QMP Reference Manual
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +..
> > > +   TODO: the old Texinfo manual used to note that this manual
> > > +   is GPL-v2-or-later. We should make that reader-visible
> > > +   both here and in our Sphinx manuals more generally.
> > > +
> > > +..
> > > +   TODO: display the QEMU version, both here and in our Sphinx manua=
ls
> > > +   more generally.
> > > +
> > > +.. qapi-doc:: storage-daemon/qapi/qapi-schema.json
> >=20
> > Did you intend to actually merge the TODO comments like this into maste=
r
> > or was this meant to be resolved before you send the series?
>=20
> Thanks for pointing this out. Both qemu-qmp-ref.rst and qemu-ga-ref.rst
> have these comments and I copied them when creating the file. I don't
> intend to try to solve that in this series.
>=20
> Would you like to keep the comments or should I drop them?

Ah, I see. If the same already exists in other places, I'll just merge
it as it is. Thanks!

Kevin

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAl/aSucACgkQfwmycsiP
L9bfmQ/8CjJ0ip6AVy0JRk4Qr0uqIaIR/YkmocvMUXr3uWn2FeB5PFUZGGBVGf7X
9FJCztlf6b176TcGVzlN5OJr3fwV03oJWncoiXckumTRJzHjF/UgsaB1A5Wnq4ji
19avOr+zsvjJhl2Sw32IrT4Zem/xVFxe69dTHiiTfku4dQvL8Ag/BbeuajvJGzlI
GEjFE05irmBC4jm21oE6sy727FD+qqh4wlxW1KQaZfSCl0KWLaB50dvA06kHrkno
JJZEL7TaAsAe4cW36KAfCEoM2REhQ2ZzojXJq7ONyXlgjWLurpG0Oz6Hpv7YecLd
qDnA2nF7Ct8/KWJcyTGSlFv3rFaeq7AfjvkDKKJIx83tZP4evwqFhH/69boAZHXS
HMiCuTYOi7GIY/S59eHkjUYXK5Z2B4Hr7TOSXAIqlecew0Hwhg0RTjksZ6AkzLiL
pTWNRztarfmKS9RoiQ2iqVqrT/hBjAWHr7Ep//N43hjgE6HxKmlHqj6Lt+gvgOSd
GIksPchqo9gaqM0Cnq0kh/qiKPEV2VVnvGNhc4PgpvjT76pJmrhE3DN2UOyu8ICe
NwonYiKgb8BzjwR5KCLVPpJ4R2k1vQ08WIR8d7qsaAuYHwvYRcxPpAv+GsETxGTa
f+mNHQesDGs2npGJ8x3G+O+BhK9F0ZGPvNRC51aTBORtBTjRbDo=
=oNcY
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--


