Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB248BFB7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:18:47 +0100 (CET)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7YqE-00024y-Hf
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:18:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n7Yjz-0002th-Bx; Wed, 12 Jan 2022 03:12:22 -0500
Received: from [2607:f8b0:4864:20::32d] (port=38796
 helo=mail-ot1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n7Yjw-000828-K3; Wed, 12 Jan 2022 03:12:19 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 r7-20020a05683001c700b005906f5b0969so1689723ota.5; 
 Wed, 12 Jan 2022 00:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zo1Q9Dv81uRvroBqWzIcFgsE1+U+eNX9ZjQjlo+8yVs=;
 b=aXpzLG3xBM/0jWTkxN8vLUv50DSxL/pvrewL5uxHpnbGpJ6od6FF2Mr+Qt65IO6m8W
 IpMe9PxNUdcZhh7y7zTLK2NmBX2rs74TNU+Vfl+erB00rkZ0uETaLXmvlBDDvJs/wWl5
 nuGgtKpBoTPVLbyGr/yGb9r6tuKeErBZGoAEh4+ae0USfsfqt1sr6NmKs2Do74dIcufS
 OwY8ir1y5EoRDbAXPfCWiGXs+pyFq/nSP2sgMIS/c13qZQqczhd8dMZJEC4pJJGk30mW
 4BHru3QgWneizQEuJOH9x8CRoBCwYRGK3QXhtpmLnr/umBFi02xehji+0znjHWi7mFXr
 ySyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zo1Q9Dv81uRvroBqWzIcFgsE1+U+eNX9ZjQjlo+8yVs=;
 b=Z/nHskHWWcpyKIBUxVETk7Jb0QkoQlmhmRKYKvHSASpgycrIFlCGgly+glek1dlgfs
 GH+ts+FAV9RFTqz0jEzLFCdwGmVUPxsEx1JcrjFFtAnOdETfO3UsGbUM8+IOyeuA06Vm
 0eJUkv+7ErMi5hxJveDbT6Z0nINpDCIFg2zdf+81Y5AZ6HGpByPdSLfCaeEzQcvS7b6u
 t4OtGKD4Ve0fclfbzHqTc3JKJhFeeQ10hLG7WKVLK27BV1r0gvPd/XA23IHH6Hh56Odx
 8uVT6cuvybycXQjjxk/vHzOj2MLZDVYnJqkD5LV1aUA8nc2sHWzlBUVfjhu7Wc0xA7NP
 XDmw==
X-Gm-Message-State: AOAM531fALODvl/HpwrWoPs8IBhvUya8cquNrbon1q3vcUvOFh8espHQ
 qOZOV5lq9OeK1ENf+W7yvUYS/sPGMfHeRUhI0No=
X-Google-Smtp-Source: ABdhPJwLereWY5KS+MEvRqAPJ0mdsd84Fx7ckf4A34U+VpbMV0gOH8Uzi6V8OJY/Y+6//8XpLdaFyxU1Y6yqzVFZvZY=
X-Received: by 2002:a9d:12f8:: with SMTP id g111mr1390728otg.41.1641975135168; 
 Wed, 12 Jan 2022 00:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20220112080937.366835-1-troy_lee@aspeedtech.com>
 <20220112080937.366835-2-troy_lee@aspeedtech.com>
In-Reply-To: <20220112080937.366835-2-troy_lee@aspeedtech.com>
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 12 Jan 2022 16:12:07 +0800
Message-ID: <CAN9Jwz11LmDi5mx-HC0RU2U7+Mcqy1bbtVUHZ+q_MbC44HZpLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/misc: Supporting AST2600 HACE accumulative mode
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=leetroy@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, hailin.wu@aspeedtech.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Klaus Heinrich Kiwi <klaus@klauskiwi.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ Adding Klaus ]

Sorry I forgot to add Klaus to the CC list.

On Wed, Jan 12, 2022 at 4:10 PM Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Accumulative mode will supply a initial state and append padding bit at
> the end of hash stream.  However, the crypto library will padding those
> bit automatically, so ripped it off from iov array.
>
> The aspeed ast2600 acculumative mode is described in datasheet
> ast2600v10.pdf section 25.6.4:
>  1. Allocationg and initiating accumulative hash digest write buffer
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
> Changes in v2:
> - Coding style
> - Add accumulative mode description in comment
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  hw/misc/aspeed_hace.c         | 43 ++++++++++++++++++++++++++++-------
>  include/hw/misc/aspeed_hace.h |  1 +
>  2 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 10f00e65f4..0710f44621 100644
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
> @@ -94,7 +96,8 @@ static int hash_algo_lookup(uint32_t reg)
>      return -1;
>  }
>
> -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> +static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
> +                              bool acc_mode)
>  {
>      struct iovec iov[ASPEED_HACE_MAX_SG];
>      g_autofree uint8_t *digest_buf;
> @@ -103,6 +106,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>
>      if (sg_mode) {
>          uint32_t len = 0;
> +        uint32_t total_len = 0;
>
>          for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
>              uint32_t addr, src;
> @@ -123,10 +127,26 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
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
> +                    plen -= total_len - (ldq_be_p(iov[i].iov_base + plen - 8) / 8);
> +                }
> +            }
> +
> +            iov[i].iov_len = plen;
>          }
>      } else {
>          hwaddr len = s->regs[R_HASH_SRC_LEN];
> @@ -210,6 +230,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>      case R_HASH_DEST:
>          data &= ahc->dest_mask;
>          break;
> +    case R_HASH_KEY_BUFF:
> +        data &= ahc->key_mask;
> +        break;
>      case R_HASH_SRC_LEN:
>          data &= 0x0FFFFFFF;
>          break;
> @@ -229,12 +252,13 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
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
>          }
> -        do_hash_operation(s, algo, data & HASH_SG_EN);
> +        do_hash_operation(s, algo, data & HASH_SG_EN,
> +                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
>
>          if (data & HASH_IRQ_EN) {
>              qemu_irq_raise(s->irq);
> @@ -333,6 +357,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
>
>      ahc->src_mask = 0x0FFFFFFF;
>      ahc->dest_mask = 0x0FFFFFF8;
> +    ahc->key_mask = 0x0FFFFFC0;
>      ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>  }
>
> @@ -351,6 +376,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
>
>      ahc->src_mask = 0x3fffffff;
>      ahc->dest_mask = 0x3ffffff8;
> +    ahc->key_mask = 0x3FFFFFC0;
>      ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>  }
>
> @@ -369,6 +395,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
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
> 2.25.1
>

