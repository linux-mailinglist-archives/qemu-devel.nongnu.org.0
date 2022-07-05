Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A921D566431
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:42:45 +0200 (CEST)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dCm-0001jQ-Nr
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dAK-0008RR-Az
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dAH-00044m-O6
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657006809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RDNzCaslVsNhIseqn1aoYX+8KFTqTeyW9xRthYawSuI=;
 b=XarOwkmuOB8joQe5u4jIKtuYiiKDEKMqk/fOfI+tSlQteez+X0/2jO4f0iQx+OVKGtPtXq
 VKlyECH77i/WpHtNK86uddCYNBBX4ISAiJQzkwPpds1wH7TAL+7LWAIHj85xBPJMBwDpc4
 vKOyYbmdHrd9FcRHuLSQLIIm7IwLcU8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-S6JHW3idORKjYZiz200LsA-1; Tue, 05 Jul 2022 03:39:57 -0400
X-MC-Unique: S6JHW3idORKjYZiz200LsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FE3329DD9AC;
 Tue,  5 Jul 2022 07:39:57 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 064A7141510F;
 Tue,  5 Jul 2022 07:39:56 +0000 (UTC)
Date: Tue, 5 Jul 2022 08:39:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 05/20] job.c: add job_lock/unlock while keeping job.h
 intact
Message-ID: <YsPqyyZ8FTEkimjf@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kQI9YxG1F3CIu5b4"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kQI9YxG1F3CIu5b4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:23AM -0400, Emanuele Giuseppe Esposito wrote:
> With "intact" we mean that all job.h functions implicitly
> take the lock. Therefore API callers are unmodified.
>=20
> This means that:
> - all static functions become _locked, and call _locked functions
> - all public functions take the lock internally, and call _locked
>   functions
> - all public functions called internally by other functions in job.c will=
 have a
>   _locked counterpart, to avoid deadlocks (job lock already taken)
> - public functions called only from exernal files (not job.c) do not
>   have _locked() counterpart and take the lock inside
>=20
> job_{lock/unlock} is independent from real_job_{lock/unlock}.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*
>=20
> .Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h |  73 +++++-
>  job.c              | 607 +++++++++++++++++++++++++++++++--------------
>  2 files changed, 499 insertions(+), 181 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kQI9YxG1F3CIu5b4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD6ssACgkQnKSrs4Gr
c8jWDAf/WczzlZonA1/F3HO79vnWMzM66NbG0peCO2IHgHF6vi5p9x8/Kg0OdpHs
z3IqnY1mG8tNqznLibmRYtuua8OiJNyfPoRFyPT1gKLapEoyAR/f+Ie9IWKEWkxp
I+Nb9LWogZr10+zqvUhosQYIiqCRqtdaco7rmDQS6TEDMI36r/+aSsk1tEo1c4aR
xJVc5sGgJFTQ4nQHH+1izDv/Dystzs2jEJchjnhyGlmyAFVQcgnOggvJWnUBsyKW
0TP9s1I0VzYvwvNeacZ/WkZzbNdfeKGKsNPykBkogtQpP0PVqnQ15u8PPvwZg9TX
QXm673upb4YQA+JfMhzUcea3sDeYkg==
=1HrE
-----END PGP SIGNATURE-----

--kQI9YxG1F3CIu5b4--


