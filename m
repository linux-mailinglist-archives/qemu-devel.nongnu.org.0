Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8676EAB04
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:55:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqIB-0005WR-BC; Fri, 21 Apr 2023 08:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ppqI3-0005TI-HA; Fri, 21 Apr 2023 08:55:04 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ppqI1-0005do-24; Fri, 21 Apr 2023 08:55:02 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 66EAD22624;
 Fri, 21 Apr 2023 12:54:57 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 14:54:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003777bd691-efe6-4a29-bdef-f6aefdb8129b,
 7111A4B1C16D83D618E44FD4B545295E183D9861) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <23d8e66e-7306-2e56-7a20-047904ec751a@kaod.org>
Date: Fri, 21 Apr 2023 14:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Cleber Rosa
 <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, <qemu-arm@nongnu.org>
References: <20230421110345.1294131-1-thuth@redhat.com>
 <20230421110345.1294131-3-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230421110345.1294131-3-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8893e50a-1488-46f1-94ed-9e8265323305
X-Ovh-Tracer-Id: 9773092667854523244
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgjefghfevffeuffffhfeltedtuefggfdtudejudehgfdtvdelffffhffgfeekhfenucffohhmrghinheplhhoghdrihhnfhhonecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpd
 fovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/21/23 13:03, Thomas Huth wrote:
> test_arm_ast2500_evb_sdk and test_arm_ast2600_evb_sdk are currently
> failing. The problem is that they are trying to look for the login
> prompt that does not have a newline at the end - but the logic in
> _console_interaction() only handles full lines. It used to work by
> accident in the past since there were sometimes kernel (warning and
> error) messages popping up that finally provided a newline character
> in the output, but since the tests have been changed to run with the
> "quiet" kernel parameter, this is not working anymore.
> 
> To make this work reliably, we must not look for the "login:" prompt,
> but have to use some text ending with a newline instead. And in the
> ast2600 test, switch to ssh instead of trying to log into the serial
> console - this works much more reliable and also has the benefit of

Yes. The test ran ~100 times without a failure. The 'dmesg -c' call is
inelegant but there is not much other solutions.

> excercising the network interface here a little bit, too.

exercising

> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

(one little typo below)

Thanks,

C.

> ---
>   tests/avocado/machine_aspeed.py | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index d2c57ccb7e..c9515bafa1 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -8,6 +8,7 @@
>   import time
>   import os
>   
> +from avocado_qemu import LinuxSSHMixIn
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import wait_for_console_pattern
>   from avocado_qemu import exec_command
> @@ -230,7 +231,7 @@ def test_arm_ast2600_evb_buildroot(self):
>           self.do_test_arm_aspeed_buildroot_poweroff()
>   
>   
> -class AST2x00MachineSDK(QemuSystemTest):
> +class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
>   
>       EXTRA_BOOTARGS = (
>           'quiet '
> @@ -257,7 +258,7 @@ def do_test_arm_aspeed_sdk_start(self, image):
>           self.require_netdev('user')
>           self.vm.set_console()
>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> -                         '-net', 'nic', '-net', 'user')
> +                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
>           self.vm.launch()
>   
>           self.wait_for_console_pattern('U-Boot 2019.04')
> @@ -285,7 +286,7 @@ def test_arm_ast2500_evb_sdk(self):
>   
>           self.do_test_arm_aspeed_sdk_start(
>               self.workdir + '/ast2500-default/image-bmc')
> -        self.wait_for_console_pattern('ast2500-default login:')
> +        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
>   
>       @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>       def test_arm_ast2600_evb_sdk(self):
> @@ -305,24 +306,28 @@ def test_arm_ast2600_evb_sdk(self):
>                            'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
>           self.vm.add_args('-device',
>                            'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
> +        self.log.info('going to starrt *******')

's/rr/r'

>           self.do_test_arm_aspeed_sdk_start(
>               self.workdir + '/ast2600-default/image-bmc')
> -        self.wait_for_console_pattern('ast2600-default login:')
> -        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
> -        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-default:~#')
> +        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
>   
> -        exec_command_and_wait_for_pattern(self,
> -             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
> +        self.ssh_connect('root', '0penBmc', False)
> +        self.ssh_command('dmesg -c > /dev/null')
> +
> +        self.ssh_command_output_contains(
> +             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device ; '
> +             'dmesg -c',
>                'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
> -        exec_command_and_wait_for_pattern(self,
> +        self.ssh_command_output_contains(
>                                'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
>           self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
>                           property='temperature', value=18000);
> -        exec_command_and_wait_for_pattern(self,
> +        self.ssh_command_output_contains(
>                                'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
>   
> -        exec_command_and_wait_for_pattern(self,
> -             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
> +        self.ssh_command_output_contains(
> +             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device ; '
> +             'dmesg -c',
>                'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
>           year = time.strftime("%Y")
> -        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
> +        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);


