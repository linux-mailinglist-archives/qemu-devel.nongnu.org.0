Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB04B275817
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 14:40:13 +0200 (CEST)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL44C-0003sd-4m
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 08:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kL41x-0002aD-UK
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 08:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kL41t-0006Cn-Do
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 08:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600864665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NWiBEumYpoNVIUPaKSKUgRBUNqXwy/Gg894XxdUVEBs=;
 b=SW3fMGb8MUb+cCKTLU0sz6jYywMFkdowCujKfVMogYpVtMOLq4oVbgJ/3QePP+05+nIb4K
 umZoq4B4UydfLwv8sbEgvJCoGeX1uhima8ynWASKy683/Ur5j41OPS5M1ahDL1TBoee9OY
 Q4vg8NnJNeGt6zGLxz0j/AWEH5BoEYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-jcZOM9fsPTmaiPWTZQfHCQ-1; Wed, 23 Sep 2020 08:37:43 -0400
X-MC-Unique: jcZOM9fsPTmaiPWTZQfHCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD318ECE4A;
 Wed, 23 Sep 2020 12:37:42 +0000 (UTC)
Received: from localhost (ovpn-113-77.ams2.redhat.com [10.36.113.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC2E25C1C7;
 Wed, 23 Sep 2020 12:37:41 +0000 (UTC)
Date: Wed, 23 Sep 2020 13:37:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v10 7/7] MAINTAINERS: Add vhost-user block device backend
 server maintainer
Message-ID: <20200923123740.GD51019@stefanha-x1.localdomain>
References: <20200918080912.321299-1-coiby.xu@gmail.com>
 <20200918080912.321299-8-coiby.xu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200918080912.321299-8-coiby.xu@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W5WqUoFLvi1M7tJE"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--W5WqUoFLvi1M7tJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 04:09:12PM +0800, Coiby Xu wrote:
> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3d17cad19a..55ad6abe73 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3039,6 +3039,14 @@ L: qemu-block@nongnu.org
>  S: Supported
>  F: tests/image-fuzzer/
> =20
> +Vhost-user block device backend server
> +M: Coiby Xu <Coiby.Xu@gmail.com>
> +S: Maintained
> +F: block/export/vhost-user-blk-server.c
> +F: util/vhost-user-server.c
> +F: tests/qtest/vhost-user-blk-test.c
> +F: tests/qtest/libqos/vhost-user-blk.c

I will send a patch to also include the header files and move them to
include/.

--W5WqUoFLvi1M7tJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9rQZQACgkQnKSrs4Gr
c8jnJwf/XWIOCjdkkOgzDaaWOBqYvYPD+iXFn3h+1fDoYgzqjfl46/T+JiNHhKNF
c98U0y6xsnJhrEvwn7RFdlKsn0iE5fMSJMaARKRxP/5T6D+7MhfBa8EcZCn4nSUZ
8wvzYO7iu78p0Lkc9pAKqUdbI9OEE5AepPgmAW82n5hmLZQRkE3gltEYH91d2WE5
UlProdBwticR8nlncR0LQ21+XEPQCjCpqMWgwGgY2pfLG60DzBXRRg1PVSIaZR+o
q+Zobg4JUdIbrxvCbByXhhxJ3izuGtNb6vHhvyuKkckCc8ObTWZ+2GUuHBbZT9uW
7UmJGou0baJS1ENO0Kv4D027tGSfDA==
=uIjY
-----END PGP SIGNATURE-----

--W5WqUoFLvi1M7tJE--


