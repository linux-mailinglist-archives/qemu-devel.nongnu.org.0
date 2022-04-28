Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147451390B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:52:34 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6RV-0005MK-2P
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk5dY-0006Tb-Dq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:00:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk5dV-0001oz-1j
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651158052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=drczrVDPD7YA6AFW53tJK0gTQYfjNXyQvOqi249yrOM=;
 b=cGk66ANzOHZGlkVVleT8p/WeuqlrqYnxuqXuSOSY0+AWf2517r8Ik6GE4K4/lAtSX+c30m
 yOtX443rH+SwGh24TChOdvzUSgHv9ddEklG8kv24falJUGcGPKJsTCH4PBzbhqs72ejJrl
 Ri+8zRD2s/WNa76zRv7/CkZwRNi8GvQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-YuStyQgtPh6Wx3YcvqyaTw-1; Thu, 28 Apr 2022 11:00:47 -0400
X-MC-Unique: YuStyQgtPh6Wx3YcvqyaTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30C761C0BF0E;
 Thu, 28 Apr 2022 15:00:47 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFD1140FF400;
 Thu, 28 Apr 2022 15:00:46 +0000 (UTC)
Date: Thu, 28 Apr 2022 16:00:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 7/8] graph-lock: implement WITH_GRAPH_RDLOCK_GUARD
 and GRAPH_RDLOCK_GUARD macros
Message-ID: <YmqsHVxS37XUSe+9@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2T/wfK59KOGrVwf1"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2T/wfK59KOGrVwf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:13AM -0400, Emanuele Giuseppe Esposito wrote:
> Similar to the implementation in lockable.h, implement macros to
> automatically take and release the rdlock.
> Create the empty GraphLockable struct only to use it as a type for
> G_DEFINE_AUTOPTR_CLEANUP_FUNC.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/graph-lock.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
> index 2211d41286..8d8a6513f1 100644
> --- a/include/block/graph-lock.h
> +++ b/include/block/graph-lock.h
> @@ -67,5 +67,35 @@ void assert_bdrv_graph_readable(void);
>   */
>  void assert_bdrv_graph_writable(void);
> =20
> +typedef struct GraphLockable { } GraphLockable;
> +
> +#define GML_OBJ_() (&(GraphLockable) { })

The comment for QML_OBJ_() is helpful. This takes advantage of the
lifetime of compound literals and it's different in C and C++. I suggest
keeping it for the benefit for people trying to understand how this
works.

--2T/wfK59KOGrVwf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqrB0ACgkQnKSrs4Gr
c8jK4Af+KjwR2CRC5rlrCGokykborLGAt/VpAWJfTnFtS6nrOM2JrWCt1PY0Fexu
UPLLD7jqm4DwbzrOYKgC9Y33Sw8atU6dSgLOKWWP78Wle0vz+frDmTzrpIuS2X3s
i1cB6qneWGX8jTWXbihRqDNVHqgapAOlaviascNYYoyrhYXO9VNvpeVjvsPQAyUs
ry6HJwRCUib2mUqMdcpbeNnQh53oxnOMZBd+lzFKDXI8QukT3o4tP1X/MU8nwG3+
DvPSEP6LFpcEuICkFyUuLif+lzH29WNaQMLwjwusvtyF6OJPDk5cc/5HcMfwz5XT
/vA7+UdNkjtLfKeN4wQHaWdJ6123xQ==
=QAj6
-----END PGP SIGNATURE-----

--2T/wfK59KOGrVwf1--


