Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2629D4F76C8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 09:06:10 +0200 (CEST)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncMDY-0004Mf-Kl
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 03:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ncM9m-0002wl-Ii
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ncM9k-00052f-8D
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649314931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9l+7rW+io/VoQ5ijag9D5EK2/LySQvTLVb5hesP4gdk=;
 b=GqffxKHYi00DPcB1E4a7rkOfLJNuNgXimKclcWLnxpIB7mwPL/ia8dekbpXxudhGqyyZZ1
 0ia3TVVCyLC0/eI3/V8BlAP4KBnao8ky4+jEJCpG1j2f17Uy0rzVVLi7mZTf89Yxtc/bl1
 an1teoZXD9ZI21myAiRiaF2hW8poJjU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-YsPgzRXCPLiIq-vP0T19bw-1; Thu, 07 Apr 2022 03:02:07 -0400
X-MC-Unique: YsPgzRXCPLiIq-vP0T19bw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFD681C09411;
 Thu,  7 Apr 2022 07:02:06 +0000 (UTC)
Received: from localhost (unknown [10.39.192.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5577A40CF91D;
 Thu,  7 Apr 2022 07:02:06 +0000 (UTC)
Date: Thu, 7 Apr 2022 08:02:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] tests/qtest: properly initialise the vring used idx
Message-ID: <Yk6MbW5URDLxWMcX@stefanha-x1.localdomain>
References: <20220406173356.1891500-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9TlG6ZtgWDDWP1Rb"
Content-Disposition: inline
In-Reply-To: <20220406173356.1891500-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9TlG6ZtgWDDWP1Rb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 06:33:56PM +0100, Alex Benn=E9e wrote:
> Eric noticed while attempting to enable the vhost-user-blk-test for
> Aarch64 that that things didn't work unless he put in a dummy
> guest_malloc() at the start of the test. Without it
> qvirtio_wait_used_elem() would assert when it reads a junk value for
> idx resulting in:
>=20
>   qvirtqueue_get_buf: idx:2401 last_idx:0
>   qvirtqueue_get_buf: 0x7ffcb6d3fe74, (nil)
>   qvirtio_wait_used_elem: 3000000/0
>   ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: ass=
ertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>   Bail out! ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used=
_elem: assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>=20
> What was actually happening is the guest_malloc() effectively pushed
> the allocation of the vring into the next page which just happened to
> have clear memory. After much tedious tracing of the code I could see
> that qvring_init() does attempt initialise a bunch of the vring
> structures but skips the vring->used.idx value. It is probably not
> wise to assume guest memory is zeroed anyway. Once the ring is
> properly initialised the hack is no longer needed to get things
> working.
>=20
> Thanks-to: John Snow <jsnow@redhat.com> for helping debug
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  tests/qtest/libqos/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)

Nice work!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9TlG6ZtgWDDWP1Rb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJOjG0ACgkQnKSrs4Gr
c8iQwwgAvQo9meC4zwx1Q3c0jU7SQrhX/lId6C6+XgiNZCrWNeyBh4bLj7MX2ykD
5PKI7T414A23pzk9zLFIye+vBfLNZPmE2dq2e2bKL4xNOEjCyE0npIlniAXDJbTc
xar1qaRVm1MUVGEcX43SeA9DhFKwdQZw8ytVSCuqWQZsPF/9EfbFItwSADRdEqhD
mPGCFyL3rE/wAyAQR46Qp2r2CmFyL9yfcWuJBi1iyks4NQqrIYPJROctPtWIuG18
MEkibR2hp4u7WNMGmo8PYNoaaZzYg2FLJyV4qbNbxtWd7iKZMkYuhoghLL1PyvGv
BD1SQ2dAAn2DXkCd98D7o8451xfS/g==
=Fty/
-----END PGP SIGNATURE-----

--9TlG6ZtgWDDWP1Rb--


