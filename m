Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE854039BD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:28:14 +0200 (CEST)
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwgX-0005f7-Ql
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNwdd-0004Vp-JV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNwdb-0001CA-0f
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631103909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dux3Fh3NVx/OU84kBEfOaAtcz/nucX3q4C+BoacXa4E=;
 b=UOLSyDacY1OGzusw4IumQ9pSlCQBpDTBKZ4wG4ZFbxk7yXHFBN9SuYpO8HQn1B/24v2Z6/
 2f6aJ5f/v9dEark3/OHs5fa2UiDir6xruHA9qmNDzAPBS7kMDRj/Xei/llHpYbEa0HN8oE
 YTKLG7jv55Jsw1ViwvbMAmnyr9ZY9y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-5fg_OMLYPkKHGpdUviX6PA-1; Wed, 08 Sep 2021 08:25:07 -0400
X-MC-Unique: 5fg_OMLYPkKHGpdUviX6PA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBA0119253C2;
 Wed,  8 Sep 2021 12:25:05 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E15DD77F29;
 Wed,  8 Sep 2021 12:25:01 +0000 (UTC)
Date: Wed, 8 Sep 2021 13:25:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 01/11] vfio-user: build library
Message-ID: <YTirnLv70qtYZPkg@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="phoA5onEjkXsTsrp"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--phoA5onEjkXsTsrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 01:53:20PM -0400, Jagannathan Raman wrote:
> diff --git a/meson.build b/meson.build
> index bf63784..2b2d5c2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1898,6 +1898,34 @@ if get_option('cfi') and slirp_opt =3D=3D 'system'
>           + ' Please configure with --enable-slirp=3Dgit')
>  endif
> =20
> +vfiouser =3D not_found
> +if have_system and multiprocess_allowed
> +  have_internal =3D fs.exists(meson.current_source_dir() / 'subprojects/=
libvfio-user/Makefile')
> +
> +  if not have_internal
> +    error('libvfio-user source not found - please pull git submodule')
> +  endif
> +
> +  json_c =3D dependency('json-c', required: false)
> +    if not json_c.found()

Indentation is off.

> +      json_c =3D dependency('libjson-c')
> +  endif
> +
> +  cmake =3D import('cmake')
> +
> +  vfiouser_subproj =3D cmake.subproject('libvfio-user')
> +
> +  vfiouser_sl =3D vfiouser_subproj.dependency('vfio-user-static')
> +
> +  # Although cmake links the json-c library with vfio-user-static
> +  # target, that info is not available to meson via cmake.subproject.
> +  # As such, we have to separately declare the json-c dependency here.
> +  # This appears to be a current limitation of using cmake inside meson.
> +  # libvfio-user is planning a switch to meson in the future, which
> +  # would address this item automatically.
> +  vfiouser =3D declare_dependency(dependencies: [vfiouser_sl, json_c])
> +endif
> +
>  fdt =3D not_found
>  fdt_opt =3D get_option('fdt')
>  if have_system
> diff --git a/.gitmodules b/.gitmodules
> index 08b1b48..cfeea7c 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -64,3 +64,6 @@
>  [submodule "roms/vbootrom"]
>  =09path =3D roms/vbootrom
>  =09url =3D https://gitlab.com/qemu-project/vbootrom.git
> +[submodule "subprojects/libvfio-user"]
> +=09path =3D subprojects/libvfio-user
> +=09url =3D https://github.com/nutanix/libvfio-user.git

Once this is merged I'll set up a
gitlab.com/qemu-project/libvfio-user.git mirror. This ensures that no
matter what happens with upstream libvfio-user.git, the source code that
QEMU builds against will remain archived/available.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4039d3c..0c5a18e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3361,6 +3361,13 @@ F: semihosting/
>  F: include/semihosting/
>  F: tests/tcg/multiarch/arm-compat-semi/
> =20
> +libvfio-user Library
> +M: Thanos Makatos <thanos.makatos@nutanix.com>
> +M: John Levon <john.levon@nutanix.com>
> +T: https://github.com/nutanix/libvfio-user.git
> +S: Maintained
> +F: subprojects/libvfio-user/*

A MAINTAINERS entry isn't necessary for git submodules. This could
become outdated. People should look at the upstream project instead for
information on maintainership and how to contribute.

--phoA5onEjkXsTsrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4q5wACgkQnKSrs4Gr
c8j45wgAuUOX+LMrQoPxWC8NfP1lEOumohzSRM6PiT3vxzF9rpcOtEAJULCGO856
XF3gbRI2i4JT6hC4qyqfEHaTRBcWNBWshg6OpE4uep1hVrg3N8ZsBIt5Y1hiZNqy
Fb/4WRSt+RzquIa/UsvXflz5mWyXytv6/s5wYmO/xcdyD4r9Ju1+5AMaBwZjwqx+
rYQCtO9VkKgDtMcCkb6pwvsLgsJnLOH7popuQx/zq34YwiQBGuIOdIzAiKA/RQV4
CA9w0Q+UFiRccylNUsBNQuWzSQsQ7vX6GD8EDSusXZErMrl2f4N0MuB3DcMVdJ6u
8OVYn3hYbb4cDPgYDPTjG+zmoJ7OzA==
=pakW
-----END PGP SIGNATURE-----

--phoA5onEjkXsTsrp--


