Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D9598CE0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 21:51:03 +0200 (CEST)
Received: from localhost ([::1]:59694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOlXi-0001OX-JP
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 15:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oOlTd-0008J9-II
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 15:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oOlTY-00029n-3Z
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 15:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660852003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8DQPTZa+FJhGiZYzszEEmeXXw0W02fH/zbF5EavIZmk=;
 b=LmIrTm/cxHLAwODBuN90dw5HND8SQeQ+tsF/kKrFA2HNequiEAdUu7BaSdP4pjbTJwVV8U
 ioNt8hF2YBSvGRoGsvaIxc4LwSVFBdzcXbUhVQu74ilYYtGE6jyj4M4kVtrSkDFljL6XNm
 TB3HexkfIqzS7ocw6QawjIqpINlvCGw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-5ELn81eiPK67IKW-Y8dJqg-1; Thu, 18 Aug 2022 15:46:40 -0400
X-MC-Unique: 5ELn81eiPK67IKW-Y8dJqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 868231C01B45;
 Thu, 18 Aug 2022 19:46:39 +0000 (UTC)
Received: from localhost (unknown [10.39.192.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7EC8141DC28;
 Thu, 18 Aug 2022 19:46:37 +0000 (UTC)
Date: Thu, 18 Aug 2022 15:46:36 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC v3 7/8] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
Message-ID: <Yv6XHAqgx1J3pTTc@fedora>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-8-stefanha@redhat.com>
 <8c8faae1-9215-9b18-0051-028e78f56009@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pButiNpP5gw2zNbp"
Content-Disposition: inline
In-Reply-To: <8c8faae1-9215-9b18-0051-028e78f56009@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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


--pButiNpP5gw2zNbp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 12:13:53PM +0200, Hanna Reitz wrote:
> On 08.07.22 06:17, Stefan Hajnoczi wrote:
> > Avoid bounce buffers when QEMUIOVector elements are within previously
> > registered bdrv_register_buf() buffers.
> >=20
> > The idea is that emulated storage controllers will register guest RAM
> > using bdrv_register_buf() and set the BDRV_REQ_REGISTERED_BUF on I/O
> > requests. Therefore no blkio_map_mem_region() calls are necessary in the
> > performance-critical I/O code path.
> >=20
> > This optimization doesn't apply if the I/O buffer is internally
> > allocated by QEMU (e.g. qcow2 metadata). There we still take the slow
> > path because BDRV_REQ_REGISTERED_BUF is not set.
>=20
> Which keeps the question relevant of how slow the slow path is, i.e. whet=
her
> it wouldn=E2=80=99t make sense to keep some of the mem regions allocated =
there in a
> cache instead of allocating/freeing them on every I/O request.

Yes, bounce buffer reuse would be possible, but let's keep it simple for
now.

> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   block/blkio.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 101 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/block/blkio.c b/block/blkio.c
> > index 7fbdbd7fae..37d593a20c 100644
> > --- a/block/blkio.c
> > +++ b/block/blkio.c
>=20
> [...]
>=20
> > @@ -198,6 +203,8 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverStat=
e *bs, int64_t offset,
> >           BlockCompletionFunc *cb, void *opaque)
> >   {
> >       BDRVBlkioState *s =3D bs->opaque;
> > +    bool needs_mem_regions =3D
> > +        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
>=20
> Is that condition sufficient?=C2=A0 bdrv_register_buf() has no way of ret=
urning
> an error, so it=E2=80=99s possible that buffers are silently not register=
ed.=C2=A0 (And
> there are conditions in blkio_register_buf() where the buffer will not be
> registered, e.g. because it isn=E2=80=99t aligned.)
>=20
> The caller knows nothing of this and will still pass
> BDRV_REQ_REGISTERED_BUF, and then we=E2=80=99ll assume the region is mapp=
ed but it
> won=E2=80=99t be.
>=20
> >       struct iovec *iov =3D qiov->iov;
> >       int iovcnt =3D qiov->niov;
> >       BlkioAIOCB *acb;
>=20
> [...]
>=20
> > @@ -324,6 +333,80 @@ static void blkio_io_unplug(BlockDriverState *bs)
> >       }
> >   }
> > +static void blkio_register_buf(BlockDriverState *bs, void *host, size_=
t size)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    int ret;
> > +    struct blkio_mem_region region =3D (struct blkio_mem_region){
> > +        .addr =3D host,
> > +        .len =3D size,
> > +        .fd =3D -1,
> > +    };
> > +
> > +    if (((uintptr_t)host | size) % s->mem_region_alignment) {
> > +        error_report_once("%s: skipping unaligned buf %p with size %zu=
",
> > +                          __func__, host, size);
> > +        return; /* skip unaligned */
> > +    }
>=20
> How big is mem-region-alignment generally?=C2=A0 Is it like 4k or is it g=
oing to
> be a real issue?

Yes, it's usually the page size of the MMU/IOMMU. vhost-user and VFIO
have the same requirements so I don't think anything special is
necessary.

> (Also, we could probably register a truncated region.=C2=A0 I know, that=
=E2=80=99ll break
> the BDRV_REQ_REGISTERED_BUF idea because the caller won=E2=80=99t know we=
=E2=80=99ve
> truncated it, but that=E2=80=99s no different than just not registering t=
he buffer
> at all.)
>=20
> > +
> > +    /* Attempt to find the fd for a MemoryRegion */
> > +    if (s->needs_mem_region_fd) {
> > +        int fd =3D -1;
> > +        ram_addr_t offset;
> > +        MemoryRegion *mr;
> > +
> > +        /*
> > +         * bdrv_register_buf() is called with the BQL held so mr lives=
 at least
> > +         * until this function returns.
> > +         */
> > +        mr =3D memory_region_from_host(host, &offset);
> > +        if (mr) {
> > +            fd =3D memory_region_get_fd(mr);
> > +        }
>=20
> I don=E2=80=99t think it=E2=80=99s specified that buffers registered with
> bdrv_register_buf() must be within a single memory region, is it? So can =
we
> somehow verify that the memory region covers the whole buffer?

You are right, there is no guarantee. However, the range will always be
within a RAMBlock at the moment because the bdrv_register_buf() calls
are driven by a RAMBlock notifier and match the boundaries of the
RAMBlocks.

I will add a check so this starts failing when that assumption is
violated.

>=20
> > +        if (fd =3D=3D -1) {
> > +            error_report_once("%s: skipping fd-less buf %p with size %=
zu",
> > +                              __func__, host, size);
> > +            return; /* skip if there is no fd */
> > +        }
> > +
> > +        region.fd =3D fd;
> > +        region.fd_offset =3D offset;
> > +    }
> > +
> > +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> > +        ret =3D blkio_map_mem_region(s->blkio, &region);
> > +    }
> > +
> > +    if (ret < 0) {
> > +        error_report_once("Failed to add blkio mem region %p with size=
 %zu: %s",
> > +                          host, size, blkio_get_error_msg());
> > +    }
> > +}
> > +
> > +static void blkio_unregister_buf(BlockDriverState *bs, void *host, siz=
e_t size)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    int ret;
> > +    struct blkio_mem_region region =3D (struct blkio_mem_region){
> > +        .addr =3D host,
> > +        .len =3D size,
> > +        .fd =3D -1,
> > +    };
> > +
> > +    if (((uintptr_t)host | size) % s->mem_region_alignment) {
> > +        return; /* skip unaligned */
> > +    }
> > +
> > +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> > +        ret =3D blkio_unmap_mem_region(s->blkio, &region);
> > +    }
>=20
> The documentation of libblkio says that =E2=80=9Cmemory regions must be
> unmapped/freed with exactly the same `region` field values that they were
> mapped/allocated with.=E2=80=9D=C2=A0 We don=E2=80=99t set .fd here, thou=
gh.

That's a bug. The memory region will not be unmapped because libblkio's
HashSet won't match. I'll fix the QEMU code to pass the exact same
struct blkio_mem_region fields.

>=20
> It=E2=80=99s also unclear whether it=E2=80=99s allowed to unmap a region =
that wasn=E2=80=99t mapped,
> but I=E2=80=99ll trust libblkio to detect that.

Yes, it's a nop.

>=20
> > +
> > +    if (ret < 0) {
> > +        error_report_once("Failed to delete blkio mem region %p with s=
ize %zu: %s",
> > +                          host, size, blkio_get_error_msg());
> > +    }
> > +}
> > +
> >   static void blkio_parse_filename_io_uring(const char *filename, QDict=
 *options,
> >                                             Error **errp)
> >   {
>=20
> [...]
>=20
> > @@ -459,7 +553,7 @@ static int blkio_file_open(BlockDriverState *bs, QD=
ict *options, int flags,
> >           return ret;
> >       }
> > -    bs->supported_write_flags =3D BDRV_REQ_FUA;
> > +    bs->supported_write_flags =3D BDRV_REQ_FUA | BDRV_REQ_REGISTERED_B=
UF;
>=20
> Shouldn=E2=80=99t we also report it as a supported read flag then?

Yes, thank you!

Stefan

--pButiNpP5gw2zNbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL+lxwACgkQnKSrs4Gr
c8jmHQf/R2kAZoTqzCfrro0YamTpX857szdAM7SKU0IQAhwVY3386Y1Pl4kMl/UE
nQf573F9kU1bTtLY20qQCaC9PMN7CfnajU00x5VfBHzjN5k0UKxMJlgbFbJf6qdm
on4XYfW3p6e0ma+J2sb26IKiHsTnk3OMsA5Cn3pEbgnpvDdma/qxKCvl8Y3p1HQR
YWnyLWdgT5h3ItEHTmF2/xeVeV6OVYqOtHN31e0FK+R4WOsIzA7g4lHcAkofgsrN
Ve7mvrgMay9ajZNdZfg+FKvNF7kISqnwVEPckoOWztj19MitM13eW1gW7KDaLnnc
om05cJS5mXRpU5Zt5wVOlhxkzrw3Fw==
=PvZh
-----END PGP SIGNATURE-----

--pButiNpP5gw2zNbp--


