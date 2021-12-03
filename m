Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C43467490
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 11:11:40 +0100 (CET)
Received: from localhost ([::1]:51518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt5XV-0001rY-Fs
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 05:11:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt5Vv-0000uA-5X
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:10:00 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt5Vr-0001Qc-T6
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:09:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6D36BCF9A733;
 Fri,  3 Dec 2021 11:09:51 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 11:09:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00141944229-e8f0-4b84-af90-065f2d4a4d61,
 530A9595C01F0F4EFEED26D362E2F82770F5CBE3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dde9544d-a8c9-a192-f92c-3a090be9e651@kaod.org>
Date: Fri, 3 Dec 2021 11:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 16/26] tests/acceptance: Test Sandalfoot initrd on the
 PReP/40p
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20191028073441.6448-1-philmd@redhat.com>
 <20191028073441.6448-17-philmd@redhat.com>
 <20191028190820.GK3978@localhost.localdomain>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20191028190820.GK3978@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a7551d6-7756-4019-991b-31ebcf4e50c8
X-Ovh-Tracer-Id: 17072864712554417025
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeduudejfefgffeuleduudevtefhteehhffgveehudduieeileejheehieffffehffenucffohhmrghinheptghorhgvsghoohhtrdhorhhgpdhjuhhnvggruhdqlhhughdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kamil Rytarowski <kamil@netbsd.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 QEMU PowerPC <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/19 20:08, Cleber Rosa wrote:
> On Mon, Oct 28, 2019 at 08:34:31AM +0100, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> User case from:
>> https://mail.coreboot.org/pipermail/openbios/2018-May/010360.html
>>
>> Sandalfoot info:
>> http://www.juneau-lug.org/sandalfoot.php
>>
>> Acked-by: David Gibson <david@gibson.dropbear.id.au>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v3:
>> - use avocado_qemu.wait_for_console_pattern (Cleber)
>> - use exec_command_and_wait_for_pattern
>> - check getenv(AVOCADO_ALLOW_UNTRUSTED_CODE) (pm215)
>> ---
>>   tests/acceptance/ppc_prep_40p.py | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
>> index b4109a7af3..c5ecabf52f 100644
>> --- a/tests/acceptance/ppc_prep_40p.py
>> +++ b/tests/acceptance/ppc_prep_40p.py
>> @@ -11,6 +11,7 @@ import logging
>>   from avocado import skipIf
>>   from avocado import skipUnless
>>   from avocado_qemu import MachineTest
>> +from avocado_qemu import exec_command_and_wait_for_pattern
>>   from avocado_qemu import wait_for_console_pattern
>>   
>>   
>> @@ -101,3 +102,33 @@ class IbmPrep40pMachine(MachineTest):
>>   
>>           self.vm.launch()
>>           wait_for_console_pattern(self, 'NetBSD/prep BOOT, Revision 1.9')
>> +
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>> +    def test_sandalfoot_busybox(self):
>> +        """
>> +        :avocado: tags=arch:ppc
>> +        :avocado: tags=machine:40p
>> +        """
>> +        drive_url = ('http://www.juneau-lug.org/zImage.initrd.sandalfoot')
>> +        drive_hash = 'dacacfc4085ea51d34d99ef70e972b849e2c6949'
>> +        drive_path = self.fetch_asset(drive_url, asset_hash=drive_hash)
>> +
>> +        self.vm.set_machine('40p')
>> +        self.vm.set_console()
>> +        self.vm.add_args('-cdrom', drive_path,
>> +                         '-boot', 'd')
>> +
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'Now booting the kernel')
> 
> I could never get past this point.  Any ideas?

I think this is because the message below :

>> +
>> +        msg = 'Please press Enter to activate this console.'

waits for a Line Feed and the console interaction does a readline.

It would be interesting to include this acceptance/avocado test for
the 40p machine because QEMU still supports the 604 CPUs quite well.

Thanks,

C.


>> +        wait_for_console_pattern(self, msg)
>> +
>> +        version = 'BusyBox v0.60.0 (2001.08.19-09:26+0000) Built-in shell (ash)'
>> +        exec_command_and_wait_for_pattern(self, '', version)
>> +
>> +        uname = 'Linux ppc 2.4.18 #5 Wed May 21 23:50:43 AKDT 2003 ppc unknown'
>> +        exec_command_and_wait_for_pattern(self, 'uname -a', uname)
>> +
>> +        cpu = 'PReP IBM 6015/7020 (Sandalfoot/Sandalbow)'
>> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo', cpu)
>> -- 
>> 2.21.0
>>
> 
> 
> 


