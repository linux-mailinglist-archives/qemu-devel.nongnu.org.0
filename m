Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0A5347292
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:27:41 +0100 (CET)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxvY-0003t4-8w
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lOxuO-0002ty-SL
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:26:28 -0400
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:52526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lOxuL-0001Bj-3d
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:26:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 8875E256027;
 Wed, 24 Mar 2021 08:26:22 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 24 Mar
 2021 08:26:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a5c23d08-01a7-4aae-8830-a64657fbe1a4,
 90EFDD1C85C6F754CEE6F6149A82CEA72524D6DA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 1/3] hw: Model ASPEED's Hash and Crypto Engine
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210324070955.125941-1-joel@jms.id.au>
 <20210324070955.125941-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b6dbf253-87cf-0233-c090-f09d796d15a9@kaod.org>
Date: Wed, 24 Mar 2021 08:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210324070955.125941-2-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 95bb69a7-9b1f-4289-bf2a-d83291ac28de
X-Ovh-Tracer-Id: 16833892459912334118
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegjedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:09 AM, Joel Stanley wrote:
> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
> SHA2, RSA and other cryptographic algorithms.
> 
> This initial model implements a subset of the device's functionality;
> currently only direct access (non-scatter gather) hashing.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> v3:
>  - rebase on upstream to fix meson.build conflict
> v2:
>  - reorder register defines
>  - mask src/dest/len registers according to hardware
> v4:
>  - Fix typos in comments
>  - Remove sdram base address; new memory region fixes mean this is not
>    required
>  - Use PRIx64
>  - Add Object Classes for soc familiy specific features
>  - Convert big switch statement to a lookup in a struct
> ---
>  include/hw/misc/aspeed_hace.h |  43 ++++
>  hw/misc/aspeed_hace.c         | 358 ++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build           |   1 +
>  3 files changed, 402 insertions(+)
>  create mode 100644 include/hw/misc/aspeed_hace.h
>  create mode 100644 hw/misc/aspeed_hace.c
> 
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> new file mode 100644
> index 000000000000..94d5ada95fa2
> --- /dev/null
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -0,0 +1,43 @@
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
> +#define TYPE_ASPEED_AST2400_HACE TYPE_ASPEED_HACE "-ast2400"
> +#define TYPE_ASPEED_AST2500_HACE TYPE_ASPEED_HACE "-ast2500"
> +#define TYPE_ASPEED_AST2600_HACE TYPE_ASPEED_HACE "-ast2600"
> +OBJECT_DECLARE_TYPE(AspeedHACEState, AspeedHACEClass, ASPEED_HACE)
> +
> +#define ASPEED_HACE_NR_REGS (0x64 >> 2)
> +
> +struct AspeedHACEState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    uint32_t regs[ASPEED_HACE_NR_REGS];
> +
> +    MemoryRegion *dram_mr;
> +    AddressSpace dram_as;
> +};
> +
> +
> +struct AspeedHACEClass {
> +    SysBusDeviceClass parent_class;
> +
> +    uint32_t src_mask;
> +    uint32_t dest_mask;
> +    uint32_t hash_mask;
> +};
> +
> +#endif /* _ASPEED_HACE_H_ */
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> new file mode 100644
> index 000000000000..a962ccea90e8
> --- /dev/null
> +++ b/hw/misc/aspeed_hace.c
> @@ -0,0 +1,358 @@
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
> +/* Hash algorithm selection */
> +#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))
> +#define  HASH_ALGO_MD5                  0
> +#define  HASH_ALGO_SHA1                 BIT(5)
> +#define  HASH_ALGO_SHA224               BIT(6)
> +#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))
> +#define  HASH_ALGO_SHA512_SERIES        (BIT(5) | BIT(6))
> +/* SHA512 algorithm selection */
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
> +/* Cascaded operation modes */
> +#define  HASH_ONLY                      0
> +#define  HASH_ONLY2                     BIT(0)
> +#define  HASH_CRYPT_THEN_HASH           BIT(1)
> +#define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
> +/* Other cmd bits */
> +#define  HASH_IRQ_EN                    BIT(9)
> +#define  HASH_SG_EN                     BIT(18)
> +
> +static const struct {
> +    uint32_t mask;
> +    QCryptoHashAlgorithm algo;
> +} hash_algo_map[] = {
> +    { HASH_ALGO_MD5, QCRYPTO_HASH_ALG_MD5 },
> +    { HASH_ALGO_SHA1, QCRYPTO_HASH_ALG_SHA1 },
> +    { HASH_ALGO_SHA224, QCRYPTO_HASH_ALG_SHA224 },
> +    { HASH_ALGO_SHA256, QCRYPTO_HASH_ALG_SHA256 },
> +    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA512, QCRYPTO_HASH_ALG_SHA512 },
> +    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA384, QCRYPTO_HASH_ALG_SHA384 },
> +    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA256, QCRYPTO_HASH_ALG_SHA256 },
> +};
> +
> +static int hash_algo_lookup(uint32_t mask)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(hash_algo_map); i++) {
> +        if (mask == hash_algo_map[i].mask)
> +            return hash_algo_map[i].algo;
> +    }
> +
> +    return -1;
> +}
> +
> +static int do_hash_operation(AspeedHACEState *s, int algo)
> +{
> +    hwaddr src, len, dest;
> +    uint8_t *digest_buf = NULL;
> +    size_t digest_len = 0;
> +    char *src_buf;
> +    int rc;
> +
> +    src = s->regs[R_HASH_SRC];
> +    len = s->regs[R_HASH_SRC_LEN];
> +    dest = s->regs[R_HASH_DEST];
> +
> +    src_buf = address_space_map(&s->dram_as, src, &len, false,
> +                                MEMTXATTRS_UNSPECIFIED);
> +    if (!src_buf) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map dram\n", __func__);
> +        return -EACCES;
> +    }
> +
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
> +    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
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
> +        data &= ahc->src_mask;
> +        break;
> +    case R_HASH_DEST:
> +        data &= ahc->dest_mask;
> +        break;
> +    case R_HASH_SRC_LEN:
> +        data &= 0x0FFFFFFF;
> +        break;
> +    case R_HASH_CMD: {
> +        int algo = -1;
> +        if ((data & HASH_HMAC_MASK)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: HMAC engine command mode %"PRIx64" not implemented",
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
> +        algo = hash_algo_lookup(data & ahc->hash_mask);
> +        if (algo < 0) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> +                        __func__, data & ahc->hash_mask);
> +                break;
> +        }
> +        do_hash_operation(s, algo);
> +
> +        if (data & HASH_IRQ_EN) {
> +            qemu_irq_raise(s->irq);
> +        }
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
> +    dc->vmsd = &vmstate_aspeed_hace;
> +}
> +
> +static const TypeInfo aspeed_hace_info = {
> +    .name = TYPE_ASPEED_HACE,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AspeedHACEState),
> +    .class_init = aspeed_hace_class_init,
> +    .class_size = sizeof(AspeedHACEClass)
> +};
> +
> +static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
> +
> +    dc->desc = "AST2400 Hash and Crypto Engine";
> +
> +    ahc->src_mask = 0x0FFFFFFF;
> +    ahc->dest_mask = 0x0FFFFFF8;
> +    ahc->hash_mask = HASH_ALGO_MASK;
> +}
> +
> +static const TypeInfo aspeed_ast2400_hace_info = {
> +    .name = TYPE_ASPEED_AST2400_HACE,
> +    .parent = TYPE_ASPEED_HACE,
> +    .class_init = aspeed_ast2400_hace_class_init,
> +};
> +
> +static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
> +
> +    dc->desc = "AST2500 Hash and Crypto Engine";
> +
> +    ahc->src_mask = 0x3fffffff;
> +    ahc->dest_mask = 0x3ffffff8;
> +    ahc->hash_mask = HASH_ALGO_MASK;
> +}
> +
> +static const TypeInfo aspeed_ast2500_hace_info = {
> +    .name = TYPE_ASPEED_AST2500_HACE,
> +    .parent = TYPE_ASPEED_HACE,
> +    .class_init = aspeed_ast2500_hace_class_init,
> +};
> +
> +static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
> +
> +    dc->desc = "AST2600 Hash and Crypto Engine";
> +
> +    ahc->src_mask = 0x7FFFFFFF;
> +    ahc->dest_mask = 0x7FFFFFF8;
> +    ahc->hash_mask = HASH_ALGO_MASK | SHA512_HASH_ALGO_MASK;
> +}
> +
> +static const TypeInfo aspeed_ast2600_hace_info = {
> +    .name = TYPE_ASPEED_AST2600_HACE,
> +    .parent = TYPE_ASPEED_HACE,
> +    .class_init = aspeed_ast2600_hace_class_init,
> +};
> +
> +static void aspeed_hace_register_types(void)
> +{
> +    type_register_static(&aspeed_ast2400_hace_info);
> +    type_register_static(&aspeed_ast2500_hace_info);
> +    type_register_static(&aspeed_ast2600_hace_info);
> +    type_register_static(&aspeed_hace_info);
> +}
> +
> +type_init(aspeed_hace_register_types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 21034dc60a81..1e7b8b064bd1 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -109,6 +109,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
>  softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
>  softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> +  'aspeed_hace.c',
>    'aspeed_lpc.c',
>    'aspeed_scu.c',
>    'aspeed_sdmc.c',
> 


