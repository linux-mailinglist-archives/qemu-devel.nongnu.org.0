Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F1442B6B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:12:12 +0100 (CET)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqm4-000320-1l
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhqkl-0002C8-OT
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhqkj-0003L9-TI
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635847849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TY/ZfrKBx++5xWE/cwkgxP17yMI5HvGEDuvnKmRgqLU=;
 b=OlkzDFjKFFRRZR+iwOFE+tzRhdAYVdahDleZfraqmE8f/sJqxqqyrHIPm0vBmOiOLzEvyJ
 Vj424gu4BwaLlTYw2NjVUTrzE79qUQ1OI7DXLvLyl753Kwront4obXIKBMRIbGqoAiWczH
 GQ3MIWpsy+9qo2pstOR3bjLvgf1p2yY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-X-BtkXHAPWKgoX6dC9ezmg-1; Tue, 02 Nov 2021 06:10:46 -0400
X-MC-Unique: X-BtkXHAPWKgoX6dC9ezmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 145749126B;
 Tue,  2 Nov 2021 10:10:45 +0000 (UTC)
Received: from localhost (unknown [10.39.194.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5217D5F4EF;
 Tue,  2 Nov 2021 10:10:44 +0000 (UTC)
Date: Tue, 2 Nov 2021 10:10:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 02/15] job.c: make job_lock/unlock public
Message-ID: <YYEOoxejlSOnO5wg@stefanha-x1.localdomain>
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <20211029163914.4044794-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211029163914.4044794-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/5FZK+/SeYPoIsDe"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/5FZK+/SeYPoIsDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 12:39:01PM -0400, Emanuele Giuseppe Esposito wrote:
> job mutex will be used to protect the job struct elements and list,
> replacing AioContext locks.
>=20
> Right now use a shared lock for all jobs, in order to keep things
> simple. Once the AioContext lock is gone, we can introduce per-job
> locks.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job-common.h | 18 ++++++++++++++++++
>  job.c                     | 12 +++++-------
>  2 files changed, 23 insertions(+), 7 deletions(-)
>=20
> diff --git a/include/qemu/job-common.h b/include/qemu/job-common.h
> index c115028e33..dcc24fba48 100644
> --- a/include/qemu/job-common.h
> +++ b/include/qemu/job-common.h
> @@ -297,4 +297,22 @@ typedef enum JobCreateFlags {
>      JOB_MANUAL_DISMISS =3D 0x04,
>  } JobCreateFlags;
> =20
> +/**
> + * job_lock:
> + *
> + * Take the mutex protecting the list of jobs and their status.
> + * Most functions called by the monitor need to call job_lock
> + * and job_unlock manually.  On the other hand, function called

s/function/functions/

> diff --git a/job.c b/job.c
> index 94b142684f..e003f136f0 100644
> --- a/job.c
> +++ b/job.c
> @@ -32,6 +32,9 @@
>  #include "trace/trace-root.h"
>  #include "qapi/qapi-events-job.h"
> =20
> +/* job_mutex protects the jobs list, but also makes the job API thread-s=
afe. */

"but also makes the job API thread-safe" is vague. Are the jobs list and
the Job objects all protected by job_mutex? Stating that would be
clearer.

Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/5FZK+/SeYPoIsDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGBDqMACgkQnKSrs4Gr
c8jOtQgAu8JWXnghUnet1cVME4ZF5Rg99C4x6J6jTE+tpRgokSKNUmhDLiJfvgaL
jo1hlhoJzYOJU1Q7cO5jD46pqF5I+o0CgYA+C0vcDLTwI75h9YRLxPSZCjUIVrst
akw1PLPuQ0lbMuKCp/GtpmbInNBjzeXCm3UdLZwgCCIYo2WC0mZ4n3nVhfJkAqUO
7M4vRNYmxVhnqi5mJRCJCNp03WEezFerN0uoe/3/MBNUV6Yh07KX4oiwn8K+6sz2
0539rFQ7rG7ZbQsJ2RZ5rFZRB8zSWENAh9DmHRF2kWYfoHmv2piCTaL45ovJ4AgD
N1Oo1/9qNueH5hoMGtHRQmAJ5o8kIg==
=Wv6o
-----END PGP SIGNATURE-----

--/5FZK+/SeYPoIsDe--


