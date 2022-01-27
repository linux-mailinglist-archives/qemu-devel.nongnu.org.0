Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34E49DCB6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:44:41 +0100 (CET)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0OW-0004aC-P4
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:44:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD02y-0005Jz-Sc
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD02s-0004vL-QF
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643271678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/nvaJ+f/18fsEIQfJw0WBtcr+8hkC+RKpg3qapLwlDg=;
 b=Lxb77tm7tsNjBI282zPxBZKaFZ6g9MJVlyxGYtnHkIIBo3H+ATOJSpweqgCUaO8D0Ex5Sc
 WDf7OHFfATjPI0szD925WI+W3rKVttpRMhUQT5uxq9ae6f3o5/B5SAWapcOOQ4A6fzWbry
 zlLtS+h1rAdDqv+STGv9q6K/K7bocSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-4iEU_qiWPVCrcbT7srJPIQ-1; Thu, 27 Jan 2022 03:21:14 -0500
X-MC-Unique: 4iEU_qiWPVCrcbT7srJPIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D43518C89F8;
 Thu, 27 Jan 2022 08:21:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43F8178DFC;
 Thu, 27 Jan 2022 08:21:13 +0000 (UTC)
Date: Thu, 27 Jan 2022 08:21:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 6/7] meson: document, why we don't generate trace
 events for tests/ and qga/
Message-ID: <YfJV+LnZDYgWElav@stefanha-x1.localdomain>
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <20220126161130.3240892-7-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ktavmzdjQkC1vDvY"
Content-Disposition: inline
In-Reply-To: <20220126161130.3240892-7-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ktavmzdjQkC1vDvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 05:11:29PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> Making trace generation work for tests/ and qga/ would involve some
> Meson hackery to ensure we generate the trace-events files before
> trace-tool uses them. Since we don't actually support tracing there
> anyway, we bypass that problem.
>=20
> Let's add corresponding comments.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qga/meson.build   | 7 +++++++
>  tests/meson.build | 7 +++++++
>  2 files changed, 14 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ktavmzdjQkC1vDvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHyVfcACgkQnKSrs4Gr
c8gKRAgAssAjw0GtXsiiaiXMkYgM0H0um0R71T1F3MQZLT44BFfiEdZG6jw52bfq
2ou6NaHbnSxTBPubgb4gA9lBdPR3MT8WQgRh5qwsuDogl/zFiL6zTa0IkFizCngj
/DDzvT+ryN/bzK2+XjHkbMH82i01goGQ2izGNzuvKenabNHoq2PGoFlD877CQ7va
Sul9MX4du1ldADtMmJCKrvYf4O7BpCI7YhLF+oub/qL9GJan8uINBtORdPc2PdCE
pXo6Xo/9smHYfI504kSeM9LnNdHolzY71yWkBK8Gh5r1wSmM9seA7ujv6bqMhN7q
wRSzrCXk7On3/4pZQTu5PLUsleKjhw==
=Jotx
-----END PGP SIGNATURE-----

--ktavmzdjQkC1vDvY--


