Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77503C8642
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:39:08 +0200 (CEST)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3g2W-0006I2-1j
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3g17-0005NT-Lo
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3g15-0008JY-Jm
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626273458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l/kRzRKCGs1t2BU4h+ieHvNVehr5W+CXrOo32amVqLc=;
 b=T9//mq7GWNTR3Hl6GCO/YSDS67OF+mZwUus29SVSLl4Y3h5vrwKUzFgACaYJCiIlRHEwdd
 nGlHkxMJkrQ6g/Th1Sa1vVvYGpkWR0MUdp3VHsat14x7sGpXo3rNG+Q/bgkPGQ4WUlbenO
 aYM1a554l+hin49i1ySY9kgaaSuceqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-wh7iE8WUO4mSvjTmngioCw-1; Wed, 14 Jul 2021 10:37:34 -0400
X-MC-Unique: wh7iE8WUO4mSvjTmngioCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB1901023F46;
 Wed, 14 Jul 2021 14:37:32 +0000 (UTC)
Received: from localhost (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD1141002D71;
 Wed, 14 Jul 2021 14:37:28 +0000 (UTC)
Date: Wed, 14 Jul 2021 15:37:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/acceptance: Add tests for the Pegasos2 machine
Message-ID: <YO72pzyK1eaRazgz@stefanha-x1.localdomain>
References: <20210713014342.3086855-1-crosa@redhat.com>
 <78d672f2-9cd2-adae-502a-f72110ed7e6c@amsat.org>
MIME-Version: 1.0
In-Reply-To: <78d672f2-9cd2-adae-502a-f72110ed7e6c@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8USeLp8UCZ2jRQsl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8USeLp8UCZ2jRQsl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 11:37:54AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 7/13/21 3:43 AM, Cleber Rosa wrote:
> > +@skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
> > +class PPCPegasos2(Test):
> > +    """These tests require a Pegasos2 ROM.  You need to perform a one
> > +    time manual set up of the ROM, registering it with the Avocado
> > +    assets system.  Please follow the steps bellow from a QEMU build
> > +    directory, replaceing $MY_ROMS_DIR with a suitable directory.
> > +
> > +    1. make check-venv
> > +    2. curl http://web.archive.org/web/20071021223056/http://www.bplan=
-gmbh.de/up050404/up050404 -o $MY_ROMS_DIR/up050404
> > +    3. tail -c +85581 /tmp/up050404 | head -c 524288 > $MY_ROMS_DIR/pe=
gasos2.rom
>=20
> Sorry but I am not signing for this patch description. I don't think
> the project should link non-free software like this; which is why I
> only listed the recipe link in the commit description. Maybe we can
> simply add this link here again.
>=20
> Stefan do you know what is recommended?

I think that it's okay to include instructions for manually adding
non-free software, but I'm not a lawyer.

I don't know what the origin of this up050404 file is and under what
license it is available. Could you add that information so users can
make their own decision on whether or not to manually install it?

Thanks,
Stefan

--8USeLp8UCZ2jRQsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDu9qcACgkQnKSrs4Gr
c8gPVwgAohoQqXBz2ErqLrWO1KlXvk63lrsfIOJ9mGFwhN5z7b3xAz1OebMt2tCk
4W3GFdz/fMHUdrpsDa5gNYIkS/jxHu+Qg6+TozD+0pQyKv/QsvpalR6iL78BN1p/
WGpoofOoLr5KmyJcbGrdqIrIGaYBdV3sXiyTkECl8oAuZTanxx1PJM8Qia96Yzgr
CsrujGvuiQqjn92YNeUUAcckDWhGB6tq/QTjBOxT8KSAV8OrBddOqB3Q13cB6TZ9
Rhyu4Rf7Hy2Y3w0HLk087fHvdrtCU4e5DFAg3OBCyiLvdypSIVxsRjaRv4Tg1mC3
ES4itUbkBQ0AE6vWiEaKww+y8imLgg==
=axzK
-----END PGP SIGNATURE-----

--8USeLp8UCZ2jRQsl--


