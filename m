Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA392F66E1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:10:58 +0100 (CET)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l069B-0004qg-G8
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l05TU-0000WO-QO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l05TR-0002b6-7n
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610641665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNibbB9pZPVEoZjgzZflhMdEiL/oaO4Er6dsfGTO0xE=;
 b=hgZw+TG4O3+gmdflGUyg4IbKaS6a8jEYHJiKHI7WikMsRxtmPbGF1MAayTSPiDz+aDXP4e
 iMOTiFlNdlqKyjIBmPIj044emHJJWXUnCzixAqQVtk6qw9yM2gtPidI38/UE7RZc1/rWW6
 1AWRIlwsy3GCSmenijc/Yukt22914bI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-ZSh89NnrMjqT3N_F8TjkQA-1; Thu, 14 Jan 2021 11:27:44 -0500
X-MC-Unique: ZSh89NnrMjqT3N_F8TjkQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B36D806661;
 Thu, 14 Jan 2021 16:27:42 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C525E19744;
 Thu, 14 Jan 2021 16:27:30 +0000 (UTC)
Date: Thu, 14 Jan 2021 16:27:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v19 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Message-ID: <20210114162729.GB306329@stefanha-x1.localdomain>
References: <cover.1610638428.git.jag.raman@oracle.com>
 <02a82c80a35ab60b98028c85aa94f688a2843943.1610638428.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <02a82c80a35ab60b98028c85aa94f688a2843943.1610638428.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 10:40:03AM -0500, Jagannathan Raman wrote:
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                               const struct iovec *iov,
> +                               size_t niov,
> +                               int **fds, size_t *nfds,
> +                               Error **errp)
>  {
> -    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);
> +    int ret =3D qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds=
, errp);
> =20
>      if (ret =3D=3D 0) {
> -        ret =3D -1;
>          error_setg(errp,
>                     "Unexpected end-of-file before all bytes were read");

qio_channel_readv_full_all_eof() can read file descriptors but no data
and return 0.

Here that case is converted into an error and the file descriptors
aren't closed, freed, and fds/nfds isn't cleared.

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAAcPEACgkQnKSrs4Gr
c8jCRwgAqyKRlFP9V4TXewLezrh4ziQiZdRLZD2cx5HEgxo4YPRZ2NlSOaaCWqz0
LBDTYxn+09+cSTVfESTDM1g2pLo7oaFHtrUq3XS7AKqEHTfPuxhruGGHEDDRhr4G
3hvGpl/t3n/X47ve/A38ulDbwlrJ+pOCM09EC+zLp64UqljNboVp84PdzNCIh5pM
ql2tcvpMu0wsT2eyessBUSpkHEC8d1LNMdf98BBRaKmXrPmyPkp+X95GAO/YMaah
gKCvQFOHuJ/uUyOD7AKh46SXt44Tw9vGMXGbpAO7iBIwCdNBQx5vBzZTh4Fn77BS
LqQizeWkTzB6lFHVy/7ThUm1FGVj8g==
=qHfe
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--


