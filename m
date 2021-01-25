Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A963027B1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:22:58 +0100 (CET)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44dk-000764-VB
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l44a7-0005RF-RF
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:19:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l44a5-0006y7-GD
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611591547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YdCqsS/MwBurzZqcI7FMdTwvrb0HfA1rr1Kp8DPU/7k=;
 b=HPu+CJOB8Q64RiJDIVGCdIuJMuICLxc4tpl5gtKwR+Bop6GY7h+hTTabcFNOWIxvm1cxTg
 AiXtoO6VJAzKTjw89rpRipY4kIndn3BZfRYCjiWLGl5bCBhqsDtlahu9wLX4fWLnVy2WmL
 BG/Z4WhEw1anc3zIRM+sc1UUzlt3Pmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-VBV4dqjUP1a7BPHp2Xpvmw-1; Mon, 25 Jan 2021 11:19:04 -0500
X-MC-Unique: VBV4dqjUP1a7BPHp2Xpvmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 625A91934B87
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 16:19:02 +0000 (UTC)
Received: from localhost (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D18D5D9DB;
 Mon, 25 Jan 2021 16:19:01 +0000 (UTC)
Date: Mon, 25 Jan 2021 16:19:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] trace: make the 'log' backend timestamp configurable
Message-ID: <20210125161900.GA228223@stefanha-x1.localdomain>
References: <20210125113507.224287-1-stefanha@redhat.com>
 <220bc0d1-4d1d-eeaf-6e2e-66fa33de8f98@redhat.com>
MIME-Version: 1.0
In-Reply-To: <220bc0d1-4d1d-eeaf-6e2e-66fa33de8f98@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
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

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 03:06:30PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 1/25/21 12:35 PM, Stefan Hajnoczi wrote:
> > Zoltan reminded me that the 'log' backend prints tids/timestamps and th=
is can
> > be unwanted in some cases. It's easier to look at trace output without =
them and
> > in some cases parsing is also more convenient with them.
> >=20
> > Extend -msg timestamp=3Don|off to control the 'log' backend's tid/times=
tamp output.
> >=20
> > Stefan Hajnoczi (2):
> >   error: rename error_with_timestamp to message_with_timestamp
> >   trace: make the 'log' backend timestamp configurable
> >=20
> >  docs/devel/tracing.txt           |  3 +++
> >  include/qemu/error-report.h      |  2 +-
> >  softmmu/vl.c                     |  2 +-
> >  util/qemu-error.c                |  4 ++--
> >  scripts/tracetool/backend/log.py | 19 +++++++++++++------
> >  5 files changed, 20 insertions(+), 10 deletions(-)
>=20
> I applied your series, rebuilt, but nothing changed.
>=20
> Apparently there is some buildsys rule missing, the
> trace files weren't regenerated.

I sent a separate patch that adds tracetool dependencies to meson.build:
"[PATCH] trace: add meson custom_target() depend_files for tracetool"

That will fix the issue.

Stefan

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAO73QACgkQnKSrs4Gr
c8i/EAf/bRsEfzME+4T19ODWbTE+QkBRec7xNgsYGnPeotx7bA+eCXMPtsFlaiAW
be8K9+MI1Pk5x3YRjhWkM8fjWygh9Wm+B7ofllkQl8D02u+PxIdvrTCIsFxyJM9j
aE3NkaY+HFQDSvQf7S2FFsoRcJPlWdg6YHvtj1UDCg/4Ej1D3N0a0SSBjt2WRvNC
daB4v+Jn/RiNIOufX6A0Me/JDdiPYU+7aFapLjG1kZWXeKZH/VcLFstHPnmKCAif
Rks2uxfT+BadkU576rmHMH74vpMItrIognkElV0JAHldgZY2Jq2jGyTtQGNn+21R
I9yLZe1+Z7KgMFUBD/bteCPddyhW2g==
=2pbx
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--


