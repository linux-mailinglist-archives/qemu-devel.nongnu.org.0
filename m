Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3B04EA866
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:17:07 +0200 (CEST)
Received: from localhost ([::1]:39498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ66E-0000BY-7X
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:17:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nZ61U-0005Ve-3t; Tue, 29 Mar 2022 03:12:12 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:10661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nZ61P-00021w-Qf; Tue, 29 Mar 2022 03:12:11 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22T70PTr036190;
 Tue, 29 Mar 2022 15:00:25 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Mar
 2022 15:11:17 +0800
Date: Tue, 29 Mar 2022 15:11:04 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 1/2] aspeed/hace: Support AST2600 HACE
Message-ID: <20220329071102.GA4525@aspeedtech.com>
References: <20220325035810.21420-1-steven_lee@aspeedtech.com>
 <20220325035810.21420-2-steven_lee@aspeedtech.com>
 <CACPK8XcswtC77H6h9dD_Y3p=sSZ2P00SJB+=z8habuCfHnurSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8XcswtC77H6h9dD_Y3p=sSZ2P00SJB+=z8habuCfHnurSA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22T70PTr036190
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 03/25/2022 15:08, Joel Stanley wrote:
> Hi Steven,
> 
> I've pointed out some small things like spelling fixes, and made a
> suggestion to split the change into multiple patches.
> 
> Aside from that, I need your help to understand what your change is
> trying to do.
> 

Hi Joel,

Thanks for the review and sorry for late reply, I was taking Monday off.
I added some examples to describe the driver behavior below, hope it helps.

> On Fri, 25 Mar 2022 at 03:58, Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > The aspeed ast2600 acculumative mode is described in datasheet
> 
> accumulative
> 

will fix it.

> > ast2600v10.pdf section 25.6.4:
> >  1. Allocationg and initiating accumulative hash digest write buffer
> 
> allocating
> 

will fix it.

> >     with initial state.
> >     * Since QEMU crypto/hash api doesn't provide the API to set initial
> >       state of hash library, and the initial state is already setted by
> >       crypto library (gcrypt/glib/...), so skip this step.
> >  2. Calculating accumulative hash digest.
> >     (a) When receiving the last accumulative data, software need to add
> >         padding message at the end of the accumulative data. Padding
> >         message described in specific of MD5, SHA-1, SHA224, SHA256,
> >         SHA512, SHA512/224, SHA512/256.
> >         * Since the crypto library (gcrypt/glib) already pad the
> >           padding message internally.
> >         * This patch is to remove the padding message which fed byguest
> >           machine driver.
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  hw/misc/aspeed_hace.c         | 113 +++++++++++++++++++++++++++++++---
> >  include/hw/misc/aspeed_hace.h |   1 +
> >  2 files changed, 105 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> > index 10f00e65f4..a883625e92 100644
> > --- a/hw/misc/aspeed_hace.c
> > +++ b/hw/misc/aspeed_hace.c
> > @@ -11,6 +11,7 @@
> >  #include "qemu/osdep.h"
> >  #include "qemu/log.h"
> >  #include "qemu/error-report.h"
> > +#include "qemu/bswap.h"
> >  #include "hw/misc/aspeed_hace.h"
> >  #include "qapi/error.h"
> >  #include "migration/vmstate.h"
> > @@ -27,6 +28,7 @@
> >
> >  #define R_HASH_SRC      (0x20 / 4)
> >  #define R_HASH_DEST     (0x24 / 4)
> > +#define R_HASH_KEY_BUFF (0x28 / 4)
> >  #define R_HASH_SRC_LEN  (0x2c / 4)
> >
> >  #define R_HASH_CMD      (0x30 / 4)
> > @@ -94,12 +96,17 @@ static int hash_algo_lookup(uint32_t reg)
> >      return -1;
> >  }
> >
> > -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> > +static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
> > +                              bool acc_mode)
> >  {
> >      struct iovec iov[ASPEED_HACE_MAX_SG];
> >      g_autofree uint8_t *digest_buf;
> >      size_t digest_len = 0;
> > -    int i;
> > +    int i, j;
> > +    static struct iovec iov_cache[ASPEED_HACE_MAX_SG];
> > +    static int cnt;
> 
> Do you mean count? Please call it "count" if that's what you mean.
> 

Yes, I will rename it to "count".

> > +    static bool has_cache;
> > +    static uint32_t total_len;
> >
> >      if (sg_mode) {
> >          uint32_t len = 0;
> > @@ -123,12 +130,93 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> >                                          MEMTXATTRS_UNSPECIFIED, NULL);
> >              addr &= SG_LIST_ADDR_MASK;
> >
> > -            iov[i].iov_len = len & SG_LIST_LEN_MASK;
> > -            plen = iov[i].iov_len;
> > +            plen = len & SG_LIST_LEN_MASK;
> >              iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
> >                                                  MEMTXATTRS_UNSPECIFIED);
> > +
> > +            if (acc_mode) {
> 
> This function is getting large. We should try to refactor it, instead
> of attempting to support all three cases in the one function.
> 

will refactor it.

> > +                total_len += plen;
> > +
> > +                if (len & SG_LIST_LEN_LAST) {
> > +                    /*
> > +                     * In the padding message, the last 64/128 bit represents
> > +                     * the total length of bitstream in big endian.
> > +                     * SHA-224, SHA-256 are 64 bit
> > +                     * SHA-384, SHA-512, SHA-512/224, SHA-512/256 are 128 bit
> > +                     * However, we would not process such a huge bit stream.
> > +                     */
> > +                    uint8_t *padding = iov[i].iov_base;
> > +                    uint32_t llen = (uint32_t)(ldq_be_p(iov[i].iov_base + plen - 8) / 8);
> 
> What is llen?
> 

message length in the last messge.
Is rename "llen" to "message_len" ok?

> > +                    uint32_t pad_start_off = 0;
> > +
> > +                    if (llen <= total_len) {
> > +                        uint32_t padding_size = total_len - llen;
> > +                        pad_start_off = plen - padding_size;
> > +                    }
> 
> I find it hard to follow this code. I tried to look at the u-boot
> driver to understand it, and it's equally hard to understand.
> 
> Can you try to provide an overview?
> 

aspeed_hace of aspeed u-boot and ast1030 zephyr sdk have the following behavior

1. Driver calls hash_final() or sha_digest() to trigger 1 hash operation request.
   the data is put in iov[0].iov_base.

   Example 1-a. request is "abc", driver adds padding to make the
   message length to be multiples of 64.

       iov[0].iov_base =
           61 62 63 80 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 18

   padding start with 0x80, the last 8 bytes are length of request
   length = 0x18 / 8 = 3

   Example 1-b. request length is 56.
   In this case, because of the minimum size of padding is 9(0x80(1 byte) + message_len(8 bytes)).
   request size + minimum padding size = 56 + 9 = 65, it is not multiples of 64,
   driver adds padding to make the size of message as 128.

       iov[0].iov_base =
           61 62 63 64 62 63 64 65 63 64 65 66 64 65 66 67
           65 66 67 68 66 67 68 69 67 68 69 6a 68 69 6a 6b
           69 6a 6b 6c 6a 6b 6c 6d 6b 6c 6d 6e 6c 6d 6e 6f
           6d 6e 6f 70 6e 6f 70 71 80 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 c0

   Example 1-c. Driver put all data in a request and trigger hash operation .
   https://github.com/AspeedTech-BMC/u-boot/blob/v00.04.09/drivers/crypto/aspeed_hace.c#L273

       iov[0].iov_base =
           0e 02 a0 06 0d 02 f2 6c 88 cd 01 f0 4e 01 18 be
           0f 02 7d 09 e4 13 93 1a 40 3b ba 0d 91 1a 0d 02
	   ...

       iov[1].iov_base =
           80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 56 78

2. Driver calls hash_update() to trigger one or multiple hash operation requests, then
   call hash_final() to trigger the last hash operation request.

   Example 2-a. Driver call hash_update() with the following request:

       iov[0].iov_base =
           41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e 4f 50
           51 52 53 54 55 56 57 58 59 5a 61 62 63 64 65 66
           67 68 69 6a 6b 6c 6d 6e 6f 70 71 72 73 74 75 76
           77 78 79 7a 30 31 32 33 34 35 36 37 38 39 2b 2d

   Driver call hash_final() with padding as request length is multiples of 64:
       iov[0].iov_base =
           80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00

	length = 200 / 8 = 64

   Example 2-b. Driver call hash_update() with the request that
   length is not multiples of 64:

       iov[0].iov_base =
           08 9f 13 aa 41 d8 4c e3 7a 11 85 1c b3 27 be 55
           ec 60 f7 8e 02 99 30 c7 3b d2 69 00 74 0b a2 16
           ad 44 db 4f e6 7d 14 88 1f b6 2a c1 58 ef 63 fa
           91 05 9c 33 ca 3e d5 6c 03 77 0e a5 19 b0 47 de
           ...

   Driver call hash_final() with the request data and padding
       iov[0].iov_base =
           0d a4 18 af 46 dd 51 e8 7f 16 8a 21 b8 2c c3 5a
           f1 65 fc 93 07 9e 35 cc 40 d7 6e 05 79 10 a7 1b
           b2 49 e0 54 eb 82 19 8d 24 bb 2f c6 5d f4 68 ff
           96 0a a1 38 cf 43 da 71 08 7c 13 aa 1e b5 4c 80
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
           00 00 00 00 00 00 00 00 00 00 00 00 00 00 1f f8

	length = 1ff8 / 8 = 1023

> > +
> > +                    /*
> > +                     * FIXME:
> > +                     * length with sg_last_bit doesn't mean the message
> > +                     * contains padding.
> > +                     * Need to find a better way to check whether the current payload
> > +                     * contains padding message.
> > +                     * Current solution is to check:
> > +                     * - padding start byte is 0x80
> > +                     * - message length should less than total length(msg + padding)
> > +                     */
> > +                    if (llen > total_len || padding[pad_start_off] != 0x80) {
> > +                        has_cache = true;
> > +                        iov_cache[cnt].iov_base = iov[i].iov_base;
> > +                        iov_cache[cnt].iov_len = plen;
> > +                        cnt++;
> > +                    } else {
> > +                        if (has_cache) {
> > +                            has_cache = false;
> > +                            if (pad_start_off != 0) {
> > +                                iov_cache[cnt].iov_base = iov[i].iov_base;
> > +                                iov_cache[cnt].iov_len = pad_start_off;
> > +                                cnt++;
> > +                            }
> > +                            for (j = 0; j < cnt; j++) {
> > +                                iov[j].iov_base = iov_cache[j].iov_base;
> > +                                iov[j].iov_len = iov_cache[j].iov_len;
> 
> Can you explain why you've needed to add iov_cache?
> 

iov_cache is for example 2-a and 2-b mentioned above.

> > +                            }
> > +                            /*
> > +                             * This should be the last message as it contains
> > +                             * padding message.
> > +                             * store cnt(count of iov), clear cache and break
> > +                             * the loop.
> > +                             */
> > +                            i = cnt;
> > +                            cnt = 0;
> > +                            total_len = 0;
> > +                            break;
> > +                        }
> > +                        plen -= total_len - llen;
> > +                        cnt = 0;
> > +                        total_len = 0;
> > +                    }
> > +                }
> > +            }
> > +            iov[i].iov_len = plen;
> >          }
> >      } else {
> > +        /*
> > +         * FIXME:
> > +         * Driver sends hash_update() and hash_final() with
> > +         * sg_mode enable in aspeed ast2600 u-boot and ast1030 zephyr sdk.
> > +         * Clear cache if driver trigger hash_update() with sg_mode enable
> > +         * but trigger hash_final() without sg mode for preventing iov_cache
> > +         * overflow.
> 
> I don't follow your explanation. If we have sg_mode enabled then we
> won't enter this condition.
> 

Yes, if driver enable sg_mode in both hash_update() and hash_final(), then the implementation
is not necessary.

For instance, aspeed u-boot stores sg_enable in ctx->method.
https://github.com/AspeedTech-BMC/u-boot/blob/v00.04.09/drivers/crypto/aspeed_hace.c#L165

hash_update() and hash_finish() pass the the same ctx to qemu aspeed
hace model.
https://github.com/AspeedTech-BMC/u-boot/blob/v00.04.09/drivers/crypto/aspeed_hace.c#L237
https://github.com/AspeedTech-BMC/u-boot/blob/v00.04.09/drivers/crypto/aspeed_hace.c#L264

However, I found aspeed kernel driver only enable sg_mode in hash_update.
It enable sg_mode during hash_update()
https://github.com/AspeedTech-BMC/linux/blob/v00.05.00/drivers/crypto/aspeed/aspeed-hace-hash.c#L369

then clear sg_mode after trigger hash_update().
https://github.com/AspeedTech-BMC/linux/blob/v00.05.00/drivers/crypto/aspeed/aspeed-hace-hash.c#L314

It means sg_mode is not enable in hash_final() below.
https://github.com/AspeedTech-BMC/linux/blob/v00.05.00/drivers/crypto/aspeed/aspeed-hace-hash.c#L377

Thus if we don't clear the cache for this case, the next sg_en hash_update() will get
wrong result as there is a previous request in the cache.

> This looks like a fix for a separate issue. If it is, then put it in a
> different patch so we can review it there.
> 
> 
> 

will fix it.

> > +         */
> > +        if (cnt || total_len) {
> > +            cnt = 0;
> > +            total_len = 0;
> > +            qemu_log_mask(LOG_UNIMP,
> > +                          "hash update with sg_mode and hash_final() without"
> > +                          "sg mode is not yet implemented\n");
> > +        }
> > +
> >          hwaddr len = s->regs[R_HASH_SRC_LEN];
> >
> >          iov[0].iov_len = len;
> > @@ -210,6 +298,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
> >      case R_HASH_DEST:
> >          data &= ahc->dest_mask;
> >          break;
> > +    case R_HASH_KEY_BUFF:
> > +        data &= ahc->key_mask;
> > +        break;
> 
> You could make the key_mask/KEY_BUFF change a seperate patch.
> 

will fix it.

> >      case R_HASH_SRC_LEN:
> >          data &= 0x0FFFFFFF;
> >          break;
> > @@ -229,12 +320,13 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
> >          }
> >          algo = hash_algo_lookup(data);
> >          if (algo < 0) {
> > -                qemu_log_mask(LOG_GUEST_ERROR,
> > -                        "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> > -                        __func__, data & ahc->hash_mask);
> > -                break;
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                    "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> > +                    __func__, data & ahc->hash_mask);
> > +            break;
> 
> This whitespace change looks unrelated.
> 
> >          }

will fix it

> > -        do_hash_operation(s, algo, data & HASH_SG_EN);
> > +        do_hash_operation(s, algo, data & HASH_SG_EN,
> > +                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
> >
> >          if (data & HASH_IRQ_EN) {
> >              qemu_irq_raise(s->irq);
> > @@ -333,6 +425,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
> >
> >      ahc->src_mask = 0x0FFFFFFF;
> >      ahc->dest_mask = 0x0FFFFFF8;
> > +    ahc->key_mask = 0x0FFFFFC0;
> >      ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
> >  }
> >
> > @@ -351,6 +444,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
> >
> >      ahc->src_mask = 0x3fffffff;
> >      ahc->dest_mask = 0x3ffffff8;
> > +    ahc->key_mask = 0x3FFFFFC0;
> >      ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
> >  }
> >
> > @@ -369,6 +463,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
> >
> >      ahc->src_mask = 0x7FFFFFFF;
> >      ahc->dest_mask = 0x7FFFFFF8;
> > +    ahc->key_mask = 0x7FFFFFF8;
> >      ahc->hash_mask = 0x00147FFF;
> >  }
> >
> > diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> > index 94d5ada95f..2242945eb4 100644
> > --- a/include/hw/misc/aspeed_hace.h
> > +++ b/include/hw/misc/aspeed_hace.h
> > @@ -37,6 +37,7 @@ struct AspeedHACEClass {
> >
> >      uint32_t src_mask;
> >      uint32_t dest_mask;
> > +    uint32_t key_mask;
> >      uint32_t hash_mask;
> >  };
> >
> > --
> > 2.17.1
> >

