Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0AB3BC38C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:08:33 +0200 (CEST)
Received: from localhost ([::1]:49800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0VpQ-0007fl-F9
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0VmS-00021E-TC
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0VmO-0003KE-GB
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625519122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2bSc4ufX9TTeE2beeJIgLbLUEiQoV9IhxfRx4fHXRqc=;
 b=bwJkM/n3pCWFhGFDCgdAA1iNGXxEa4jL9O0XDNUc76JZIFHXjhZLKixzF2SDniVCac6Eje
 bFOfuOVyKVFB30pyZWyVFQ+04IGMq6lwiTVpBlpcKoQ+MEZFTiEnd9GqXmExt//gfjwpvn
 iYpnZqFTgx+z8ghcbqi12ChIATNB5qo=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-HNlKZ8svMGyRRvo2uA6wIw-1; Mon, 05 Jul 2021 17:05:21 -0400
X-MC-Unique: HNlKZ8svMGyRRvo2uA6wIw-1
Received: by mail-ua1-f71.google.com with SMTP id
 d7-20020ab066c70000b0290291b95bf303so6740326uaq.16
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bSc4ufX9TTeE2beeJIgLbLUEiQoV9IhxfRx4fHXRqc=;
 b=tdQ2ZAzk3cF6KJ6iNm98VzDp+d2HKmRbFpgLLuOzMxrLzAAkj6M92fhtIVLZVNE3yR
 WAWIhyD4hGZc/p4hNLUHcuw6COzORiyWZy7RV4RWfvJFcyj1xnSuC2LFioALRMe6Xzu6
 IODxU/1Lz4XiACxklkFIG1oZIAdFh5Zoxf/UgUI7vCqEqnKWtKogJPhf4vW7YQPvN1rR
 MSs76jbA0OZvzkEyLupmmmaXsynk6GDoir4WBVgYsKMS70GP80UEQirTBczdM6K70Eu0
 n1uUu7M5OPDgnZCZK0eq4Ie5sTms6XzMA2v9btUpvOWTDUXS6l2oY4nniBI+9RvPOklH
 A6Dw==
X-Gm-Message-State: AOAM533AjuVQrIK+LTs/VEuKhFK4d8vu/p+ZK1XpQ21Gri2hfvpukca5
 2DZYm95lnbhtY7LHaLS8fOqvlC2NWN83SNIOLCM8zVt/9u/S0FU8lWkQPsVtDmYK71P6Ii5H5ih
 +E3YQV8EFF+LQIF0+gwMjIf60IXoRouU=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr12552183uam.110.1625519121017; 
 Mon, 05 Jul 2021 14:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeBYbUw7KA9xzbonmBaiPvGDNjCtJxTAfnlXGv4FaUkyzN6d1TJQAlWGf12O6fYoHgV2EjaWlPc0bNR2LVtsE=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr12552053uam.110.1625519119848; 
 Mon, 05 Jul 2021 14:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <20210629143621.907831-3-eric.auger@redhat.com>
 <a7b8faad-4535-f5f3-4f99-b13cf3dcfd7f@redhat.com>
 <d46e9c37-7989-451f-cb3d-edf0958911fd@redhat.com>
In-Reply-To: <d46e9c37-7989-451f-cb3d-edf0958911fd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 18:04:53 -0300
Message-ID: <CAKJDGDaGTJX-tQWsBAN9_j9US9GScHeCqwVeDza=eL6v3r=F6A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] avocado_qemu: Add SMMUv3 tests
To: Auger Eric <eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On Mon, Jul 5, 2021 at 5:00 AM Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Wainer,
>
> On 7/1/21 8:13 PM, Wainer dos Santos Moschetta wrote:
> > Hi,
> >
> > On 6/29/21 11:36 AM, Eric Auger wrote:
> >> Add new tests checking the good behavior of the SMMUv3 protecting
> >> 2 virtio pci devices (block and net). We check the guest boots and
> >> we are able to install a package. Different guest configs are tested:
> >> standard, passthrough an strict=0. This is tested with both fedora 31
> >> and
> >> 33. The former uses a 5.3 kernel without range invalidation whereas the
> >> latter uses a 5.8 kernel that features range invalidation.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> v3 -> v4:
> >> - add tags for machine, distro in the class
> >> - removed smp and memory overrides
> >> - set default param value of common_vm_setup to False
> >>
> >> v1 -> v2:
> >> - removed ssh import
> >> - combined add_command_args() and common_vm_setup()
> >> - moved tags in class' docstring and added tags=arch:aarch64
> >> - use self.get_default_kernel_params()
> >> - added RIL tests with fed33 + introduce new tags
> >> ---
> >>   tests/acceptance/smmu.py | 132 +++++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 132 insertions(+)
> >>   create mode 100644 tests/acceptance/smmu.py
> >
> > Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> >
> > Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> >
> > I tested it in a Fedora 32 aarch64 host. The execution output:
> >
> > # ./tests/venv/bin/avocado run tests/acceptance/smmu.py
> > JOB ID     : 1625038f5a2ae17c8ba6c503d3df8661ff528942
> > JOB LOG    :
> > /root/avocado/job-results/job-2021-07-01T13.38-1625038/job.log
> >  (1/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril: PASS (175.54 s)
> >  (2/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_passthrough:
> > WARN: Test passed but there were warnings during execution. Check the
> > log for details. (168.39 s)
> >  (3/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_nostrict: WARN:
> > Test passed but there were warnings during execution. Check the log
> > for details. (161.58 s)
> >  (4/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril: PASS (150.85 s)
> >  (5/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_passthrough: WARN:
> > Test passed but there were warnings during execution. Check the log
> > for details. (177.56 s)
> >  (6/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_nostrict: WARN:
> > Test passed but there were warnings during execution. Check the log
> > for details. (190.86 s)
> > RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 4 | INTERRUPT 0
> > | CANCEL 0
> > JOB TIME   : 1026.50 s
> >
> > One thing that caught my attention was the amount of time spent on
> > each test. It spend more than 2 minutes on the package installation
> > (`self.ssh_command('dnf -y install numactl-devel')`) in the guest.
> >
> > Without that operation, it runs way faster:
> >
> > # ./tests/venv/bin/avocado run tests/acceptance/smmu.py
> > JOB ID     : 24f22f99169ece37df64d72d2eb373921f378aac
> > JOB LOG    :
> > /root/avocado/job-results/job-2021-07-01T13.28-24f22f9/job.log
> >  (1/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril: PASS (39.61 s)
> >  (2/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_passthrough:
> > WARN: Test passed but there were warnings during execution. Check the
> > log for details. (48.32 s)
> >  (3/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_nostrict: WARN:
> > Test passed but there were warnings during execution. Check the log
> > for details. (48.10 s)
> >  (4/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril: PASS (39.22 s)
> >  (5/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_passthrough: WARN:
> > Test passed but there were warnings during execution. Check the log
> > for details. (52.92 s)
> >  (6/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_nostrict: WARN:
> > Test passed but there were warnings during execution. Check the log
> > for details. (50.96 s)
> > RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 4 | INTERRUPT 0
> > | CANCEL 0
> > JOB TIME   : 280.62 s
> >
> > Install a package seems a good exerciser for disk I/O and networking,
> > but maybe you can use another method for the sake of speed up the tests?
>
> As discussed earlier with Cleber, I am aware the test duration is long
> but it was useful finding bugs for SMMU with range invalidation. such a
> bug could not be hit with a single boot + ping for instance.
>
> Maybe we should have a mechanism that allows to put some tests out of
> the automatic CI?
>

You can use the skipIf decorator in the class. See here:
https://gitlab.com/willianrampazzo/qemu/-/commit/6f249845827ed041b55d275a8cb803666ac3c7af

Regards,

> Thanks
>
> Eric
> >
> > - Wainer
> >
> >>
> >> diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
> >> new file mode 100644
> >> index 0000000000..c1d4b88e5f
> >> --- /dev/null
> >> +++ b/tests/acceptance/smmu.py
> >> @@ -0,0 +1,132 @@
> >> +# SMMUv3 Functional tests
> >> +#
> >> +# Copyright (c) 2021 Red Hat, Inc.
> >> +#
> >> +# Author:
> >> +#  Eric Auger <eric.auger@redhat.com>
> >> +#
> >> +# This work is licensed under the terms of the GNU GPL, version 2 or
> >> +# later.  See the COPYING file in the top-level directory.
> >> +
> >> +import os
> >> +
> >> +from avocado_qemu import LinuxTest, BUILD_DIR
> >> +
> >> +class SMMU(LinuxTest):
> >> +    """
> >> +    :avocado: tags=accel:kvm
> >> +    :avocado: tags=cpu:host
> >> +    :avocado: tags=arch:aarch64
> >> +    :avocado: tags=machine:virt
> >> +    :avocado: tags=distro:fedora
> >> +    :avocado: tags=smmu
> >> +    """
> >> +
> >> +    IOMMU_ADDON =
> >> ',iommu_platform=on,disable-modern=off,disable-legacy=on'
> >> +    kernel_path = None
> >> +    initrd_path = None
> >> +    kernel_params = None
> >> +
> >> +    def set_up_boot(self):
> >> +        path = self.download_boot()
> >> +        self.vm.add_args('-device',
> >> 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
> >> +                         'drive=drv0,id=virtio-disk0,bootindex=1,'
> >> +                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
> >> +        self.vm.add_args('-drive',
> >> +
> >> 'file=%s,if=none,cache=writethrough,id=drv0' % path)
> >> +
> >> +    def setUp(self):
> >> +        super(SMMU, self).setUp(None, 'virtio-net-pci' +
> >> self.IOMMU_ADDON)
> >> +
> >> +    def common_vm_setup(self, custom_kernel=False):
> >> +        self.require_accelerator("kvm")
> >> +        self.vm.add_args("-accel", "kvm")
> >> +        self.vm.add_args("-cpu", "host")
> >> +        self.vm.add_args("-machine", "iommu=smmuv3")
> >> +        self.vm.add_args("-d", "guest_errors")
> >> +        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
> >> +                         'edk2-aarch64-code.fd'))
> >> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
> >> +        self.vm.add_args('-object',
> >> +                         'rng-random,id=rng0,filename=/dev/urandom')
> >> +
> >> +        if custom_kernel is False:
> >> +            return
> >> +
> >> +        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
> >> +        initrd_url = self.get_pxeboot_url() + 'initrd.img'
> >> +        self.kernel_path = self.fetch_asset(kernel_url)
> >> +        self.initrd_path = self.fetch_asset(initrd_url)
> >> +
> >> +    def run_and_check(self):
> >> +        if self.kernel_path:
> >> +            self.vm.add_args('-kernel', self.kernel_path,
> >> +                             '-append', self.kernel_params,
> >> +                             '-initrd', self.initrd_path)
> >> +        self.launch_and_wait()
> >> +        self.ssh_command('cat /proc/cmdline')
> >> +        self.ssh_command('dnf -y install numactl-devel')
> >> +
> >> +
> >> +    # 5.3 kernel without RIL #
> >> +
> >> +    def test_smmu_noril(self):
> >> +        """
> >> +        :avocado: tags=smmu_noril
> >> +        :avocado: tags=smmu_noril_tests
> >> +        :avocado: tags=distro_version:31
> >> +        """
> >> +        self.common_vm_setup()
> >> +        self.run_and_check()
> >> +
> >> +    def test_smmu_noril_passthrough(self):
> >> +        """
> >> +        :avocado: tags=smmu_noril_passthrough
> >> +        :avocado: tags=smmu_noril_tests
> >> +        :avocado: tags=distro_version:31
> >> +        """
> >> +        self.common_vm_setup(True)
> >> +        self.kernel_params = self.get_default_kernel_params() + '
> >> iommu.passthrough=on'
> >> +        self.run_and_check()
> >> +
> >> +    def test_smmu_noril_nostrict(self):
> >> +        """
> >> +        :avocado: tags=smmu_noril_nostrict
> >> +        :avocado: tags=smmu_noril_tests
> >> +        :avocado: tags=distro_version:31
> >> +        """
> >> +        self.common_vm_setup(True)
> >> +        self.kernel_params = self.get_default_kernel_params() + '
> >> iommu.strict=0'
> >> +        self.run_and_check()
> >> +
> >> +    # 5.8 kernel featuring range invalidation
> >> +    # >= v5.7 kernel
> >> +
> >> +    def test_smmu_ril(self):
> >> +        """
> >> +        :avocado: tags=smmu_ril
> >> +        :avocado: tags=smmu_ril_tests
> >> +        :avocado: tags=distro_version:33
> >> +        """
> >> +        self.common_vm_setup()
> >> +        self.run_and_check()
> >> +
> >> +    def test_smmu_ril_passthrough(self):
> >> +        """
> >> +        :avocado: tags=smmu_ril_passthrough
> >> +        :avocado: tags=smmu_ril_tests
> >> +        :avocado: tags=distro_version:33
> >> +        """
> >> +        self.common_vm_setup(True)
> >> +        self.kernel_params = self.get_default_kernel_params() + '
> >> iommu.passthrough=on'
> >> +        self.run_and_check()
> >> +
> >> +    def test_smmu_ril_nostrict(self):
> >> +        """
> >> +        :avocado: tags=smmu_ril_nostrict
> >> +        :avocado: tags=smmu_ril_tests
> >> +        :avocado: tags=distro_version:33
> >> +        """
> >> +        self.common_vm_setup(True)
> >> +        self.kernel_params = self.get_default_kernel_params() + '
> >> iommu.strict=0'
> >> +        self.run_and_check()
> >
>


