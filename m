Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01E64B14E1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:03:32 +0100 (CET)
Received: from localhost ([::1]:54642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDn1-000627-J6
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:03:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAfh-0006Uy-7A
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:43:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAff-0002H0-D5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644504222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+sCVKfomidR3uCdfNBMkqMPrxH6zTSeIFcix8jNnvKg=;
 b=bSZD9rI5pKOH5p3YK7gG5J2YHQj+OaqnlCPBXZ2l0TfuLpCr8PSmTSOmBdCuZu0OW7eM0j
 eCsn/L5E/je2VDJsJPwlI5sgcJq/wF+/+6YSRIQ4t5zBhCqaIx0ZRDVlhIUAE7zGDXf1Mo
 VJ4BceC3sE2YoWGyjCgkyFWIkGP9eIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152--TC1r8v_MsSNdSAIovFtvA-1; Thu, 10 Feb 2022 09:43:39 -0500
X-MC-Unique: -TC1r8v_MsSNdSAIovFtvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 177CA8519E6;
 Thu, 10 Feb 2022 14:43:38 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9150D7D534;
 Thu, 10 Feb 2022 14:43:30 +0000 (UTC)
Date: Thu, 10 Feb 2022 14:43:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 6/6] jobs: ensure sleep in job_sleep_ns is fully performed
Message-ID: <YgUkkXC9dbAKphn1@stefanha-x1.localdomain>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-7-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TpP0BThS2z5IrPUo"
Content-Disposition: inline
In-Reply-To: <20220208153655.1251658-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TpP0BThS2z5IrPUo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:36:55AM -0500, Emanuele Giuseppe Esposito wrote:
> If a drain happens while a job is sleeping, the timeout
> gets cancelled and the job continues once the drain ends.
> This is especially bad for the sleep performed in commit and stream
> jobs, since that is dictated by ratelimit to maintain a certain speed.
>=20
> Basically the execution path is the following:
> 1. job calls job_sleep_ns, and yield with a timer in @ns ns.
> 2. meanwhile, a drain is executed, and
>    child_job_drained_{begin/end} could be executed as ->drained_begin()
>    and ->drained_end() callbacks.
>    Therefore child_job_drained_begin() enters the job, that continues
>    execution in job_sleep_ns() and calls job_pause_point_locked().
> 3. job_pause_point_locked() detects that we are in the middle of a
>    drain, and firstly deletes any existing timer and then yields again,
>    waiting for ->drained_end().
> 4. Once draining is finished, child_job_drained_end() runs and resumes
>    the job. At this point, the timer has been lost and we just resume
>    without checking if enough time has passed.
>=20
> This fix implies that from now onwards, job_sleep_ns will force the job
> to sleep @ns, even if it is wake up (purposefully or not) in the middle
> of the sleep. Therefore qemu-iotests test might run a little bit slower,
> depending on the speed of the job. Setting a job speed to values like "1"
> is not allowed anymore (unless you want to wait forever).
>=20
> Because of this fix, test_stream_parallel() in tests/qemu-iotests/030
> takes too long, since speed of stream job is just 1024 and before
> it was skipping all the wait thanks to the drains. Increase the
> speed to 256 * 1024. Exactly the same happens for test 151.
>=20
> Instead we need to sleep less in test_cancel_ready() test-blockjob.c,
> so that the job will be able to exit the sleep and transition to ready
> before the main loop asserts.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  job.c                      | 19 +++++++++++--------
>  tests/qemu-iotests/030     |  2 +-
>  tests/qemu-iotests/151     |  4 ++--
>  tests/unit/test-blockjob.c |  2 +-
>  4 files changed, 15 insertions(+), 12 deletions(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--TpP0BThS2z5IrPUo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFJJEACgkQnKSrs4Gr
c8grwgf/V21Yn4XPvwMiF6cn8bR1hG5UXKEXKs0JNMafnyg0C2rVJXA33zAuVg25
+lJG88SA6oO1J8ZxLLbIj7kHIlAw8c0CqKZuHaqoZwywpIpYs1AkIha6NmFaKaRt
1bEtKAcbmvJJRf9dHQvP99F+ImAtBMXlxKp9P0zWZ6dC1KG+rN38a2fXagrtrnWX
v9jftcxwmZZafnhncgQ/X50IDFksn0nYxlpm0tYNVt5QsTnqnTtDkxIuxnxhdZWC
PjsYGcZJ8gmipxMfBPJcsZ0MtoBlzDOLrrI/o7hpjWRoioCqmMgHfZ8Pxt1H9xWD
ww0WmpWjZQWm3ZRpzGjXPJgSCP5dSQ==
=ohmx
-----END PGP SIGNATURE-----

--TpP0BThS2z5IrPUo--


