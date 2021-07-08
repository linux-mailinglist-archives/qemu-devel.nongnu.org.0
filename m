Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204983BF892
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:51:44 +0200 (CEST)
Received: from localhost ([::1]:36048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Rd9-00053E-6k
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Rbt-0004Bs-Tx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Rbr-0006DJ-0L
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625741422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M3K/So+igocY2+GB8YY8zfjqLdPeKLol7iLvOqqIxQc=;
 b=hYZ9k5Vds3C0Y5wb7XYTJz2MscENRrqVMkyZjk9f4Io2Znonq4tuIiPyzndWvaRgbvabWu
 /8eMqt39W4gdIFmpmQjTGqG4EDfI+uWUaMdaYm7doknl5zpZ4l7jddCPM0VjOYphVoPRVI
 6KHac4asFqkdev9W1I+hZ0dYl1QJAns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-vB8qWSwxP_SW3fRFlDTmxg-1; Thu, 08 Jul 2021 06:50:18 -0400
X-MC-Unique: vB8qWSwxP_SW3fRFlDTmxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 916AE100CCC2;
 Thu,  8 Jul 2021 10:50:17 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AFBC60854;
 Thu,  8 Jul 2021 10:50:16 +0000 (UTC)
Date: Thu, 8 Jul 2021 11:50:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 2/6] job: _locked functions and public
 job_lock/unlock for next patch
Message-ID: <YObYaIAatXp9g41G@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707165813.55361-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+hOz8GoXhEULePGW"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+hOz8GoXhEULePGW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 06:58:09PM +0200, Emanuele Giuseppe Esposito wrote:
> diff --git a/job.c b/job.c
> index 872bbebb01..96fb8e9730 100644
> --- a/job.c
> +++ b/job.c
> @@ -32,6 +32,10 @@
>  #include "trace/trace-root.h"
>  #include "qapi/qapi-events-job.h"
> =20
> +/* job_mutex protexts the jobs list, but also the job operations. */
> +static QemuMutex job_mutex;

It's unclear what protecting "job operations" means. I would prefer a
fine-grained per-job lock that protects the job's fields instead of a
global lock with an unclear scope.

> +
> +/* Protected by job_mutex */
>  static QLIST_HEAD(, Job) jobs =3D QLIST_HEAD_INITIALIZER(jobs);
> =20
>  /* Job State Transition Table */
> @@ -64,27 +68,22 @@ bool JobVerbTable[JOB_VERB__MAX][JOB_STATUS__MAX] =3D=
 {
>  /* Transactional group of jobs */
>  struct JobTxn {
> =20
> -    /* Is this txn being cancelled? */
> +    /* Is this txn being cancelled? Atomic.*/
>      bool aborting;

The comment says atomic but this field is not accessed using atomic
operations (at least at this point in the patch series)?

> =20
> -    /* List of jobs */
> +    /* List of jobs. Protected by job_mutex. */
>      QLIST_HEAD(, Job) jobs;
> =20
> -    /* Reference count */
> +    /* Reference count. Atomic. */
>      int refcnt;

Same.

--+hOz8GoXhEULePGW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDm2GcACgkQnKSrs4Gr
c8jcSAf/YKpEOTyzE1HXa60RUETBXb9jBpY9IHXYDagdIS+5CNxn3YQg/G2pRMFW
eUHNUGJAzqQTy7WYInouAy1ptuB/T9lxYwJqlWIfw/uJXY0AEW9h8/5m7vrg8z68
Ru7WZdKPaQWuW60VlWSdoKI/OeGuIehH+/k0ujWVg0Av877RMGfZ9xGQaeKRLhS9
f61fd7rwVsgSBIN6LPKOoJU+lwbqUmzK9oBNmyRvPIF+Su/8wh0ik3HNU2XLQK77
RFkhAg5jGWxzZ8cf7CwdSpItPMHbZ+Aj1ZBcxLCagCvN6f0w5BV6onK19KbQXqnj
cmT+JbQXaQWSJ5bTnIYdbS0219Z4LQ==
=KChq
-----END PGP SIGNATURE-----

--+hOz8GoXhEULePGW--


