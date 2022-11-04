Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EA619B20
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 16:12:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqyKe-0001kK-QW; Fri, 04 Nov 2022 11:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oqyKb-0001ju-Ji
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:10:05 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oqyKZ-00084U-Ch
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:10:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 41EB422445;
 Fri,  4 Nov 2022 15:09:58 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 16:09:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033bd5bdf7-106c-4f1c-ab7c-c34b264805db,
 945B05C848FD95514DBD7F319F49D9B690A786E9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <846a83c7-45b5-2058-110c-3d8e9c1fa4b5@kaod.org>
Date: Fri, 4 Nov 2022 16:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Reduce noise on the
 console for SDK tests
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221104075347.370503-1-clg@kaod.org>
 <296866ca-a6d9-796b-46ca-797937d44f12@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <296866ca-a6d9-796b-46ca-797937d44f12@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c96c3fc5-91c4-42b6-96ac-9ae87c76811d
X-Ovh-Tracer-Id: 3118179792421489513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 10:41, Philippe Mathieu-Daudé wrote:
> On 4/11/22 08:53, Cédric Le Goater wrote:
>> The Aspeed SDK images are based on OpenBMC which starts a lot of
>> services. The output noise on the console can break from time to time
>> the test waiting for the logging prompt.
> 
> IIUC OpenBMC uses systemd, so you can mask pointless services from
> the kernel cmdline. See for example test_arm_quanta_gsj():
> 
>   # Disable drivers and services that stall for a long time during boot,
>   # to avoid running past the 90-second timeout. These may be removed
>   # as the corresponding device support is added.
>   kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + (
>           'console=${console} '
>           'mem=${mem} '
>           'initcall_blacklist=npcm_i2c_bus_driver_init '
>           'systemd.mask=systemd-random-seed.service '
>           'systemd.mask=dropbearkey.service '
>   )

Good idea. I will respin with some extra disablement to reduce the
number of services, specially the ones requiring devices without
a backing model in QEMU.
  
> 
>> Change the U-Boot bootargs variable to add "quiet" to the kernel
>> command line and reduce the output volume. This also drops the test on
>> the CPU id which was nice to have but not essential.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   tests/avocado/machine_aspeed.py | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
>> index fba6527026..1fc385e1c8 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -12,6 +12,7 @@
>>   from avocado_qemu import wait_for_console_pattern
>>   from avocado_qemu import exec_command
>>   from avocado_qemu import exec_command_and_wait_for_pattern
>> +from avocado_qemu import interrupt_interactive_console_until_pattern
>>   from avocado.utils import archive
>>   from avocado import skipIf
>> @@ -182,6 +183,8 @@ def test_arm_ast2600_evb_buildroot(self):
>>   class AST2x00MachineSDK(QemuSystemTest):
>> +    EXTRA_BOOTARGS = ' quiet'
> 
> Maybe less bug-prone to handle the spaces around EXTRA_BOOTARGS where
> the variable is used.

sure.

Thanks,

C.


> 
>> -    def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>> +    def do_test_arm_aspeed_sdk_start(self, image):
>>           self.require_netdev('user')
>>           self.vm.set_console()
>>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>> @@ -202,9 +205,13 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>>           self.vm.launch()
>>           self.wait_for_console_pattern('U-Boot 2019.04')
>> -        self.wait_for_console_pattern('## Loading kernel from FIT Image')
>> +        interrupt_interactive_console_until_pattern(
>> +            self, 'Hit any key to stop autoboot:', 'ast#')
>> +        exec_command_and_wait_for_pattern(
>> +            self, 'setenv bootargs ${bootargs}' + self.EXTRA_BOOTARGS, 'ast#')
>> +        exec_command_and_wait_for_pattern(
>> +            self, 'boot', '## Loading kernel from FIT Image')
>>           self.wait_for_console_pattern('Starting kernel ...')
>> -        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
> 


