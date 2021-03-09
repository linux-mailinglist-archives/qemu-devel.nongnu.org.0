Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1D331C45
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 02:22:02 +0100 (CET)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJR4S-0005Yg-U9
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 20:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJR1b-0004aN-JD
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 20:19:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJR1Y-00046Z-JL
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 20:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615252736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wlSCCUSf97Ag+AxaGPYqFOBo4oVvRd4ibi83nlH9wg4=;
 b=f/pjihbij0UaPQSruuuxxL+xMQ1pqDAd82ASAb/DLj3Yl4Sb2MEEEYQFqzPXfvH1zOeyOh
 knQ0SPYMrDq0nitA4AENAkeI7+jGHTUP02EueeE+LhdXt5HdUZhzzfzpqqe4iL1WyRUyWz
 Z/PAJrcE7RDbZ7xZ3hr8iGJ6ftMfwdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-AoF9O72yPPi6X4PEk5HQMQ-1; Mon, 08 Mar 2021 20:18:52 -0500
X-MC-Unique: AoF9O72yPPi6X4PEk5HQMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE0A08189D3;
 Tue,  9 Mar 2021 01:18:50 +0000 (UTC)
Received: from localhost (ovpn-117-250.rdu2.redhat.com [10.10.117.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C6B91037E83;
 Tue,  9 Mar 2021 01:18:38 +0000 (UTC)
Date: Mon, 8 Mar 2021 20:17:49 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [PATCH v3 2/2] tests: Add functional test for out-of-process
 device emulation
Message-ID: <20210309011749.GB2038092@amachine.somewhere>
References: <20210303205320.146047-1-willianr@redhat.com>
 <20210303205320.146047-3-willianr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210303205320.146047-3-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 05:53:20PM -0300, Willian Rampazzo wrote:
> From: Jagannathan Raman <jag.raman@oracle.com>
>=20
> Runs the Avocado acceptance test to check if a
> remote lsi53c895a device gets identified by the guest.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> [WR: Refactored code]
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/multiprocess.py | 95 ++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 tests/acceptance/multiprocess.py
>

Because of KVM requirement, tested on x86_64 host:

   ./tests/venv/bin/avocado run -t arch:x86_64 tests/acceptance/multiproces=
s.py=20
   JOB ID     : bde34ca2168ce031f3fbdbb5091889fb9bc4b977
   JOB LOG    : /home/cleber/avocado/job-results/job-2021-03-08T20.16-bde34=
ca/job.log
    (1/1) tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x=
86_64: PASS (5.80 s)
   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |=
 CANCEL 0
   JOB TIME   : 6.23 s

And on aarch64 host:

   $ ./tests/venv/bin/avocado run -t arch:aarch64 tests/acceptance/multipro=
cess.py=20
   JOB ID     : a101a47887322981aae722b9c8e7cb6e6350eed9
   JOB LOG    : /home/cleber/avocado/job-results/job-2021-03-08T20.17-a101a=
47/job.log
    (1/1) tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_a=
arch64: PASS (9.55 s)
   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |=
 CANCEL 0
   JOB TIME   : 10.17 s

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBGzLoACgkQZX6NM6Xy
CfOsoxAAqiErD+UL00B0cuZGphxViIqpZDzWhmYR0A1sT27cQ24iup+5+XNef8sJ
UFWfF1vXh8Xq36PUeEOJXZWHDi0k7WF7LxNHSuS2EaUVS72BAcSaWww3GrLN6TDa
Eb4xpmLjKw5DRcpRbleXzy4Hbqza4TpPLnxqRwkJbQapckrvUrFyDSRp/xpEJXXn
f1mseiluQTFonP8Yz9HKlSs3REs8n+eysjWtWkI3QQTJAD4KQT2KPBXb59WYuU/0
UXL+A5X4UmHPeJHn7yKPf8+4Oq3ltWVQRpGDPyPKhQwMqh4rLeew2D7pGgecmg/s
UtsrLnHlRf3MNkz5zbD7VUx8mmyLyx6y6W5s9C77yr7sDowZlPkex+LdJafgw8lJ
gRcNydSmj8jSauEd7pkF4Uk2inLZimDqdhfU86DzJs8RIyqCVmKPIya7h1eg4kyt
FUsOIkftRvUZnLlWW0vXprQcfEbdIyJaxjm+J7Q/TrHXi1Sg1G4nJZrDrGgiSBlu
nTYw8lWfIq9yV5yt8PTzCtcOef6bccbz+4Yugp8u/eN3Zy9fHcVRxfPGhvMdZaxZ
SN6B/AYGtCSeQ/E3qgiSUMeLiRO6zZK2v8tPH88UA/GQTMQmC79zTujZbJ9gGktV
fHbjmWrQQnFruN8PITimaSV+OBDOvohNKGFdnOzA8z2crZ02EAs=
=nQ+X
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--


