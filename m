Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E74B1511
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:15:25 +0100 (CET)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDyW-0003ZP-B6
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:15:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIDXZ-0002av-Ti
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:47:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIDMG-00060Z-DC
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644514550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lM12+0oyYkXm4ClE7yqEaZO7twGnKknB9DhPM0Z3/gw=;
 b=HEyLuk0ENYCXVoMjyXOaRxxsYU/uEncrLFPMgXSmdjSDbMmN01W8XwFfBZdNIjX13nZEXZ
 Sy+bwn8Ojc9ud7EC8J26zAT4ruwKuzhdECu+O/1JgHx5gBVXXkwoxAqSvE63BTDZLeBF9G
 hWXNYVarLHUBRK6GrUHnjueOjz8INlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-9t8TkFLZNBiXtQM8LgetTg-1; Thu, 10 Feb 2022 12:35:47 -0500
X-MC-Unique: 9t8TkFLZNBiXtQM8LgetTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DCD08145E4;
 Thu, 10 Feb 2022 17:35:45 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9171684FFB;
 Thu, 10 Feb 2022 17:35:44 +0000 (UTC)
Date: Thu, 10 Feb 2022 17:35:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 02/20] job.h: categorize fields in struct Job
Message-ID: <YgVM77u1XTlVbHbB@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-3-eesposit@redhat.com>
 <YgUx60M7dB+VLi3p@stefanha-x1.localdomain>
 <8607b985-22a9-c256-af1f-ff3ba250701f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QlA1WTYxKcmN/2Pi"
Content-Disposition: inline
In-Reply-To: <8607b985-22a9-c256-af1f-ff3ba250701f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--QlA1WTYxKcmN/2Pi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 05:26:52PM +0100, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> On 10/02/2022 16:40, Stefan Hajnoczi wrote:
> > On Tue, Feb 08, 2022 at 09:34:55AM -0500, Emanuele Giuseppe Esposito wr=
ote:
> >> Categorize the fields in struct Job to understand which ones
> >> need to be protected by the job mutex and which don't.
> >>
> >> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >> ---
> >>  include/qemu/job.h | 59 ++++++++++++++++++++++++++--------------------
> >>  1 file changed, 34 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/include/qemu/job.h b/include/qemu/job.h
> >> index d1192ffd61..86ec46c09e 100644
> >> --- a/include/qemu/job.h
> >> +++ b/include/qemu/job.h
> >> @@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
> >>   * Long-running operation.
> >>   */
> >>  typedef struct Job {
> >> +
> >> +    /* Fields set at initialization (job_create), and never modified =
*/
> >=20
> > Is there a corresponding "Field protected by job_mutex" comment that
> > separates fields that need locking?
> >=20
>=20
> That would be the comment
>=20
>     /** Protected by job_mutex */
>=20
> situated right after the field "ProgressMeter progress;".
>=20
> Do you want me to change it in "Fields protected by job_mutex"?

I don't see it:

+    /** The opaque value that is passed to the completion function.  */
+    void *opaque;
+
+    /* ProgressMeter API is thread-safe */
+    ProgressMeter progress;
+
+
+    /** AioContext to run the job coroutine in */
+    AioContext *aio_context;
+
+    /** Reference count of the block job */
+    int refcnt;

Is it added by a later patch or did I miss it?

Stefan

--QlA1WTYxKcmN/2Pi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFTO8ACgkQnKSrs4Gr
c8jiRwgAoiiieQxSsgr8P96V7HMI8w+Te4m6u9a//zc2HbLTntvixkB7GXPMf70i
togVRXfsNC6WW/LYiHQU8HeMrECJ6NwEbV0mZrTTeVCL4o9D0uBcXAJFN2nBh8Ye
DjtPQPboWe22JVwjaiOtoBbDlJS9WTK8D+5F4ABYUUoZS3QIbDKCzrad19dyuIY8
3HDFu/v95jaspH1u0RS1rhJ7AM8yjOqn57/gMh5q9ndh2HJ+4WoXgEUwdUTOD2FQ
71TcIF4kkTTNW+x71hqQcj0rtg5KRn0pQNuxUWLauwPqZvhHG4+AiEkwHf1Y8iKp
5yaZJIaijM7QQ8ymhdre1BLyPHpx4A==
=hUTV
-----END PGP SIGNATURE-----

--QlA1WTYxKcmN/2Pi--


