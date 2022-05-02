Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA401516DEC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 12:10:07 +0200 (CEST)
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlT0I-0007km-42
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 06:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlSx1-0004wu-OL
 for qemu-devel@nongnu.org; Mon, 02 May 2022 06:06:43 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:60163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlSwz-0002mM-BQ
 for qemu-devel@nongnu.org; Mon, 02 May 2022 06:06:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E1BE020F8D;
 Mon,  2 May 2022 10:06:26 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 12:06:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0017e8af208-02a9-43f9-bd13-0d3187ba63c3,
 78A8FE3850778432160D8C914AE65CF7364A59B8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d2ee77d3-f241-540e-93e8-9efc50f525bb@kaod.org>
Date: Mon, 2 May 2022 12:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 2/3] aspeed/hace: Support AST2600 HACE
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20220426021120.28255-1-steven_lee@aspeedtech.com>
 <20220426021120.28255-3-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220426021120.28255-3-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 22632881-a860-42e4-b8f4-ab0533a80d5d
X-Ovh-Tracer-Id: 12475533918184311797
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 04:11, Steven Lee wrote:
> The aspeed ast2600 accumulative mode is described in datasheet
> ast2600v10.pdf section 25.6.4:
>   1. Allocating and initiating accumulative hash digest write buffer
>      with initial state.
>      * Since QEMU crypto/hash api doesn't provide the API to set initial
>        state of hash library, and the initial state is already set by
>        crypto library (gcrypt/glib/...), so skip this step.
>   2. Calculating accumulative hash digest.
>      (a) When receiving the last accumulative data, software need to add
>          padding message at the end of the accumulative data. Padding
>          message described in specific of MD5, SHA-1, SHA224, SHA256,
>          SHA512, SHA512/224, SHA512/256.
>          * Since the crypto library (gcrypt/glib) already pad the
>            padding message internally.
>          * This patch is to remove the padding message which fed byguest
>            machine driver.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/misc/aspeed_hace.c         | 132 ++++++++++++++++++++++++++++++++--
>   include/hw/misc/aspeed_hace.h |   4 ++
>   2 files changed, 131 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 59fe5bfca2..0f4059e6df 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -65,7 +65,6 @@
>   #define SG_LIST_ADDR_SIZE               4
>   #define SG_LIST_ADDR_MASK               0x7FFFFFFF
>   #define SG_LIST_ENTRY_SIZE              (SG_LIST_LEN_SIZE + SG_LIST_ADDR_SIZE)
> -#define ASPEED_HACE_MAX_SG              256        /* max number of entries */
>   
>   static const struct {
>       uint32_t mask;
> @@ -95,11 +94,104 @@ static int hash_algo_lookup(uint32_t reg)
>       return -1;
>   }
>   
> -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> +/**
> + * Check whether the request contains padding message.
> + *
> + * @param s             aspeed hace state object
> + * @param iov           iov of current request
> + * @param req_len       length of the current request
> + * @param total_msg_len length of all acc_mode requests(excluding padding msg)
> + * @param pad_offset    start offset of padding message
> + */
> +static bool has_padding(AspeedHACEState *s, struct iovec *iov,
> +                        hwaddr req_len, uint32_t *total_msg_len,
> +                        uint32_t *pad_offset)
> +{
> +    *total_msg_len = (uint32_t)(ldq_be_p(iov->iov_base + req_len - 8) / 8);
> +    /*
> +     * SG_LIST_LEN_LAST asserted in the request length doesn't mean it is the
> +     * last request. The last request should contain padding message.
> +     * We check whether message contains padding by
> +     *   1. Get total message length. If the current message contains
> +     *      padding, the last 8 bytes are total message length.
> +     *   2. Check whether the total message length is valid.
> +     *      If it is valid, the value should less than or equal to
> +     *      total_req_len.
> +     *   3. Current request len - padding_size to get padding offset.
> +     *      The padding message's first byte should be 0x80
> +     */
> +    if (*total_msg_len <= s->total_req_len) {
> +        uint32_t padding_size = s->total_req_len - *total_msg_len;
> +        uint8_t *padding = iov->iov_base;
> +        *pad_offset = req_len - padding_size;
> +        if (padding[*pad_offset] == 0x80) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static int reconstruct_iov(AspeedHACEState *s, struct iovec *iov, int id,
> +                           uint32_t *pad_offset)
> +{
> +    int i, iov_count;
> +    if (*pad_offset != 0) {
> +        s->iov_cache[s->iov_count].iov_base = iov[id].iov_base;
> +        s->iov_cache[s->iov_count].iov_len = *pad_offset;
> +        ++s->iov_count;
> +    }
> +    for (i = 0; i < s->iov_count; i++) {
> +        iov[i].iov_base = s->iov_cache[i].iov_base;
> +        iov[i].iov_len = s->iov_cache[i].iov_len;
> +    }
> +    iov_count = s->iov_count;
> +    s->iov_count = 0;
> +    s->total_req_len = 0;
> +    return iov_count;
> +}
> +
> +/**
> + * Generate iov for accumulative mode.
> + *
> + * @param s             aspeed hace state object
> + * @param iov           iov of the current request
> + * @param id            index of the current iov
> + * @param req_len       length of the current request
> + *
> + * @return count of iov
> + */
> +static int gen_acc_mode_iov(AspeedHACEState *s, struct iovec *iov, int id,
> +                            hwaddr *req_len)
> +{
> +    uint32_t pad_offset;
> +    uint32_t total_msg_len;
> +    s->total_req_len += *req_len;
> +
> +    if (has_padding(s, &iov[id], *req_len, &total_msg_len, &pad_offset)) {
> +        if (s->iov_count) {
> +            return reconstruct_iov(s, iov, id, &pad_offset);
> +        }
> +
> +        *req_len -= s->total_req_len - total_msg_len;
> +        s->total_req_len = 0;
> +        iov[id].iov_len = *req_len;
> +    } else {
> +        s->iov_cache[s->iov_count].iov_base = iov->iov_base;
> +        s->iov_cache[s->iov_count].iov_len = *req_len;
> +        ++s->iov_count;
> +    }
> +
> +    return id + 1;
> +}
> +
> +static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
> +                              bool acc_mode)
>   {
>       struct iovec iov[ASPEED_HACE_MAX_SG];
>       g_autofree uint8_t *digest_buf;
>       size_t digest_len = 0;
> +    int niov = 0;
>       int i;
>   
>       if (sg_mode) {
> @@ -124,10 +216,16 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>                                           MEMTXATTRS_UNSPECIFIED, NULL);
>               addr &= SG_LIST_ADDR_MASK;
>   
> -            iov[i].iov_len = len & SG_LIST_LEN_MASK;
> -            plen = iov[i].iov_len;
> +            plen = len & SG_LIST_LEN_MASK;
>               iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
>                                                   MEMTXATTRS_UNSPECIFIED);
> +
> +            if (acc_mode) {
> +                niov = gen_acc_mode_iov(s, iov, i, &plen);
> +
> +            } else {
> +                iov[i].iov_len = plen;
> +            }
>           }
>       } else {
>           hwaddr len = s->regs[R_HASH_SRC_LEN];
> @@ -137,6 +235,25 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>                                               &len, false,
>                                               MEMTXATTRS_UNSPECIFIED);
>           i = 1;
> +
> +        if (s->iov_count) {
> +            /*
> +             * In aspeed sdk kernel driver, sg_mode is disabled in hash_final().
> +             * Thus if we received a request with sg_mode disabled, it is
> +             * required to check whether cache is empty. If no, we should
> +             * combine cached iov and the current iov.
> +             */
> +            uint32_t total_msg_len;
> +            uint32_t pad_offset;
> +            s->total_req_len += len;
> +            if (has_padding(s, iov, len, &total_msg_len, &pad_offset)) {
> +                niov = reconstruct_iov(s, iov, 0, &pad_offset);
> +            }
> +        }
> +    }
> +
> +    if (niov) {
> +        i = niov;
>       }
>   
>       if (qcrypto_hash_bytesv(algo, iov, i, &digest_buf, &digest_len, NULL) < 0) {
> @@ -238,7 +355,8 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                           __func__, data & ahc->hash_mask);
>                   break;
>           }
> -        do_hash_operation(s, algo, data & HASH_SG_EN);
> +        do_hash_operation(s, algo, data & HASH_SG_EN,
> +                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
>   
>           if (data & HASH_IRQ_EN) {
>               qemu_irq_raise(s->irq);
> @@ -271,6 +389,8 @@ static void aspeed_hace_reset(DeviceState *dev)
>       struct AspeedHACEState *s = ASPEED_HACE(dev);
>   
>       memset(s->regs, 0, sizeof(s->regs));
> +    s->iov_count = 0;
> +    s->total_req_len = 0;
>   }
>   
>   static void aspeed_hace_realize(DeviceState *dev, Error **errp)
> @@ -306,6 +426,8 @@ static const VMStateDescription vmstate_aspeed_hace = {
>       .minimum_version_id = 1,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT32_ARRAY(regs, AspeedHACEState, ASPEED_HACE_NR_REGS),
> +        VMSTATE_UINT32(total_req_len, AspeedHACEState),
> +        VMSTATE_UINT32(iov_count, AspeedHACEState),
>           VMSTATE_END_OF_LIST(),
>       }
>   };
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 2242945eb4..40aebf1d6e 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -18,6 +18,7 @@
>   OBJECT_DECLARE_TYPE(AspeedHACEState, AspeedHACEClass, ASPEED_HACE)
>   
>   #define ASPEED_HACE_NR_REGS (0x64 >> 2)
> +#define ASPEED_HACE_MAX_SG  256 /* max number of entries */
>   
>   struct AspeedHACEState {
>       SysBusDevice parent;
> @@ -25,7 +26,10 @@ struct AspeedHACEState {
>       MemoryRegion iomem;
>       qemu_irq irq;
>   
> +    struct iovec iov_cache[ASPEED_HACE_MAX_SG];
>       uint32_t regs[ASPEED_HACE_NR_REGS];
> +    uint32_t total_req_len;
> +    uint32_t iov_count;
>   
>       MemoryRegion *dram_mr;
>       AddressSpace dram_as;


