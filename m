Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C94779BE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:52:46 +0100 (CET)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtzp-0003TM-6b
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtyS-0002Bu-H4
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:51:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtyQ-0001Ep-2U
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639673477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ktON5f9t6VxCCwhF/oOFklYiJsf4InMDqGhCE6nF0w=;
 b=TLyOYjlKvc64pmLmeDyXzSwtkfsi8Zxwy2JGD5nYxeBI6461Z4CoaZpM8fl4Jz/repNMhP
 3vhztej0mqZp7uiO1PbMzHgAmiwNZ3G2GW7Ft1rpQdiELCdaZPRZjSL2kww6QFOY0ODhww
 u1S0a63tL2uFpXx08xVpa/SIzEeWCrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-T84-I911NDyhhmCIH80-xQ-1; Thu, 16 Dec 2021 11:51:14 -0500
X-MC-Unique: T84-I911NDyhhmCIH80-xQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F6C010144E1;
 Thu, 16 Dec 2021 16:51:11 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453EA795B0;
 Thu, 16 Dec 2021 16:51:11 +0000 (UTC)
Date: Thu, 16 Dec 2021 16:51:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 04/14] job.h: define unlocked functions
Message-ID: <Ybtuec4jDiPPgg4s@stefanha-x1.localdomain>
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104145334.1346363-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tjYUCgTTcndOpVxI"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tjYUCgTTcndOpVxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 10:53:24AM -0400, Emanuele Giuseppe Esposito wrote:
> All these functions assume that the lock is not held, and acquire
> it internally.
>=20
> These functions will be useful when job_lock is globally applied,
> as they will allow callers to access the job struct fields
> without worrying about the job lock.
>=20
> Update also the comments in blockjob.c (and move them in job.c).
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 21 +++++++++++
>  blockjob.c         | 20 -----------
>  job.c              | 88 ++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 107 insertions(+), 22 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--tjYUCgTTcndOpVxI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7bnkACgkQnKSrs4Gr
c8hvxgf9EcJyJRcM7EeJexZrgRuiDTWedAP9kpG6rTpNB/5tfBJCf1e+fVcfkPur
nvvQonEBaT+HXMijM4arFHUmNJrdbVZ3+IQygciHOD+iRZCVAn3ZUWauIe6hf6l3
qIBwrRn7QLwgclmx5Ze9arB5m23zYd/1owywt/EvmXXrKQMhUnLK90o6slj5ipCi
dfSly2dI5DOXvqqjKB4bElpKUK03x1APphpntOuBtNbpUllhQbAiPzing0sTfV7M
duAaPchJQZSrXFL5oLgsIWb3IPK34rTYl29DPU4Kfzq3ANBqLaTi9F71gPmkDmku
kr3BW2KbiBkgoPvH4RcneIaufbDDuA==
=CN8e
-----END PGP SIGNATURE-----

--tjYUCgTTcndOpVxI--


