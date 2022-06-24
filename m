Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE5559DB7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:55:18 +0200 (CEST)
Received: from localhost ([::1]:47026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4leP-0006Zb-VN
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o4lZS-0006kq-9H
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:50:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o4lZM-0001w5-Eu
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VtFzNsWHiq8AIKHGLfJM4bkED5KVW81QiVKs54iPjBI=;
 b=K/rieXfiMUi9Jltpi7POxqgwhXpX7fCkoHNrNu/IiVV+uezSK8dIAy3YgQ3dz24+wsKJya
 QTjcYvnLg2reK+5+B1046/b4cJApTTEFFT4DM5/i6MKORKHRIhXCJxjC81wC92Ve2BmuJu
 GiDsVRGfOERE/gnkAYGFofC6K85vzWQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-SNFk6hI3PiKezW1y62im_g-1; Fri, 24 Jun 2022 11:49:59 -0400
X-MC-Unique: SNFk6hI3PiKezW1y62im_g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0CFC801233;
 Fri, 24 Jun 2022 15:49:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BEBE41616B;
 Fri, 24 Jun 2022 15:49:58 +0000 (UTC)
Date: Fri, 24 Jun 2022 16:49:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Hannes Reinecke <hare@suse.de>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: Re: [RFC v2] Adding block layer APIs resembling Linux
 ZoneBlockDevice ioctls.
Message-ID: <YrXdJQe+KiRcM5RN@stefanha-x1.localdomain>
References: <20220620033611.82166-1-faithilikerun@gmail.com>
 <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
 <CAAAx-8JdYAKfoS_xBxx5g2iAJFoAHLMqDkz5QA6jhw2QH1L0=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xbTgN8fqfXgDMkMT"
Content-Disposition: inline
In-Reply-To: <CAAAx-8JdYAKfoS_xBxx5g2iAJFoAHLMqDkz5QA6jhw2QH1L0=w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xbTgN8fqfXgDMkMT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2022 at 11:14:32AM +0800, Sam Li wrote:
> Hi Stefan,
>=20
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8820=
=E6=97=A5=E5=91=A8=E4=B8=80 15:55=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Mon, Jun 20, 2022 at 11:36:11AM +0800, Sam Li wrote:
> >
> > Hi Sam,
> > Is this version 2 of "[RFC v1] Add support for zoned device"? Please
> > keep the email subject line the same (except for "v2", "v3", etc) so
> > that it's clear which patch series this new version replaces.
> >
> > > Fix some mistakes before. It can report a range of zones now.
> >
> > This looks like the description of what changed compared to v1. Please
> > put the changelog below "---" in the future. When patch emails are
> > merged by git-am(1) it keeps the text above "---" and discards the text
> > below "---". The changelog is usually no longer useful once the patches
> > are merged, so it should be located below the "---" line.
> >
> > The text above the "---" is the commit description (an explanation of
> > why this commit is necessary). In this case the commit description
> > should explain that this patch adds .bdrv_co_zone_report() and
> > .bdrv_co_zone_mgmt() to BlockDriver so that zoned block devices can be
> > supported.
> >
> > >
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > ---
> > >  block/block-backend.c             |  22 ++++
> > >  block/coroutines.h                |   5 +
> > >  block/file-posix.c                | 182 ++++++++++++++++++++++++++++=
++
> > >  block/io.c                        |  23 ++++
> > >  include/block/block-common.h      |  43 ++++++-
> > >  include/block/block-io.h          |  13 +++
> > >  include/block/block_int-common.h  |  20 ++++
> > >  qemu-io-cmds.c                    | 118 +++++++++++++++++++
> > >  tests/qemu-iotests/tests/zoned.sh |  52 +++++++++
> > >  9 files changed, 477 insertions(+), 1 deletion(-)
> > >  create mode 100644 tests/qemu-iotests/tests/zoned.sh
> > >
> > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > index e0e1aff4b1..20248e4a35 100644
> > > --- a/block/block-backend.c
> > > +++ b/block/block-backend.c
> > > @@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
> > >      int ret;
> > >  } BlockBackendAIOCB;
> > >
> > > +
> > > +
> >
> > Please avoid whitespace changes in code that is otherwise untouched by
> > your patch. Code changes can cause merge conflicts and they make it
> > harder to use git-annotate(1), so only changes that are necessary should
> > be included in a patch.
> >
> > >  static const AIOCBInfo block_backend_aiocb_info =3D {
> > >      .get_aio_context =3D blk_aiocb_get_aio_context,
> > >      .aiocb_size =3D sizeof(BlockBackendAIOCB),
> > > @@ -1810,6 +1812,25 @@ int blk_flush(BlockBackend *blk)
> > >      return ret;
> > >  }
> > >
> >
> > Please add a documentation comment for blk_co_zone_report() that
> > explains how to use the functions and the purpose of the arguments. For
> > example, does offset have to be the first byte in a zone or can it be
> > any byte offset? What are the alignment requirements of offset and len?
> > Why is nr_zones a pointer?
> >
> > > +int blk_co_zone_report(BlockBackend *blk, int64_t offset, int64_t le=
n,
> >
> > Functions that run in coroutine context must be labeled with
> > coroutine_fn:
> >
> >     int coroutine_fn blk_co_zone_report(...)
> >
> > This tells humans and tools that the function can only be called from a
> > coroutine. There is a blog post about coroutines in QEMU here:
> > https://blog.vmsplice.net/2014/01/coroutines-in-qemu-basics.html
> >
> > > +                       int64_t *nr_zones,
> > > +                       struct BlockZoneDescriptor *zones)
> >
> > QEMU coding style uses typedefs when defining structs, so "struct
> > BlockZoneDescriptor *zones" should be written as "BlockZoneDescriptor
> > *zones".
> >
> > > +{
> > > +    int ret;
> >
> > This function is called from the I/O code path, please mark it with:
> >
> >   IO_CODE();
> >
> > From include/block/block-io.h:
> >
> >   * I/O API functions. These functions are thread-safe, and therefore
> >   * can run in any thread as long as the thread has called
> >   * aio_context_acquire/release().
> >   *
> >   * These functions can only call functions from I/O and Common categor=
ies,
> >   * but can be invoked by GS, "I/O or GS" and I/O APIs.
> >   *
> >   * All functions in this category must use the macro
> >   * IO_CODE();
> >   * to catch when they are accidentally called by the wrong API.
> >
> > > +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len, nr_zones=
, zones);
> >
> > Please add blk_inc_in_flight(blk) and blk_dec_in_flight(blk) around this
> > function call to ensure that zone report requests finish before I/O is
> > drained (see bdrv_drained_begin()). This is necessary so that it's
> > possible to wait for I/O requests, including zone report, to complete.
> >
> > Similar to blk_co_do_preadv() we need blk_wait_while_drained(blk),
> > blk_check_byte_request(), and bdrv_inc_in_flight(bs) before calling
> > bdrv_co_zone_report(). bdrv_dec_in_flight(bs) needs to be called after
> > bdrv_co_zone_report() returns.
> >
> After adding similar structure to blk_co_do_preadv(), zone operation
> command will always fail at blk_wait_while_drained(blk) because
> blk->inflight <=3D 0. Would it be ok to just remove
> blk_wait_while_drained?

Are you hitting the assertion in
block/block-backend.c:blk_wait_while_drained()?

  assert(blk->in_flight > 0);

If yes, then there is a bug in the code. You need to make sure that
blk_inc_in_flight() is called before blk_wait_while_drained().

> > > +    BLK_ZT_CONV =3D BLK_ZONE_TYPE_CONVENTIONAL,
> > > +    BLK_ZT_SWR =3D BLK_ZONE_TYPE_SEQWRITE_REQ,
> > > +    BLK_ZT_SWP =3D BLK_ZONE_TYPE_SEQWRITE_PREF,
> > > +};
> > > +
> > > +enum zone_cond {
> > > +    BLK_ZS_NOT_WP =3D BLK_ZONE_COND_NOT_WP,
> > > +    BLK_ZS_EMPTY =3D BLK_ZONE_COND_EMPTY,
> > > +    BLK_ZS_IOPEN =3D BLK_ZONE_COND_IMP_OPEN,
> > > +    BLK_ZS_EOPEN =3D BLK_ZONE_COND_EXP_OPEN,
> > > +    BLK_ZS_CLOSED =3D BLK_ZONE_COND_CLOSED,
> > > +    BLK_ZS_RDONLY =3D BLK_ZONE_COND_READONLY,
> > > +    BLK_ZS_FULL =3D BLK_ZONE_COND_FULL,
> > > +    BLK_ZS_OFFLINE =3D BLK_ZONE_COND_OFFLINE,
> > > +};
> >
> > This 1:1 correspondence with Linux constants could make the code a
> > little harder to port.
> >
> > Maybe QEMU's block layer should define its own numeric constants so the
> > code doesn't rely on operating system-specific headers.
> > block/file-posix.c #ifdef __linux__ code can be responsible for
> > converting Linux-specific constants to QEMU constants (and the 1:1
> > mapping can be used there).
> >
> Can we define those constants in block-common.h? Because
> BlockZoneDescriptor requires zone_condition, zone_type defined and
> BlockZoneDesicriptor are used in header files and qemu-io
> sub-commands. If we use #ifdef __linux__ in block-common.h, it can be
> responsible for converting Linux constants instead.
>=20
> Thanks for reviewing! If there is any problem, please let me know.

I suggest defining the constants in block-common.h. #ifdef __linux__ is
not necessary in block-common.h because the constants should just be an
enum with BLK_ZS_NOT_WP =3D 0 and so on (no need for Linux headers).

In block/file-posix.c you can define a helper function inside #ifdef
__linux__ that does something like:

  BlkZoneCond zone_cond_from_linux(enum blk_zone_cond val)
  {
      switch (val) {
      case BLK_ZONE_COND_NOT_WP:
          return BLK_ZS_NOT_WP;
      ...
  }

The code in block/file-posix.c should call this helper to convert from
Linux values to QEMU values.

This way the QEMU block layer does not use Linux constants and compiles
on non-Linux machines.

Stefan

--xbTgN8fqfXgDMkMT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmK13SUACgkQnKSrs4Gr
c8iO1wf/V7bTqYI6V9MDSS47QXcyiy6TGIK42voWgO6GDTpYnwqP5A3JUwxZ5GzW
94DEd/Qo4xTFioqfFNFG5j/BvF6k6Q7glOtcdz0MeixEUe/itOfD7bveiodxsuaC
/T7ObfKsfEGD5SoD5Rkmi0PmrWeenzv/PD/3QI4peibPC87HpFPjEMnoaGZ9LX2D
SVnnVxuMNAGKQpX+OwEDN1vnPQePMZy2Wp2qcNbx73K8HEbtdte52dkR6C+QVss4
PSe4u5cY/3IiNbgbA3ZxHI9Xhdwp70nJKKVS6S1BO8AAIYsX3hwfFutw3gHZ1UCz
lvWr1+AXfW33+1TwG8i3bEO1qolBSQ==
=FwdI
-----END PGP SIGNATURE-----

--xbTgN8fqfXgDMkMT--


