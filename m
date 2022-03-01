Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14F4C886B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:45:39 +0100 (CET)
Received: from localhost ([::1]:39166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOz4c-0007J0-W0
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:45:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOyrq-0003Nh-Dj
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:32:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOyro-00041x-KT
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646127144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oHdgc7oPn3rAeQfbmkKEjfxGeORrqKl27im4EMCQu5I=;
 b=COKmzWb5Kpf719Y3vg/AWdReCvQT19OqdcuQMqAv0oe9F8EqbmuyneHrJon89uRLmizjoS
 nHX6zp5+6eZPiwamaBvea21zBgbEPNtp7MtCkQ6i7qSJZqPkeFwDwlmPbNGgPAXF9gXHgz
 tFZRsVAAL154qs7QRxk9EaRjfaaNh9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-obKu8IeJOqCr18IoxoGDSw-1; Tue, 01 Mar 2022 04:32:20 -0500
X-MC-Unique: obKu8IeJOqCr18IoxoGDSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D594824FA6;
 Tue,  1 Mar 2022 09:32:19 +0000 (UTC)
Received: from localhost (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBD931F439;
 Tue,  1 Mar 2022 09:32:15 +0000 (UTC)
Date: Tue, 1 Mar 2022 09:32:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] aio-posix: fix spurious ->poll_ready() callbacks in main
 loop
Message-ID: <Yh3oHoDirBCqG2JR@stefanha-x1.localdomain>
References: <20220223155703.136833-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tXWc8eaIvQ6oqYop"
Content-Disposition: inline
In-Reply-To: <20220223155703.136833-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tXWc8eaIvQ6oqYop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 03:57:03PM +0000, Stefan Hajnoczi wrote:
> When ->poll() succeeds the AioHandler is placed on the ready list with
> revents set to the magic value 0. This magic value causes
> aio_dispatch_handler() to invoke ->poll_ready() instead of ->io_read()
> for G_IO_IN or ->io_write() for G_IO_OUT.
>=20
> This magic value 0 hack works for the IOThread where AioHandlers are
> placed on ->ready_list and processed by aio_dispatch_ready_handlers().
> It does not work for the main loop where all AioHandlers are processed
> by aio_dispatch_handlers(), even those that are not ready and have a
> revents value of 0.
>=20
> As a result the main loop invokes ->poll_ready() on AioHandlers that are
> not ready. These spurious ->poll_ready() calls waste CPU cycles and
> could lead to crashes if the code assumes ->poll() must have succeeded
> before ->poll_ready() is called (a reasonable asumption but I haven't
> seen it in practice).
>=20
> Stop using revents to track whether ->poll_ready() will be called on an
> AioHandler. Introduce a separate AioHandler->poll_ready field instead.
> This eliminates spurious ->poll_ready() calls in the main loop.
>=20
> Fixes: 826cc32423db2a99d184dbf4f507c737d7e7a4ae ("aio-posix: split poll c=
heck from ready handler")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  util/aio-posix.h |  1 +
>  util/aio-posix.c | 32 ++++++++++++++++++--------------
>  2 files changed, 19 insertions(+), 14 deletions(-)

Applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--tXWc8eaIvQ6oqYop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmId6B4ACgkQnKSrs4Gr
c8gc0wgApv2CXEFqZRi3oqncAZBpJ6yVVXly23QKy1p38lu/s8hsdYjc+F2WUoCi
pf4ikGS7CmoO4pnM7JRc08y5X7ibRsiN6cVQX93bae0IqiAQSbSfXd8IHrbUwRsp
oWGffI7bl6Ht3Cw0qDfR16wPAlOpDDKRhq1OAg7t329h9tJ4QlTGl4ooDT/IYNCe
oc3HFwMwp+8u5dI40GXuJMYBI/HLa6n8IVfwsYUy4FhbVznAzVf1WNOCXPI8Vf+m
v/Ow64XOlbWYHF7ZxwJpTCVB+KgH1vDc+qxN8vK+p83LPLJE6XBWMO3Bcz+68hQ1
lLx560Ke24XSmYXHMjJD8AFBUBoaOw==
=QJA5
-----END PGP SIGNATURE-----

--tXWc8eaIvQ6oqYop--


