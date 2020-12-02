Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DFA2CBF8D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:27:04 +0100 (CET)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkT5z-0005gV-KT
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT4w-0004Jx-07
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:25:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT4u-0003fy-5v
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606919154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NsRE9GBA95RIBgyG17EPd0S2JW8olRtYw0tJVYT6CH4=;
 b=fEMnFpve9o1V1PXd5ThL2j0VpLgagx2CF3XbRFK4S+Qws8gmC75FccvsyT1ls34XStlr03
 Cj80FEZFy5sO2CYFXVREnQKgyu2Fx1271daNEsWGES4jbBFAUfhU78iQ1X1R27+h0zZcG4
 nQaXmNAmyln4UOqhtV0w10eySnfGsjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-0PUCBMHEPe6ukKC-uxCNCA-1; Wed, 02 Dec 2020 09:25:51 -0500
X-MC-Unique: 0PUCBMHEPe6ukKC-uxCNCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE241108E1A0
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 14:25:50 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1287E10074E5;
 Wed,  2 Dec 2020 14:25:41 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:25:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 5/8] libvhost-user: make it a meson subproject
Message-ID: <20201202142540.GG655829@stefanha-x1.localdomain>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
 <20201125100640.366523-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201125100640.366523-6-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z9ECzHErBrwFF8sy"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--z9ECzHErBrwFF8sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 02:06:37PM +0400, marcandre.lureau@redhat.com wrote=
:
> diff --git a/meson.build b/meson.build
> index 5062407c70..1b14998691 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1476,7 +1476,12 @@ trace_events_subdirs +=3D [
>    'util',
>  ]
> =20
> -subdir('contrib/libvhost-user')
> +vhost_user =3D not_found
> +if 'CONFIG_VHOST_USER' in config_host
> +  libvhost_user =3D subproject('libvhost-user')
> +  vhost_user =3D libvhost_user.get_variable('vhost_user_dep')
> +endif
> +
>  subdir('qapi')
>  subdir('qobject')
>  subdir('stubs')

I wonder if qemu-system-ARCH and qemu-storage-daemon targets will break
with ./configure --disable-vhost-user because of util/meson.build:

  util_ss.add(when: 'CONFIG_LINUX', if_true: [
    files('vhost-user-server.c'), vhost_user
  ])

Stefan

--z9ECzHErBrwFF8sy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Ho+QACgkQnKSrs4Gr
c8jOLQf/fgnGc83/Wvw6+C0jGuoiB/UMKxSDaRcplKn7TWl5f9PbhQSWTCfM1FP7
R1MVG3jGgBfO4lmcLJNa0JVhk2/N4EhVoJGhGp1R8B27YPdLt6htqgF0QCXeJJAS
+0Ti3oFXDR0gkZtNjBr7SWPbK++G/NMnnkcGkBQHlpr7AAWDTBvEuh/ZPnD5kQrU
+9QjMTuqpSQmWV1Yli6cD1PMo7aM9/qZLtpZBs3b5dFuzCiyrhKpng/2YjGUmsyQ
bcl7wHkVlo4PIs9RCT+OaA9dOp5BPVB94+TAp2Y55+8EYB2kjW80zH3wA/vYz2Xj
T0geqmDahNhNoEsccrgf13yMa3w33Q==
=LIRl
-----END PGP SIGNATURE-----

--z9ECzHErBrwFF8sy--


