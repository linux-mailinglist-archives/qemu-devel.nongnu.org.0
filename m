Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5952595DC9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 15:53:52 +0200 (CEST)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNx0x-0005z9-Gd
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 09:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oNwx6-0001Rp-6i
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oNwx0-0006F1-3A
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660657784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LB+IG10CajSgfGRnWUkfKcwXnNF2Sh+IRbT0rCZ2w6s=;
 b=EwDWDN1KMLDgjKNWXDErflBLOX+9/py8UKAv6WZAsszvuL7kZqSIXfRbonUi+q25u9O++5
 Bq11nCvfYy2P5JmrhjVEoXpdU5o4N5NqTSSG3/Cxos0lBVDxWnjI696ac+M3gsZ/F7Ny9A
 8d1Id/zQbdce94VsNWwKacuJNI1wPys=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-gRNYKA39MgqIYITSD0BftQ-1; Tue, 16 Aug 2022 09:49:41 -0400
X-MC-Unique: gRNYKA39MgqIYITSD0BftQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CABAF3C11047;
 Tue, 16 Aug 2022 13:49:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED2082166B26;
 Tue, 16 Aug 2022 13:49:38 +0000 (UTC)
Date: Mon, 15 Aug 2022 16:52:15 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC v3 7/8] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
Message-ID: <Yvqx/9IbeSPLMuB2@fedora>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-8-stefanha@redhat.com>
 <20220712142802.h666smnitj2wh5bl@sgarzare-redhat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N6/XYIhLP/Mw8UWF"
Content-Disposition: inline
In-Reply-To: <20220712142802.h666smnitj2wh5bl@sgarzare-redhat>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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


--N6/XYIhLP/Mw8UWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 04:28:02PM +0200, Stefano Garzarella wrote:
> On Fri, Jul 08, 2022 at 05:17:36AM +0100, Stefan Hajnoczi wrote:
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
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > block/blkio.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++--
> > 1 file changed, 101 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/block/blkio.c b/block/blkio.c
> > index 7fbdbd7fae..37d593a20c 100644
> > --- a/block/blkio.c
> > +++ b/block/blkio.c
> > @@ -1,7 +1,9 @@
> > #include "qemu/osdep.h"
> > #include <blkio.h>
> > #include "block/block_int.h"
> > +#include "exec/memory.h"
> > #include "qapi/error.h"
> > +#include "qemu/error-report.h"
> > #include "qapi/qmp/qdict.h"
> > #include "qemu/module.h"
> >=20
> > @@ -28,6 +30,9 @@ typedef struct {
> >=20
> >     /* Can we skip adding/deleting blkio_mem_regions? */
> >     bool needs_mem_regions;
> > +
> > +    /* Are file descriptors necessary for blkio_mem_regions? */
> > +    bool needs_mem_region_fd;
> > } BDRVBlkioState;
> >=20
> > static void blkio_aiocb_complete(BlkioAIOCB *acb, int ret)
> > @@ -198,6 +203,8 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverStat=
e *bs, int64_t offset,
> >         BlockCompletionFunc *cb, void *opaque)
> > {
> >     BDRVBlkioState *s =3D bs->opaque;
> > +    bool needs_mem_regions =3D
> > +        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
> >     struct iovec *iov =3D qiov->iov;
> >     int iovcnt =3D qiov->niov;
> >     BlkioAIOCB *acb;
> > @@ -206,7 +213,7 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverStat=
e *bs, int64_t offset,
> >=20
> >     acb =3D blkio_aiocb_get(bs, cb, opaque);
> >=20
> > -    if (s->needs_mem_regions) {
> > +    if (needs_mem_regions) {
> >         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
> >             qemu_aio_unref(&acb->common);
> >             return NULL;
> > @@ -230,6 +237,8 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverSta=
te *bs, int64_t offset,
> > {
> >     uint32_t blkio_flags =3D (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
> >     BDRVBlkioState *s =3D bs->opaque;
> > +    bool needs_mem_regions =3D
> > +        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
> >     struct iovec *iov =3D qiov->iov;
> >     int iovcnt =3D qiov->niov;
> >     BlkioAIOCB *acb;
> > @@ -238,7 +247,7 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverSta=
te *bs, int64_t offset,
> >=20
> >     acb =3D blkio_aiocb_get(bs, cb, opaque);
> >=20
> > -    if (s->needs_mem_regions) {
> > +    if (needs_mem_regions) {
> >         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
> >             qemu_aio_unref(&acb->common);
> >             return NULL;
> > @@ -324,6 +333,80 @@ static void blkio_io_unplug(BlockDriverState *bs)
> >     }
> > }
> >=20
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
>=20
> If s->needs_mem_region_fd is true, memory_region_get_fd() crashes I think
> because mr->ram_block is not yet set, indeed from the stack trace
> blkio_register_buf() is called inside qemu_ram_alloc_resizeable(), and its
> result is used to set mr->ram_block in memory_region_init_resizeable_ram(=
):
>=20
> Program terminated with signal SIGSEGV, Segmentation fault.
> #0  0x000056235bf1f7a3 in memory_region_get_fd (mr=3D<optimized out>) at =
=2E./softmmu/memory.c:2309
> #1  0x000056235c07e54d in blkio_register_buf (bs=3D<optimized out>, host=
=3D0x7f824e200000, size=3D2097152)
>     at ../block/blkio.c:364
> #2  0x000056235c0246c6 in bdrv_register_buf (bs=3D0x56235d606b40, host=3D=
0x7f824e200000, size=3D2097152)
>     at ../block/io.c:3362
> #3  0x000056235bea44e6 in ram_block_notify_add (host=3D0x7f824e200000, si=
ze=3D131072, max_size=3D2097152)
>     at ../hw/core/numa.c:863
> #4  0x000056235bf22c00 in ram_block_add (new_block=3D<optimized out>, err=
p=3D<optimized out>)
>     at ../softmmu/physmem.c:2057
> #5  0x000056235bf232e4 in qemu_ram_alloc_internal (size=3Dsize@entry=3D13=
1072,
> max_size=3Dmax_size@entry=3D2097152, resized=3Dresized@entry=3D0x56235bc0=
f920
> <fw_cfg_resized>,     host=3Dhost@entry=3D0x0, ram_flags=3Dram_flags@entr=
y=3D4,
> mr=3Dmr@entry=3D0x56235dc3fe00,     errp=3D0x7ffcb21f1be0) at
> ../softmmu/physmem.c:2180
> #6  0x000056235bf26426 in qemu_ram_alloc_resizeable (size=3Dsize@entry=3D=
131072,
> maxsz=3Dmaxsz@entry=3D2097152, resized=3Dresized@entry=3D0x56235bc0f920
> <fw_cfg_resized>,     mr=3Dmr@entry=3D0x56235dc3fe00,
> errp=3Derrp@entry=3D0x7ffcb21f1be0) at ../softmmu/physmem.c:2209
> #7  0x000056235bf1cc99 in memory_region_init_resizeable_ram
> (mr=3D0x56235dc3fe00,     owner=3Downer@entry=3D0x56235d93ffc0,
> name=3Dname@entry=3D0x7ffcb21f1ca0 "/rom@etc/acpi/tables",     size=3D131=
072,
> max_size=3D2097152, resized=3Dresized@entry=3D0x56235bc0f920 <fw_cfg_resi=
zed>,
> errp=3D0x56235c996490 <error_fatal>) at ../softmmu/memory.c:1586
> #8  0x000056235bc0f99c in rom_set_mr (rom=3Drom@entry=3D0x56235ddd0200,
> owner=3D0x56235d93ffc0,     name=3Dname@entry=3D0x7ffcb21f1ca0
> "/rom@etc/acpi/tables", ro=3Dro@entry=3Dtrue)
>     at ../hw/core/loader.c:961
> #9  0x000056235bc12a65 in rom_add_blob (name=3Dname@entry=3D0x56235c1a2a09
> "etc/acpi/tables",     blob=3D0x56235df4f4b0, len=3D<optimized out>,
> max_len=3Dmax_len@entry=3D2097152,     addr=3Daddr@entry=3D18446744073709=
551615,
> fw_file_name=3Dfw_file_name@entry=3D0x56235c1a2a09 "etc/acpi/tables",
> fw_callback=3D0x56235be47f90 <acpi_build_update>,
> callback_opaque=3D0x56235d817830, as=3D0x0,     read_only=3Dtrue) at
> ../hw/core/loader.c:1102
> #10 0x000056235bbe0990 in acpi_add_rom_blob (
>     update=3Dupdate@entry=3D0x56235be47f90 <acpi_build_update>,
> opaque=3Dopaque@entry=3D0x56235d817830,     blob=3D0x56235d3ab750,
> name=3Dname@entry=3D0x56235c1a2a09 "etc/acpi/tables") at ../hw/acpi/utils=
=2Ec:46
> #11 0x000056235be481e6 in acpi_setup () at ../hw/i386/acpi-build.c:2805
> #12 0x000056235be3e209 in pc_machine_done (notifier=3D0x56235d5efce8, dat=
a=3D<optimized out>)
>     at ../hw/i386/pc.c:758
> #13 0x000056235c12e4a7 in notifier_list_notify (
>     list=3Dlist@entry=3D0x56235c963790 <machine_init_done_notifiers>, dat=
a=3Ddata@entry=3D0x0)
>     at ../util/notify.c:39

Hi Stefano,
I have fixed this by using RAMBlock instead of MemoryRegion. The next
revision will call qemu_ram_block_from_host() to fetch the RAMBlock's
fd.

Stefan

--N6/XYIhLP/Mw8UWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL6sf8ACgkQnKSrs4Gr
c8hGoQgAohsUz3QU5PzoEm0sQxUokid9QhkIO3KgMML0UB4EKrXEUVp1Bborjjbs
unrNPFUM3Qqj8e4rPvsUuzA2s/uvPp8LKbdF0oCAKFH8LErGF41tKPenVkL4SOAS
nhaCaMXvhz8h7R9L+aZP4TGB1v9/7DZMuQYo8oMsj8P7/v0azO7JoVNHWE5GkKUX
6BAKbhZdp025T5rU2uvX2ZAErdyisSIEXjxO80wKyCaNau96xcAv/c3pPWJCfXvL
mwXXt46Xwe1xQatORyfltm9RIvuyfZJ4mCTSdYNIavuWGv0O7TfyGNikOir9jbbo
62CW5bw+N1XTNHgU5GE24a8qEcm0UA==
=989a
-----END PGP SIGNATURE-----

--N6/XYIhLP/Mw8UWF--


