Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0745F5ED7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 04:50:49 +0200 (CEST)
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogGyG-0001ul-CF
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 22:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogGt8-0007KN-Am
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 22:45:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:38937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogGt3-0002K2-F7
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 22:45:29 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MjbQM0421z4xGm; Thu,  6 Oct 2022 13:45:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1665024315;
 bh=aw8c9F0obw1Hlw3Dp77nW6Q1CVy2Xz1PRtNckX1Ydxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XNIyzKczfWdfiFRfOf5zxXEpJhMlyOmJndwsRGt0atFbgIbUugs2RzgzABRM9xHSR
 AFrOwio/+yqkUxKoqI8iepIZB863AFv/q9ajaG3sD2pi8UeN0wn/cNB+4Npjttej0k
 WWqz+mr2dCr7ddGIsiIBbhaouAqjtqW9rAHOwpp0=
Date: Thu, 6 Oct 2022 11:37:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v9 05/16] qapi: net: add stream and dgram netdevs
Message-ID: <Yz4jXvlVQMn0f8S1@yekko>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-6-lvivier@redhat.com>
 <YzPh5fhlDgbgddVv@yekko>
 <bb04fbf9-f72c-31a5-a017-e519a701302d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mitt8X/ROnWemzFf"
Content-Disposition: inline
In-Reply-To: <bb04fbf9-f72c-31a5-a017-e519a701302d@redhat.com>
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


--Mitt8X/ROnWemzFf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 12:08:27PM +0200, Laurent Vivier wrote:
> On 9/28/22 07:55, David Gibson wrote:
> > > +static int net_stream_server_init(NetClientState *peer,
> > > +                                  const char *model,
> > > +                                  const char *name,
> > > +                                  SocketAddress *addr,
> > > +                                  Error **errp)
> > > +{
> > > +    NetClientState *nc;
> > > +    NetStreamState *s;
> > > +    int fd, ret;
> > > +
> > > +    switch (addr->type) {
> > > +    case SOCKET_ADDRESS_TYPE_INET: {
> > > +        struct sockaddr_in saddr_in;
> > > +
> > > +        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.=
inet.port,
> > > +                              errp) < 0) {
> > > +            return -1;
> > > +        }
> > > +
> > > +        fd =3D qemu_socket(PF_INET, SOCK_STREAM, 0);
> > > +        if (fd < 0) {
> > > +            error_setg_errno(errp, errno, "can't create stream socke=
t");
> > > +            return -1;
> > > +        }
> > > +        qemu_socket_set_nonblock(fd);
> > > +
> > > +        socket_set_fast_reuse(fd);
> > > +
> > > +        ret =3D bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_=
in));
> > > +        if (ret < 0) {
> > > +            error_setg_errno(errp, errno, "can't bind ip=3D%s to soc=
ket",
> > > +                             inet_ntoa(saddr_in.sin_addr));
> > > +            closesocket(fd);
> > > +            return -1;
> > > +        }
> > > +        break;
> > > +    }
> > > +    case SOCKET_ADDRESS_TYPE_FD:
> > > +        fd =3D monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
> > > +        if (fd =3D=3D -1) {
> > > +            return -1;
> > > +        }
> > > +        ret =3D qemu_socket_try_set_nonblock(fd);
> > > +        if (ret < 0) {
> > > +            error_setg_errno(errp, -ret, "%s: Can't use file descrip=
tor %d",
> > > +                             name, fd);
> > > +            return -1;
> > > +        }
> > > +        break;
> > > +    default:
> > > +        error_setg(errp, "only support inet or fd type");
> > > +        return -1;
> > > +    }
> > > +
> > > +    ret =3D listen(fd, 0);
> > Does this make sense for a passed in fd?  If someone passes a "server"
> > fd, are they likely to be passing a socket on which bind() but not
> > listen() has been called?  Or one on which both bind() and listen()
> > have been called?
> >=20
>=20
> Original code in net/socket.c doesn't manage server case with fd.
>=20
> So I have checked what is done for QIO (all this code is overwritten by
> patch introducing QIO anyway):
>=20
> At the end of the series, we use qio_channel_socket_listen_async() in
> net_stream_server_init(), that in the end calls socket_listen().
>=20
> With SOCKET_ADDRESS_TYPE_FD we does the listen() (without bind()) with th=
e following comment:
>=20
>     case SOCKET_ADDRESS_TYPE_FD:
>         fd =3D socket_get_fd(addr->u.fd.str, errp);
>         if (fd < 0) {
>             return -1;
>         }
>=20
>         /*
>          * If the socket is not yet in the listen state, then transition =
it to
>          * the listen state now.
>          *
>          * If it's already listening then this updates the backlog value =
as
>          * requested.
>          *
>          * If this socket cannot listen because it's already in another s=
tate
>          * (e.g. unbound or connected) then we'll catch the error here.
>          */
>         if (listen(fd, num) !=3D 0) {
>             error_setg_errno(errp, errno, "Failed to listen on fd socket"=
);
>             closesocket(fd);
>             return -1;
>         }
>         break;
>=20
> So I think we should keep the listen() in our case too.

Ok, that makes sense to me.  Or at least, if it's not correct we
should fix it later for all the places at the same time in the qio
code.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Mitt8X/ROnWemzFf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM+IzEACgkQgypY4gEw
YSLQYA//Q75d8TUUo3roGF5Wo6NiUTvExquDQrLO/VWBpPwrSen3fjArstTA3CF/
O9qlTVYp3kbJHe/Xkk4IueXqIW1aNrEKIu3fzE0NwoW0/ciTuNOyVxUyLdFI44Z3
F95xnxjRNIgXazM+B95Sg1n6YzZricto8mayK7nCPa9qNPXvBDpVCMzcSAED2BrR
mm+33cFSTS/PgAOnlvHdgI5Veak7h3jSQl+rsKSCpCThWlJg1TZtxueInCDcRjRy
+sDlGWwGyhR0VmQJlXmuOvgiHjXZ7JPWqDdZiRrRUexG4XMUUzhGvZs7BzwWw5fB
nkM0sKaLQwNqhNa59Yzer8DoTil2smv1CReZaZibT3dna+FiypaaYaXN7FRC7aIq
+BgCj2ApVRaqP41JXOLhls9EUw+b42j9JOZhS0aY/mGCqd4AXuUgJi/aSYRs2O0P
2x7EC8eNUQyRYm+HGImkXXqbqG7aVs++JpgVrnZQcOQnyYij/L5KsHibgQTkL8L3
4SF0il+zyu4FAnm4MB6u/nGJA1FdpiHH0ale6IS243xe3W7BF4blHX3CPj9PEjzF
B/yCCiuVfkkDhqyJ997FI3DJ3SCd92lrSdBuWtWmLwYiogLZGKfHuPIZozeQhbkT
fOc4Q790l+arkIQFAdyPOc7fdezhIQ7/hxEIZk6MUe6OBkBfnqc=
=8DTH
-----END PGP SIGNATURE-----

--Mitt8X/ROnWemzFf--

