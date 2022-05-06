Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32E51D118
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 08:12:47 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmrCk-0005RB-Bj
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 02:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nmrB0-0004ST-Ug
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:10:55 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nmrAy-0006lQ-Oj
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:10:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BB03AFCF5311;
 Fri,  6 May 2022 08:10:48 +0200 (CEST)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 6 May 2022
 08:10:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003f5a09683-561d-4164-ae8d-4a52443e8adb,
 85FEA43FB7D152D5FE87D0D31D0EEF45A371AE19) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <ce50ff02-8788-50ad-7fd4-248046d58118@kaod.org>
Date: Fri, 6 May 2022 08:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 1/1] docs: add minibmc section in aspeed document
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <steven_lee@aspeedtech.com>
References: <20220506031521.13254-1-jamin_lin@aspeedtech.com>
 <20220506031521.13254-2-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220506031521.13254-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 72c91ee7-b1a9-4028-b736-889a678a33c0
X-Ovh-Tracer-Id: 13540072281401166700
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/6/22 05:15, Jamin Lin wrote:
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   docs/system/arm/aspeed.rst | 61 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 60ed94f187..6f2e4fb53d 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -120,3 +120,64 @@ FMC chip and a bigger (64M) SPI chip, use :
>   .. code-block:: bash
>   
>     -M ast2500-evb,fmc-model=mx25l25635e,spi-model=mx66u51235f
> +
> +
> +Aspeed minibmc family boards (``ast1030-evb``)
> +==================================================================
> +
> +The QEMU Aspeed machines model mini BMCs of various Aspeed evaluation
> +boards. They are based on different releases of the
> +Aspeed SoC : the AST1030 integrating an ARM Cortex M4F CPU (200MHz).
> +
> +The SoC comes with SRAM, SPI, I2C, etc.
> +
> +AST1030 SoC based machines :
> +
> +- ``ast1030-evb``          Aspeed AST1030 Evaluation board (Cortex-M4F)
> +
> +Supported devices
> +-----------------
> +
> + * SMP (for the AST1030 Cortex-M4F)
> + * Interrupt Controller (VIC)
> + * Timer Controller
> + * I2C Controller
> + * System Control Unit (SCU)
> + * SRAM mapping
> + * Static Memory Controller (SMC or FMC) - Only SPI Flash support
> + * SPI Memory Controller
> + * USB 2.0 Controller
> + * Watchdog Controller
> + * GPIO Controller (Master only)
> + * UART
> + * LPC Peripheral Controller (a subset of subdevices are supported)
> + * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
> + * ADC
> +
> +
> +Missing devices
> +---------------
> +
> + * PWM and Fan Controller
> + * Slave GPIO Controller
> + * PECI Controller
> + * Mailbox Controller
> + * Virtual UART
> + * eSPI Controller
> + * I3C Controller
> +
> +Boot options
> +------------
> +
> +The Aspeed machines can be started using the ``-kernel`` to load a
> +Zephyr OS or from a firmware. Images can be downloaded from the
> +ASPEED GitHub release repository :
> +
> +   https://github.com/AspeedTech-BMC/zephyr/releases
> +
> +To boot a kernel directly from a Zephyr build tree:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M ast1030-evb -nographic \
> +        -kernel zephyr.elf


