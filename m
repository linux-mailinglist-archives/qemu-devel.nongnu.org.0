Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DDF3EED25
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:16:12 +0200 (CEST)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFywt-0007Ur-2O
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mFyvc-0006eJ-RW
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mFyvY-0006ji-W1
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629206086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uWGyd4wY/VQDoK302mWEJ0Dr/3oOkFMvjnpJVVUnUR4=;
 b=av3HPkab5vT/3B5Du7U4QtF8g2eihrRbnPcSRKOAXE1Z9SC6+E+d2QlNvagscm5g33xoAV
 ql/mwS61iXh1wEMor+kQ6QRSR0KtEcHVTkM9sZ/50rJ/8dfiRWgWGslvY4kkYpQEwtoe7a
 MkqM8bG1R0mc5Vay1Y9Xd+dqj9RqEC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-h0bBeoiUPbKFYtygdl6TmQ-1; Tue, 17 Aug 2021 09:14:45 -0400
X-MC-Unique: h0bBeoiUPbKFYtygdl6TmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4518F1B2C981;
 Tue, 17 Aug 2021 13:14:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCFA618B42;
 Tue, 17 Aug 2021 13:14:43 +0000 (UTC)
Date: Tue, 17 Aug 2021 14:14:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH] include/block.h: remove outdated comment in
 bdrv_drained_begin
Message-ID: <YRu2PYGNRPqMCZNQ@stefanha-x1.localdomain>
References: <20210816182325.24517-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816182325.24517-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="smgbIyuNsRYJJYtL"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--smgbIyuNsRYJJYtL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 08:23:25PM +0200, Emanuele Giuseppe Esposito wrote:
> There are a couple of errors in bdrv_drained_begin header comment:
> - block_job_pause does not exist anymore, it has been replaced
>   with job_pause in b15de82867
> - job_pause is automatically invoked as a .drained_begin callback
>   (child_job_drained_begin) by the child_job BdrvChildClass struct
>   in blockjob.c. So no additional pause should be required.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/block.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/include/block/block.h b/include/block/block.h
> index 3477290f9a..1b0d05b545 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -749,9 +749,7 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recur=
sive,
>   * bdrv_drained_begin:
>   *
>   * Begin a quiesced section for exclusive access to the BDS, by disablin=
g
> - * external request sources including NBD server and device model. Note =
that
> - * this doesn't block timers or coroutines from submitting more requests=
, which
> - * means block_job_pause is still necessary.
> + * external request sources including NBD server and device model.

Block jobs are worth mentioning:
"NBD server, block jobs, and device model"?

--smgbIyuNsRYJJYtL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEbtj0ACgkQnKSrs4Gr
c8ifzAf/XvoBIwGsrI2pCsD5JGZnjq08SY51Kw0BULGmG6vh2/B68ujX7VDfmV+P
6pLGHDpCV/PcckNienJsWJWb3vi1cUoODo/Rp03mHkMywHyLpoVNQaw6LQEeccNk
vmA9E4QAXGrTjkrLRuXrijF09IhJWNif3ArNgdM7GPV4dRNXt3FOpXvw6hLtPBfH
lo2ytGJA+qi6s1E9A7nXPTgL+snKQ/PmOJZCdeEtRyAOkRgdyVi8+zMao/FzlOfb
sG9YBUcn/fhu38cuBRs4hcWqrrpkitFgLLJPIRCG9piBE/8fSjDcyXi93YaOqZxl
CEmECn/1Vi529WhfLt6vd243IK8Glg==
=39ne
-----END PGP SIGNATURE-----

--smgbIyuNsRYJJYtL--


