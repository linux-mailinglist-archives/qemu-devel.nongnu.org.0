Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE633EA99
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:33:23 +0100 (CET)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQgE-00009j-C2
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lMQY8-0007zn-Ah; Wed, 17 Mar 2021 03:25:00 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:52197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lMQY2-0000p2-24; Wed, 17 Mar 2021 03:25:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 037049112120;
 Wed, 17 Mar 2021 08:24:41 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 08:24:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002f0f96ffd-93d5-437c-ae30-1f666eaa4c4a,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 1/3] hw: Model ASPEED's Hash and Crypto Engine
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Thomas
 Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-2-joel@jms.id.au>
 <943cd3e4-1706-4c31-bb45-ffea4478ca70@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <584e21f8-0016-bc1a-1364-58046da6dd67@kaod.org>
Date: Wed, 17 Mar 2021 08:24:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <943cd3e4-1706-4c31-bb45-ffea4478ca70@www.fastmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 84b2dbd4-33e0-407e-9d05-2cd1e9c811c8
X-Ovh-Tracer-Id: 12590094235873545068
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeffedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrnhgurhgvfiesrghjrdhiugdrrghu
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 1:02 AM, Andrew Jeffery wrote:
> 
> 
> On Fri, 12 Mar 2021, at 21:27, Joel Stanley wrote:
>> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
>> SHA2, RSA and other cryptographic algorithms.
>>
>> This initial model implements a subset of the device's functionality;
>> currently only direct access (non-scatter gather) hashing.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> v3:
>>  - rebase on upstream to fix meson.build conflict
>> v2:
>>  - reorder register defines
>>  - mask src/dest/len registers according to hardware
>> ---
>>  include/hw/misc/aspeed_hace.h |  33 ++++
>>  hw/misc/aspeed_hace.c         | 312 ++++++++++++++++++++++++++++++++++
>>  hw/misc/meson.build           |   1 +
>>  3 files changed, 346 insertions(+)
>>  create mode 100644 include/hw/misc/aspeed_hace.h
>>  create mode 100644 hw/misc/aspeed_hace.c
>>
>> diff --git a/include/hw/misc/aspeed_hace.h 
>> b/include/hw/misc/aspeed_hace.h
>> new file mode 100644
>> index 000000000000..e1fce670ef9e
>> --- /dev/null
>> +++ b/include/hw/misc/aspeed_hace.h
>> @@ -0,0 +1,33 @@
>> +/*
>> + * ASPEED Hash and Crypto Engine
>> + *
>> + * Copyright (C) 2021 IBM Corp.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#ifndef ASPEED_HACE_H
>> +#define ASPEED_HACE_H
>> +
>> +#include "hw/sysbus.h"
>> +
>> +#define TYPE_ASPEED_HACE "aspeed.hace"
>> +#define ASPEED_HACE(obj) OBJECT_CHECK(AspeedHACEState, (obj), 
>> TYPE_ASPEED_HACE)
>> +
>> +#define ASPEED_HACE_NR_REGS (0x64 >> 2)
>> +
>> +typedef struct AspeedHACEState {
>> +    /* <private> */
>> +    SysBusDevice parent;
>> +
>> +    /*< public >*/
>> +    MemoryRegion iomem;
>> +    qemu_irq irq;
>> +
>> +    uint32_t regs[ASPEED_HACE_NR_REGS];
>> +
>> +    MemoryRegion *dram_mr;
>> +    AddressSpace dram_as;
>> +} AspeedHACEState;
>> +
>> +#endif /* _ASPEED_HACE_H_ */
>> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
>> new file mode 100644
>> index 000000000000..3d02fae2dd62
>> --- /dev/null
>> +++ b/hw/misc/aspeed_hace.c
>> @@ -0,0 +1,312 @@
>> +/*
>> + * ASPEED Hash and Crypto Engine
>> + *
>> + * Copyright (C) 2021 IBM Corp.
>> + *
>> + * Joel Stanley <joel@jms.id.au>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "qemu/error-report.h"
>> +#include "hw/misc/aspeed_hace.h"
>> +#include "qapi/error.h"
>> +#include "migration/vmstate.h"
>> +#include "crypto/hash.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/irq.h"
>> +
>> +#define R_CRYPT_CMD     (0x10 / 4)
>> +
>> +#define R_STATUS        (0x1c / 4)
>> +#define HASH_IRQ        BIT(9)
>> +#define CRYPT_IRQ       BIT(12)
>> +#define TAG_IRQ         BIT(15)
>> +
>> +#define R_HASH_SRC      (0x20 / 4)
>> +#define R_HASH_DEST     (0x24 / 4)
>> +#define R_HASH_SRC_LEN  (0x2c / 4)
>> +
>> +#define R_HASH_CMD      (0x30 / 4)
>> +/* Hash algorithim selection */
>> +#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))
>> +#define  HASH_ALGO_MD5                  0
>> +#define  HASH_ALGO_SHA1                 BIT(5)
>> +#define  HASH_ALGO_SHA224               BIT(6)
>> +#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))
>> +#define  HASH_ALGO_SHA512_SERIES        (BIT(5) | BIT(6))
>> +/* SHA512 algorithim selection */
>> +#define  SHA512_HASH_ALGO_MASK          (BIT(10) | BIT(11) | BIT(12))
>> +#define  HASH_ALGO_SHA512_SHA512        0
>> +#define  HASH_ALGO_SHA512_SHA384        BIT(10)
>> +#define  HASH_ALGO_SHA512_SHA256        BIT(11)
>> +#define  HASH_ALGO_SHA512_SHA224        (BIT(10) | BIT(11))
>> +/* HMAC modes */
>> +#define  HASH_HMAC_MASK                 (BIT(7) | BIT(8))
>> +#define  HASH_DIGEST                    0
>> +#define  HASH_DIGEST_HMAC               BIT(7)
>> +#define  HASH_DIGEST_ACCUM              BIT(8)
>> +#define  HASH_HMAC_KEY                  (BIT(7) | BIT(8))
>> +/* Cascscaed operation modes */
>> +#define  HASH_ONLY                      0
>> +#define  HASH_ONLY2                     BIT(0)
>> +#define  HASH_CRYPT_THEN_HASH           BIT(1)
>> +#define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
>> +/* Other cmd bits */
>> +#define  HASH_IRQ_EN                    BIT(9)
>> +#define  HASH_SG_EN                     BIT(18)
>> +
>> +
>> +static int do_hash_operation(AspeedHACEState *s, int algo)
>> +{
>> +    hwaddr src, len, dest;
>> +    uint8_t *digest_buf = NULL;
>> +    size_t digest_len = 0;
>> +    char *src_buf;
>> +    int rc;
>> +
>> +    src = 0x80000000 | s->regs[R_HASH_SRC];
> 
> Tricky. Also doesn't work on the AST2400 where SDRAM is based at 
> 0x40000000?

We need a "sdram-base" property. See the Aspeed SMC model for DMAs, 
it's very similar.

Thanks,

C. 


> 
> Other than that it looks good to me.
> 
> Andrew
> 


