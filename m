Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E931E208
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 23:25:29 +0100 (CET)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCVGC-0004pf-8q
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 17:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCVEv-0003xh-Vc
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 17:24:10 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCVEt-0007S0-IR
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 17:24:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id n8so230812wrm.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 14:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UBErDwxItRQDaQKbAHMCfrEjjIOCFPLlsoGBCNNVrxc=;
 b=dHVoXOEhkEQmqkxhT1z9RJDaL3PKUPKjab59XnBq+VAabO0DBXbi6J6gE3yWhZG0O9
 O4Z8HNEn+spF9oAtjqGOyFzymowEkimnrfehoc1B1DMs1OXoRPeJSMsE+ktV+nlPuzfe
 f82zgsatGikwu+U9h5iQCza80bsmYxienCH/LsZaUiqHvK8kp6In4Z0beWPK3abQyT9C
 w0CLqfxBzVJRmJIIXGxhuVHqMXjGB3I2m9a4YMXTpQBLpIKPh++Ei6x9oZCjSObqS671
 nyyAAiEsbmasyWY7A9bVH1PLFdJql5yGJ0rgFCpOBuYoTgABeTmRI5H5VmVtRMbFiKIK
 6BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=UBErDwxItRQDaQKbAHMCfrEjjIOCFPLlsoGBCNNVrxc=;
 b=om68kcPVqNSO+MddisypC8a0AJliWIqxb23EsAHrOXXMXyuJokSYVbL1IsYqkxoh3/
 2M+iqQit36dyLXILSIq23rTxQ5QQwFD7D1DcMilH7WWMz1XbEV+A8PTJN5qknne1vF8x
 m3wkckBHsnUTjompsME/JjzmcBKu9dFfTmZQ/9HCAvi0jYoP1VsAzlONXQKRPbrnI3O8
 KXoWa6iKMiZNtWnYaXilFMuPjyqYKkK9wpHSIjyd/WJk4tfQcXrJPoGsFn9isiikG1i+
 hcoPs5fmgnDKMwIoUk4LPr9y9GMuQOqn6ylc6lqzOMbeE1fVVbYYtP7B61KB80xz8Dpe
 lH7g==
X-Gm-Message-State: AOAM5326uTm2OkabowHf166dDKZVcbSrP6Z0O5R69ICsVRjZWCX3B2vQ
 gPBiIXak6n2Wq9bYFdKted2E+g==
X-Google-Smtp-Source: ABdhPJwv23fB+ttVoJXnMOjEDxGHSwBNNyZx5lUAwYZzR2vi+hrXJ0Dh3JQH0hBHHsnpt0xkUXTEbw==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr1291969wrw.298.1613600645220; 
 Wed, 17 Feb 2021 14:24:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x11sm5526509wrv.83.2021.02.17.14.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 14:24:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 583D51FF7E;
 Wed, 17 Feb 2021 22:24:03 +0000 (GMT)
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
 <20210217204654.GA353754@localhost.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH  v2 7/7] tests/avocado: add boot_xen tests
Date: Wed, 17 Feb 2021 22:22:50 +0000
In-reply-to: <20210217204654.GA353754@localhost.localdomain>
Message-ID: <87sg5us58c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> On Thu, Feb 11, 2021 at 05:19:45PM +0000, Alex Benn=C3=A9e wrote:
>> These tests make sure we can boot the Xen hypervisor with a Dom0
>> kernel using the guest-loader. We currently have to use a kernel I
>> built myself because there are issues using the Debian kernel images.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  MAINTAINERS                  |   1 +
>>  tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
>>  2 files changed, 118 insertions(+)
>>  create mode 100644 tests/acceptance/boot_xen.py
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 853f174fcf..537ca7a6f3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1998,6 +1998,7 @@ M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>  S: Maintained
>>  F: hw/core/guest-loader.c
>>  F: docs/system/guest-loader.rst
>> +F: tests/acceptance/boot_xen.py
>>=20=20
>>  Intel Hexadecimal Object File Loader
>>  M: Su Hang <suhang16@mails.ucas.ac.cn>
>> diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
>> new file mode 100644
>> index 0000000000..8c7e091d40
>> --- /dev/null
>> +++ b/tests/acceptance/boot_xen.py
>> @@ -0,0 +1,117 @@
>> +# Functional test that boots a Xen hypervisor with a domU kernel and
>> +# checks the console output is vaguely sane .
>> +#
>> +# Copyright (c) 2020 Linaro
>> +#
>> +# Author:
>> +#  Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +import os
>> +
>> +from avocado import skipIf
>> +from avocado_qemu import wait_for_console_pattern
>> +from boot_linux_console import LinuxKernelTest
>> +
>> +
>> +class BootXenBase(LinuxKernelTest):
>> +    """
>> +    Boots a Xen hypervisor with a Linux DomU kernel.
>> +    """
>> +
>> +    timeout =3D 90
>> +    XEN_COMMON_COMMAND_LINE =3D 'dom0_mem=3D128M loglvl=3Dall guest_log=
lvl=3Dall'
>> +
>> +    def fetch_guest_kernel(self):
>> +        # Using my own built kernel - which works
>> +        kernel_url =3D ('https://fileserver.linaro.org/'
>> +                      's/JSsewXGZ6mqxPr5/download?path=3D%2F&files=3D'
>> +                      'linux-5.9.9-arm64-ajb')
>> +        kernel_sha1 =3D '4f92bc4b9f88d5ab792fa7a43a68555d344e1b83'
>> +        kernel_path =3D self.fetch_asset(kernel_url,
>> +                                       asset_hash=3Dkernel_sha1)
>> +
>> +        return kernel_path
>> +
>> +    def launch_xen(self, xen_path):
>> +        """
>> +        Launch Xen with a dom0 guest kernel
>> +        """
>> +        self.log.info("launch with xen_path: %s", xen_path)
>> +        kernel_path =3D self.fetch_guest_kernel()
>> +
>> +        self.vm.set_console()
>> +
>> +        xen_command_line =3D self.XEN_COMMON_COMMAND_LINE
>> +        self.vm.add_args('-machine', 'virtualization=3Don',
>> +                         '-cpu', 'cortex-a57',
>> +                         '-m', '768',
>> +                         '-kernel', xen_path,
>> +                         '-append', xen_command_line,
>> +                         '-device',
>> +                         "guest-loader,addr=3D0x47000000,kernel=3D%s,bo=
otargs=3Dconsole=3Dhvc0"
>
> Nitpick/OCD: single quotes to match all other args?
>
>> +                         % (kernel_path))
>> +
>> +        self.vm.launch()
>> +
>> +        console_pattern =3D 'VFS: Cannot open root device'
>> +        wait_for_console_pattern(self, console_pattern, "Panic on CPU 0=
:")
>> +
>> +
>> +class BootXen(BootXenBase):
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_411_and_dom0(self):
>> +        """
>> +        :avocado: tags=3Darch:aarch64
>> +        :avocado: tags=3Daccel:tcg
>> +        :avocado: tags=3Dcpu:cortex-a57
>> +        :avocado: tags=3Dmachine:virt
>> +        """
>> +        xen_url =3D ('https://deb.debian.org/debian/'
>> +                   'pool/main/x/xen/'
>> +                   'xen-hypervisor-4.11-arm64_4.11.4+37-g3263f257ca-1_a=
rm64.deb')
>> +        xen_sha1 =3D '034e634d4416adbad1212d59b62bccdcda63e62a'
>
> This URL is already giving 404s because of a new pacakge.  I found
> this to work (but yeah, won't probably last long):
>
>         xen_url =3D ('http://deb.debian.org/debian/'
>                    'pool/main/x/xen/'
>                    'xen-hypervisor-4.11-arm64_4.11.4+57-g41a822c392-2_arm=
64.deb')
>         xen_sha1 =3D 'b5a6810fc67fd50fa36afdfdfe88ce3153dd3a55'

I think the solution is to use archive links here. There is a snapshot
archive of sid (we've used it in the past) but I suspect there isn't an
archive of old stable packages for a reason.

>
>> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
>> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm=
64")
>> +
>> +        self.launch_xen(xen_path)
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_414_and_dom0(self):
>> +        """
>> +        :avocado: tags=3Darch:aarch64
>> +        :avocado: tags=3Daccel:tcg
>> +        :avocado: tags=3Dcpu:cortex-a57
>> +        :avocado: tags=3Dmachine:virt
>> +        """
>> +        xen_url =3D ('https://deb.debian.org/debian/'
>> +                   'pool/main/x/xen/'
>> +                   'xen-hypervisor-4.14-arm64_4.14.0+80-gd101b417b7-1_a=
rm64.deb')
>> +        xen_sha1 =3D 'b9d209dd689ed2b393e625303a225badefec1160'
>
> Likewise here:
>
>         xen_url =3D ('https://deb.debian.org/debian/'
>                    'pool/main/x/xen/'
>                    'xen-hypervisor-4.14-arm64_4.14.0+88-g1d1d1f5391-2_arm=
64.deb')
>         xen_sha1 =3D 'f316049beaadd50482644e4955c4cdd63e3a07d5'
>
>> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
>> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.14-arm=
64")
>> +
>> +        self.launch_xen(xen_path)
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_415_and_dom0(self):
>> +        """
>> +        :avocado: tags=3Darch:aarch64
>> +        :avocado: tags=3Daccel:tcg
>> +        :avocado: tags=3Dcpu:cortex-a57
>> +        :avocado: tags=3Dmachine:virt
>> +        """
>> +
>> +        xen_url =3D ('https://fileserver.linaro.org/'
>> +                   's/JSsewXGZ6mqxPr5/download'
>> +                   '?path=3D%2F&files=3Dxen-upstream-4.15-unstable.deb')
>> +        xen_sha1 =3D 'fc191172b85cf355abb95d275a24cc0f6d6579d8'
>> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
>> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.15-uns=
table")
>> +
>> +        self.launch_xen(xen_path)
>> --=20
>> 2.20.1
>>=20
>>=20
>
> With those changes,
>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>


--=20
Alex Benn=C3=A9e

