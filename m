Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC24D9815
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:51:06 +0100 (CET)
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3pX-00021P-Er
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:51:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU3mx-00017Z-IO
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU3mu-0007Bl-CS
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647337699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ktM6yPCPCaPJdJ9h4oMnInTTHloaPsZH19Hf8S2Io2w=;
 b=MbkC8BA+Ie1ML4GKkiNeC2vc8aDPGIzKAOTcOJ9+tQ9kDHopGYsQnl5sjN/TeUZOL4ESYK
 Agc2wVggULIueub7RIeeeR32KjTgjSDTDhWgcoSoOn/8Px13sNKh0z/FJZmiOYLlFv2lwG
 Ppqd2DVVwl7hCJt20N7Gvwg9JsBU0kI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-pUOsAovkN5Gb3xi19u2_Uw-1; Tue, 15 Mar 2022 05:48:15 -0400
X-MC-Unique: pUOsAovkN5Gb3xi19u2_Uw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8217E3C025D8;
 Tue, 15 Mar 2022 09:48:15 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 134CF401E3B;
 Tue, 15 Mar 2022 09:48:14 +0000 (UTC)
Date: Tue, 15 Mar 2022 09:48:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 3/6] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
Message-ID: <YjBg3QnSnpY2cAdL@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-4-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="15f2rFp5IDK+UVUo"
Content-Disposition: inline
In-Reply-To: <20220215105943.90-4-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--15f2rFp5IDK+UVUo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:59:40PM +0800, Xie Yongji wrote:
> VDUSE [1] is a linux framework that makes it possible to implement
> software-emulated vDPA devices in userspace. This adds a library
> as a subproject to help implementing VDUSE backends in QEMU.
>=20
> [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  meson.build                                 |   15 +
>  meson_options.txt                           |    2 +
>  scripts/meson-buildoptions.sh               |    3 +
>  subprojects/libvduse/include/atomic.h       |    1 +
>  subprojects/libvduse/libvduse.c             | 1152 +++++++++++++++++++
>  subprojects/libvduse/libvduse.h             |  225 ++++
>  subprojects/libvduse/linux-headers/linux    |    1 +
>  subprojects/libvduse/meson.build            |   10 +
>  subprojects/libvduse/standard-headers/linux |    1 +
>  9 files changed, 1410 insertions(+)
>  create mode 120000 subprojects/libvduse/include/atomic.h
>  create mode 100644 subprojects/libvduse/libvduse.c
>  create mode 100644 subprojects/libvduse/libvduse.h
>  create mode 120000 subprojects/libvduse/linux-headers/linux
>  create mode 100644 subprojects/libvduse/meson.build
>  create mode 120000 subprojects/libvduse/standard-headers/linux

Please update the ./MAINTAINERS file when adding new source files.

--15f2rFp5IDK+UVUo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIwYN0ACgkQnKSrs4Gr
c8hlSAgAgRHnu4WtuIv3GvAbwb4pCiF2Dn9es5enuqXZg5QfeR1VjZSUjcWTgZDW
bGC4FuUBEwOLKnnPVjiuah1vVpkFLydkZjhMU7tGwh8j95Oq4BreoAG0Y7LUOZIC
kamLK2AqJAE2zHD/yUbCufQVXwlts77SQnMyxqinqM0vKNfOf6ouSuQApkUvOd/B
TemikaNeixlGT9W+piXFXXN5xqjz+MX7JN7uz50paXexkNUWNI7oJFVfvF5Mww/d
hvaG0GnKTNF3LRF6y03vGZVY7jQ61OZbiE13oWKHNJ1PH2t/spLCHCXsI5Jn6dD7
rmRuOHE8VHMgeYKTGX4caAgiQ9zJwg==
=L/IX
-----END PGP SIGNATURE-----

--15f2rFp5IDK+UVUo--


