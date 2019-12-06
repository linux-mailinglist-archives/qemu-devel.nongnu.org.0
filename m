Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402D115553
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:29:42 +0100 (CET)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idGU8-0007rZ-LQ
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wrampazz@redhat.com>) id 1idF9z-0004dE-Bl
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:04:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wrampazz@redhat.com>) id 1idF9w-0002d9-Df
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:04:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31553
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wrampazz@redhat.com>) id 1idF9v-0002c6-Di
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575644681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7eq4p6SND3EJWrRrLgNGeuphFeMxKCBxlZlwscXmGRw=;
 b=a/EiFpEq1GHo0aRf0aHPf6SKy9UIskY/eTsdbiBmD+9BpKa5e4yCfY9h90RILJ0az/ZJHh
 JFR7RI3/2YRuZc4ck29yBvP/Ws5aWUwiEGNO88RKOz9OgiGsuS8k76nCybdTLvfzWGMbPz
 iUgfHzHA11MBXvpLFusj8B9ElloNH+E=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-eTQ5Jb9FPTOl7HQz1jzFKw-1; Fri, 06 Dec 2019 10:04:40 -0500
Received: by mail-vk1-f197.google.com with SMTP id f73so3146034vka.4
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 07:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BW/J3jm+FIu0jZ+lnGRabY4qIDpfyh3o5lNMb1L7E1I=;
 b=RBj33wz7tTOdeVj/2MjXx2NCwZYk43dI+Brh0v4i799odIgVDpQh2gR6FfK6erPA4H
 tG/lv3rQz5gMUssISZZogiAt7f875OIXzrqEphY78netW3bdDfQVEUJbL//gZFfi2WAG
 /BUIUm1aKjm39+XBYvsGRMiZo4GTv1Dn0DODSNd4Dw8Fj+g/Hi9Anbq/GhNh7RlTGJFT
 anSbS/BTrvsiIfBNiKSXj0aLxIBlgnfJX6QJH8CWjFAx9BcuDXG02T2v4Jv1RNH5DtWz
 Vea4BZ1j6VtlRbgtt1U6ZlHPiSybmHijVYAYzR403NoCdLDMqPKj9tcmB5LDP5qZyzJj
 bdHw==
X-Gm-Message-State: APjAAAVWAozcfEROM64f98OTyEk9DUrnTn/o6xjS7ENw9MMFa4GSmBAT
 f+dUSihXGdyHQxrHieQ1m6r0zp1K6bOUiI5k7G0rprBorQoPENm66KpIIo1CSDgP5RQEj1eTmmz
 4B/lCYfvBQqzQe4AEXVnMS5bo5tWVLfM=
X-Received: by 2002:ab0:561c:: with SMTP id y28mr12002822uaa.113.1575644679958; 
 Fri, 06 Dec 2019 07:04:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPL3HN4d4yLH1u+0bxqEV+Ih8QJpcbEiFodB7AGrWSqdcZi3qT0BxqyIRVkkNvOWAoxyRI7aGWgRIwWwLcr58=
X-Received: by 2002:ab0:561c:: with SMTP id y28mr12002784uaa.113.1575644679535; 
 Fri, 06 Dec 2019 07:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20191206140012.15517-1-wainersm@redhat.com>
 <20191206140012.15517-2-wainersm@redhat.com>
In-Reply-To: <20191206140012.15517-2-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 6 Dec 2019 12:04:28 -0300
Message-ID: <CAKJDGDbuX10Tsks_KdRyKnyDxLKuDCN2pSJsjh7rxaJkZ2-S8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/acceptance: Add PVH boot test
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
X-MC-Unique: eTQ5Jb9FPTOl7HQz1jzFKw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: fam@euphon.net, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 6, 2019 at 11:00 AM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> QEMU 4.0 onward is able to boot an uncompressed kernel
> image by using the x86/HVM direct boot ABI. It needs
> Linux >=3D 4.21 built with CONFIG_PVH=3Dy.
>
> This introduces an acceptance test which checks an
> uncompressed Linux kernel image boots properly.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/pvh.py | 48 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 tests/acceptance/pvh.py
>
> diff --git a/tests/acceptance/pvh.py b/tests/acceptance/pvh.py
> new file mode 100644
> index 0000000000..c68489c273
> --- /dev/null
> +++ b/tests/acceptance/pvh.py
> @@ -0,0 +1,48 @@
> +# Copyright (c) 2019 Red Hat, Inc.
> +#
> +# Author:
> +#  Wainer dos Santos Moschetta <wainersm@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +"""
> +x86/HVM direct boot acceptance tests.
> +"""
> +
> +from avocado.utils.kernel import KernelBuild
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +
> +
> +class Pvh(Test):
> +    """
> +    Test suite for x86/HVM direct boot feature.
> +
> +    :avocado: tags=3Dslow,arch=3Dx86_64,machine=3Dq35
> +    """
> +    def test_boot_vmlinux(self):
> +        """
> +        Boot uncompressed kernel image.
> +        """
> +        # QEMU can boot a vmlinux image for kernel >=3D 4.21 built
> +        # with CONFIG_PVH=3Dy
> +        kernel_version =3D '5.4.1'
> +        kbuild =3D KernelBuild(kernel_version, work_dir=3Dself.workdir)
> +        try:
> +            kbuild.download()
> +            kbuild.uncompress()
> +            kbuild.configure(targets=3D['defconfig', 'kvmconfig'],
> +                             extra_configs=3D['CONFIG_PVH=3Dy'])
> +            kbuild.build()
> +        except:
> +            self.cancel("Unable to build vanilla kernel %s" % kernel_ver=
sion)
> +
> +        self.vm.set_machine('q35')
> +        self.vm.set_console()
> +        kernel_command_line =3D 'printk.time=3D0 console=3DttyS0'
> +        self.vm.add_args('-kernel', kbuild.vmlinux,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Kernel command line: %s' %
> +                                 kernel_command_line)
> --
> 2.21.0
>

Tested-by: Willian Rampazzo <wrampazz@redhat.com>


