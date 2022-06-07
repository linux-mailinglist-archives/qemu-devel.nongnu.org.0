Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBCE53FCA8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 13:01:29 +0200 (CEST)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWxj-00047X-TD
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 07:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyWH8-0003ow-8W
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:17:27 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:45337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyWH4-0001JT-UF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:17:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E5ED922703;
 Tue,  7 Jun 2022 10:17:13 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 12:17:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003bcc5a754-5cd4-4884-a550-0cdbde7567fd,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5daa279e-1b1f-9efc-a6f3-6ddb44004ed3@kaod.org>
Date: Tue, 7 Jun 2022 12:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 11/21] test/avocado/machine_aspeed.py: Add an I2C RTC test
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>,
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Damien Hedde
 <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-12-clg@kaod.org>
 <CACPK8Xerxw2s20971XBVVGbSruwAgbJAi=84DGhnKnnXQJzMXg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xerxw2s20971XBVVGbSruwAgbJAi=84DGhnKnnXQJzMXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3ee6b95a-9116-4cc4-92dc-049e1be145a0
X-Ovh-Tracer-Id: 2713700252486831050
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghlvggrlhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/22 01:16, Joel Stanley wrote:
> On Mon, 6 Jun 2022 at 15:08, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Add a RTC device on bus 15 and check that the ouput of the hwclock
> 
> spelling: output
> 
>> command matches the current year.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>   tests/avocado/machine_aspeed.py | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
>> index a3b4b9e5093c..28b8a4c8124b 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -136,10 +136,18 @@ def test_arm_ast2600_evb_builroot(self):
>>
>>           self.vm.add_args('-device',
>>                            'tmp423,bus=aspeed.i2c.bus.15,address=0x4c');
>> +        self.vm.add_args('-device',
>> +                         'ds1338,bus=aspeed.i2c.bus.15,address=0x32');
> 
> Is there any value running this on the 2400 and 2500 machine types
> too?

We could do that, yes. Send patches !

> They all use the same model so perhaps not?

Currently, all models are exercised more or less in the same way by
the upstream Linux driver. Things are different for the AST1030 using
Zephir and for the AST2600 when using newer drivers from the SDK.

These images seem to be using the new AST2600 register mode:

   https://github.com/AspeedTech-BMC/openbmc/releases/

   root@ast2600-default:~# dmesg | grep i2c
   [    0.211289] i2c global registered
   [    1.442027] i2c_dev: i2c /dev entries driver
   [    1.447944] i2c_new_aspeed 1e78a280.i2c-bus: NEW-I2C: i2c-bus [4]: adapter [100 khz] mode [2]
   [    1.451158] ipmb-dev 5-0010: i2c_slave_register: client slave flag not set. You might see address collisions
   [    1.451660] i2c_new_aspeed 1e78a300.i2c-bus: NEW-I2C: i2c-bus [5]: adapter [100 khz] mode [2]
   [    1.454567] ipmb-dev 6-0012: i2c_slave_register: client slave flag not set. You might see address collisions
   [    1.454938] i2c_new_aspeed 1e78a380.i2c-bus: NEW-I2C: i2c-bus [6]: adapter [100 khz] mode [2]
   [    1.462953] i2c_new_aspeed 1e78a400.i2c-bus: NEW-I2C: i2c-bus [7]: adapter [95 khz] mode [2]
   [    1.466394] i2c_new_aspeed 1e78a480.i2c-bus: NEW-I2C: i2c-bus [8]: adapter [100 khz] mode [2]
   [    1.468394] i2c_new_aspeed 1e78a500.i2c-bus: NEW-I2C: i2c-bus [9]: adapter [100 khz] mode [2]

It could be an additional avocado test.


C.


>>           self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
>>           exec_command_and_wait_for_pattern(self,
>>                                             'i2cget -y 15 0x4c 0xff', '0x23');
>>           exec_command_and_wait_for_pattern(self,
>>                                             'i2cget -y 15 0x4c 0xfe', '0x55');
>>
>> +        exec_command_and_wait_for_pattern(self,
>> +             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-15/device/new_device',
>> +             'i2c i2c-15: new_device: Instantiated device ds1307 at 0x32');
>> +        year = time.strftime("%Y")
>> +        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
>> +
>>           self.do_test_arm_aspeed_buidroot_poweroff()
>> --
>> 2.35.3
>>


