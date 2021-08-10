Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C993E5E1D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:38:50 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSu1-0001Vd-5d
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDStF-0000dO-Ri
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:38:01 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:41401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDStD-00058k-Dt
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:38:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id D1D5513B0E3;
 Tue, 10 Aug 2021 14:37:55 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 10 Aug
 2021 16:37:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00619c9d008-4f8d-46d3-856b-9073f1f7f66e,
 8F36BE46FB8773C29BD4C9A30C998E4B5B7B2B54) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 09/10] hw/misc: Add Infineon DPS310 sensor model
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20210809131556.686260-1-clg@kaod.org>
 <20210809131556.686260-10-clg@kaod.org>
 <1efe1466-a8ee-40be-c703-6cf868721110@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6298b15a-fa2b-806f-9ba6-c801628000f1@kaod.org>
Date: Tue, 10 Aug 2021 16:37:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1efe1466-a8ee-40be-c703-6cf868721110@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 204f9705-a13e-4d99-a5e2-829bea33d5bc
X-Ovh-Tracer-Id: 10323094772207029030
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuhfelfeefjeeukeetvdevtddttdevgfelveffleektdefuddvfeekfedtledvffenucffohhmrghinhepihhnfhhinhgvohhnrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 5:59 PM, Philippe Mathieu-Daudé wrote:
> On 8/9/21 3:15 PM, Cédric Le Goater wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> This contains some hardcoded register values that were obtained from the
>> hardware after reading the temperature.
>>
>> It does enough to test the Linux kernel driver. The FIFO mode, IRQs and
>> operation modes other than the default as used by Linux are not modelled.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [ clg: Fix sequential reading ]
>> Message-Id: <20210616073358.750472-2-joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Message-Id: <20210629142336.750058-4-clg@kaod.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/misc/dps310.c    | 227 ++++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/Kconfig      |   1 +
>>  hw/misc/Kconfig     |   4 +
>>  hw/misc/meson.build |   1 +
>>  4 files changed, 233 insertions(+)
>>  create mode 100644 hw/misc/dps310.c
>>
>> diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
>> new file mode 100644
>> index 000000000000..893521ab8516
>> --- /dev/null
>> +++ b/hw/misc/dps310.c
>> @@ -0,0 +1,227 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright 2017-2021 Joel Stanley <joel@jms.id.au>, IBM Corporation
>> + *
>> + * Infineon DPS310 temperature and humidity sensor
>> + *
>> + * https://www.infineon.com/cms/en/product/sensor/pressure-sensors/pressure-sensors-for-iot/dps310/
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "hw/hw.h"
>> +#include "hw/i2c/i2c.h"
>> +#include "qapi/error.h"
>> +#include "qapi/visitor.h"
>> +#include "migration/vmstate.h"
>> +
>> +#define NUM_REGISTERS   0x33
>> +
>> +typedef struct DPS310State {
>> +    /*< private >*/
>> +    I2CSlave i2c;
>> +
>> +    /*< public >*/
>> +    uint8_t regs[NUM_REGISTERS];
>> +
>> +    uint8_t len;
>> +    uint8_t pointer;
>> +
>> +} DPS310State;
> 
>> +static void dps310_reset(DeviceState *dev)
>> +{
>> +    DPS310State *s = DPS310(dev);
>> +
>> +    static const uint8_t regs_reset_state[] = {
> 
>        static const uint8_t regs_reset_state[NUM_REGISTERS] = {

How about :

    static const uint8_t regs_reset_state[sizeof(s->regs)] = {

I wonder if that compiles always. I will try with a gitlab CI.

>> +        0xfe, 0x2f, 0xee, 0x02, 0x69, 0xa6, 0x00, 0x80, 0xc7, 0x00, 0x00, 0x00,
>> +        0x00, 0x10, 0x00, 0x00, 0x0e, 0x1e, 0xdd, 0x13, 0xca, 0x5f, 0x21, 0x52,
>> +        0xf9, 0xc6, 0x04, 0xd1, 0xdb, 0x47, 0x00, 0x5b, 0xfb, 0x3a, 0x00, 0x00,
>> +        0x20, 0x49, 0x4e, 0xa5, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +        0x60, 0x15, 0x02
>> +    };
>> +
>> +    QEMU_BUILD_BUG_ON(sizeof(regs_reset_state) != sizeof(s->regs));
> 
> and drop QEMU_BUILD_BUG_ON?

yes.

thanks,

C.

>> +
>> +    memcpy(s->regs, regs_reset_state, sizeof(s->regs));
>> +    s->pointer = 0;
>> +
>> +    /* TODO: assert these after some timeout ? */
>> +    s->regs[DPS310_MEAS_CFG] = DPS310_COEF_RDY | DPS310_SENSOR_RDY
>> +        | DPS310_TMP_RDY | DPS310_PRS_RDY;
>> +}


