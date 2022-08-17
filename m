Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDC597842
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:53:55 +0200 (CEST)
Received: from localhost ([::1]:51960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOQ30-00059T-Qq
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oOQ11-0003Sd-Ng
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:51:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oOQ0y-0008IB-Ov
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660769507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kvIMSwEQ3fnqp62y7oXd+Ei/UUKWSiBlxzNlStYfFwA=;
 b=ALIKCXUjiTMpFzl7C/7jRjSR+4b5lpfp2vbXWC1hsPQEHqSTvmYAactbacPA3orRY0qD1V
 uCaSL6s9Po4URGWbwE3DMUtn5JWNOh/Hu7CwJO4QdLU65kpe9E5TvhBzy3tqBcypVsBIKz
 K1yoh4GcgiqgvdW8ZdxFqpfTPjEQIV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-RpU8SE7UO_CBGvqZZDZXkw-1; Wed, 17 Aug 2022 16:51:44 -0400
X-MC-Unique: RpU8SE7UO_CBGvqZZDZXkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0A11803301;
 Wed, 17 Aug 2022 20:51:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5638B40CF8E4;
 Wed, 17 Aug 2022 20:51:43 +0000 (UTC)
Date: Wed, 17 Aug 2022 16:51:41 -0400
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
Subject: Re: [RFC v3 5/8] block: add BlockRAMRegistrar
Message-ID: <Yv1U3diLPyXF1coa@fedora>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-6-stefanha@redhat.com>
 <9ec50e0f-46b1-8e44-6891-dbfb983cee1f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZRyWHmA5r//vNRuS"
Content-Disposition: inline
In-Reply-To: <9ec50e0f-46b1-8e44-6891-dbfb983cee1f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZRyWHmA5r//vNRuS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 11:30:11AM +0200, Hanna Reitz wrote:
> On 08.07.22 06:17, Stefan Hajnoczi wrote:
> > Emulated devices and other BlockBackend users wishing to take advantage
> > of blk_register_buf() all have the same repetitive job: register
> > RAMBlocks with the BlockBackend using RAMBlockNotifier.
> >=20
> > Add a BlockRAMRegistrar API to do this. A later commit will use this
> > from hw/block/virtio-blk.c.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   MAINTAINERS                          |  1 +
> >   include/sysemu/block-ram-registrar.h | 30 +++++++++++++++++++++
> >   block/block-ram-registrar.c          | 39 ++++++++++++++++++++++++++++
> >   block/meson.build                    |  1 +
> >   4 files changed, 71 insertions(+)
> >   create mode 100644 include/sysemu/block-ram-registrar.h
> >   create mode 100644 block/block-ram-registrar.c
>=20
> What memory is handled in ram_list?=C2=A0 Is it everything?=C2=A0 If so, =
won=E2=80=99t devices
> have trouble registering all those buffer, especially if they happen to be
> fragmented in physical memory? (nvme_register_buf() seems to say it can r=
un
> out of slots quite easily.)

I replied to this in another sub-thread. You are right, there is a
possibility of running out of mappings and there's no smart resource
management at the moment.

>=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 50f340d9ee..d16189449f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2490,6 +2490,7 @@ F: block*
> >   F: block/
> >   F: hw/block/
> >   F: include/block/
> > +F: include/sysemu/block-*.h
> >   F: qemu-img*
> >   F: docs/tools/qemu-img.rst
> >   F: qemu-io*
>=20
> Sneaky. ;)
>=20
> > diff --git a/include/sysemu/block-ram-registrar.h b/include/sysemu/bloc=
k-ram-registrar.h
> > new file mode 100644
> > index 0000000000..09d63f64b2
> > --- /dev/null
> > +++ b/include/sysemu/block-ram-registrar.h
> > @@ -0,0 +1,30 @@
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
> > + * BLK_REQ_REGISTERED_BUF flag set.
>=20
> s/BLK/BDRV/, right?

Thanks, fixed!

Stefan

--ZRyWHmA5r//vNRuS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL9VN0ACgkQnKSrs4Gr
c8hoVggAoQD0nA8Jj2iBkT9yJRP1fI9kQFYOYMHEucX2VZUqQxLm/9CVvjVI5D7n
nzNhKdUVOkVjORUBB3/ycqk2HVEhCwHaV7S8YTaEuo0zyqIJ4q/3bSuaE87OytJD
MNAr2oiAmDlMfbmL1J9RvttDt9DzexfaBMdEbm+V7aezMHBDw2BduQb6JqTxt43E
49d9/nlPo+unODT2hZNUjxdpB8d75pyCM0wxL3UPryLzO3i60AUk40HM5TEBqOAX
RDbbzEkC2X+zrk9lBxQN9QAmgwmyKynQFGn8vbLwxY8cqdKjM7WfaMG+p9sYRZW5
nZTgibHW8aJCJ+y2dlVrepcST1hRDQ==
=H2KJ
-----END PGP SIGNATURE-----

--ZRyWHmA5r//vNRuS--


