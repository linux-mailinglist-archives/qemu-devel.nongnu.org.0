Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE5755BFB8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:13:56 +0200 (CEST)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67IB-0004vL-6C
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Bx-0000Wg-3C
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:59:21 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:33423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Bl-0007uF-IE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:59:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 682DE2419B;
 Tue, 28 Jun 2022 06:59:05 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 08:59:04 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00307dbdc80-702b-4771-923a-999f492add17,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dc45e17c-a3e8-bc42-e1d5-0b636c1cf55d@kaod.org>
Date: Tue, 28 Jun 2022 08:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 12/14] hw/misc: Add intel-me
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627222737.1011989-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627222737.1011989-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 293a308e-9ce5-4db8-8489-7cab81632bb4
X-Ovh-Tracer-Id: 12013633484562140125
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdegleehgfeffefhudeutdfgfeekteekjeefveehfeektdeiueevvdfhueekjeeknecuffhomhgrihhnpehmvghtrgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/28/22 00:27, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Intro ?

I would rather have 2 patches, one for the slave model and one adding
a device to the machine.

Please replace the printf with trace events.

Thanks,

C.
  

> ---
>   hw/arm/aspeed.c     |   1 +
>   hw/misc/intel_me.c  | 176 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build |   3 +-
>   3 files changed, 179 insertions(+), 1 deletion(-)
>   create mode 100644 hw/misc/intel_me.c
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 2b9c1600c6..88e9a47dc2 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1447,6 +1447,7 @@ static void oby35_cl_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
>       i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
>       i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
> +    i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
>       i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
>       i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
>       i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
> diff --git a/hw/misc/intel_me.c b/hw/misc/intel_me.c
> new file mode 100644
> index 0000000000..fdc9180c26
> --- /dev/null
> +++ b/hw/misc/intel_me.c
> @@ -0,0 +1,176 @@
> +/*
> + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "hw/i2c/i2c.h"
> +
> +#define TYPE_INTEL_ME "intel-me"
> +OBJECT_DECLARE_SIMPLE_TYPE(IntelMEState, INTEL_ME);
> +
> +#define printf(...)
> +
> +struct IntelMEState {
> +    I2CSlave parent_obj;
> +
> +    I2CBus *bus;
> +    QEMUBH *bh;
> +    int rx_len;
> +    int tx_len;
> +    int tx_pos;
> +    uint8_t rx_buf[512];
> +    uint8_t tx_buf[512];
> +};
> +
> +static void intel_me_bh(void *opaque)
> +{
> +    IntelMEState *s = opaque;
> +
> +    assert(s->bus->bh == s->bh);
> +
> +    if (s->tx_pos == 0) {
> +        if (i2c_start_send_async(s->bus, s->tx_buf[s->tx_pos++]) != 0) {
> +            goto done;
> +        }
> +        return;
> +    }
> +
> +    if (s->tx_pos < s->tx_len) {
> +        if (i2c_send_async(s->bus, s->tx_buf[s->tx_pos++]) != 0) {
> +            goto done;
> +        }
> +        return;
> +    }
> +
> +done:
> +    i2c_end_transfer(s->bus);
> +    i2c_bus_release(s->bus);
> +    s->tx_len = 0;
> +    s->tx_pos = 0;
> +    memset(s->tx_buf, 0, sizeof(s->tx_buf));
> +}
> +
> +static void intel_me_realize(DeviceState *dev, Error **errp)
> +{
> +    IntelMEState *s = INTEL_ME(dev);
> +
> +    s->bus = I2C_BUS(qdev_get_parent_bus(dev));
> +    s->bh = qemu_bh_new(intel_me_bh, s);
> +    s->rx_len = 0;
> +    s->tx_len = 0;
> +    s->tx_pos = 0;
> +    memset(s->rx_buf, 0, sizeof(s->rx_buf));
> +    memset(s->tx_buf, 0, sizeof(s->tx_buf));
> +}
> +
> +static uint8_t checksum(const uint8_t *ptr, int len)
> +{
> +    int sum = 0;
> +
> +    for (int i = 0; i < len; i++) {
> +        sum += ptr[i];
> +    }
> +
> +    return 256 - sum;
> +}
> +
> +static int intel_me_i2c_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    IntelMEState *s = INTEL_ME(i2c);
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        break;
> +    case I2C_START_SEND:
> +        s->rx_len = 0;
> +        memset(s->rx_buf, 0, sizeof(s->rx_buf));
> +        break;
> +    case I2C_START_SEND_ASYNC:
> +        break;
> +    case I2C_FINISH:
> +        printf("IntelME rx: [");
> +        for (int i = 0; i < s->rx_len; i++) {
> +            if (i) {
> +                printf(", ");
> +            }
> +            printf("0x%02x", s->rx_buf[i]);
> +        }
> +        printf("]\n");
> +
> +        s->tx_len = 10;
> +        s->tx_pos = 0;
> +        s->tx_buf[0] = s->rx_buf[2];
> +        s->tx_buf[1] = ((s->rx_buf[0] >> 2) + 1) << 2;
> +        s->tx_buf[2] = 256 - s->tx_buf[0] - s->tx_buf[1];
> +        s->tx_buf[3] = i2c->address; // rsSA response Slave Address
> +        s->tx_buf[4] = (s->rx_buf[3] >> 2) << 2; // sequence number
> +        s->tx_buf[5] = s->rx_buf[4]; // Same command code
> +        s->tx_buf[6] = 0x00; // OK
> +        s->tx_buf[7] = 0x55; // NO_ERROR
> +        s->tx_buf[8] = 0x00;
> +        s->tx_buf[9] = checksum(s->tx_buf, s->tx_len - 1);
> +        s->tx_buf[0] >>= 1;
> +        i2c_bus_master(s->bus, s->bh);
> +        break;
> +    case I2C_NACK:
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
> +static uint8_t intel_me_i2c_recv(I2CSlave *i2c)
> +{
> +    return 0xff;
> +}
> +
> +static int intel_me_i2c_send(I2CSlave *i2c, uint8_t data)
> +{
> +    IntelMEState *s = INTEL_ME(i2c);
> +
> +    assert(s->rx_len < sizeof(s->rx_buf));
> +    s->rx_buf[s->rx_len++] = data;
> +
> +    return 0;
> +}
> +
> +static void intel_me_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    I2CSlaveClass *i2c = I2C_SLAVE_CLASS(oc);
> +
> +    dc->realize = intel_me_realize;
> +    i2c->event = intel_me_i2c_event;
> +    i2c->recv = intel_me_i2c_recv;
> +    i2c->send = intel_me_i2c_send;
> +}
> +
> +static const TypeInfo types[] = {
> +    {
> +        .name = TYPE_INTEL_ME,
> +        .parent = TYPE_I2C_SLAVE,
> +        .instance_size = sizeof(IntelMEState),
> +        .class_init = intel_me_class_init,
> +    },
> +};
> +
> +DEFINE_TYPES(types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 1edad44b6b..a2c75894a3 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -118,7 +118,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed_sdmc.c',
>     'aspeed_xdma.c',
>     'aspeed_peci.c',
> -  'fby35_cpld.c'))
> +  'fby35_cpld.c',
> +  'intel_me.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
>   softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))


