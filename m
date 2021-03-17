Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0331933E68C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 03:06:57 +0100 (CET)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMLaJ-0007iH-KD
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 22:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMLYi-00074B-Dp
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 22:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMLYb-0000Wl-A8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 22:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615946706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bgrIk/Dff7bIAxN/4yFOY5v6QHWPW5HJiV736mIknHs=;
 b=LUHOCF7j9adohj2CgvXZR1jB6gUWKLH+rW1M42EI9UbPStDmsxluetKrdZ03jgt+SQEiRX
 f9b4qfKSGk0DSFH5NgoEPgz4SCKn13PMSkosiInMW/OsClOF5wVHlqjhiBL5yX+lfuM8y7
 jQP6SdAcoUXXxwngE0W1bbe0kXFj/YY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-npakodA0OOa1GhM1ultIEA-1; Tue, 16 Mar 2021 22:05:02 -0400
X-MC-Unique: npakodA0OOa1GhM1ultIEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4731074659;
 Wed, 17 Mar 2021 02:05:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-107.rdu2.redhat.com
 [10.10.113.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7042860C13;
 Wed, 17 Mar 2021 02:04:56 +0000 (UTC)
Date: Tue, 16 Mar 2021 22:04:54 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] tests/acceptance: Test ast2400 and ast2500 machines
Message-ID: <YFFjxg3MNd9oJ0vu@localhost.localdomain>
References: <20210304123951.163411-1-joel@jms.id.au>
 <20210304123951.163411-2-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20210304123951.163411-2-joel@jms.id.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pk2IiuFRYfvGL2eL"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pk2IiuFRYfvGL2eL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 11:09:50PM +1030, Joel Stanley wrote:
> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> from ASPEED, by booting Palmetto and Romulus BMC machines.
>=20
> The images are fetched from OpenBMC's release directory on github.
>=20
> Co-developed-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Tested-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

These seem quite stable, as not as slow as the comment on the seems to
indicate.  On a reasonbly low powered machine:

JOB ID     : 01fb73b0f5f4612e95f9f2c2a791df9c11d226ca
JOB LOG    : /home/cleber/avocado/job-results/job-2021-03-16T21.58-01fb73b/=
job.log
 (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: STARTED
 (2/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: STARTED
 (3/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: STARTED
 (4/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: STARTED
 (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: PASS (32.70 s)
 (3/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: PASS (32.86 s)
 (5/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: STARTED
 (6/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: STARTED
 (4/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: PASS (42.46 s)
 (2/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: PASS (42.64 s)
 (5/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: PASS (21.78 s)
 (6/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: PASS (26.11 s)
RESULTS    : PASS 6 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0
JOB HTML   : /home/cleber/avocado/job-results/job-2021-03-16T21.58-01fb73b/=
results.html
JOB TIME   : 61.04 s

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--pk2IiuFRYfvGL2eL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBRY8MACgkQZX6NM6Xy
CfO3nQ//ffz90W2lO+oEo2bKrb6Es4BxviE+1+11bpvR3DptXAx4gbd0xfhsePr2
P8ySGkPyrsKpjQsI2c1Q8NAl77sUK0TY0t9V6vlNddgCvG4IS1MFt6h6FOimZlF3
RRknr+e9v3EjDcsxd9cQ9XJW0YMlg7PRgQhATZtUdeUcmy8RvsU9CcGYBWTBXgDK
8AtVH/crbxY8DvMLT1rErCi6hfNq8oE8ZW1x2t7h4MfGLmq0ZCIY5EttzQJfoFnL
rIK0rgzAlF6YptPdk/96HpQ+jbfhHz7stdjMVUyKieCFQmcw0zhuHV6gR2TFvzZk
I4ynKuvtUOQpRdZWpP3rWR2tdbycl3I2gIklaHouVu9RUBYaI2c4K+LnLFMN9RRk
503LEFbqm1RCJr7PxkZm2xHXa2BAyarS0vcxuMXJATq8QYdsNtp+rTIux8p19TzG
+KpfiYlu0dto6ijeLCG8qQubDYFgSvFYKURbrs2LFHTtiMKeRMyOLhrsivsdAvPK
MSrJXWcaWjNjCk9xw+bK/ZPWFq5a26hY42qKg1BY8gmWN4LLXzm6C/pgWY/uZnWv
2wv+QdXZ6AIZBT9mVVuM0ugMj85ZJOKdqJAtd2WV9l2+RD9I6bgqEKkypIIThlv8
VIaZhjZnRnazTwkR0Kojq4WSRKG483EDFj59n1xs9fD3KwmQbMw=
=abaJ
-----END PGP SIGNATURE-----

--pk2IiuFRYfvGL2eL--


