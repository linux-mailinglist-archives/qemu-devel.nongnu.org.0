Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301573BBD58
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:09:28 +0200 (CEST)
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OLn-0001M0-8j
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0OJA-0005px-Rw
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0OJ9-0000Ho-Dy
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625490402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HWD88MvHZOz9mpoQJSBU6k4lC7HHyLPTsIOIRcudWEI=;
 b=DZiECWSlRsDhyJ8Z2hpY5F4rrtDudoENHlW47SI2bDgqo2RoYxGq9ddRInrBi9iRv/nNlw
 6hsjKI4QrHwRap28qRFK55xBwdUuPmrMsZy6XeILTtDyI8lx9tGT+c2VC3ym81XN4uXi7f
 vzyzlJPlVLRk+kKZE5G8LDhamOK03EY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-77bSslaSNBSIDbqVOn3Y0g-1; Mon, 05 Jul 2021 09:06:41 -0400
X-MC-Unique: 77bSslaSNBSIDbqVOn3Y0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 252FC100C610;
 Mon,  5 Jul 2021 13:06:40 +0000 (UTC)
Received: from localhost (ovpn-114-164.ams2.redhat.com [10.36.114.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 254BC5D6A1;
 Mon,  5 Jul 2021 13:06:32 +0000 (UTC)
Date: Mon, 5 Jul 2021 14:06:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
Subject: Re: [PATCH] virtiofsd: Add missing newline in error message
Message-ID: <YOMD2MDCnAldXrpk@stefanha-x1.localdomain>
References: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LL0/I8q/dx+943mx"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LL0/I8q/dx+943mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 01, 2021 at 11:11:48PM +0200, Hubert Jasudowicz wrote:
> From: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
>=20
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LL0/I8q/dx+943mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDjA9gACgkQnKSrs4Gr
c8i+HwgAm0xd5X4oReKA7/EAR+jBmX6tGv0IzOXqoxZWR6CbrumSTRyumtKy3O+A
6yhafUHsFqEXxrXH2b9HFQ3bpGGaAqeRBO36wWSRSCWYG1ApjjDA211RBwce1NxV
8E2uJbRkoOhFXjsPIBJNnKCrxT3ICNVwTktxEqzMiLzku0+yvU8Hmd97eID8stTG
QEB3RMiGJ6dDJpjuhe3uQCrArr4F5FtwWyViYaSdscoXhGrbgfYgDwSXbYissFiU
I9Bq31mmnVNqyUAlZF/JtKoI1GhmShKbQbvWyCd1Wut6nWoALifai8UhzoemVbfM
XzYHYOHpDTqUHOHH0CKlWvQTdOyWqg==
=Qa93
-----END PGP SIGNATURE-----

--LL0/I8q/dx+943mx--


