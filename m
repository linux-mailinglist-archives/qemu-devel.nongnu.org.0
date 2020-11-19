Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4899A2B8FB5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:03:47 +0100 (CET)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfgn4-0004vZ-CX
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfglK-0004SI-4N
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:01:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfgkm-00056L-HR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605780083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sz4sMVQuvO/PugJRpjxRPT0IYUUovIVT/qadfWDkUTU=;
 b=FKT7jIjIyHiy+8WgJs/aoE9jWcGJ3Q2+nZKNSVbvpWqLfZhGDxKokhMGdU9+2BV3P+ioTQ
 gwOtKJpcJBUNmIsRwD/n8PLjjEX4UHibLswFWeROuF4BIx6RJo3zHLyQwqe/5kMKIXTP4M
 EtDbCqW7Wh4JtlhX03A4MStm/8LwDtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-tGzZI7-LMdie4d2RUSCeqg-1; Thu, 19 Nov 2020 05:01:19 -0500
X-MC-Unique: tGzZI7-LMdie4d2RUSCeqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0A7911E3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:01:18 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F82B60BE2;
 Thu, 19 Nov 2020 10:01:14 +0000 (UTC)
Date: Thu, 19 Nov 2020 10:01:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/4] meson: move up hw subdir (specifically before trace
 subdir)
Message-ID: <20201119100114.GE701869@stefanha-x1.localdomain>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-3-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119084448.24397-3-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 09:44:46AM +0100, Gerd Hoffmann wrote:
> Needed so trace/meson.build can see
> stuff done in hw/*/meson.build.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meson.build b/meson.build
> index 04bd9b57e401..41009b9685de 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1456,6 +1456,8 @@ trace_events_subdirs +=3D [
>    'util',
>  ]
> =20
> +subdir('hw')
> +
>  subdir('contrib/libvhost-user')
>  subdir('qapi')
>  subdir('qobject')
> @@ -1543,7 +1545,6 @@ subdir('migration')
>  subdir('monitor')
>  subdir('net')
>  subdir('replay')
> -subdir('hw')
>  subdir('accel')
>  subdir('plugins')
>  subdir('bsd-user')

This is unmaintainable because someone reading the code won't be aware
of the ordering constraint. A comment is needed.

I wonder if anyone has suggestions for meson best practices? Relying on
ordering of subdirs is awkward, but so is moving the code into the
top-level meson.build file.

Stefan

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2QmoACgkQnKSrs4Gr
c8hnwwgAswuq/fUk2nTI/xenIWjs7T+8GmPs1cv0Z4ZU5mySa8a4A42z8IfBlvQ8
8AMI8JA6jD9pJ9DPAfIyXvpqzTMh2FRyZVNP4WruouFmjZ+KEOYg1jB1YISN5wq5
weDnYYp1wqtOssHlovSTP77LfU/UmmmPxcGZwWMSSenItcbdw1sBuwQCZjxgbfx5
geJKDObu8tcVaNhElUZ33PkNhKefD009NolOCmnw869mmVwuVlGq9BUu43C4/3Do
zGAcTSKnlcvdnO+0Rj6d3EkBxLKsDbuOo07j++GS8r5CpR7MlT1BjtB9Dy/Hxylw
4TrEISHQw7hAojAeJI+c9PhPoARIYg==
=gIZ+
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--


