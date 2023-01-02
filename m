Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C805965B2DF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 14:48:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCL9l-0005mB-HZ; Mon, 02 Jan 2023 08:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL9g-0005gq-Mu
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:47:11 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL9d-0007z0-Pn
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:47:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 02C452C62D;
 Mon,  2 Jan 2023 13:47:02 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:47:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001e8a2f58b-4591-4b94-a071-a224c5bdba27,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <94aa47ee-60d1-7229-1e74-6651080b9887@kaod.org>
Date: Mon, 2 Jan 2023 14:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 11/11] tests/avocado: Test Aspeed Zephyr SDK v00.01.08
 on AST1030 board
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-12-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-12-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 23b3dd68-823d-4ed0-9714-38b851096336
X-Ovh-Tracer-Id: 16165107913873984388
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdptghhihhnqdhtih
 hnghgpkhhuohesrghsphgvvgguthgvtghhrdgtohhmpdhpvghtvghrsehpjhgurdguvghvpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpphguvghlsehfsgdrtghomhdpphguvghlsehmvghtrgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/30/22 12:35, Philippe Mathieu-Daudé wrote:
> Add a very quick test that runs some commands in a Zephyr shell:
> 
>    $ tests/venv/bin/avocado --show=app,console run -t os:zephyr tests/avocado
>    (2/2) tests/avocado/machine_aspeed.py:AST1030Machine.test_ast1030_zephyros_1_07:
>    console: *** Booting Zephyr OS build v00.01.07  ***
>    console: ast1030_evb demo
>    console: SOC: AST1030-A1
>    console: uart:~$ kernel stacks
>    console: 0x36910 wdt_background (real size 1024):	unused 988	usage 36 / 1024 (3 %)
>    console: 0x36ad8 shell_uart (real size 4096):	unused 3084	usage 1012 / 4096 (24 %)
>    console: 0x2edb8 ADC0       (real size 400):	unused 260	usage 140 / 400 (35 %)
>    console: 0x2f0f0 ADC1       (real size 400):	unused 260	usage 140 / 400 (35 %)
>    console: 0x3b098 sysworkq   (real size 1024):	unused 860	usage 164 / 1024 (16 %)
>    console: 0x36cc0 usbdworkq  (real size 1024):	unused 860	usage 164 / 1024 (16 %)
>    console: 0x36bd8 usbworkq   (real size 1024):	unused 860	usage 164 / 1024 (16 %)
>    console: 0x36a10 logging    (real size 768):	unused 548	usage 220 / 768 (28 %)
>    console: 0x36ef8 idle 00    (real size 320):	unused 268	usage 52 / 320 (16 %)
>    console: 0x47800 IRQ 00     (real size 2048):	unused 1504	usage 544 / 2048 (26 %)
>    console: uart:~$ otp info scu
>    console: SCU     BIT   reg_protect     Description
>    console: ____________________________________________________________________
>    console: 0x500   0x0   0x0             Disable ARM CM4 CPU boot (TXD5)
>    console: 0x500   0x1   0x0            /Reserved
>    console: 0x500   0x2   0x0            \ "
>    console: 0x500   0x3   0x0             Address offset of single chip ABR mode
>    console: 0x500   0x4   0x0            /Reserved
>    console: 0x500   0x5   0x0            | "
>    console: 0x500   0x6   0x0            | "
>    console: 0x500   0x7   0x0            | "
>    console: 0x500   0x8   0x0            | "
>    console: 0x500   0x9   0x0            | "
>    console: 0x500   0xA   0x0            | "
>    console: 0x500   0xB   0x0            | "
>    console: 0x500   0xC   0x0            | "
>    console: 0x500   0xD   0x0            | "
>    console: 0x500   0xE   0x0            | "
>    console: 0x500   0xF   0x0            | "
>    console: 0x500   0x10  0x0            \ "
>    console: 0x500   0x11  0x0             Disabl3 ARM JTAG debug
>    console: 0x500   0x12  0x0            /Reserved
>    console: 0x500   0x13  0x0            | "
>    console: 0x500   0x14  0x0            | "
>    console: 0x500   0x15  0x0            | "
>    console: 0x500   0x16  0x0            | "
>    console: 0x500   0x17  0x0            | "
>    console: 0x500   0x18  0x0            | "
>    console: 0x500   0x19  0x0            | "
>    console: 0x500   0x1A  0x0            | "
>    console: 0x500   0x1B  0x0            | "
>    console: 0x500   0x1C  0x0            | "
>    console: 0x500   0x1D  0x0            | "
>    console: 0x500   0x1E  0x0            | "
>    console: 0x500   0x1F  0x0            \ "
>    console: 0x510   0x0   0x0            /Reserved
>    console: 0x510   0x1   0x0            | "
>    console: 0x510   0x2   0x0            | "
>    console: 0x510   0x3   0x0            \ "
>    console: 0x510   0x4   0x0             Disable debug interfaces
>    console: 0x510   0x5   0x0            /Reserved
>    console: 0x510   0x6   0x0            | "
>    console: 0x510   0x7   0x0            \ "
>    console: 0x510   0x8   0x0             Enable boot from Uart5 by Pin Strap
>    console: 0x510   0x9   0x0            /Reserved
>    console: 0x510   0xA   0x0            \ "
>    console: 0x510   0xB   0x0             Enable boot SPI ABR
>    console: 0x510   0xC   0x0             Boot SPI ABR Mode
>    console: 0x510   0xD   0x0            /Boot SPI flash size
>    console: 0x510   0xE   0x0            | "
>    console: 0x510   0xF   0x0            \ "
>    console: 0x510   0x10  0x0            /Reserved
>    console: 0x510   0x11  0x0            | "
>    console: 0x510   0x12  0x0            | "
>    console: 0x510   0x13  0x0            | "
>    console: 0x510   0x14  0x0            | "
>    console: 0x510   0x15  0x0            \ "
>    console: 0x510   0x16  0x0             Enable boot SPI auxiliary control pins
>    console: 0x510   0x19  0x0            /Reserved
>    console: 0x510   0x1A  0x0            | "
>    console: 0x510   0x1B  0x0            | "
>    console: 0x510   0x1C  0x0            | "
>    console: 0x510   0x1D  0x0            | "
>    console: 0x510   0x1E  0x0            | "
>    console: 0x510   0x1F  0x0            \ "
>    console: 0x510   0x1E  0x0             Enable dedicate GPIO strap pins
>    console: 0x510   0x1F  0x0             Enable Secure Boot by Pin Strap
>    console: uart:~$ hwinfo devid
>    console: Length: 8
>    console: ID: 0x0000018000000180
>    console: uart:~$ crypto aes256_cbc_vault
>    console: aes256_cbc vault key 1
>    console: Was waiting for:
>    console: 6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
>    console: ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
>    console: 30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
>    console: f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10
>    console: But got:
>    console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    console: uart:~$ random get
>    console: 0x862460d
>    console: uart:~$ i2c scan I2C_0
>    console: 0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>    console: 00:             -- -- -- -- -- -- -- -- -- -- -- --
>    console: 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>    console: 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>    console: 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>    console: 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>    console: 50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>    console: 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>    console: 70: -- -- -- -- -- -- -- --
>    console: 1 devices found on I2C_0
>    console: uart:~$ kernel uptime
>    console: Uptime: 9897 ms
>    console: uart:~$ kernel reboot warm
>    console: *** Booting Zephyr OS build v00.01.07  ***
>    PASS (1.08 s)
> 
> Ref: https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.07/Aspeed_Zephy_SDK_User_Guide_v00.01.07.pdf
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   tests/avocado/machine_aspeed.py | 41 ++++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index 1fc385e1c8..11f5b17eb9 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -22,10 +22,11 @@ class AST1030Machine(QemuSystemTest):
>   
>       timeout = 10
>   
> -    def test_ast1030_zephyros(self):
> +    def test_ast1030_zephyros_1_04(self):
>           """
>           :avocado: tags=arch:arm
>           :avocado: tags=machine:ast1030-evb
> +        :avocado: tags=os:zephyr
>           """
>           tar_url = ('https://github.com/AspeedTech-BMC'
>                      '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
> @@ -41,6 +42,44 @@ def test_ast1030_zephyros(self):
>           exec_command_and_wait_for_pattern(self, "help",
>                                             "Available commands")
>   
> +    def test_ast1030_zephyros_1_07(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:ast1030-evb
> +        :avocado: tags=os:zephyr
> +        """
> +        tar_url = ('https://github.com/AspeedTech-BMC'
> +                   '/zephyr/releases/download/v00.01.07/ast1030-evb-demo.zip')
> +        tar_hash = '40ac87eabdcd3b3454ce5aad11fedc72a33ecda2'
> +        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> +        archive.extract(tar_path, self.workdir)
> +        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.bin"
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_file,
> +                         '-nographic')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, "Booting Zephyr OS")
> +        for shell_cmd in [
> +                'kernel stacks',
> +                'otp info conf',
> +                'otp info scu',
> +                'hwinfo devid',
> +                'crypto aes256_cbc_vault',
> +                'random get',
> +                'jtag JTAG1 sw_xfer high TMS',
> +                'adc ADC0 resolution 12',
> +                'adc ADC0 read 42',
> +                'adc ADC1 read 69',
> +                'i2c scan I2C_0',
> +                'i3c attach I3C_0',
> +                'hash test',
> +                'kernel uptime',
> +                'kernel reboot warm',
> +                'kernel uptime',
> +                'kernel reboot cold',
> +                'kernel uptime',
> +        ]: exec_command_and_wait_for_pattern(self, shell_cmd, "uart:~$")
> +
>   class AST2x00Machine(QemuSystemTest):
>   
>       timeout = 90


