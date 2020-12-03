Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41652CDBA8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:00:00 +0100 (CET)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkrxX-000779-PC
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kkruM-0005Sn-1w
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kkruJ-0001uW-ON
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607014598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y/bNk1Tr0a6jnd0I2kGV/wKyaCcLWtK1b5hmPoJVrJM=;
 b=dSnHPzleiCma/bKDnqa0cUf8HJij79VZ05ExMv6Kk5Bfn+jEoaZV4Cda+LL8/eZxivnemE
 ESTogBXbQaMvv1vVHH6aOnBotuXIXhh9Ve33uoPa5//9obRUq8h+Tr1QxrjtHex3wY9ge7
 roKp5uQ3vVq+wSbSFxfgImEEDZ2L+xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-KEb7o6WUNqqCPIjyXg3pZg-1; Thu, 03 Dec 2020 11:56:34 -0500
X-MC-Unique: KEb7o6WUNqqCPIjyXg3pZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F182E10CE7A8;
 Thu,  3 Dec 2020 16:56:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-118-183.rdu2.redhat.com
 [10.10.118.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 199DA1A838;
 Thu,  3 Dec 2020 16:56:30 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:56:29 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] tests/acceptance: fix timeout for vm.wait
Message-ID: <20201203165629.GC2787993@localhost.localdomain>
References: <160552129733.22861.2033930860605615947.stgit@pasha-ThinkPad-X280>
 <CAP+75-W2ed_73xszEA08hqdnVRL9bGXshnGYqJGZvSjt4_D8bw@mail.gmail.com>
 <ce6360ce-d640-8a4a-96e8-294dd5f04f0b@redhat.com>
 <f9fe07b1-78e1-76ca-3c02-d6bf77d827d8@ispras.ru>
 <a2587552-4881-9495-e7c1-6a1934da760c@redhat.com>
 <32d30a1d-51a5-b04e-19cb-e33e90b2d659@ispras.ru>
MIME-Version: 1.0
In-Reply-To: <32d30a1d-51a5-b04e-19cb-e33e90b2d659@ispras.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 09:29:10AM +0300, Pavel Dovgalyuk wrote:
> On 02.12.2020 18:22, John Snow wrote:
> > On 12/2/20 1:31 AM, Pavel Dovgalyuk wrote:
> > > > > >=20
> > > > > > This patch adds timeout parameter to vm.wait() calls,
> > > > > > because the default
> > > > > > value is just 30 seconds, and tests may last for more time.
> > > > > >=20
> > > >=20
> > > > This doesn't sound right -- the timeout isn't meant to be for
> > > > the entire duration of the test, the timeout is from the time of
> > > > issuing a shutdown command until the time the VM actually shuts
> > > > down. Ideally, that should not take a particularly long time in
> > > > a well-behaved test.
> > > >=20
> > > > Why is it lasting longer than 30 seconds?
> > >=20
> > > These are complex Linux boot&execution tests.
> > > Such loading process could take more than 30 seconds.
> > > E.g., BootLinux tests have timeout of 900 seconds.
> >=20
> > This timeout should only count towards the time spent *shutting down*,
> > not the time to run the entire test. 30 seconds used to be enough time
> > for this to happen on gitlab, if it's taking longer than that I am
> > worried that something has gone wrong.
> >=20
> > Where were the failures observed, and on what tests? Are there logs I
> > can review?
>=20
> I've got your point. You were right.
> The problem was with new long-lasting record/replay tests:
>

Hi Pavel,

You mean a new test you're writing based on "boot_linux.py"?

> if record:
>     cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
>                                   self.name)
>     vm.shutdown()
>     logger.info('finished the recording with log size %s bytes'
>                 % os.path.getsize(replay_path))
> else:
>     vm.wait(None)
>     logger.info('successfully fihished the replay')
>=20
>=20
> Replay phase here waits for shutdown for the whole period of Linux boot a=
nd
> execution. We don't check any VM output and just wait for finishing
> the replay.
>

I'm missing why a replay be different when it comes to waiting for a
successfull "I'm finished booting" from the guest?  Wouldn't the guest
during the replay act just the same?

> Smaller RR tests include "self.wait_for_console_pattern" during replay an=
d
> therefore can't have problems with this timeout.
>
> Pavel Dovgalyuk
>=20

Right.

Thanks,
- Cleber.

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl/JGLoACgkQZX6NM6Xy
CfNMgA/2MkmBWJlZcAP+IXbDsAv+FCNTZwJ52zmHtWbTvq+ie5LTCqmy9hiz2X1S
MFxjzxp0PIcaAO9/Mj1f2lmIw1iZzswGQ2txl4pwdL0JlyTYGyw6MeJpdZOt+/mR
R+scEL/3C/hEgh8SBMm8KaN5Zvx0HukYquzS9Yrq5jAo5ovTkKfBRxFhxSEk0si8
k0wxMFRFAwp2+4BJNTdk6r/hmoyR+tyfV/jz8PhHRVLTRzcT5fjWIIfKaeWh+tyy
pZ05JX0MLlHD6Vm3H4DiGTrbjsNhcX13GCQ56jO70uyo+BqkDjnwd9p5u1X8r+RI
XtyB32BwUS0fh46LN1h/CdXXJ7NZV/ZcbwfCPsEgyQeF25/F9k90SyelePOfI482
dUnD0lv9HIUtK7uSyyiq2CpcqDmXXwvOokK4jPJu8yl9e0ayG6FdxWU2T+Qw3L18
+PvBBhWdxumpLroVAMVxoMZTK9VkM5t7iUQaVoesaYmOAxkR3tT3TmwDeWlQdmzK
Q8F79GHIY3AFX63oG+cAXQJLhUKEnBBuLuhukxmEmaa1sdn9ag509pkJ1TCbcoy+
5QDbNntHT97dOWSCXm+nQdSqC7660+txIEHAMyYA1Hcd2uFsH7V2keV9xxFf34DR
iOzphygBG41GZ2UyM9kS/uQvvd/1pvSdx5KwhhVg0F/WzJGZmA==
=ZtTt
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--


