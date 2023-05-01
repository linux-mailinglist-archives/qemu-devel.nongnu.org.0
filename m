Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45986F31AC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 15:58:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU1T-0001xG-3M; Mon, 01 May 2023 09:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptU1Q-0001x2-PT
 for qemu-devel@nongnu.org; Mon, 01 May 2023 09:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptU1O-0005Fu-VT
 for qemu-devel@nongnu.org; Mon, 01 May 2023 09:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682949413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k9FPVZXBvvEJzxnZWzquk7gcBi6vOAgI9WxnutBJf5w=;
 b=AcvhZrw35YyAH363Hfu/Y3RLM5va0+AET2hF3ICYhXU5BkT77Ra7vKmaemoub2k5XpgCwZ
 IXRCkphGhK6g646fwsi6t7r6zqxuQxdmHMjCVCMzFJiqUa4eItw13mS0abmle68Z2n+yM1
 2HcUP/Sm+77OQR1DEcUk8ex3rlSo7wU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-oQ_J-_dpOAyTAdM4pBnlng-1; Mon, 01 May 2023 09:56:49 -0400
X-MC-Unique: oQ_J-_dpOAyTAdM4pBnlng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 443AC2A59553
 for <qemu-devel@nongnu.org>; Mon,  1 May 2023 13:56:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6C05C15BA0;
 Mon,  1 May 2023 13:56:48 +0000 (UTC)
Date: Mon, 1 May 2023 09:56:46 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] test-aio-multithread: do not use mb_read/mb_set for
 simple flags
Message-ID: <20230501135646.GA14519@fedora>
References: <20230428111248.145037-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n9FLtD1TRjjA49YX"
Content-Disposition: inline
In-Reply-To: <20230428111248.145037-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--n9FLtD1TRjjA49YX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 01:12:48PM +0200, Paolo Bonzini wrote:
> The remaining use of mb_read/mb_set is just to force a thread to exit
> eventually.  It does not order two memory accesses and therefore can be
> just read/set.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/unit/test-aio-multithread.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--n9FLtD1TRjjA49YX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRPxR4ACgkQnKSrs4Gr
c8gWRAf6AupycVBhP0kSPgW1miWa620cVjzbpW5MKXMDsnq3u7ShrLxBrYvFeBST
8Pw0Kn/kD2fRB+lbuz/dfugY/2+Cyv8xPVmPdnkWU8F3Bey/zZCUsERNUjcegJhN
BxRQfn9bbaatp5vLTAcFgeQVJr/488YYr19RHGHZRpfIUKTy/fMu03MH2IHPMt2R
cBwMnlurmLxbuoNIy36RlsaGtuWfrdqxxX9iTQ8/z79He4+T1HCCnxWehY0jz0sJ
mR6D+rxKaZ7wyS0jwJTbhezfNCPVovfOZqXOyKu47yRkdCAQRyyId/osrYv1yOhI
7GfISQm74keM9YnS7WpWUO6GEiwUHw==
=Qivz
-----END PGP SIGNATURE-----

--n9FLtD1TRjjA49YX--


