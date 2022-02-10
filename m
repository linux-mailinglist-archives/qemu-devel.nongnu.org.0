Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAEE4B14A9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:55:53 +0100 (CET)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDfc-00025q-Gs
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAV6-0007Dw-C7
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:32:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAV3-0005wD-Hh
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644503564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IGXKpPwuCO7kHiqvr230R/oQTLZJGbFC2VhflUYs4j0=;
 b=fizLK8HG3OcPVBHwo1JnBUST38L5/6L8dhC4+8vLSvJPRG2U0Fi3VOz5t3rLnpTuttFTxg
 DqrbEK0nYFUeOZ+j1NdmvAaWXbVffscf5ZEQ3kOd1Qo1rri8Kir27lqsk8yZ3kFxyU15dV
 KccAVzZKy70Kxf5OfBUqXegKlvrMxJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-Rdm6V1uoNjeVDElDcGeXrA-1; Thu, 10 Feb 2022 09:32:39 -0500
X-MC-Unique: Rdm6V1uoNjeVDElDcGeXrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85B3C83DEA8;
 Thu, 10 Feb 2022 14:32:38 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAAD084A0B;
 Thu, 10 Feb 2022 14:32:33 +0000 (UTC)
Date: Thu, 10 Feb 2022 14:32:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 4/6] test-bdrv-drain.c: adapt test to the coming subtree
 drains
Message-ID: <YgUiANhIRFEos9L8@stefanha-x1.localdomain>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PGWMcpZLttr2063l"
Content-Disposition: inline
In-Reply-To: <20220208153655.1251658-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PGWMcpZLttr2063l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:36:53AM -0500, Emanuele Giuseppe Esposito wrote:
> There will be 2 problems in this test when we will add
> subtree drains in bdrv_replace_child_noperm:
>=20
> - First, the test is inconsistent about taking the AioContext lock when
>   calling bdrv_replace_child_noperm.  bdrv_replace_child_noperm is reached
>   in two places: from blk_insert_bs directly, and via block_job_create.
>   Only the second does it with the AioContext lock taken, and there seems
>   to be no reason why the lock is needed.
>   Move aio_context_acquire further down, to just protect block_job_add_bd=
rv()
>=20
> - Second, test_detach_indirect is only interested in observing the first
>   call to .drained_begin. In the original test, there was only a single
>   subtree drain; however, with additional drains introduced in
>   bdrv_replace_child_noperm(), the test callback would be called too early
>   and/or multiple times.
>   Override the callback only when we actually want to use it, and put back
>   the original after it's been invoked.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  tests/unit/test-bdrv-drain.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index 4924ceb562..c52ba2db4e 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -912,12 +912,12 @@ static void test_blockjob_common_drain_node(enum dr=
ain_type drain_type,
>      blk_insert_bs(blk_target, target, &error_abort);
>      blk_set_allow_aio_context_change(blk_target, true);
> =20
> -    aio_context_acquire(ctx);
>      tjob =3D block_job_create("job0", &test_job_driver, NULL, src,
>                              0, BLK_PERM_ALL,
>                              0, 0, NULL, NULL, &error_abort);
>      tjob->bs =3D src;
>      job =3D &tjob->common;
> +    aio_context_acquire(ctx);

block_job_create() uses src's AioContext. In the IOThread case the
AioContext is not qemu_aio_context. My expectation is that src's
AioContext must be acquired before block_job_create() starts using src.

blockdev.c QMP commands acquire the BDS's AioContext before calling the
function that creates the job. It seems strange to do it differently in
this test case.

You mentioned that blk_insert_bs() is called without acquiring an
AioContext. That may be because we know blk_target is in
qemu_aio_context and we assume our thread holds it (even if we don't
explicitly hold it). If you want to fix an inconsistency then maybe fix
that instead of removing the acquire around block_job_create()?

Stefan

--PGWMcpZLttr2063l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFIgAACgkQnKSrs4Gr
c8ihOwf/VhEM8dBB5T1tDfVSji4mdTJvSkZ9ak+l8vc1IGFeEGBymyxElJFS6Css
gPzqjjil2RmIBSciYtYBnrVESwB68e0/JgPr6pHYMsEPwjcUtq6Gz87uEDgKOPNZ
YV3DnQl5k24m1CgkDtHxNNxYsTEdFupNo3IOuDYsDIVg2eEJUDePq4E7zYXJ3Xsd
M//nwJV4Li2y4OFKy9mYaB+4foECTgE3E2QkW2Pc4OYMMSqCtbReZFLb2Pg8CxYg
JIIInqgZ6V1kVdkzpogsrn7+5baKoLygrvQ/9cZmBjo0C98YLNdL64efIbvUcnR0
nIeJ+v7w+TDBu/M7vuegUuZ6k4eNAg==
=N+wb
-----END PGP SIGNATURE-----

--PGWMcpZLttr2063l--


