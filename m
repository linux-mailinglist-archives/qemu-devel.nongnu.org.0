Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06432CBF75
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:22:33 +0100 (CET)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkT1c-0000Fm-QH
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkSzl-0007ES-LA
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:20:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkSzk-0002uH-1B
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606918835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kYX1KEvx188pBcdfi72ezYQ6zSdUIh70B30NBSZ5eHo=;
 b=DhYPqJq133e7FbTYMhRpX+ZAvxQn8LKyZg+VsrZLPIHq1vrGbMagnUUOA6igy1dNJjGMIn
 hjsjjsrgM3tfcyi41Rb1jlDnEUwTWxKQYK4uS6thQ0Ak5svKS4lHtUw8zMwbwZWTSaFuFL
 ugE9CpFC9lFQla3E+sDqMP0nTJbnCiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-M5TuV0EfNoqqHPl2EoI9ag-1; Wed, 02 Dec 2020 09:20:33 -0500
X-MC-Unique: M5TuV0EfNoqqHPl2EoI9ag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D47B185E486
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 14:20:32 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADDF11007606;
 Wed,  2 Dec 2020 14:20:25 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:20:24 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 2/8] libvhost-user: replace qemu/memfd.h usage
Message-ID: <20201202142024.GD655829@stefanha-x1.localdomain>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
 <20201125100640.366523-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201125100640.366523-3-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 02:06:34PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Undo the damage from commit 5f9ff1eff3 ("libvhost-user: Support tracking
> inflight I/O in shared memory") which introduced glib dependency through
> osdep.h inclusion.
>=20
> libvhost-user.c tries to stay free from glib usage.
>=20
> Use glibc memfd_create directly when available (assumed so when
> MFD_ALLOW_SEALING is defined). A following commit will make the project
> standalone and check for memfd API at configure time, instead of a
> panic at runtime.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/libvhost-user/libvhost-user.c | 50 +++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/HoqgACgkQnKSrs4Gr
c8iSeQgAtKUpUCCnEMHF1dw9cqYNoes27EPlRgrJswzP2J4J3hIjH3QJadyXTw10
TEgC/zX5ptmB5HZeg4Q0zdJBKAa2tPCXL73fHRwocWHyQkv3Tsf9xjDQyXo9KpIf
ByrrQqEksrXcRAKkpepZiVaQwqg7dN6Wm6NhxsAuDa8uPxmUKqOGGHwLxoZH+GeF
w26PNX4dV0TBjbj68Zu2ZDH8la1Na9JQOUfDKE79YxicRSFUAw/akcHJX7eu6jDy
fw17NkdgnV6gYRUSc0zutqRw53SM7HEnlCusg4/kaUyLwnv/Iyb6BkC6ZRFOZ7zZ
tX+CsZXtfRDGrJi2B8u2OLBbw68aig==
=62kQ
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--


