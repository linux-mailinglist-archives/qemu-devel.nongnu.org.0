Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C033EB26
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 09:14:27 +0100 (CET)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMRJy-0005VB-9G
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 04:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMRIv-0004xh-Dc
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:13:21 -0400
Received: from 10.mo51.mail-out.ovh.net ([46.105.77.235]:57427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMRIr-0004iW-K8
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:13:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id B564D273601;
 Wed, 17 Mar 2021 09:13:12 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 09:13:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0022a0792ff-5c45-40df-8306-268c1a0b7afb,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 1/3] hw: Model ASPEED's Hash and Crypto Engine
To: Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <327d6a42-e8dc-8a12-2a85-4f306e784747@kaod.org>
Date: Wed, 17 Mar 2021 09:13:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210312105711.551423-2-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 52e7bac2-f862-4b3a-a437-a5090d1e3624
X-Ovh-Tracer-Id: 13409467892667943788
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeffedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo51.mail-out.ovh.net
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 11:57 AM, Joel Stanley wrote:
> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
> SHA2, RSA and other cryptographic algorithms.
> 
> This initial model implements a subset of the device's functionality;
> currently only direct access (non-scatter gather) hashing.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> v3:
>  - rebase on upstream to fix meson.build conflict
> v2:
>  - reorder register defines
>  - mask src/dest/len registers according to hardware
> ---
>  include/hw/misc/aspeed_hace.h |  33 ++++
>  hw/misc/aspeed_hace.c         | 312 ++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build           |   1 +
>  3 files changed, 346 insertions(+)
>  create mode 100644 include/hw/misc/aspeed_hace.h
>  create mode 100644 hw/misc/aspeed_hace.c
> 
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> new file mode 100644
> index 000000000000..e1fce670ef9e
> --- /dev/null
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -0,0 +1,33 @@
> +/*
> + * ASPEED Hash and Crypto Engine
> + *
> + * Copyright (C) 2021 IBM Corp.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef ASPEED_HACE_H
> +#define ASPEED_HACE_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_HACE "aspeed.hace"
> +#define ASPEED_HACE(obj) OBJECT_CHECK(AspeedHACEState, (obj), TYPE_ASPEED_HACE)
> +
> +#define ASPEED_HACE_NR_REGS (0x64 >> 2)
> +
> +typedef struct AspeedHACEState {
> +    /* <private> */
> +    SysBusDevice parent;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    uint32_t regs[ASPEED_HACE_NR_REGS];
> +
> +    MemoryRegion *dram_mr;
> +    AddressSpace dram_as;
> +} AspeedHACEState;
> +
> +#endif /* _ASPEED_HACE_H_ */
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> new file mode 100644
> index 000000000000..3d02fae2dd62
> --- /dev/null
> +++ b/hw/misc/aspeed_hace.c
> @@ -0,0 +1,312 @@
> +/*
> + * ASPEED Hash and Crypto Engine
> + *
> + * Copyright (C) 2021 IBM Corp.
> + *
> + * Joel Stanley <joel@jms.id.au>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "hw/misc/aspeed_hace.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "crypto/hash.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/irq.h"
> +
> +#define R_CRYPT_CMD     (0x10 / 4)
> +
> +#define R_STATUS        (0x1c / 4)
> +#define HASH_IRQ        BIT(9)
> +#define CRYPT_IRQ       BIT(12)
> +#define TAG_IRQ         BIT(15)
> +
> +#define R_HASH_SRC      (0x20 / 4)
> +#define R_HASH_DEST     (0x24 / 4)
> +#define R_HASH_SRC_LEN  (0x2c / 4)
> +
> +#define R_HASH_CMD      (0x30 / 4)
> +/* Hash algorithim selection */

algorithm

> +#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))
> +#define  HASH_ALGO_MD5                  0
> +#define  HASH_ALGO_SHA1                 BIT(5)
> +#define  HASH_ALGO_SHA224               BIT(6)
> +#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))
> +#define  HASH_ALGO_SHA512_SERIES        (BIT(5) | BIT(6))
> +/* SHA512 algorithim selection */

same

> +#define  SHA512_HASH_ALGO_MASK          (BIT(10) | BIT(11) | BIT(12))
> +#define  HASH_ALGO_SHA512_SHA512        0
> +#define  HASH_ALGO_SHA512_SHA384        BIT(10)
> +#define  HASH_ALGO_SHA512_SHA256        BIT(11)
> +#define  HASH_ALGO_SHA512_SHA224        (BIT(10) | BIT(11))
> +/* HMAC modes */
> +#define  HASH_HMAC_MASK                 (BIT(7) | BIT(8))
> +#define  HASH_DIGEST                    0
> +#define  HASH_DIGEST_HMAC               BIT(7)
> +#define  HASH_DIGEST_ACCUM              BIT(8)
> +#define  HASH_HMAC_KEY                  (BIT(7) | BIT(8))
> +/* Cascscaed operation modes */

Cascaded.

> +#define  HASH_ONLY                      0
> +#define  HASH_ONLY2                     BIT(0)
> +#define  HASH_CRYPT_THEN_HASH           BIT(1)
> +#define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
> +/* Other cmd bits */
> +#define  HASH_IRQ_EN                    BIT(9)
> +#define  HASH_SG_EN                     BIT(18)
> +
> +
> +static int do_hash_operation(AspeedHACEState *s, int algo)
> +{
> +    hwaddr src, len, dest;
> +    uint8_t *digest_buf = NULL;
> +    size_t digest_len = 0;
> +    char *src_buf;
> +    int rc;
> +
> +    src = 0x80000000 | s->regs[R_HASH_SRC];
> +    len = s->regs[R_HASH_SRC_LEN];
> +    dest = 0x80000000 | s->regs[R_HASH_DEST];

The model needs a "sdram-base" property. See aspeed-smc.

> +
> +    src_buf = address_space_map(&s->dram_as, src, &len, false,
> +                                MEMTXATTRS_UNSPECIFIED);
> +    if (!src_buf) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map dram\n", __func__);
> +        return -EACCES;
> +    }

Instead of mapping the machine memory, we could allocate a buffer 
to load the data with address_space_ldl_le routines. I think this
would be safe for endianess, or we don't care ? 

Also, HACE30 has byte swapping control bits in 3:2. How do they work ? 


> +    rc = qcrypto_hash_bytes(algo, src_buf, len, &digest_buf, &digest_len,
> +                            &error_fatal);
> +    if (rc < 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
> +        return rc;
> +    }
> +
> +    rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
> +                             digest_buf, digest_len);
> +    if (rc) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: address space write failed\n", __func__);
> +    }
> +    g_free(digest_buf);
> +
> +    address_space_unmap(&s->dram_as, src_buf, len, false, len);
> +
> +    /*
> +     * Set status bits to indicate completion. Testing shows hardware sets
> +     * these irrespective of HASH_IRQ_EN.
> +     */
> +    s->regs[R_STATUS] |= HASH_IRQ;
> +
> +    return 0;
> +}
> +
> +
> +static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    AspeedHACEState *s = ASPEED_HACE(opaque);
> +
> +    addr >>= 2;
> +
> +    if (addr >= ASPEED_HACE_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr << 2);
> +        return 0;
> +    }
> +
> +    return s->regs[addr];
> +}
> +
> +static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
> +                              unsigned int size)
> +{
> +    AspeedHACEState *s = ASPEED_HACE(opaque);
> +
> +    addr >>= 2;
> +
> +    if (addr >= ASPEED_HACE_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr << 2);
> +        return;
> +    }
> +
> +    switch (addr) {
> +    case R_STATUS:
> +        if (data & HASH_IRQ) {
> +            data &= ~HASH_IRQ;
> +
> +            if (s->regs[addr] & HASH_IRQ) {
> +                qemu_irq_lower(s->irq);
> +            }
> +        }
> +        break;
> +    case R_HASH_SRC:
> +        data &= 0x7FFFFFFF;
> +        break;
> +    case R_HASH_DEST:
> +        data &= 0x7FFFFFF8;
> +        break;

These mask values depend on the SoC revision since the SDRAM address space
has a different size. I would add an Object Class for these values.

> +    case R_HASH_SRC_LEN:
> +        data &= 0x0FFFFFFF;
> +        break;
> +    case R_HASH_CMD: {
> +        int algo = -1;
> +        if ((data & HASH_HMAC_MASK)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: HMAC engine command mode %ld not implemented",

%ld will surely raise a compile error on windows.

> +                          __func__, (data & HASH_HMAC_MASK) >> 8);
> +        }
> +        if (data & HASH_SG_EN) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: Hash scatter gather mode not implemented",
> +                          __func__);
> +        }
> +        if (data & BIT(1)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: Cascaded mode not implemented",
> +                          __func__);
> +        }
> +        switch (data & HASH_ALGO_MASK) {
> +        case HASH_ALGO_MD5:
> +            algo = QCRYPTO_HASH_ALG_MD5;
> +            break;
> +        case HASH_ALGO_SHA1:
> +            algo = QCRYPTO_HASH_ALG_SHA1;
> +            break;
> +        case HASH_ALGO_SHA224:
> +            algo = QCRYPTO_HASH_ALG_SHA224;
> +            break;
> +        case HASH_ALGO_SHA256:
> +            algo = QCRYPTO_HASH_ALG_SHA256;
> +            break;
> +        case HASH_ALGO_SHA512_SERIES:
> +            switch (data & SHA512_HASH_ALGO_MASK) {
> +            case HASH_ALGO_SHA512_SHA512:
> +                algo = QCRYPTO_HASH_ALG_SHA512;
> +                break;
> +            case HASH_ALGO_SHA512_SHA384:
> +                algo = QCRYPTO_HASH_ALG_SHA384;
> +                break;
> +            case HASH_ALGO_SHA512_SHA256:
> +                algo = QCRYPTO_HASH_ALG_SHA256;
> +                break;
> +            case HASH_ALGO_SHA512_SHA224:
> +                algo = QCRYPTO_HASH_ALG_SHA224;
> +                break;

Couldn't we use an array of 

   struct { 
	uint64_t mask; 
	int	 algo;
   };

and a lookup routine ? 

> +            default:
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: Invalid sha512 hash algorithm selection 0x%03lx\n",
> +                        __func__, data & SHA512_HASH_ALGO_MASK);

PRIx64 should be used.

> +                break;
> +            }
> +            break;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid hash algorithm selection 0x%03lx\n",

also here.

> +                      __func__, data & HASH_ALGO_MASK);
> +            break;
> +        }
> +        if (algo >= 0) {
> +            do_hash_operation(s, algo);
> +
> +            if (data & HASH_IRQ_EN) {
> +                qemu_irq_raise(s->irq);
> +            }
> +        }
> +
> +        break;
> +    }
> +    case R_CRYPT_CMD:
> +        qemu_log_mask(LOG_UNIMP, "%s: Crypt commands not implemented\n",
> +                       __func__);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    s->regs[addr] = data;
> +}
> +
> +static const MemoryRegionOps aspeed_hace_ops = {
> +    .read = aspeed_hace_read,
> +    .write = aspeed_hace_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void aspeed_hace_reset(DeviceState *dev)
> +{
> +    struct AspeedHACEState *s = ASPEED_HACE(dev);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +}
> +
> +static void aspeed_hace_realize(DeviceState *dev, Error **errp)
> +{
> +    AspeedHACEState *s = ASPEED_HACE(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    sysbus_init_irq(sbd, &s->irq);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_hace_ops, s,
> +            TYPE_ASPEED_HACE, 0x1000);
> +
> +    if (!s->dram_mr) {
> +        error_setg(errp, TYPE_ASPEED_HACE ": 'dram' link not set");
> +        return;
> +    }
> +
> +    address_space_init(&s->dram_as, s->dram_mr, "dram");
> +
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static Property aspeed_hace_properties[] = {
> +    DEFINE_PROP_LINK("dram", AspeedHACEState, dram_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +
> +static const VMStateDescription vmstate_aspeed_hace = {
> +    .name = TYPE_ASPEED_HACE,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AspeedHACEState, ASPEED_HACE_NR_REGS),
> +        VMSTATE_END_OF_LIST(),
> +    }
> +};
> +
> +static void aspeed_hace_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = aspeed_hace_realize;
> +    dc->reset = aspeed_hace_reset;
> +    device_class_set_props(dc, aspeed_hace_properties);
> +    dc->desc = "Aspeed Hash and Crypto Engine",
> +    dc->vmsd = &vmstate_aspeed_hace;
> +}
> +
> +static const TypeInfo aspeed_hace_info = {
> +    .name = TYPE_ASPEED_HACE,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AspeedHACEState),
> +    .class_init = aspeed_hace_class_init,
> +};
> +
> +static void aspeed_hace_register_types(void)
> +{
> +    type_register_static(&aspeed_hace_info);
> +}
> +
> +type_init(aspeed_hace_register_types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 00356cf12ec7..23b61d55f62e 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -104,6 +104,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
>  softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
>  softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> +  'aspeed_hace.c',
>    'aspeed_lpc.c',
>    'aspeed_scu.c',
>    'aspeed_sdmc.c',
> 


