Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B8444C428
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:16:42 +0100 (CET)
Received: from localhost ([::1]:57760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpL7-0000L4-4h
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:16:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mkpJV-0006pc-0a
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mkpJT-0002hb-DI
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636557298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S0WCI+uu7OGBYsBsCUo48d46xw8PQJLT1LttJI+P5KE=;
 b=GJNGYtGpS1n7U+24lh3sPBAauNbwC17sQi9l8MyFDntP5iJUlBzBZKrJnoIIYUq8yB3Jjz
 PHdRUVkX8v+wKVONzta07YALzQwacMA5ZIBhFL/uy3mzf0HR2r1K9Kz85Rz0CKS8DhKsDa
 mvLlexXoQPEmaOTAn8QDNcY7FLxQE9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-9VnL5TX-ND6UlCSU-ZDoqw-1; Wed, 10 Nov 2021 10:14:55 -0500
X-MC-Unique: 9VnL5TX-ND6UlCSU-ZDoqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB9781023F54;
 Wed, 10 Nov 2021 15:14:53 +0000 (UTC)
Received: from localhost (unknown [10.39.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0982A5C1C5;
 Wed, 10 Nov 2021 15:14:20 +0000 (UTC)
Date: Wed, 10 Nov 2021 15:14:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <YYvhy5Lm7YaqCWix@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <25571471.tMsSMU6axZ@silver>
 <YYuZfkfbxcX0JDRN@stefanha-x1.localdomain>
 <2300275.fgjvgC56zr@silver>
MIME-Version: 1.0
In-Reply-To: <2300275.fgjvgC56zr@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MTgpPM+Ebq/nv70D"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MTgpPM+Ebq/nv70D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 02:14:43PM +0100, Christian Schoenebeck wrote:
> On Mittwoch, 10. November 2021 11:05:50 CET Stefan Hajnoczi wrote:
> As you are apparently reluctant for changing the virtio specs, what about=
=20
> introducing those discussed virtio capabalities either as experimental on=
es=20
> without specs changes, or even just as 9p specific device capabilities fo=
r=20
> now. I mean those could be revoked on both sides at any time anyway.

I would like to understand the root cause before making changes.

"It's faster when I do X" is useful information but it doesn't
necessarily mean doing X is the solution. The "it's faster when I do X
because Y" part is missing in my mind. Once there is evidence that shows
Y then it will be clearer if X is a good solution, if there's a more
general solution, or if it was just a side-effect.

I'm sorry for frustrating your efforts here. We have discussed a lot of
different ideas and maybe our perspectives are not that far apart
anymore.

Keep going with what you think is best. If I am still skeptical we can
ask someone else to review the patches instead of me so you have a
second opinion.

Stefan

--MTgpPM+Ebq/nv70D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGL4csACgkQnKSrs4Gr
c8hXHAgAtaP4ELK5JSkI414ODRdabvMoQt2nDELgtpS3NUjXpfqKHpUHbyrcUpaE
DGxzhTczL404hvICt0gUNX220NweknvsnJrnzVVgk4gntfXr8lFX47/kmJSa9UER
axepbVKICpupNjnU3qb/4xpatpCfG58yLOjJOs1KokxJJE0eRuX3UmwZanf2nVyY
X4DDv+4GeVjSuy5CLyiqXEB/WgGOQNMeKdoQujDqlM9Qq/2P3CNVZ06uz1+cVa/g
6+6X99e5f02yw6ud6+zXOHp3kkdVUdDaCf9w9Lv5+x+HQ7k8G00OmC2tuzv6CGYY
xqzmyiCsjmH0Ky0z2BL3EzAGLwdy5A==
=n0yC
-----END PGP SIGNATURE-----

--MTgpPM+Ebq/nv70D--


