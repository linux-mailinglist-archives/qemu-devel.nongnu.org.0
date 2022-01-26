Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E249CB4A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:47:52 +0100 (CET)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCieM-000164-SF
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:47:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiQP-0006OK-Er
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiQM-0006VK-17
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643204000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vxg1tDKpMXu8C93GE74j2iy/rhkpW2YMFy+QBRuKwAg=;
 b=Nw6TX68G80JqlMA8gvLMaTV3Cv2gnrUnlgEqhRd+BjjbYhvcEtPJgmxGBHRmifsY2mWKKu
 AqdDUTNEmwMbmBlP/duUQ0f/CVyMM5R/knJsgy7j4T0E3Ewz59WSKixQtQdjhrA6jC970e
 fjS39dRQjZeA3FC+8uWob3AhOaMLcPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-hlr8ODxMPoG5ye76Z3tBDg-1; Wed, 26 Jan 2022 08:33:19 -0500
X-MC-Unique: hlr8ODxMPoG5ye76Z3tBDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19A80190A7A5;
 Wed, 26 Jan 2022 13:33:18 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A28CE7D3D2;
 Wed, 26 Jan 2022 13:33:17 +0000 (UTC)
Date: Wed, 26 Jan 2022 13:33:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 6/7] meson: document, why we don't generate trace
 events for tests/ and qga/
Message-ID: <YfFNnM8QDMwlogIF@stefanha-x1.localdomain>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
 <20220125215655.3111881-7-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ny2NNkvCwUX+UKUN"
Content-Disposition: inline
In-Reply-To: <20220125215655.3111881-7-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Ny2NNkvCwUX+UKUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 10:56:54PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> Making trace generation work for tests/ and qga/ would involve some
> Meson hackery to ensure we generate the trace-events files before
> trace-tool uses them. Since we don't actually support tracing there
> anyway, we bypass that problem.
>=20
> Let's add corresponding comments.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qga/meson.build   | 8 ++++++++
>  tests/meson.build | 8 ++++++++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/qga/meson.build b/qga/meson.build
> index cfb1fbc085..79fcf91751 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -15,6 +15,14 @@ qga_qapi_outputs =3D [
>    'qga-qapi-visit.h',
>  ]
> =20
> +# We don't generate trace-events, just because it's not simple. For do i=
t,

s/For/To/

> +# we also should add .trace-events file into qga_qapi_outputs, and than

s/than/then/

> +# add corresponding element of qga_qapi_files into qapi_trace_events
> +# global list, which is processed than in trace/meson.build.

s/processed than/then processed/

> +# This means, that we'll have to move subdir('qga') above subdir('trace')
> +# in root meson.build. But that in turn will break the dependency of
> +# qga on qemuutil (which depends on trace_ss).
> +# So, resolving these dependencies and drop --no-trace-events is a TODO.
>  qga_qapi_files =3D custom_target('QGA QAPI files',
>                                 output: qga_qapi_outputs,
>                                 input: 'qapi-schema.json',
> diff --git a/tests/meson.build b/tests/meson.build
> index 3f3882748a..21857d8b01 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -31,6 +31,14 @@ test_qapi_outputs =3D [
>    'test-qapi-visit.h',
>  ]
> =20
> +# We don't generate trace-events, just because it's not simple. For do i=
t,
> +# we also should add .trace-events file into test_qapi_outputs, and than
> +# add corresponding element of test_qapi_files into qapi_trace_events
> +# global list, which is processed than in trace/meson.build.
> +# This means, that we'll have to move subdir('tests') above subdir('trac=
e')
> +# in root meson.build. But that in turn will break the dependency of
> +# tests on qemuutil (which depends on trace_ss).
> +# So, resolving these dependencies and drop --no-trace-events is a TODO.

Similar changes as those above.

I can do it when merging the patches.

>  test_qapi_files =3D custom_target('Test QAPI files',
>                                  output: test_qapi_outputs,
>                                  input: files('qapi-schema/qapi-schema-te=
st.json',
> --=20
> 2.31.1
>=20

--Ny2NNkvCwUX+UKUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxTZwACgkQnKSrs4Gr
c8j2mAf/SN69OT/47Sq8yj7EwRoiD6NCaRrh434tCI68NNIqf+W1kAX2lVLLJ+CL
llTqRnDcweUApIcb6AakIfuoZfU5ceZ+hmXJXg1ce6OQYEdTIMqPsGfO5O7Ti/Rk
xF0Uda3//Nl77NWu7StneBN+qCzcJNHWI/KnXz5EDTo91XBGRCTB8/n+p2laVrXJ
1Jr/YvD2SQLymqDqGhr8EbiNCO03JDxLeS+bICMx43Gbp65GdtojyWYgB+JQqtGB
qH1fni8e7cFgWbvjh6sAqlVt0yaBcr6OxPUoV43uTthg4YC1G9zSaE0hgbfykMLt
DnqspDyvplrwpgW48HLZX81OY9FizA==
=w45P
-----END PGP SIGNATURE-----

--Ny2NNkvCwUX+UKUN--


