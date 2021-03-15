Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E933AF7A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:02:22 +0100 (CET)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLk3J-0006vg-4d
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLk2H-00065E-UW
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLk2G-0001eL-F0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615802475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t1+hmvQiPq5r9dKdrRUHV3mq1yKiXl49hKFi+KuGOUE=;
 b=ayypHYfAMzyLQFnch7hTUxLg9lyMlhtmBiLzQTWpEIV4PLgBdLrrkB8CV36uB/8/aEnLnD
 lQqCpjSgkXrfLs9QkdEDQTFLaHRJKAOdjBkdq0dWVj9S7KtuZfQGkRu4VssD6loolpTTXa
 9LHPTUr8U08eX4R3NVF9Oc1NupfP6bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-5J_BtehiNZiyI79FYw4sZg-1; Mon, 15 Mar 2021 06:01:13 -0400
X-MC-Unique: 5J_BtehiNZiyI79FYw4sZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B957804B6C;
 Mon, 15 Mar 2021 10:01:12 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D6071054FC8;
 Mon, 15 Mar 2021 10:01:11 +0000 (UTC)
Date: Mon, 15 Mar 2021 10:01:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 8/8] tools/virtiofsd: Replacing malloc-like calls with
 GLib's variants
Message-ID: <YE8wZ7WWdtqIW/kt@stefanha-x1.localdomain>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-9-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210314032324.45142-9-ma.mandourr@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Om6RU2jfdtv4vnvQ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Om6RU2jfdtv4vnvQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 14, 2021 at 05:23:24AM +0200, Mahmoud Mandour wrote:
> @@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct fuse=
_session *se)
>  {
>      struct fuse_req *req;
> =20
> -    req =3D (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
> +    req =3D g_try_new(struct fuse_req, 1);

g_try_new0() since the original call was calloc(3)?

> @@ -411,7 +411,7 @@ static int lo_map_grow(struct lo_map *map, size_t new=
_nelems)
>          return 1;
>      }
> =20
> -    new_elems =3D realloc(map->elems, sizeof(map->elems[0]) * new_nelems=
);
> +    new_elems =3D g_realloc_n(map->elems, new_nelems, sizeof(map->elems[=
0]));

g_try_realloc_n() since failure is handled below?

Stefan

--Om6RU2jfdtv4vnvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPMGcACgkQnKSrs4Gr
c8hdsgf/b0eq3OiKdK/jex8oa8/PTQ2cfwWRNLlHQYCBU9APBnzVo0aoJIc58Tr5
wS5ZYqFCuGu/G/9+dwT+PnrXAezJdCY6Uulpm11LvBTgzOWc/i0qnhiishsUHlmI
Ewemavk6/9ZFXAKPT2nzfIXcaDbtLAm2goEFaolIwA1pIjl3N5Ct3m4cGYvcI+wR
gjPLAVWd/0Kl4iNqdDWXGzHk3jt7sTYnm6hGgKsF332G/qD3XGbSo8TX0bmHDxmC
6vyPxzrkX8wXZj6URkQfM6AGsCTnOMS5nkACAetM3dnhroY7cqP3U1kjq6nSfkqU
rD/dj4QUMBUw7t5HMDrTUG/qJZ5OWg==
=+ay5
-----END PGP SIGNATURE-----

--Om6RU2jfdtv4vnvQ--


