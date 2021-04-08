Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D3358964
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:13:09 +0200 (CEST)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXHH-0008Le-Th
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lUX9T-0000N1-9W
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:05:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lUX9Q-0001PV-1b
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617897898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ya8hVrvA6etXvcdqaP3utPf/XfMVZRKVznYSrRpLPB0=;
 b=DapoP3nWuwPWJgsNLYjO0GUA0rIgQkWeaAyTC+DQUUp3JvNEK36PlCV8n2yCfRXIfc6JjZ
 4eCeAeNB+Zwnb6gY5ayTuG4dAM5Aui7i2clwXRzP97TPveplxWLW/pBudjo+HCI/yUSS8/
 3p/bK7JueWxfiLz1N3NEMiM16OKYbpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-SQWjJ5RLMviQK73K1aD_VQ-1; Thu, 08 Apr 2021 12:04:55 -0400
X-MC-Unique: SQWjJ5RLMviQK73K1aD_VQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9E7FCC622;
 Thu,  8 Apr 2021 16:04:54 +0000 (UTC)
Received: from localhost (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 305825D6AC;
 Thu,  8 Apr 2021 16:04:54 +0000 (UTC)
Date: Thu, 8 Apr 2021 17:04:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
Message-ID: <YG8ppS1JqgHHiHqp@stefanha-x1.localdomain>
References: <20210407104511.343061-1-stefanha@redhat.com>
 <025a45d2-1191-ba09-7d3b-ce748794563f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <025a45d2-1191-ba09-7d3b-ce748794563f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IWqrUABq2SxhCojy"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qin Wang <qinwang@rehdat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IWqrUABq2SxhCojy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 12:37:36PM +0200, Laurent Vivier wrote:
> On 07/04/2021 12:45, Stefan Hajnoczi wrote:
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
> >  tests/qtest/libqtest.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 71e359efcd..2fc249c0b5 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -910,6 +910,14 @@ const char *qtest_get_arch(void)
> >          abort();
> >      }
> > =20
> > +    if (strcmp(end + 1, "kvm") =3D=3D 0) {
> > +        fprintf(stderr, "QTEST_QEMU_BINARY must end with *-<arch>. If =
you are "
> > +                        "using qemu-kvm, please create a symlink like =
ln -s "
> > +                        "path/to/qemu-kvm qemu-system-x86_64 and use t=
hat "
> > +                        "instead.\n");
> > +        abort();
> > +    }
> > +
> >      return end + 1;
> >  }
> > =20
>=20
> I think it would be more generic to check we have the "-system-" string i=
n the name.

Nice. I will send a v2.

Stefan

--IWqrUABq2SxhCojy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBvKaUACgkQnKSrs4Gr
c8iRAwf/R4LRC+QEhWQgZ7SnesTpFeZQ0PLQK36mwYFHf/RcRWtavmzAYZ/Tf37a
Wv6pUoL3gz6+C3VDcmIvRwg0CygT8vBO8db0NhbfI5L09QL8DN4s0rrBo/bEewM9
9P4D434DkkEhVUCLo71KQ4pkP+PYhcjpBblHftx3Rz2xp124aAmsBvwunOHkvGz/
DjgKpTxDbfB2KVEHdxYnVDz7TriSvUKVR8S0cuxNRshg5B+mjYM7HlZgiTM01jVK
bucIVAN7IAGSqPzo5hh4MmNNoNchOpB+KCQ8htTMl/7ezbs5bMZNtaoIp0lypBwG
Y41u+j8Trp0lyVu5TUNrzY24PbZjmg==
=/wtd
-----END PGP SIGNATURE-----

--IWqrUABq2SxhCojy--


