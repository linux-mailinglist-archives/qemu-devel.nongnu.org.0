Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171E4BA2A4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:13:54 +0100 (CET)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKhXc-0000qU-Tt
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:13:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKh6Z-0003O0-PW
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKh6W-0002uo-O2
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645105552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7/qoYrfnLVP0RNSqwR3WL942TjpbsnJZLexQ3jsUFcs=;
 b=ge/lUbFaHF2YvjLMfYBkp110ZJ/mOJ4/yXhnWzuts5GDvxdW7bhfJa7VcrPwJje/9J8OuS
 33CWM4Z3Mlik/hkSNOZRyn9Vi6fjRs0Ju3HjvJ1ag7iJcvb5mwrl7qmlArBWEBSvTqWO5U
 mjxEXVK2IG6i7bvkn40oLkXkJpI0zkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-M35Xjno5Owu2fswsKXvckg-1; Thu, 17 Feb 2022 08:45:48 -0500
X-MC-Unique: M35Xjno5Owu2fswsKXvckg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E96EF1091DA0;
 Thu, 17 Feb 2022 13:45:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E7A36FB8A;
 Thu, 17 Feb 2022 13:45:36 +0000 (UTC)
Date: Thu, 17 Feb 2022 13:45:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 04/20] job.c: move inner aiocontext lock in callbacks
Message-ID: <Yg5Rfyf2NvnCPAWq@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HylsmDjAewPOse0o"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--HylsmDjAewPOse0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:34:57AM -0500, Emanuele Giuseppe Esposito wrote:
> Instead of having the lock in job_tnx_apply, move it inside

s/tnx/txn/

> in the callback. This will be helpful for next commits, when
> we introduce job_lock/unlock pairs.
>=20
> job_transition_to_pending() and job_needs_finalize() do not
> need to be protected by the aiocontext lock.
>=20
> No functional change intended.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  job.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

I find this hard to review. The patch reduces the scope of the
AioContext lock region and accesses Job in places where the AioContext
was previously held. The commit description doesn't explain why it is
safe to do this.

I may need to audit the code myself but will try reviewing a few more
patches first to see if I get the hang of this.

>=20
> diff --git a/job.c b/job.c
> index f13939d3c6..d8c13ac0d1 100644
> --- a/job.c
> +++ b/job.c
> @@ -149,7 +149,6 @@ static void job_txn_del_job(Job *job)
> =20
>  static int job_txn_apply(Job *job, int fn(Job *))
>  {
> -    AioContext *inner_ctx;
>      Job *other_job, *next;
>      JobTxn *txn =3D job->txn;
>      int rc =3D 0;
> @@ -164,10 +163,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
>      aio_context_release(job->aio_context);
> =20
>      QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
> -        inner_ctx =3D other_job->aio_context;
> -        aio_context_acquire(inner_ctx);
>          rc =3D fn(other_job);
> -        aio_context_release(inner_ctx);
>          if (rc) {
>              break;
>          }
> @@ -717,11 +713,15 @@ static void job_clean(Job *job)
> =20
>  static int job_finalize_single(Job *job)
>  {
> +    AioContext *ctx =3D job->aio_context;
> +
>      assert(job_is_completed(job));
> =20
>      /* Ensure abort is called for late-transactional failures */
>      job_update_rc(job);
> =20
> +    aio_context_acquire(ctx);
> +
>      if (!job->ret) {
>          job_commit(job);
>      } else {
> @@ -729,6 +729,8 @@ static int job_finalize_single(Job *job)
>      }
>      job_clean(job);
> =20
> +    aio_context_release(ctx);
> +
>      if (job->cb) {
>          job->cb(job->opaque, job->ret);
>      }
> @@ -833,8 +835,8 @@ static void job_completed_txn_abort(Job *job)
>              assert(job_cancel_requested(other_job));
>              job_finish_sync(other_job, NULL, NULL);
>          }
> -        job_finalize_single(other_job);
>          aio_context_release(ctx);
> +        job_finalize_single(other_job);
>      }
> =20
>      /*
> @@ -849,11 +851,16 @@ static void job_completed_txn_abort(Job *job)
> =20
>  static int job_prepare(Job *job)
>  {
> +    AioContext *ctx =3D job->aio_context;
>      assert(qemu_in_main_thread());
> +
>      if (job->ret =3D=3D 0 && job->driver->prepare) {
> +        aio_context_acquire(ctx);
>          job->ret =3D job->driver->prepare(job);
> +        aio_context_release(ctx);
>          job_update_rc(job);
>      }
> +
>      return job->ret;
>  }
> =20
> --=20
> 2.31.1
>=20

--HylsmDjAewPOse0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOUX8ACgkQnKSrs4Gr
c8iKTggAmz8F/gvIJz5ZzKvwEOQNgCDT2czZ66W/JsOwa8CH0Bt3xZnFG1vwRIDd
9h30iAHoXjfYnpv63YepEMouVWGUF82RTTlCf6BaiHM7SN8ydliiYpImyblQJ1dQ
2ZoambYuW5jKyJcDei5q49/6SlMLR3bbSdF7+UuWA+lNWu5h8EvxYsY+/2kXV3x8
KUkwpP7u8CA0Y0+erTHjG4BlGg7oKazFJeEmXigLSsAuINdpLFnMuHcUVm7tvlpn
CWfnhFp3KCc8HeOYPamvf4xaQgFdE638ifeQ0GynCmyqKjgy/Am0nudqhw5hMV2C
EoZ5Te0dlbeO4JzWCPdYZzjD13kJwg==
=boV/
-----END PGP SIGNATURE-----

--HylsmDjAewPOse0o--


