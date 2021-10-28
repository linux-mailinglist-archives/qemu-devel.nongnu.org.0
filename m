Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3B443E57D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:52:33 +0200 (CEST)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7hh-0003rq-1N
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mg7b0-0004k8-DY
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:45:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mg7au-0002Nu-Tk
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635435931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l0SVdw3t9clUwXDmMivcjUDA4SGMBGUPzmiqpgbp3QU=;
 b=U9cqzuxQKdjZ3oVUlmooD0XZDsZOS4vzILdXTytx9nLPGSyYtg/ApJt7BtWzWSuFxJCbDx
 mBRqSmCnGMUILaCam3q/3RUDfPB9u2oHUWKr6prG7pZ8iqOj26KZZAlXD9ochpAI+a3/5N
 TE2nJZQhEATqrQSM+Ueni3B1Of7S17Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-xttjBB9bOyivxLtMXbgB5w-1; Thu, 28 Oct 2021 11:45:27 -0400
X-MC-Unique: xttjBB9bOyivxLtMXbgB5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADDA38066F3;
 Thu, 28 Oct 2021 15:45:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF3D85DF5E;
 Thu, 28 Oct 2021 15:45:11 +0000 (UTC)
Date: Thu, 28 Oct 2021 16:45:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
Message-ID: <YXrFhq0XCUgb/WMu@stefanha-x1.localdomain>
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <5291fbc6-ac6c-8632-c3ba-ab1252ee7a28@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5291fbc6-ac6c-8632-c3ba-ab1252ee7a28@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q+Ze3zrQrkaahJCF"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Q+Ze3zrQrkaahJCF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 04:09:41PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 10/25/21 12:17, Emanuele Giuseppe Esposito wrote:
> [...]
>=20
> > Each function in the GS API will have an assertion, checking
> > that it is always running under BQL.
> > I/O functions are instead thread safe (or so should be), meaning
> > that they *can* run under BQL, but also in an iothread in another
> > AioContext. Therefore they do not provide any assertion, and
> > need to be audited manually to verify the correctness.
> >=20
> > Adding assetions has helped finding 2 bugs already, as shown in
> > my series "Migration: fix missing iothread locking".
> >=20
> > Tested this series by running unit tests, qemu-iotests and qtests
> > (x86_64).
> > Some functions in the GS API are used everywhere but not
> > properly tested. Therefore their assertion is never actually run in
> > the tests, so despite my very careful auditing, it is not impossible
> > to exclude that some will trigger while actually using QEMU.
> >=20
> > Patch 1 introduces qemu_in_main_thread(), the function used in
> > all assertions. This had to be introduced otherwise all unit tests
> > would fail, since they run in the main loop but use the code in
> > stubs/iothread.c
> > Patches 2-14 and 19-25 (with the exception of patch 9, that is an addit=
ional
> > assert) are all structured in the same way: first we split the header
> > and in the next (even) patch we add assertions.
> > The rest of the patches ontain either both assertions and split,
> > or have no assertions.
>=20
> This seems a lot of assertions added in hot-path code.
>=20
> Does it makes sense to use a BLOCK_ASSERT() macro instead,
> only expanded when configure with --enable-debug?

I think the assertions are only in the slow path (functions that must be
run with the BQL held from the main thread). The I/O request code path
does not have new assertions.

Stefan

--Q+Ze3zrQrkaahJCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF6xYYACgkQnKSrs4Gr
c8i8EAf/VuGroEvqOtM1HGaueE+8gJSUr0+WwYM+jYEhMfurwKlrZK1rE9uKxB3U
VMeypH+jXZREj1WXt4Xr6j6bu4O87GiJOBlmbfpPpFTHww+Rj4dfMefshuDkIDa8
6cL/3Km21zE6QfO+r68oo/KPXGYBFJURQFR1JkN1A3eMe+KBxJ3QGHF7IGG/8BjU
F8xDAVCuPyIb3NNXDgtkjzmJY6Ga/CU6dqzIlEB8T61LApkBpstiaHif8b4Na/sR
l/R1tUcarvhk4gfPZ+iUOnON0UQDtFKssrejAAgWhxKQNT9mXvzb6xnxFw6P8IYe
BMF6gHouZfMNy9yT/0JHlOkpwoKcVw==
=XwVN
-----END PGP SIGNATURE-----

--Q+Ze3zrQrkaahJCF--


