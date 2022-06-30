Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C45612BD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 08:51:58 +0200 (CEST)
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6o1s-000789-BP
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 02:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6nxZ-0005nV-NR
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 02:47:31 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:48117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6nxV-0001Gz-B7
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 02:47:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5368C251BC;
 Thu, 30 Jun 2022 06:47:21 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 08:47:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001e8c20502-fb81-4f14-bb55-3811e89390c2,
 1181EEF4DEA302C6E78A0CFD700452ADBB2E16A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c90699dd-b733-0800-668a-65276747789f@kaod.org>
Date: Thu, 30 Jun 2022 08:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 12/14] hw/misc/aspeed: Add fby35-sb-cpld
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-13-me@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630045133.32251-13-me@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6e741fc7-7a59-46c4-97d3-10fc7b3c1526
X-Ovh-Tracer-Id: 5114118852688055218
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvgeelhefgfeefhfduuedtgfefkeetkeejfeevheefkedtieeuvedvhfeukeejkeenucffohhmrghinhepmhgvthgrrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
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

On 6/30/22 06:51, Peter Delevoryas wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> fby35 machines have 1 BMC on a baseboard and 2-4 server boards with BIC's.
> There are also CPLD's on each of the boards, one type of CPLD on the
> baseboard and another type on each of the server boards. This commit adds an
> implementation of some of the logic performed by the server board CPLD,
> which is connected to the server board BIC.
> 
> fby35 machines have 1 baseboard with a BMC (AST2600) and 4 server boards
> with bridge interconnects (BIC's, AST1030's). Each server board has a CPLD
> on it which provides FRU information and some synchronization functionality
> with the BMC. The baseboard also has one CPLD, but it does other stuff.
> 
> This commit just adds some of the FRU functionality to allow the BIC to
> startup without any errors.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   MAINTAINERS             |   1 +
>   hw/misc/fby35_sb_cpld.c | 128 ++++++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build     |   3 +-
>   3 files changed, 131 insertions(+), 1 deletion(-)
>   create mode 100644 hw/misc/fby35_sb_cpld.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 05cf84b58c..3ffd473db1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
>   F: include/hw/net/ftgmac100.h
>   F: docs/system/arm/aspeed.rst
>   F: tests/qtest/*aspeed*
> +F: hw/misc/fby35_sb_cpld.c
>   
>   NRF51
>   M: Joel Stanley <joel@jms.id.au>
> diff --git a/hw/misc/fby35_sb_cpld.c b/hw/misc/fby35_sb_cpld.c
> new file mode 100644
> index 0000000000..f170a6c781
> --- /dev/null
> +++ b/hw/misc/fby35_sb_cpld.c
> @@ -0,0 +1,128 @@
> +/*
> + * fby35 Server Board CPLD
> + *
> + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
> + *
> + * This code is licensed under the GPL version 2 or later. See the COPYING
> + * file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/i2c/i2c.h"
> +#include "hw/registerfields.h"
> +
> +#define BOARD_ID_CLASS1 0b0000
> +#define BOARD_ID_CLASS2 0b0001
> +
> +#define TYPE_FBY35_SB_CPLD "fby35-sb-cpld"
> +OBJECT_DECLARE_SIMPLE_TYPE(Fby35SbCpldState, FBY35_SB_CPLD);
> +
> +REG8(CLASS_TYPE, 0x5);
> +    FIELD(CLASS_TYPE, RESERVED, 0, 2);
> +    FIELD(CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 2, 1);
> +    FIELD(CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 3, 1);
> +    FIELD(CLASS_TYPE, BOARD_ID, 4, 4);
> +REG8(BOARD_REVISION, 0x8);
> +    FIELD(BOARD_REVISION, VALUE, 0, 4);
> +    FIELD(BOARD_REVISION, RESERVED, 4, 4);
> +
> +struct Fby35SbCpldState {
> +    I2CSlave parent_obj;
> +
> +    uint8_t target_reg;
> +    uint32_t regs[10];
> +};
> +
> +static void fby35_sb_cpld_realize(DeviceState *dev, Error **errp)
> +{
> +    Fby35SbCpldState *s = FBY35_SB_CPLD(dev);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +    s->target_reg = 0;
> +
> +    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, BOARD_ID, 0b0000);
> +    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 1);
> +    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 1);
> +    ARRAY_FIELD_DP32(s->regs, BOARD_REVISION, VALUE, 0x1);
> +}

This is a reset handler.

C.


> +static int fby35_sb_cpld_i2c_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        break;
> +    case I2C_START_SEND:
> +        s->target_reg = 0;
> +        break;
> +    case I2C_START_SEND_ASYNC:
> +    case I2C_FINISH:
> +    case I2C_NACK:
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
> +static uint8_t fby35_sb_cpld_i2c_recv(I2CSlave *i2c)
> +{
> +    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
> +
> +    switch (s->target_reg) {
> +    case R_CLASS_TYPE:
> +    case R_BOARD_REVISION:
> +        return s->regs[s->target_reg];
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: Register read unimplemented: 0x%02x\n",
> +                      __func__, s->target_reg);
> +        return 0xff;
> +    }
> +}
> +
> +static int fby35_sb_cpld_i2c_send(I2CSlave *i2c, uint8_t data)
> +{
> +    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
> +
> +    if (s->target_reg == 0) {
> +        s->target_reg = data;
> +        return 0;
> +    }
> +
> +    switch (s->target_reg) {
> +    case R_CLASS_TYPE:
> +    case R_BOARD_REVISION:
> +        s->regs[s->target_reg] = data;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: Register write unimplemented: 0x%02x 0x%02x\n",
> +                      __func__, s->target_reg, data);
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
> +static void fby35_sb_cpld_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    I2CSlaveClass *i2c = I2C_SLAVE_CLASS(oc);
> +
> +    dc->realize = fby35_sb_cpld_realize;
> +    i2c->event = fby35_sb_cpld_i2c_event;
> +    i2c->recv = fby35_sb_cpld_i2c_recv;
> +    i2c->send = fby35_sb_cpld_i2c_send;
> +}
> +
> +static const TypeInfo types[] = {
> +    {
> +        .name = TYPE_FBY35_SB_CPLD,
> +        .parent = TYPE_I2C_SLAVE,
> +        .instance_size = sizeof(Fby35SbCpldState),
> +        .class_init = fby35_sb_cpld_class_init,
> +    },
> +};
> +
> +DEFINE_TYPES(types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 95268eddc0..948e25c440 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -117,7 +117,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed_sbc.c',
>     'aspeed_sdmc.c',
>     'aspeed_xdma.c',
> -  'aspeed_peci.c'))
> +  'aspeed_peci.c',
> +  'fby35_sb_cpld.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
>   softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))


