Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296939C046
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 21:14:04 +0200 (CEST)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpFGd-0000nB-70
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 15:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lpFFe-00005Y-9U
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 15:13:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lpFFb-0000wV-5a
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 15:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622833978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zAWRbn9IAJMUvUXJ1kqRq+c/0WDfD4ay+4iA6m40+dM=;
 b=Xk3oDTHIajSmp9Xk4j860BMaB/S5J8a2fXMEktKsloYp6BFCoOtk0gYZ2CTXCT91YTM71j
 cXmDzndprh16TdtEIi/HqOBMAJk8nmop1CIFXReTFKq2EMEqpTHyTa+uAVu1qXg6urMKZJ
 HOE8JFnK4bzs703sKj6hZqhQrd5XU/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-S9los2uIO-Wkz6ZJZ4L7BA-1; Fri, 04 Jun 2021 15:12:54 -0400
X-MC-Unique: S9los2uIO-Wkz6ZJZ4L7BA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF101935780;
 Fri,  4 Jun 2021 19:12:53 +0000 (UTC)
Received: from localhost (ovpn-112-6.rdu2.redhat.com [10.10.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 279BE1981F;
 Fri,  4 Jun 2021 19:12:50 +0000 (UTC)
Date: Fri, 4 Jun 2021 15:12:49 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v1 2/2] tests/acceptance: add OVMF firmware test to cover
 x86_64 "host" cpu bug
Message-ID: <20210604191249.5ixcqsagn3lew6af@habkost.net>
References: <20210604180945.9330-1-cfontana@suse.de>
 <20210604180945.9330-3-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210604180945.9330-3-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 04, 2021 at 08:09:45PM +0200, Claudio Fontana wrote:
> recent refactoring of i386 broke OVMF firmware with a wrong initialization
> order for host cpu. This test covers this issue for potential regressions.
> 
> For the actual fixes, see:
> commit ("i386: run accel_cpu_instance_init as post_init"),
> commit ("i386: reorder call to cpu_exec_realizefn"),
> 
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

I think basic OVMF boot regression testing is still welcome, but
would we be able to detect this specific bug more quickly and
easily by just looking at the VCPU CPUID data?

We could use the proposed query-kvm-cpuid command for that:
https://lore.kernel.org/qemu-devel/20210603090753.11688-1-valeriy.vdovin@virtuozzo.com


> ---
>  tests/acceptance/boot_ovmf_fc33.py | 75 ++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 tests/acceptance/boot_ovmf_fc33.py
> 
> diff --git a/tests/acceptance/boot_ovmf_fc33.py b/tests/acceptance/boot_ovmf_fc33.py
> new file mode 100644
> index 0000000000..c0c4e0e394
> --- /dev/null
> +++ b/tests/acceptance/boot_ovmf_fc33.py
> @@ -0,0 +1,75 @@
> +# Functional test that boots OVMF firmware with cpu host.
> +#
> +# This test was added to capture x86 "host" cpu initialization and realization
> +# ordering problems.
> +#
> +# Copyright (c) 2021 SUSE LLC
> +#
> +# Author:
> +#  Claudio Fontana <cfontana@suse.de>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +import time
> +
> +from avocado_qemu import Test
> +from avocado_qemu import extract_from_rpm
> +from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import process
> +from avocado.utils.path import find_command, CmdNotFoundError
> +
> +class FirmwareTest(Test):
> +    def wait_for_firmware_message(self, success_message):
> +        wait_for_console_pattern(self, success_message, failure_message=None)
> +
> +class BootOVMF(FirmwareTest):
> +    """
> +    Boots OVMF secureboot and checks for a specific message.
> +    If we do not see the message, it's an ERROR that we express via a timeout.
> +    """
> +    timeout = 10
> +
> +    def test_cpu_host_x86(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        :avocado: tags=machine:q35
> +        :avocado: tags=cpu:host
> +        :avocado: tags=accel:kvm
> +        """
> +        self.require_accelerator("kvm")
> +
> +        rpm_url = ('https://download-ib01.fedoraproject.org/'
> +                   'pub/fedora/linux/updates/33/Everything/x86_64/Packages/e/'
> +                   'edk2-ovmf-20200801stable-3.fc33.noarch.rpm')
> +        rpm_hash = '45e1001313dc2deed9b41a532ef090682a11ccd1'
> +        rpm_path = self.fetch_asset(rpm_url, asset_hash=rpm_hash)
> +
> +        # Note the use of "./" at the beginning of the paths in the rpm,
> +        # it is not an accident, see extract_from_rpm in avocado_qemu/
> +
> +        ovmf_code_sec = extract_from_rpm(self, rpm_path,
> +                                  './usr/share/edk2/ovmf/OVMF_CODE.secboot.fd')
> +        ovmf_vars_sec = extract_from_rpm(self, rpm_path,
> +                                  './usr/share/edk2/ovmf/OVMF_VARS.secboot.fd')
> +
> +        # at this point the ovmf code should be reachable in the tmp dir; we
> +        # can use this sleep to debug issues with the extraction above.
> +        #time.sleep(3600)
> +
> +        self.vm.set_console()
> +        self.vm.add_args(
> +            '-accel', 'kvm',
> +            '-cpu', 'host',
> +            '-machine', 'q35,smm=on',
> +            '-m', '4G',
> +            '-drive',
> +               'if=pflash,format=raw,readonly=on,unit=0,file=' + ovmf_code_sec,
> +            '-drive',
> +               'if=pflash,format=raw,unit=1,file=' + ovmf_vars_sec,
> +            '-display', 'none',
> +            '-serial', 'stdio')
> +        self.vm.launch()
> +        console_pattern = 'BdsDxe: failed to load Boot0001'
> +        self.wait_for_firmware_message(success_message=console_pattern);
> -- 
> 2.26.2
> 

-- 
Eduardo


