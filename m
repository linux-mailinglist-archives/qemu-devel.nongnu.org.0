Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1B2B79B2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:58:11 +0100 (CET)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJI2-00044K-Np
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfJ8T-0007pS-Ok
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:48:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfJ8Q-0007BC-Ug
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DmN6YIrurAzonAj+eLaYo9PRQpBRcioo0sR7nFUHmWg=;
 b=MACEydsp0IWpdGm4Z8M6nhnWgF7Zc5AF44RQlCLjr/QJjbxGMKALTEI5HrxeC8LJzRoZNw
 6yU3P1dS+zst9GlONsTSbLHISipaPHFMLH2g5r5D1id+Jvz073V0y1FD8KtUBT2DRxy7Yo
 jWZWPtVAUgrn8EdgwSGU/WgGVM4K1Hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-BOwTFkUMPY-s9yHEeOkg_g-1; Wed, 18 Nov 2020 03:48:09 -0500
X-MC-Unique: BOwTFkUMPY-s9yHEeOkg_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CA1189942E;
 Wed, 18 Nov 2020 08:48:08 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 135985D9CD;
 Wed, 18 Nov 2020 08:48:04 +0000 (UTC)
Date: Wed, 18 Nov 2020 08:48:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v3] virtiofsd: Use --thread-pool-size=0 to mean no thread
 pool
Message-ID: <20201118084803.GA182763@stefanha-x1.localdomain>
References: <20201117194131.GA96587@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117194131.GA96587@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, jose.carlos.venegas.munoz@intel.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 02:41:31PM -0500, Vivek Goyal wrote:
> This is V3 of the patch. A minor change since V2 is to reverse the list
> before executing requests. We are prepending elements to the list and tha=
t
> means when we start processing requests, we are processing these in
> the reverse order. Though we don't guarantee any ordering but it does
> not hurt to process requests in same order as received as much as
> possible.
>=20
> Right now we create a thread pool and main thread hands over the request
> to thread in thread pool to process. Number of threads in thread pool
> can be managed by option --thread-pool-size.
>=20
> In tests we have noted that many of the workloads are getting better
> performance if we don't use a thread pool at all and process all
> the requests in the context of a thread receiving the request.
>=20
> Hence give user an option to be able to run virtiofsd without using
> a thread pool.
>=20
> To implement this, I have used existing option --thread-pool-size. This
> option defines how many maximum threads can be in the thread pool.
> Thread pool size zero freezes thead pool. I can't see why will one
> start virtiofsd with a frozen thread pool (hence frozen file system).
> So I am redefining --thread-pool-size=3D0 to mean, don't use a thread poo=
l.
> Instead process the request in the context of thread receiving request
> from the queue.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 37 ++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+038MACgkQnKSrs4Gr
c8hXUAgAkj0Nt9AV1TD3uyF86ErMcdzhVgmisE8gOBeOO+/AxWgulIZKasUQ+wvT
Vvn1uLcwO7wFGI+Np0UafiweWjnc257DrBOCs5IYM3m2X+ddJGxXCIKNed3Z7JJr
JTPQc8l0hLwiIgGtDOsj0OKPlw8ywRkU7IU3U4nQ4voWYR5I03OJcVGpnmMGlmfy
ogd/JD1qjY/umChUChpNvD5AdXUcpe4JA87Bmk2/atVeXYwHoQvplICIAf3egNPP
6LHKoCBKx66YepRrpgDVD2zWJf7B94ogF0w5lQGcELfguKk9ZIC9DmRRlFkVDSuX
+0BUILQJWdFIUcarTU64vqoSv/8RjQ==
=3F15
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--


