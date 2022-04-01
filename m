Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3394EE6B2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 05:26:19 +0200 (CEST)
Received: from localhost ([::1]:43638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na7vW-0008Bg-Ej
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 23:26:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7uL-0007E6-R0; Thu, 31 Mar 2022 23:25:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:34007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7uG-0005iE-Rt; Thu, 31 Mar 2022 23:25:05 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2313DCKh093535;
 Fri, 1 Apr 2022 11:13:12 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:24:12 +0800
Date: Fri, 1 Apr 2022 11:24:08 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:STM32F205"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 0/9] Add support for AST1030 SoC
Message-ID: <20220401032407.GA28544@aspeedtech.com>
References: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2313DCKh093535
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

The 04/01/2022 03:04, Jamin Lin wrote:
Please ignore this patch series, I lost to drop
ASPEED_SMC_FEATURE_WDT_CONTROL flag.
will resend v4 patch
Thanks-Jamin
> Changes from v3:
> - remove AspeedMiniBmcMachineState state structure and
>   AspeedMiniBmcMachineClass class
> - remove redundant new line in hw/arm/aspeed_ast10xx.c
> - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
> 
> Changes from v2:
> - replace aspeed_ast1030.c with aspeed_ast10xx.c for minibmc SOCs family support
> - Add "ast1030-evb" machine in aspeed.c and removes aspeed_minibmc.c
> 
> Changes from v1:
> The patch series supports ADC, SCU, SMC, TIMER, and WDT for AST1030 SoC.
> Add avocado test case for "ast1030-evb" machine.
> 
> Test steps:
> 1. Download image from
>    https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip
> 2. Extract the zip file to obtain zephyr.elf
> 3. Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf -nographic
> 4. Test IO by Zephyr command line, commands are refer to Aspeed Zephyr
>    SDK User Guide below
>    https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/Aspeed_Zephy_SDK_User_Guide_v00.01.04.pdf
>    - ADC(channel 0):
>        uart:~$ adc ADC0 resolution 10
>        uart:~$ adc ADC0 calibrate 1
>        uart:~$ adc ADC0 read_format 1
>        uart:~$ adc ADC0 read 0
>        [Result]
>        read: 1416mv
> 
>    - SCU
>        uart:~$ md 7e6e2040
>        uart:~$ md 7e6e2080
>        uart:~$ md 7e6e20d0
>        uart:~$ md 7e6e2200
>        uart:~$ md 7e6e2300
>        uart:~$ md 7e6e25b0
>        [Result]
>        The register value should match the value of ast1030_a1_resets
>        in aspeed_scu.c
> 
>    - Flash(fmc_cs0):
>        uart:~$ flash write fmc_cs0 0 0x12345678 0x87654321 0x34127856 0x78563412
>        uart:~$ flash read fmc_cs0 0 10
>        [Result]
>        00000000: 78 56 34 12 21 43 65 87  56 78 12 34 12 34 56 78 |xV4.!Ce. Vx.4.4Vx|
> 
>        uart:~$ flash erase fmc_cs0 0
>        uart:~$ flash read fmc_cs0 0 10
>        [Result]
>        00000000: ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff |........ ........|
> 
>    - Timer(TIMER0):
>        uart:~$ timer start TIMER0 -p 2000 -t 0
>        TIMER0: period 20000 ms, type 0
>        [Result]
>        timer expired after 2 seconds
> 
>    - Watchdog(WDT1):
>        uart:~$ mw 7e785008 4755
>        uart:~$ mw 7e78500c 1
>        [Result]
>        soc reset after 22 seconds
> 
> Based-on: 20220315075753.8591-3-steven_lee@aspeedtech.com
> ([v2,2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute)
> 
> 
> Jamin Lin (2):
>   aspeed: Add an AST1030 eval board
>   test/avocado/machine_aspeed.py: Add ast1030 test case
> 
> Steven Lee (7):
>   aspeed/adc: Add AST1030 support
>   aspeed/smc: Add AST1030 support
>   aspeed/wdt: Fix ast2500/ast2600 default reload value.
>   aspeed/wdt: Add AST1030 support
>   aspeed/timer: Add AST1030 support
>   aspeed/scu: Add AST1030 support
>   aspeed/soc : Add AST1030 support
> 
>  hw/adc/aspeed_adc.c              |  16 ++
>  hw/arm/aspeed.c                  |  97 ++++++++++
>  hw/arm/aspeed_ast10xx.c          | 299 +++++++++++++++++++++++++++++++
>  hw/arm/meson.build               |   6 +-
>  hw/misc/aspeed_scu.c             |  63 +++++++
>  hw/ssi/aspeed_smc.c              | 159 ++++++++++++++++
>  hw/timer/aspeed_timer.c          |  17 ++
>  hw/watchdog/wdt_aspeed.c         |  34 +++-
>  include/hw/adc/aspeed_adc.h      |   1 +
>  include/hw/arm/aspeed.h          |   6 +-
>  include/hw/arm/aspeed_soc.h      |   3 +
>  include/hw/misc/aspeed_scu.h     |  25 +++
>  include/hw/timer/aspeed_timer.h  |   1 +
>  include/hw/watchdog/wdt_aspeed.h |   3 +
>  tests/avocado/machine_aspeed.py  |  36 ++++
>  15 files changed, 760 insertions(+), 6 deletions(-)
>  create mode 100644 hw/arm/aspeed_ast10xx.c
>  create mode 100644 tests/avocado/machine_aspeed.py
> 
> -- 
> 2.17.1
> 

