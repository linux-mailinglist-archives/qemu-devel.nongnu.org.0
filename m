Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68074EEDEE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:16:29 +0200 (CEST)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naH8e-0005MH-G5
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:16:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1naH5c-0003Vz-3W
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:13:20 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:37801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1naH5Z-0005Qa-Bu
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:13:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E15E1F2385BB;
 Fri,  1 Apr 2022 15:13:06 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Apr
 2022 15:13:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00178739033-7b80-4601-ab9c-525b1a30dbbd,
 E6F802B82481F543645B2B9FC2104B41A8D643B2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2c76905d-e012-8426-d261-8db5d822b503@kaod.org>
Date: Fri, 1 Apr 2022 15:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <0ddfa28a-45ae-fdfd-02a6-94ab5a34b724@kaod.org>
 <TYZPR06MB40155C89D32BB012339208C6FCE09@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <TYZPR06MB40153B1C6B2E685FC1ECDF83FCE09@TYZPR06MB4015.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <TYZPR06MB40153B1C6B2E685FC1ECDF83FCE09@TYZPR06MB4015.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dc3cf737-9f9a-4811-ba2c-c33b1e5f93d9
X-Ovh-Tracer-Id: 18041983061241400251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteefkedttddvieeiieejffeukeeihfdvheevleeigeejjeekteevgeekvedvtdetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 11:47, Jamin Lin wrote:
> Hi Cedric,
> One more question, what is the progress about SFDP patch, https://patchwork.kernel.org/project/qemu-devel/list/?series=342081&archive=both
> We need these patches for future SPI support.

Francisco had comments I didn't have time to address. Theses were mostly
related to how the table entries are defined. I can respin and see what
we can do.

Anyhow, the series is still in use in the aspeed branch :

   https://github.com/legoater/qemu/commits/aspeed-7.0

We really needed it when SFDP support was introduced in the Linux kernel.
There were plenty of issues with the 4B opcodes usage.

Thanks,

C.


> Thanks-Jamin
> 
> ************* Email Confidentiality Notice ********************
> DISCLAIMER:
> This message (and any attachments) may contain legally privileged and/or other confidential information. If you have received it in error, please notify the sender by reply e-mail and immediately delete the e-mail and any attachments without copying or disclosing the contents. Thank you.
> 
> -----Original Message-----
> From: Jamin Lin <jamin_lin@aspeedtech.com>
> Sent: Friday, April 1, 2022 5:24 PM
> To: Cédric Le Goater <clg@kaod.org>; Alistair Francis <alistair@alistair23.me>; Peter Maydell <peter.maydell@linaro.org>; Andrew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>; Cleber Rosa <crosa@redhat.com>; Philippe Mathieu-Daudé <f4bug@amsat.org>; Wainer dos Santos Moschetta <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>; open list:STM32F205 <qemu-arm@nongnu.org>; open list:All patches CC here <qemu-devel@nongnu.org>; Jamin Lin <jamin_lin@aspeedtech.com>
> Cc: Steven Lee <steven_lee@aspeedtech.com>; Troy Lee <troy_lee@aspeedtech.com>
> Subject: RE: [PATCH v5 0/9] Add support for AST1030 SoC
> 
> Hi Cedric, Joel and Andrew
> First all, thanks for all your kindly support and review. We are so glad that QEMU v7.1 will support AST1030 model.
> 
> 1. The ast1030 and ast2600 HACE controller are identical.
>    Steven submitted the patch to support HACE ACC mode. Once his patch accept. We will submit patch to support ast1030 model.
> 2. I submitted the patch to support GOIO index mode because ast1030 driver was implement by index mode. I am waiting for review and any suggestion will be appreciated.
> 3. Troy submitted the patch to support I2C new model which included ast1030 model.
> 4. As for NIC plan, once AST1030 NIC driver ready, we will upstream, too.
> BTW, do you have a plan to upstream it, https://github.com/openbmc/qemu/blob/master/hw/misc/aspeed_pwm.c
> 
> Thanks again - Jamin
> 
> ************* Email Confidentiality Notice ********************
> DISCLAIMER:
> This message (and any attachments) may contain legally privileged and/or other confidential information. If you have received it in error, please notify the sender by reply e-mail and immediately delete the e-mail and any attachments without copying or disclosing the contents. Thank you.
> 
> -----Original Message-----
> From: Cédric Le Goater <clg@kaod.org>
> Sent: Friday, April 1, 2022 4:55 PM
> To: Jamin Lin <jamin_lin@aspeedtech.com>; Alistair Francis <alistair@alistair23.me>; Peter Maydell <peter.maydell@linaro.org>; Andrew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>; Cleber Rosa <crosa@redhat.com>; Philippe Mathieu-Daudé <f4bug@amsat.org>; Wainer dos Santos Moschetta <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>; open list:STM32F205 <qemu-arm@nongnu.org>; open list:All patches CC here <qemu-devel@nongnu.org>
> Cc: Steven Lee <steven_lee@aspeedtech.com>; Troy Lee <troy_lee@aspeedtech.com>
> Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
> 
> Hello Jamin,
> 
> Thanks for these new models and machine. They are queued for QEMU 7.1.
> There are a couple of patchsets adding support for the AST1030 GPIO controller and the I2C new mode that would be good extensions but they need review first.
> 
> What are the next steps? any plans for network ? The NIC should be a
> FTGMAC100 if I am correct.
> 
> Thanks,
> 
> C.
> 
> 
>    On 4/1/22 10:38, Jamin Lin wrote:
>> Changes from v5:
>> - remove TYPE_ASPEED_MINIBMC_MACHINE and ASPEED_MINIBMC_MACHINE
>> - remove ast1030_machine_instance_init function
>>
>> Changes from v4:
>> - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
>>
>> Changes from v3:
>> - remove AspeedMiniBmcMachineState state structure and
>>     AspeedMiniBmcMachineClass class
>> - remove redundant new line in hw/arm/aspeed_ast10xx.c
>> - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
>>
>> Changes from v2:
>> - replace aspeed_ast1030.c with aspeed_ast10xx.c for minibmc SOCs
>> family support
>> - Add "ast1030-evb" machine in aspeed.c and removes aspeed_minibmc.c
>>
>> Changes from v1:
>> The patch series supports ADC, SCU, SMC, TIMER, and WDT for AST1030 SoC.
>> Add avocado test case for "ast1030-evb" machine.
>>
>> Test steps:
>> 1. Download image from
>>      
>> https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/a
>> st1030-evb-demo.zip 2. Extract the zip file to obtain zephyr.elf 3.
>> Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf
>> -nographic 4. Test IO by Zephyr command line, commands are refer to Aspeed Zephyr
>>      SDK User Guide below
>>      https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/Aspeed_Zephy_SDK_User_Guide_v00.01.04.pdf
>>      - ADC(channel 0):
>>          uart:~$ adc ADC0 resolution 10
>>          uart:~$ adc ADC0 calibrate 1
>>          uart:~$ adc ADC0 read_format 1
>>          uart:~$ adc ADC0 read 0
>>          [Result]
>>          read: 1416mv
>>
>>      - SCU
>>          uart:~$ md 7e6e2040
>>          uart:~$ md 7e6e2080
>>          uart:~$ md 7e6e20d0
>>          uart:~$ md 7e6e2200
>>          uart:~$ md 7e6e2300
>>          uart:~$ md 7e6e25b0
>>          [Result]
>>          The register value should match the value of ast1030_a1_resets
>>          in aspeed_scu.c
>>
>>      - Flash(fmc_cs0):
>>          uart:~$ flash write fmc_cs0 0 0x12345678 0x87654321 0x34127856 0x78563412
>>          uart:~$ flash read fmc_cs0 0 10
>>          [Result]
>>          00000000: 78 56 34 12 21 43 65 87  56 78 12 34 12 34 56 78
>> |xV4.!Ce. Vx.4.4Vx|
>>
>>          uart:~$ flash erase fmc_cs0 0
>>          uart:~$ flash read fmc_cs0 0 10
>>          [Result]
>>          00000000: ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
>> |........ ........|
>>
>>      - Timer(TIMER0):
>>          uart:~$ timer start TIMER0 -p 2000 -t 0
>>          TIMER0: period 20000 ms, type 0
>>          [Result]
>>          timer expired after 2 seconds
>>
>>      - Watchdog(WDT1):
>>          uart:~$ mw 7e785008 4755
>>          uart:~$ mw 7e78500c 1
>>          [Result]
>>          soc reset after 22 seconds
>>
>> Based-on: 20220315075753.8591-3-steven_lee@aspeedtech.com
>> ([v2,2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute)
>>
>> Jamin Lin (2):
>>     aspeed: Add an AST1030 eval board
>>     test/avocado/machine_aspeed.py: Add ast1030 test case
>>
>> Steven Lee (7):
>>     aspeed/adc: Add AST1030 support
>>     aspeed/smc: Add AST1030 support
>>     aspeed/wdt: Fix ast2500/ast2600 default reload value
>>     aspeed/wdt: Add AST1030 support
>>     aspeed/timer: Add AST1030 support
>>     aspeed/scu: Add AST1030 support
>>     aspeed/soc : Add AST1030 support
>>
>>    hw/adc/aspeed_adc.c              |  16 ++
>>    hw/arm/aspeed.c                  |  66 +++++++
>>    hw/arm/aspeed_ast10xx.c          | 299 +++++++++++++++++++++++++++++++
>>    hw/arm/meson.build               |   6 +-
>>    hw/misc/aspeed_scu.c             |  63 +++++++
>>    hw/ssi/aspeed_smc.c              | 157 ++++++++++++++++
>>    hw/timer/aspeed_timer.c          |  17 ++
>>    hw/watchdog/wdt_aspeed.c         |  34 +++-
>>    include/hw/adc/aspeed_adc.h      |   1 +
>>    include/hw/arm/aspeed_soc.h      |   3 +
>>    include/hw/misc/aspeed_scu.h     |  25 +++
>>    include/hw/timer/aspeed_timer.h  |   1 +
>>    include/hw/watchdog/wdt_aspeed.h |   3 +
>>    tests/avocado/machine_aspeed.py  |  36 ++++
>>    14 files changed, 724 insertions(+), 3 deletions(-)
>>    create mode 100644 hw/arm/aspeed_ast10xx.c
>>    create mode 100644 tests/avocado/machine_aspeed.py
>>
> 


