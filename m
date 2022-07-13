Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2B572E1A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 08:24:54 +0200 (CEST)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVnp-0006Xf-Sg
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 02:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBViU-0002xx-A0
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBViR-0000Kl-BN
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657693158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6hO3KLic+QrBNrWdTsliX6c8j//16cBFP51I5+8fS8=;
 b=Ky6ZqiJHRj5gTxGMulijFZjjugOhV9oXEihFzYn9bJIN4EVkhS4nwPHxzP74TBBeQy/3kY
 JzKa2Tn+wtLSBNu5pxsXnJ9vl2c1qFKHtaEjXJ8j7LG3sJrrmJE41dvqB/eMgPZyHMgxof
 t5C3G8JJufD+1b1Y30BROjJ1uKiELQw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-QZbzmMHEPd2FOCatsaJO9w-1; Wed, 13 Jul 2022 02:19:13 -0400
X-MC-Unique: QZbzmMHEPd2FOCatsaJO9w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAF99811E7A;
 Wed, 13 Jul 2022 06:19:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3B8492CA2;
 Wed, 13 Jul 2022 06:19:12 +0000 (UTC)
Date: Wed, 13 Jul 2022 07:19:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Subject: Re: [RFC v4 1/9] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Message-ID: <Ys5j367C315MYk//@stefanha-x1.localdomain>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-2-faithilikerun@gmail.com>
 <Ys2YF9iYeicGf8xr@stefanha-x1.localdomain>
 <CAAAx-8+Hs6MJZ9Z_SDaqX+RKJ2UeSEtTAY7sy2Oit6PUc=muJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mcJsfUAf7xDvVoHO"
Content-Disposition: inline
In-Reply-To: <CAAAx-8+Hs6MJZ9Z_SDaqX+RKJ2UeSEtTAY7sy2Oit6PUc=muJg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mcJsfUAf7xDvVoHO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 08:51:45AM +0800, Sam Li wrote:
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8812=
=E6=97=A5=E5=91=A8=E4=BA=8C 23:49=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Jul 12, 2022 at 10:13:37AM +0800, Sam Li wrote:
> > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > index 48cd096624..e7523ae2ed 100644
> > > --- a/block/file-posix.c
> > > +++ b/block/file-posix.c
> > > @@ -67,6 +67,7 @@
> > >  #include <sys/param.h>
> > >  #include <sys/syscall.h>
> > >  #include <sys/vfs.h>
> > > +#include <linux/blkzoned.h>
> > >  #include <linux/cdrom.h>
> > >  #include <linux/fd.h>
> > >  #include <linux/fs.h>
> > > @@ -216,6 +217,13 @@ typedef struct RawPosixAIOData {
> > >              PreallocMode prealloc;
> > >              Error **errp;
> > >          } truncate;
> > > +        struct {
> > > +            int64_t *nr_zones;
> > > +            BlockZoneDescriptor *zones;
> > > +        } zone_report;
> > > +        struct {
> > > +            zone_op op;
> > > +        } zone_mgmt;
> > >      };
> > >  } RawPosixAIOData;
> > >
> > > @@ -1801,6 +1809,130 @@ static off_t copy_file_range(int in_fd, off_t=
 *in_off, int out_fd,
> > >  }
> > >  #endif
> > >
> >
> > Are the functions below within #ifdef __linux__?
>=20
> Maybe add them later?

When using #ifdefs you usually need to apply them consistently to avoid
compiler errors or warnings.

For example:

  static void foo(void) { ... }

  #ifdef __linux__
  static BlockDriver ... =3D {
      .foo =3D foo,
  };
  #endif /* __linux__ */

On non-Linux hosts the compiler only sees foo() but it's unused, so it a
warning about an unused function will be displayed.

And the other way around results in a compiler error:

  #ifdef __linux__
  static void foo(void) { ... }
  #endif /* __linux__ */

  static BlockDriver ... =3D {
      .foo =3D foo,
  };

On non-Linux hosts the compiler doesn't see the definition of foo() that
the BlockDriver struct requires and compilation fails with an error.

There will be no errors on your machine if you avoid #ifdefs everywhere,
but reviewers will be worried about it and Continuous Integration tests
will fail to build on non-Linux hosts.

I would put the #ifdefs in place from the start.

> > > +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int=
64_t offset,
> > > +                                           int64_t *nr_zones,
> > > +                                           BlockZoneDescriptor *zone=
s) {
> > > +    BDRVRawState *s =3D bs->opaque;
> > > +    RawPosixAIOData acb;
> > > +
> > > +    acb =3D (RawPosixAIOData) {
> > > +        .bs         =3D bs,
> > > +        .aio_fildes =3D s->fd,
> > > +        .aio_type   =3D QEMU_AIO_IOCTL,
> >
> > Please define QEMU_AIO_ZONE_REPORT, QEMU_AIO_ZONE_MGMT, etc values for
> > these new operations instead of reusing QEMU_AIO_IOCTL, which is meant
> > for generic passthrough ioctls.

After looking again I think .aio_type isn't used in this code path. You
can skip initializing this field if you want and no new enum constants
are needed.

Stefan

--mcJsfUAf7xDvVoHO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLOY98ACgkQnKSrs4Gr
c8js/wgAhWmyjgkpHHcC/55KsBjJ3Ca/Tueg3UCc+euODHFYoLO5K8O9OsGl0BSJ
VlY64sK775Cme6gjQNj6jJ04e/HIrCmiEMMCs+H/a/RRE7A9anG2L6ZEw/CSjdRT
ZmP7n0RGaKys/AUltyPbAo3frhDZ/8dzB9zqg9f2CKBNOTIVmGQkShfSY4UafZOL
7zP9v9mjAkeJbHvxoyvFA2nri9/zOzmmkSOB/6eZlRwvtOoubrbUzCSVmM1YM/4K
UAst2HZg73dcQCXzfqsqtExsBfLWbExLfKR8z9O2bDT0DJDQL4jeaqd/U/rDy8hu
qdJ+2DyEPIRmFmyB0exJ5eWCDd49WQ==
=qDWB
-----END PGP SIGNATURE-----

--mcJsfUAf7xDvVoHO--


