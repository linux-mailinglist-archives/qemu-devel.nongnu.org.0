Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD952DBF8B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:38:12 +0100 (CET)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpV8G-0007HB-0T
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpV6b-0006e6-DZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpV6X-0004d7-V7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608118585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIT0+ucIcF8ZS1mBeugBG8ThVoeTp42UKdceXPw6uZ8=;
 b=fWmeYQHNX6rXpDZWkUlxVQgoe4zFLDaNmCcPAaCbYliZYf/ELwCqWmKazn3EimtBcmftrf
 PjtjRGRAme5f1H/E3VkHEY5/IztR97JLIoQbEWj5VmqRolZw5FsrM1qpoX96riYqwYIuoT
 ERYjtCd7oFqsXx4BIFNZ2RMhAWkHPwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-mI2bpkqsPZK1xXkMHXH-Ug-1; Wed, 16 Dec 2020 06:36:23 -0500
X-MC-Unique: mI2bpkqsPZK1xXkMHXH-Ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EF74CC623;
 Wed, 16 Dec 2020 11:36:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8080810013C1;
 Wed, 16 Dec 2020 11:36:13 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
To: Cornelia Huck <cohuck@redhat.com>
References: <20201216105711.14796-1-thuth@redhat.com>
 <20201216123238.03c922b2.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fd6c8fc8-f78f-5443-254f-3cdd2b70ecae@redhat.com>
Date: Wed, 16 Dec 2020 12:36:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201216123238.03c922b2.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/2020 12.32, Cornelia Huck wrote:
> On Wed, 16 Dec 2020 11:57:11 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> This initrd contains a virtio-net and a virtio-gpu kernel module,
>> so we can check that we can set a MAC address for the network device
>> and that we can successfully write some stuff into the emulated
>> framebuffer of the virtio-gpu device.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  Based-on: 20201215183623.110128-1-thuth@redhat.com
>>
>>  tests/acceptance/machine_s390_ccw_virtio.py | 78 +++++++++++++++++++++
>>  1 file changed, 78 insertions(+)
>>
>> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
>> index abe25a08f0..a5be26b38e 100644
>> --- a/tests/acceptance/machine_s390_ccw_virtio.py
>> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
>> @@ -9,6 +9,8 @@
>>  # This work is licensed under the terms of the GNU GPL, version 2 or
>>  # later.  See the COPYING file in the top-level directory.
>>  
>> +import re
>> +import tempfile
>>  
>>  from avocado_qemu import Test
>>  from avocado_qemu import exec_command_and_wait_for_pattern
>> @@ -150,3 +152,79 @@ class S390CCWVirtioMachine(Test):
>>          self.vm.command('human-monitor-command', command_line='balloon 128')
>>          exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
>>                                            'MemTotal:         115640 kB')
>> +
>> +
>> +    def test_s390x_fedora(self):
>> +
>> +        """
>> +        :avocado: tags=arch:s390x
>> +        :avocado: tags=machine:s390-ccw-virtio
>> +        """
>> +
>> +        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
>> +                      '/fedora-secondary/releases/31/Server/s390x/os'
>> +                      '/images/kernel.img')
>> +        kernel_hash = 'b93d1efcafcf29c1673a4ce371a1f8b43941cfeb'
>> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
>> +
>> +        initrd_url = ('https://archives.fedoraproject.org/pub/archive'
>> +                      '/fedora-secondary/releases/31/Server/s390x/os'
>> +                      '/images/initrd.img')
>> +        initrd_hash = '3de45d411df5624b8d8ef21cd0b44419ab59b12f'
>> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
>> +
>> +        self.vm.set_console()
>> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>> +                              ' audit=0 rd.rescue')
>> +        self.vm.add_args('-nographic',
>> +                         '-smp', '4',
>> +                         '-m', '512',
>> +                         '-name', 'Some Guest Name',
>> +                         '-uuid', '30de4fd9-b4d5-409e-86a5-09b387f70bfa',
>> +                         '-kernel', kernel_path,
>> +                         '-initrd', initrd_path,
>> +                         '-append', kernel_command_line,
>> +                         '-device', 'virtio-net-pci,mac=02:ca:fe:fa:ce:12',
>> +                         '-device', 'virtio-rng-ccw',
>> +                         '-device', 'virtio-gpu-ccw')
> 
> Would it make sense to explicitly specify bus ids for the ccw devices?
> You could check for them below, and it would potentially be more clear
> *what* actually failed (e.g. handling the mac address vs device
> detection).

Do you mean PCI or CCW bus ids? The MAC address is only used for a PCI
device here... but sure, I can add some addresses if you like.

>> +        self.vm.launch()
>> +        self.wait_for_console_pattern('Entering emergency mode')
>> +
>> +        # Some tests to see whether the CLI options have been considered:
>> +        exec_command_and_wait_for_pattern(self,
>> +                             'cat /sys/class/net/enP1p0s0/address',
>> +                             '02:ca:fe:fa:ce:12')
>> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
>> +                             'processors    : 4')
>> +        exec_command_and_wait_for_pattern(self, 'grep MemTotal /proc/meminfo',
>> +                             'MemTotal:         499848 kB')
>> +        exec_command_and_wait_for_pattern(self, 'grep Name /proc/sysinfo',
>> +                             'Extended Name:   Some Guest Name')
>> +        exec_command_and_wait_for_pattern(self, 'grep UUID /proc/sysinfo',
>> +                             '30de4fd9-b4d5-409e-86a5-09b387f70bfa')
>> +
>> +        # Disable blinking cursor, then write some stuff into the framebuffer
>> +        # ("32-bit encoded", the screendump PPM will then only contain 24-bit)
>> +        exec_command_and_wait_for_pattern(self,
>> +            'echo -e "\e[?25l" > /dev/tty0', ':/#')
>> +        exec_command_and_wait_for_pattern(self, 'for ((i=0;i<500;i++)); do '
>> +            'echo " The  qu ick  fo x j ump s o ver  a  laz y d og" >> fox.txt;'
>> +            'done',
>> +            ':/#')
>> +        exec_command_and_wait_for_pattern(self,
>> +            'dd if=fox.txt of=/dev/fb0 bs=1000 oflag=sync,nocache ; rm fox.txt',
>> +            '24+0 records out')
>> +        tmpfile = tempfile.NamedTemporaryFile(suffix='.ppm',
>> +                                              prefix='qemu-scrdump-')
>> +        self.vm.command('screendump', filename=tmpfile.name)
>> +        ppmfile = open(tmpfile.name, "r")
>> +        tmpfile.close
>> +        line = ppmfile.readline()
>> +        self.assertEqual(line, "P6\n")
>> +        line = ppmfile.readline()
>> +        self.assertEqual(line, "1024 768\n")
>> +        line = ppmfile.readline()
>> +        self.assertEqual(line, "255\n")
>> +        line = ppmfile.readline()
>> +        self.assertEqual(line, "The quick fox jumps over a lazy dog\n")
>> +        ppmfile.close
> 
> I think this sequence needs an explanatory comment :)

See my other mail :-)

 Thomas


