Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2434BA480
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:37:46 +0100 (CET)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKiqn-0005xB-C6
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:37:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKiGZ-0002xy-Aw
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKiGS-0005XZ-3A
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645110011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yNi4JZJdFYJHvkkjLdYGmk446PWczoxpy9KXeynwKaE=;
 b=SYaqM9trPn/hjlso0YWrONG+NiCOsnvMsSyjkKeifQl1MW8u05cXiybcQnr5cYJd3fm1ki
 YRGIuXZ+hFKpKZBucKyen6+sNeyqfGgRhlibf951Eet9dMVtq949ptYZ6lF0O19Dcd2lxn
 GkcI6op0PYDngcb0C9XsMS6x6WNpaao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-MS0_jV5YNniplydGkFCNtg-1; Thu, 17 Feb 2022 10:00:09 -0500
X-MC-Unique: MS0_jV5YNniplydGkFCNtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A70A1853024;
 Thu, 17 Feb 2022 15:00:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 825CB7D729;
 Thu, 17 Feb 2022 15:00:07 +0000 (UTC)
Date: Thu, 17 Feb 2022 15:00:06 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 09/20] jobs: add job lock in find_* functions
Message-ID: <Yg5i9qPJLoNVqBW5@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-10-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ep8RsOaURwwKEHPP"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-10-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ep8RsOaURwwKEHPP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:02AM -0500, Emanuele Giuseppe Esposito wrote:
> diff --git a/blockdev.c b/blockdev.c
> index c5fba4d157..08408cd44b 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -3311,7 +3311,10 @@ out:
>      aio_context_release(aio_context);
>  }
> =20
> -/* Get a block job using its ID and acquire its AioContext */
> +/*
> + * Get a block job using its ID and acquire its AioContext.
> + * Returns with job_lock held on success.

The caller needs to deal with unlocking anyway, so maybe ask the caller
to acquire the lock too? That would make the function simpler to reason
about.

> @@ -60,6 +65,7 @@ void qmp_job_cancel(const char *id, Error **errp)
>      trace_qmp_job_cancel(job);
>      job_user_cancel(job, true, errp);
>      aio_context_release(aio_context);
> +    job_unlock();
>  }

Is job_mutex -> AioContext lock ordering correct? I thought the
AioContext must be held before taking the job lock according to "jobs:
remove aiocontext locks since the functions are under BQL"?

--ep8RsOaURwwKEHPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOYvYACgkQnKSrs4Gr
c8jPpgf/Zd+A17GN6LKRXjHQJgfnk9RVfdL2LEKGIkivWjgIFX0WgKK2wf7IDofQ
rihNutHeAqiLsvosJkUiDRKjp93PID+ncAxyN/d+mS4NkpbOmKeqn4QwbzaxDXz9
29sPYKE6+I17Wu/xVrkgjSojBeXZZny+eJX4G9MmF1Ei31/x9wfNO0JOb6Z8kNxl
C1U5wVhXpTMisqoagEjAmDruEA3rBYyzRCHTYfkX1e3il80kdMJd17qHi7vlqEL1
wAt6NW0xiDSZT05rCzhLnp4E5MPeJ8cHQXRbdAUY8aepsfh0y8UEYt42VDyd2Pkw
chYH2xSx0VTT6k1/nwxXDiKRdHFhrg==
=6Wb7
-----END PGP SIGNATURE-----

--ep8RsOaURwwKEHPP--


