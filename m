Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117513AEA22
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:36:30 +0200 (CEST)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvK6H-0003Kn-2j
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvK3s-0000i0-SA
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvK3m-0001bF-TX
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624282431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mt1p88aIgNGs/5uct0yjEaBYFsJzckrWQI9JHjNgnFI=;
 b=MvkK9eIgOnI3D2N0W5FivLQb1oUQKXk8BFBHtTifijf2gCg3K/C1JIaGtnw/fYtrjxXiYt
 ssrmxXSbCYeFcTpOqrTbXsPto1L0uo5nzTCLtX4q4D57ArP3UdKFEflfSJxGX5WlncVZkc
 1+1+qv/lIunJexuoDs7Z8pzzWvv6+FI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-_H0i8s1PNyqsmXHOMer7pg-1; Mon, 21 Jun 2021 09:33:49 -0400
X-MC-Unique: _H0i8s1PNyqsmXHOMer7pg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0550E804140;
 Mon, 21 Jun 2021 13:33:48 +0000 (UTC)
Received: from localhost (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A005260C9F;
 Mon, 21 Jun 2021 13:33:47 +0000 (UTC)
Date: Mon, 21 Jun 2021 14:33:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/2] introduce QEMU_AUTO_VFREE
Message-ID: <YNCVOs4rKGKNh4BF@stefanha-x1.localdomain>
References: <20210619142120.48211-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210619142120.48211-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yimLVAnObdUpsdUN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, eesposit@redhat.com, qemu-block@nongnu.org,
 eblake@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yimLVAnObdUpsdUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 19, 2021 at 05:21:18PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Hi all!
>=20
> There is a good movement to use g_autofree macro, that helps to
> automatically call g_free on exit from code block.
>=20
> We lack similar possibility for qemu_memalign() functions family. Let's
> add, it seems rather simple with help of "cleanup" attribute.
>=20
> I'll update more places with a follow-up if this is accepted.
>=20
> Vladimir Sementsov-Ogievskiy (2):
>   introduce QEMU_AUTO_VFREE
>   block/commit: use QEMU_AUTO_VFREE
>=20
>  include/qemu/osdep.h |  2 ++
>  block/commit.c       | 25 +++++++++----------------
>  2 files changed, 11 insertions(+), 16 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yimLVAnObdUpsdUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDQlToACgkQnKSrs4Gr
c8hqfwf/UvWD6YUgvWDTUO5NAp5tES+6rCwQI8OT2qbNKDdffo6kLI7k/dZ3JXSU
u721YP6RQ1yD1nmy7bjTC2HGAKANV79w1U9eBrh2+ozQZg9KZOENqiSoMvNN1V5A
wDpneytBLP6JTm7kXOy4iZEmJEWWPpusb/hkrqh7/uYgzz/6zJ+OtSvU/jCz/oyt
ly5h7ir7F8vwRYR+9tOUSz7PuwwyHotny1xjzcNfCHMJpfxLIwCz/9+cXJ7hklVW
EaYAPzP7WSwTl5NEbT6X0fgHKAVI9Aj/DEF1aN6QyvV0idMGpT77vMZD077QvHD6
HGFKr7saV7cksgS80Wb2YAh6pZetNQ==
=Uhkc
-----END PGP SIGNATURE-----

--yimLVAnObdUpsdUN--


