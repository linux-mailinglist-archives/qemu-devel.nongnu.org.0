Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69D4091FE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:05:57 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmaq-00068A-Dt
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPljB-0003Fh-Gu
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPljA-000559-0p
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631538627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FONpaO5uVOxoiL9s/9CYVQbyvUBEj3uvP2wgs9zBszc=;
 b=XNPFORxCSseP4MxGQLngpEWMaEw1tTld3zgFPry7Ldo6W+SCKO1rfKa9zbasxA3k3Kaolg
 RPYVsAAeS7ZXy+Jd8ROT62K09aEVNq3o8sDe3j+TvHzNHzvobTVfNGcpqkVcqPQ9zg4s0V
 FNx5gYcmnfcObpMeIKz6RjVNIMe57ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-bMnbOibxNZqmibls9mM51Q-1; Mon, 13 Sep 2021 09:10:24 -0400
X-MC-Unique: bMnbOibxNZqmibls9mM51Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D891966320;
 Mon, 13 Sep 2021 13:10:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6768960C13;
 Mon, 13 Sep 2021 13:10:17 +0000 (UTC)
Date: Mon, 13 Sep 2021 14:10:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/4] block layer: split block APIs in graph and I/O
Message-ID: <YT9NuK84J2hvMXs2@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908131021.774533-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="it3eX4gh/UkPpZr7"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--it3eX4gh/UkPpZr7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 09:10:17AM -0400, Emanuele Giuseppe Esposito wrote:
> Currently, block layer APIs like block-backend.h contain a mix of
> functions that are either running in the main loop and under the
> BQL, or are thread-safe functions and run in iothreads performing I/O.
> The functions running under BQL also take care of modifying the
> block graph, by using drain and/or aio_context_acquire/release.
> This makes it very confusing to understand where each function
> runs, and what assumptions it provided with regards to thread
> safety.
>=20
> We call the functions running under BQL "graph API", and=20
> distinguish them from the thread-safe "I/O API".

Maybe "BQL" is clearer than "graph" because not all functions classified
as "graph" need to traverse/modify the graph.

Stefan

--it3eX4gh/UkPpZr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/TbgACgkQnKSrs4Gr
c8hgYwf+KtpmBh0BvDh+uJAZpbBl4KZz+3oQbBA84PaNMwW6T+T0DYJLol/2pOXv
5T0QcJf5Tz8F7MJGkx/hVhJlaGfYo5ypBeop7SbQ2kYSOljb6h+CQlYJGS1jthbX
FvEscAJ3Lpkgj166zXfnHHMSEkV9X0Ob/bzQpr7az7XX8qB3ohJOLiN6DrVls/VO
nIKhvF0q3fPsvEgPpyjX7+g2zOKlWoOX+R9VqGA1f0Es1zesTs9+MA94Yfb56k47
+H6YvNiwGEPed+eeM5qKFL2XG4Y4OBeE0kP//wP3TRsvSqI/ZTGpaTDEjez8WdBh
Twt0gxrSraKk+YZ9CnO5+JiKJUj4Yw==
=qIv4
-----END PGP SIGNATURE-----

--it3eX4gh/UkPpZr7--


