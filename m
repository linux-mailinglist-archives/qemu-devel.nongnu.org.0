Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFC7533FE1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 17:05:52 +0200 (CEST)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsa7-0001Zl-3a
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 11:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntsHj-0004Ve-Uu
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntsHh-0007d7-Bc
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653490008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRsL3lDTeZ9hE3OVhfVEl8uh4Wxzfz1sgv8k+m0d22U=;
 b=eRyo6FIMlj7V6SnMZ9CYKxnvq884mznr+PUBn+6LQJurPhKszvjbvcD1AJn9rkwh/UhsRC
 8BsohF0tXg2n1Mu4WhhbTjVBeyKFF12evNlEXDkI45bNzCBcyhF6dPYCyCigqPzZiYGQMo
 n3UyaILCsxrWUg+tPv27CIW5tB68dZ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-54Mm4wmwPl2jAPyDTAuEQw-1; Wed, 25 May 2022 10:46:45 -0400
X-MC-Unique: 54Mm4wmwPl2jAPyDTAuEQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC9831D3236C;
 Wed, 25 May 2022 14:46:44 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EDA3400F38;
 Wed, 25 May 2022 14:46:43 +0000 (UTC)
Date: Wed, 25 May 2022 15:46:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 bleal@redhat.com, berrange@redhat.com, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 imammedo@redhat.com, peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v10 04/14] vfio-user: build library
Message-ID: <Yo5BUxZ0ibeM3tI/@stefanha-x1.localdomain>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <f131bc091fc6abcdc9faf1ab22a86a7413300d6a.1653404595.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mvmaQexMHLjO3WKc"
Content-Disposition: inline
In-Reply-To: <f131bc091fc6abcdc9faf1ab22a86a7413300d6a.1653404595.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


--mvmaQexMHLjO3WKc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 11:30:23AM -0400, Jagannathan Raman wrote:
> add the libvfio-user library as a submodule. build it as a meson
> subproject.
>=20
> libvfio-user is distributed with BSD 3-Clause license and
> json-c with MIT (Expat) license
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  configure                               | 17 +++++++++++++++++
>  meson.build                             | 23 ++++++++++++++++++++++-
>  .gitlab-ci.d/buildtest.yml              |  1 +
>  .gitmodules                             |  3 +++
>  Kconfig.host                            |  4 ++++
>  MAINTAINERS                             |  1 +
>  hw/remote/Kconfig                       |  4 ++++
>  hw/remote/meson.build                   |  2 ++
>  meson_options.txt                       |  2 ++
>  subprojects/libvfio-user                |  1 +
>  tests/docker/dockerfiles/centos8.docker |  2 ++
>  11 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 160000 subprojects/libvfio-user

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--mvmaQexMHLjO3WKc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOQVMACgkQnKSrs4Gr
c8glcQgAld2oEi9QY49vzSwhfnGfWB6OC52sa/fm84W5W6qdgB0jSZwkTKAZGp2r
i7SDOMGibvc1JNCVkDorq97+KsnBPieZZguuy/C1VnfcLVIgIDxct2G5X1abTzW6
1oIkRajEI8yVIwAu9hnE1Q57UxCa4cI3BUFGbr11TPERUVi889KGAUSD3NcJ9RGL
bzhgq45X9RmuwtBaNAhF1BLkA9afvsvqU2aAZ5idkgDC2oDlGzrHOkDT6xMVc9BP
bc87Kd2g4NWx/4IILS0sr67tPItox86XfvTdVpyzCXGaNObZuaAQIOU9mfcCA3Yr
BpQHuIAr8GQpCGCzOKqX3jCt/ymPTg==
=j3Mf
-----END PGP SIGNATURE-----

--mvmaQexMHLjO3WKc--


