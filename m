Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741782F3291
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:07:15 +0100 (CET)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKKI-00063d-30
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kzKIj-0004xN-Pc
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kzKId-00048G-Ov
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610460329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKnU1ufa3dp/BwFD4GW0a7C0292OwmKNudjo1FSgzXo=;
 b=Q6Nh9+pjViQEt7dT9vHSVTYO0EYtfF+hJWA1mVumm0QPrUaFZq8K7dK5+Un8S7A6ZyKP8N
 6a9pAzbo1tvaOuymlKyv/p9X8Cqz2C8gXNybTlK8iS2vXhbEaXrY8OUCjAnL/XfGg+c1SO
 04aH7ng11GW1qfDtGARnw1xUGWVVBy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-1ZcDiJkUMf-nBtEU_ajGoQ-1; Tue, 12 Jan 2021 09:05:27 -0500
X-MC-Unique: 1ZcDiJkUMf-nBtEU_ajGoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2809180A08A;
 Tue, 12 Jan 2021 14:05:26 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B78BA5C1B4;
 Tue, 12 Jan 2021 14:05:22 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <eb1cf209-b0fb-7009-bd29-1627cb839774@redhat.com>
Date: Tue, 12 Jan 2021 11:05:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 1/11/21 11:07 PM, Jiaxun Yang wrote:
> Test booting of PMON bootloader on loongson3-virt platform.
>
> $ (venv) AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>      avocado --show=app,console \
>        run -t machine:loongson3-virt tests/acceptance
> Fetching asset from tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console
> JOB ID     : 8e202b3727847c9104d0d3d6546ed225d35f6706
> JOB LOG    : /home/flygoat/avocado/job-results/job-2021-01-12T10.02-8e202b3/job.log
>   (1/1) tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console:  console: PMON2000 MIPS Initializing. Standby...
> console: 00000000Jump to 9fc
<snip>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   MAINTAINERS                                 |  1 +
>   tests/acceptance/machine_mips_loongson3v.py | 39 +++++++++++++++++++++
>   2 files changed, 40 insertions(+)
>   create mode 100644 tests/acceptance/machine_mips_loongson3v.py

Allow me to use this new test as an example to start a discussion about 
the organization of the acceptance files.

The mips64le tests currently are:

$ ./venv/bin/avocado list -t arch:mips64el acceptance/

INSTRUMENTED 
acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_malta
INSTRUMENTED 
acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e
INSTRUMENTED 
acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_malta_5KEc_cpio
INSTRUMENTED 
acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta64el_kernel3_2_0
INSTRUMENTED 
acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console
INSTRUMENTED 
acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_mips_malta_i6400_framebuffer_logo_1core
INSTRUMENTED 
acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_mips_malta_i6400_framebuffer_logo_7cores
INSTRUMENTED 
acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_mips_malta_i6400_framebuffer_logo_8cores
INSTRUMENTED 
acceptance/replay_kernel.py:ReplayKernelNormal.test_mips64el_malta
INSTRUMENTED 
acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio

Most of them are simple "boot linux (or firmware) and check the console" 
tests. The replay_kernel.py contain tests for a given feature and happen 
to be testing on mips64el as well. So on tests/acceptance directory 
we've got boot tests spread across files and mixed with "generic" 
feature tests.

I think we should find a home for those boot tests. Maybe throw them all 
in a sub-directory called "boot_tests", or in arch-oriented directories 
(boot_tests/mips64el, boot_tests/x86_64, ...) which would make easier to 
reference them in the MAINTAINERS file.

Any thought?

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4be087b88e..f38882f997 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1164,6 +1164,7 @@ F: hw/intc/loongson_liointc.c
>   F: hw/mips/loongson3_bootp.c
>   F: hw/mips/loongson3_bootp.h
>   F: hw/mips/loongson3_virt.c
> +F: tests/acceptance/machine_mips_loongson3v.py
>   
>   Boston
>   M: Paul Burton <paulburton@kernel.org>
> diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
> new file mode 100644
> index 0000000000..17a85de69f
> --- /dev/null
> +++ b/tests/acceptance/machine_mips_loongson3v.py
> @@ -0,0 +1,39 @@
> +# Functional tests for the Generic Loongson-3 Platform.
> +#
> +# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import time

Unused time import

Thanks!

- Wainer

> +
> +from avocado import skipUnless
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +
> +class MipsLoongson3v(Test):
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_pmon_serial_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=endian:little
> +        :avocado: tags=machine:loongson3-virt
> +        :avocado: tags=cpu:Loongson-3A1000
> +        :avocado: tags=device:liointc
> +        :avocado: tags=device:goldfish_rtc
> +        """
> +
> +        pmon_hash = '7c8b45dd81ccfc55ff28f5aa267a41c3'
> +        pmon_path = self.fetch_asset('https://github.com/loongson-community/pmon/'
> +                                    'releases/download/20210112/pmon-3avirt.bin',
> +                                     asset_hash=pmon_hash, algorithm='md5'
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
> +        wait_for_console_pattern(self, 'Copy PMON to execute location done.')
> +        wait_for_console_pattern(self, 'CPU GODSON3 BogoMIPS:')


