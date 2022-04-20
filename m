Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC750888E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:55:03 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9rK-00032p-DV
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nh9q3-0001hS-HE
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:53:43 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:48499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nh9q1-0006VX-3n
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:53:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BE28223479;
 Wed, 20 Apr 2022 12:53:36 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 20 Apr
 2022 14:53:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001cf4d42f8-2af4-411b-b927-ddf9e735afec,
 E9EFF9E87E691582078BB7702B91F5DA2A909A4F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <eaef19a7-53f3-fbc8-c5a3-f7693b7d67eb@kaod.org>
Date: Wed, 20 Apr 2022 14:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/3] aspeed/hace: Support AST2600 HACE
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20220331074844.30065-1-steven_lee@aspeedtech.com>
 <20220331074844.30065-3-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331074844.30065-3-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e2b486f3-4ae5-4cf4-883d-c0ddc3fe8376
X-Ovh-Tracer-Id: 166633186861353973
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 3/31/22 09:48, Steven Lee wrote:
> The aspeed ast2600 accumulative mode is described in datasheet
> ast2600v10.pdf section 25.6.4:
>   1. Allocating and initiating accumulative hash digest write buffer
>      with initial state.
>      * Since QEMU crypto/hash api doesn't provide the API to set initial
>        state of hash library, and the initial state is already setted by

s/setted/set/

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
> ---
>   hw/misc/aspeed_hace.c | 140 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 136 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 59fe5bfca2..5a7a144602 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -95,12 +95,115 @@ static int hash_algo_lookup(uint32_t reg)
>       return -1;
>   }
>   
> -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> +/**
> + * Check whether the request contains padding message.
> + *
> + * @param iov           iov of current request
> + * @param id            index of iov of current request
> + * @param total_req_len length of all acc_mode requests(including padding msg)
> + * @param req_len       length of the current request
> + * @param total_msg_len length of all acc_mode requests(excluding padding msg)
> + * @param pad_offset    start offset of padding message
> + */
> +static bool has_padding(struct iovec *iov, uint32_t total_req_len,
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
> +     *      If it is valid, the value should less than or eaual to

s/eaual/equal/

> +     *      total_req_len.
> +     *   3. Current request len - padding_size to get padding offset.
> +     *      The padding message's first byte should be 0x80
> +     */
> +    if (*total_msg_len <= total_req_len) {
> +        uint32_t padding_size = total_req_len - *total_msg_len;
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
> +static int reconstruct_iov(struct iovec *cache, struct iovec *iov, int id,
> +                           uint32_t *total_req_len,
> +                           uint32_t *pad_offset,
> +                           int *count)
> +{
> +    int i, iov_count;
> +    if (pad_offset != 0) {
> +        (cache + *count)->iov_base = (iov + id)->iov_base;

I would prefer the array notation iov[i], like elsewhere in this file..

> +        (cache + *count)->iov_len = *pad_offset;
> +        ++*count;
> +    }
> +    for (i = 0; i < *count; i++) {
> +        (iov + i)->iov_base = (cache + i)->iov_base;
> +        (iov + i)->iov_len = (cache + i)->iov_len;

ditto.

> +    }
> +    iov_count = *count;
> +    *count = 0;
> +    *total_req_len = 0;
> +    return iov_count;
> +}
> +
> +/**
> + * Generate iov for accumulative mode.
> + *
> + * @param cache         cached iov
> + * @param iov           iov of current request
> + * @param id            index of iov of current request
> + * @param total_req_len total length of the request(including padding)
> + * @param req_len       length of the current request
> + * @param count         count of cached iov
> + */
> +static int gen_acc_mode_iov(struct iovec *cache, struct iovec *iov, int id,
> +                            uint32_t *total_req_len, hwaddr *req_len,
> +                            int *count)
> +{
> +    uint32_t pad_offset;
> +    uint32_t total_msg_len;
> +    *total_req_len += *req_len;
> +
> +    if (has_padding(&iov[id], *total_req_len, *req_len, &total_msg_len,
> +                    &pad_offset)) {
> +        if (*count) {
> +            return reconstruct_iov(cache, iov, id, total_req_len,
> +                    &pad_offset, count);
> +        }
> +
> +        *req_len -= *total_req_len - total_msg_len;
> +        *total_req_len = 0;
> +        (iov + id)->iov_len = *req_len;
> +        return id + 1;
> +    } else {
> +        (cache + *count)->iov_base = iov->iov_base;
> +        (cache + *count)->iov_len = *req_len;
> +        ++*count;
> +    }
> +
> +    return 0;
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
> +    static struct iovec iov_cache[ASPEED_HACE_MAX_SG];
> +    static int count;
> +    static uint32_t total_len;

Why static ? Shouldn't these be AspeedHACEState attributes instead ?


>       if (sg_mode) {
>           uint32_t len = 0;
> @@ -124,10 +227,17 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
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
> +                niov = gen_acc_mode_iov(
> +                        iov_cache, iov, i, &total_len, &plen, &count);
> +
> +            } else {
> +                iov[i].iov_len = plen;
> +            }
>           }
>       } else {
>           hwaddr len = s->regs[R_HASH_SRC_LEN];
> @@ -137,6 +247,27 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>                                               &len, false,
>                                               MEMTXATTRS_UNSPECIFIED);
>           i = 1;
> +
> +        if (count) {
> +            /*
> +             * In aspeed sdk kernel driver, sg_mode is disabled in hash_final().
> +             * Thus if we received a request with sg_mode disabled, it is
> +             * required to check whether cache is empty. If no, we should
> +             * combine cached iov and the current iov.
> +             */
> +            uint32_t total_msg_len;
> +            uint32_t pad_offset;
> +            total_len += len;
> +            if (has_padding(iov, total_len, len, &total_msg_len,
> +                            &pad_offset)) {
> +                niov = reconstruct_iov(iov_cache, iov, 0, &total_len,
> +                        &pad_offset, &count);
> +            }
> +        }
> +    }
> +
> +    if (niov) {
> +        i = niov;
>       }
>   
>       if (qcrypto_hash_bytesv(algo, iov, i, &digest_buf, &digest_len, NULL) < 0) {
> @@ -238,7 +369,8 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                           __func__, data & ahc->hash_mask);
>                   break;
>           }
> -        do_hash_operation(s, algo, data & HASH_SG_EN);
> +        do_hash_operation(s, algo, data & HASH_SG_EN,
> +                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
>   
>           if (data & HASH_IRQ_EN) {
>               qemu_irq_raise(s->irq);


