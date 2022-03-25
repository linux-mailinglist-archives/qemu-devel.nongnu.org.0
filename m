Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AC54E6ED6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:27:28 +0100 (CET)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXeM3-00086Q-3E
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:27:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nXe3q-0000WJ-3f; Fri, 25 Mar 2022 03:08:39 -0400
Received: from [2607:f8b0:4864:20::82f] (port=43723
 helo=mail-qt1-x82f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nXe3n-0000dp-Va; Fri, 25 Mar 2022 03:08:37 -0400
Received: by mail-qt1-x82f.google.com with SMTP id t7so5812391qta.10;
 Fri, 25 Mar 2022 00:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWmjDczSmEk/BPjI0TwJ8MpQ3ray9DHtF73sFqCqtXU=;
 b=Xjq0cZKaPR0t1V86KTshtpoXuteHNJIxwqJsF83+Ow7fr7plHjXrjkQJjAeALBVWta
 pU5RxCqz/lVD7nKNaY9uNk6HswXWL/XtMZYxR874CLy7RLOW+HoKryDbBuVZU5QeYH1g
 SaLdJh8lNtPv6yNyJe7uV21YzGJ3r1dxy4LRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWmjDczSmEk/BPjI0TwJ8MpQ3ray9DHtF73sFqCqtXU=;
 b=wnZar6f7jMxC2wAzXiklN+8DhOaZ2Gffz4F/nsDi9wnb2OIwVOrAw6a4AyMKP21lWC
 cc8NF10BuZ0D4O5ZVqyj403atTbRXgDIXjiIkPK3vPkX5MP+hzr/OOCa0rDzkgmBRQcj
 8QDIP7u4wJgT3t90ip50YCtmWb11CnshA6XMJ1GxkoVJGkKaUhGqtMH6nd7rH/mig5cI
 2xuROSFTwHO252600IPO4H5ArGabtoV688LJOIZRW0qmCKjPikDGz9n6Ssbkp3lKcHg8
 w1lQZlT/RCkipEBu9nJwne0k0waRQWcYzh1B7V+fiJ2h/SbF0W735A6XY4lmP7VrX5ti
 w5zw==
X-Gm-Message-State: AOAM5335PA9z7F/fJ9LWu51PZRg+DQla7a8uooTovot0beWK/6yzPxlh
 x3BMTWVlZM0Zkno5ZQllvo2RHpDE+zj0w3hTzm4=
X-Google-Smtp-Source: ABdhPJx1TDevFKEBAuDp1wfPvD0f76wagUxLk1NXzIyr/FprVZeLRu8TyrtX2N8KYOxuVKpHaZfGEth+kvEd5CdPvMg=
X-Received: by 2002:a05:622a:4cd:b0:2e1:ec2f:8c22 with SMTP id
 q13-20020a05622a04cd00b002e1ec2f8c22mr8115636qtx.494.1648192112059; Fri, 25
 Mar 2022 00:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220325035810.21420-1-steven_lee@aspeedtech.com>
 <20220325035810.21420-2-steven_lee@aspeedtech.com>
In-Reply-To: <20220325035810.21420-2-steven_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Mar 2022 07:08:19 +0000
Message-ID: <CACPK8XcswtC77H6h9dD_Y3p=sSZ2P00SJB+=z8habuCfHnurSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] aspeed/hace: Support AST2600 HACE
To: Steven Lee <steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Troy Lee <troy_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Steven,

I've pointed out some small things like spelling fixes, and made a
suggestion to split the change into multiple patches.

Aside from that, I need your help to understand what your change is
trying to do.

On Fri, 25 Mar 2022 at 03:58, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The aspeed ast2600 acculumative mode is described in datasheet

accumulative

> ast2600v10.pdf section 25.6.4:
>  1. Allocationg and initiating accumulative hash digest write buffer

allocating

>     with initial state.
>     * Since QEMU crypto/hash api doesn't provide the API to set initial
>       state of hash library, and the initial state is already setted by
>       crypto library (gcrypt/glib/...), so skip this step.
>  2. Calculating accumulative hash digest.
>     (a) When receiving the last accumulative data, software need to add
>         padding message at the end of the accumulative data. Padding
>         message described in specific of MD5, SHA-1, SHA224, SHA256,
>         SHA512, SHA512/224, SHA512/256.
>         * Since the crypto library (gcrypt/glib) already pad the
>           padding message internally.
>         * This patch is to remove the padding message which fed byguest
>           machine driver.
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  hw/misc/aspeed_hace.c         | 113 +++++++++++++++++++++++++++++++---
>  include/hw/misc/aspeed_hace.h |   1 +
>  2 files changed, 105 insertions(+), 9 deletions(-)
>
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 10f00e65f4..a883625e92 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -11,6 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
> +#include "qemu/bswap.h"
>  #include "hw/misc/aspeed_hace.h"
>  #include "qapi/error.h"
>  #include "migration/vmstate.h"
> @@ -27,6 +28,7 @@
>
>  #define R_HASH_SRC      (0x20 / 4)
>  #define R_HASH_DEST     (0x24 / 4)
> +#define R_HASH_KEY_BUFF (0x28 / 4)
>  #define R_HASH_SRC_LEN  (0x2c / 4)
>
>  #define R_HASH_CMD      (0x30 / 4)
> @@ -94,12 +96,17 @@ static int hash_algo_lookup(uint32_t reg)
>      return -1;
>  }
>
> -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> +static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
> +                              bool acc_mode)
>  {
>      struct iovec iov[ASPEED_HACE_MAX_SG];
>      g_autofree uint8_t *digest_buf;
>      size_t digest_len = 0;
> -    int i;
> +    int i, j;
> +    static struct iovec iov_cache[ASPEED_HACE_MAX_SG];
> +    static int cnt;

Do you mean count? Please call it "count" if that's what you mean.

> +    static bool has_cache;
> +    static uint32_t total_len;
>
>      if (sg_mode) {
>          uint32_t len = 0;
> @@ -123,12 +130,93 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>                                          MEMTXATTRS_UNSPECIFIED, NULL);
>              addr &= SG_LIST_ADDR_MASK;
>
> -            iov[i].iov_len = len & SG_LIST_LEN_MASK;
> -            plen = iov[i].iov_len;
> +            plen = len & SG_LIST_LEN_MASK;
>              iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
>                                                  MEMTXATTRS_UNSPECIFIED);
> +
> +            if (acc_mode) {

This function is getting large. We should try to refactor it, instead
of attempting to support all three cases in the one function.

> +                total_len += plen;
> +
> +                if (len & SG_LIST_LEN_LAST) {
> +                    /*
> +                     * In the padding message, the last 64/128 bit represents
> +                     * the total length of bitstream in big endian.
> +                     * SHA-224, SHA-256 are 64 bit
> +                     * SHA-384, SHA-512, SHA-512/224, SHA-512/256 are 128 bit
> +                     * However, we would not process such a huge bit stream.
> +                     */
> +                    uint8_t *padding = iov[i].iov_base;
> +                    uint32_t llen = (uint32_t)(ldq_be_p(iov[i].iov_base + plen - 8) / 8);

What is llen?

> +                    uint32_t pad_start_off = 0;
> +
> +                    if (llen <= total_len) {
> +                        uint32_t padding_size = total_len - llen;
> +                        pad_start_off = plen - padding_size;
> +                    }

I find it hard to follow this code. I tried to look at the u-boot
driver to understand it, and it's equally hard to understand.

Can you try to provide an overview?

> +
> +                    /*
> +                     * FIXME:
> +                     * length with sg_last_bit doesn't mean the message
> +                     * contains padding.
> +                     * Need to find a better way to check whether the current payload
> +                     * contains padding message.
> +                     * Current solution is to check:
> +                     * - padding start byte is 0x80
> +                     * - message length should less than total length(msg + padding)
> +                     */
> +                    if (llen > total_len || padding[pad_start_off] != 0x80) {
> +                        has_cache = true;
> +                        iov_cache[cnt].iov_base = iov[i].iov_base;
> +                        iov_cache[cnt].iov_len = plen;
> +                        cnt++;
> +                    } else {
> +                        if (has_cache) {
> +                            has_cache = false;
> +                            if (pad_start_off != 0) {
> +                                iov_cache[cnt].iov_base = iov[i].iov_base;
> +                                iov_cache[cnt].iov_len = pad_start_off;
> +                                cnt++;
> +                            }
> +                            for (j = 0; j < cnt; j++) {
> +                                iov[j].iov_base = iov_cache[j].iov_base;
> +                                iov[j].iov_len = iov_cache[j].iov_len;

Can you explain why you've needed to add iov_cache?

> +                            }
> +                            /*
> +                             * This should be the last message as it contains
> +                             * padding message.
> +                             * store cnt(count of iov), clear cache and break
> +                             * the loop.
> +                             */
> +                            i = cnt;
> +                            cnt = 0;
> +                            total_len = 0;
> +                            break;
> +                        }
> +                        plen -= total_len - llen;
> +                        cnt = 0;
> +                        total_len = 0;
> +                    }
> +                }
> +            }
> +            iov[i].iov_len = plen;
>          }
>      } else {
> +        /*
> +         * FIXME:
> +         * Driver sends hash_update() and hash_final() with
> +         * sg_mode enable in aspeed ast2600 u-boot and ast1030 zephyr sdk.
> +         * Clear cache if driver trigger hash_update() with sg_mode enable
> +         * but trigger hash_final() without sg mode for preventing iov_cache
> +         * overflow.

I don't follow your explanation. If we have sg_mode enabled then we
won't enter this condition.

This looks like a fix for a separate issue. If it is, then put it in a
different patch so we can review it there.



> +         */
> +        if (cnt || total_len) {
> +            cnt = 0;
> +            total_len = 0;
> +            qemu_log_mask(LOG_UNIMP,
> +                          "hash update with sg_mode and hash_final() without"
> +                          "sg mode is not yet implemented\n");
> +        }
> +
>          hwaddr len = s->regs[R_HASH_SRC_LEN];
>
>          iov[0].iov_len = len;
> @@ -210,6 +298,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>      case R_HASH_DEST:
>          data &= ahc->dest_mask;
>          break;
> +    case R_HASH_KEY_BUFF:
> +        data &= ahc->key_mask;
> +        break;

You could make the key_mask/KEY_BUFF change a seperate patch.

>      case R_HASH_SRC_LEN:
>          data &= 0x0FFFFFFF;
>          break;
> @@ -229,12 +320,13 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>          }
>          algo = hash_algo_lookup(data);
>          if (algo < 0) {
> -                qemu_log_mask(LOG_GUEST_ERROR,
> -                        "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> -                        __func__, data & ahc->hash_mask);
> -                break;
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                    "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> +                    __func__, data & ahc->hash_mask);
> +            break;

This whitespace change looks unrelated.

>          }
> -        do_hash_operation(s, algo, data & HASH_SG_EN);
> +        do_hash_operation(s, algo, data & HASH_SG_EN,
> +                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
>
>          if (data & HASH_IRQ_EN) {
>              qemu_irq_raise(s->irq);
> @@ -333,6 +425,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
>
>      ahc->src_mask = 0x0FFFFFFF;
>      ahc->dest_mask = 0x0FFFFFF8;
> +    ahc->key_mask = 0x0FFFFFC0;
>      ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>  }
>
> @@ -351,6 +444,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
>
>      ahc->src_mask = 0x3fffffff;
>      ahc->dest_mask = 0x3ffffff8;
> +    ahc->key_mask = 0x3FFFFFC0;
>      ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>  }
>
> @@ -369,6 +463,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
>
>      ahc->src_mask = 0x7FFFFFFF;
>      ahc->dest_mask = 0x7FFFFFF8;
> +    ahc->key_mask = 0x7FFFFFF8;
>      ahc->hash_mask = 0x00147FFF;
>  }
>
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 94d5ada95f..2242945eb4 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -37,6 +37,7 @@ struct AspeedHACEClass {
>
>      uint32_t src_mask;
>      uint32_t dest_mask;
> +    uint32_t key_mask;
>      uint32_t hash_mask;
>  };
>
> --
> 2.17.1
>

