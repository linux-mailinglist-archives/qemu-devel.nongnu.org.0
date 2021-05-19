Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE66388819
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 09:24:35 +0200 (CEST)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljGZG-0007Dl-6Y
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 03:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ljGYF-00063u-2o; Wed, 19 May 2021 03:23:31 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ljGYC-0008T3-Hf; Wed, 19 May 2021 03:23:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.233])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A5519A5AD0CA;
 Wed, 19 May 2021 09:23:17 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 19 May
 2021 09:23:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0044e105547-bc17-4e40-b761-af5385edeba9,
 B96114D241556C737FE3FC18D62740DAACFF600C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 3/3] sensor: Move hardware sensors from misc to a sensor
 directory
To: <minyard@acm.org>, <qemu-devel@nongnu.org>, Titus Rwantare
 <titusr@google.com>
References: <20210519000331.3690536-1-minyard@acm.org>
 <20210519000331.3690536-4-minyard@acm.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <02a63ac3-338f-2f99-25de-91fb742096fd@kaod.org>
Date: Wed, 19 May 2021 09:23:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519000331.3690536-4-minyard@acm.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8e7baeb9-d6c9-4b3e-94af-ec376a691331
X-Ovh-Tracer-Id: 13611285451051338543
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepmhhinhihrghrugesrggtmhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 2:03 AM, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> Lots of this are expected to be coming in, create a directory for them.
> 
> Also move the tmp105.h file into the include directory where it
> should be.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Corey Minyard <cminyard@mvista.com>

Acked-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>  hw/Kconfig                                 |  1 +
>  hw/arm/aspeed.c                            |  2 +-
>  hw/arm/nseries.c                           |  2 +-
>  hw/meson.build                             |  1 +
>  hw/misc/Kconfig                            | 12 ------------
>  hw/misc/meson.build                        |  3 ---
>  hw/sensor/Kconfig                          | 11 +++++++++++
>  hw/{misc => sensor}/emc141x.c              |  2 +-
>  hw/sensor/meson.build                      |  3 +++
>  hw/{misc => sensor}/tmp105.c               |  2 +-
>  hw/{misc => sensor}/tmp421.c               |  0
>  include/hw/{misc => sensor}/emc141x_regs.h |  0
>  {hw/misc => include/hw/sensor}/tmp105.h    |  2 +-
>  include/hw/{misc => sensor}/tmp105_regs.h  |  0
>  tests/qtest/emc141x-test.c                 |  2 +-
>  tests/qtest/npcm7xx_smbus-test.c           |  2 +-
>  tests/qtest/tmp105-test.c                  |  2 +-
>  17 files changed, 24 insertions(+), 23 deletions(-)
>  create mode 100644 hw/sensor/Kconfig
>  rename hw/{misc => sensor}/emc141x.c (99%)
>  create mode 100644 hw/sensor/meson.build
>  rename hw/{misc => sensor}/tmp105.c (99%)
>  rename hw/{misc => sensor}/tmp421.c (100%)
>  rename include/hw/{misc => sensor}/emc141x_regs.h (100%)
>  rename {hw/misc => include/hw/sensor}/tmp105.h (97%)
>  rename include/hw/{misc => sensor}/tmp105_regs.h (100%)
> 
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 805860f564..8cb7664d70 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -32,6 +32,7 @@ source remote/Kconfig
>  source rtc/Kconfig
>  source scsi/Kconfig
>  source sd/Kconfig
> +source sensor/Kconfig
>  source smbios/Kconfig
>  source ssi/Kconfig
>  source timer/Kconfig
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 3fe6c55744..272b17f999 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -16,7 +16,7 @@
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/misc/pca9552.h"
> -#include "hw/misc/tmp105.h"
> +#include "hw/sensor/tmp105.h"
>  #include "hw/misc/led.h"
>  #include "hw/qdev-properties.h"
>  #include "sysemu/block-backend.h"
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 0aefa5d0f3..a10d8f53b5 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -36,7 +36,7 @@
>  #include "hw/display/blizzard.h"
>  #include "hw/input/tsc2xxx.h"
>  #include "hw/misc/cbus.h"
> -#include "hw/misc/tmp105.h"
> +#include "hw/sensor/tmp105.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/block/flash.h"
>  #include "hw/hw.h"
> diff --git a/hw/meson.build b/hw/meson.build
> index ba0601e36e..b3366c888e 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -31,6 +31,7 @@ subdir('rdma')
>  subdir('rtc')
>  subdir('scsi')
>  subdir('sd')
> +subdir('sensor')
>  subdir('smbios')
>  subdir('ssi')
>  subdir('timer')
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 996d45aff5..507058d8bf 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -11,18 +11,6 @@ config ARMSSE_MHU
>  config ARMSSE_CPU_PWRCTRL
>      bool
>  
> -config TMP105
> -    bool
> -    depends on I2C
> -
> -config TMP421
> -    bool
> -    depends on I2C
> -
> -config EMC141X
> -    bool
> -    depends on I2C
> -
>  config ISA_DEBUG
>      bool
>      depends on ISA_BUS
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index b0a8ee8994..046c7e0c72 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -6,9 +6,6 @@ softmmu_ss.add(when: 'CONFIG_ISA_TESTDEV', if_true: files('pc-testdev.c'))
>  softmmu_ss.add(when: 'CONFIG_PCA9552', if_true: files('pca9552.c'))
>  softmmu_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: files('pci-testdev.c'))
>  softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
> -softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
> -softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
> -softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
>  softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
>  softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
>  softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> new file mode 100644
> index 0000000000..097cb8f11e
> --- /dev/null
> +++ b/hw/sensor/Kconfig
> @@ -0,0 +1,11 @@
> +config TMP105
> +    bool
> +    depends on I2C
> +
> +config TMP421
> +    bool
> +    depends on I2C
> +
> +config EMC141X
> +    bool
> +    depends on I2C
> diff --git a/hw/misc/emc141x.c b/hw/sensor/emc141x.c
> similarity index 99%
> rename from hw/misc/emc141x.c
> rename to hw/sensor/emc141x.c
> index f7c53d48a4..7ce8f4e979 100644
> --- a/hw/misc/emc141x.c
> +++ b/hw/sensor/emc141x.c
> @@ -25,7 +25,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/module.h"
>  #include "qom/object.h"
> -#include "hw/misc/emc141x_regs.h"
> +#include "hw/sensor/emc141x_regs.h"
>  
>  #define SENSORS_COUNT_MAX    4
>  
> diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
> new file mode 100644
> index 0000000000..9e0f3ab1fd
> --- /dev/null
> +++ b/hw/sensor/meson.build
> @@ -0,0 +1,3 @@
> +softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
> +softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
> +softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
> diff --git a/hw/misc/tmp105.c b/hw/sensor/tmp105.c
> similarity index 99%
> rename from hw/misc/tmp105.c
> rename to hw/sensor/tmp105.c
> index d299d9b21b..2056449489 100644
> --- a/hw/misc/tmp105.c
> +++ b/hw/sensor/tmp105.c
> @@ -22,7 +22,7 @@
>  #include "hw/i2c/i2c.h"
>  #include "hw/irq.h"
>  #include "migration/vmstate.h"
> -#include "tmp105.h"
> +#include "hw/sensor/tmp105.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "qemu/module.h"
> diff --git a/hw/misc/tmp421.c b/hw/sensor/tmp421.c
> similarity index 100%
> rename from hw/misc/tmp421.c
> rename to hw/sensor/tmp421.c
> diff --git a/include/hw/misc/emc141x_regs.h b/include/hw/sensor/emc141x_regs.h
> similarity index 100%
> rename from include/hw/misc/emc141x_regs.h
> rename to include/hw/sensor/emc141x_regs.h
> diff --git a/hw/misc/tmp105.h b/include/hw/sensor/tmp105.h
> similarity index 97%
> rename from hw/misc/tmp105.h
> rename to include/hw/sensor/tmp105.h
> index 7c97071ad7..244e2989fe 100644
> --- a/hw/misc/tmp105.h
> +++ b/include/hw/sensor/tmp105.h
> @@ -15,7 +15,7 @@
>  #define QEMU_TMP105_H
>  
>  #include "hw/i2c/i2c.h"
> -#include "hw/misc/tmp105_regs.h"
> +#include "hw/sensor/tmp105_regs.h"
>  #include "qom/object.h"
>  
>  #define TYPE_TMP105 "tmp105"
> diff --git a/include/hw/misc/tmp105_regs.h b/include/hw/sensor/tmp105_regs.h
> similarity index 100%
> rename from include/hw/misc/tmp105_regs.h
> rename to include/hw/sensor/tmp105_regs.h
> diff --git a/tests/qtest/emc141x-test.c b/tests/qtest/emc141x-test.c
> index 714058806a..8c86694091 100644
> --- a/tests/qtest/emc141x-test.c
> +++ b/tests/qtest/emc141x-test.c
> @@ -11,7 +11,7 @@
>  #include "libqos/qgraph.h"
>  #include "libqos/i2c.h"
>  #include "qapi/qmp/qdict.h"
> -#include "hw/misc/emc141x_regs.h"
> +#include "hw/sensor/emc141x_regs.h"
>  
>  #define EMC1414_TEST_ID   "emc1414-test"
>  
> diff --git a/tests/qtest/npcm7xx_smbus-test.c b/tests/qtest/npcm7xx_smbus-test.c
> index 4f9f493872..6b3038ac59 100644
> --- a/tests/qtest/npcm7xx_smbus-test.c
> +++ b/tests/qtest/npcm7xx_smbus-test.c
> @@ -18,7 +18,7 @@
>  #include "qemu/bitops.h"
>  #include "libqos/i2c.h"
>  #include "libqos/libqtest.h"
> -#include "hw/misc/tmp105_regs.h"
> +#include "hw/sensor/tmp105_regs.h"
>  
>  #define NR_SMBUS_DEVICES    16
>  #define SMBUS_ADDR(x)       (0xf0080000 + 0x1000 * (x))
> diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
> index f930a96b83..3678646df5 100644
> --- a/tests/qtest/tmp105-test.c
> +++ b/tests/qtest/tmp105-test.c
> @@ -13,7 +13,7 @@
>  #include "libqos/qgraph.h"
>  #include "libqos/i2c.h"
>  #include "qapi/qmp/qdict.h"
> -#include "hw/misc/tmp105_regs.h"
> +#include "hw/sensor/tmp105_regs.h"
>  
>  #define TMP105_TEST_ID   "tmp105-test"
>  #define TMP105_TEST_ADDR 0x49
> 


