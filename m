Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4CE6D8728
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 21:45:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk93r-0008DU-Dl; Wed, 05 Apr 2023 15:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pk93m-0008D4-1i
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 15:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pk93i-0006WY-NZ
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 15:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680723880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aqiN7F6kxBcLnsECZWjuY/vupkQAuwbfz0H9pgPS+MY=;
 b=RWRQRpCthpZzGggaer9L49MAJK5XhcWy9hakWvhnVCraqTeXoi+5ly+I7y290RVYD4PNRX
 axeHrhSsAy1kmEYB6OIf8+eQPYK9DkTAUSGwwT6a1LgBKmgQ1pbsy0hPAmnvlZgu0iJamb
 Wh/Nmfy1tsEglufzguOyfPXeD7Vt2Hc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-9LdICY58Px-L7QZys5A8CA-1; Wed, 05 Apr 2023 15:44:38 -0400
X-MC-Unique: 9LdICY58Px-L7QZys5A8CA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 353963C0D86D;
 Wed,  5 Apr 2023 19:44:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D56440C6EC4;
 Wed,  5 Apr 2023 19:44:36 +0000 (UTC)
Date: Wed, 5 Apr 2023 15:44:35 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 0/4] block: Split padded I/O vectors exceeding IOV_MAX
Message-ID: <20230405194435.GC676473@fedora>
References: <20230317175019.10857-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/BdcQ1/ETF/JqjD7"
Content-Disposition: inline
In-Reply-To: <20230317175019.10857-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--/BdcQ1/ETF/JqjD7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 06:50:15PM +0100, Hanna Czenczek wrote:
> RFC:
> https://lists.nongnu.org/archive/html/qemu-block/2023-03/msg00446.html
>=20
> Thanks for the feedback on the RFC!  Sounds like we agree that this is
> the right way to fix the bug.
>=20
> Here in v1, I=E2=80=99ve followed Vladimir=E2=80=99s suggestion to inline=
 the
> functionality of qemu_iovec_init_extended() in block/io.c, which, I
> think (hope), also addresses much of the feedback of Eric and Stefan.
>=20
> The test is unchanged, the rest is pretty much rewritten (though in
> spirit stays the same).
>=20
>=20
> Hanna Czenczek (4):
>   util/iov: Make qiov_slice() public
>   block: Split padded I/O vectors exceeding IOV_MAX
>   util/iov: Remove qemu_iovec_init_extended()
>   iotests/iov-padding: New test
>=20
>  include/qemu/iov.h                       |   8 +-
>  block/io.c                               | 153 +++++++++++++++++++++--
>  util/iov.c                               |  89 +++----------
>  tests/qemu-iotests/tests/iov-padding     |  85 +++++++++++++
>  tests/qemu-iotests/tests/iov-padding.out |  59 +++++++++
>  5 files changed, 306 insertions(+), 88 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/iov-padding
>  create mode 100644 tests/qemu-iotests/tests/iov-padding.out

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--/BdcQ1/ETF/JqjD7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQtz6MACgkQnKSrs4Gr
c8huMwf/aTpYIVLJp5pfuTLpRaQsS8alhchj/6Wi46Los3+wvtInmR0mCRdAludI
7WtJpMWV5RinPOJT4AGcLHrDqWLRzpbDLuGUE4TUImWqlarg9MqjAw0crtPxMLPl
DBDWv71lII7XSPEoMt3Z37HPkyCHfFK/9cpQml9DO2e4L0Mtde+UD6t/o22ecLfM
exu3M+7BMurRVqZsQsbwXCCVQ3x4loZtjqNnO40SPqlvcSawM3dfP5CiKMOeEaVG
fuAHh6FEGqr9lGMpzY2LKN4VSuuDjs+afGHVZiF2hvhKDH0qToXn1X5eWb6O7ugR
ESDyLeI413GJlW7g4CmQi5+kJjKq7A==
=OQl/
-----END PGP SIGNATURE-----

--/BdcQ1/ETF/JqjD7--


