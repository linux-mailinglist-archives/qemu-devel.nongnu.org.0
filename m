Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252F35A1279
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:38:49 +0200 (CEST)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRD4J-0005Tl-PT
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oRCzr-0001vb-Nh
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oRCzo-0003Mq-Jh
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661434447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5/5iEfo7zIB8sR9eta7NqEDOzQweg9C2FkTX6ii6k+Y=;
 b=gGfWLSn3IdyzWcO1dNEy8mUk82xQu7NWvWWoy3rOwwc7LTMeJBnJDiKmRl0uqMKrdXAjXi
 yjCLqjRWqRifIBSAnZGiySeK6cx8CoNHLg4ZgdcJvfL0wNVwfyDzR4a9cHKUZsVJzwpn6Y
 bYbKEEeQTo5euwNqZkIh8ywXmgN6Wro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-8T9rEFRUPn6B2Nlj6ULVjg-1; Thu, 25 Aug 2022 09:34:05 -0400
X-MC-Unique: 8T9rEFRUPn6B2Nlj6ULVjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 081A310146EB;
 Thu, 25 Aug 2022 13:34:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A17C1121319;
 Thu, 25 Aug 2022 13:34:03 +0000 (UTC)
Date: Thu, 25 Aug 2022 09:34:01 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru
Subject: Re: [PATCH v1 3/5] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Message-ID: <Ywd6SVPP3f6Xyo+M@fedora>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
 <20220824091837.301708-4-d-tatianin@yandex-team.ru>
 <YwZnLjzWUTjiPY+i@fedora>
 <fd2a2694-8149-d0fe-3cd2-914eb146efd0@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ABDbMtoNKFy6topn"
Content-Disposition: inline
In-Reply-To: <fd2a2694-8149-d0fe-3cd2-914eb146efd0@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--ABDbMtoNKFy6topn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 11:24:55PM +0300, Daniil Tatianin wrote:
> On 8/24/22 9:00 PM, Stefan Hajnoczi wrote:
> > On Wed, Aug 24, 2022 at 12:18:35PM +0300, Daniil Tatianin wrote:
> > > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > > index 9117222456..e89164c358 100644
> > > --- a/hw/block/vhost-user-blk.c
> > > +++ b/hw/block/vhost-user-blk.c
> > > @@ -251,6 +251,8 @@ static uint64_t vhost_user_blk_get_features(VirtI=
ODevice *vdev,
> > >   {
> > >       VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> > > +    features |=3D s->host_features;
> >=20
> > I think you can eliminate this if you use vdev->host_features in the
> > qdev properties instead of adding a separate s->host_features field.
> > That will simplify the code.
> Indeed, thanks for spotting that. I wonder why every virtio device
> implementation I've looked at has chosen to add their own host_features
> field (net/blk)?

It's for historical reasons. Over time more common behavior moves into
the core, but not all devices have been refactored to take advantage of
that.

Thanks,
Stefan

--ABDbMtoNKFy6topn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMHekkACgkQnKSrs4Gr
c8juQggAvVI7FqWXkbDH8bQicMih1qJWUNCFD5njFnFkPLQ9ucZvX7D+tKhxsqnt
IT4xOojOa7APf1dZ7PKnY1u5g4om0fMqBP21SVy+/sNG0gmVT9NeuVwpuQuhiJEt
V9cZS7XczyLGqSRgcWmfp3fbHuoN/2qIJ9H/Pk6q3LJ6VH/64wwbelpn7b3cYF2T
OKO4ayM858odd7qXyz/F2cIWFvQThNv7H3GzmaKz5L2FIZoBFcZzA0h9B5BW94EL
WAEkSR6cE9hqckt2fk5ncg+fMa5hYiTvoQx7zR7GEKBHfx1wLB7vQ2CY/SXLOXVW
oA8mpmzXLRaNWzT/VXihecoxED8M4Q==
=8pWq
-----END PGP SIGNATURE-----

--ABDbMtoNKFy6topn--


