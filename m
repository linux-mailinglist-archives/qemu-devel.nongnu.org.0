Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6A2DC450
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:32:21 +0100 (CET)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZiu-0007Wl-Oe
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpZYn-0004YX-IL
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpZYj-0006pa-Do
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608135708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U1IabRUev6cpcGzCP0bZKi00KxWBfbsBjz2wDLrUCTM=;
 b=RHuiEa67GX1zALucLNBz4l7/DN2lAnCA3rJiLgH2YRWKzExEENcAEiRKMkZreORD8Qu5AE
 ToFNJAq8tk0Hf83UXvKsfoV48H/p36gOvyqQ2tA3BYubs/RbKGeFmEm7jjLQrVyyt/BHzA
 ywiYFQaTfHJjYF9thLZShIpOKbdnEhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-qpJbpYbyPjeumha9L97laA-1; Wed, 16 Dec 2020 11:21:46 -0500
X-MC-Unique: qpJbpYbyPjeumha9L97laA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56A28DF8A4;
 Wed, 16 Dec 2020 16:21:45 +0000 (UTC)
Received: from localhost (ovpn-115-151.ams2.redhat.com [10.36.115.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F318660CC4;
 Wed, 16 Dec 2020 16:21:43 +0000 (UTC)
Date: Wed, 16 Dec 2020 16:21:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 1/3] docs: generate qemu-storage-daemon-qmp-ref(7) man
 page
Message-ID: <20201216162142.GB707467@stefanha-x1.localdomain>
References: <20201209103802.350848-1-stefanha@redhat.com>
 <20201209103802.350848-2-stefanha@redhat.com>
 <20201215161106.GJ8185@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201215161106.GJ8185@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 05:11:06PM +0100, Kevin Wolf wrote:
> > diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/intero=
p/qemu-storage-daemon-qmp-ref.rst
> > new file mode 100644
> > index 0000000000..caf9dad23a
> > --- /dev/null
> > +++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
> > @@ -0,0 +1,13 @@
> > +QEMU Storage Daemon QMP Reference Manual
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +..
> > +   TODO: the old Texinfo manual used to note that this manual
> > +   is GPL-v2-or-later. We should make that reader-visible
> > +   both here and in our Sphinx manuals more generally.
> > +
> > +..
> > +   TODO: display the QEMU version, both here and in our Sphinx manuals
> > +   more generally.
> > +
> > +.. qapi-doc:: storage-daemon/qapi/qapi-schema.json
>=20
> Did you intend to actually merge the TODO comments like this into master
> or was this meant to be resolved before you send the series?

Thanks for pointing this out. Both qemu-qmp-ref.rst and qemu-ga-ref.rst
have these comments and I copied them when creating the file. I don't
intend to try to solve that in this series.

Would you like to keep the comments or should I drop them?

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/aNBYACgkQnKSrs4Gr
c8hegwf/bPKilcvV3lCToIW7LXOB4QesAFUc9MKGdDCvFm378eV09kCxTuj2WlVg
V+Lf2VJo0b1+nx0WLFOtCn0ruAioDKVp1VzzqeXb+nh8KxgA8EpQmMkwDPYS2/QX
d4Fk/4/9phdnGcwGweQtVoc/4HMqOHdr+FfH+9gwiy+wGhSB8QoW5uIehdXoSNc6
2ZpU7UT3a9weUNfC+njlppPLtsJmLYKLbm7vGYkyWut7yPNhaEzvtTBLWXw86LL9
QMCl+nQpaRa3s4ZfyuoD1sLmztQYUUpGnyTxXt0FceeHo0NIaEdaJgnXaQDTUAmO
PUUijZTa1ezirQb/GJj4PUh2KxfwZw==
=ptLW
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--


