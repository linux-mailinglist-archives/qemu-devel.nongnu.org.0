Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0F5F5ED8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 04:50:52 +0200 (CEST)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogGyJ-0001xv-EX
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 22:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogGt8-0007KM-2C
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 22:45:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogGt3-0002K4-F2
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 22:45:28 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MjbQM09Zbz4xGn; Thu,  6 Oct 2022 13:45:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1665024315;
 bh=6MLyjK+B89RmzCSfsyvu7y5FZdxTalUfM4CJ3ToSyrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IgI/EoUDmY6NGJTouGbZPv2STCrUrsBLEbfQAiCeSpqVlKjM1Uj2WXiZ7H1Beih6S
 ZDk+Xr8Dpee8vgvr4v6qZ0LDDXgUPh1EXLdDDU/zdw3DNcAyAebwIjfewdrQARK0+6
 9rsmZf7HgZNaHubiE6fvhEbIl1sFmuA0KGRDFig4=
Date: Thu, 6 Oct 2022 11:39:17 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v9 08/16] net: stream: add unix socket
Message-ID: <Yz4jtR8nwsYUvqP2@yekko>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-9-lvivier@redhat.com>
 <YzPlwbdw8uUbfyFL@yekko>
 <7c2e4538-38bf-38de-51eb-94b8d1ab6d5a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m9FerXEOH9YFFB9v"
Content-Disposition: inline
In-Reply-To: <7c2e4538-38bf-38de-51eb-94b8d1ab6d5a@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--m9FerXEOH9YFFB9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 03:38:09PM +0200, Laurent Vivier wrote:
> On 9/28/22 08:12, David Gibson wrote:
> > > @@ -253,9 +253,27 @@ static void net_stream_accept(void *opaque)
> > >       s->fd =3D fd;
> > >       s->nc.link_down =3D false;
> > >       net_stream_connect(s);
> > > -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> > > -             "connection from %s:%d",
> > > -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> > > +    switch (saddr.ss_family) {
> > > +    case AF_INET: {
> > > +        struct sockaddr_in *saddr_in =3D (struct sockaddr_in *)&sadd=
r;
> > > +
> > > +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> > > +                 "connection from %s:%d",
> > > +                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_=
port));
> > So, here you print the address from which the connection has come -
> > the remote address.
> >=20
> > > +        break;
> > > +    }
> > > +    case AF_UNIX: {
> > > +        struct sockaddr_un saddr_un;
> > > +
> > > +        len =3D sizeof(saddr_un);
> > > +        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len=
);
> > > +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> > > +                 "connect from %s", saddr_un.sun_path);
> > Here you print the bound address - the local address.  Does that make
> > sense?  I mean, in almost every occasion the remote Unix socket will
> > be anonymous, so it probably doesn't make sense to display that, but
> > is the bound address actually a useful substitute?
> >=20
> > Maybe it should just be "connect from Unix socket".
> >=20
>=20
> I agree the needed information is "connected" and type "unix".
>=20
> But I think more information we can put here can be useful for a debuggin=
g purpose.

Fair enough.  I feel like "connect from" is still possible
misleading.  Maybe "connect via"?  Or even "connection to Unix socket %s"?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--m9FerXEOH9YFFB9v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM+I60ACgkQgypY4gEw
YSIRehAAntN5u2qC8Np1be6oYHzP5EAN/8Wx9w9cJDCNBd4TPfi8vQO+KT2BsHJj
nkd6ZN/xxd8TRiL1vjtpty6pxD7UE04eaGFky/u/vAvWwmlYyWkYKVx4NahnpwI+
0R45/lgZMfkqv3WC+T4H5jvIRE+HWwC8JnPITilPg+1DTDUU7rQZhZVjcFucl1xm
B72Xu6StqBSDsRFX/L8nX7fnZ5rHNvpbhdts4ZWTmoZhLu6HvDOmHqP+ymiN0Gzp
xGa1qeLr4YtkndQ97bS6mBtBBZlkgBiJBDn6Nleu5l9/7Li4gJ3P1KYtt27IoSQc
YHM+425RVHdq18vTykKrTK21lXEj4oEGablq1oSklNPcONikImBLEDKEV2bma+Tk
f/bK4j82KQOzD+H6/lnrZnv1phpdSMASB0WLf82HZj++28HzBWpQ5lIdN+8BE5Wy
n8iEYxp9fDQef2QvJacrtIl5mVCKXNvm0HKFeIP5mFHTZv4S7+uWi+sOP+fkQ7Yp
BNc/nevq9ms4Xjqp7K2MImlogMdeXT9XByLO5NJSPSXuLKBhdhSdsx4Sishkm2uR
xpLAWDyiAr0HZSzs41k8Vf+6ZO7vqoEI/vWrLKSxaQghq0Haq1IeA1AyXf+sAv2l
fFHfPfUbLOtBsNy6yytKp98t3PurniJQS9Wz27DjFz+qm6wlx2k=
=z/AO
-----END PGP SIGNATURE-----

--m9FerXEOH9YFFB9v--

