Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A140A4779B1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:51:28 +0100 (CET)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtyZ-0001c9-7Z
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtw0-0000s7-GK
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtvy-0000wX-Uh
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639673326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+Jx2cN+OzD3hgGVklpnw3Mlq1Tqvkpaz5unjoObKU8=;
 b=SCA7Z5k7KPSzeiPEaERQApgUn/bAYaFLIXhfITdmJmlPdHvaWb8IC1lkW2VaPH6K5EA8WS
 mXzQT7pySoHcIoOuK9VYfLEp9z/6MjsXZfcbiMJN6IaO854mg77cSIpONKvZ5oJ5tzKmcx
 8t6iTeM0Ls5AsxFH0rhKTPB/RfXoWOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-B7LSvJ3wNu60nBmYu6ekUg-1; Thu, 16 Dec 2021 11:48:43 -0500
X-MC-Unique: B7LSvJ3wNu60nBmYu6ekUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F15C101F7A4;
 Thu, 16 Dec 2021 16:48:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9817E27C21;
 Thu, 16 Dec 2021 16:48:40 +0000 (UTC)
Date: Thu, 16 Dec 2021 16:48:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 03/14] job.h: define locked functions
Message-ID: <Ybtt591Fe+PgDCFm@stefanha-x1.localdomain>
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104145334.1346363-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EZMUCNK5SMEAqkiV"
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

--EZMUCNK5SMEAqkiV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 10:53:23AM -0400, Emanuele Giuseppe Esposito wrote:
>  /** Returns whether the job is ready to be completed. */
>  bool job_is_ready(Job *job);
> =20
> +/** Same as job_is_ready(), but assumes job_lock is held. */
> +bool job_is_ready_locked(Job *job);

What I see here is that some functions assume job_lock is held but don't
have _locked in their name (job_ref()), some assume job_lock is held and
have _locked in their name (job_is_ready_locked()), and some assume
job_lock is not held (job_is_ready()).

That means when _locked is not in the name I don't know whether this
function requires job_lock or will deadlock if called under job_lock.

Two ways to it obvious:

1. Always have _locked in the name if the function requires job_lock.
   Functions without _locked must not be called under job_lock.

2. Don't change the name but use the type system instead:

   /*
    * Define a unique type so the compiler warns us. It's just a pointer
    * so it can be efficiently passed by value.
    */
   typedef struct { Job *job; } LockedJob;

   LockedJob job_lock(Job *job);
   Job *job_unlock(LockedJob job);

   Now the compiler catches mistakes:

   bool job_is_completed(LockedJob job);
   bool job_is_ready(Job *job);

   Job *j;
   LockedJob l;
   job_is_completed(j) -> compiler error
   job_is_completed(l) -> ok
   job_is_ready(j) -> ok
   job_is_ready(l) -> compiler error

   This approach assumes per-Job locks but a similar API is possible
   with a global job_mutex too. There just needs to be a function to
   turn Job * into LockedJob and LockedJob back into Job*.

   This is slightly exotic. It's not an approach I've seen used in C, so
   it's not idiomatic and people might find it unfamiliar.

These are just ideas. If you want to keep it the way it is, that's okay
too (although a little confusing).

> diff --git a/job.c b/job.c
> index 0e4dacf028..e393c1222f 100644
> --- a/job.c
> +++ b/job.c
> @@ -242,7 +242,8 @@ bool job_cancel_requested(Job *job)
>      return job->cancelled;
>  }
> =20
> -bool job_is_ready(Job *job)
> +/* Called with job_mutex held. */

This information should go with the doc comments (and it's already there
in job.h!). There is no rule on where to put doc comments but in this
case you already added them to job.h, so they are not needed here in
job.c. Leaving them could confuse other people into adding doc comments
into job.c instead of job.h.

--EZMUCNK5SMEAqkiV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7becACgkQnKSrs4Gr
c8jVYwf/SUSDQE4NZ5vpz0wd99ykx9j8B7Fc2rgFzCVZPzEKk+QBJAubuhkwjjQf
1E0HgSYXDXao0OlOcrowfXnp6uYA+11gZqn3FDZQU5KLQwe1hURQpQXq7OpLOidP
OlvvQ4Os1Y+VKRZxChHxGWTS/LiB+bJ5Nev/WZ1Ezvzn6+PTqZwbON0Ibr7N5OH5
uOsddDSsLYFuGd6wRwVGtdDRcwY1VYykVQnXOlLpRfWShfU84acNKG70Qq0By5F+
VqiAs67qS/4+k0EADQ7JH7Vv9Stt9Rp4Kph8nHiQVFkf8GNWb7lTt+nNFrfq2lb+
jB8IDpnrR/sZuMMmTjWi6jLkCULhVA==
=RRII
-----END PGP SIGNATURE-----

--EZMUCNK5SMEAqkiV--


