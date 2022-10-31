Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D766138B7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 15:07:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opVQz-00055a-GY; Mon, 31 Oct 2022 10:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opVQx-00055P-DH
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:06:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opVQv-0005fA-MB
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667225192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+RMrBdc37Uu9H7C0wxbJPm3mWBmSeoZsi9hrT3mJUAA=;
 b=dcO8uCXzdg9nZI4YHlIxZa/UaVv8i6GbCttbf3oFef4oIKEiYW2kjzeOHGHxXQuU7Vhv2I
 mwmBtBpegQnVYaF5/SbiPoZHe4l08Oe+TYYjzqqTp+iVdNJrhiLhe8o0/krqh9Y4J5Vm3j
 HBcY2+oLaEKKwItNOqKuH9tpeMu6VbA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-lBgw8OWiP9KiXHNXEvAAkA-1; Mon, 31 Oct 2022 10:06:30 -0400
X-MC-Unique: lBgw8OWiP9KiXHNXEvAAkA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3A27101E14C;
 Mon, 31 Oct 2022 14:06:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF8E40C6EC6;
 Mon, 31 Oct 2022 14:06:28 +0000 (UTC)
Date: Mon, 31 Oct 2022 10:06:27 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] net/vhost-vdpa.c: Fix clang compilation failure
Message-ID: <Y1/WY6MnQxKRZCvb@fedora>
References: <20221031132901.1277150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KHXxTLGXfpoQl+PK"
Content-Disposition: inline
In-Reply-To: <20221031132901.1277150-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--KHXxTLGXfpoQl+PK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 01:29:01PM +0000, Peter Maydell wrote:
> Commit 8801ccd0500437 introduced a compilation failure with clang
> version 10.0.0-4ubuntu1:
>=20
> ../../net/vhost-vdpa.c:654:16: error: variable 'vdpa_device_fd' is
> used uninitialized whenever 'if' condition is false
> [-Werror,-Wsometimes-uninitialized]
>     } else if (opts->has_vhostfd) {
>                ^~~~~~~~~~~~~~~~~
> ../../net/vhost-vdpa.c:662:33: note: uninitialized use occurs here
>     r =3D vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>                                 ^~~~~~~~~~~~~~
> ../../net/vhost-vdpa.c:654:12: note: remove the 'if' if its condition
> is always true
>     } else if (opts->has_vhostfd) {
>            ^~~~~~~~~~~~~~~~~~~~~~~
> ../../net/vhost-vdpa.c:629:23: note: initialize the variable
> 'vdpa_device_fd' to silence this warning
>     int vdpa_device_fd;
>                       ^
>                        =3D 0
> 1 error generated.
>=20
> It's a false positive -- the compiler doesn't manage to figure out
> that the error checks further up mean that there's no code path where
> vdpa_device_fd isn't initialized.  Put another way, the problem is
> that we check "if (opts->has_vhostfd)" when in fact that condition
> must always be true.  A cleverer static analyser would probably warn
> that we were checking an always-true condition.
>=20
> Fix the compilation failure by removing the unnecessary if().
>=20
> Fixes: 8801ccd0500437 ("vhost-vdpa: allow passing opened vhostfd to vhost=
-vdpa")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Stefan, do you want to apply this directly as a build fix?
> ---
>  net/vhost-vdpa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to the staging tree:
https://gitlab.com/qemu-project/qemu/commits/staging

Stefan

--KHXxTLGXfpoQl+PK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNf1mMACgkQnKSrs4Gr
c8iXTgf+KEogzUtLexTfLKHgfd6lD7aIxEMcO57v5weeCGYEmB7huvYvrXdfldXA
lW6s3cm5i8ikjhpTx3K3d1ZQkCKUOsYq9e3a+0whs2D5Xzgn5fE+rlHL9q/djCke
Xh8DSloq+5+PpipnKid0GDiBWhjKAF7RVT4VwMhNMInjtmrm0SdL3PCaFzH1VPF1
ZCC6SmPPbxLApRZC2e3fsZjJj4HD907W2mQYUmiiYIsjcLrWvUbiSUi6mWdc/489
xn+CVBlV9Ql7kxKVjXSUN74lpr0he9GfC7a8yZ/xgVtM/FaCVLEmpV/TJE1jL1N1
84N4JwRc3koCoqWMKTJS1G2kxU4oyA==
=oMsp
-----END PGP SIGNATURE-----

--KHXxTLGXfpoQl+PK--


