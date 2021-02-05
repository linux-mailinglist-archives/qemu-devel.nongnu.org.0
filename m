Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EA310DCA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:23:09 +0100 (CET)
Received: from localhost ([::1]:43050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83sy-0004cc-Oc
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l83rA-0003Yr-He
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l83r8-00042Z-R6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612542074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=15BM6yRBZdJaGNpiiPCXgi04vM4Jngcn1DUmP4OPTPI=;
 b=T/cybhSfVqdJ/ak3E4+5sY1Vh/k0XcqerzFkY5Q5WJr0dCgSQYnl3xJXiMZ9zVAjDHCG1H
 joeOFuesB+Q1NnLSHIQGYn6wC6m3dTYwSTjSgEMQIQR0r44dbZRiO8ysZKIlRk6NV/V0x/
 4unDvIaDGSUuwsY2v1j4s1Y5aPT4FJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-Yvcn6YYWP9WXw370Sj2U-A-1; Fri, 05 Feb 2021 11:21:10 -0500
X-MC-Unique: Yvcn6YYWP9WXw370Sj2U-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21221CE650;
 Fri,  5 Feb 2021 16:21:08 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 506D26CDA9;
 Fri,  5 Feb 2021 16:21:06 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:21:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/27] Block patches
Message-ID: <20210205162105.GB416527@stefanha-x1.localdomain>
References: <20210204154327.386529-1-stefanha@redhat.com>
 <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 05:35:31PM +0000, Peter Maydell wrote:
> On Thu, 4 Feb 2021 at 15:43, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The following changes since commit db754f8ccaf2f073c9aed46a4389e9c0c208=
0399:
> >
> >   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-202102=
02' into staging (2021-02-03 19:35:57 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >
> > for you to fetch changes up to abe42229db7b87caa11b3c02835ebf9d384e0bd4=
:
> >
> >   docs: fix Parallels Image "dirty bitmap" section (2021-02-04 15:17:10=
 +0000)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > v2:
> >  * Rebase to resolve memory_region_init_ram_from_file() conflict due to=
 the new
> >    offset argument that was added in qemu.git/master in the meantime [P=
eter]
> >
> > ----------------------------------------------------------------
>=20
> Fails to compile, clang:
>=20
> ../../hw/remote/mpqemu-link.c:40:29: error: suggest braces around
> initialization of subobject [-Werror,-Wmissing-braces]
>     struct iovec send[2] =3D {0};
>                             ^
>                             {}
>=20
>=20
> Don't use {0}, use {} -- the former may be the C standard thing,
> but the latter is the one all our supported compilers accept
> without complaint. (cf eg commit 039d4e3df0).

Thanks, I update the patch in question.

It looks like the GitLab CI doesn't include a clang version that
produces this error because the pipeline passed for me:
https://gitlab.com/stefanha/qemu/-/pipelines/251524779

Is there something clang-specific you want to check in the CI? Maybe
clang 3.4, the oldest version supported according to ./configure?

Stefan

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAdcHEACgkQnKSrs4Gr
c8j72Af/aOM+hTZeL4s8d2xfmLGhpYbZqCbUhb9VeaqJhmS97O/BOLspR16/Ppla
+wHRDfuIC7mLLxMqn+msl/qpRfTOutZgcc+vRANNuJWMbbgikSNWbBDCmuO46SMR
WVchAKpvJD/HnP8RPdVLQt/XPnhkK2wuGGiCAonr4GXKBQZISKWItQXY6WjdMy8t
X1f237abWixvC8FnhvHsGkdE7l9JmpGlQV7d84qKMS4MnLaW4l4cQzDAibw7raiS
e5M3VtHL1wjg8obf750zjpAzie2lVh1bZlYIVPmlHuWJXTmrXt4KPG01qUx442R1
ep+Ia2S9NkxU5ncwvMpNib4c+x8WfA==
=azag
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--


