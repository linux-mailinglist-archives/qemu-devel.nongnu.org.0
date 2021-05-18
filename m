Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6F387B28
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:32:54 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0mD-00051d-UF
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj0hh-0000uA-9a
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:28:13 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj0hd-0001Uj-M4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:28:13 -0400
Received: by mail-ej1-x635.google.com with SMTP id s22so14704799ejv.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JHuub+HugGbz4RM9LwECrREYuQMow47kkIhzfv+GTOQ=;
 b=Tfsb2ZvKwz3OKnuEhTLo2+f0BMd1VBJoc6w8UUKgfcePa8cTUxUELIEfuxALBODSdh
 juo7T5U7rgkq4cAjZMMXMduAcHEPXZEuSYqxt9Rgb7YDZC5orOF6vJOfyj6oV5xbdCTj
 UC86HqoaRMdU0LNd+P40a0asLgONwNWJ2aAlmjdNwVNpSaASKwQiKqM2bBG/z0jAP5G+
 aEukKm3Ube0LlzbyLy8UagVtbhQcZ1g414islOMinLbFFLTYuQ9LZO7FSqjG0Fg9D+WA
 SJwzYQdAOkA0zq1uW1zEXpTzjz+UKtxqQVqnAAZ/uU+luN1+MKk7ryAK7PP7GlDZZ/gk
 hDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JHuub+HugGbz4RM9LwECrREYuQMow47kkIhzfv+GTOQ=;
 b=Ou1ESQyE/+BojJwMfIOmxzlfL7kFLyf3Xp+xvCKPvAjqzcxQ8oGTnhifDZLrr/hnv4
 7SKXeKkTxtRUX/zbNUWBpKLWbUlNRanOtwgEI7UZa3IJOhVo5dnJDnMObgXKeeRivDfB
 NWexAmOn1+Mk6MGrzD4easv7ge2S2I4qr95FqVrrUUEQRD20zqBxzVmk7kq9Dc6hZjRW
 b0lyBc1ajFLkCDI4UzZFucWO4ZqSJulIQIi3JHIyU/4yZ7qn/Fdw6TcP4D6HVJhQWjdH
 Rzx+6Gh3YPvFO2HGX4q2S/wwy1C383An0WFvJeMY5oQkxeMbFFYz2uy3FLgTTAW6qN5l
 UAPA==
X-Gm-Message-State: AOAM5322p2vmRzna1Od//cR/GXTwoU0FmNq+lT3KxDyEoGf8YO8/ZcnT
 tt5ppxdFfW1T+Tea5+cPye3pSjoPYU82QQEIsam9Zg==
X-Google-Smtp-Source: ABdhPJwqhfMmZ7lKIkMapUjCgV5L6DNLR67TgOvcubFWQbe8uDspBl+c4U4r7yVi+NXvKISvddOdAwJND7esztI0NHQ=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr6403124ejb.56.1621348086924; 
 Tue, 18 May 2021 07:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-3-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-3-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 15:27:49 +0100
Message-ID: <CAFEAcA9vjrircOkZgV7yB9qu970+OxVVt5r+=N1gzfRZPqrHzQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] hw/intc: GICv3 ITS register definitions added
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Defined descriptors for ITS device table,collection table and ITS
> command queue entities.Implemented register read/write functions,
> extract ITS table parameters and command queue parameters,extended
> gicv3 common to capture qemu address space(which host the ITS table
> platform memories required for subsequent ITS processing) and
> initialize the same in ITS device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c                | 333 +++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h               |  23 ++
>  include/hw/intc/arm_gicv3_common.h     |   3 +
>  include/hw/intc/arm_gicv3_its_common.h |  30 +++
>  4 files changed, 389 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 7b11330e01..a7ccb38a89 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,162 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>
> +static bool extract_table_params(GICv3ITSState *s)
> +{
> +    bool result = true;
> +    uint16_t num_pages = 0;
> +    uint8_t  page_sz_type;
> +    uint8_t type;
> +    uint32_t page_sz = 0;
> +    uint64_t value;
> +
> +    for (int i = 0; i < 8; i++) {
> +        value = s->baser[i];
> +
> +        if (!value) {
> +            continue;
> +        }
> +
> +        page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
> +
> +        switch (page_sz_type) {
> +        case 0:
> +            page_sz = GITS_ITT_PAGE_SIZE_0;
> +            break;
> +
> +        case 1:
> +            page_sz = GITS_ITT_PAGE_SIZE_1;
> +            break;
> +
> +        case 2:
> +        case 3:
> +            page_sz = GITS_ITT_PAGE_SIZE_2;
> +            break;
> +
> +        default:
> +            result = false;
> +            break;

g_assert_unreachable(), because the field is 2 bits and can't have
any values that we don't handle explicitly.

> +        }
> +
> +        if (result) {

This can never be false, so no point checking it.
(Plus it reduces the level of indentation and makes the rest of
the function less cramped against the right margin.)

> +            num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
> +
> +            type = FIELD_EX64(value, GITS_BASER, TYPE);
> +
> +            switch (type) {
> +
> +            case GITS_ITT_TYPE_DEVICE:
> +                memset(&s->dt, 0 , sizeof(s->dt));
> +                s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
> +
> +                if (s->dt.valid) {
> +                    s->dt.page_sz = page_sz;
> +                    s->dt.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
> +                    s->dt.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
> +
> +                    if (!s->dt.indirect) {
> +                        s->dt.max_entries = ((num_pages + 1) * page_sz) /
> +                                                       s->dt.entry_sz;
> +                    } else {
> +                        s->dt.max_entries = ((((num_pages + 1) * page_sz) /
> +                                        L1TABLE_ENTRY_SIZE) *
> +                                    (page_sz / s->dt.entry_sz));
> +                    }
> +
> +                    s->dt.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
> +                                                    DEVBITS) + 1));
> +
> +                    if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
> +                        (page_sz == GITS_ITT_PAGE_SIZE_1)) {

Use a "switch (page_sz)", not an if-ladder.

> +                        s->dt.base_addr = FIELD_EX64(value, GITS_BASER,
> +                                                      PHYADDR);
> +                        s->dt.base_addr <<= R_GITS_BASER_PHYADDR_SHIFT;

These two lines are more clearly written
                           s->dt.base_addr = value & R_GITS_BASER_PHYADDR_MASK;

I think.

> +                    } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
> +                        s->dt.base_addr = FIELD_EX64(value, GITS_BASER,
> +                                           PHYADDRL_64K) <<
> +                                           R_GITS_BASER_PHYADDRL_64K_SHIFT;
> +                        s->dt.base_addr |= ((value >>
> +                                             R_GITS_BASER_PHYADDR_SHIFT) &
> +                                             R_GITS_BASER_PHYADDRH_64K_MASK) <<
> +                                             R_GITS_BASER_PHYADDRH_64K_SHIFT;

Similarly:
                           s->dt.base_addr = value & R_GITS_BASER_PHYADDRL_MASK;
                           s->dt.base_addr |= FIELD_EX64(value,
GITS_BASER, PHYADDRH_64K) << 48;

You'll also need to fix the error in the definition of PHYADDRH_64K in the
previous patch:
   FIELD(GITS_BASER, PHYADDRH_64K, 48, 4)
as the high part of the address is in bits [15:12] of the register, not [52:48].

Calculating the base_addr from the value given the page_sz is a moderately
complicated bit of code that's duplicated here in both parts of this
function -- you should factor it out into its own function, something
like "uint64_t baser_base_addr(unit64_t value, uint32_t page_sz)".

> +                    }
> +                }
> +                break;
> +
> +            case GITS_ITT_TYPE_COLLECTION:
> +                memset(&s->ct, 0 , sizeof(s->ct));
> +                s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
> +
> +                /*
> +                 * GITS_TYPER.HCC is 0 for this implementation
> +                 * hence writes are discarded if ct.valid is 0
> +                 */
> +                if (s->ct.valid) {
> +                    s->ct.page_sz = page_sz;
> +                    s->ct.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
> +                    s->ct.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
> +
> +                    if (!s->ct.indirect) {
> +                        s->ct.max_entries = ((num_pages + 1) * page_sz) /
> +                                              s->ct.entry_sz;
> +                    } else {
> +                        s->ct.max_entries = ((((num_pages + 1) * page_sz) /
> +                                              L1TABLE_ENTRY_SIZE) *
> +                                              (page_sz / s->ct.entry_sz));
> +                    }
> +
> +                    if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
> +                        s->ct.max_collids = (1UL << (FIELD_EX64(s->typer,
> +                                                     GITS_TYPER, CIDBITS) + 1));
> +                    } else {
> +                        /* 16-bit CollectionId supported when CIL == 0 */
> +                        s->ct.max_collids = (1UL << 16);
> +                    }
> +
> +                    if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
> +                         (page_sz == GITS_ITT_PAGE_SIZE_1)) {
> +                        s->ct.base_addr = FIELD_EX64(value, GITS_BASER,
> +                                                     PHYADDR);
> +                        s->ct.base_addr <<= R_GITS_BASER_PHYADDR_SHIFT;
> +                    } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
> +                        s->ct.base_addr = FIELD_EX64(value, GITS_BASER,
> +                                                PHYADDRL_64K) <<
> +                                                R_GITS_BASER_PHYADDRL_64K_SHIFT;
> +                        s->ct.base_addr |= ((value >>
> +                                             R_GITS_BASER_PHYADDR_SHIFT) &
> +                                             R_GITS_BASER_PHYADDRH_64K_MASK) <<
> +                                             R_GITS_BASER_PHYADDRH_64K_SHIFT;
> +                    }


> +                }
> +                break;
> +
> +            default:
> +                break;
> +            }
> +        }
> +    }
> +    return result;

This is always true, so there's no point having the function return
a bool; make it 'void'.

> +}
> +
> +static void extract_cmdq_params(GICv3ITSState *s)
> +{
> +    uint16_t num_pages = 0;
> +    uint64_t value = s->cbaser;
> +
> +    num_pages = FIELD_EX64(value, GITS_CBASER, SIZE);
> +
> +    memset(&s->cq, 0 , sizeof(s->cq));
> +    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
> +
> +    if (s->cq.valid) {
> +        s->cq.max_entries = ((num_pages + 1) * GITS_ITT_PAGE_SIZE_0) /
> +                                                GITS_CMDQ_ENTRY_SIZE;
> +        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
> +        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
> +    }
> +    return;

Don't write code like

     if (something) {
         lots of processing;
     }
     return;

-- it hides the fact that the "!something" case is just "early exit" and
means the common-case path is indented by an extra level and more likely
to bump up against the right margin. Prefer
    if (!something) {
        return;
    }
    lots of processing;

(You can do the same in the previous function with
  if (!s->dt.valid) {
      return;
  }
etc, again improving the indentation situation, and in the code below that's
checking ITS_CTLR_ENABLED, though there with 'break' rather than 'return'.)

Also, you don't need to have an explicit "return" at the end of a void function.

> +}
> +
>  static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
>                                 uint64_t data, unsigned size, MemTxAttrs attrs)
>  {
> @@ -40,7 +196,70 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
> +    uint64_t temp = 0;
>
> +    switch (offset) {
> +    case GITS_CTLR:
> +        s->ctlr |= (value & ~(s->ctlr));
> +
> +        if (s->ctlr & ITS_CTLR_ENABLED) {
> +            if (!extract_table_params(s)) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                    "%s: error extracting GITS_BASER parameters "
> +                    TARGET_FMT_plx "\n", __func__, offset);
> +            } else {
> +                extract_cmdq_params(s);
> +                s->creadr = 0;
> +            }
> +        }
> +        break;
> +    case GITS_CBASER:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = deposit64(s->cbaser, 0, 32, value);
> +            s->creadr = 0;
> +        }
> +        break;
> +    case GITS_CBASER + 4:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = deposit64(s->cbaser, 32, 32, value);
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter = deposit64(s->cwriter, 0, 32, value);
> +        break;
> +    case GITS_CWRITER + 4:
> +        s->cwriter = deposit64(s->cwriter, 32, 32, value);
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /*
> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            index = (offset - GITS_BASER) / 8;
> +
> +            if (offset & 7) {
> +                temp = s->baser[index];
> +                temp = deposit64(temp, 32, 32, (value & ~GITS_BASER_VAL_MASK));
> +                s->baser[index] |= temp;

You don't need to use a temp here.

> +            } else {
> +                s->baser[index] =  deposit64(s->baser[index], 0, 32, value);
> +            }

GITS_BASER_VAL_MASK is the mask of valid bits for the whole 64-bit
register, so for this 32-bit write code you need to mask value
with the appropriate 32-bit half of it (and there should be masking
code in both the "low half" and "high half" if() branches).

> +        }
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>
> @@ -48,7 +267,54 @@ static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t *data, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>
> +    switch (offset) {
> +    case GITS_CTLR:
> +        *data = s->ctlr;
> +        break;
> +    case GITS_IIDR:
> +        *data = gicv3_iidr();
> +        break;
> +    case GITS_PIDR2:
> +        *data = gicv3_idreg(offset - GITS_PIDR2);
> +        break;

(We discussed PIDR2 in another thread.)

> +    case GITS_TYPER:
> +        *data = extract64(s->typer, 0, 32);
> +        break;
> +    case GITS_TYPER + 4:
> +        *data = extract64(s->typer, 32, 32);
> +        break;
> +    case GITS_CBASER:
> +        *data = extract64(s->cbaser, 0, 32);
> +        break;
> +    case GITS_CBASER + 4:
> +        *data = extract64(s->cbaser, 32, 32);
> +        break;
> +    case GITS_CREADR:
> +        *data = extract64(s->creadr, 0, 32);
> +        break;
> +    case GITS_CREADR + 4:
> +        *data = extract64(s->creadr, 32, 32);
> +        break;
> +    case GITS_CWRITER:
> +        *data = extract64(s->cwriter, 0, 32);
> +        break;
> +    case GITS_CWRITER + 4:
> +        *data = extract64(s->cwriter, 32, 32);
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        index = (offset - GITS_BASER) / 8;
> +        if (offset & 7) {
> +            *data = s->baser[index] >> 32;
> +        } else {
> +            *data = (uint32_t)s->baser[index];

Use extract64() for GITS_BASER please, just for consistency with the
other registers.

> +        }
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>
> @@ -56,7 +322,35 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>
> +    switch (offset) {
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /*
> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            index = (offset - GITS_BASER) / 8;
> +            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);
> +        }
> +        break;
> +    case GITS_CBASER:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = value;
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter = value;
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>
> @@ -64,7 +358,29 @@ static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t *data, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>
> +    switch (offset) {
> +    case GITS_TYPER:
> +        *data = s->typer;
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        index = (offset - GITS_BASER) / 8;
> +        *data = s->baser[index];
> +        break;
> +    case GITS_CBASER:
> +        *data = s->cbaser;
> +        break;
> +    case GITS_CREADR:
> +        *data = s->creadr;
> +        break;
> +    case GITS_CWRITER:
> +        *data = s->cwriter;
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>
> @@ -161,6 +477,9 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
>      gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
>
>      if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> +        address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
> +                           "gicv3-its-sysmem");

"gicv3-its-dma"

> +
>          /* set the ITS default features supported */
>          s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
>                                         GITS_TYPE_PHYSICAL);
> @@ -207,6 +526,18 @@ static void gicv3_its_reset(DeviceState *dev)
>      }
>  }
>
> +static void gicv3_its_post_load(GICv3ITSState *s)
> +{
> +    if (s->ctlr & ITS_CTLR_ENABLED) {
> +        if (!extract_table_params(s)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: error extracting GITS_BASER parameters\n", __func__);
> +        } else {
> +            extract_cmdq_params(s);
> +        }

The correct response to "incoming migration data is bad" is not
to log a guest error but to fail the post-load function.
Luckily we get to avoid having to fix up the base class to allow
that, because in fact extract_table_params() can never fail.

> +    }
> +}
> +
>  static Property gicv3_its_props[] = {
>      DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
>                       GICv3State *),
> @@ -217,10 +548,12 @@ static void gicv3_its_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
> +    GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
>
>      dc->realize = gicv3_arm_its_realize;
>      device_class_set_props(dc, gicv3_its_props);
>      device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
> +    icc->post_load = gicv3_its_post_load;
>  }

thanks
-- PMM

