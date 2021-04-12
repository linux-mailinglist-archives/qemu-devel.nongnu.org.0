Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9D35C8A8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:23:35 +0200 (CEST)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxTR-000703-Vl
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxRT-0005Wa-UE
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxRO-0008JR-50
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618237284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hko22Yr/ET7npvffo9nh/ipxo+jSHGcEDiT0Ff4j7vM=;
 b=QTZKKysU9z+R4Zm8kvqx3U77cEbELNOqcDfcHKrBNrMxsJxStu8Eyg3SKHj4zwcnGuxHEU
 dDGfB69qvLmEPuancODC4tAWBrKzFXopbk4/0ezNIeCmxQqY1WnSHXpFS5GH300wzJ/gK8
 u3yMNove6JApNV1V9fU0ZYLI+0CakAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-JvsYDFcZPYeWSrLoYS1reQ-1; Mon, 12 Apr 2021 10:21:20 -0400
X-MC-Unique: JvsYDFcZPYeWSrLoYS1reQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE448107ACCD;
 Mon, 12 Apr 2021 14:21:18 +0000 (UTC)
Received: from localhost (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A77219744;
 Mon, 12 Apr 2021 14:21:17 +0000 (UTC)
Date: Mon, 12 Apr 2021 15:21:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
Message-ID: <YHRXXK7RxglGt+zE@stefanha-x1.localdomain>
References: <20210412091824.707855-1-stefanha@redhat.com>
 <942ea12a-d187-9533-eba6-298c4eb7d82d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <942ea12a-d187-9533-eba6-298c4eb7d82d@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kn1+3XLPeOoG4e3r"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Qin Wang <qinwang@rehdat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Kn1+3XLPeOoG4e3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 11:35:40AM +0200, Thomas Huth wrote:
> On 12/04/2021 11.18, Stefan Hajnoczi wrote:
> > Some downstreams rename the QEMU binary to "qemu-kvm". This breaks
> > qtest_get_arch(), which attempts to parse the target architecture from
> > the QTEST_QEMU_BINARY environment variable.
> >=20
> > Print an error instead of returning the architecture "kvm". Things fail
> > in weird ways when the architecture string is bogus.
> >=20
> > Arguably qtests should always be run in a build directory instead of
> > against an installed QEMU. In any case, printing a clear error when thi=
s
> > happens is helpful.
> >=20
> > Reported-by: Qin Wang <qinwang@rehdat.com>
> > Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   tests/qtest/libqtest.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >=20
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 71e359efcd..7caf20f56b 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -910,6 +910,16 @@ const char *qtest_get_arch(void)
> >           abort();
> >       }
> > +    if (!strstr(qemu, "-system-")) {
> > +        fprintf(stderr, "QTEST_QEMU_BINARY must end with *-system-<arc=
h> where "
> > +                        "'arch' is the target architecture (x86_64, aa=
rch64, "
> > +                        "etc). If you are using qemu-kvm or another cu=
stom "
> > +                        "name, please create a symlink like ln -s "
> > +                        "path/to/qemu-kvm qemu-system-x86_64 and use t=
hat "
> > +                        "instead.\n");
>=20
> The text is very long ... maybe add some \n to wrap it after 80 columns?
> (also not sure whether we really need the second part about the symlink..=
.
> but I also don't mind leaving it in)
>=20
> > +        abort();
>=20
> Since this can be triggered by the user, I'd rather use exit(1) instead,
> what do you think?

Sure, but in that case I guess the abort() call above also needs to be
changed? It is triggered when the QTEST_QEMU_BINARY path does not
contain a hyphen ('-') and it currently aborts.

Stefan

--Kn1+3XLPeOoG4e3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB0V1wACgkQnKSrs4Gr
c8hCJQgAhw05NFoWVDe9eHIjNMoZQO9V7Q+SwvZk72kZqUGx8VAJEWjp4bvELh2J
9Jz4XhV+C5Pir2UPbN11VkeJ4uobZUszLfjg8RFnTp3gwpWmrV0Ag16rif15Amtb
Lp7jbiy3fOpkFS3uIIFFc/X/JAXEzRPD7WWWMcWaO6k/I3k0md0VGF9GlzxGR/9V
eRHIjEfrvYlq4urwNuNFgWOB304Zoo1JNID36byp1cVdxGqFyeNWS9Fp4z37McEf
sXIZM1dsv6sbDPgy3N5mnGoK5okZJFtJOU2JTJ6P8qXq0KFqpoXHST8YOYXvZxlh
BonB+cB5NwcodHWahtmkifbWimTOzg==
=nx7t
-----END PGP SIGNATURE-----

--Kn1+3XLPeOoG4e3r--


