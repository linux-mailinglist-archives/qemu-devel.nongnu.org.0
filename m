Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB24D5AD1A6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:38:23 +0200 (CEST)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAQo-0003qD-OM
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVAFD-000344-CJ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVAFA-0000SD-5X
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662377178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=0v0zjpPWCGreuA6IcwkTdFVtHxJFEnDcZ+7OUgyipsM=;
 b=K7neYGi97ifD7XMwnzYPqheTMpnG0+5b7Cy1FQBgu1oMgaOcgkGN6KGDOtRe9SFuagt9Mw
 9/jmYTLDaxXaoz0FWPSrBWuxw7mZ+yyUGkHwjeeaCFsKGtWfzQNWUqAJEMJR+qd71gpBna
 NtnN/rnvKWYPdVSNdFeZFi8MpHIu1ps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-IeIoz4OlOCu1QaZkL56-eA-1; Mon, 05 Sep 2022 07:26:17 -0400
X-MC-Unique: IeIoz4OlOCu1QaZkL56-eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA09F803917
 for <qemu-devel@nongnu.org>; Mon,  5 Sep 2022 11:26:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ADA140B40C9;
 Mon,  5 Sep 2022 11:26:16 +0000 (UTC)
Date: Fri, 2 Sep 2022 13:20:28 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/4] chardev patches & a small audio fix
Message-ID: <YxI7XK2JJQyStCqZ@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mg+0kPGDBU3BfGSc"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--Mg+0kPGDBU3BfGSc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

To: =3D?utf-8?q?Marc-Andr=E9?=3D Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Daniel =3D?utf-8?q?P._Berrang=E9?=3D <berrange@r=
edhat.com>, bin.meng@windriver.com, , Gerd Hoffmann <kraxel@redhat.com>, St=
efan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 0/4] chardev patches & a small audio fix
In-Reply-To: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
References: <20220902131412.3125752-1-marcandre.lureau@redhat.com>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any =
user-visible changes.

--Mg+0kPGDBU3BfGSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMSO1wACgkQnKSrs4Gr
c8iqYwgAvIq0DOYPd9pDrHR/yUOL9i+gSP32onmq5fi7IDzV+6kwU/9AAM6wXkBm
xmGyEesFSb22U4zisWl2SD+Uw6N7bDV/nEq3MJ6+9PxlgZUGTU3xMxGRUnbKuES/
Crncz62SpJUma38YRJW4WH5bwf/AF020p9xnF9CUzyJZhJp296qF4o0D/fx7Q0AD
iRIw/DdJGAOqOUhkyW64cT0QY1kjqIXnRFOtEDrSo8UEzKbAULBYe7ZmjqO1j1zX
LiHNUyilOcX31JTEXERLxmcKVO5zSqSSGRPGCgL7x2Z0y/Azds0Bt13xU//Ssm4J
qme+x9mvd7VOrzrFlMsusoJ+alWKGw==
=6b8Z
-----END PGP SIGNATURE-----

--Mg+0kPGDBU3BfGSc--


