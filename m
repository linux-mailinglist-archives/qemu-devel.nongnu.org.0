Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71151419D2A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:43:38 +0200 (CEST)
Received: from localhost ([::1]:46130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUufB-0007V6-A9
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUuYu-0004N8-J2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:37:08 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:47325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUuYs-0005sQ-6d
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:37:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0FE2F204A1;
 Mon, 27 Sep 2021 17:37:02 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 27 Sep
 2021 19:37:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004d1cc0724-2387-469a-82e2-71a0136155f6,
 7A1C2730502A6E1581EB46D208322E62E5328AE4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <557fc854-042f-bef0-386d-e290dbd6c4ab@kaod.org>
Date: Mon, 27 Sep 2021 19:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] tests/acceptance: Test powernv machines
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20210817093036.1288791-1-clg@kaod.org>
 <e6bc86e3-1141-9f05-fba3-3319d97583a2@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e6bc86e3-1141-9f05-fba3-3319d97583a2@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 06bb9111-fd16-4fc5-b0cb-d7c85cd24368
X-Ovh-Tracer-Id: 89227568446540649
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopeifrghinhgvrhhsmhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 19:21, Philippe Mathieu-Daudé wrote:
> On 8/17/21 11:30, Cédric Le Goater wrote:
>> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
>> with a simple PCI layout.
>>
>> Cc: Cleber Rosa <crosa@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>   Since v2:
>>
>>   - Change the skiboot.lid file to use the one shipped with QEMU
>>   
>>   tests/acceptance/boot_linux_console.py | 35 ++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>> index 5248c8097df9..59c9309c4d0b 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>> @@ -1176,6 +1176,41 @@ def test_ppc64_e500(self):
>>           tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>>           self.do_test_advcal_2018('19', tar_hash, 'uImage')
>>   
>> +    def do_test_ppc64_powernv(self, proc):
>> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
>> +
>> +        kernel_url = images_url + 'zImage.epapr'
>> +        kernel_hash = '0ab237df661727e5392cee97460e8674057a883c5f74381a128fa772588d45cd'
>> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash,
>> +                                       algorithm='sha256')
>> +        self.vm.set_console()
>> +        self.vm.add_args('-kernel', kernel_path,
>> +                         '-append', 'console=tty0 console=hvc0',
>> +                         '-device', 'pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0',
>> +                         '-device', 'nvme,bus=pcie.2,addr=0x0,serial=1234',
>> +                         '-device', 'e1000e,bus=bridge1,addr=0x3',
>> +                         '-device', 'nec-usb-xhci,bus=bridge1,addr=0x2')
>> +        self.vm.launch()
>> +
>> +        self.wait_for_console_pattern("CPU: " + proc + " generation processor")
>> +        self.wait_for_console_pattern("zImage starting: loaded")
>> +        self.wait_for_console_pattern("Run /init as init process")
>> +        self.wait_for_console_pattern("Creating 1 MTD partitions")
>> +
>> +    def test_ppc_powernv8(self):
>> +        """
>> +        :avocado: tags=arch:ppc64
>> +        :avocado: tags=machine:powernv8
>> +        """
>> +        self.do_test_ppc64_powernv('P8')
>> +
>> +    def test_ppc_powernv9(self):
>> +        """
>> +        :avocado: tags=arch:ppc64
>> +        :avocado: tags=machine:powernv9
>> +        """
>> +        self.do_test_ppc64_powernv('P9')
>> +
>>       def test_ppc_g3beige(self):
>>           """
>>           :avocado: tags=arch:ppc
>>
> 
> Kinda borderline w.r.t. 90 sec timeout limit... (using --enable-debug):
> 
> JOB ID     : 5229c34e837b7b6de18c68115b07f0eebc446784
> JOB LOG    :
> /home/phil/avocado/job-results/job-2021-09-27T19.15-5229c34/job.log
>   (1/3)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc64_e500:
> PASS (6.58 s)
>   (2/3)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:
> PASS (80.38 s)
>   (3/3)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:
> PASS (89.22 s)
> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
> CANCEL 0
> JOB TIME   : 176.84 s

It's too long I agree and I can remove some of the PCI adapters which
need training.

What's your laptop like ?

> You might want to increase the per-test timeout.
> 
> Meanwhile,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> and applied to my integration-testing tree.
>


Thanks,

C.

