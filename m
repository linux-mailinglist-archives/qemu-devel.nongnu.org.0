Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730DD4CAA14
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:24:44 +0100 (CET)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRmN-0001j6-64
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRk8-0007bF-Mb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRk7-0007Bm-6s
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646238142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SABTOPPyz9M88xM/O8nFtN1Acwuil/ZhGosJjKv53Wk=;
 b=QP/nO0+yw7W1pe3hAKUsfkX9OYWY2oKiRQDKM17bEMpoxT8UA3xRB/1x7aWDDTywWKPxDo
 hpyBduUKBtK/M32T2Nf06vgfGL8YqnkbS7AI+DTfUfhACeOhtZGJDEPg9oILEXqDk1Vi4S
 ZLJjgs5BkkZ06NDSmsmi0NkmxDZu040=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-keB7jcDSOJGZxBMOzD2vQg-1; Wed, 02 Mar 2022 11:22:21 -0500
X-MC-Unique: keB7jcDSOJGZxBMOzD2vQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3662E80EDB4;
 Wed,  2 Mar 2022 16:22:18 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8A3C7DE58;
 Wed,  2 Mar 2022 16:22:08 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:22:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 2/5] introduce BDRV_POLL_WHILE_UNLOCKED
Message-ID: <Yh+Zr2GWRv0SSiIa@stefanha-x1.localdomain>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <20220301142113.163174-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9WaMB5VXZVzOxh7R"
Content-Disposition: inline
In-Reply-To: <20220301142113.163174-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9WaMB5VXZVzOxh7R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 09:21:10AM -0500, Emanuele Giuseppe Esposito wrote:
> Same as BDRV_POLL_WHILE, but uses AIO_WAIT_WHILE_UNLOCKED.
> See doc comment for more info.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/block.h | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9WaMB5VXZVzOxh7R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIfma8ACgkQnKSrs4Gr
c8hU2wf+M9iC9IJ/NJL7XmNX+cjTwT3LF24SZkrALr8muO1Pw4txwd1QAOEHZE/a
Jg9vcIw5Vngk9k1I0xpjd9tU1OYt9Uax1kGbTKERNCF+dYDnmw5ocjsjwNqn16zy
YdRNIp04IgDVol0LVXSvUqKCYqaf1bDaaicuU2H3WLWk3yjN57GoeHIYEiTSDrAj
X8fkWEvV5ZvZI4p0NNAzQzVaCcNoQoB7Er7ZolBeQe7oThCUbN9ZTfVaYtu/FXGc
Rd9z6cMnLJ7eKY7hUq3i4WlFdTMiRH0kbgHbEXIUhGUgALLnWCMEvJVZPpH5i2fq
i54UV9s1O75fb9yqdJJM4PZ/hfjkgg==
=Skm0
-----END PGP SIGNATURE-----

--9WaMB5VXZVzOxh7R--


