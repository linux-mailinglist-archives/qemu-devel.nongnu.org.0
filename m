Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3AA49C847
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 12:07:25 +0100 (CET)
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCg95-0007A6-UQ
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 06:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCg6S-0005kA-AC
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:04:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCg6Q-0006Q0-MR
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643195078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JoSmKCXJ/h7DTlkch9DUOY21sX1Zs0a7hL3ep/sSzGI=;
 b=FpQ/k/zYD8EX+TL300LU0m/ISBXUUACMGZLyBvxpkQf/2PzmQRatIr3HvKEqZlxivvTtM9
 4lC5K0FEZ+TaRBPHFWHPg2Pn+BlZ5dG50ZnhrMriUh6DgNcaWS2zQMWNays+VGkaI7bYwq
 KHHH0sxbdgNg9FXNVhwJKBvd4ecY7ZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-Pd9Hy2XLMa-9mPOClclsQA-1; Wed, 26 Jan 2022 06:04:34 -0500
X-MC-Unique: Pd9Hy2XLMa-9mPOClclsQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60CFB801B0C;
 Wed, 26 Jan 2022 11:04:33 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85A061F305;
 Wed, 26 Jan 2022 11:04:32 +0000 (UTC)
Date: Wed, 26 Jan 2022 11:04:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 07/12] block/io.c: introduce
 bdrv_subtree_drained_{begin/end}_unlocked
Message-ID: <YfEqvxSWbK9Ukg/I@stefanha-x1.localdomain>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zYyORJOlX95Ti/AE"
Content-Disposition: inline
In-Reply-To: <20220118162738.1366281-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--zYyORJOlX95Ti/AE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2022 at 11:27:33AM -0500, Emanuele Giuseppe Esposito wrote:
> diff --git a/block/io.c b/block/io.c
> index 5123b7b713..9d5167f64a 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -244,6 +244,7 @@ typedef struct {
>      bool begin;
>      bool recursive;
>      bool poll;
> +    bool unlock;
>      BdrvChild *parent;
>      bool ignore_bds_parents;
>      int *drained_end_counter;
...
> @@ -473,23 +477,35 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
>       */
>      if (poll) {
>          assert(!ignore_bds_parents);
> -        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, recursive, parent));
> +        if (unlock) {

"Unlock" is a verb that suggests we'll perform an unlock operation.
Please call it "unlocked" instead.

> +            BDRV_POLL_WHILE_UNLOCKED(bs,
> +                                     bdrv_drain_poll_top_level(bs, recursive,
> +                                                               parent));
> +        } else {
> +            BDRV_POLL_WHILE(bs,
> +                            bdrv_drain_poll_top_level(bs, recursive, parent));
> +        }
>      }
>  }

--zYyORJOlX95Ti/AE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxKr8ACgkQnKSrs4Gr
c8gRlQgAntUeu3ln4TnnxXiibJedcXFn1bHPtrWwtP65ddZalnPnZY0YjqPDvslq
vN/xeZ7x76lK9QUTjbutlE4dbFR++V9wxCjA3oOepggTFUo8goHhQZlagKP+DHt2
5O7Z9COVCw0ZzQvD4jZqto1qvePx7q4CVhvpP5MX0eJs0XWT/R2DHN4uk3Sql4bZ
4q0H718Z5x07KGFntEJHdQzw91gxVYO8HoSqBs5sNXuVUuobo5LskVBl59RnCQ/E
jMhmCuj7eDRXb9jl9zq2a5kQ9J3xR9NeQi8/KpJbz8MmM3X9CMj1r136qQWboVZY
S3zF54xG913YkZBaYh9WZ47H7i/QDA==
=bsot
-----END PGP SIGNATURE-----

--zYyORJOlX95Ti/AE--


