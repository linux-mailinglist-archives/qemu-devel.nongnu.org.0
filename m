Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95458363FF9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:57:26 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRan-0007Qy-Gw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYRKW-00006X-8f
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:40:36 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYRKS-0003RU-Mh
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:40:35 -0400
Received: by mail-ej1-x62c.google.com with SMTP id v6so50839552ejo.6
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bu+zjAEDaXiEuZU0hJIM5htPhm4/PXN02Kgo3lKBffc=;
 b=HI/U/QFrt9RLAFaWME9V2gCAlwjHdh3NOvEbvlq1vJ+c9Jn4q6dOv7RiQ1IXBzNEqg
 AOF+MO3er8FC61vDqS1t/m91JJ0kd0eWy1sJ0dAK+4CErHoOr/OqfyklQy651IdKmD6P
 KCyK3mblZHcb9tBXWaZW1df/hBEjjeLMCAnUWwK9pCEgaSKKlHMvdEyvDAodX39M5ERq
 VnTGngQsnKDp7MlNXBJX+o/KM5OaLv5HM0W4c2oqpBICgeLuc/6jEMeRqW1ryZHlxHZ8
 TXOxMSqRff2Cm7P76N+84iNK3WcdJQ4CC+JrPOUnq6+EWFHUPVlSoW0aEzQ0xZXaDA2K
 IUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bu+zjAEDaXiEuZU0hJIM5htPhm4/PXN02Kgo3lKBffc=;
 b=FRtko5q+EqXSDpuc9Obbc3jr67O3CAcya+pAM5EHIi9Nl8vTeNGUzlPoixan5y/Ni+
 wbEEtlnjLIO/zNf+vhKUnpITPgwzvWJou1k/iovLdZaI6mEIOM/vl5kEOM2Ogh+rr4nr
 lUAgnIhAb3poaio/GmwEflRBP6K2RHX+nzy1EUtfnpgURu97Ss5bvki62RkF3SMD0s/R
 Bg7UOwPCq83Wi4bsf7Gu7fSjU3XhQAKcFPnIsCQ1tXg0UNtBUkRz3nJ9u55KDYbdVXhQ
 cJ9dpTlFeIwm1UW03T6gC/Jybzv3wBhVXm4RYimJVZUu+DuFi2CymevHMbIk6z7pUXF7
 p24g==
X-Gm-Message-State: AOAM530osc8i04A8H83FG8rouuqFpOZZgjOXFbj+2K+X/M/Dq3OY+KJx
 FAgQ3dAVSaIz0HQMY4FxKlbu7dJce0um7Z1twR2PlXYBQ5o=
X-Google-Smtp-Source: ABdhPJwl49IbQYTyApVEDf9bQqbFrCoZQehG1vtpnu+9lYKs4jFjbHVHr+9k9UQNy5KfnF4v5SWDeyBKSVS0D8PqyQY=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr20972257ejz.382.1618828830982; 
 Mon, 19 Apr 2021 03:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-5-shashi.mallela@linaro.org>
In-Reply-To: <20210401024152.203896-5-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 11:39:39 +0100
Message-ID: <CAFEAcA96Rq6D8P0eo=4a2q6F4f3EqFvYOx+iuwPvF7mBZsjALA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
> translation which triggers an LPI via INT command as well as write
> to GITS_TRANSLATER register,defined enum to differentiate between ITS
> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
> Each of these commands make use of other functionalities implemented to
> get device table entry,collection table entry or interrupt translation
> table entry required for their processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c            | 360 ++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           |   7 +
>  include/hw/intc/arm_gicv3_common.h |   2 +
>  3 files changed, 368 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index fcac33c836..0e3f176809 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,152 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>
> +typedef enum ItsCmdType {
> +    NONE = 0, /* internal indication for GITS_TRANSLATER write */
> +    CLEAR = 1,
> +    DISCARD = 2,
> +    INT = 3,
> +} ItsCmdType;
> +
> +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint8_t  page_sz_type;
> +    uint64_t l2t_addr;
> +    uint64_t value;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t page_sz = 0;
> +    uint32_t max_l2_entries;
> +    bool status = false;
> +
> +    if (s->ct.indirect) {
> +        /* 2 level table */
> +        page_sz_type = FIELD_EX64(s->baser[1], GITS_BASER, PAGESIZE);
> +
> +        if (page_sz_type == 0) {
> +            page_sz = GITS_ITT_PAGE_SIZE_0;
> +        } else if (page_sz_type == 1) {
> +            page_sz = GITS_ITT_PAGE_SIZE_1;
> +        } else if (page_sz_type == 2) {
> +            page_sz = GITS_ITT_PAGE_SIZE_2;
> +        }
> +
> +        l2t_id = icid / (page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->ct.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, NULL);
> +
> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +        if (valid_l2t) {
> +            max_l2_entries = page_sz / s->ct.entry_sz;
> +
> +            l2t_addr = (value >> page_sz_type) &
> +                        ((1ULL << (51 - page_sz_type)) - 1);
> +
> +            address_space_read(as, l2t_addr +
> +                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
> +                                 MEMTXATTRS_UNSPECIFIED,
> +                                 cte, sizeof(*cte));
> +       }
> +    } else {
> +        /* Flat level table */
> +        address_space_read(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
> +                            MEMTXATTRS_UNSPECIFIED, cte,
> +                            sizeof(*cte));
> +    }
> +
> +    if (*cte & VALID_MASK) {
> +        status = true;
> +    }
>

Most of the remarks about update_cte() apply here too (including
the endianness issue).

+
> +    return status;
> +}
> +
> +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                      uint16_t *icid, uint32_t *pIntid)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint8_t buff[ITS_ITT_ENTRY_SIZE];
> +    uint64_t itt_addr;
> +    bool status = false;
> +
> +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> +    itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
> +
> +    address_space_read(as, itt_addr + (eventid * sizeof(buff)),
> +                MEMTXATTRS_UNSPECIFIED, &buff,
> +                sizeof(buff));
> +
> +    if (buff[0] & VALID_MASK) {
> +        if ((buff[0] >> 1U) & GITS_TYPE_PHYSICAL) {
> +            memcpy(pIntid, &buff[1], 3);
> +            memcpy(icid, &buff[7], sizeof(*icid));

You can't memcpy() values from guest memory into host variables
like this: it will give the wrong results on big-endian hosts.

> +            status = true;
> +        }
> +    }
> +
> +    return status;
> +}
> +
> +static uint64_t get_dte(GICv3ITSState *s, uint32_t devid)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint8_t  page_sz_type;
> +    uint64_t l2t_addr;
> +    uint64_t value;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t page_sz = 0;
> +    uint32_t max_l2_entries;
> +
> +    if (s->dt.indirect) {
> +        /* 2 level table */
> +        page_sz_type = FIELD_EX64(s->baser[0], GITS_BASER, PAGESIZE);
> +
> +        if (page_sz_type == 0) {
> +            page_sz = GITS_ITT_PAGE_SIZE_0;
> +        } else if (page_sz_type == 1) {
> +            page_sz = GITS_ITT_PAGE_SIZE_1;
> +        } else if (page_sz_type == 2) {
> +            page_sz = GITS_ITT_PAGE_SIZE_2;
> +        }
> +
> +        l2t_id = devid / (page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->dt.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, NULL);
> +
> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +        if (valid_l2t) {
> +            max_l2_entries = page_sz / s->dt.entry_sz;
> +
> +            l2t_addr = (value >> page_sz_type) &
> +                        ((1ULL << (51 - page_sz_type)) - 1);
> +
> +            value = 0;
> +            address_space_read(as, l2t_addr +
> +                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
> +                                 MEMTXATTRS_UNSPECIFIED,
> +                                 &value, sizeof(value));
> +        }
> +    } else {
> +        /* Flat level table */
> +        value = 0;
> +        address_space_read(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
> +                            MEMTXATTRS_UNSPECIFIED, &value,
> +                            sizeof(value));
> +    }
> +
> +    return value;
> +}
> +
>  static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
>  {
>      AddressSpace *as = &s->gicv3->sysmem_as;
> @@ -66,6 +212,187 @@ static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
>      return res;
>  }
>
> +static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
> +                                uint32_t offset, ItsCmdType cmd)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint32_t devid, eventid;
> +    MemTxResult res = MEMTX_OK;
> +    bool dte_valid;
> +    uint64_t dte = 0;
> +    uint32_t max_eventid;
> +    uint16_t icid = 0;
> +    uint32_t pIntid = 0;
> +    bool ite_valid = false;
> +    uint64_t cte = 0;
> +    bool cte_valid = false;
> +    uint8_t buff[ITS_ITT_ENTRY_SIZE];
> +    uint64_t itt_addr;
> +
> +    if (cmd == NONE) {
> +        devid = offset;
> +    } else {
> +        devid = (value >> DEVID_OFFSET) & DEVID_MASK;
> +
> +        offset += NUM_BYTES_IN_DW;
> +        value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +    }
> +
> +    eventid = (value & EVENTID_MASK);
> +
> +    dte = get_dte(s, devid);
> +    dte_valid = dte & VALID_MASK;
> +
> +    if (dte_valid) {
> +        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> +
> +        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid);
> +
> +        if (ite_valid) {
> +            cte_valid = get_cte(s, icid, &cte);
> +        }
> +    }
> +
> +    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
> +            !cte_valid || (eventid > max_eventid)) {
> +        if (FIELD_EX64(s->typer, GITS_TYPER, SEIS)) {
> +            /*
> +             * Generate System Error here if supported
> +             * for each of the individual error cases
> +             */
> +        }
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: invalid interrupt translation table attributes "
> +            "devid %d or eventid %d\n",
> +            __func__, devid, eventid);
> +        /*
> +         * in this implementation,in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        if (FIELD_EX64(s->typer, GITS_TYPER, PTA)) {
> +            /*
> +             * only bits[47:16] are considered instead of bits [51:16]
> +             * since with a physical address the target address must be
> +             * 64KB aligned
> +             */
> +
> +            /*
> +             * Current implementation only supports rdbase == procnum
> +             * Hence rdbase physical address is ignored
> +             */

As noted earlier, just delete this and write code which assumes PTA=0.

> +        } else {
> +
> +            if (cmd == DISCARD) {
> +                /* remove mapping from interrupt translation table */
> +                memset(buff, 0, sizeof(buff));
> +
> +                itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> +                itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
> +
> +                address_space_write(as, itt_addr + (eventid * sizeof(buff)),
> +                                    MEMTXATTRS_UNSPECIFIED, &buff,
> +                                    sizeof(buff));

Please abstract this out into a function so that the code dealing
with the format of the ITT is not mixed in with this function.

> +            }
> +        }
> +    }
> +
> +    if (cmd != NONE) {
> +        offset += NUM_BYTES_IN_DW;
> +        offset += NUM_BYTES_IN_DW;
> +    }
> +
> +    return res;
> +}
> +
> +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
> +                                    uint32_t offset, bool ignore_pInt)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint32_t devid, eventid;
> +    uint32_t pIntid = 0;
> +    uint32_t max_eventid, max_Intid;
> +    bool dte_valid;
> +    MemTxResult res = MEMTX_OK;
> +    uint16_t icid = 0;
> +    uint64_t dte = 0;
> +    uint64_t itt_addr;
> +    uint8_t buff[ITS_ITT_ENTRY_SIZE];
> +    uint32_t int_spurious = INTID_SPURIOUS;
> +
> +    devid = (value >> DEVID_OFFSET) & DEVID_MASK;
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    eventid = (value & EVENTID_MASK);
> +
> +    if (!ignore_pInt) {
> +        pIntid = (value >> pINTID_OFFSET) & pINTID_MASK;
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    icid = value & ICID_MASK;
> +
> +    dte = get_dte(s, devid);
> +    dte_valid = dte & VALID_MASK;
> +
> +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> +
> +    if (!ignore_pInt) {
> +        max_Intid = (1UL << (FIELD_EX64(s->typer, GITS_TYPER, IDBITS) + 1));
> +    }
> +
> +    if ((devid > s->dt.max_devids) || (icid > s->ct.max_collids) ||
> +            !dte_valid || (eventid > max_eventid) ||
> +            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START) ||
> +               (pIntid > max_Intid)))) {
> +        if (FIELD_EX64(s->typer, GITS_TYPER, SEIS)) {
> +            /*
> +             * Generate System Error here if supported
> +             * for each of the individual error cases
> +             */
> +        }
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: invalid interrupt translation table attributes "
> +            "devid %d or icid %d or eventid %d or pIntid %d\n",
> +            __func__, devid, icid, eventid, pIntid);
> +        /*
> +         * in this implementation,in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        /* add entry to interrupt translation table */
> +        memset(buff, 0, sizeof(buff));
> +        buff[0] = (dte_valid & VALID_MASK) | (GITS_TYPE_PHYSICAL << 1U);
> +        if (ignore_pInt) {
> +            memcpy(&buff[1], &eventid, 3);
> +        } else {
> +            memcpy(&buff[1], &pIntid, 3);
> +        }
> +        memcpy(&buff[4], &int_spurious, 3);
> +        memcpy(&buff[7], &icid, sizeof(icid));

Memcpy of host variables into guest memory isn't endian-agnostic.

> +
> +        itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> +        itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
> +
> +        address_space_write(as, itt_addr + (eventid * sizeof(buff)),
> +                    MEMTXATTRS_UNSPECIFIED, &buff,
> +                    sizeof(buff));

Again, abstract this out, please.

> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    return res;
> +}
> +
>  static void update_cte(GICv3ITSState *s, uint16_t icid, uint64_t cte)
>  {
>      AddressSpace *as = &s->gicv3->sysmem_as;
> @@ -239,7 +566,7 @@ static void update_dte(GICv3ITSState *s, uint32_t devid, uint64_t dte)
>  }
>
>  static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
> -                                 uint32_t offset)
> +                                  uint32_t offset)
>  {
>      AddressSpace *as = &s->gicv3->sysmem_as;
>      uint32_t devid;
> @@ -335,8 +662,10 @@ static MemTxResult process_cmdq(GICv3ITSState *s)
>
>          switch (cmd) {
>          case GITS_CMD_INT:
> +            res = process_int(s, data, cq_offset, INT);
>              break;
>          case GITS_CMD_CLEAR:
> +            res = process_int(s, data, cq_offset, CLEAR);
>              break;
>          case GITS_CMD_SYNC:
>              res = process_sync(s, cq_offset);
> @@ -348,10 +677,13 @@ static MemTxResult process_cmdq(GICv3ITSState *s)
>              res = process_mapc(s, cq_offset);
>              break;
>          case GITS_CMD_MAPTI:
> +            res = process_mapti(s, data, cq_offset, false);
>              break;
>          case GITS_CMD_MAPI:
> +            res = process_mapti(s, data, cq_offset, true);
>              break;
>          case GITS_CMD_DISCARD:
> +            res = process_int(s, data, cq_offset, DISCARD);
>              break;
>          default:
>              break;
> @@ -498,7 +830,20 @@ static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    uint32_t devid = 0;
>
> +    switch (offset) {
> +    case GITS_TRANSLATER:
> +        if (s->ctlr & ITS_CTLR_ENABLED) {
> +            s->translater = (value & 0x0000FFFFU);
> +            devid = attrs.requester_id;
> +            result = process_int(s, s->translater, devid, NONE);
> +        }
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>
> @@ -506,7 +851,20 @@ static MemTxResult its_trans_writel(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    uint32_t devid = 0;
>
> +    switch (offset) {
> +    case GITS_TRANSLATER:
> +        if (s->ctlr & ITS_CTLR_ENABLED) {
> +            s->translater = value;
> +            devid = attrs.requester_id;
> +            result = process_int(s, s->translater, devid, NONE);
> +        }
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 7e1ff426ef..e9f9aa6722 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -323,6 +323,13 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>  #define ITTADDR_MASK              ((1ULL << ITTADDR_LEN) - 1)
>  #define SIZE_MASK                 0x1f
>
> +/* MAPI command fields */
> +#define EVENTID_MASK              ((1ULL << 32) - 1)
> +
> +/* MAPTI command fields */
> +#define pINTID_OFFSET              32
> +#define pINTID_MASK               ((1ULL << 32) - 1)
> +
>  #define VALID_SHIFT               63
>  #define VALID_MASK                0x1
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index b0f2414fa3..3a710592a9 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -36,6 +36,8 @@
>  #define GICV3_MAXIRQ 1020
>  #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
>
> +#define GICV3_LPI_INTID_START 8192
> +
>  #define GICV3_REDIST_SIZE 0x20000
>
>  /* Number of SGI target-list bits */
> --
> 2.27.0

thanks
-- PMM

