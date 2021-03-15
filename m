Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CF133AF54
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:56:57 +0100 (CET)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjy4-0002nF-6n
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLjvM-0000VM-Sb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLjvK-0005ww-9y
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615802045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LL5HaS3BESmj+nBu8g+0LDPsbygFApKWy8Y90yIZuQ0=;
 b=fp6iYxJNk0mwuKKpgeuy+7yq6ftj24k2vEJAhH7PPQ6R3ZCSz5b5gIqbDDn0/6q62Khd8G
 ajl/ysq0jaFg45xrZnFa7EaJy88So8IcMANqkB8dON6QdA3+h4mrXfAfULqQBJPJdERhEL
 SmPtI/YfB1zvaqbxAWSdGhQM7m8/dmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-iRpFuTbJPh2W6pcMH_Q2qQ-1; Mon, 15 Mar 2021 05:54:03 -0400
X-MC-Unique: iRpFuTbJPh2W6pcMH_Q2qQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B0AE8042BE;
 Mon, 15 Mar 2021 09:54:02 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B35D51F469;
 Mon, 15 Mar 2021 09:54:01 +0000 (UTC)
Date: Mon, 15 Mar 2021 09:54:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 7/8] tools/virtiofsd/fuse_opt.c: Replaced a malloc with
 GLib's g_try_malloc
Message-ID: <YE8uuE7Ehl+wHAkd@stefanha-x1.localdomain>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-8-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210314032324.45142-8-ma.mandourr@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mypphQl4k+Fdhp18"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

--mypphQl4k+Fdhp18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 14, 2021 at 05:23:23AM +0200, Mahmoud Mandour wrote:
> Replaced a malloc() call and its respective free() with
> GLib's g_try_malloc() and g_free() calls.
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/fuse_opt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--mypphQl4k+Fdhp18
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPLrgACgkQnKSrs4Gr
c8hZLQf6Ahw2r47SeQrdjMD0RK6S+khyZUzpkzWMmg0iJThM7Ograq5dC9R7ypKA
xXHlMue4r9XLOfR3hJHpeeWtXG+FsSqT6yC4bbzSE6cuy0DbYKXHrnEO2vpMJz+W
DevJGKFgLtTNi8apArL8hdspne0vwxytLMdM6TWuGfqlagaE75hejUNQheAS92kh
Fwox+KQB/Ug08ZMUxcav0ciTqN8oQqzGdOilGhMF18H+TqfiRO11K1nH5fLde8EJ
yjyj9HBzinip0tktVQOd7B2H9n+Y7PCAMPTi4/rs7lfdNeeZnuZVR1rN6SIbz8oT
6F5UB6MBEKeZKTVj56he+hRT7gccUA==
=Y4PZ
-----END PGP SIGNATURE-----

--mypphQl4k+Fdhp18--


