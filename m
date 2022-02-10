Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB2D4B1491
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:49:32 +0100 (CET)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDZR-0004K6-QZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:49:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIBep-000530-Rc
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:46:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIBeo-0002eg-86
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644508013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zomOUt2v4IR6qUYZHB5bJZPQPCihiS8yj0eyxSJ0SXg=;
 b=GZy0LtkAjgdCkGjS/YMhL3DPllGL++cYOfwmXS26xakEgTnJM7VumQ37v5VA/CFACJkvGa
 dnJsdgck8knn+f2iWahXoNHcFMNIFmFoh9Cc2QwH/8sECCXZ1StWmk/P0L6pfRGT9ML+34
 Neod1ntGC0jpGpphuUof1sD9L4lBqV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-GhhgpvqWMxyW8kkDEU3iGw-1; Thu, 10 Feb 2022 10:46:50 -0500
X-MC-Unique: GhhgpvqWMxyW8kkDEU3iGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A129100CC90;
 Thu, 10 Feb 2022 15:43:11 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBE6F75749;
 Thu, 10 Feb 2022 15:43:05 +0000 (UTC)
Date: Thu, 10 Feb 2022 15:43:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 03/20] job.c: API functions not used outside should be
 static
Message-ID: <YgUyiN0vfIa560wm@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xt+qxFd+rg/xGZ8t"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--Xt+qxFd+rg/xGZ8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:34:56AM -0500, Emanuele Giuseppe Esposito wrote:
> job_event_* functions can all be static, as they are not used
> outside job.c.
>=20
> Same applies for job_txn_add_job().
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 18 ------------------
>  job.c              | 12 +++++++++---
>  2 files changed, 9 insertions(+), 21 deletions(-)
>=20
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 86ec46c09e..6000463126 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -356,18 +356,6 @@ JobTxn *job_txn_new(void);
>   */
>  void job_txn_unref(JobTxn *txn);
> =20
> -/**
> - * @txn: The transaction (may be NULL)
> - * @job: Job to add to the transaction
> - *
> - * Add @job to the transaction.  The @job must not already be in a trans=
action.
> - * The caller must call either job_txn_unref() or job_completed() to rel=
ease
> - * the reference that is automatically grabbed here.
> - *
> - * If @txn is NULL, the function does nothing.
> - */
> -void job_txn_add_job(JobTxn *txn, Job *job);
=2E..
> diff --git a/job.c b/job.c
> index d603f9ad1e..f13939d3c6 100644
> --- a/job.c
> +++ b/job.c
> @@ -125,7 +125,7 @@ void job_txn_unref(JobTxn *txn)
>      }
>  }
> =20
> -void job_txn_add_job(JobTxn *txn, Job *job)
> +static void job_txn_add_job(JobTxn *txn, Job *job)

Please move the doc comments into the .c file too.

--Xt+qxFd+rg/xGZ8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFMogACgkQnKSrs4Gr
c8jdMAf9HaYsWBHpgnZcvw6tryiUzGYS97zSLFNQG3Us2ubCNEeJXrtA6P+yimaQ
wUxGJGJfPAsskMmDf6TryV4Yr7q2yB/B/szdxR9r7+X/0GpmsjJpgIUaI+Ds6ceF
HNBbAQ3509XDstoyH+K6RjoGUEb8IIEa6FSMPbxPB60Xk4O09OU5Q08EVgkgB1fr
fO7jmFisqw6fLsY/uLvfAIAatmJ4n4ORmgK04apwCdj3R7U/OTNVfh4nQcN5hcVH
aFmLDLAmnxR5VdXmm1yS3ZeRDPGbQSJARc2tBsY4PyI552uB4bnziSMM4IEaUyow
x9Y2/zbQW8b9zZUjLvq5IjyvXYdLOg==
=C7+1
-----END PGP SIGNATURE-----

--Xt+qxFd+rg/xGZ8t--


