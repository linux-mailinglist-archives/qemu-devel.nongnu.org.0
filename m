Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3456139F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 09:52:10 +0200 (CEST)
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6oy9-0006J9-PD
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 03:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6owl-0005YL-4v
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 03:50:43 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:49617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6owi-0002sH-PO
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 03:50:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DC71F205FA;
 Thu, 30 Jun 2022 07:50:35 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 09:50:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0058170a9a4-da44-4340-b2a8-5a8177b834d5,
 40551C6C823FDDA91B74F5D58A080B55BE22893A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8b0529db-d968-3aff-576a-d8dbf85b9319@kaod.org>
Date: Thu, 30 Jun 2022 09:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 00/14] hw/i2c/aspeed: I2C slave mode DMA RX w/ new regs
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220630045133.32251-1-me@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 436e88a7-6184-414f-b02a-5d267e6bc3a7
X-Ovh-Tracer-Id: 6181753439770545074
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/22 06:51, Peter Delevoryas wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> v3:
> - hw/i2c/pmbus_device:
>    - Removed commit that resets the out buf.
>    - Removed IC_DEVICE_ID
>    - Added commit to allow devices to move to an idle state that
>      avoids enqueuing excess data into the out buf.
> - hw/sensor/isl_pmbus_vr:
>    - Added IC_DEVICE_ID commit just for voltage regulators.
>    - Added ISL69259 with an IC_DEVICE_ID.
> - hw/misc/aspeed_peci:
>    - Moved registers from .h to .c
>    - Replaced guest_error on interrupt disable case with trace
>      for all interrupts (not just when they're disabled).
>    - Removed leftover qemu_irq_raise

I have taken patches 1-7,11 for the next Aspeed PR.

Thanks,

C.


> Thanks,
> Peter
> 
> Klaus Jensen (3):
>    hw/i2c: support multiple masters
>    hw/i2c: add asynchronous send
>    hw/i2c/aspeed: add slave device in old register mode
> 
> Peter Delevoryas (11):
>    hw/i2c/aspeed: Fix R_I2CD_FUN_CTRL reference
>    hw/i2c/aspeed: Fix DMA len write-enable bit handling
>    hw/i2c/aspeed: Fix MASTER_EN missing error message
>    hw/i2c/aspeed: Add new-registers DMA slave mode RX support
>    hw/i2c/pmbus: Add idle state to return 0xff's
>    hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
>    hw/sensor: Add Renesas ISL69259 device model
>    hw/misc/aspeed: Add PECI controller
>    hw/misc/aspeed: Add fby35-sb-cpld
>    hw/misc/aspeed: Add intel-me
>    hw/arm/aspeed: Add oby35-cl machine
> 
>   MAINTAINERS                      |   2 +
>   hw/arm/aspeed.c                  |  48 +++++++
>   hw/arm/aspeed_ast10x0.c          |  12 ++
>   hw/arm/aspeed_ast2600.c          |  12 ++
>   hw/arm/aspeed_soc.c              |  13 ++
>   hw/arm/pxa2xx.c                  |   2 +
>   hw/display/sii9022.c             |   2 +
>   hw/display/ssd0303.c             |   2 +
>   hw/i2c/aspeed_i2c.c              | 234 +++++++++++++++++++++++++++----
>   hw/i2c/core.c                    |  70 ++++++++-
>   hw/i2c/pmbus_device.c            |   9 ++
>   hw/i2c/smbus_slave.c             |   4 +
>   hw/i2c/trace-events              |   2 +
>   hw/misc/aspeed_peci.c            | 152 ++++++++++++++++++++
>   hw/misc/fby35_sb_cpld.c          | 128 +++++++++++++++++
>   hw/misc/intel_me.c               | 162 +++++++++++++++++++++
>   hw/misc/meson.build              |   5 +-
>   hw/misc/trace-events             |  13 ++
>   hw/nvram/eeprom_at24c.c          |   2 +
>   hw/sensor/isl_pmbus_vr.c         |  40 ++++++
>   hw/sensor/lsm303dlhc_mag.c       |   2 +
>   include/hw/arm/aspeed_soc.h      |   3 +
>   include/hw/i2c/aspeed_i2c.h      |  11 ++
>   include/hw/i2c/i2c.h             |  30 ++++
>   include/hw/i2c/pmbus_device.h    |   7 +
>   include/hw/misc/aspeed_peci.h    |  29 ++++
>   include/hw/sensor/isl_pmbus_vr.h |   5 +
>   27 files changed, 971 insertions(+), 30 deletions(-)
>   create mode 100644 hw/misc/aspeed_peci.c
>   create mode 100644 hw/misc/fby35_sb_cpld.c
>   create mode 100644 hw/misc/intel_me.c
>   create mode 100644 include/hw/misc/aspeed_peci.h
> 


