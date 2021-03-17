Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9F33ED72
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:53:13 +0100 (CET)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSrX-0005RE-On
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMSqS-00050L-11
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMSqP-000716-QC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615974719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+kc+vohUmgX4qev/V+uVZFBdjq8cX256N6hor0cwRxU=;
 b=C9GlfE0hCtDZxHGJEexF9EUZ/CF5iveUXFO3v6s2IuHTjkqWblKrwBXNit3Ig8H1KiVFCe
 nfmHrUxMf/95TWi0M47B3+v5BuP+CpPUgjEY2KzqjD9nsbrssD5uiUSJH5eB2igGjXduGC
 GI0FSmHNZNnFPa0EI5X0Iy7MgX9edao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-0fG-EBuZOCWBb5PURUqo6w-1; Wed, 17 Mar 2021 05:51:57 -0400
X-MC-Unique: 0fG-EBuZOCWBb5PURUqo6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 436AE1922020
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:51:56 +0000 (UTC)
Received: from localhost (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF2A16B8DA;
 Wed, 17 Mar 2021 09:51:52 +0000 (UTC)
Date: Wed, 17 Mar 2021 09:51:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Message-ID: <YFHRN5xd+s5mAOYO@stefanha-x1.localdomain>
References: <20210310173004.420190-1-stefanha@redhat.com>
 <YFB17aYnCZlyp8b4@stefanha-x1.localdomain>
 <2e7bb28d-0b3c-ac69-7984-687d4ee487c7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2e7bb28d-0b3c-ac69-7984-687d4ee487c7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G1sqcYvEt2Q85iyM"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 kraxel@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--G1sqcYvEt2Q85iyM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 08:35:14AM -0500, Eric Blake wrote:
> On 3/16/21 4:10 AM, Stefan Hajnoczi wrote:
> > On Wed, Mar 10, 2021 at 05:30:04PM +0000, Stefan Hajnoczi wrote:
> >> socket_get_fd() fails with the error "socket_get_fd: too many
> >> connections" if the given listen backlog value is not 1.
> >>
> >> Not all callers set the backlog to 1. For example, commit
> >> 582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
> >> socket listen() backlog") uses SOMAXCONN. This will always fail with i=
n
> >> socket_get_fd().
> >>
> >> This patch calls listen(2) on the fd to update the backlog value. The
> >> socket may already be in the listen state. I have tested that this wor=
ks
> >> on Linux 5.10 and macOS Catalina.
> >>
> >> As a bonus this allows us to detect when the fd cannot listen. Now we'=
ll
> >> be able to catch unbound or connected fds in socket_listen().
> >>
> >> Drop the num argument from socket_get_fd() since this function is also
> >> called by socket_connect() where a listen backlog value does not make
> >> sense.
> >>
> >> Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog =
parameter to socket_listen")
> >> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> >> Cc: Juan Quintela <quintela@redhat.com>
> >> Cc: Eric Blake <eblake@redhat.com>
> >> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >> ---
> >>  util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
> >>  1 file changed, 22 insertions(+), 7 deletions(-)
> >=20
> > Dan and Gerd: Can this go via one of your trees?
> >=20
>=20
> As it showed up as a regression in qemu-nbd, I can also consider queuing
> it in my NBD tree.  However, I claim it counts as a bug fix, so it is
> fine for -rc1 even if it misses soft freeze.
>=20
> I'm fine whichever maintainer takes this, although I've now flagged it
> to go through an NBD pull request if it doesn't land elsewhere sooner.

Thank you!

Stefan

--G1sqcYvEt2Q85iyM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBR0TcACgkQnKSrs4Gr
c8gj+gf/YYrebmt1sTowsKwibGrSmJ7dwas7m4xjXd1LGVPfKFhJpH35/RFRcqDE
9N0Rir3Fbfenzv59rPIX2u0/BElzOaO8zp0Fdhxbuxz8giTKxCUCEc8b7r37Kt8K
xOx7ztxuGo3bFgVaMmqrxcCCjOasAhF0QsWtzkfYg0HwgG27t54CEWLtKfV2DWKU
Fy93ucds7kxRw+RhvVx+EiLArf+BfidsgsknZq5pwSBfWe2XZqXLeWzGX6RMlBk+
czVGJTvk/JOGMYZMp+xKizuUweTR771EBdNCWxzDqwOoGMR0rQvE8TRip2NpV/mE
9CeUNsRCA4LiPYzrTNn6roruFSrt7A==
=nQIC
-----END PGP SIGNATURE-----

--G1sqcYvEt2Q85iyM--


