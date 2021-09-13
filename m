Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE6408B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:40:25 +0200 (CEST)
Received: from localhost ([::1]:45858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlG3-0006vC-VV
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPkrf-0005o6-Nf
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPkre-0000KJ-0I
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631535309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNvjwZFKn9oBhtfNl19zY5Idrs5tmTDPBDc9HHShpMI=;
 b=h+Xj2hRQB6jYWah3M7nGG9FxTRF3kj7nmJZgqIcRXLB/nbkGC2aC9rQYiPXPcFeov64ty5
 YXQnx8Ej3ZC8Phz3anP+2QzMb8hZ0vrBeFriuy+lr5wWhgzvb8WzX4wLv0jmB/JxCmgBmA
 Fwnw+n51g9cDZLNbcsnItk/Yt+6rE9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-YFCuIvksOZeGSX0ov_CWmg-1; Mon, 13 Sep 2021 08:15:06 -0400
X-MC-Unique: YFCuIvksOZeGSX0ov_CWmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B1B2362FA;
 Mon, 13 Sep 2021 12:15:05 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2463189BB;
 Mon, 13 Sep 2021 12:15:04 +0000 (UTC)
Date: Mon, 13 Sep 2021 13:15:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RFC server v2 01/11] vfio-user: build library
Message-ID: <YT9Ax2ESoCuwtjCn@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
 <YTirnLv70qtYZPkg@stefanha-x1.localdomain>
 <20df9a4e-cd9e-0524-1681-a84cf52cc513@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20df9a4e-cd9e-0524-1681-a84cf52cc513@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TWtg4trizk2DByjt"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
 Jagannathan Raman <jag.raman@oracle.com>, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TWtg4trizk2DByjt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 05:21:33PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 9/8/21 2:25 PM, Stefan Hajnoczi wrote:
> > On Fri, Aug 27, 2021 at 01:53:20PM -0400, Jagannathan Raman wrote:
>=20
> >> diff --git a/.gitmodules b/.gitmodules
> >> index 08b1b48..cfeea7c 100644
> >> --- a/.gitmodules
> >> +++ b/.gitmodules
> >> @@ -64,3 +64,6 @@
> >>  [submodule "roms/vbootrom"]
> >>  =09path =3D roms/vbootrom
> >>  =09url =3D https://gitlab.com/qemu-project/vbootrom.git
> >> +[submodule "subprojects/libvfio-user"]
> >> +=09path =3D subprojects/libvfio-user
> >> +=09url =3D https://github.com/nutanix/libvfio-user.git
> >=20
> > Once this is merged I'll set up a
> > gitlab.com/qemu-project/libvfio-user.git mirror. This ensures that no
> > matter what happens with upstream libvfio-user.git, the source code tha=
t
> > QEMU builds against will remain archived/available.
>=20
> Can we do it the other way around? When the series is OK to be merged,
> setup the https://gitlab.com/qemu-project/libvfio-user.git mirror and
> have the submodule point to it?

Yes, good idea.

Stefan

--TWtg4trizk2DByjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/QMcACgkQnKSrs4Gr
c8hetgf/ZrEw3x6P06qfaZolHM9EMWh/EQHISmtw/Af8n0lefpCTyMPc4e5fF15v
sLb0fupDypnTwRV39B0SOU0FBxtzA76oE+XwOkhvIypPmIa+8wz78Tu7jcCTJ1l+
UmsIullLSfnx3oEGu1gaxomTfEqmxFzZT0J+nRpenACsyYohGjRbkYcNnzUSzY0B
lDhDWIHhRRLH7fyuxYrvkDZuDPdZnfwhluhVWMcxGGaZLZGKmTjGjqVvj1f7Z5F5
zzt1YgCY025GeNc6dXnRk/u2exsl3yxho9PrUWtBT0+JSHdld22KwAsW00gJ6arO
V2N6NZeNQythQsg6KvygxJlncCuYvg==
=Jsud
-----END PGP SIGNATURE-----

--TWtg4trizk2DByjt--


