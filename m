Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568084EAFF1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:08:52 +0200 (CEST)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDSl-0004HT-EM
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:08:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZDOG-0005Dk-2b
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZDOD-00041S-Af
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648566248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=roSG3ppPlmilQbgD6Mh2Cx1xoZd6KtaACPrA8M0x/mA=;
 b=aY8+Mg6Fwzorn46g2nGKnmFlPlWkCVr4KdBt/Soz2wyF9Nrr1oUKeqh5uipg6hAt9ntHmX
 aD/RqmTOWfFMcFcouDWzwhIt38oqSJ8JSNzegvKjNY8CkJQFg60r3rpHCRYKN6cPjJ5pBZ
 v49dKufLutnruhAiRAFis9ZbcyKQMT4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-Q_nq8WI_P56A37E8dRyCKg-1; Tue, 29 Mar 2022 11:03:07 -0400
X-MC-Unique: Q_nq8WI_P56A37E8dRyCKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A409180138D;
 Tue, 29 Mar 2022 15:03:07 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF1E81400C2B;
 Tue, 29 Mar 2022 15:03:06 +0000 (UTC)
Date: Tue, 29 Mar 2022 16:03:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH for-7.0] main-loop: Disable GLOBAL_STATE_CODE() assertions
Message-ID: <YkMfqceHNgw3zN6G@stefanha-x1.localdomain>
References: <20220329093545.52114-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d0GnKb4YaIu978o8"
Content-Disposition: inline
In-Reply-To: <20220329093545.52114-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--d0GnKb4YaIu978o8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 11:35:45AM +0200, Hanna Reitz wrote:
> These assertions are very useful for developers to find bugs, and so
> they have indeed pointed us towards bugs already.  For users, it is not
> so useful to find these bugs.  We should probably not enable them in
> releases until we are sufficiently certain that they will not fire
> during normal operation, unless something is going seriously wrong.
>=20
> For example, we have received a bug report that you cannot add an NBD
> server on a BDS in an I/O thread with `-incoming defer`.  I am sure this
> is a real bug that needs investigation, but we do not really have that
> time right now, so close to release, and so I would rather disable the
> assertions to get time to investigate such reports.
>=20
> (I am just putting the link as "buglink" below, not "closes", because
> disabling the assertion will not fix the likely underlying bug.)
>=20
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/945
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  include/qemu/main-loop.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Sounds reasonable to me.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--d0GnKb4YaIu978o8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJDH6kACgkQnKSrs4Gr
c8jPAQf9E0vNXpyzSgCwuRYOF+bgo3phfoRXZO8FfqezxU4fxMzmdGCSSLCkpQb5
yxfGp8TVYQUXoDYTogdsCPtj0rgdnDqPHlShegUwJ2csNc1UfBdaCNXGT5GbovRB
iRNXvD0Am34Y67KUprtpPCABrlgOTeLUJ/UclQnGccu0kFm5Prc2ZUymQjueNEi2
sGpjIHBOKFe0vQiH4g4YwuYzTREUXad2HBplWmDdrnAKy9alZrZLucub1viwRDeq
Ch/7zOUJbQYiOk0JxMzxYzP7nTKICJeDFHE4BT/Zx4N6s4plTqvwv5pAnGz+ZtfS
rQzZpO1ziP3XlpGWLu8174jDgQtMwg==
=Xl2+
-----END PGP SIGNATURE-----

--d0GnKb4YaIu978o8--


