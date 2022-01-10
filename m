Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A70489D67
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:21:05 +0100 (CET)
Received: from localhost ([::1]:36732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xPs-0002Wf-AV
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:21:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6xBd-0002tI-QU
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:06:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6xBZ-0005xL-DZ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641830771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qer/BVD06Q0bVg+fKF86BP6DQ3CbhEXvwGIok3wa71s=;
 b=CTJSWOK1r9euzpG/N+IFUcPEB0hB8Krfxs5mcBbSQqSLg/XtQ0SVC0nnplD4+Iaif/FOhJ
 6YkSLxTVVoZTLwSMY7n00hYfRR7QTCwZVdHrzC93ci8Q2JU6JzcepPUzEaCJL80QA/Kbdq
 BDFkrphtmlx8fMDsxRKO5HLMScoMYus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-Jo88hakyP56aeSqmp7aKHA-1; Mon, 10 Jan 2022 11:06:08 -0500
X-MC-Unique: Jo88hakyP56aeSqmp7aKHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 467E81083F6A;
 Mon, 10 Jan 2022 16:06:07 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B7297BB68;
 Mon, 10 Jan 2022 16:05:36 +0000 (UTC)
Date: Mon, 10 Jan 2022 16:05:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 1/4] jobs: drop qmp_ trace points
Message-ID: <YdxZTz3UcLBAdVxL@stefanha-x1.localdomain>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211223110756.699148-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CzWxtlQSOy5fmplv"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, michael.roth@amd.com,
 philmd@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--CzWxtlQSOy5fmplv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 12:07:53PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> diff --git a/block/trace-events b/block/trace-events
> index 549090d453..5be3e3913b 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -49,15 +49,6 @@ block_copy_read_fail(void *bcs, int64_t start, int ret=
) "bcs %p start %"PRId64"
>  block_copy_write_fail(void *bcs, int64_t start, int ret) "bcs %p start %=
"PRId64" ret %d"
>  block_copy_write_zeroes_fail(void *bcs, int64_t start, int ret) "bcs %p =
start %"PRId64" ret %d"
> =20
> -# ../blockdev.c
> -qmp_block_job_cancel(void *job) "job %p"
> -qmp_block_job_pause(void *job) "job %p"
> -qmp_block_job_resume(void *job) "job %p"
> -qmp_block_job_complete(void *job) "job %p"
> -qmp_block_job_finalize(void *job) "job %p"
> -qmp_block_job_dismiss(void *job) "job %p"
> -qmp_block_stream(void *bs) "bs %p"
> -
>  # file-win32.c
>  file_paio_submit(void *acb, void *opaque, int64_t offset, int count, int=
 type) "acb %p opaque %p offset %"PRId64" count %d type %d"
> =20
> diff --git a/trace-events b/trace-events
> index a637a61eba..1265f1e0cc 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -79,14 +79,6 @@ job_state_transition(void *job,  int ret, const char *=
legal, const char *s0, con
>  job_apply_verb(void *job, const char *state, const char *verb, const cha=
r *legal) "job %p in state %s; applying verb %s (%s)"
>  job_completed(void *job, int ret) "job %p ret %d"
> =20
> -# job-qmp.c
> -qmp_job_cancel(void *job) "job %p"
> -qmp_job_pause(void *job) "job %p"
> -qmp_job_resume(void *job) "job %p"
> -qmp_job_complete(void *job) "job %p"
> -qmp_job_finalize(void *job) "job %p"
> -qmp_job_dismiss(void *job) "job %p"

The job pointer argument will be lost. That's not ideal but probably
worth getting trace events for all QMP commands.

Stefan

--CzWxtlQSOy5fmplv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcWU8ACgkQnKSrs4Gr
c8gTdgf/Y1QlhgzNspwHvT3eEtSUmjBw0AcoTYIaphcgMonJIPs29tMlzbuqXoVZ
c99gpyfqe70bLkMzMCutgFM/CnmuMk84MwnoK2x7sn7zWneFJcc+JCl8ZpMMlbh9
akHj5pF9U737ByKyq3zcFnFIHDHkVOUWG2aHrAvyHgIKdc0E6u0dxtvok2sMmG84
+1QSl1RSaajrLO3rlE6/7GfwBvpT8beLykY4HiyXQvd7UQVCQxIzH+6b6cuZktTk
UvPVUmsr1bi1y7fp11rAvZy/pkYtuRMCPaGYsjTYHxVVcoy/wWKB/Rng9w20oByQ
hVGzQqvPbN8yaiO+qI8AWVh8zK/fGQ==
=qyLn
-----END PGP SIGNATURE-----

--CzWxtlQSOy5fmplv--


