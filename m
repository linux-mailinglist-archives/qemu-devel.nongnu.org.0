Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF55449C7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:14:27 +0200 (CEST)
Received: from localhost ([::1]:37628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzG7O-0003YD-DA
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzEWr-0004Wu-LK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzEWp-0001FM-I7
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654767154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a03Z8f93cjy4c/7Er2IuKRmVI1i6P0DuQsYQIYX/QVs=;
 b=aq+2ltuB8awZuvip8HF2AvBgYtUcNoNXpf0L0FlZf5HIcLaMsSoxaemgnICxYYya/gNzS7
 viWxP1zZL+Rz6ZApnGdN5wYKz/zaq9tFaJ3ANa/spa9963Bmyd28wTKbinH2oPWbhPQ3Es
 PK6+p+MMmSotIizwFvhB+MCqAuoeYTI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-vR7nz3WPOA2MJ58oeZmGrA-1; Thu, 09 Jun 2022 05:32:31 -0400
X-MC-Unique: vR7nz3WPOA2MJ58oeZmGrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C767B85A580;
 Thu,  9 Jun 2022 09:32:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20CBF40CFD0A;
 Thu,  9 Jun 2022 09:32:30 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:32:28 +0100
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
Subject: Re: [PATCH v6 05/18] job.h: add _locked duplicates for job API
 functions called with and without job_mutex
Message-ID: <YqG+LJfa8NEB/4Ct@stefanha-x1.localdomain>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9liUpvK59afs1AQO"
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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


--9liUpvK59afs1AQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 09:36:54AM -0400, Emanuele Giuseppe Esposito wrote:
> In preparation to the job_lock/unlock usage, create _locked
> duplicates of some functions, since they will be sometimes called with
> job_mutex held (mostly within job.c),
> and sometimes without (mostly from JobDrivers using the job API).
>=20
> Therefore create a _locked version of such function, so that it
> can be used in both cases.
>=20
> List of functions duplicated as _locked:
> job_is_ready (both versions are public)
> job_is_completed (both versions are public)
> job_is_cancelled (_locked version is public, needed by mirror.c)
> job_pause_point (_locked version is static, purely done to simplify the c=
ode)
> job_cancel_requested (_locked version is static)
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 25 +++++++++++++++++++++---
>  job.c              | 48 ++++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 64 insertions(+), 9 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9liUpvK59afs1AQO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKhviwACgkQnKSrs4Gr
c8jzAgf7Bvs6X9UzxA+QHnJaFJePctzg0IJ9EKg74ULraNDufRWV3FweDW2anp19
/7kSeGrJfaKLcFU9i7RvlqxCC3xDTKdiwJiIHUBgp8gAQrLZwkc1Ew7obIao6FL+
MyL7ZJUXKSJedD40sTl9m8r2R9we9ewaak122ijBD2j4x1rVlwsbUaUv/WUXe8qr
n6zoVYWPBGEss6HTDakznRHGnldnqZe9mrWBHElB79m7IBcpJ/Hl3wzlza8NLS66
gW8RAUVzjEReMmmnVZoUUWPqf+6EEeTBeyP7zo86l1w8Fmz1Wu5DibmLFnY37xd/
ifCKauoCe6nY6zBAs9mP6wSKPF2M/g==
=raYZ
-----END PGP SIGNATURE-----

--9liUpvK59afs1AQO--


