Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D563F2E19
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:31:22 +0200 (CEST)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5YH-00080b-SN
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mH5Ur-0002Na-Vb
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mH5Up-0002ix-Ho
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629469666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/VMeNK06yiC0ZmN1z5YvSw1pVl050Ne8BriVzC45uvU=;
 b=OjsKTdFfZrJ4dwg95N4PevRfC7e/ZTZBnDu6q/lMJRcDTy/6TVeayKn16ywTDCtORbBE/m
 FNF9z4gED++72ocKr2sinz1bGdFZXC1ZfvSoNe86IAqpslUe9gJBGYhaHuH9Rcz7Mp4kwo
 iKfMxTHfHtLg7x9e9+OPma97rHqVO8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-Xmb0SRKQP-KJglh1swBaUw-1; Fri, 20 Aug 2021 10:27:44 -0400
X-MC-Unique: Xmb0SRKQP-KJglh1swBaUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A8D1B18BC0
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 14:27:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37DCC1036D04;
 Fri, 20 Aug 2021 14:27:40 +0000 (UTC)
Date: Fri, 20 Aug 2021 15:27:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
Message-ID: <YR+71uio1KT40tc+@stefanha-x1.localdomain>
References: <20210819102501.69638-1-hreitz@redhat.com>
 <YR6FauCbECxehubc@stefanha-x1.localdomain>
 <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9IH7g4qrM91f7j9U"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9IH7g4qrM91f7j9U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 09:56:54AM +0200, Hanna Reitz wrote:
> On 19.08.21 18:23, Stefan Hajnoczi wrote:
> > On Thu, Aug 19, 2021 at 12:25:01PM +0200, Hanna Reitz wrote:
> > > This post explains when FUSE block exports are useful, how they work,
> > > and that it is fun to export an image file on its own path so it look=
s
> > > like your image file (in whatever format it was) is a raw image now.
> > >=20
> > > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > > ---
> > > You can also find this patch here:
> > > https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
> > >=20
> > > My first patch to qemu-web, so I hope I am not doing anything overly
> > > stupid here (adding SVGs with extremely long lines comes to mind)...
> > > ---
> > >   _posts/2021-08-18-fuse-blkexport.md       | 488 +++++++++++++++++++=
+++
> > >   screenshots/2021-08-18-block-graph-a.svg  |   2 +
> > >   screenshots/2021-08-18-block-graph-b.svg  |   2 +
> > >   screenshots/2021-08-18-block-graph-c.svg  |   2 +
> > >   screenshots/2021-08-18-block-graph-d.svg  |   2 +
> > >   screenshots/2021-08-18-block-graph-e.svg  |   2 +
> > >   screenshots/2021-08-18-root-directory.svg |   2 +
> > >   screenshots/2021-08-18-root-file.svg      |   2 +
> > >   8 files changed, 502 insertions(+)
> > >   create mode 100644 _posts/2021-08-18-fuse-blkexport.md
> > >   create mode 100644 screenshots/2021-08-18-block-graph-a.svg
> > >   create mode 100644 screenshots/2021-08-18-block-graph-b.svg
> > >   create mode 100644 screenshots/2021-08-18-block-graph-c.svg
> > >   create mode 100644 screenshots/2021-08-18-block-graph-d.svg
> > >   create mode 100644 screenshots/2021-08-18-block-graph-e.svg
> > >   create mode 100644 screenshots/2021-08-18-root-directory.svg
> > >   create mode 100644 screenshots/2021-08-18-root-file.svg
> > Great! Two ideas:
> >=20
> > It would be nice to include a shoutout to libguestfs and mention that
> > libguestfs avoids exposing the host kernel's file systems and partion
> > code to untrusted disk images. If you don't mount the image then the
> > FUSE export has similar security properties.
>=20
> Oh, right!=C2=A0 Absolutely.
>=20
> Though now I do wonder why one would actually want to use QEMU=E2=80=99s =
FUSE
> exports then...
>=20
> Looks like the performance isn=E2=80=99t as bad as I claimed (for me arou=
nd 1.5G/s
> for reading/writing from/to a raw image on tmpfs), so perhaps that=E2=80=
=99s one
> point.=C2=A0 Another is probably that FUSE exports are better suited when=
 you
> actually want access to the whole image.=C2=A0 I guess.

I see a use case for applications that want to do something with the
disk image data themselves, e.g. backup, entropy, data recovery, etc.
They could use NBD but opening a regular file on a FUSE file system is
even easier.

The host kernel won't be exposed, so it's reason as long as the
application itself isn't doing anything risky (e.g. no parsing or parser
written in a memory-safe language).

Stefan

--9IH7g4qrM91f7j9U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEfu9UACgkQnKSrs4Gr
c8hFDwf/feeeTCqLSluXBLUC2s/gYs63zEK/HECTz+y3KgQEaOTxxw+GyYNpoTcQ
rhwM/mk3XM4wwUVYbo+baUqoPlgAvaJ+NQTSmsvC8ukaTp+OnZbBm/IkzB/5Jl/A
c3df4Ob5dWc+/8JIE0McJSGFYcbzQTbl/usaY/uuXkhCrb8OxQ++L3EbQEerQMxa
l9U7cRx9JGHHso3UQh3Xm75cLfJl8lRupXYrnfuSys+3nr/X2ukpT8gaO22cnCm5
0I491CtgIRWd1SBvGPWjNZEbWZK7xhroXQZnIel4VV70fyjiEvZQfHohxmAafR6W
biIZNPheNMznUHV4P4gHoMKTNA96Mw==
=58hg
-----END PGP SIGNATURE-----

--9IH7g4qrM91f7j9U--


