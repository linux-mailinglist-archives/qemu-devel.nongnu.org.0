Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BC49C88B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 12:23:21 +0100 (CET)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCgOX-0006Ud-0u
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 06:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCgNH-0005bF-Ri
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:22:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCgNA-00019o-Qc
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643196114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4myfXP9DzHw8iUsSr1SnhfJDf3Jlgh+qrdKsnvRk++Q=;
 b=YDl5lSoOXPrHxf74tnkzedAoLGVWfIaRDWRfJ8fjlfzD1daKbGP1/7AEiqa42d1mzx+zkU
 XuubqwSZTCRhf1GQ4ajV7ztqRUD06u0c/jUvtsKEeQ9FH5rvUz7aPHt5KEvyPyF3eV9vcq
 /OzxZ1m7OseUoZgVBpRWo7wStOSJIuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-P2ORfeVDPIakI1F59hr5dQ-1; Wed, 26 Jan 2022 06:21:50 -0500
X-MC-Unique: P2ORfeVDPIakI1F59hr5dQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B15001083F60;
 Wed, 26 Jan 2022 11:21:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B21E105B1E4;
 Wed, 26 Jan 2022 11:21:32 +0000 (UTC)
Date: Wed, 26 Jan 2022 11:21:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 09/12] jobs: ensure sleep in job_sleep_ns is fully
 performed
Message-ID: <YfEuu6AGUEN4/5PQ@stefanha-x1.localdomain>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-10-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lHZxOnsSTWq9+7po"
Content-Disposition: inline
In-Reply-To: <20220118162738.1366281-10-eesposit@redhat.com>
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


--lHZxOnsSTWq9+7po
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 11:27:35AM -0500, Emanuele Giuseppe Esposito wrote:
> If a drain happens while a job is sleeping, the timeout
> gets cancelled and the job continues once the drain ends.
> This is especially bad for the sleep performed in commit and stream
> jobs, since that is dictated by ratelimit to maintain a certain speed.
>=20
> Basically the execution path is the followig:

s/followig/following/

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

I remember seeing Hanna and Kevin use carefully rate-limited jobs in
qemu-iotests. They might have thoughts on whether this patch is
acceptable or not.

--lHZxOnsSTWq9+7po
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxLrsACgkQnKSrs4Gr
c8ggigf9GnnlkSBn2J/2QFEuUcYjGXHcEdFoyef5+bKPFUUngTJjHmDcXmCsfkXF
ky82LW8iE5cLyK99lpaavWVkp8sZwyWQ43/UPvHcurmu4Ny9lbz8khB6KuY1fifv
Pu72fgP9Hj6VC9sqFMYkCNp0gUmEBBjOfBxvBO+eMiI+OOLs/cK0/VAXA/kFALBx
eRTxd3ruAc5F6XAuxN0gAQHvl9nZfgys2MkiyGYAJBRzhKdzXXXLDpws1vQDiKL4
wT0JMWhQKRey1x/4hX9w83vcMk2ViglEjnQxYCvhsMeagIx/n2T1pBzKPYfyVx6R
ppCo9/kj8josfGdgfREPCfWQrDQj7Q==
=Uixp
-----END PGP SIGNATURE-----

--lHZxOnsSTWq9+7po--


