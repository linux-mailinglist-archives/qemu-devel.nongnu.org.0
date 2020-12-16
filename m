Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C3E2DBF81
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:35:45 +0100 (CET)
Received: from localhost ([::1]:50094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpV5s-00062l-TH
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpV2t-0003vX-S3
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:32:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpV2q-0003RX-4M
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608118355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p8qRSbYa7+7RNnt/uCEbEjSvFlEhm+AHxJ/3wclQSWI=;
 b=VGmIWgeS+yJhTCZc6vtlMwZs8WEPCY8O9iPLewu1ou4FNd1vHzVjIEOfI6VVaG+/7/q1qt
 jqnK59OVyF7vzLCjB/dD2WM9qFDggxo9hauZKxRs4vqmSBypvdxiz89hGTgZo5sEE+Auoj
 KljCj3D5LMNBgtNFRnVgwAlOCq0XKOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-KrikGEmhNXieO8qVJBGRxg-1; Wed, 16 Dec 2020 06:32:32 -0500
X-MC-Unique: KrikGEmhNXieO8qVJBGRxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85331107ACF6;
 Wed, 16 Dec 2020 11:32:31 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 275E919C48;
 Wed, 16 Dec 2020 11:32:22 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>
References: <20201216105711.14796-1-thuth@redhat.com>
Message-ID: <6948dfc6-5ec4-6d7f-2c76-fe8449b8aa14@redhat.com>
Date: Wed, 16 Dec 2020 12:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201216105711.14796-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/2020 11.57, Thomas Huth wrote:
> This initrd contains a virtio-net and a virtio-gpu kernel module,
> so we can check that we can set a MAC address for the network device
> and that we can successfully write some stuff into the emulated
> framebuffer of the virtio-gpu device.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Based-on: 20201215183623.110128-1-thuth@redhat.com
> 
>  tests/acceptance/machine_s390_ccw_virtio.py | 78 +++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index abe25a08f0..a5be26b38e 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -9,6 +9,8 @@
>  # This work is licensed under the terms of the GNU GPL, version 2 or
>  # later.  See the COPYING file in the top-level directory.
>  
> +import re
> +import tempfile
>  
>  from avocado_qemu import Test
>  from avocado_qemu import exec_command_and_wait_for_pattern
> @@ -150,3 +152,79 @@ class S390CCWVirtioMachine(Test):
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
> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                              ' audit=0 rd.rescue')
> +        self.vm.add_args('-nographic',
> +                         '-smp', '4',
> +                         '-m', '512',
> +                         '-name', 'Some Guest Name',
> +                         '-uuid', '30de4fd9-b4d5-409e-86a5-09b387f70bfa',
> +                         '-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line,
> +                         '-device', 'virtio-net-pci,mac=02:ca:fe:fa:ce:12',
> +                         '-device', 'virtio-rng-ccw',
> +                         '-device', 'virtio-gpu-ccw')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Entering emergency mode')
> +
> +        # Some tests to see whether the CLI options have been considered:
> +        exec_command_and_wait_for_pattern(self,
> +                             'cat /sys/class/net/enP1p0s0/address',
> +                             '02:ca:fe:fa:ce:12')
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                             'processors    : 4')
> +        exec_command_and_wait_for_pattern(self, 'grep MemTotal /proc/meminfo',
> +                             'MemTotal:         499848 kB')
> +        exec_command_and_wait_for_pattern(self, 'grep Name /proc/sysinfo',
> +                             'Extended Name:   Some Guest Name')
> +        exec_command_and_wait_for_pattern(self, 'grep UUID /proc/sysinfo',
> +                             '30de4fd9-b4d5-409e-86a5-09b387f70bfa')
> +
> +        # Disable blinking cursor, then write some stuff into the framebuffer
> +        # ("32-bit encoded", the screendump PPM will then only contain 24-bit)

As just discussed offline with Cornelia, this maybe needs some more
explanation, so I'd suggest to add something like:

 # Disable blinking cursor, then write some stuff into the
 # framebuffer. QEMU's PPM screendumps contain uncompressed
 # 24-bit values, while the framebuffer uses 32-bit, so we
 # pad our text with some spaces when writing to the frame-
 # buffer. Since the PPM is uncompressed, we then can simple
 # read the written "magic bytes" back from the PPM file to
 # check whether the framebuffer is working as expected.

Does that sound ok?

 Thomas


> +        exec_command_and_wait_for_pattern(self,
> +            'echo -e "\e[?25l" > /dev/tty0', ':/#')
> +        exec_command_and_wait_for_pattern(self, 'for ((i=0;i<500;i++)); do '
> +            'echo " The  qu ick  fo x j ump s o ver  a  laz y d og" >> fox.txt;'
> +            'done',
> +            ':/#')
> +        exec_command_and_wait_for_pattern(self,
> +            'dd if=fox.txt of=/dev/fb0 bs=1000 oflag=sync,nocache ; rm fox.txt',
> +            '24+0 records out')
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
> 


