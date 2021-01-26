Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF5303F8D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:02:55 +0100 (CET)
Received: from localhost ([::1]:46798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ovl-0000oA-U7
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4Ouc-0000AS-A1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4OuP-0008Am-1p
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611669685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pdbfjyAAAVR6OC2rQq/xpizzGdP2p+hdWswq7I+ReSI=;
 b=PWwlE2XHUWkIdTTUgV8ks+RJDPID8TZXhc/r8werDzE82unnGHLiua1hBXYs4ZxijkTgUr
 HKWtLVKeavDBfkMzI1JSIwDSknOqUWiLrYr4mbbyNZEz1kYK1K/6uLglzo6udIeYR99Wm3
 jQ7wzS80Mb5y63dGWeFWvgSwAhyKjCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-UotVpP0JNdmx58x6CDH7tg-1; Tue, 26 Jan 2021 09:01:22 -0500
X-MC-Unique: UotVpP0JNdmx58x6CDH7tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F2C71842141;
 Tue, 26 Jan 2021 14:01:20 +0000 (UTC)
Received: from localhost (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 936C05C1A3;
 Tue, 26 Jan 2021 14:01:18 +0000 (UTC)
Date: Tue, 26 Jan 2021 14:01:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/2] trace: make the 'log' backend timestamp configurable
Message-ID: <20210126140117.GF250425@stefanha-x1.localdomain>
References: <20210125113507.224287-1-stefanha@redhat.com>
 <afa594a-921a-6c3d-db29-56173570f080@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <afa594a-921a-6c3d-db29-56173570f080@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KJY2Ze80yH5MUxol"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KJY2Ze80yH5MUxol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 08:50:23PM +0100, BALATON Zoltan wrote:
> On Mon, 25 Jan 2021, Stefan Hajnoczi wrote:
> > Zoltan reminded me that the 'log' backend prints tids/timestamps and th=
is can
> > be unwanted in some cases. It's easier to look at trace output without =
them and
> > in some cases parsing is also more convenient with them.
> >=20
> > Extend -msg timestamp=3Don|off to control the 'log' backend's tid/times=
tamp output.
>=20
> Thank you, this works for me
>=20
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
>=20
> but I had to remove build dir and rerun configure to get it omit timestam=
ps.
> Just running make (which reruns configure) or make distclean and running
> configure does not seem to be enough to pick up some changes since the me=
son
> conversion. (I had similar problem with gtk being detected and used despi=
te
> having --disable-gtk on configure before the gtk test was moved to meson;=
 so
> I think there's some problem detecting changes in configure options
> somewhere. That was also fixed by rerunning configure after starting from
> clean build dir but did not work when keeping old build dir or make
> distclean. This is probably not a problem for someone downloading the
> sources and compiling it once, only annoying for developers who build it =
all
> the time.)

Thanks! The following meson.build fix in the tracing queue:

  [PATCH] trace: add meson custom_target() depend_files for tracetool

It solves this issue.

Stefan

--KJY2Ze80yH5MUxol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAQIK0ACgkQnKSrs4Gr
c8i6jQf+NWmOtJCdSFmLI433V84y6S0PTZ7SZiB8KKeSnPQ8GhyeV2Qw+k1RGh2n
IqjqGAFqS66Rcu8zf0y6raqWlWveE8TMkuCzrnrhn6bmpynfPhDJkIhHBrN5waHZ
yItkFg+d2Wb2cM/vM9/HG1E45l6tL7QJ8vWtY8M3i8LkJJLfmCNslJRTroY9xL1G
AqkbxKyK74eyY7ZxTfqFpiKMWjxzvLLvmqbny/N3c9STziGf1NWOdJFtSf3+V+q4
kDjyjlbWxllGkcHpcRcjnwVONRNPW+LixO8BNXMVpLM2JWUo3MRX0sL4kM31Z3Ez
aPprTNGv6G0WigJTg1rPkUH53eJ1yQ==
=X632
-----END PGP SIGNATURE-----

--KJY2Ze80yH5MUxol--


