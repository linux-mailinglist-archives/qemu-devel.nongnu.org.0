Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5274D1A01
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 15:07:35 +0100 (CET)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaUw-0005mo-5Z
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 09:07:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRaSb-0003TN-W4
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:05:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRaSa-0007xG-0u
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:05:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646748307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4U1rzq2v7MgknvZ1aL5JqyAVnlsh+MRGZ3aqaJFv3Zo=;
 b=U40PiTxMRWIM7iUqgL9tVJCnV0TUCkyhG1AND/W48IRrq7BdPRELqLIIJYu9lpU4mM6z3Y
 HbpVYUIirhzJDRZD6tIRiUWA6KHo/ck0SY3eklxyX3qLkC3A7VyswMgnfbgwNRtUWp/zH8
 LzDGV+e8yhXGg+5YGPhKZ95Il5yxr5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-NkhUv13IMsKeF8Dq-j6r3w-1; Tue, 08 Mar 2022 09:05:03 -0500
X-MC-Unique: NkhUv13IMsKeF8Dq-j6r3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 557E8180FD74;
 Tue,  8 Mar 2022 14:05:02 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 912DD866D1;
 Tue,  8 Mar 2022 14:04:35 +0000 (UTC)
Date: Tue, 8 Mar 2022 14:04:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 19/20] job.c: enable job lock/unlock and remove
 Aiocontext locks
Message-ID: <Yidicn/GkSzaezdr@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-20-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cwmRMEK20ujVowPd"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-20-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cwmRMEK20ujVowPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:12AM -0500, Emanuele Giuseppe Esposito wrote:
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index ca46e46f5b..574110a1f2 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -75,11 +75,14 @@ typedef struct Job {
>      ProgressMeter progress;
> =20
> =20
> +    /** Protected by job_mutex */
> +
>      /**
>       * AioContext to run the job coroutine in.
> -     * This field can be read when holding either the BQL (so we are in
> -     * the main loop) or the job_mutex.
> -     * Instead, it can be only written when we hold *both* BQL and job_m=
utex.
> +     * The job Aiocontext can be read when holding *either*
> +     * the BQL (so we are in the main loop) or the job_mutex.
> +     * Instead, it can only be written when we hold *both* BQL

s/Instead,//

> @@ -456,7 +440,10 @@ void job_unref_locked(Job *job)
> =20
>          if (job->driver->free) {
>              job_unlock();
> +            /* FIXME: aiocontext lock is required because cb calls blk_u=
nref */
> +            aio_context_acquire(job->aio_context);

We break the locking rules for job->aio_context here because the job is
already being destroyed and there can be no races? Can we avoid the
special case:

  AioContext *aio_context =3D job->aio_context;

  job_unlock();
  /* FIXME: aiocontext lock is required because cb calls blk_unref */
  aio_context_acquire(aio_context);
  job->driver->free(job);
  aio_context_release(aio_context);
  job_lock();

?

--cwmRMEK20ujVowPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInYnIACgkQnKSrs4Gr
c8jjrggAg+7r1ypRJQGh5yrD3Y91sUJZzZpIt7wCBckbn2+ch3DdnCz7+PEvoCtA
atqsJIwQbd4MgD0kLkoTmKjGuevY6pUZ6rg/rGkVYUdnDAvxx8ggTfiGIc35hXpp
Iokdd7sjY0WQBS0TK+4LSqdx1UbuK/7pX4oSC4HVf7NQB1+MJVOkQFJhDqXVkyCP
bypdipG/7To4F26CuN6MqKS+6gLrrQgNjr48t41telNKf033mzkpWh9QclN6mucW
FAeovPXakJnNrhJ7G8EB0wfuqOYLNyBhllfv7qcZ/+W+w44T6z0zeW1fs54ZYxzU
m/pWXRwdZ7x0qYy8Dwyul0tV0IUZ3A==
=6FxY
-----END PGP SIGNATURE-----

--cwmRMEK20ujVowPd--


