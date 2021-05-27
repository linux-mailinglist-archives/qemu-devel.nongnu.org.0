Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2955D39339B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:23:07 +0200 (CEST)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmImo-0007rS-0R
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIkR-0004ox-NT
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIiU-0006H1-Gl
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622132317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kHiQt5pzF9/uVtFs0u3CwVH9yKelTyBPZ925iX1bbX0=;
 b=LGN0eRrUnQzwh3qb2/KMePRHoE8vItnzlj/dTlYjKRHbSY3doTs/5HAvMyPjktnAOmv/9c
 /BfxTXrLQ5z0WUH9CyLKVavdWpIuYj7SqMNUv1gmXp5eQZFgI0XDeqYigpLqWITfOSxcVf
 QQOf8czRq35feWgmUNTcRmOFARgaXXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-SdOq6uFgPJykQMI-obW92g-1; Thu, 27 May 2021 12:18:34 -0400
X-MC-Unique: SdOq6uFgPJykQMI-obW92g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643835135;
 Thu, 27 May 2021 16:18:33 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 284585D6D3;
 Thu, 27 May 2021 16:18:33 +0000 (UTC)
Date: Thu, 27 May 2021 12:06:28 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 13/31] python: add MANIFEST.in
Message-ID: <20210527160628.GD1916721@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-14-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210526002454.124728-14-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:24:36PM -0400, John Snow wrote:
> When creating a source or binary distribution via 'python3 setup.py
> <sdist|bdist>', the VERSION and PACKAGE.rst files aren't bundled by
> default. Create a MANIFEST.in file that instructs the build tools to
> include these so that installation from these files won't fail.
>=20
> This is required by 'tox', as well as by the tooling needed to upload
> packages to PyPI.
>=20
> Exclude the 'README.rst' file -- that's intended as a guidebook to our
> source tree, not a file that needs to be distributed.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst  | 2 ++
>  python/MANIFEST.in | 3 +++
>  2 files changed, 5 insertions(+)
>  create mode 100644 python/MANIFEST.in
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCvw4QACgkQZX6NM6Xy
CfPAcBAAym8UWqli2ZwIhfKGanWPy1tQt3GoVch8GGTKqOCpT13xgEUi3nW+yXD4
DXLlwfWSkzfDW52OkpR/mvLlmI6my39D/wGFv9bebCaGd+WYF8dtlDkJkYM/C5ux
DCQVQHItle2GjKWoXo0HYMQdQr+Uy52VxeFtoro0kKFkMNHg/q7PgeKlso4zhUju
kg/rVQmE01B/crZcSpjNqHaRu472SpGSowb/aD/4Ph1yBtwJTY17VOiw6MWxHr/b
vQSXpd26x2Zv2wQYwUjJUEg9K3xfaiC8uCOxMyXd0r+2ZJTbyWvIzC80J2RZk0WX
j98GgF3d7bpWnUyo4JVTImXKPNzawCrRenRiyOv5GGhKDEsh9va9YeFQ7ThYc8D/
uytytkgX4DiB9t/ejn3JBJgyF2j6l4EAU7/d7Su0AFBl17Q7s1lFznZzZaOGpg71
5GZFJvyBq0x2nXGfra+gSxbJue/P+ni5O90fjbCmUmnvZYM6Or6rxZhMU0dbK08n
+v6i+IrZnP1YLdM1T8o/49goM+7V/KV2UTmF4O8O2vn1sjiILUdAXTJQkHiKE/um
jvT5zAVqJF1csvd+eYFuO7HzcjBph3m+NYEGsvUHI5LGLuFmbYvYFSBTNrNdpX1o
q08uA0u0r0kEoylyazK+kBEDgnrAhQ8apcrhZiaS16dDCkN07o0=
=OV6K
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--


