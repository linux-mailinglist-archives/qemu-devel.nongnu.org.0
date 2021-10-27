Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB27843C636
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 11:11:00 +0200 (CEST)
Received: from localhost ([::1]:44014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfexX-0007PV-TH
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 05:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfeuc-0005Lo-6K
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:07:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfeuZ-0002FM-AC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635325674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=voPdN0qDXFSTNhn17l81dS9ani7QRrZU44qjEvC5HR0=;
 b=fRDTCp6pphFSIETv8iYVlwPa5Uucbn1mpkybNHFRZFyeAjDy/yo+k/mk+9MeB6SWjJ/CxW
 tIuC0vWCbymu9/SZE7ScpnQ5mi7KxShsxse0uGHe8DI67ruVt8/6vNpa9qzP5QthumH6/G
 YNsVN8ttkpHUDm1OvjojC2hrgyOLk38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-2S-2n7_QN0q9vPTdZKlGOw-1; Wed, 27 Oct 2021 05:07:51 -0400
X-MC-Unique: 2S-2n7_QN0q9vPTdZKlGOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26074CC621;
 Wed, 27 Oct 2021 09:07:50 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53BB77086C;
 Wed, 27 Oct 2021 09:07:14 +0000 (UTC)
Date: Wed, 27 Oct 2021 10:07:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/3] file-posix: add `aio-max-batch` option
Message-ID: <YXkWwZrz72GtUgVf@stefanha-x1.localdomain>
References: <20211026162346.253081-1-sgarzare@redhat.com>
 <20211026162346.253081-2-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026162346.253081-2-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MEEWYQOXKxE1n5z3"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MEEWYQOXKxE1n5z3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 06:23:44PM +0200, Stefano Garzarella wrote:
> Commit d7ddd0a161 ("linux-aio: limit the batch size using
> `aio-max-batch` parameter") added a way to limit the batch size
> of Linux AIO backend for the entire AIO context.
>=20
> The same AIO context can be shared by multiple devices, so
> latency-sensitive devices may want to limit the batch size even
> more to avoid increasing latency.
>=20
> For this reason we add the `aio-max-batch` option to the file
> backend, which will be used by the next commits to limit the size of
> batches including requests generated by this device.
>=20
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>=20
> Notes:
>     v2:
>     - @aio-max-batch documentation rewrite [Stefan, Kevin]
>=20
>  qapi/block-core.json | 7 +++++++
>  block/file-posix.c   | 9 +++++++++
>  2 files changed, 16 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--MEEWYQOXKxE1n5z3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5FsEACgkQnKSrs4Gr
c8isWggAiMZU94Jj3EYq4hsKHlkFN4me4iUQY6euJHVVhWdakryjCZd3OAFOt0xQ
xTV+k5FtJeW8elXH3Ri+XLOk8HZg7lZwkwB31RYZKy/U6fW3b6BifewqA+CAOCld
zr+5Sb0l6gzFfOofAB1kJzmXOgHd/tvdTSuA9axmCvRCaoIMe+yuiAvxgHt3oNJ1
Ib35Gwu2FucR2ERkKcWsQ+sukB3uCjbIvEgIA7wummb7pYxhRRI+DNEH/zguTijX
7GmOeKc6EgW6c8uFTVrZzuJwphBYXLFDokp2aDdJzjBBTjNDkCaJkHX7KPUrpA5C
fmdbwXZRyL0lCraK82vOvw9ODZaVBw==
=3YY4
-----END PGP SIGNATURE-----

--MEEWYQOXKxE1n5z3--


