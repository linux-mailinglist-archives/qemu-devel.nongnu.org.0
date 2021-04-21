Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87072368021
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:18:34 +0200 (CEST)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYHx-0008G7-Bi
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZY9v-0004tn-Pt
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZY9r-0002O0-GG
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619093408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R5Z25tGEmAqz4YAGqBp4acEctT2MlSdpvyeUtti09Uo=;
 b=EDfbAMGIQcvcbpui7ZZ38JK70NqH4NaV6w0PBHeQio3M+tHph7X9XL7sZoakxuyhu0WFa2
 l+SCdHOB41XeGXisrRTPrXsq+AyfbYT0vmOmI8RI8/eHvPV6u9J78crRhR3PKXNnV+3k+n
 2lz+nMdQ7ObRMhVE35r/nYErlZdlecQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-dRIRxui9PemNQ-WX5wuFJQ-1; Thu, 22 Apr 2021 08:10:03 -0400
X-MC-Unique: dRIRxui9PemNQ-WX5wuFJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B9F8343B6;
 Thu, 22 Apr 2021 12:09:48 +0000 (UTC)
Received: from localhost (ovpn-112-237.rdu2.redhat.com [10.10.112.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6497319C45;
 Thu, 22 Apr 2021 12:09:48 +0000 (UTC)
Date: Wed, 21 Apr 2021 15:54:29 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 0/7] tests/acceptance: Handle tests with "cpu" tag
Message-ID: <20210421195429.GA2153290@amachine.somewhere>
References: <20210408195237.3489296-1-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408195237.3489296-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:52:30PM -0300, Wainer dos Santos Moschetta wrote=
:
> Currently the acceptance tests tagged with "machine" have the "-M TYPE"
> automatically added to the list of arguments of the QEMUMachine object.
> In other words, that option is passed to the launched QEMU. On this
> series it is implemented the same feature but instead for tests marked
> with "cpu".
>=20
> There is a caveat, however, in case the test needs additional arguments t=
o
> the CPU type they cannot be passed via tag, because the tags parser split
> values by comma. For example, in tests/acceptance/x86_cpu_model_versions.=
py,
> there are cases where:

Hi Wainer,

I've created an Avocado issue to hopefully get rid of this limitation:

   https://github.com/avocado-framework/avocado/issues/4541

>=20
>   * -cpu is set to "Cascadelake-Server,x-force-features=3Don,check=3Doff,=
enforce=3Doff"
>   * if it was tagged like "cpu:Cascadelake-Server,x-force-features=3Don,c=
heck=3Doff,enforce=3Doff"
>     then the parser would break it into 4 tags ("cpu:Cascadelake-Server",
>     "x-force-features=3Don", "check=3Doff", "enforce=3Doff")
>   * resulting on "-cpu Cascadelake-Server" and the remaining arguments ar=
e ignored.
>=20
> It was introduced the avocado_qemu.Test.set_vm_arg() method to deal with
> cases like the example above, so that one can tag it as "cpu:Cascadelake-=
Server"
> AND call self.set_vm_args('-cpu', "Cascadelake-Server,x-force-features=3D=
on,check=3Doff,enforce=3Doff"),
> and that results on the reset of the initial value of -cpu.
>

So for now this seems reasonable enough.

> This series was tested on CI (https://gitlab.com/wainersm/qemu/-/pipeline=
s/277376246)
> and with the following code:
>=20
> from avocado_qemu import Test
>=20
> class CPUTest(Test):
>     def test_cpu(self):
>         """
>         :avocado: tags=3Dcpu:host
>         """
>         # The cpu property is set to the tag value, or None on its absenc=
e
>         self.assertEqual(self.cpu, "host")
>         # The created VM has the '-cpu host' option
>         self.assertIn("-cpu host", " ".join(self.vm._args))
>         self.vm.launch()
>=20
>     def test_cpu_none(self):
>         self.assertEqual(self.cpu, None)
>         self.assertNotIn('-cpu', self.vm._args)
>=20
>     def test_cpu_reset(self):
>         """
>         :avocado: tags=3Dcpu:host
>         """
>         self.assertIn("-cpu host", " ".join(self.vm._args))
>         self.set_vm_arg("-cpu", "Cascadelake-Server,x-force-features=3Don=
")
>         self.assertNotIn("-cpu host", " ".join(self.vm._args))
>         self.assertIn("-cpu Cascadelake-Server,x-force-features=3Don", " =
".join(self.vm._args))
>

We should not let this type of testing go to waste, so it's about time
to set aside a directory for tests that are about the framework,
rather than end user functionality.  I'll take a look at that.

Cheers,
- Cleber.

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCAgvIACgkQZX6NM6Xy
CfOubg/8DLV1Bkche4HU96fwbbYG7JhPjo2k0rn95qNdsnUA1V0EonLT6S4Uz+Kl
epGls/mtIsvwximOVEqZJJzPUfKuSVP00azkt9VqhSsyIqK5HQ8weSLH1b4agCRw
wY/B9nYLndlh3EEyhN0xh1hHGfb4ELhh1+gbN8L+SIL9d7SquHyHwvbRA1gnebkY
qZg59hlicEJK6pu7+BzGZLT5enFgL9572IY/Fa/fTrOFvFa5RxONyeFAUZwfKu9Z
I2dIxPchpLKpFHLTJJKTZjlbbgMKWhYdS2KhxHLiLIBtXaFCaIh0CMy+K+CIhCRK
HJzGMIjzY5oymqkNRdl8PRCkPFGeS1WuQC2+qDXJiREThMwEPHpYkql/dueRkpVl
uFEjBp1mX28ge2IdBEwNwDGOg6C3+eYPnzC7W22HHwT0/BQiAWAra4CLcPfyE62s
T60lxJ0SCQ0TqD49A+5BU1q5pfQMrLsrnzjm8NLZERlLRiZHQzIwaWmt3r9/GZru
/gwV/xcguOYi7+lm92q/J1tIbyptXjhDxjXR0/rzdW4ZwnTf6xPiuZ2UAX5B/Vp1
IAFvvsQB7P7KkYtca2v+Ax67xAcR03uVuxdp5tKtMiidtqok70JW18FQc5KCr6CV
PQ+3pSiaykbuY7ipiHUWjYB1SsfNylbEXWOtLvRqwrBjOG/AVxw=
=HmAT
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


