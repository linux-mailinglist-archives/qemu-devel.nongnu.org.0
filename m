Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA4254C9AA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:23:04 +0200 (CEST)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1SzA-00066L-2X
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1Spb-0005BS-Br
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1SpV-0000Ps-Rq
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655298785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DJbO4E9gI/nQjzsr1AeyI0EBSXYwkeVbPFLmxVGRmsM=;
 b=W0wTVGesWujd2vNOb3ignusz/kY9PJ+dk1WilumRwHwzMhPUtblmLkDatn0NBDYS9zeNas
 SnwwekyV/KAeesQ+ntJ4LUKRHfJ/bOa2YBOw4XijwMpE+fRYmid1T2OfnGZ3EHlITV5kTO
 QCqz2rca4MYGDEXHL11G/+XbmYdvvNY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-H51AhviuMuu8FigNzf7E-Q-1; Wed, 15 Jun 2022 09:13:00 -0400
X-MC-Unique: H51AhviuMuu8FigNzf7E-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BB1D3C0D18B;
 Wed, 15 Jun 2022 13:13:00 +0000 (UTC)
Received: from localhost (unknown [10.39.195.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 279DF404E4C6;
 Wed, 15 Jun 2022 13:12:59 +0000 (UTC)
Date: Wed, 15 Jun 2022 14:12:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH 1/2] chardev: don't set O_NONBLOCK on SCM_RIGHTS file
 descriptors.
Message-ID: <Yqna2umG17+Q73z3@stefanha-x1.localdomain>
References: <20220614111843.24960-1-arbn@yandex-team.com>
 <20220614111843.24960-2-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="myQF0gtXlkJtjos7"
Content-Disposition: inline
In-Reply-To: <20220614111843.24960-2-arbn@yandex-team.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


--myQF0gtXlkJtjos7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 02:18:42PM +0300, Andrey Ryabinin wrote:
> This reverts commit 9b938c7262e4 ("chardev: clear O_NONBLOCK on SCM_RIGHT=
S file descriptors").
> File descriptor passed to QEMU via 'getfd' QMP command always
> changed to blocking mode. Instead of that, change blocking mode by QEMU
> file descriptors users when necessary, e.g. like migration.
>=20
> We need to preserve the state of the file descriptor in case it's still
> used by an external process and before the QEMU itself started
> using it.
>=20
> E.g. our local migration scenario with TAP networking looks like this:
>  1. Create TAP devices and pass file descriptors to source QEMU
>  2. Launch destination QEMU (-incoming defer) and pass same descriptors t=
o it.
>  3. Start migration
>=20
> In such scenario setting blocking state at stage (2) will hang source QEMU
> since TAP fd suddenly become blocking.

Is it possible to add a special flag or API for preserving the
O_NONBLOCK open flag? That way the rest of QEMU could continue to safely
reset the flag while the tap fd passing code would explicitly ask for
the O_NONBLOCK open flag to be preserved. That seems safer but I haven't
checked whether it's possible to do this.

>=20
> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> ---
>  chardev/char-socket.c | 3 ---
>  io/channel-socket.c   | 3 ---
>  migration/fd.c        | 2 ++
>  3 files changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index dc4e218eeb6..c9592fb5836 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -310,9 +310,6 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, =
size_t len)
>              continue;
>          }
> =20
> -        /* O_NONBLOCK is preserved across SCM_RIGHTS so reset it */
> -        qemu_socket_set_block(fd);
> -
>  #ifndef MSG_CMSG_CLOEXEC
>          qemu_set_cloexec(fd);
>  #endif
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index dc9c165de11..8b9679460dc 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -479,9 +479,6 @@ static void qio_channel_socket_copy_fds(struct msghdr=
 *msg,
>                  continue;
>              }
> =20
> -            /* O_NONBLOCK is preserved across SCM_RIGHTS so reset it */
> -            qemu_socket_set_block(fd);
> -
>  #ifndef MSG_CMSG_CLOEXEC
>              qemu_set_cloexec(fd);
>  #endif
> diff --git a/migration/fd.c b/migration/fd.c
> index 6f2f50475f4..793fffeb169 100644
> --- a/migration/fd.c
> +++ b/migration/fd.c
> @@ -60,6 +60,8 @@ void fd_start_incoming_migration(const char *fdname, Er=
ror **errp)
>          return;
>      }
> =20
> +    qemu_socket_set_block(fd);
> +
>      trace_migration_fd_incoming(fd);
> =20
>      ioc =3D qio_channel_new_fd(fd, errp);
> --=20
> 2.35.1
>=20

--myQF0gtXlkJtjos7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKp2toACgkQnKSrs4Gr
c8jYeAf9GDwkYzpQKNSV2iw6LFZrJXT01QpofheeTOAdGg4b8qhpUv9nMA1vwgcT
YNLuUMtbHx+vR0+u/gS0zztUdGo885p75+O1TwcwTrAcwjXKOVbJ9gGShpeKQDOi
0X4msrr7haW2x3UfGGjtDCHY7JwuhmnKgVfes1dVxB29mL9urgkceyPnlECXLD5m
JC/6xB8yET85fsFR0LoyPz3MaBhwOUGMR4KW4m8mdeq69mKRKf2+RAYogjGBV0Xd
9rmComOqsGhFjj0dRy//G2U4pTfjMyPb/oAYdj+u3VEgvEJ/yTI9/kDhEg0Y0QcS
HAU9+/HsFbL50Huw6ZhQJaspPaQw3Q==
=e5Ba
-----END PGP SIGNATURE-----

--myQF0gtXlkJtjos7--


