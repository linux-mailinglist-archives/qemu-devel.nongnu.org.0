Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7D373EC9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:44:47 +0200 (CEST)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJhe-0007ss-0E
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leJbN-0000Lm-TJ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leJbG-0000th-RF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620229089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DYKVB6KObEGUK4SLyWjuDzX/saAZJ4G2Fi5D4l+hCKU=;
 b=SiKCEe/ngbTuWfw5SNMF9GfAyc5987EqUxyxc2RFCaZtLLp7/oIvRBoAGOv1IwDTxgtFbn
 MzP5b/Q91HvCnGBYtYtePw9ssWzk4jGl1cf5yyj3EX1WIL7NzuOr7BNQM49TJbFqqgP8VC
 Qm2IOguNF+g+CWIYadWWUqrf7X4D+v8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-6GjT82q-MLOhpJ_tp9eiNg-1; Wed, 05 May 2021 11:38:07 -0400
X-MC-Unique: 6GjT82q-MLOhpJ_tp9eiNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E166D25D
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:38:06 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3E8E5C3DF;
 Wed,  5 May 2021 15:38:02 +0000 (UTC)
Date: Wed, 5 May 2021 16:38:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 2/2] libvhost-user: fix -Werror=format= warnings with
 __u64 fields
Message-ID: <YJK72YzBwoLyTyK5@stefanha-x1.localdomain>
References: <20210505151313.203258-1-marcandre.lureau@redhat.com>
 <20210505151313.203258-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210505151313.203258-2-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aIsTRBK8hmsPzYwV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aIsTRBK8hmsPzYwV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 07:13:13PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> ../subprojects/libvhost-user/libvhost-user.c:1070:12: error: format =E2=
=80=98%lx=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=
=80=99, but argument 3 has type =E2=80=98__u64=E2=80=99 {aka =E2=80=98long =
long unsigned int=E2=80=99} [-Werror=3Dformat=3D]
>  1070 |     DPRINT("    desc_user_addr:   0x%016" PRIx64 "\n", vra->desc_=
user_addr);
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~              ~~~~~~~~~~=
~~~~~~~~~
>       |                                                           |
>       |                                                           __u64 {=
aka long long unsigned int}
>=20
> Rather than using %llx, which may fail if __u64 is declared differently
> elsewhere, let's just cast the values. Feel free to propose a better solu=
tion!
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Looks good to me:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--aIsTRBK8hmsPzYwV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSu9kACgkQnKSrs4Gr
c8iyLgf/TTLCk4/bM4p1BHk4W7qz/eqeRMZHeFskVwWtiZf+tT5pbsoy9tCRSQHY
dFhOR1c737Jul5bFLVQ3f02RuNKT6fg4llgoQtwjyn7xYfsPYLL6W5PPCMqZRPPI
2sXKweJ6nG+j0ubUKtupgyh2K0lHtCcLwDRH+RcpMydHkxUH3a1FE2HtkwYDLXsP
Igy9DeClvwnR68LAPMB4BMLq3XmdfKGLb/zTZLKFDVQ7IeCRVtBttO+PrLEv65Vu
kOQDqtYzGnplObPclFI56kFgS4aw7DM7IrWvNlD/ov3gQ8h6l0HblJlcNN+T1fNw
2zhqxUPaPOXil6BAeUbR9X/Ki5edWw==
=DMIy
-----END PGP SIGNATURE-----

--aIsTRBK8hmsPzYwV--


