Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8CC6F308C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 13:58:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptS93-0000S5-W6; Mon, 01 May 2023 07:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptS92-0000Rx-H8
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptS8z-0003rj-RK
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682942196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4qEJ5TqAm+P0XLCD8cGAiU7uHeYpLnC7zMMxIHcaz2s=;
 b=DjcobzcWoj4coatFlDbOkyJ+U0lYXg/VsDeZC5H9tQ0Ugj/q+aN9/ngT79q7qSLDJ5cGJ8
 kM6i9ZEcsuSvuwTs85dW9Dc3Z230gHPTA13XNGloUI2QCHOazqM6Vca8xVUJ0O/32WY9cV
 kOWhx9EXcj8+LOnrSffF+Sl1TKnkXPo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-3U1sxu2VPI-ukRZ_uwSHhQ-1; Mon, 01 May 2023 07:56:32 -0400
X-MC-Unique: 3U1sxu2VPI-ukRZ_uwSHhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7991BA0F3A0;
 Mon,  1 May 2023 11:56:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4B3440C6E67;
 Mon,  1 May 2023 11:56:31 +0000 (UTC)
Date: Mon, 1 May 2023 07:56:30 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 dlemoal@kernel.org, dmitry.fomichev@wdc.com
Subject: Re: [PULL 00/17] Block patches
Message-ID: <20230501115630.GA1594843@fedora>
References: <20230428123954.179035-1-stefanha@redhat.com>
 <607d67c6-4df6-f573-f7d4-a489e27496b1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hUMhGFdEy4dQKprE"
Content-Disposition: inline
In-Reply-To: <607d67c6-4df6-f573-f7d4-a489e27496b1@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--hUMhGFdEy4dQKprE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 11:05:06PM +0100, Richard Henderson wrote:
> On 4/28/23 13:39, Stefan Hajnoczi wrote:
> > The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b926=
46e6:
> >=20
> >    Merge tag 'migration-20230427-pull-request' of https://gitlab.com/ju=
an.quintela/qemu into staging (2023-04-28 08:35:06 +0100)
> >=20
> > are available in the Git repository at:
> >=20
> >    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >=20
> > for you to fetch changes up to d3c760be786571d83d5cea01953e543df4d76f51:
> >=20
> >    docs/zoned-storage:add zoned emulation use case (2023-04-28 08:34:07=
 -0400)
> >=20
> > ----------------------------------------------------------------
> > Pull request
> >=20
> > This pull request contains Sam Li's virtio-blk zoned storage work. These
> > patches were dropped from my previous block pull request due to CI fail=
ures.
>=20
>=20
> More CI build failures, e.g.

Hi Sam,
There are some more CI failures.

>=20
> https://gitlab.com/qemu-project/qemu/-/jobs/4202086013#L1720

This Ubuntu 20.04 on s390x CI job failed because <linux/blkzoned.h> is
missing Linux commit e876df1fe0ad ("block: add zone open, close and
finish ioctl support"):

  ../block/file-posix.c: In function =E2=80=98raw_co_zone_mgmt=E2=80=99:
  ../block/file-posix.c:3472:14: error: =E2=80=98BLKOPENZONE=E2=80=99 undec=
lared (first use in this function)
   3472 |         zo =3D BLKOPENZONE;
        |              ^~~~~~~~~~~
  ../block/file-posix.c:3472:14: note: each undeclared identifier is report=
ed only once for each function it appears in
  ../block/file-posix.c:3476:14: error: =E2=80=98BLKCLOSEZONE=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98BLKRESETZONE=E2=
=80=99?
   3476 |         zo =3D BLKCLOSEZONE;
        |              ^~~~~~~~~~~~
        |              BLKRESETZONE
  ../block/file-posix.c:3480:14: error: =E2=80=98BLKFINISHZONE=E2=80=99 und=
eclared (first use in this function)
   3480 |         zo =3D BLKFINISHZONE;
        |              ^~~~~~~~~~~~~

Older kernels didn't have these ioctls. I don't think it makes sense to
enable file-posix zoned functionality without these ioctls.

I suggest changing the CONFIG_BLKZONED check in meson.build from:

  config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned.h'))

 to:

  config_host_data.set('CONFIG_BLKZONED', cc.has_header_symbol('linux/blkzo=
ned.h', 'BLKOPENZONE'))

> https://gitlab.com/qemu-project/qemu/-/jobs/4202085995#L4088

The <linux/asm/kvm.h> header file started using __DECLARE_FLEX_ARRAY()
and QEMU doesn't have that macro:

  linux-headers/asm/kvm.h:509:3: error: expected specifier-qualifier-list b=
efore '__DECLARE_FLEX_ARRAY'
    509 |   __DECLARE_FLEX_ARRAY(struct kvm_vmx_nested_state_data, vmx);
        |   ^~~~~~~~~~~~~~~~~~~~

You could update the sed command in scripts/update-linux-headers.sh to
convert __DECLARE_FLEX_ARRAY(type, field) into type field[] or import
the Linux macro definition of __DECLARE_FLEX_ARRAY().

Another failure is
https://gitlab.com/qemu-project/qemu/-/jobs/4202085991 where
qemu-iotests is failing because the output has changed due to the
addition of zoned fields to block stats.

Another failure is
https://gitlab.com/qemu-project/qemu/-/jobs/4202086041 where
qemu-system-ppc seems to segfault.

You can find the CI results here: https://gitlab.com/qemu-project/qemu/-/pi=
pelines/852908752

You can run the GitLab CI yourself like this:

  $ git push -o ci.variable=3DQEMU_CI=3D2 your_gitlab_repo HEAD

Stefan

--hUMhGFdEy4dQKprE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRPqO0ACgkQnKSrs4Gr
c8jj6wf/cHtBgR7gFfPVFxllQNe0d+nzrSHmBHxr5lh4nkWA34HxFBVuzfoOO5Mw
8UIeXIFPF+iw6lVKWnKb++feCWxywF13Ct4wCaNNr/Nk9IV/vhPky3HhmnAps9Ny
HM0/wQ8rEkzzgn4RIIHsfRgZhrmFYKIWHMhrZvS6bIKJhJbniX+gDrlizUrFKY9O
xWrf9ISgIxgTuNwqM2ajc+OBFbNWklpqYHvWyO27hmRU+6MwB51eDtrRGsUeJubk
O33HeNGIpP0uh34IokLHsRiT7FyF9RcNjjNZkUfv+HAXnkKjH8Fjq1JVr0R+zDUS
p/IgABCuJ3vSx5yoDBCxw8Rz4RKNnw==
=SGc7
-----END PGP SIGNATURE-----

--hUMhGFdEy4dQKprE--


