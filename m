Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFE33192F2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:19:45 +0100 (CET)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHV9-00028N-3x
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lAHCk-0004iO-J4
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lAHCO-0005eM-MI
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlEKFRNNcCRUTsHniL6kKtbCSbjt2oeAStyIsqIjfqg=;
 b=jSb0gz7Z/Os/Lhiyudg//qaEHrNVCBacuk8/wgBUO44XN+nQ69T/Xf5yvEF+MAxwQq1CB7
 SFyBzJnXzQs6cTXgS1c6nzCNvMaFIuC0aJgZUe3F9PaJw86TbzvYXkbvVsIwW0mHs9kNes
 iR6+bdxPrb+QnquqctAEBRmXkNjMQKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-PkRcKIZaMB2BKba0-I04dw-1; Thu, 11 Feb 2021 13:59:59 -0500
X-MC-Unique: PkRcKIZaMB2BKba0-I04dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52F03108BD14;
 Thu, 11 Feb 2021 18:59:40 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D53BC60C17;
 Thu, 11 Feb 2021 18:59:25 +0000 (UTC)
Subject: Re: [PATCH v2 15/21] tests/acceptance: add a new set of tests to
 exercise plugins
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-16-alex.bennee@linaro.org>
 <dab2bc6c-b467-ca6d-c531-f209b3277f4f@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <76b10b5c-6244-bbd1-d87b-a0d71672f778@redhat.com>
Date: Thu, 11 Feb 2021 15:59:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <dab2bc6c-b467-ca6d-c531-f209b3277f4f@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, Cleber Rosa <crosa@redhat.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/11/21 7:31 AM, Philippe Mathieu-Daudé wrote:
> On 2/10/21 11:10 PM, Alex Bennée wrote:
>> This is just a simple test to count the instructions executed by a
>> kernel. However a later test will detect a failure condition when
>> icount is enabled.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210209182749.31323-7-alex.bennee@linaro.org>
>> ---
>>   tests/acceptance/tcg_plugins.py | 103 ++++++++++++++++++++++++++++++++
>>   1 file changed, 103 insertions(+)
>>   create mode 100644 tests/acceptance/tcg_plugins.py
> Can you add this file to "TCG Plugins" in MAINTAINERS please?
>
>> diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
>> new file mode 100644
>> index 0000000000..b512979769
>> --- /dev/null
>> +++ b/tests/acceptance/tcg_plugins.py
>> @@ -0,0 +1,103 @@
>> +# TCG Plugins tests
>> +#
>> +# These are a little more involved than the basic tests run by check-tcg.
>> +#
>> +# Copyright (c) 2021 Linaro
>> +#
>> +# Author:
>> +#  Alex Bennée <alex.bennee@linaro.org>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +import logging
>> +import time
>> +import tempfile
>> +import mmap
>> +import re
>> +
>> +from boot_linux_console import LinuxKernelTest
>> +
>> +
>> +class PluginKernelBase(LinuxKernelTest):
>> +    """
>> +    Boots a Linux kernel with a TCG plugin enabled.
>> +    """
>> +
>> +    timeout = 120
>> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
>> +
>> +    def run_vm(self, kernel_path, kernel_command_line,
>> +               plugin, plugin_log, console_pattern, args):
>> +
>> +        logger = logging.getLogger('plugin')
>> +        start_time = time.time()
>> +        vm = self.get_vm()
>> +        vm.set_console()
>> +        vm.add_args('-kernel', kernel_path,
>> +                    '-append', kernel_command_line,
>> +                    '-plugin', plugin,
>> +                    '-d', 'plugin',
>> +                    '-D', plugin_log,
>> +                    '-net', 'none',
>> +                    '-no-reboot')
>> +        if args:
>> +            vm.add_args(*args)
>> +
>> +        try:
>> +            vm.launch()
>> +        except:
>> +            # fails if plugins not enabled
>> +            self.cancel("TCG Plugins not enabled")
> The test could fail for other reasons you want to catch...
>
> We don't have yet the possibility to query the binary if it
> has the plugin feature builtin. Can you add a TODO comment
> so we fix that once we got it?
>
>> +
>> +        self.wait_for_console_pattern(console_pattern, vm)
>> +        elapsed = time.time() - start_time
>> +        logger.info('elapsed time %.2f sec' % elapsed)
>> +        # ensure logs are flushed
>> +        vm.shutdown()
>> +        return elapsed
>> +
>> +
>> +class PluginKernelNormal(PluginKernelBase):
>> +
>> +    def _grab_aarch64_kernel(self):
>> +        kernel_url = ('http://security.debian.org/'
>> +                      'debian-security/pool/updates/main/l/linux-signed-arm64/'
>> +                      'linux-image-4.19.0-12-arm64_4.19.152-1_arm64.deb')
>> +        kernel_sha1 = '2036c2792f80ac9c4ccaae742b2e0a28385b6010'
>> +        kernel_deb = self.fetch_asset(kernel_url, asset_hash=kernel_sha1)
>> +        kernel_path = self.extract_from_deb(kernel_deb,
>> +                                            "/boot/vmlinuz-4.19.0-12-arm64")
>> +        return kernel_path
>> +
>> +    def test_aarch64_virt_insn(self):
>> +        """
>> +        :avocado: tags=accel:tcg
>> +        :avocado: tags=arch:aarch64
>> +        :avocado: tags=machine:virt
>> +        :avocado: tags=cpu:cortex-a57
>> +        """
>> +        kernel_path = self._grab_aarch64_kernel()
>> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>> +                               'console=ttyAMA0')
>> +        console_pattern = 'Kernel panic - not syncing: VFS:'
>> +
>> +        plugin_log = tempfile.NamedTemporaryFile(mode="r+t", prefix="plugin",
>> +                                                 suffix=".log")
>> +
>> +        self.run_vm(kernel_path, kernel_command_line,
>> +                    "tests/plugin/libinsn.so", plugin_log.name,
>> +                    console_pattern,
>> +                    args=('-cpu', 'cortex-a53'))
> I had the understanding that by using 'tags=cpu' QEMU would be called
> with "-cpu tags['cpu']". Cleber can you confirm please?

Currently only the 'machine' tag is automatically converted to QEMU 
arguments (in tests/acceptance/avocado_qemu/__init__.py::get_vm()). 
Having the same behavior for other tags like 'cpu' and 'accel' should be 
helpful IMO.


- Wainer

>
>> +
>> +        logger = logging.getLogger()
>> +
>> +        with plugin_log as lf, \
>> +             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
>> +
>> +            m = re.search(br"insns: (?P<count>\d+)", s)
>> +            if "count" in m.groupdict():
>> +                logger.debug("reported %d instructions",
>> +                             int(m.group("count")))
>> +            else:
>> +                logger.debug("Failed to find instruction count")
>> +                self.fail
>>
> With MAINTAINERS & TODO:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> Thanks,
>
> Phil.
>


