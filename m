Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD592DE630
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:07:37 +0100 (CET)
Received: from localhost ([::1]:60064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHLz-0007K9-R5
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kqHK0-0006KX-G1
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:05:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kqHJv-0002Tk-SI
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608303926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JI+2deDWKXxFRoZuynNRK3r9wo8hZzAn4VK4VPi8f10=;
 b=ODjS2ndNHg0IGQ1jNi/odYmy3SJY3SRxWcJybGkQjqcWvnT0ohuDXEjfHy+kBXVEQaosR5
 ZHkCs7mxqxlCGwZw0haOn+Xa7hyuw6bnlenJ+Fdy+8+Flm13e2/XoVgtSQ6YOXAtn1vOoY
 sFC74WwdUtv5mjc80Vv6P8RelF7gHSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-acv-rJPFPU6BK0JOnO4a9g-1; Fri, 18 Dec 2020 10:05:22 -0500
X-MC-Unique: acv-rJPFPU6BK0JOnO4a9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 695188049FF;
 Fri, 18 Dec 2020 15:05:21 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6355C17577;
 Fri, 18 Dec 2020 15:05:10 +0000 (UTC)
Subject: Re: [PATCH v2] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20201217085334.211772-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <42f7ec3e-9e16-ea84-5ed4-566d5175390d@redhat.com>
Date: Fri, 18 Dec 2020 12:05:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201217085334.211772-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/17/20 5:53 AM, Thomas Huth wrote:
> This initrd contains a virtio-net and a virtio-gpu kernel module,
> so we can check that we can set a MAC address for the network device
> and whether we can hot-plug and -unplug a virtio-crypto device.
> But the most interesting part is maybe that we can also successfully
> write some stuff into the emulated framebuffer of the virtio-gpu
> device and make sure that we can read back that data from a screenshot.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Based-on: 20201215183623.110128-1-thuth@redhat.com
>
>   v2:
>   - Uncompress the initrd on the host already to speed up the test
>   - Disable plymouth to seepd up the test
>   - Check for device numbers
>   - Added virtio-crypto test
>   - Added ":avocado: tags=device:" lines
>
>   tests/acceptance/machine_s390_ccw_virtio.py | 111 ++++++++++++++++++++
>   1 file changed, 111 insertions(+)
>
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index abe25a08f0..a9a0f8a8e2 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -9,10 +9,14 @@
>   # This work is licensed under the terms of the GNU GPL, version 2 or
>   # later.  See the COPYING file in the top-level directory.
>   
> +import os
> +import re
're' is not used.
> +import tempfile
>   
>   from avocado_qemu import Test
>   from avocado_qemu import exec_command_and_wait_for_pattern
>   from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import archive
>   
>   class S390CCWVirtioMachine(Test):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> @@ -150,3 +154,110 @@ class S390CCWVirtioMachine(Test):
>           self.vm.command('human-monitor-command', command_line='balloon 128')
>           exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
>                                             'MemTotal:         115640 kB')
> +
> +
> +    def test_s390x_fedora(self):
> +
> +        """
> +        :avocado: tags=arch:s390x
> +        :avocado: tags=machine:s390-ccw-virtio
> +        :avocado: tags=device:virtio-gpu
> +        :avocado: tags=device:virtio-crypto
> +        :avocado: tags=device:virtio-net
> +        """
> +
> +        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
> +                      '/fedora-secondary/releases/31/Server/s390x/os'
> +                      '/images/kernel.img')
> +        kernel_hash = 'b93d1efcafcf29c1673a4ce371a1f8b43941cfeb'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +
> +        initrd_url = ('https://archives.fedoraproject.org/pub/archive'
> +                      '/fedora-secondary/releases/31/Server/s390x/os'
> +                      '/images/initrd.img')
> +        initrd_hash = '3de45d411df5624b8d8ef21cd0b44419ab59b12f'
> +        initrd_path_xz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +        initrd_path = os.path.join(self.workdir, 'initrd-raw.img')
> +        archive.lzma_uncompress(initrd_path_xz, initrd_path)
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE + ' audit=0 '
> +                              'rd.plymouth=0 plymouth.enable=0 rd.rescue')
> +        self.vm.add_args('-nographic',
> +                         '-smp', '4',
> +                         '-m', '512',
> +                         '-name', 'Some Guest Name',
> +                         '-uuid', '30de4fd9-b4d5-409e-86a5-09b387f70bfa',
> +                         '-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line,
> +                         '-device', 'zpci,uid=7,target=n',
> +                         '-device', 'virtio-net-pci,id=n,mac=02:ca:fe:fa:ce:12',
> +                         '-device', 'virtio-rng-ccw,devno=fe.1.9876',
> +                         '-device', 'virtio-gpu-ccw,devno=fe.2.5432')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Entering emergency mode')
> +
> +        # Some tests to see whether the CLI options have been considered:
> +        exec_command_and_wait_for_pattern(self, 'lspci',
> +                             '0007:00:00.0 Class 0200: Device 1af4:1000')
> +        exec_command_and_wait_for_pattern(self,
> +                             'cat /sys/class/net/enP7p0s0/address',
> +                             '02:ca:fe:fa:ce:12')
> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> +                             '0.1.9876')
> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> +                             '0.2.5432')
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                             'processors    : 4')
> +        exec_command_and_wait_for_pattern(self, 'grep MemTotal /proc/meminfo',
> +                             'MemTotal:         499848 kB')
> +        exec_command_and_wait_for_pattern(self, 'grep Name /proc/sysinfo',
> +                             'Extended Name:   Some Guest Name')
> +        exec_command_and_wait_for_pattern(self, 'grep UUID /proc/sysinfo',
> +                             '30de4fd9-b4d5-409e-86a5-09b387f70bfa')
> +
> +        # Disable blinking cursor, then write some stuff into the framebuffer.
> +        # QEMU's PPM screendumps contain uncompressed 24-bit values, while the
> +        # framebuffer uses 32-bit, so we pad our text with some spaces when
> +        # writing to the framebuffer. Since the PPM is uncompressed, we then
> +        # can simply read the written "magic bytes" back from the PPM file to
> +        # check whether the framebuffer is working as expected.
> +        exec_command_and_wait_for_pattern(self,
> +            'echo -e "\e[?25l" > /dev/tty0', ':/#')
> +        exec_command_and_wait_for_pattern(self, 'for ((i=0;i<250;i++)); do '
> +            'echo " The  qu ick  fo x j ump s o ver  a  laz y d og" >> fox.txt;'
> +            'done',
> +            ':/#')
> +        exec_command_and_wait_for_pattern(self,
> +            'dd if=fox.txt of=/dev/fb0 bs=1000 oflag=sync,nocache ; rm fox.txt',
> +            '12+0 records out')
> +        tmpfile = tempfile.NamedTemporaryFile(suffix='.ppm',
> +                                              prefix='qemu-scrdump-')
> +        self.vm.command('screendump', filename=tmpfile.name)
> +        ppmfile = open(tmpfile.name, "r")
> +        tmpfile.close
> +        line = ppmfile.readline()
> +        self.assertEqual(line, "P6\n")
> +        line = ppmfile.readline()
> +        self.assertEqual(line, "1024 768\n")
> +        line = ppmfile.readline()
> +        self.assertEqual(line, "255\n")
> +        line = ppmfile.readline()
> +        self.assertEqual(line, "The quick fox jumps over a lazy dog\n")
> +        ppmfile.close

In case you don't want to deal with 2 tmp files (and manually close 
them), here goes a suggestion:

         with tempfile.NamedTemporaryFile(suffix='.ppm',
                 prefix='qemu-scrdump-') as ppmfile:
             self.vm.command('screendump', filename=ppmfile.name)
             ppmfile.seek(0)
             line = ppmfile.readline()
             self.assertEqual(line, b"P6\n")
             line = ppmfile.readline()
             self.assertEqual(line, b"1024 768\n")
             line = ppmfile.readline()
             self.assertEqual(line, b"255\n")
             line = ppmfile.readline()
             self.assertEqual(line, b"The quick fox jumps over a lazy 
dog\n")

> +
> +        # Hot-plug a virtio-crypto device and see whether it gets accepted

Yet another suggestion. The other day Cornelia asked how to make it 
easier to debug those asserts since it's being tested various conditions 
on a single test method (for the sake of speed). One simple thing would 
be print 'info' to the test logs, e.g.:

self.log.info("Test hot-plug virtio-crypto device")

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


> +        self.clear_guest_dmesg()
> +        self.vm.command('object-add', qom_type='cryptodev-backend-builtin',
> +                        id='cbe0')
> +        self.vm.command('device_add', driver='virtio-crypto-ccw', id='crypdev0',
> +                        cryptodev='cbe0')
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep Accelerator.device) ; do'
> +                        ' sleep 1 ; done', 'Accelerator device is ready')
> +        self.vm.command('device_del', id='crypdev0')
> +        self.vm.command('object-del', id='cbe0')
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep Start.virtcrypto_remove) ; do'
> +                        ' sleep 1 ; done', 'Start virtcrypto_remove.')


