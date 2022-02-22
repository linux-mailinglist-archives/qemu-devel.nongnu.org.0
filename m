Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA264BF466
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:09:35 +0100 (CET)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRAs-0005xk-8X
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMR4D-00048A-FF
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMR42-0001Jb-9V
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645520545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/SDq/qF7fdvx+rYH3xux3ds8hLJYpJ36p9fCFg3/sks=;
 b=Pflbw3dPoIgueJ3eMBr8W+eLhKLcd6No6SLz4H7VnT4NJex9uka23yVF8FjseLBcXRzD4J
 PDfvGBNzpeDLKJWEtS48tPlpt0thruH4QRIYpqNcgFpIgSTsgp07bjKwcyI91NEsJ8I7z7
 /Cy98rw826u6YIOBM/+8ggxijDbNeRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-c4JlVw3-N_O9Ed8gSv9k1Q-1; Tue, 22 Feb 2022 04:02:23 -0500
X-MC-Unique: c4JlVw3-N_O9Ed8gSv9k1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB7D1091DA2;
 Tue, 22 Feb 2022 09:02:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC4A3710C4;
 Tue, 22 Feb 2022 09:02:21 +0000 (UTC)
Date: Tue, 22 Feb 2022 09:02:20 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Haiyue Wang <haiyue.wang@intel.com>
Subject: Re: [PATCH v2] aio-posix: fix build failure io_uring 2.2
Message-ID: <YhSmnJJ1jl8LvWJ0@stefanha-x1.localdomain>
References: <20220217161627.45351-1-haiyue.wang@intel.com>
 <20220221162401.45415-1-haiyue.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wf2KZbsMCYjPEgx8"
Content-Disposition: inline
In-Reply-To: <20220221162401.45415-1-haiyue.wang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wf2KZbsMCYjPEgx8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 12:24:01AM +0800, Haiyue Wang wrote:
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
> Use LIBURING_HAVE_DATA64 to check whether the io_uring supports 64-bit
> variants of the get/set userdata, to convert the paramter to the right
> data type.
>=20
> Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
> ---
> v2: update the commit log, and change the type cast as io_uring test does.
> ---
>  util/fdmon-io_uring.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

I will update the patch in my queue if further discussion raises issues.

Stefan

--wf2KZbsMCYjPEgx8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIUppwACgkQnKSrs4Gr
c8jmHwf/cLmbOycnPJD9sZ/uVdc5nMYz/plp7sPvhXqi0bzNBX1+hTRQvrxBxi3K
o7YCZ3cWeAbyvzJ6lbPeXCjSPZlCcDe2K95v9CcAeXcAkm9ha4ku1bV4AtwjMp9s
j4/fOuyvGxVugikdK2SfYabXzHtFtfal+ZtwPuqgKZ1eKOlE+ZnInIJ+yAaaf1lq
niEa26x8zR21NfxpGRMHhJ9dA8wsvPsNyflivXtJFwnciP/X1ngEIqDhpTo5zbkX
sucu17YEReDYEjwgmD0TGb8HGAax+KxZ225e2Q9dCKg3LHRaUfFJ/FgF37aenZIM
0WjSqsWfr2SmGz90D9SfHLrE4y+JZQ==
=G/p5
-----END PGP SIGNATURE-----

--wf2KZbsMCYjPEgx8--


