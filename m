Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78A25FE1CC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:44:22 +0200 (CEST)
Received: from localhost ([::1]:42720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj3Bu-00034D-1z
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj3A4-0001TQ-Ii
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:42:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj3A1-0001tY-7l
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665686544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LpFPkv8H6rLLIOH6Y53REsmNoB8VNekRT3ZzF0TszpY=;
 b=J61uLqvwRt13p9fguLMmb0n1jMYPVzqGKY/QoFg9mIvxmqTQYKoosPZMIr5DSBABlufOU3
 p4UPZfuOp2gV62etjmzY82uOmJM8tff2bH4/xiKQsgPYazIYM+sGbqBRpQWIEmy8vrmYIk
 nsXC4+MjVUirj/nh9jvn/qPr/l1pM4c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-LJZOmT07Nk6tUhE62Ow0mA-1; Thu, 13 Oct 2022 14:42:21 -0400
X-MC-Unique: LJZOmT07Nk6tUhE62Ow0mA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95BFB3C138A4;
 Thu, 13 Oct 2022 18:42:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02C17112D416;
 Thu, 13 Oct 2022 18:42:19 +0000 (UTC)
Date: Thu, 13 Oct 2022 14:42:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 sgarzare@redhat.com, "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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
Subject: Re: [PATCH v6 12/13] blkio: implement BDRV_REQ_REGISTERED_BUF
 optimization
Message-ID: <Y0hcCuwVPbz6jPJi@fedora>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-13-stefanha@redhat.com>
 <CAELaAXySt1gpxOHPgtvuaQR49E6kuuGk4gQr8Ky0wO54ZNp0KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6ltHTe5GhFIfDJMX"
Content-Disposition: inline
In-Reply-To: <CAELaAXySt1gpxOHPgtvuaQR49E6kuuGk4gQr8Ky0wO54ZNp0KA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--6ltHTe5GhFIfDJMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 02:57:47PM +0100, Alberto Faria wrote:
> On Thu, Oct 6, 2022 at 10:35 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > @@ -620,15 +767,39 @@ static int blkio_file_open(BlockDriverState *bs, =
QDict *options, int flags,
> >          return ret;
> >      }
> >
> > +    ret =3D blkio_get_bool(s->blkio,
> > +                         "mem-regions-pinned",
>=20
> Should the property be named "may-pin-mem-regions" or similar? For
> drivers like vhost-user we may not be able to determine for sure
> whether memory regions will be pinned, and making that uncertainty
> explicit in the name may be a good idea, for instance to ensure users
> don't decide to rely on memory regions being pinned when the property
> is true.

Sounds good to me. I'll change the property name in this patch and then
send a libblkio patch that adds the property.

Stefan

--6ltHTe5GhFIfDJMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNIXAoACgkQnKSrs4Gr
c8hHQgf/VPSQVRVAxuDaxpyG02CMVZAW7YO9fuzJ4vuhmFx+T0J+uuvYXO4UnVr8
Fbm/08zG/5j8kcY5dau9TRYHkhxBg17+CSMmpvl9uiAjl3PlVsjLz5mW1GBc3bo+
xMP+ibvP2627rNxq727M0ho5tGQZyykg1vGlamujtEkvxroBgpJNewKaWBuGGBcW
J0z3RQslcCf6PRP9nfGZilWmtx4OdWiLHJJFL14UrS0EtX9DoropALiRT1xJ8HVQ
4QCqounwPeXb54K6BZxJQx/CLPGa6ihNhWMCeAcqMxaSepQypCjLoEMCOUwP1XZL
LzdxtXWG5brJLYbFaNWSbSQ8QIXE/Q==
=VPUA
-----END PGP SIGNATURE-----

--6ltHTe5GhFIfDJMX--


