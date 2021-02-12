Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251E63197EE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 02:19:04 +0100 (CET)
Received: from localhost ([::1]:54542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAN6s-00033Z-Jr
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 20:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAN3g-0002II-TS
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 20:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAN3a-0006Sq-MB
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 20:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613092535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zhbkOOo8e+tlbudqL5zYEO8FDBFU/M/AjCSDXdUNQys=;
 b=RdoMZWv1F/tkfXCiy0O7eR4AHMQOAYxpLyT+CPg2caPGp5ye+XcHdB/rF3aLybHwyltIrF
 OwrXHxYBOZ/8sjjOpdWfTbZ1lfMSpdhZKehVnkBvzgYZrXGmegHOhafLJXBaoVeZDWDaeV
 OvPUy0xkVosx3mLuECCD4PcGWZu7JGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-nj2j0xCeMoOcFpOKF0aoGw-1; Thu, 11 Feb 2021 20:15:32 -0500
X-MC-Unique: nj2j0xCeMoOcFpOKF0aoGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95E33192CC40;
 Fri, 12 Feb 2021 01:15:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-63.rdu2.redhat.com
 [10.10.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7522160657;
 Fri, 12 Feb 2021 01:15:29 +0000 (UTC)
Date: Thu, 11 Feb 2021 20:15:27 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [PATCH 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
Message-ID: <YCXWr40cF3sGiUah@localhost.localdomain>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <20210211220055.19047-2-nieklinnenbank@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210211220055.19047-2-nieklinnenbank@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5hBjFQtvqantboxP"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 b.galvani@gmail.com, qemu-arm@nongnu.org, Pavel.Dovgaluk@ispras.ru,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5hBjFQtvqantboxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 11:00:54PM +0100, Niek Linnenbank wrote:
> Currently the automated acceptance tests for the Orange Pi PC and cubiebo=
ard
> machines are disabled by default. The tests for both machines require art=
ifacts
> that are stored on the apt.armbian.com domain. Unfortunately, some of the=
se artifacts
> have been removed from apt.armbian.com and it is uncertain whether more w=
ill be removed.
>=20
> This commit moves the artifacts previously stored on apt.armbian.com to a=
 different
> domain that is maintainted by me and retrieves them using the path: '/pub=
/qemu/<machine>/<artifact>'.
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 46 +++++++++-----------------
>  tests/acceptance/replay_kernel.py      |  6 ++--
>  2 files changed, 18 insertions(+), 34 deletions(-)

Tested with:

  $ export AVOCADO_ALLOW_LARGE_STORAGE=3D1
  $ ./tests/venv/bin/avocado run \
    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_cubieb=
oard_initrd \
    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_cubieb=
oard_sata \
    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orange=
pi\$ \
    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orange=
pi_initrd \
    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orange=
pi_sd \
    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orange=
pi_bionic_19_11 \
    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orange=
pi_bionic_20_08 \
    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orange=
pi_uboot_netbsd9 \
    tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_cubieboar=
d_initrd

Resulting in:

   JOB ID     : f767a43482aa90545e740120a44cba64ab07dd3a
   JOB LOG    : /home/cleber/avocado/job-results/job-2021-02-11T20.07-f767a=
43/job.log
    (1/9) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
cubieboard_initrd: PASS (23.49 s)
    (2/9) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
cubieboard_sata: PASS (21.98 s)
    (3/9) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
orangepi: PASS (12.37 s)
    (4/9) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
orangepi_initrd: PASS (33.78 s)
    (5/9) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
orangepi_sd: PASS (45.47 s)
    (6/9) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
orangepi_bionic_19_11: PASS (69.69 s)
    (7/9) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
orangepi_bionic_20_08: PASS (89.06 s)
    (8/9) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
orangepi_uboot_netbsd9: PASS (40.82 s)
    (9/9) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_cub=
ieboard_initrd: PASS (61.19 s)
   RESULTS    : PASS 9 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |=
 CANCEL 0
   JOB TIME   : 398.87 s

Both "test_arm_orangepi_bionic_19_11" and
"test_arm_orangepi_bionic_20_08" barely made within the 90 seconds
timeout.  I realize that the system I used is quite limited, so I'll
let others reason about the increase of the timeout.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--5hBjFQtvqantboxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAl1qwACgkQZX6NM6Xy
CfNVFBAAxogKf8dllq9I35UW1azxsLqS4SJmrUfsLx6QHhJLizesq4Dou+RtAGNZ
pYp0KiT/47FbsobiRfyOATrRiOqcAbTTehkKS/puHMHhtdFyTYyRGhfOZDLlmzH6
e3JKIAbYQJhUENEOQG63U1CmUYuxcJ61qwKm/8I9qrCf96Y7usSeJRG1Yj/NfhlT
xKSb5Rd5k6cpBO9oVehXE72vn9qxPMTSJo7fEr1vU3/bILKeI7FNNGc3LYB/ed9J
/a+bggEV50uwM718FdJjGAqt+P0HiUv2KloNrVbHHQ6/dP82+6yb7Aoc4fmtxBCR
pDusIZtEuOTtM8dg/RUcKGP/AcK+leKG7GL1p+Qkxd3XB4SdH9MHdsx/kprHaujW
wKMHqx3d7nmmXkP5YSZwPMpBCLtUrSs0VyS3jsDj1FYuJmDxjZUn2OoWSc97Gjar
70DZWSKU2nshi9CrXwWCdNvLpmkPMEXOej1MZKKg8vK08qBeIFX6YnMS8ZL2ptPr
cbaGOE6IUsV2TmNYPjZFSLnIAGjiCOvoQHf9p3v6M92nAM9qDuwppsOjY4DWkwon
3gSZ6VuTPUunZ3ZiGOtZJRfy0ULke7l6igXXbqQRV2xDMdHwRPCjeXI2Qg7PLi1Q
5b54qTog0RMEltgYxf2h0WFhcrmjWV/OiscsAvT4BY5edRTUVzc=
=zrNM
-----END PGP SIGNATURE-----

--5hBjFQtvqantboxP--


