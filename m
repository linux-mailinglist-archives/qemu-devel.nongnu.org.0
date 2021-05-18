Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED34387C73
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:28:25 +0200 (CEST)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1dv-0005mm-UR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lj1Q2-0007UD-Rg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lj1Pz-0003AN-TJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621350839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8bZEN8Vu8uOVpjl+VJPeD6SRZqZiykaC2lW0W50jco=;
 b=NEsk5+da7RDIvPRTiT9etG3kM7CXdUQZfx6bzJIfGFXod9Vq+Nsmlk6JTB1jUyAl62j3ij
 tjuROj9Fn23xfzRRyGNa+44KAiH4xyCNhosI57kMcDWD6dCaPFL71bdbPPlf7se4n7+GTq
 T+cUQbjg0ZfjKZtKg1go3n+DljeyMco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-gAG5So4-PU6JUUWvBo7deA-1; Tue, 18 May 2021 11:13:57 -0400
X-MC-Unique: gAG5So4-PU6JUUWvBo7deA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C7C0106B43C;
 Tue, 18 May 2021 15:12:57 +0000 (UTC)
Received: from localhost (ovpn-115-22.phx2.redhat.com [10.3.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F54E1349A;
 Tue, 18 May 2021 15:12:47 +0000 (UTC)
Date: Tue, 18 May 2021 11:12:22 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 03/25] python: create utils sub-package
Message-ID: <20210518151222.GG917386@amachine.somewhere>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-4-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nhYGnrYv1PEJ5gA2"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nhYGnrYv1PEJ5gA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:19PM -0400, John Snow wrote:
> Create a space for miscellaneous things that don't belong strictly in
> "qemu.machine" nor "qemu.qmp" packages.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/__init__.py           |  8 --------
>  python/qemu/utils/__init__.py             | 23 +++++++++++++++++++++++
>  python/qemu/{machine =3D> utils}/accel.py   |  0
>  tests/acceptance/avocado_qemu/__init__.py |  4 ++--
>  tests/acceptance/virtio-gpu.py            |  2 +-
>  tests/vm/aarch64vm.py                     |  2 +-
>  tests/vm/basevm.py                        |  3 ++-
>  7 files changed, 29 insertions(+), 13 deletions(-)
>  create mode 100644 python/qemu/utils/__init__.py
>  rename python/qemu/{machine =3D> utils}/accel.py (100%)
>=20

As you mentioned in the previous patch notes, I would not mind a
squash here.  Either way:

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--nhYGnrYv1PEJ5gA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCj2VMACgkQZX6NM6Xy
CfPGKQ/+MObPIZVad9a/k5x0QJLYIuWs0uAGYmnWwz2DPq+RK5tpdtbBZraf8Lrz
8EPVivaKPx1CfzKbyr5wHW+7rpXvD02gbrVvdcgC0Q6EtqJtRWEfGEhBbu7bANJ0
sTXennlArGx+2E5fnxpQfDqjvOPifEDwz1DVTt1myjt26whlzzCyPxDBt8PpUEiN
SIn2+fc9tgXVqC/6lkl862EBoaAlQK7n/i8EfsCS+dTakDvhXcpe74ciVoGDvOQR
3ukuWxWtsy47EgX7lwfGX+OtECsmqHst2BztoGlkWIZjNqB00jBUidIp9Sqwh3H7
Kg06foy2ZmIFiOjh4Ph1qxrt4WhA5J1JPzbLti31gg1EuIng6r5iFYP/NYvlH093
4WCp2su6Gjan6S6cXNdsGZQJSLXs6U0sZgyryYN0mbalD27s9YqNU7vC9qcCnEsJ
LMmd1b9FclY5RZNKUtKY9lX7UBUc77hP4ceugw3m4VNsTp+6q0aqlvnmrj8lF3o6
xFqWFDDzPeyVK4nTwOx/ZO214qiSYDCB280QIYubZ6myfygYyRIzTF2rknEph2iY
A6qspR/emjS9KlO4kEMtRlke8wzJ4eP9FdEWVH12KFrDKL8Hx+r8BxBsADpw7CbZ
2rWIveLFBn2lVwMIRHmRk58JwezZl08/KZSnL7aDEJQvYSuu1Gs=
=Mdls
-----END PGP SIGNATURE-----

--nhYGnrYv1PEJ5gA2--


