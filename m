Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A35FE06F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:09:40 +0200 (CEST)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2eJ-0002rW-2Y
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj2aV-0000BO-8B
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj2aR-0004tR-LW
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665684334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QimbY7k4f8iiE61zw7ZSz6fV5CkE+gvK22y/Qjzatn0=;
 b=gXLLCAv3mWi4PHgfmsmE/Z/7tpuAulTZ5sIEC+M1zXhSabbXBbGFbTRemrtmSSEz9tzCTe
 GMP+b7PBco+4QfBgeWEp2lnG1kpc6QNnqM1lAhdtMkL0yXrBdNXgdN4ioneB4vrB12g3Kk
 hDdTS2AI/dOwcF0lc4u/jaR1yN8NY2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-hwA8fC-vNm2MtKzE0P3MAg-1; Thu, 13 Oct 2022 14:05:31 -0400
X-MC-Unique: hwA8fC-vNm2MtKzE0P3MAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E06B286F136;
 Thu, 13 Oct 2022 18:05:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A58AC2C8DD;
 Thu, 13 Oct 2022 18:05:24 +0000 (UTC)
Date: Thu, 13 Oct 2022 14:05:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: Re: [PATCH v6 09/13] block: add BlockRAMRegistrar
Message-ID: <Y0hTYt6kwEasO5ea@fedora>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-10-stefanha@redhat.com>
 <20221007105121.qxhuroqnqhzqkmgo@sgarzare-redhat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HoLt6UEaNMpGAS3I"
Content-Disposition: inline
In-Reply-To: <20221007105121.qxhuroqnqhzqkmgo@sgarzare-redhat>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--HoLt6UEaNMpGAS3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 12:51:21PM +0200, Stefano Garzarella wrote:
> On Thu, Oct 06, 2022 at 05:35:03PM -0400, Stefan Hajnoczi wrote:
> > Emulated devices and other BlockBackend users wishing to take advantage
> > of blk_register_buf() all have the same repetitive job: register
> > RAMBlocks with the BlockBackend using RAMBlockNotifier.
> >=20
> > Add a BlockRAMRegistrar API to do this. A later commit will use this
> > from hw/block/virtio-blk.c.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > MAINTAINERS                          |  1 +
> > include/sysemu/block-ram-registrar.h | 37 ++++++++++++++++++
> > block/block-ram-registrar.c          | 58 ++++++++++++++++++++++++++++
> > block/meson.build                    |  1 +
> > 4 files changed, 97 insertions(+)
> > create mode 100644 include/sysemu/block-ram-registrar.h
> > create mode 100644 block/block-ram-registrar.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0dcae6168a..91aed2cdc7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2498,6 +2498,7 @@ F: block*
> > F: block/
> > F: hw/block/
> > F: include/block/
> > +F: include/sysemu/block-*.h
> > F: qemu-img*
> > F: docs/tools/qemu-img.rst
> > F: qemu-io*
> > diff --git a/include/sysemu/block-ram-registrar.h b/include/sysemu/bloc=
k-ram-registrar.h
> > new file mode 100644
> > index 0000000000..d8b2f7942b
> > --- /dev/null
> > +++ b/include/sysemu/block-ram-registrar.h
> > @@ -0,0 +1,37 @@
> > +/*
> > + * BlockBackend RAM Registrar
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef BLOCK_RAM_REGISTRAR_H
> > +#define BLOCK_RAM_REGISTRAR_H
> > +
> > +#include "exec/ramlist.h"
> > +
> > +/**
> > + * struct BlockRAMRegistrar:
> > + *
> > + * Keeps RAMBlock memory registered with a BlockBackend using
> > + * blk_register_buf() including hotplugged memory.
> > + *
> > + * Emulated devices or other BlockBackend users initialize a BlockRAMR=
egistrar
> > + * with blk_ram_registrar_init() before submitting I/O requests with t=
he
> > + * BDRV_REQ_REGISTERED_BUF flag set.
> > + */
> > +typedef struct {
> > +    BlockBackend *blk;
> > +    RAMBlockNotifier notifier;
> > +    bool ok;
> > +} BlockRAMRegistrar;
> > +
> > +void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk);
> > +void blk_ram_registrar_destroy(BlockRAMRegistrar *r);
> > +
> > +/* Have all RAMBlocks been registered successfully? */
> > +static inline bool blk_ram_registrar_ok(BlockRAMRegistrar *r)
> > +{
> > +    return r->ok;
> > +}
> > +
> > +#endif /* BLOCK_RAM_REGISTRAR_H */
> > diff --git a/block/block-ram-registrar.c b/block/block-ram-registrar.c
> > new file mode 100644
> > index 0000000000..25dbafa789
> > --- /dev/null
> > +++ b/block/block-ram-registrar.c
> > @@ -0,0 +1,58 @@
> > +/*
> > + * BlockBackend RAM Registrar
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "sysemu/block-backend.h"
> > +#include "sysemu/block-ram-registrar.h"
> > +#include "qapi/error.h"
> > +
> > +static void ram_block_added(RAMBlockNotifier *n, void *host, size_t si=
ze,
> > +                            size_t max_size)
> > +{
> > +    BlockRAMRegistrar *r =3D container_of(n, BlockRAMRegistrar, notifi=
er);
> > +    Error *err =3D NULL;
> > +
> > +    if (!r->ok) {
> > +        return; /* don't try again if we've already failed */
> > +    }
>=20
> The segfault I was seeing is gone, though, and I'm getting a doubt.
>=20
> Here we basically just report the error and prevent new regions from being
> registered. The VM still starts though and the blkio driver works as if
> nothing happened.
>=20
> For drivers that require all regions to be registered, this can cause
> problems, so should we stop the VM in case of failure or put the blkio
> driver in a state such that IOs are not submitted?
>=20
> Or maybe it's okay and then the device will somehow report the error when=
 it
> can't find the mapped region?

The BlockDriver supports the fast path for registered bufs but also has
a slow path using bounce buffers. When registered bufs fail it uses
bounce buffers. That's why the guest still boots.

Stefan

--HoLt6UEaNMpGAS3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNIU2IACgkQnKSrs4Gr
c8hDawgAwmRD5vtB8+bayxbGap59i9nJU6tGxWQCkU51mIp3txqwGvxUtJK58/HX
N+/iUrZfpxsmwp3PiPKgYRHToggV794Pl0gokvtDRUiz+PanOKGHbQILhsJrCrra
KsulHGyRp2kZ2hYhOoSOfmII+9CJl0ie9fHslr03fU3YqhoeYXO6TbDVlUlNu0W0
KhHO7XAgeUJIKfqS057YDJUmXnO5dg5LKIKB81je6yDDRz8uj8mOI9TXoQ8yiwD5
NSiuepuFLX+QNSLCVGa/UZFMEtSoIKgQi16v2ejNzqxW0eMXXO3yeQ7fQHvLcEfR
AswByfH4ESCZxVYz9kL4ynAtllU8+A==
=uqOq
-----END PGP SIGNATURE-----

--HoLt6UEaNMpGAS3I--


