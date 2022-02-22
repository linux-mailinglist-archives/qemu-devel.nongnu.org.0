Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8124A4BF427
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:56:20 +0100 (CET)
Received: from localhost ([::1]:58912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQy3-0000JF-IN
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMQpF-00042w-JO
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:47:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMQpC-0007OH-Vw
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645519628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WGNVtDD8qK8LHpdXNNXV1LhlIlObl+FXkCW4wUr8a8Y=;
 b=g8+3v19hdx06TB+wp1dkNPiS5tHCCgwH/6JgMir4zii2TszvPaMelR1pcqS9TiZlgVGwIc
 PLcm5stx4fOjbIiJQkSUsaZ4VZKPTHscAjtZZamCYwxw+KH1XKvBbOsYmeK7Jn59wMKhzg
 e7YrpmQJrFhRdR0Jo9pBO8P+3UPPeEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-g0Zb7vW4PQKML_As2ksvBA-1; Tue, 22 Feb 2022 03:47:02 -0500
X-MC-Unique: g0Zb7vW4PQKML_As2ksvBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B81E1091DA1;
 Tue, 22 Feb 2022 08:47:01 +0000 (UTC)
Received: from localhost (unknown [10.39.195.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5C6728564;
 Tue, 22 Feb 2022 08:47:00 +0000 (UTC)
Date: Tue, 22 Feb 2022 08:46:59 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Wang, Haiyue" <haiyue.wang@intel.com>
Subject: Re: [PATCH v1] aio-posix: fix build failure io_uring 2.2
Message-ID: <YhSjA8L1W83dLj/c@stefanha-x1.localdomain>
References: <20220217161627.45351-1-haiyue.wang@intel.com>
 <YhOnmC5EDOK0D5/D@stefanha-x1.localdomain>
 <BYAPR11MB34957F574192BB1FCEBAB98DF73A9@BYAPR11MB3495.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AsmJmWYAHvhSYxwA"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB34957F574192BB1FCEBAB98DF73A9@BYAPR11MB3495.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AsmJmWYAHvhSYxwA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 04:43:55PM +0000, Wang, Haiyue wrote:
> > -----Original Message-----
> > From: Stefan Hajnoczi <stefanha@redhat.com>
> > Sent: Monday, February 21, 2022 22:54
> > To: Wang, Haiyue <haiyue.wang@intel.com>
> > Cc: qemu-devel@nongnu.org; Fam Zheng <fam@euphon.net>; open list:Block =
I/O path <qemu-block@nongnu.org>
> > Subject: Re: [PATCH v1] aio-posix: fix build failure io_uring 2.2
> >=20
> > On Fri, Feb 18, 2022 at 12:16:27AM +0800, Haiyue Wang wrote:
> > > The io_uring fixed "Don't truncate addr fields to 32-bit on 32-bit":
> > > https://git.kernel.dk/cgit/liburing/commit/?id=3Dd84c29b19ed0b1300006=
19cff40141bb1fc3615b
> > >
> > > This leads to build failure:
> > > ../util/fdmon-io_uring.c: In function =E2=80=98add_poll_remove_sqe=E2=
=80=99:
> > > ../util/fdmon-io_uring.c:182:36: error: passing argument 2 of =E2=80=
=98io_uring_prep_poll_remove=E2=80=99 makes
> > integer from pointer without a cast [-Werror=3Dint-conversion]
> > >   182 |     io_uring_prep_poll_remove(sqe, node);
> > >       |                                    ^~~~
> > >       |                                    |
> > >       |                                    AioHandler *
> > > In file included from /root/io/qemu/include/block/aio.h:18,
> > >                  from ../util/aio-posix.h:20,
> > >                  from ../util/fdmon-io_uring.c:49:
> > > /usr/include/liburing.h:415:17: note: expected =E2=80=98__u64=E2=80=
=99 {aka =E2=80=98long long unsigned int=E2=80=99} but argument
> > is of type =E2=80=98AioHandler *=E2=80=99
> > >   415 |           __u64 user_data)
> > >       |           ~~~~~~^~~~~~~~~
> > > cc1: all warnings being treated as errors
> > >
> > > So convert the paramter to right type according to the io_uring defin=
e.
> > >
> > > Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
> > > ---
> > >  util/fdmon-io_uring.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
> > > index 1461dfa407..e7febbf11f 100644
> > > --- a/util/fdmon-io_uring.c
> > > +++ b/util/fdmon-io_uring.c
> > > @@ -179,7 +179,11 @@ static void add_poll_remove_sqe(AioContext *ctx,=
 AioHandler *node)
> > >  {
> > >      struct io_uring_sqe *sqe =3D get_sqe(ctx);
> > >
> > > +#ifdef LIBURING_HAVE_DATA64
> > > +    io_uring_prep_poll_remove(sqe, (__u64)node);
> > > +#else
> > >      io_uring_prep_poll_remove(sqe, node);
> > > +#endif
> > >  }
> >=20
> > Thanks for the patch. I suggest using the same approach as the liburing
> > commit to avoid the #ifdef:
>=20
> Old version is "void *user_data", so need to use ' LIBURING_HAVE_DATA64',
> also, as the comment said:
>=20
> /*
>  * Tell the app the have the 64-bit variants of the get/set userdata
>  */
> #define LIBURING_HAVE_DATA64
>=20
> And yes, two casts seems be more safe: (__u64)(uintptr_t)node

You are right. I forgot that QEMU needs to support old liburing versions
too. The #ifdef is necessary.

Stefan

--AsmJmWYAHvhSYxwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIUowMACgkQnKSrs4Gr
c8g9cAf/SgIt0lQ4W/WGO8ZnkUUjKSXqMMMnlM9pQt/tR2qyEURDKzIV3bwTS7xk
1gjBc/EiwiH8NvGmFuFFBa0KW2ANRT6fUxl7bh4mdbK/Ev76vIfk/cde1UjvwgKQ
YHYD6xQjHvV4tu3G33dSyYRlrXp1onaupLmCscUsLJOgRWyHr3+6MJoyzA7zS2Mn
0ADtor3HOuLOKl375ZWFqtKot7G/Dp0Srhik2tPANRe9ukDC/BsW1ZyuNk9LXvVk
EVGg+yRdY/Uxu4o+3QRlj5WjFRPQGd8N42tel4PS+63iIBGNLznJVXRia8TjNsRa
ZmJrUIiZP2/V+l8njTqT0q6OQ9xcQw==
=TO6e
-----END PGP SIGNATURE-----

--AsmJmWYAHvhSYxwA--


