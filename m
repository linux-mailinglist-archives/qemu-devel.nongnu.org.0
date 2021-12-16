Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECE4778A6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:23:21 +0100 (CET)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtXM-0006MM-8V
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:23:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtWF-0005Yx-Go
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:22:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtWE-0003cm-56
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639671729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OhBGCVUW6gjZLQaR96koZrEkrwWiZ0j/whXmSGFCxSU=;
 b=Ec7gdiVTZJ1z3CzUkj8E1oRSHrt+kPERTeAu+uYDq3AMNqXTcOm5EMEdjCjq/vr3kV12IX
 ZyzBjZaQpuK78gTgfBv2aqQzendtmtKyw6nqS8zlY3AoHHeZqyaSoOtB+Z+spsaYeO6OcY
 L2P+PQyRfgOmdzISEb1wCF19mJuze5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-HuDkN_1uNE-UnlAmtJT3PQ-1; Thu, 16 Dec 2021 11:22:06 -0500
X-MC-Unique: HuDkN_1uNE-UnlAmtJT3PQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB2285B6C6;
 Thu, 16 Dec 2021 16:22:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 317CEE2FA;
 Thu, 16 Dec 2021 16:21:45 +0000 (UTC)
Date: Thu, 16 Dec 2021 16:21:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 02/14] job.h: categorize fields in struct Job
Message-ID: <YbtnmL/3+NAzP85e@stefanha-x1.localdomain>
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104145334.1346363-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S9Hact2avRxai05F"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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

--S9Hact2avRxai05F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 10:53:22AM -0400, Emanuele Giuseppe Esposito wrote:
> Categorize the fields in struct Job to understand which ones
> need to be protected by the job mutex and which don't.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 57 +++++++++++++++++++++++++++-------------------
>  1 file changed, 34 insertions(+), 23 deletions(-)
>=20
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index ccf7826426..f7036ac6b3 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -40,27 +40,52 @@ typedef struct JobTxn JobTxn;
>   * Long-running operation.
>   */
>  typedef struct Job {
> +
> +    /* Fields set at initialization (job_create), and never modified */
> +
>      /** The ID of the job. May be NULL for internal jobs. */
>      char *id;
> =20
> -    /** The type of this job. */
> +    /**
> +     * The type of this job.
> +     * All callbacks are called with job_mutex *not* held.
> +     */
>      const JobDriver *driver;
> =20
> -    /** Reference count of the block job */
> -    int refcnt;
> -
> -    /** Current state; See @JobStatus for details. */
> -    JobStatus status;
> -
>      /** AioContext to run the job coroutine in */
>      AioContext *aio_context;

"Fields set at initialization (job_create), and never modified" does not
apply here. blockjob.c:child_job_set_aio_ctx() changes it at runtime.

--S9Hact2avRxai05F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7Z5gACgkQnKSrs4Gr
c8jqrwf/acDbWXH2sxUrqwAOEcXJydVSqomOqRMyYx/GCqKpSsjt0VY4duXWcjIt
Wxl1yog4gL/DTM/uAnDioLGrbXA/Lu3oR2rvoutLCkKilaZZf2YgZnFQ251tiK3x
9RrIlg5kjwKiY/xk6GtPaNzCGOjAAAsS23XaClplXld/gPUplcJfQf35NQtcGWrm
47Y1Ho6gP/0cvQqu5iOU+dgpRCSPiHqxaz268qVbyTGIoVEuab3lR52+KYkuHKwQ
lUlJ9u0z2bEQKETX6blrXAogqwxYN447DHerrJHH4ZUPxo3jkMvE2ULSy+4S2rma
XEba5KEJZKhQKFXYeURzjXBG1SuxRg==
=ymvm
-----END PGP SIGNATURE-----

--S9Hact2avRxai05F--


