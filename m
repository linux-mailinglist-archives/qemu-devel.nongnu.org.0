Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C2332AED
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:46:56 +0100 (CET)
Received: from localhost ([::1]:33434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeZT-0004Mz-VV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJeRp-0003EM-CI
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJeRl-0003Qb-QY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615304337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DLhIoQVa11gRPqErcsdUE6PIk1VfueyId0W7JyOrJoI=;
 b=BCeQq9VD/CGAmwpHHibQvO7Hx6Rt0v6KsX1VqN8cgevRNbjMsOg+G2wK29uBtqDUz1feV7
 qjHIFmitz+8ul/xg5UUTrOa0XFqNMg11e5x4d5cVCmcJ++Md6U2Adj6dFhQCyCwvAtoOAH
 Rq1BRFJ3BjCfL9XB0XPRzaH4rM0STOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-wYATtotPP92mQcX4R7yxRA-1; Tue, 09 Mar 2021 10:38:53 -0500
X-MC-Unique: wYATtotPP92mQcX4R7yxRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66AD883DD21;
 Tue,  9 Mar 2021 15:38:52 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 119F05D9CD;
 Tue,  9 Mar 2021 15:38:51 +0000 (UTC)
Date: Tue, 9 Mar 2021 15:38:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH] coroutine: add libucontext as external library
Message-ID: <YEeWimKd1QVd176N@stefanha-x1.localdomain>
References: <20210309032637.41778-1-j@getutm.app>
MIME-Version: 1.0
In-Reply-To: <20210309032637.41778-1-j@getutm.app>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xun/5BWfXN2lU6j6"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xun/5BWfXN2lU6j6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 07:26:36PM -0800, Joelle van Dyne wrote:
> iOS does not support ucontext natively for aarch64 and the sigaltstack is
> also unsupported (even worse, it fails silently, see:
> https://openradar.appspot.com/13002712 )
>=20
> As a workaround we include a library implementation of ucontext and add i=
t
> as a build option.
>=20
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure                 | 21 ++++++++++++++++++---
>  meson.build               | 12 +++++++++++-
>  util/coroutine-ucontext.c |  9 +++++++++
>  .gitmodules               |  3 +++
>  MAINTAINERS               |  6 ++++++
>  meson_options.txt         |  2 ++
>  subprojects/libucontext   |  1 +
>  7 files changed, 50 insertions(+), 4 deletions(-)
>  create mode 160000 subprojects/libucontext
>=20
> diff --git a/configure b/configure
> index 34fccaa2ba..5f225894a9 100755
> --- a/configure
> +++ b/configure
> @@ -1773,7 +1773,7 @@ Advanced options (experts only):
>    --oss-lib                path to OSS library
>    --cpu=3DCPU                Build for host CPU [$cpu]
>    --with-coroutine=3DBACKEND coroutine backend. Supported options:
> -                           ucontext, sigaltstack, windows
> +                           ucontext, libucontext, sigaltstack, windows

This approach mixes the concept of the coroutine backend (ucontext,
sigaltstack, etc) with the optional libucontext library dependency.

libucontext is not a coroutine backend. The patch had to introduce
$coroutine_impl in addition to $coroutine in order to work around this.
Let's avoid combining these two independent concepts into
--with-coroutine=3D.

I suggest treating libucontext as an optional library dependency in
./configure with explicit --enable-libucontext/--disable-libucontext
options. Most of the time neither option will be provided by the user
and ./configure should automatically decide whether libucontext is
needed or not.

> +case $coroutine in
> +libucontext)
> +  git_submodules=3D"${git_submodules} subprojects/libucontext"
> +  mkdir -p libucontext

Why is this mkdir necessary?

--xun/5BWfXN2lU6j6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBHlooACgkQnKSrs4Gr
c8gFqAf+PZ8PVTJzfsN8i0V7W7ewgJ6pOo8tCtRQJj5QNpxyksBgDXlSF60THfql
UPKwnfD9FVOPY6Opz/iSUwFCyK8eptb1IulWL/LBpVYmzBWbx5voh+hxgtX2WnVG
A7W/A2HFsOe+XwBwnCZNISh1HD+P3px8bQgWa8mrVHy7ZfK4zEKnzRJc9CcEzgF+
ynft3r0kmzmcHJ4+pBpdXwRnDCOpprHDTutkrfLLsBlC47l55q/MLOkXBlq4JG6F
4ycmVhCM3IwGQ0v9clUiof/ZrA4Mm7RiVjx8IAMlr2gHC2jFFIpdMJtFykvjnLLV
r1ND2nqmeGZe9uS4inposT9u+pHYig==
=fDr6
-----END PGP SIGNATURE-----

--xun/5BWfXN2lU6j6--


