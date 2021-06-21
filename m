Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD63AEA3D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:40:55 +0200 (CEST)
Received: from localhost ([::1]:33116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKAY-0000m1-GN
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvK6H-0004w1-H9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvK6F-0002cP-50
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624282581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/g8E4V66rhkxgBMJ4ym0CubmQbzlvP/rvOP089gqwRk=;
 b=UzbRoYncourqEsPffffygdlUOoeSKlO5aodot9yjw5vUa2bm8Qq6NfLZmvPubS80V0XdaT
 HZBm/qe38GBhzD/YQOMsnOdOtBIF7yMpBxLslVT/BygwgYgYseVP5MpZbMrd5fOSywXRY8
 b0Z04TSBEb/vow216QSpqUcFgsDhNGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-mLkDBWqoPMWGxYH0_znM6Q-1; Mon, 21 Jun 2021 09:36:18 -0400
X-MC-Unique: mLkDBWqoPMWGxYH0_znM6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE36F50751;
 Mon, 21 Jun 2021 13:36:16 +0000 (UTC)
Received: from localhost (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 587D860871;
 Mon, 21 Jun 2021 13:36:13 +0000 (UTC)
Date: Mon, 21 Jun 2021 14:36:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: Don't allow file creation with FUSE_OPEN
Message-ID: <YNCVzPd1UGSzriMP@stefanha-x1.localdomain>
References: <20210617141518.304659-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210617141518.304659-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MxhdyQvhEUnzDHvM"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 qemu-devel@nongnu.org, Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MxhdyQvhEUnzDHvM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 04:15:18PM +0200, Greg Kurz wrote:
> A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
> supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
> the "fuse_lowlevel.h" header :
>=20
>     /**
>      * Open a file
>      *
>      * Open flags are available in fi->flags. The following rules
>      * apply.
>      *
>      *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
>      *    filtered out / handled by the kernel.
>=20
> But if it does anyway, virtiofsd crashes with:
>=20
> *** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: termina=
ted
>=20
> This is because virtiofsd ends up passing this flag to openat() without
> passing a mode_t 4th argument which is mandatory with O_CREAT, and glibc
> aborts.
>=20
> The offending path is:
>=20
> lo_open()
>     lo_do_open()
>         lo_inode_open()
>=20
> Other callers of lo_inode_open() only pass O_RDWR and lo_create()
> passes a valid fd to lo_do_open() which thus doesn't even call
> lo_inode_open() in this case.
>=20
> Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
> in lo_open() and return an error to the client : EINVAL since this is
> already what glibc returns with other illegal flag combinations.
>=20
> The FUSE filesystem doesn't currently support O_TMPFILE, but the very
> same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
> that as well.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/passthrough_ll.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Thank you!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--MxhdyQvhEUnzDHvM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDQlcwACgkQnKSrs4Gr
c8i5yQgAoA1RwiU9XZrYxYjIl7/w4K1i9JFxPmXtoSqaNpaaaSHCDs4qxZlquyA0
u4mFkwNvPxlFy0/LCw8f2ciHQdaW70TAxeXhr32tfW/Lps+dqarJvCT8wNB+V8oA
hF7q8RV3BlBSr4g1GzmvXblfF1ejPP2x+/jvnWItgyao+jUZy7vtQejXOeciDYGk
2FcjKwKoxr4PsoMCT7woR1NY9GeFkDfLCyDezc9BCcA4qh1REotnU1C0RWfWtgbU
VaCVOhWxqezIxiJG90lLyxwUZVX1c9JzVL4FtAeGS1JRA9cVOASUy/wv6NPjL3lT
Nip+qs7sIP5oSZONzHXoSOt9JYyODQ==
=LHv2
-----END PGP SIGNATURE-----

--MxhdyQvhEUnzDHvM--


