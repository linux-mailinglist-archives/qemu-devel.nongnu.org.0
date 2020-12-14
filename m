Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E9E2D9D3C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:08:17 +0100 (CET)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korKZ-0003oM-RI
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1korDW-0005WX-8w
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1korDQ-0004Hi-W2
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UcjPedgFAePbit+LAmaCdyO9dRJ4HW/XwUf+TQtTjTo=;
 b=EaTcXeHKyyeQ3QoqGFpyZ3R2yM+6Mbth8qnC7idAFq5x7vGDNPqUKLAfRl76kFzTjxwz2v
 yziw6HPaKZgkGXeQT8ZGHBGFQxkO/1XNw4KhlgEDFEH/VeASX7qF5aEc2qF+oI8qY2+D/J
 4D3wwnmwGnwdI1dDiw4qEKNSpzsMdZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-zWbrVVt0PCWa1TMqbhszCQ-1; Mon, 14 Dec 2020 12:00:48 -0500
X-MC-Unique: zWbrVVt0PCWa1TMqbhszCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ECDC1009B67;
 Mon, 14 Dec 2020 17:00:47 +0000 (UTC)
Received: from localhost (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA3755D9DC;
 Mon, 14 Dec 2020 17:00:46 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:00:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Chen <alex.chen@huawei.com>
Subject: Re: [PATCH] virtiofsd: Remove useless code about send_notify_iov
Message-ID: <20201214170045.GI620320@stefanha-x1.localdomain>
References: <20201214121615.29967-1-alex.chen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201214121615.29967-1-alex.chen@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 12:16:15PM +0000, Alex Chen wrote:
> The 'ch' will be NULL in the following stack:
> send_notify_iov()->fuse_send_msg()->virtio_send_msg(), and
> this may lead to NULL pointer dereferenced in virtio_send_msg().
> But send_notify_iov() was never called, so remove the useless code
> about send_notify_iov() to fix this problem.
>=20
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 98 ---------------------------------
>  1 file changed, 98 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Xmj0ACgkQnKSrs4Gr
c8gzbwf/bCUBkfZYOsB6f308r6UMHNN+JKwB5bST///FIRAExhgsjVDEKUDlSSvD
qN8d+2CbJYBqqE3f6M6RRghfKJnT3ZBWyLJH0qhYvAhsFai1AsvRJ1DtZGOeOJVP
YujxXbR9plJibl3gwTaVFcJwD5htuRitFssJvcWfWKPCbMAFw6JPjui6ZEDtbLPr
oZBu9V1eMwcA4muwRwDzKWjUYqntU9qoHnLzwwxjPECaiNmTQtvQOdUk5hLy09jR
nREhDZfQf/o4rwNj+dGc7OAMIPC87f2y9/Utt80bDgApHjmfLiuBKdZWljOhP5s/
8C1jM9l4GZWHjLj2JEsKLFXTL5R2Tw==
=t9Am
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--


