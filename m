Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650FE58A10C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:04:07 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJg8c-0004JX-5w
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJfvR-0008Kp-2c
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJfvO-0006DF-6S
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659639025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vhviw1CZU7VhdlC7yIifOlSl6JojS6ZMlWXz7Vk4ad8=;
 b=dUVM1QCONltkExaN1kP3SFLlI7G915CmwjDgeihAI4MP152ACwlsuDTCD1kLeUwzynWZgf
 J6msIcuw0l+3S/v6VR2kD+nbSp5cN/Y74c4YC+dGArBHmq8wU3P5W0dAE5TegbRfF2EK+g
 NHa0ygR8aljCXMa9nGFhoJ+nFhM2DCo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-BTzu7_UoP8m8L76qUQw9jg-1; Thu, 04 Aug 2022 14:50:22 -0400
X-MC-Unique: BTzu7_UoP8m8L76qUQw9jg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C13A429AB3F5;
 Thu,  4 Aug 2022 18:50:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E420492C3B;
 Thu,  4 Aug 2022 18:50:21 +0000 (UTC)
Date: Thu, 4 Aug 2022 14:50:19 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Chao Gao <chao.gao@intel.com>
Cc: fam@euphon.net, pbonzini@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] util/aio: Defer disabling poll mode as long as possible
Message-ID: <YuwU6xu7gq1Af3tC@fedora>
References: <20220710120849.63086-1-chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SlK8Y4JcjNXfFj7N"
Content-Disposition: inline
In-Reply-To: <20220710120849.63086-1-chao.gao@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SlK8Y4JcjNXfFj7N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 10, 2022 at 08:08:49PM +0800, Chao Gao wrote:
> When we measure FIO read performance (cache=3Dwritethrough, bs=3D4k,
> iodepth=3D64) in VMs, ~80K/s notifications (e.g., EPT_MISCONFIG) are obse=
rved
> from guest to qemu.
>=20
> It turns out those frequent notificatons are caused by interference from
> worker threads. Worker threads queue bottom halves after completing IO
> requests.  Pending bottom halves may lead to either aio_compute_timeout()
> zeros timeout and pass it to try_poll_mode() or run_poll_handlers() retur=
ns
> no progress after noticing pending aio_notify() events. Both cause
> run_poll_handlers() to call poll_set_started(false) to disable poll mode.
> However, for both cases, as timeout is already zeroed, the event loop
> (i.e., aio_poll()) just processes bottom halves and then starts the next
> event loop iteration. So, disabling poll mode has no value but leads to
> unnecessary notifications from guest.
>=20
> To minimize unnecessary notifications from guest, defer disabling poll
> mode to when the event loop is about to be blocked.
>=20
> With this patch applied, FIO seq-read performance (bs=3D4k, iodepth=3D64,
> cache=3Dwritethrough) in VMs increases from 330K/s to 413K/s IOPS.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
>  util/aio-posix.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

I just noticed that I forgot to send a pull request with this for QEMU
7.1. It's my fault that this missed QEMU 7.1, sorry. It will be merged
once the 7.2 merge window opens.

Stefan

--SlK8Y4JcjNXfFj7N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLsFOYACgkQnKSrs4Gr
c8g6KQf/XegU4t074gsH6jE487gu/brzJ4rptAz8YJI/RwIFWeHlRte3gA98xwBU
ET7zS19gHnwvLa7DXKWksUgST9FCbJ3ADotvZ8BiBuz8nbsne+CQW0S4+mst8rGy
QOAQmR8BkZfyCp/OimZ7PP5WdK8vNWLZ70po6pWd4Ym68ExnpHsQ9ZkvNki87OZL
fU2e1bevpmTs6K3KlOFIcr6kXTBqWFkJ0/WtMcamysVOELqKcqy1/r1auapGpQBG
MoG7J9L4mFvs3vrRaBzKZYITRdHhNVjXDfww4tEkWjBbvXMaRX4IrllP434YDI4N
fcEiIKNlIwUpbCVosLPkGqQSv/3f7w==
=EAN9
-----END PGP SIGNATURE-----

--SlK8Y4JcjNXfFj7N--


