Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E8D566F0E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:16:25 +0200 (CEST)
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8iPf-0004z1-Ot
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8iLf-00010m-Ll
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:12:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8iLd-0008JB-Ge
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657026732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BF6G+AJETpdrjE4nK5tRQBYaz67ztRNgEqXigPdaXAk=;
 b=E76kBDt6Zo4AIQMHb4YRovUUEUjxdDQ2PtHOIhlNwfGfb+0iiZQjYuTAFTMdcZnlLzhgjX
 wm4zUJ70kHoBk3gXWJ1J8Wzpqf/qa0lqt2yQAikfF7ZWUnilwp0Q/+InSvNU15drf0rLOc
 /P2mmEqevMN/3RqKU+SwSILxjTwr6kI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-mfDX1tICNECytDfdURdFCA-1; Tue, 05 Jul 2022 09:12:09 -0400
X-MC-Unique: mfDX1tICNECytDfdURdFCA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D4A0804196;
 Tue,  5 Jul 2022 13:12:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAA7B416390;
 Tue,  5 Jul 2022 13:12:08 +0000 (UTC)
Date: Tue, 5 Jul 2022 14:12:07 +0100
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
Subject: Re: [PATCH v8 00/20] job: replace AioContext lock with job_mutex
Message-ID: <YsQ4p9axPUYqxGuz@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="di1kLfqzpYP5+ORJ"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--di1kLfqzpYP5+ORJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:18AM -0400, Emanuele Giuseppe Esposito wrote:
> In this series, we want to remove the AioContext lock and instead
> use the already existent job_mutex to protect the job structures
> and list. This is part of the work to get rid of AioContext lock
> usage in favour of smaller granularity locks.
>=20
> In order to simplify reviewer's job, job lock/unlock functions and
> macros are added as empty prototypes (nop) in patch 1.
> They are converted to use the actual job mutex only in the last
> patch. In this way we can freely create locking sections
> without worrying about deadlocks with the aiocontext lock.
>=20
> Patch 2 defines what fields in the job structure need protection.
> Patches 3-6 are in preparation to the job locks, moving functions
> from global to static and introducing helpers.
>=20
> Patch 7-9 introduce the (nop) job lock into the job API and
> its users, and patches 10-13 categorize respectively locked and
> unlocked functions in the job API.
>=20
> Patches 14-17 take care of protecting job->aio_context, and
> finally patch 18 makes the prototypes in patch 1 use the
> job_mutex and removes all aiocontext lock at the same time.
>=20
> Tested this series by running unit tests, qemu-iotests and qtests
> (x86_64).
>=20
> ---
> v8:
> * reorganize patch ordering according with Vladimir proposal
> * minor nitpicks

I have posted some comments but I didn't spot any major issues.

Stefan

--di1kLfqzpYP5+ORJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLEOKcACgkQnKSrs4Gr
c8g5kQgAyMLeZVTM96kr2qb1XWJz0rHCVjsMrfZlz8ILukkN/i2+PqhgXukMIZbW
lZZ129n5Fe4WPdsaeMnc970nsvUyCEeH60Y9lEAWhKy+k+PAFEDGa/0tycCcXktl
19K4h1BkPXrMshDO3GWEs0iXwa2pr2UtYVUXQxWa979sEwVTuz5HNcEO6emCjHW2
cwujUCO4Ivw4AwRXwiojaVZyq9PlYXMHBHJcW9UyPl7/2V9EO8Orgmf7tDO2OPhW
SILYwLkPv7wMQ3rggqHh9I3RZTPoDJp57Gybm7mibCUaQnHvsP2H1aqjf4D/0Ujl
ScLxppM1dgCNMWRSPg96fw1NztbYyA==
=JE/T
-----END PGP SIGNATURE-----

--di1kLfqzpYP5+ORJ--


