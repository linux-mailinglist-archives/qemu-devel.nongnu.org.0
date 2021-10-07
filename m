Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B24255ED
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:00:07 +0200 (CEST)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUsP-0007xb-1S
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUnN-0004rX-Ml
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:54:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUnH-0001Uw-P3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0lDFqdC8nRkb2ZedcCTv2KPNzGMm63QCgirlW8yT4bc=;
 b=YJTENVo9g0ZVgW0okh8tdNpfP11RJNJmHiFqWdGDfnv+enh15M5vBDGtOuukgOfH2QQp4b
 ogx6w402QDVaP875pnL8KUm1Jv8sPOXBWauRVVboAe5NVh/h/QWZoLxeXOUvOqWd0y3RBP
 zFAWq19+DHTis3Ib7PL3CNyGKDK9RJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-YjiQDtbhNmqlLP6aqx2JJw-1; Thu, 07 Oct 2021 10:54:44 -0400
X-MC-Unique: YjiQDtbhNmqlLP6aqx2JJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15B188010ED;
 Thu,  7 Oct 2021 14:54:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD24360BF1;
 Thu,  7 Oct 2021 14:54:42 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:54:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 24/25] job.h: split function pointers in JobDriver
Message-ID: <YV8KMVycKfU/Zr6r@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-25-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-25-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ArupyZsx+FoU1w2"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4ArupyZsx+FoU1w2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:14AM -0400, Emanuele Giuseppe Esposito wrote:
> The job API will be handled separately in another serie.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 41162ed494..c236c43026 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -169,12 +169,21 @@ typedef struct Job {
>   * Callbacks and other information about a Job driver.
>   */
>  struct JobDriver {
> +
> +    /* Fields initialized in struct definition and never changed. */
> +
>      /** Derived Job struct size */
>      size_t instance_size;
> =20
>      /** Enum describing the operation */
>      JobType job_type;
> =20
> +    /*
> +     * I/O API functions. These functions are thread-safe, and therefore
> +     * can run in any thread as long as they have called
> +     * aio_context_acquire/release().
> +     */

This comment described the block layer well but job.h is more generic. I
don't think these functions are necessarily thread-safe (they shouldn't
be invoked from multiple threads at the same time). It's just that they
are run without regard to the BQL and may run in an arbitrary thread.

Other than that:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--4ArupyZsx+FoU1w2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfCjEACgkQnKSrs4Gr
c8i15wgAo/VkI3skTQH0W+T2wfd9j37bGgfnh7C6Xbsd4uE+QhLO25il7nFU+CjQ
91ySqpP9dcGitTmDNwHpG4hHmlhmqFGPu8HF+bUaDv1JX+l6XyQ7DCbb8/5Z6cJP
vW0IaxUPK3Iv0CjGaD8CzX2USQnm818EhQRhoQobNOPgYP/Dqp0aT9AQZLLB/i8K
eKIf/PuK9EyS82xqvqPnm2jP8MJgJJHfiQ9d/+WrPy+sCa8LUiz8UkW2I5AmpMb3
j+Wsx+8jD9fr35qMRGktcZ26F/vdPb6Dxa1g545bXUbXyID3lX+RqQ0LWcsnnN6+
lKykeXgJnbsfjlaaTWciBqnyrQyM9A==
=wbk8
-----END PGP SIGNATURE-----

--4ArupyZsx+FoU1w2--


