Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20892DE38C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:56:44 +0100 (CET)
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGFP-0006O8-OF
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kqFxh-0007Z7-Nv
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kqFxc-0005p3-Jo
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608298699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG6x3VpfoTNtkj0OrpfM0eepjP5bvz3cqc+v33dR2tY=;
 b=b7uzPaXyp1JgPJqFApWc+joINhFBF3uWWSxaOnz/qZvJxvYTPsrYfzPHNeebz/Um2KCHw8
 oOwuBnBOxjD8snOn/yWKx7//3sCSHnq1PE55fRpAZqe8NYRsp8fe9p3yuBR0GJ3k3nTutn
 Zjfhskrs0j9KTuQj/ZseRPp2JVu7Dbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-WWdSgtiZMDO8RvpogWk7Vw-1; Fri, 18 Dec 2020 08:38:16 -0500
X-MC-Unique: WWdSgtiZMDO8RvpogWk7Vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EBF8C7401;
 Fri, 18 Dec 2020 13:38:15 +0000 (UTC)
Received: from gondolin (ovpn-113-130.ams2.redhat.com [10.36.113.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57EA95D9E4;
 Fri, 18 Dec 2020 13:38:06 +0000 (UTC)
Date: Fri, 18 Dec 2020 14:38:03 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/acceptance: Add a test with the Fedora 31
 kernel and initrd
Message-ID: <20201218143803.0c5eecf6.cohuck@redhat.com>
In-Reply-To: <20201217085334.211772-1-thuth@redhat.com>
References: <20201217085334.211772-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 09:53:34 +0100
Thomas Huth <thuth@redhat.com> wrote:

> This initrd contains a virtio-net and a virtio-gpu kernel module,
> so we can check that we can set a MAC address for the network device
> and whether we can hot-plug and -unplug a virtio-crypto device.
> But the most interesting part is maybe that we can also successfully
> write some stuff into the emulated framebuffer of the virtio-gpu
> device and make sure that we can read back that data from a screenshot.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Based-on: 20201215183623.110128-1-thuth@redhat.com
> 
>  v2:
>  - Uncompress the initrd on the host already to speed up the test
>  - Disable plymouth to seepd up the test
>  - Check for device numbers
>  - Added virtio-crypto test
>  - Added ":avocado: tags=device:" lines
> 
>  tests/acceptance/machine_s390_ccw_virtio.py | 111 ++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index abe25a08f0..a9a0f8a8e2 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -9,10 +9,14 @@
>  # This work is licensed under the terms of the GNU GPL, version 2 or
>  # later.  See the COPYING file in the top-level directory.
>  
> +import os
> +import re
> +import tempfile
>  
>  from avocado_qemu import Test
>  from avocado_qemu import exec_command_and_wait_for_pattern
>  from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import archive
>  
>  class S390CCWVirtioMachine(Test):
>      KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> @@ -150,3 +154,110 @@ class S390CCWVirtioMachine(Test):
>          self.vm.command('human-monitor-command', command_line='balloon 128')
>          exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
>                                            'MemTotal:         115640 kB')
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

Hm. I'm wondering whether we should add some of these device: tags to
the other test in this file as well?

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

Does the Fedora image have lscss? (As it seems to have lspci.) If yes,
you could use it here; I only looked directly at the sysfs entry in the
tests above because the environment there is rather minimal.

(We can easily change that on top.)

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
> +
> +        # Hot-plug a virtio-crypto device and see whether it gets accepted
> +        self.clear_guest_dmesg()
> +        self.vm.command('object-add', qom_type='cryptodev-backend-builtin',
> +                        id='cbe0')
> +        self.vm.command('device_add', driver='virtio-crypto-ccw', id='crypdev0',
> +                        cryptodev='cbe0')

Do you want to add a device number and check for it here as well? And
maybe wait for the CRWs here and below, although that might not be
strictly needed?

> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep Accelerator.device) ; do'
> +                        ' sleep 1 ; done', 'Accelerator device is ready')
> +        self.vm.command('device_del', id='crypdev0')
> +        self.vm.command('object-del', id='cbe0')
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep Start.virtcrypto_remove) ; do'
> +                        ' sleep 1 ; done', 'Start virtcrypto_remove.')


