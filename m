Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7133F073
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:37:59 +0100 (CET)
Received: from localhost ([::1]:41490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVR0-0004Pm-4E
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMVQ9-0003sf-R0
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:37:05 -0400
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMVQ5-0002P7-Db
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:37:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id DDCE6273878;
 Wed, 17 Mar 2021 13:36:57 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 13:36:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0052544a142-9edf-4ca3-9a64-3a8e0fe46106,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 1/3] hw: Model ASPEED's Hash and Crypto Engine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-2-joel@jms.id.au>
 <d2969a4a-abaf-b4e5-1cdb-5fdac85fa388@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6fcc0cc8-e09d-5390-dc3b-593612e404e6@kaod.org>
Date: Wed, 17 Mar 2021 13:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d2969a4a-abaf-b4e5-1cdb-5fdac85fa388@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 88352d42-338b-4fb9-90d9-5ea971cb729a
X-Ovh-Tracer-Id: 17863809400048945967
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedggeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelleeuveelvdejvdegtddugfdvkeejueehvdejuefgleeivdduhfduteffgeeinecuffhomhgrihhnpehmrghilhdqrghrtghhihhvvgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo51.mail-out.ovh.net
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

On 3/17/21 12:47 PM, Philippe Mathieu-Daudé wrote:
> On 3/12/21 11:57 AM, Joel Stanley wrote:
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
>> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
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
>> +#define ASPEED_HACE(obj) OBJECT_CHECK(AspeedHACEState, (obj), TYPE_ASPEED_HACE)
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
>> +    len = s->regs[R_HASH_SRC_LEN];
>> +    dest = 0x80000000 | s->regs[R_HASH_DEST];
>> +
>> +    src_buf = address_space_map(&s->dram_as, src, &len, false,
>> +                                MEMTXATTRS_UNSPECIFIED);
> 
> It seems the Aspeed machines aren't using correctly the AS API...
> This device shouldn't worry about where it is physically mapped.
> IOW its AS is too wide.
> 
> I'm trying to fix this in a series:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg791085.html

The buffers can be anywhere in DRAM which is mapped at 0x80000000
on the AST2600. This is correct and very similar to what we do 
in the Aspeed SMC DMA models.

I would prefer if we did loads though.

Cheers,

C.


