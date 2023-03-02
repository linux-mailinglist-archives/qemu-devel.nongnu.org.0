Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DD76A8345
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:09:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXifW-0003jP-Bm; Thu, 02 Mar 2023 08:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXifS-0003io-Ky
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXifQ-0004de-Vo
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677762496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jF5VTrs2vK1eJMxz5uin/DQUR7qzdkUAmBHxWE4SI3g=;
 b=BlvcNsjh+OjQYfvx2Hm2JXYjlNmrIoPlUFaUbbam7r+RVvcub2905H1qz8gHCbFX6T/WpK
 CE1QYnnWJeGx2tE5eFvnwCsUHJrMnSzk6076FLU2vhoHuQZj9Y9Rifns1DIAkAxdXYcM7k
 N9ojYm51M8tUwsefixsV2Lw52pq6Lto=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-VCUkUZ7GPwWWwF7KLe-6ZQ-1; Thu, 02 Mar 2023 08:08:12 -0500
X-MC-Unique: VCUkUZ7GPwWWwF7KLe-6ZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E29185C70B;
 Thu,  2 Mar 2023 13:08:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F08744097544;
 Thu,  2 Mar 2023 13:08:11 +0000 (UTC)
Date: Thu, 2 Mar 2023 08:08:10 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/6] block: convert blk_exp_close_all_type() to
 AIO_WAIT_WHILE_UNLOCKED()
Message-ID: <20230302130810.GA2485531@fedora>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-3-stefanha@redhat.com>
 <7c440fc8-d37b-b933-ed5f-02baf7136bca@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LKiZsdlBJf9lyr7m"
Content-Disposition: inline
In-Reply-To: <7c440fc8-d37b-b933-ed5f-02baf7136bca@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--LKiZsdlBJf9lyr7m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2023 at 11:36:03AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 1/3/23 21:57, Stefan Hajnoczi wrote:
> > There is no change in behavior. Switch to AIO_WAIT_WHILE_UNLOCKED()
> > instead of AIO_WAIT_WHILE() to document that this code has already been
> > audited and converted. The AioContext argument is already NULL so
> > aio_context_release() is never called anyway.
>=20
> Shouldn't we assert(ctx && unlock) in AIO_WAIT_WHILE_INTERNAL() then?

Can you show where you'd add that assertion? It's not clear to me what
the purpose is.

Stefan

--LKiZsdlBJf9lyr7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQAn7oACgkQnKSrs4Gr
c8iFvAgAyoc+z5roR9yttlAnbMrb50bSQYY0leZDpLvs3XfQsKr03OW8GyARN6ct
gev0T16BG8OhbeD0U3o9tqxB70jc4ovcExWnHfCo++hvawIowdf9RgZirton4u1B
MUElDtzj0t4HU8Wsh/OYF/qWKarxBo2b50XwuE7PkOF4DQgLS8QBvQi5ECOeCRr+
2d3Y3T94bwt80k7aRdA1dKspribnCFVP8yny1fRxuOOiHwE66mi3iQDI/QN0w4U+
tr7pi0H6pzhSOY8XMWQ6vchXCe1odWymu9P6puB5Dr+wwj2xcNN0nKfOsQp/SwTl
kQUlG9XVV2/4HYREsYS0/4NTBrGXNQ==
=BLPK
-----END PGP SIGNATURE-----

--LKiZsdlBJf9lyr7m--


