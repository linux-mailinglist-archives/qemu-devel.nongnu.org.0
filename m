Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C7595DCA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 15:53:56 +0200 (CEST)
Received: from localhost ([::1]:51406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNx11-00065P-OF
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 09:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oNwx6-0001SI-74
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oNwx2-0006FU-RK
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660657787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=raqsQB0wR1YqV+9MHbhUZD7sUVFd8D0nFitCKjFr85E=;
 b=buYvep/wMUwxTLh4e6yi2omofDotBPYyYzh+K/jgm0ch47ZP3dCSfzNgUQI5CcdauwcTQc
 Q0wq8iqN7wrtyiNZVOWbIiDpF0XRQG/taZxpPz55CzsYtL2tW+ir7rfsldPpvlekTrivDj
 /FAj3vFtzZFynj6FJ0Vr+T/GyzqDceE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-RqEDGdXUNIG4Vc3Hb9dquQ-1; Tue, 16 Aug 2022 09:49:43 -0400
X-MC-Unique: RqEDGdXUNIG4Vc3Hb9dquQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EA653C11044;
 Tue, 16 Aug 2022 13:49:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DD222026D4C;
 Tue, 16 Aug 2022 13:49:42 +0000 (UTC)
Date: Mon, 15 Aug 2022 17:24:55 -0400
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
Subject: Re: [RFC v3 8/8] virtio-blk: use BDRV_REQ_REGISTERED_BUF
 optimization hint
Message-ID: <Yvq5p1b2ZU9YEKGM@fedora>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-9-stefanha@redhat.com>
 <de535c49-a975-85dc-82f5-24d845a46502@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FQa0fQX38ka8VUXj"
Content-Disposition: inline
In-Reply-To: <de535c49-a975-85dc-82f5-24d845a46502@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


--FQa0fQX38ka8VUXj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 12:16:16PM +0200, Hanna Reitz wrote:
> On 08.07.22 06:17, Stefan Hajnoczi wrote:
> > Register guest RAM using BlockRAMRegistrar and set the
> > BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
> > accesses in I/O requests.
> >=20
> > This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
> > on DMA mapping/unmapping.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   include/hw/virtio/virtio-blk.h |  2 ++
> >   hw/block/virtio-blk.c          | 13 +++++++++----
> >   2 files changed, 11 insertions(+), 4 deletions(-)
>=20
> Seems fair, but as said on patch 5, I=E2=80=99m quite wary of =E2=80=9Cre=
gister guest RAM=E2=80=9D.=C2=A0
> How can we guarantee that it won=E2=80=99t be too fragmented to be regist=
erable with
> either nvme.c or blkio.c?

We can't guarantee it. blkio instances have a maximum number of mappings
and we might exceed it. This patch doesn't have a smart solution.

Smart solutions are possible, but I haven't had time to work on one yet.
It is necessary to keep track of which mappings are referenced by
in-flight requests. When the maximum number of mappings is hit, a
mapping that currently has no references can be evicted to make space.
When the maximum number of mappings is reached by in-flight requests
then new requests may have to wait.

Until we hit the maximum number of mappings in the real world this
doesn't matter.

Stefan

--FQa0fQX38ka8VUXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL6uacACgkQnKSrs4Gr
c8iuCwgAni2uyArx7m3kQEqL41CidFtjfyuz4qL0YGhwqqUpd6ARTXDkXk2iwddA
XfvP0O1UbcP7qC0+Y8RMc6Zs1DL/oSV7yRBJ5iBKL/yqjVrZOVSgf7SpN1Gn8dlB
+vm9KjHRl9uSRz8VMEheuU16uLWLs+m2/Vn8mvaMTAaP3Fs5AQr6C3345nxIiGJe
5pU0xCFyXe7rbUQGO37CoUjZSn9tPVr+HqozlTBBx6E8czy9s0+fXiF/LhUtqV09
H4jkVAm9fAVUFV31kvhpMj63fli2CNmKLekNAvnHousCgjJK4CPNBXNBNv6sJ1ww
nlSqjTV7Hy8CbrhgRQm9I0YsHTpnVA==
=t8kx
-----END PGP SIGNATURE-----

--FQa0fQX38ka8VUXj--


