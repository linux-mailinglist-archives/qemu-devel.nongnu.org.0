Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00092DD437
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:31:07 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvFD-0004om-1g
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpvCi-0003Hl-7C
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:28:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpvCg-0005xS-FR
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608218904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqV1cCL7EkRdogH1awhqWjz+lwvMvmt3DZO8XCXUsio=;
 b=Zf3OYbvQwdz5l3/cY9IVhCKPhFv7nqe0Tcav2XsAfSDBZH0Bu/0VdRo4jEXX1RU/mHWLn+
 X+AzPM7E5V4AQM4etbNglBcw9XeVOs4cJ98+yXYc5GiuPYTVBkwHPzrIPaUd+GXbzn5M/Z
 9XbJsL8+nztItjVgiDY6U2inWNs1pT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-GpzvccbYN2C_na5dRqdmXA-1; Thu, 17 Dec 2020 10:28:22 -0500
X-MC-Unique: GpzvccbYN2C_na5dRqdmXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4491075649;
 Thu, 17 Dec 2020 15:28:17 +0000 (UTC)
Received: from localhost (ovpn-115-250.ams2.redhat.com [10.36.115.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC183289BF;
 Thu, 17 Dec 2020 15:28:15 +0000 (UTC)
Date: Thu, 17 Dec 2020 09:34:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 1/3] docs: generate qemu-storage-daemon-qmp-ref(7) man
 page
Message-ID: <20201217093423.GB4338@stefanha-x1.localdomain>
References: <20201209103802.350848-1-stefanha@redhat.com>
 <20201209103802.350848-2-stefanha@redhat.com>
 <20201215161106.GJ8185@merkur.fritz.box>
 <20201216162142.GB707467@stefanha-x1.localdomain>
 <20201216175903.GG7548@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201216175903.GG7548@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 afrosi@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 06:59:03PM +0100, Kevin Wolf wrote:
> Am 16.12.2020 um 17:21 hat Stefan Hajnoczi geschrieben:
> > On Tue, Dec 15, 2020 at 05:11:06PM +0100, Kevin Wolf wrote:
> > > > diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/in=
terop/qemu-storage-daemon-qmp-ref.rst
> > > > new file mode 100644
> > > > index 0000000000..caf9dad23a
> > > > --- /dev/null
> > > > +++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
> > > > @@ -0,0 +1,13 @@
> > > > +QEMU Storage Daemon QMP Reference Manual
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +..
> > > > +   TODO: the old Texinfo manual used to note that this manual
> > > > +   is GPL-v2-or-later. We should make that reader-visible
> > > > +   both here and in our Sphinx manuals more generally.
> > > > +
> > > > +..
> > > > +   TODO: display the QEMU version, both here and in our Sphinx man=
uals
> > > > +   more generally.
> > > > +
> > > > +.. qapi-doc:: storage-daemon/qapi/qapi-schema.json
> > >=20
> > > Did you intend to actually merge the TODO comments like this into mas=
ter
> > > or was this meant to be resolved before you send the series?
> >=20
> > Thanks for pointing this out. Both qemu-qmp-ref.rst and qemu-ga-ref.rst
> > have these comments and I copied them when creating the file. I don't
> > intend to try to solve that in this series.
> >=20
> > Would you like to keep the comments or should I drop them?
>=20
> Ah, I see. If the same already exists in other places, I'll just merge
> it as it is. Thanks!

Great, thanks!

Stefan

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/bJh8ACgkQnKSrs4Gr
c8hlLgf/UKHN769Kxt16JoHD2Vz1GYQPkrxk7bOu2rJYgQTJi9LYVlAx/p7dwoQ8
2NEAJyPdp+cGEMhadjy5unN1qQQ7KechMpU9hCQT5JoxHkp2QKIzOwzelcUd6iN1
6OZUHhwXeoBIwxTYAKtZp7uINio7fT233KyMp6MWhbN5xhnKTgEi0FBiIVc5JOVD
2Gu1JYd4/gukjm2S61OZ4AH2WN/QD5uGhN5Ycq8AIR+dDR+YeKtp9kJM8SDBnHoq
MXuTrLrL/w1Un/U6QyUvzpzjv2gPfJTZ2tyQ/ZpN29mLYUNhWgCABkBJZ77T8dV1
cpX6iRN2v4EkLaBa846B1Ls/6iUe/Q==
=Nc6M
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--


