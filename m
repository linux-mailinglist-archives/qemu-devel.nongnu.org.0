Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B336801B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:15:03 +0200 (CEST)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYEY-0006a6-5e
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZY9y-0004yv-Up
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZY9t-0002Pu-HL
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619093412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9TQJC1KLVsy43MRJYAXZ9EmjUCnPpeGZp0lsjRjmCx8=;
 b=EZH2f92+vT4jRe5aNapZLmpDGlvbZK4P0eLBewqm49B1E6+PeNW0QKac2OVG0fudXW6iaG
 aANjiZQny1B/9ZA35ha5jUbVsW+h+h3mpGxcGYvbwsDC5utD7QyOr23l/GfpCKlAXYV5H9
 vvVmAHiGE0fvGeYr6lrzuQPX1QRvbgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-NXYv37HLMPm-EVdvxSYNHg-1; Thu, 22 Apr 2021 08:10:04 -0400
X-MC-Unique: NXYv37HLMPm-EVdvxSYNHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D90F010979CB;
 Thu, 22 Apr 2021 12:09:46 +0000 (UTC)
Received: from localhost (ovpn-112-237.rdu2.redhat.com [10.10.112.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4215417A62;
 Thu, 22 Apr 2021 12:09:46 +0000 (UTC)
Date: Wed, 21 Apr 2021 16:16:03 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 1/7] tests/acceptance: Automatic set -cpu to the test vm
Message-ID: <20210421201603.GB2153290@amachine.somewhere>
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-2-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408195237.3489296-2-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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

--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:52:31PM -0300, Wainer dos Santos Moschetta wrote=
:
> This introduces a new feature to the functional tests: automatic setting =
of
> the '-cpu VALUE' option to the created vm if the test is tagged with
> 'cpu:VALUE'. The 'cpu' property is made available to the test object as w=
ell.
>=20
> For example, for a simple test as:
>=20
>     def test(self):
>         """
>         :avocado: tags=3Dcpu:host
>         """
>         self.assertEqual(self.cpu, "host")
>         self.vm.launch()
>

So I tried a few tests with different CPU models and it works as
expected.  One minor caveat is that using "host" has side effects
in some cases, causing tests to fail because they may also require
KVM to be enabled.

But this is a generic mechanism so I don't think it should be
concerned with that.

> The resulting QEMU evocation will be like:
>=20
>     qemu-system-x86_64 -display none -vga none -chardev socket,id=3Dmon,p=
ath=3D/var/tmp/avo_qemu_sock_pdgzbgd_/qemu-1135557-monitor.sock -mon charde=
v=3Dmon,mode=3Dcontrol -cpu host

Only thing is: can we please just break this line (I could not ignore
a 174 character line :).

>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  docs/devel/testing.rst                    | 17 +++++++++++++++++
>  tests/acceptance/avocado_qemu/__init__.py |  5 +++++
>  2 files changed, 22 insertions(+)

With the line broken mentioned above (which I can take care of when
queueing this patch):

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCAiAAACgkQZX6NM6Xy
CfMN5hAAnBEqcxhpQEWtEvvVPVQ3OHFKPLxoCGS5bT9vP87nfmBp2KTFhHfvBwGg
FC90Aq3/xhLFPhT4PyMYvj+pVCDbhcA0+j3k4X1hrlVyMjpSZAn32qO3TQRzPsqe
k42PM2als3n4d6aEsOOgo1ZKJK7WBGf3FC5lMS3R4KIG0Z7iXOlJBCBsj31uEmta
Oy4+b8/q672/cL6+ZIrHM3PH5calsm6PYw1WWZMRRueTLgGQkjKrw4zJqgp88gE3
3XtagXtnnUEyqqnMF+d848JtqbH8CJyhqF0Mu/PoO6JsSiVVEVs2J1BAzM9QcYB/
Z63haw8t6o2CMxwXEycjcleMjOqdlzIj/MNF1rSeoh/OWS2QDtFNOiGLbT+NRNrJ
GIkJLHke7BUUJJhPUgXNiF94EQSCLOP+IS2/JROFLA+PONzzrYrlP6mgR4Hq/he6
OPNCfMRM5UiKxG+92L0hnNoCOkJ+MFfSkluj2IAnoxq51a2J5XfsCLD5iOZJLq1k
cAkB6lLuVOlB0PAiXEEjRIXRUAkt/jkSj2tPeBbvrcjt1tS5Sx7eMsGcJmy8sDUt
cIVTOv3Wi1jbwn+qj294rLjZ2ahY6KdTH3clgHpspC/DTETMBD0NlRb01BBTZDme
dMXIF3+WaOoeDTMbOomPEXXoyxMzfp+fPK6VeqOpgqQd0bdkDv0=
=KDA0
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--


