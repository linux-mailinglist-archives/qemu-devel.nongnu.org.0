Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75373BC392
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:16:58 +0200 (CEST)
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0VxZ-00045B-VN
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0VwX-0003K8-JY
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0VwV-0001kL-Mu
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625519750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FiXS7YXthd7vWa4gfL0SK/xy+Vtb2/GD0iiK7O2xmYA=;
 b=I8/9qILKp0cgqcOU6HZzsnuG+HGBbPCww6K+aFGQ3rrHCewbYd+upg785y6UlbT9LMAPOo
 0mvnsmLfCVFzi4SB1M+CJbgfhgqW2nRhXcsWlVZMal0Q8dsd0iaMpkKfi2AmCMfxzyQN25
 jjvytid2mcK7bRvzzZjPxGpKZrrmsXc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-kNQwUpzJOKOlacc6FaS0zQ-1; Mon, 05 Jul 2021 17:15:44 -0400
X-MC-Unique: kNQwUpzJOKOlacc6FaS0zQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 b4-20020ab008440000b029028070c7b794so6759717uaf.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FiXS7YXthd7vWa4gfL0SK/xy+Vtb2/GD0iiK7O2xmYA=;
 b=PM22FDWq5PInbLUHcro4PTaC9e6SlgjG0ZclTpcBL49TL7T2WGZR4Q196II3yDFBvt
 DdqPQS9hsjswdQHAY2SMNUKD07EI2PjzP6rXOaAjvEsAcWFXuOWFqjCmiZ7E9ojDK6wD
 bMaUl4bH3ydRgJFzSEYWXUXYHNsm1IAPpVCvJeNPSDJtINUozW2gjTSnfwoypAkllgrD
 yrdRV0h15hetKhGu95tG+0/ceAsKXRMViQ7Yc2lJpIuaTLOSJ2rF8cnUsQuICKlbEaOK
 HMsQn1vAGDq+P1ysreN2kLavpmaViUtPrf4i/sGD0ew3gnCr45ixTm3p4wsmTxLiEh9s
 IjXw==
X-Gm-Message-State: AOAM532zDHKx/23tNajwKR7dRiqr/Ntr91jDcGyrYdgP5j7leSkK0uC7
 Gqc2+pkIvB2OkKSsNnue1zP6Dzl59BVqCQdjBgiyV0BEhunkcQybdAYBK7jE8I5iJGH8XGpOpDm
 QgBHEn5v+d5D/SmZZyK0BWxCkzHBLypM=
X-Received: by 2002:ab0:20a6:: with SMTP id y6mr12133839ual.133.1625519744077; 
 Mon, 05 Jul 2021 14:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygUzWE/bcADvM+EEoWjGiTAB9ghEx5ztRcK8GHX3FF4/UtgvtDcx2IjDQwlxa2dGy7y6z8AfLWtD/S+wra95M=
X-Received: by 2002:ab0:20a6:: with SMTP id y6mr12133818ual.133.1625519743894; 
 Mon, 05 Jul 2021 14:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <20210629143621.907831-4-eric.auger@redhat.com>
In-Reply-To: <20210629143621.907831-4-eric.auger@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 18:15:17 -0300
Message-ID: <CAKJDGDbLRJxKbp6u79YvRA+14Kn4C=LneiSzNt3s6t_9NvKrLg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] avocado_qemu: Add Intel iommu tests
To: Eric Auger <eric.auger@redhat.com>
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

On Tue, Jun 29, 2021 at 11:36 AM Eric Auger <eric.auger@redhat.com> wrote:
>
> Add Intel IOMMU functional tests based on fedora 31.
> Different configs are checked:
> - strict
> - caching mode, strict
> - passthrough.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/acceptance/intel_iommu.py | 115 ++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 tests/acceptance/intel_iommu.py
>
> diff --git a/tests/acceptance/intel_iommu.py b/tests/acceptance/intel_iommu.py
> new file mode 100644
> index 0000000000..0b68d3c572
> --- /dev/null
> +++ b/tests/acceptance/intel_iommu.py
> @@ -0,0 +1,115 @@
> +# INTEL_IOMMU Functional tests
> +#
> +# Copyright (c) 2021 Red Hat, Inc.
> +#
> +# Author:
> +#  Eric Auger <eric.auger@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os

"os" package is not used, you can remove it, unless you add the skipIf
decorator, then you will need it.

> +
> +from avocado_qemu import LinuxTest, BUILD_DIR

BUILD_DIR is not used in this file.

> +from avocado.utils import ssh

The ssh package is not used in this file.

> +
> +class INTEL_IOMMU(LinuxTest):

I suggest you use IntelIOMMU as the class name, so it conforms to
Python class naming.

> +    """
> +    :avocado: tags=arch:x86_64
> +    :avocado: tags=distro:fedora
> +    :avocado: tags=distro_version:31
> +    :avocado: tags=machine:q35
> +    :avocado: tags=accel:kvm
> +    :avocado: tags=intel_iommu
> +    """
> +
> +    IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
> +    kernel_path = None
> +    initrd_path = None
> +    kernel_params = None
> +
> +    def set_up_boot(self):
> +        path = self.download_boot()
> +        self.vm.add_args('-device', 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
> +                         'drive=drv0,id=virtio-disk0,bootindex=1,'
> +                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
> +        self.vm.add_args('-device', 'virtio-gpu-pci' + self.IOMMU_ADDON)
> +        self.vm.add_args('-drive',
> +                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
> +
> +    def setUp(self):
> +        super(INTEL_IOMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)

If you change the class name, you need to change it here too.

> +
> +    def add_common_args(self):
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
> +        self.vm.add_args('-object',
> +                         'rng-random,id=rng0,filename=/dev/urandom')
> +
> +    def common_vm_setup(self, custom_kernel=None):
> +        self.require_accelerator("kvm")
> +        self.add_common_args()
> +        self.vm.add_args("-accel", "kvm")
> +
> +        if custom_kernel is None:
> +            return
> +
> +        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
> +        initrd_url = self.get_pxeboot_url() + 'initrd.img'
> +        self.kernel_path = self.fetch_asset(kernel_url)
> +        self.initrd_path = self.fetch_asset(initrd_url)
> +
> +    def run_and_check(self):
> +        if self.kernel_path:
> +            self.vm.add_args('-kernel', self.kernel_path,
> +                             '-append', self.kernel_params,
> +                             '-initrd', self.initrd_path)
> +        self.launch_and_wait()
> +        self.ssh_command('cat /proc/cmdline')
> +        self.ssh_command('dmesg | grep -e DMAR -e IOMMU')
> +        self.ssh_command('find /sys/kernel/iommu_groups/ -type l')
> +        self.ssh_command('dnf -y install numactl-devel')
> +
> +    def test_intel_iommu(self):
> +        """
> +        :avocado: tags=intel_iommu_intremap
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on')
> +        self.vm.add_args('-machine', 'kernel_irqchip=split')
> +
> +        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on'
> +        self.run_and_check()
> +
> +    def test_intel_iommu_strict(self):
> +        """
> +        :avocado: tags=intel_iommu_strict
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on')
> +        self.vm.add_args('-machine', 'kernel_irqchip=split')
> +        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on,strict'
> +        self.run_and_check()
> +
> +    def test_intel_iommu_strict_cm(self):
> +        """
> +        :avocado: tags=intel_iommu_strict_cm
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on,caching-mode=on')
> +        self.vm.add_args('-machine', 'kernel_irqchip=split')
> +        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on,strict'
> +        self.run_and_check()
> +
> +    def test_intel_iommu_pt(self):
> +        """
> +        :avocado: tags=intel_iommu_pt
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on')
> +        self.vm.add_args('-machine', 'kernel_irqchip=split')
> +        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on iommu=pt'
> +        self.run_and_check()
> --
> 2.26.3
>


