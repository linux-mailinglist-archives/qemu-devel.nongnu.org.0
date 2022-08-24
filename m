Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40EB5A0111
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:06:53 +0200 (CEST)
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQumC-0001rh-AX
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQufz-0004w0-0O
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQuft-00086g-RQ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661364021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VqjN5+D2ehYe76XCIgXWTytIK46+HqgcuCvCTTzNJyY=;
 b=dzQJajL/jMG9tE9YZcqUu9oKfL6ajTDOIBSOcfSujWDGLOR/Dxkg6ki0wuyASSHRE4mIK2
 lE/ZoMg/38N8/NEELkfUAO889xH+cJEH/335/YboiDA7QbDFrt2J8y20LMln5k4ZVs4RyB
 Ox7qKgxxNRoJ4Tdk4ZPzW8m7vHgDXmY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-DGCE3fEYNBGxzDXIMAHj3Q-1; Wed, 24 Aug 2022 14:00:17 -0400
X-MC-Unique: DGCE3fEYNBGxzDXIMAHj3Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4005D1C01B2F;
 Wed, 24 Aug 2022 18:00:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9218492CA5;
 Wed, 24 Aug 2022 18:00:16 +0000 (UTC)
Date: Wed, 24 Aug 2022 14:00:14 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru
Subject: Re: [PATCH v1 3/5] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Message-ID: <YwZnLjzWUTjiPY+i@fedora>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
 <20220824091837.301708-4-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hfbHQaB4hemrYkn3"
Content-Disposition: inline
In-Reply-To: <20220824091837.301708-4-d-tatianin@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--hfbHQaB4hemrYkn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 12:18:35PM +0300, Daniil Tatianin wrote:
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 9117222456..e89164c358 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -251,6 +251,8 @@ static uint64_t vhost_user_blk_get_features(VirtIODev=
ice *vdev,
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> =20
> +    features |=3D s->host_features;

I think you can eliminate this if you use vdev->host_features in the
qdev properties instead of adding a separate s->host_features field.
That will simplify the code.

--hfbHQaB4hemrYkn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMGZy4ACgkQnKSrs4Gr
c8jDtAf/YXgwkRjVUzwGXwIUr7Gs1VDrXNONv3rOuEHon0zL1WTdKe1B6G48swwR
C8xGjABnOuEXXAGUDLz3NcOxDjO6nOJqd41DHaDmwbxft28iG9ph0BB0VyTykrfS
pCxBQsduhhSDJQHHlVGLcmzjlzALDAWDy+FEDFpafxTPQkXtalnVTQW7T8cb9lBh
L9xL4RvisJqdathsN3xeiv/bRj5E4XUkVhGgG/czz9rEdX/eAKsEcPGr0Z89a7QX
xdyl7VcEpPW+9u/gUAD22B/Ew9DeavClYjLRicKNW9sWG7zQsWhJ40OIXnVYWIei
0KEaaNi4D2FKjTy0WCgassUlLYgLRA==
=O/t/
-----END PGP SIGNATURE-----

--hfbHQaB4hemrYkn3--


