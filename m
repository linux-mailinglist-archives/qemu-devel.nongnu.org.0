Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B3E4BDA6D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:01:31 +0100 (CET)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMABu-0007de-2H
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:01:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMA57-0003GY-Hs
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMA54-0007dU-7s
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645455262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QEc1U8pg8oA2ADO7jpEVtRFd+JzH8dTnlLlyebu6Fq8=;
 b=HSNB6LCXgywxHP0aqcncYF+RcEsh6vtcuKTrflk9JmKytOx6m4DAViWSR2pUBzKKd/zdNp
 uQIjui8yRycoX5tqMkSdqgFH2VYr3bTjuDb6M+0X74jy/WcMofO3Ufl6W5Qa9hIRMeiuim
 kcI0Vty5C2M+3Wr5/FUsRERQMK66Vyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-tx_i4oe5P_qggSgd9CNeBQ-1; Mon, 21 Feb 2022 09:54:19 -0500
X-MC-Unique: tx_i4oe5P_qggSgd9CNeBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06E8E18B9ECA;
 Mon, 21 Feb 2022 14:54:18 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84BBA7E127;
 Mon, 21 Feb 2022 14:54:17 +0000 (UTC)
Date: Mon, 21 Feb 2022 14:54:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Haiyue Wang <haiyue.wang@intel.com>
Subject: Re: [PATCH v1] aio-posix: fix build failure io_uring 2.2
Message-ID: <YhOnmC5EDOK0D5/D@stefanha-x1.localdomain>
References: <20220217161627.45351-1-haiyue.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ia/UKNeZHydkYwRc"
Content-Disposition: inline
In-Reply-To: <20220217161627.45351-1-haiyue.wang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ia/UKNeZHydkYwRc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 12:16:27AM +0800, Haiyue Wang wrote:
> The io_uring fixed "Don't truncate addr fields to 32-bit on 32-bit":
> https://git.kernel.dk/cgit/liburing/commit/?id=3Dd84c29b19ed0b130000619cf=
f40141bb1fc3615b
>=20
> This leads to build failure:
> ../util/fdmon-io_uring.c: In function =E2=80=98add_poll_remove_sqe=E2=80=
=99:
> ../util/fdmon-io_uring.c:182:36: error: passing argument 2 of =E2=80=98io=
_uring_prep_poll_remove=E2=80=99 makes integer from pointer without a cast =
[-Werror=3Dint-conversion]
>   182 |     io_uring_prep_poll_remove(sqe, node);
>       |                                    ^~~~
>       |                                    |
>       |                                    AioHandler *
> In file included from /root/io/qemu/include/block/aio.h:18,
>                  from ../util/aio-posix.h:20,
>                  from ../util/fdmon-io_uring.c:49:
> /usr/include/liburing.h:415:17: note: expected =E2=80=98__u64=E2=80=99 {a=
ka =E2=80=98long long unsigned int=E2=80=99} but argument is of type =E2=80=
=98AioHandler *=E2=80=99
>   415 |           __u64 user_data)
>       |           ~~~~~~^~~~~~~~~
> cc1: all warnings being treated as errors
>=20
> So convert the paramter to right type according to the io_uring define.
>=20
> Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
> ---
>  util/fdmon-io_uring.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
> index 1461dfa407..e7febbf11f 100644
> --- a/util/fdmon-io_uring.c
> +++ b/util/fdmon-io_uring.c
> @@ -179,7 +179,11 @@ static void add_poll_remove_sqe(AioContext *ctx, Aio=
Handler *node)
>  {
>      struct io_uring_sqe *sqe =3D get_sqe(ctx);
> =20
> +#ifdef LIBURING_HAVE_DATA64
> +    io_uring_prep_poll_remove(sqe, (__u64)node);
> +#else
>      io_uring_prep_poll_remove(sqe, node);
> +#endif
>  }

Thanks for the patch. I suggest using the same approach as the liburing
commit to avoid the #ifdef:

diff --git a/test/poll-cancel-ton.c b/test/poll-cancel-ton.c
index f0875cd..05bf565 100644
--- a/test/poll-cancel-ton.c
+++ b/test/poll-cancel-ton.c
@@ -55,7 +55,7 @@ static int del_polls(struct io_uring *ring, int fd, int n=
r)

                        sqe =3D io_uring_get_sqe(ring);
                        data =3D sqe_index[lrand48() % nr];
-                       io_uring_prep_poll_remove(sqe, data);
+                       io_uring_prep_poll_remove(sqe, (__u64)(uintptr_t)da=
ta);

So the QEMU add_poll_remove_sqe() function would do:

  io_uring_prep_poll_remove(sqe, (__u64)(uintptr_t)node);

Was there a reason why you chose an #ifdef instead?

Thanks,
Stefan

--ia/UKNeZHydkYwRc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITp5gACgkQnKSrs4Gr
c8i+kgf9EL/O98x9CEcriHNgmDel85au/Zu5FSPU/HqyQWcR6ZdyqlWfx4axeJBh
bN+k3mvQaG2gRloj4pF0ztJldRCy0OkcIysEvSDziscGOx+crnlhau8oezE+wpP4
m6q0pob7rssggoXJ86qXTG4dxIt8kTmXTUofG1iFtF13kOW0omu40vPYkzP7ae0x
Cbfb61u/HfcvUhOaXuIQ86wbXOXrZm0atufupjBpMi4eO4R5eIMsADNM//0KaObd
CtuzFOJBx+Y0Hepdp1WnK7bA64XiqfGJ+hIajGnKgkke5ov1sweYcqqvgQ1wuy6I
8EjZLlvRiPpa94pFFMoDOCwjI4bf0A==
=E/Oh
-----END PGP SIGNATURE-----

--ia/UKNeZHydkYwRc--


