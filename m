Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7283240FE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:01:07 +0100 (CET)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwb4-0002yD-5b
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwVv-0006Mb-DQ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:55:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwVt-0001qN-Ms
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614182145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lcwuC2tBltvNWC7L9yUhK0PXKq5xMOT5V403jGqfrzA=;
 b=Uf6XtUYjgpKEr9dDzP9u0RHsFlvKta26LIDsDyGiYBwZcUZpJ5zzyE667h7viJCtTXO4j4
 Tapy207YdsvOGpe3MOCPWnHCu99K3nauzlSSBJFsVJLSuMlcsin7r3I0hfX3ysulPUhOiW
 T3UGhCOVJOs/UlfDvWKDw/LgiRO6X38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-5frpxodqNCipDQ208_tOqQ-1; Wed, 24 Feb 2021 10:55:08 -0500
X-MC-Unique: 5frpxodqNCipDQ208_tOqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20DDEDB9B4;
 Wed, 24 Feb 2021 15:48:44 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD92050DD2;
 Wed, 24 Feb 2021 15:48:43 +0000 (UTC)
Date: Wed, 24 Feb 2021 15:48:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: link to User documentation of
 https://wiki.qemu.org/Features/Tracing is broken currently
Message-ID: <YDZ1WtyHEyP9iher@stefanha-x1.localdomain>
References: <0a40bb78-76ba-ea37-911d-c511ac785ec8@suse.de>
MIME-Version: 1.0
In-Reply-To: <0a40bb78-76ba-ea37-911d-c511ac785ec8@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kR2E7ArPXMf/USjp"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kR2E7ArPXMf/USjp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 07:31:21PM +0100, Claudio Fontana wrote:
> the link to User documentation of https://wiki.qemu.org/Features/Tracing =
is broken currently:
>=20
> it points to:
>=20
> http://git.qemu-project.org/?p=3Dqemu.git;a=3Dblob_plain;f=3Ddocs/devel/t=
racing.txt;hb=3DHEAD
>=20
> and that to me gives a 404 - Cannot find file.

Thanks for letting me know, Claudio!

I have updated the page. The latest URL is:

  https://qemu.org/docs/master/devel/tracing.html

Stefan

--kR2E7ArPXMf/USjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2dVoACgkQnKSrs4Gr
c8hn0QgAjTy7LTn9kaL0mlQrfNfY5lQu+D8bAklGWS2yLEm1o6hscAqM2NJhT3sP
Pu92kolSUXf/nr1BgzYUi1JoG9vE5oT9/qB0QsrYB7VjNA5RTXinANPWLAm9kYm6
dpwJHyt89poJbIIevS7/LtR+U20xzmtZl5+wUXiPd3jS5aLtD/R31iyJqADfihjE
z0DCWAk4kXq1ur0hVHKcct2fNw2yDa7ioEDfMHGIYuPotq8TC6QRuG/vQUYnEHBC
NYJfdtThDb7Uqtvm1UF6cn5shI7Q1tG1vn138K/eCoBSxpxpN0oVBfTzJFniZdig
zQQ04bXA6Dz02TMyXJxkvi22SWb5hw==
=R7XB
-----END PGP SIGNATURE-----

--kR2E7ArPXMf/USjp--


