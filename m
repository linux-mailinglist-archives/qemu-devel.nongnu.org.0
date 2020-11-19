Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA792B91E5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:57:29 +0100 (CET)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfiZ6-0000HK-83
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfiX8-0007Lg-Jt
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfiX5-0002aw-7M
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605786921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oOLkH6sc/iyoojQw1I29OWb59eORTze4xt7fUKjRdxg=;
 b=NLTs2CI7GAyQsMCVkteRdAbDtYkcb8sCicpDilVhVq2ip0OGW1SSx5tEIFxahO5XFF2Qgd
 lTpDl56bzsSbrkAuhG15JpsuZzY5FaHX5yJuFPhmefZJLdA5XLEOmf05yUhIRRQmkFqwup
 HWipSwNPTAXCyWUglOwS9ecY3Ao9Wm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-kmKw1oT0M7SxodsR01TiYA-1; Thu, 19 Nov 2020 06:55:19 -0500
X-MC-Unique: kmKw1oT0M7SxodsR01TiYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6488A8143FD
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:55:18 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E87DC60853;
 Thu, 19 Nov 2020 11:55:15 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:55:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
Message-ID: <20201119115514.GA838600@stefanha-x1.localdomain>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 12:23:23PM +0100, Gerd Hoffmann wrote:
>   Hi,
>=20
> > > diff --git a/trace/meson.build b/trace/meson.build
> > > index 66395d3e2ba7..3f0fe7b7b74c 100644
> > > --- a/trace/meson.build
> > > +++ b/trace/meson.build
> > > @@ -18,6 +18,7 @@ foreach c : trace_events_config
> > >    trace_events_files +=3D [ trace_events_file ]
> > >    group =3D '--group=3D' + c.get('group')
> > >    fmt =3D '@0@-' + c.get('group') + '.@1@'
> > > +  module_ss =3D c.get('ss', trace_ss)
> >=20
> > One idea: module_ss is already used in other files. Are you sure there
> > isn't an identifier naming conflict?
>=20
> Nope.  Tried s/module_ss/kraxel_ss/, still not working.
>=20
> I get tons of "undefined reference to `_TRACE_something'"
> errors (*not* qxl).  Seems trace_ss is not updated as intended.

Okay. There is a workaround available:
[PATCH v2] trace: use STAP_SDT_V2 to work around symbol visibility

We can take time to figure out how to extend the build system to handle
modules.

Would you like me to try to debug this?

I'm also on #qemu IRC if you want to discuss.

Stefan

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2XSIACgkQnKSrs4Gr
c8gCwggAnwrVprvmGVnbJSlfc8zhJn7JjPZH1hcwxE56FIY9DUH/Qcs6A+EgQ2/D
hfraLJaL6h0Ir5QCdgWE7rFUEs+BEZX4mwSr/awzkWJ43ILSJjGkGZCkpQ6aq2W1
FBNgWaCweGsWxVmDY2YAfLoKE2wQS7Va/BTWCOVPNYzRoS1qzzq5C6FXAmxpY3sa
8+XFkXTLyloAGD5S3oX8RozXpYMwuLD5Yb5tEnW6yK2XDoSPj5o3+ixI0XyjBGTc
8LalIyo9EDpQtrUYTMJ+nXGLFre2xE2bHruDfl/KAETJC9zWwhapEzrz1h3/E2Ca
re5rfefinlQt/UAvKdQptm8RXNyywQ==
=GtkX
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--


