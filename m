Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59987348AD2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 08:57:05 +0100 (CET)
Received: from localhost ([::1]:54844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPKrX-0002iv-UP
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 03:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lPKqE-0001zn-Q1; Thu, 25 Mar 2021 03:55:42 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lPKqC-0005lb-JW; Thu, 25 Mar 2021 03:55:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 97D26947E83F;
 Thu, 25 Mar 2021 08:55:29 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 25 Mar
 2021 08:55:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001445e6baa-2f23-4fe5-b208-a08609762435,
 632375478080DBB88D2B1DB455BDA690282D892D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/3] aspeed: Add Scater-Gather support for HACE Hash
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
 <20210324223846.17407-3-klaus@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <329648d7-9f30-2a58-be89-d157c446e927@kaod.org>
Date: Thu, 25 Mar 2021 08:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324223846.17407-3-klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2ec53a62-ede1-4f53-a751-678acbbf21ab
X-Ovh-Tracer-Id: 4751579082012986159
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegledguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehklhgruhhssehlihhnuhigrdhvnhgvthdrihgsmhdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:38 PM, Klaus Heinrich Kiwi wrote:
> Complement the Aspeed HACE support with Scatter-Gather hash support for
> sha256 and sha512. Scatter-Gather is only supported on AST2600-series.
> 
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

this looks good. A few extra comments,

> ---
>  hw/misc/aspeed_hace.c         | 127 ++++++++++++++++++++++++++++++++--
>  include/hw/misc/aspeed_hace.h |   6 ++
>  2 files changed, 127 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 93313d2b80..8a37b1d961 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -57,6 +57,10 @@
>  /* Other cmd bits */
>  #define  HASH_IRQ_EN                    BIT(9)
>  #define  HASH_SG_EN                     BIT(18)
> +/* Scatter-gather data list */
> +#define  SG_LIST_LAST                   BIT(31)
> +#define  SG_LIST_LEN_MASK               0x7fffffff
> +#define  SG_LIST_ADDR_MASK              0x7ffffff8  /* 8-byte aligned */
>  
>  static const struct {
>      uint32_t mask;
> @@ -129,6 +133,117 @@ static int do_hash_operation(AspeedHACEState *s, int algo)
>      return 0;
>  }
>  
> +static int do_hash_sg_operation(AspeedHACEState *s, int algo)

Do we really care about the return value ? 

> +{
> +    uint32_t src, dest, reqSize;
> +    hwaddr len;
> +    const size_t reqLen = sizeof(struct aspeed_sg_list);
> +    struct iovec iov[ASPEED_HACE_MAX_SG];
> +    unsigned int i = 0;
> +    unsigned int isLast = 0;
> +    uint8_t *digestBuf = NULL;
> +    size_t digestLen = 0, size = 0;
> +    struct aspeed_sg_list *sgList;
> +    int rc;
> +
> +    reqSize = s->regs[R_HASH_SRC_LEN];
> +    dest = s->regs[R_HASH_DEST];
> +
> +    while (!isLast && i < ASPEED_HACE_MAX_SG) {
> +        src = s->regs[R_HASH_SRC] + (i * reqLen);
> +        len = reqLen;
> +        sgList = (struct aspeed_sg_list *) address_space_map(&s->dram_as,
> +                                                                     src,
> +                                                         (hwaddr *) &len,
> +                                                                   false,
> +                                                 MEMTXATTRS_UNSPECIFIED);

This should be doing LE loads.

> +        if (!sgList) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +             "%s: failed to map dram for SG Array entry '%u' for address '0x%0x'\n",
> +             __func__, i, src);
> +            rc = -EACCES;
> +            goto cleanup;
> +        }
> +        if (len != reqLen)
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +             "%s:  Warning: dram map for SG array entry '%u' requested size '%lu' != mapped size '%lu'\n",
> +             __func__, i, reqLen, len);
> +
> +        isLast = sgList->len & SG_LIST_LAST;
> +
> +        iov[i].iov_len = (hwaddr) (sgList->len & SG_LIST_LEN_MASK);
> +        iov[i].iov_base = address_space_map(&s->dram_as,
> +                            sgList->phy_addr & SG_LIST_ADDR_MASK,
> +                            &iov[i].iov_len, false,
> +                            MEMTXATTRS_UNSPECIFIED);
> +        if (!iov[i].iov_base) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +             "%s: failed to map dram for SG array entry '%u' for region '0x%x', len '%u'\n",
> +             __func__, i, sgList->phy_addr & SG_LIST_ADDR_MASK,
> +             sgList->len & SG_LIST_LEN_MASK);
> +            rc = -EACCES;
> +            goto cleanup;
> +        }
> +        if (iov[i].iov_len != (sgList->len & SG_LIST_LEN_MASK))
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +             "%s:  Warning: dram map for SG region entry %u requested size %u != mapped size %lu\n",
> +             __func__, i, (sgList->len & SG_LIST_LEN_MASK), iov[i].iov_len);
> +
> +
> +        address_space_unmap(&s->dram_as, (void *) sgList, len, false,
> +                            len);
> +        size += iov[i].iov_len;
> +        i++;
> +    }
> +
> +    if (!isLast) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                     "%s: Error: Exhausted maximum of '%u' SG array entries\n",
> +                     __func__, ASPEED_HACE_MAX_SG);
> +        rc = -ENOTSUP;
> +        goto cleanup;
> +    }
> +
> +    if (size != reqSize)
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +         "%s: Warning: requested SG total size %u != actual size %lu\n",
> +         __func__, reqSize, size);
> +
> +    rc = qcrypto_hash_bytesv(algo, iov, i, &digestBuf, &digestLen,
> +                            &error_fatal);
> +    if (rc < 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n",
> +                      __func__);
> +        goto cleanup;
> +    }
> +
> +    rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
> +                             digestBuf, digestLen);
> +    if (rc)
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: address space write failed\n", __func__);
> +    g_free(digestBuf);
> +
> +cleanup:
> +
> +    for (; i > 0; i--) {
> +        address_space_unmap(&s->dram_as, iov[i - 1].iov_base,
> +                            iov[i - 1].iov_len, false,
> +                            iov[i - 1].iov_len);
> +    }
> +
> +    /*
> +     * Set status bits to indicate completion. Testing shows hardware sets
> +     * these irrespective of HASH_IRQ_EN.
> +     */
> +    if (!rc) {
> +        s->regs[R_STATUS] |= HASH_IRQ;
> +    }
> +
> +    return rc;
> +}
> +
> +
>  
>  static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> @@ -187,11 +302,6 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                            "%s: HMAC engine command mode %"PRIx64" not implemented",
>                            __func__, (data & HASH_HMAC_MASK) >> 8);
>          }
> -        if (data & HASH_SG_EN) {
> -            qemu_log_mask(LOG_UNIMP,
> -                          "%s: Hash scatter gather mode not implemented",
> -                          __func__);
> -        }
>          if (data & BIT(1)) {
>              qemu_log_mask(LOG_UNIMP,
>                            "%s: Cascaded mode not implemented",
> @@ -204,7 +314,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                          __func__, data & ahc->hash_mask);
>                  break;
>          }
> -        do_hash_operation(s, algo);
> +        if (data & HASH_SG_EN) {
> +            s->regs[(R_HASH_SRC >> 2)] &= 0x7FFFFFF8;

I think Joel introduced a class mask for this value.

> +            do_hash_sg_operation(s, algo);
> +        } else {
> +            do_hash_operation(s, algo);
> +        }
>  
>          if (data & HASH_IRQ_EN) {
>              qemu_irq_raise(s->irq);
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 94d5ada95f..ead46afda9 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -40,4 +40,10 @@ struct AspeedHACEClass {
>      uint32_t hash_mask;
>  };
>  
> +#define ASPEED_HACE_MAX_SG      256
> +struct aspeed_sg_list {
> +        uint32_t len;
> +        uint32_t phy_addr;
> +} __attribute__ ((__packed__));
> +

May be keep the definition in the .c file 

Thanks,

C. 

>  #endif /* _ASPEED_HACE_H_ */
> 


