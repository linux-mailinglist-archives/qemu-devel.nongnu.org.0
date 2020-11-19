Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6322B8F37
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:46:09 +0100 (CET)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfgVz-0008CS-Ls
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfgUu-0007bs-It
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:45:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfgUs-00075w-Eu
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605779097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5g4Kh6qwszvTHQsX7C8qUTAu+OPHqB44FSDkDlsjkrs=;
 b=P2XowrgBHemOMCWgZqy3KLogAUAkWtVRe5E6oDhWi1nyRnyvx0hNoAfAxyVRlrUZn776uk
 Iv2t883Mx1g45sRdUSCsSjOtqUNsoeiWtbSaTPiyCpnIRSd21IvXZVsKqAlbQJ9zbOq9IP
 f/dULpt9TF0w4RYN59d4t+CA2ZrlVOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-kxlSOO6NNQ-j2zwxFym32g-1; Thu, 19 Nov 2020 04:44:52 -0500
X-MC-Unique: kxlSOO6NNQ-j2zwxFym32g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69840C73A0;
 Thu, 19 Nov 2020 09:44:51 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B271960C05;
 Thu, 19 Nov 2020 09:44:47 +0000 (UTC)
Date: Thu, 19 Nov 2020 09:44:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] trace: use STAP_SDT_V2 to work around symbol visibility
Message-ID: <20201119094446.GB701869@stefanha-x1.localdomain>
References: <20201118174809.686094-1-stefanha@redhat.com>
 <20201118175128.GH229461@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118175128.GH229461@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 rjones@redhat.com, fche@redhat.com, kraxel@redhat.com, wcohen@redhat.com,
 mrezanin@redhat.com, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 05:51:28PM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Nov 18, 2020 at 05:48:09PM +0000, Stefan Hajnoczi wrote:
> > QEMU binaries no longer launch successfully with recent SystemTap
> > releases. This is because modular QEMU builds link the sdt semaphores
> > into the main binary instead of into the shared objects where they are
> > used. The symbol visibility of semaphores is 'hidden' and the dynamic
> > linker prints an error during module loading:
> >=20
> >   $ ./configure --enable-trace-backends=3Ddtrace --enable-modules ...
> >   ...
> >   Failed to open module: /builddir/build/BUILD/qemu-4.2.0/s390x-softmmu=
/../block-curl.so: undefined symbol: qemu_curl_close_semaphore
> >=20
> > The long-term solution is to generate per-module dtrace .o files and
> > link them into the module instead of the main binary.
> >=20
> > In the short term we can define STAP_SDT_V2 so /usr/bin/dtrace produces
> > an .o file with 'default' symbol visibility instead of 'hidden'. This
> > workaround is small and easier to merge for QEMU 5.2.
> >=20
> > Cc: Daniel P. Berrang=E9 <berrange@redhat.com>
> > Cc: wcohen@redhat.com
> > Cc: fche@redhat.com
> > Cc: kraxel@redhat.com
> > Cc: rjones@redhat.com
> > Cc: mrezanin@redhat.com
> > Cc: ddepaula@redhat.com
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  trace/meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/trace/meson.build b/trace/meson.build
> > index d5fc45c628..52be7c5b2c 100644
> > --- a/trace/meson.build
> > +++ b/trace/meson.build
> > @@ -44,7 +44,7 @@ foreach dir : [ '.' ] + trace_events_subdirs
> >        trace_dtrace_o =3D custom_target(fmt.format('trace-dtrace', 'o')=
,
> >                                       output: fmt.format('trace-dtrace'=
, 'o'),
> >                                       input: trace_dtrace,
> > -                                     command: [ 'dtrace', '-o', '@OUTP=
UT@', '-G', '-s', '@INPUT@' ])
> > +                                     command: [ 'dtrace', '-DSTAP_SDT_=
V2', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
>=20
> I'm a little concerned that we're not also setting this macro before
> including the generated trace.h headers, because those headers do
> check this STAP_SDT_V1 symbol.
>=20
> Currently the generated headers have same code for V2 and V3 (the default=
),
> so we won't break, but I'm concerned we could break if they introduce a
> future V4 and that impacts the generated headers.
>=20
> So I think the safe thing todo is set -DSTAP_SDT_V2 as a global compile
> arg for QEMU too, so all trace.h files see the symbol that matches the
> trace.o files

I have grepped systemtap.git and setting STAP_SDT_V2 globally seems
fine. Originally I wasn't sure of its side-effects, but I'm more
confident about using it after checking the SystemTap code. Will send a
v2.

Input from Frank or William would be appreciated though!

Stefan

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2Po4ACgkQnKSrs4Gr
c8grCAf9FtLNriGgwd44xWAYGA79LvM5rljVQkaWsJTRFUwCpiIu+qR5f9ZS5ed2
5Sq1NiZbYqKsy/n/3RzHJXSY0i56HMIvO29wynyv641/DzDfWf/74xX+X7VaeVKf
0XaOrn95iNlXWdsj4Y2po0fhDNB7sDqVwRSxTFHSZrO2HUDAtX8lK1D6fULQnAl/
LXDcoiTYt+GZleGis8FxggrKL2m/rlxL4jow5iGD4H4ExYATcu1xFEs0/EAS7uDE
ySlC/K/nJNcYsfLZKlPefGuBC5aoKshyojhVhNwuEMD+RijeMbvLLVVEE0Xz43DS
U/Tdhn8cADIBXizvWEq0ARyBRWuYlg==
=K9CW
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--


