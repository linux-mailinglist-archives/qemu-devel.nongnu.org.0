Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCBC2E08D3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:31:38 +0100 (CET)
Received: from localhost ([::1]:41502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krex7-00006n-E7
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1krevh-0007zu-2y
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:30:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1krevf-0001fr-C7
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T4EfvzmhrO7fRbrFNsUxJqLWHF1q1/EcAd9CEq2r+Vw=;
 b=PczF0mihPqDjZdyutBHaf0V0fpMRBGBaL7nFUO9gp1vPuik4z9rxDev1txwq12K5wSYI+i
 xkaF4EQ8QR2AjQTT4JCW2L9Ke3ay4AZi+M2ClqTFKuVHZS1zpwSVY396Jihi3FEOFhiBa0
 f2JAY0YjyghSwZJBwz9d3yQbHweuWvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-E21ymCGrM_2Hz9ppzNebpQ-1; Tue, 22 Dec 2020 05:30:02 -0500
X-MC-Unique: E21ymCGrM_2Hz9ppzNebpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 003051005513;
 Tue, 22 Dec 2020 10:30:01 +0000 (UTC)
Received: from localhost (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE6F0348F4;
 Tue, 22 Dec 2020 10:29:50 +0000 (UTC)
Date: Tue, 22 Dec 2020 10:29:49 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v14 RESEND 09/21] multi-process: add qio channel read
 function
Message-ID: <20201222102949.GC105660@stefanha-x1.localdomain>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
 <2db8d84f89fc7263a886eab482040507b1fb6a5d.1608263018.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <2db8d84f89fc7263a886eab482040507b1fb6a5d.1608263018.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 pbonzini@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 09:40:39PM -0800, elena.ufimtseva@oracle.com wrote:
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp)
>  {
>      int ret =3D -1;
>      struct iovec *local_iov =3D g_new(struct iovec, niov);
>      struct iovec *local_iov_head =3D local_iov;
>      unsigned int nlocal_iov =3D niov;
> +    int **local_fds =3D fds;
> +    size_t *local_nfds =3D nfds;
>      bool partial =3D false;
> =20
>      nlocal_iov =3D iov_copy(local_iov, nlocal_iov,
> @@ -104,7 +140,8 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
> =20
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len =3D qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
> +        len =3D qio_channel_readv_full(ioc, local_iov, nlocal_iov, local=
_fds,
> +                                     local_nfds, errp);
>          if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_IN);
> @@ -112,20 +149,21 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                  qio_channel_wait(ioc, G_IO_IN);
>              }
>              continue;
> -        } else if (len < 0) {
> -            goto cleanup;
> -        } else if (len =3D=3D 0) {
> -            if (partial) {
> -                error_setg(errp,
> -                           "Unexpected end-of-file before all bytes were=
 read");
> +        }
> +        if (len <=3D 0) {
> +            if (partial && (len =3D=3D 0)) {
> +                ret =3D -ECANCELED;

Do callers expect fds to be non-NULL when an error is returned? This
could lead to file descriptor and memory leaks.

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/hyp0ACgkQnKSrs4Gr
c8jvgAf9E03lJjgc0D1NG80CFa9KbGJpgo1xCIwOZe+FbMVs/p5lNRMuq1ekQGbp
vs91Gg3dfUU0mscsugVvS7uZPZOpCm56ubJyoHZEdkJnQkzAfY9ou8VoQ0mLpq+/
wdbpA3PQ4X2db+qAmL+Ch4D/ILHfo70LpdU8wKofh/6eDoy4wLKLq6v4AvT4amzb
KncRFAmDjQkQ1nGqZCvsh5Nsk7YmS/cyG0Xd1pcOrGQUeclumuS9VFxpbbxXDTSo
uuqoJeP+L4mGzHrfSqlFAs0QqFaHZVPf6+1QDUlr3OKDgdVbefMXmtt0Ax07D5ZS
CEhHdtnLWjRSE0X3QVHItGWzDxuMkw==
=o3Gu
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--


