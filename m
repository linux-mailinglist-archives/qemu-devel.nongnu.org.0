Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91640AE22
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:46:57 +0200 (CEST)
Received: from localhost ([::1]:53342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7pw-00066f-HK
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQ7dI-0004rT-Ur
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQ7dG-0001tE-RE
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631622830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fUk2yx0tmnLZ7BQwmsIBFCZuUWmDXpbBPtE6CVboWmY=;
 b=KFUlAQLVBRhbKYOGOCGe9yEtSn4HqdXt7RSmGCgMSwHiYgycVQaJzYpweaXxdFpwOomTGj
 htITZxZzAdJGcA80JwAS3QuRtZYNwU12aDUwciw8dcjelGIi+Z/YMGeZl8Fi/SAErAYUbi
 +nY+MSqVTbFwB1Fx9SqMtOVI0DnFjgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-k4i8SE3dNkK-vWVXwBI6WA-1; Tue, 14 Sep 2021 08:33:42 -0400
X-MC-Unique: k4i8SE3dNkK-vWVXwBI6WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B2BA100C61C;
 Tue, 14 Sep 2021 12:33:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E6D560CA0;
 Tue, 14 Sep 2021 12:33:40 +0000 (UTC)
Date: Tue, 14 Sep 2021 13:33:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [qemu-web RFC PATCH] Add Sponsors page
Message-ID: <YUCWpOwkqymirsYt@stefanha-x1.localdomain>
References: <20210913182512.1021618-1-philmd@redhat.com>
 <d57973da-49ac-f231-1652-cf78769e884a@redhat.com>
 <YUBbXjND2sZlXY7Z@redhat.com>
 <b71c0bc6-ee96-d8ae-b470-ae886d4863d8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b71c0bc6-ee96-d8ae-b470-ae886d4863d8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r5EVrZDJ8VBi2zsI"
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--r5EVrZDJ8VBi2zsI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 10:26:45AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 9/14/21 10:20 AM, Daniel P. Berrang=E9 wrote:
> > On Tue, Sep 14, 2021 at 07:41:47AM +0200, Thomas Huth wrote:
> >> On 13/09/2021 20.25, Philippe Mathieu-Daud=E9 wrote:
> >>> Add a page listing QEMU sponsors and displaying their logos.
> >>>
> >>> Logo sources:
> >>> - https://www.rackspace.com/es/newsroom/media-kit
> >>> - https://developer.arm.com/solutions/infrastructure/works-on-arm
> >>> - https://gitlab.com/fosshost/assets/logo
> >>> - https://www.linkedin.com/company/cip-united
> >>>
> >>> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> >>> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >>> ---
> >>> There are probably more, but I'm not aware of them.
> >>>
> >>> Maybe we should list past sponsors, precising a year range?
> >>
> >> I think we might have a hard time to compile a complete list, so I'd r=
ather
> >> not start that job.
> >>
> >>> ---
> >>>   _includes/nav.html      |   1 +
> >>>   sponsors.md             |  22 ++++++++++++++++++++++
> >>>   sponsors/cipunited.jpg  | Bin 0 -> 10607 bytes
> >>>   sponsors/fosshost.png   | Bin 0 -> 18251 bytes
> >>>   sponsors/rackspace.png  | Bin 0 -> 7363 bytes
> >>>   sponsors/worksonarm.png | Bin 0 -> 9965 bytes
> >>>   6 files changed, 23 insertions(+)
> >>>   create mode 100644 sponsors.md
> >>>   create mode 100644 sponsors/cipunited.jpg
> >>>   create mode 100644 sponsors/fosshost.png
> >>>   create mode 100644 sponsors/rackspace.png
> >>>   create mode 100644 sponsors/worksonarm.png
> >>>
> >>> diff --git a/_includes/nav.html b/_includes/nav.html
> >>> index 73b39b3..49ad4cd 100644
> >>> --- a/_includes/nav.html
> >>> +++ b/_includes/nav.html
> >>> @@ -8,6 +8,7 @@
> >>>   =09=09=09</li><li {% if current[1] =3D=3D 'contribute' %}class=3D'c=
urrent'{% endif %}><a href=3D"{{ relative_root }}/contribute">Contribute</a=
>
> >>>   =09=09=09</li><li {% if current[1] =3D=3D 'documentation' %}class=
=3D'current'{% endif %}><a href=3D"{{ relative_root }}/documentation">Docs<=
/a>
> >>>   =09=09=09</li><li><a href=3D"https://wiki.qemu.org">Wiki</a>
> >>> +=09=09=09</li><li {% if current[1] =3D=3D 'sponsors' %}class=3D'curr=
ent'{% endif %}><a href=3D"{{ relative_root }}/sponsors">Sponsors</a>
> >>
> >> Not sure whether we need that link on every page (i.e. in the navigati=
on
> >> menu)? Maybe it's enough to put the link somewhere on the home page?
> >=20
> > Yes, we definitely don't want this in the top navbar as it is irrelevan=
t
> > information to essentially every single visitor. We're only adding this
> > because one of the sponsors asked for it.
> >=20
> > I'd say it can be linked in the footer, adjacent to the link to
> > the SFC.
> >=20
> > Or maybe we just replace the SFC link with a link "About QEMU" and
> > on that page document that we're a member of the SFC and also
> > document official sponsors, and any other companies whose services
> > we rely on unofficially (eg the gitlab point below).
> >=20
> >>>   =09=09=09</li><li {% if current[1] =3D=3D 'blog' %}class=3D'current=
'{% endif %}><a href=3D"{{ relative_root }}/blog">Blog</a></li>
> >>>   =09=09</ul>
> >>>   =09</nav>
> >>> diff --git a/sponsors.md b/sponsors.md
> >>> new file mode 100644
> >>> index 0000000..da1bf19
> >>> --- /dev/null
> >>> +++ b/sponsors.md
> >>> @@ -0,0 +1,22 @@
> >>> +---
> >>> +title: QEMU sponsors
> >>> +permalink: /sponsors/
> >>> +---
> >>> +
> >>> +QEMU has sponsors!
> >>> +
> >>> +The website is hosted by [Rackspace Technology](https://www.rackspac=
e.com/).
> >>> +
> >>> +For continuous integration and testing, hardware is provided by:
> >>> +- Arm and Equinix Metal via the [Works on Arm program](https://www.w=
orksonarm.com/)
> >>> +- [Fosshost](https://fosshost.org/)
> >>> +- [CIP United](https://www.cipunited.com/)
> >>> +
> >>> +
> >>> +![Rackspace Technology](rackspace.png)
> >>> +
> >>> +![Works on Arm](worksonarm.png)
> >>> +
> >>> +![Fosshost](fosshost.png)
> >>> +
> >>> +![CIP United](cipunited.jpg)
> >>
> >> Some remarks:
> >>
> >> 1) Could you please use the original URLs as source for the pictures i=
nstead
> >> of copying them over into our website? Some folks don't like it when t=
heir
> >> images are copied...
> >=20
> > More importantly than that, do the trademark terms for each company
> > here permit us to actually use their logo on our website ?
>=20
> Hmm I'll simply list the company names to start.
> I assume Fosshost is OK because they asked us to put it.

I would only include organizations that ask us to display sponsorship
information to keep things simple.

I don't remember Rackspace asking to be associated with QEMU. We don't
have a direct relationship with them but are part of their generous open
source hosting offer through Software Freedom Conservancy.

I'm not sure about ARM or CIP United.

Stefan

--r5EVrZDJ8VBi2zsI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFAlqMACgkQnKSrs4Gr
c8h+4ggAhc+NQeTOBib3t1i592E9K4kdGWTbT35xyMp5krR9T0eKrA7mmpfzxJH8
RI+mrBtWPKTmSjekfxnjhOmhzhsCb2JfcNd6p6BvGdE/ZYGNsAjosHeOlLFUcde6
2yEcJOBLcxAmpRDmEQO5NyJMqVk9tUhvWNfiA+ETrpwdhhUPrfKMgQGl1fv0bs3f
QAThEMBCJzV8bjNVM5AsiRlPA/7WDFa4n+7jEHNiotkMLQfrMY7KJzjzydsoHGnE
B4jDIObLicCDcAcOZGMbMa3maLs1q3QoqYHC9GC4au42MyeL5rWWTNqn4U2ywgg6
J1ygcBjVf6EzyUWpX6qh3YidJMd7og==
=PJx0
-----END PGP SIGNATURE-----

--r5EVrZDJ8VBi2zsI--


