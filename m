Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08E49C878
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 12:18:56 +0100 (CET)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCgKE-0004Co-P1
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 06:18:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCgHk-0002Ye-0Z
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCgHh-0008Vc-6e
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643195776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MheVtbodv4JnjFpcoZ94e2zJqt/UtM4s2+SFd/u+bd4=;
 b=dKWJUkvpeknWLhXyBYMkhly0HUeKJV5XHuSQGVFF0OTntT46uN/Gc22gNhmjb+N/BYzAUW
 VIMY0QgQAkzmsonYkZInqEuladd9hOztzS/AR8zZBVkY53YyBZK3U4RsG2apeF4t/XQ5xH
 jIC9x9TbaTB+S+HHJ7MIRpcpZcvJuc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-mKR7jBQBO7GFTHSMlzlQbg-1; Wed, 26 Jan 2022 06:16:12 -0500
X-MC-Unique: mKR7jBQBO7GFTHSMlzlQbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E05A814249;
 Wed, 26 Jan 2022 11:16:11 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4CA81059A74;
 Wed, 26 Jan 2022 11:16:04 +0000 (UTC)
Date: Wed, 26 Jan 2022 11:16:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 08/12] reopen: add a transaction to drain_end nodes
 picked in bdrv_reopen_parse_file_or_backing
Message-ID: <YfEtc+So6Rc95ssJ@stefanha-x1.localdomain>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-9-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ilvp0HGBT9opExk8"
Content-Disposition: inline
In-Reply-To: <20220118162738.1366281-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--ilvp0HGBT9opExk8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 11:27:34AM -0500, Emanuele Giuseppe Esposito wrote:
> Depending on the options given to reopen_state,
> bdrv_reopen_parse_file_or_backing could pick another bs
> that could be from another graph, and thus not protected
> by subtree_drained_begin called by the callers of this
> function.
>=20
> We can't simply drain-undrain here, because of transactions.
> To simplify the logic, transactions always assume that they
> are run under drain, so the various subtree_drain introduced
> so far always take care of covering tran_commit().
>=20
> And since we cannot directly do it, as the transaction is
> created/committed higher above, we can just add a new
> transaction to the list that just executes subtree_drained_end
> to match the drained_begin done in this function.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/block.c b/block.c
> index fb5bc3077a..fcc44a49a0 100644
> --- a/block.c
> +++ b/block.c
> @@ -4522,6 +4522,10 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs=
, bool read_only,
>      return bdrv_reopen(bs, opts, true, errp);
>  }
> =20
> +TransactionActionDrv bdrv_drv_subtree_end =3D {
> +    .clean =3D (void (*)(void *)) bdrv_subtree_drained_end_unlocked,

Please don't cast function pointers. If the types don't match please
define a wrapper function so the compiler can check the types.

--ilvp0HGBT9opExk8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxLXMACgkQnKSrs4Gr
c8i3YwgAo9uASWD4lacGzZd43enNW29ykLTW6tG2a0TQTx0M8EjBMpHBYrJZ8eDx
3bPHeEXstY53bBg5otGz5Qm2BXG8LKskGwa6UK5hCg4QjKJ2jF+ca2oq4FO+RZLz
E8ZMKnzbnGvpZuBrk47MJZUX0V8gw886+WfnTbRAjZzOxps9OPBJb/bbO11YhvN+
cB5j8WvtuF+PdIThf45BdTCGmUNvI4DTcp9FuNoy352DTVUXKxa48L+zzh3Cj7Xq
ewE9W6KXBo7h3JVr0Lih74L7TB80FuR6w2RHVObr8hNf4F7SZaZi+zodtRhsnoVW
bVy3fLvp3X9JVVxWkHePbrSUEzcmpA==
=gNHb
-----END PGP SIGNATURE-----

--ilvp0HGBT9opExk8--


