Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483224BA40A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:12:38 +0100 (CET)
Received: from localhost ([::1]:58608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKiST-0004G9-9P
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:12:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKheN-0000dd-EE
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:20:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKheI-0007wm-8j
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645107630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kKy2PL98RiUGCl++TZKSBX7rBubsAZ2w129QK43c/3E=;
 b=b0i5xGtVHOUIIfj9CbtLe+WI0q4kNgz1kY46dAJhUmSPuzWBGrQGmX0KzGCgLmPSFD18N+
 x1DIjbQoY6YVmIGkREbkSjzhfacYb9iFNHeVTjE06r2H0fCj5+OgwDoDtDTJlN2+kWv+/A
 LnjArQOYx4Ekls10cVeZoGlDwtRaz5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-lx6ozGh8N1itEjMjDgv_Hg-1; Thu, 17 Feb 2022 09:20:26 -0500
X-MC-Unique: lx6ozGh8N1itEjMjDgv_Hg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A1E1006AA6;
 Thu, 17 Feb 2022 14:20:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E43A0708D3;
 Thu, 17 Feb 2022 14:20:23 +0000 (UTC)
Date: Thu, 17 Feb 2022 14:20:22 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 07/20] job.h: add _locked duplicates for job API
 functions called with and without job_mutex
Message-ID: <Yg5ZpqTZkoKAmTPZ@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pTYR4Rd5VLpG49sX"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


--pTYR4Rd5VLpG49sX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:00AM -0500, Emanuele Giuseppe Esposito wrote:
>  static void job_exit(void *opaque)
>  {
>      Job *job =3D (Job *)opaque;
>      AioContext *ctx;
> +    JOB_LOCK_GUARD();
> =20
>      job_ref(job);
>      aio_context_acquire(job->aio_context);

The previous patch said:

  We don't want this, as job_lock must be taken inside the AioContext
  lock, and taking it outside would cause deadlocks.

Therefore this looks like a deadlock.

--pTYR4Rd5VLpG49sX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOWaYACgkQnKSrs4Gr
c8h0LAf+L/fF877b5sIbewkN2HZwkA/iVbs2yE3mAZUUhPhqnHBaMUQeOqvyx1pF
g0IyYpaRRZfWlXRmtFKQ6zkxWCOvThfRlpMzyzc2U0ucx0Yx4rcdOD/xrE7GWtOh
WZ5WJIamtR7tBUxUYNuApjZkPpF2iEHt2UMNLF9vuTUKXkPxtW+KWs0YcjA32vPH
CP7klSWdymI6W+6Un4BhRtufdlxbTU9jMXMv/RtmiGTIosHH1GJfI2F9oWDs9R9y
4s/ye2AgPNmuJtqex9y1Oor2VQsiHY6sxWnR3RCgLWyRsqOVs6DuI9d3hKJiPond
7lH5cvCZT0tAQGCeb6lRZHnAJHqITg==
=SfYX
-----END PGP SIGNATURE-----

--pTYR4Rd5VLpG49sX--


