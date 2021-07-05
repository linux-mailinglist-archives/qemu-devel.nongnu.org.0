Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D53BBE61
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:45:55 +0200 (CEST)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Pr8-0001xA-Ot
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PpZ-00011g-0w
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:44:17 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PpV-0005pH-HA
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:44:16 -0400
Received: by mail-ed1-x533.google.com with SMTP id s15so23910998edt.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPwFo/2zPkAmQglv9ku1AkUVn0IMy5q/b0MP61/jxX4=;
 b=Tu/ArOPcsUHTAFzVxATKj0n5iTDa29mqDH/Hf2wOLXTu2FIQyzaHWfE15FGi9rhEai
 /CUMPzjOJeoiO6X7jazxuH84PMTpJ93IH8CgfKoAmkJTxk6662qEPM7THdNmA93XecDk
 k+jS5INQTEDjqYkOjINqfwBlUnz6xmR1XDT1XM3WDzDXup9BAt8sTeNSLTLIGqVlkvTt
 fpRYnO5hbBpv0SVZtq7Ta/JCZyDKOpiOBbyCyfHMJQdPcmpDSLAOhd8as/v4ME9gVm/Q
 BuhwyoM43Fcead0kCFC2hcDdlV/1531Ui+3L4zBJeb9ahnyVK/53pCLlGxSzZgXRSM89
 MFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPwFo/2zPkAmQglv9ku1AkUVn0IMy5q/b0MP61/jxX4=;
 b=NZ97eqH0AC1LqGr+bDMAslu84RTH1iOM+EOvxH5xbITOYRaVakayaawV8qbMNN2PZ3
 LUmzNQD5jwvZa3520PPtlahf0wTce2pXviOdjFqQgONrlfEeeTQLIjiYpbUvU38UCiMK
 Ytj0TKS+ZOYOO6ccpLAR1jb0OsYZZyynBr9Ejb4kzTizS+hS9x3e98pMyse9wPJAsFrL
 x4OOuKvJZtF8essTmmhahpiro4L+X1YV4TCcpqGGea4GUEq9vSfUil2fwpw0OUVNWtNw
 kLTzxbrG1kk68lqtnNoM5H4pEfn3pN4m/sXy85HKrAALj+Pjl7CNSonOMmHGYc9JUusy
 pArQ==
X-Gm-Message-State: AOAM531Tjo6jsuonfNnsajorwhzp3QXo16NsXtosf4YK0jy85jd/fsM+
 OH0Lar9Cs2MazYs/3hYswwiD21Safbz45MhdITyPSg==
X-Google-Smtp-Source: ABdhPJyK5m+bCwnqTB+qXG7Gzeq9cszk2zCBcQ9swY1p3y8b792mD8qhVY8HjZITmJVrs8rHB882XgDP4quZuvcoOJM=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr16659401edz.36.1625496251566; 
 Mon, 05 Jul 2021 07:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-7-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-7-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:43:33 +0100
Message-ID: <CAFEAcA-OC2UHfYFwgvXhZmkLAa7fhjog9HPGJMgXDyeUp3-X6g@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Implemented lpi processing at redistributor to get lpi config info
> from lpi configuration table,determine priority,set pending state in
> lpi pending table and forward the lpi to cpuif.Added logic to invoke
> redistributor lpi processing with translated LPI which set/clear LPI
> from ITS device as part of ITS INT,CLEAR,DISCARD command and
> GITS_TRANSLATER processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3.c                |  14 +++
>  hw/intc/arm_gicv3_common.c         |   1 +
>  hw/intc/arm_gicv3_cpuif.c          |   7 +-
>  hw/intc/arm_gicv3_its.c            |  24 ++++-
>  hw/intc/arm_gicv3_redist.c         | 142 +++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h           |   8 ++
>  include/hw/intc/arm_gicv3_common.h |   7 ++
>  7 files changed, 197 insertions(+), 6 deletions(-)

> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index adaee72c1f..5adb55a01a 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -225,6 +225,7 @@ static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
>      bool ite_valid = false;
>      uint64_t cte = 0;
>      bool cte_valid = false;
> +    uint64_t rdbase;
>      IteEntry ite;
>
>      if (cmd == NONE) {
> @@ -282,10 +283,18 @@ static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
>           * command in the queue
>           */
>      } else {
> -        /*
> -         * Current implementation only supports rdbase == procnum
> -         * Hence rdbase physical address is ignored
> -         */

This change doesn't make us start handling the "is a physical address"
case, so why delete the comment?

> +        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
> +
> +        if (rdbase > s->gicv3->num_cpu) {
> +            return res;
> +        }
> +
> +        if ((cmd == CLEAR) || (cmd == DISCARD)) {
> +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
> +        } else {
> +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
> +        }
> +
>          if (cmd == DISCARD) {
>              memset(&ite, 0 , sizeof(ite));
>              /* remove mapping from interrupt translation table */
> @@ -672,6 +681,13 @@ static void process_cmdq(GICv3ITSState *s)
>              break;
>          case GITS_CMD_INV:
>          case GITS_CMD_INVALL:
> +            /*
> +             * Current implementation doesn't cache any ITS tables,
> +             * but the calculated lpi priority information.We only

Missing space after "."

> +             * need to trigger lpi priority re-calculation to be in
> +             * sync with LPI config table or pending table changes.
> +             */
> +            gicv3_redist_update_lpi(s->gicv3->cpu);

I think we need to recalculate for all redistributors, not just the first one.

>              break;
>          default:
>              break;
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index fc3d95dcc6..97553e6ada 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -254,6 +254,9 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>          if (cs->gicr_typer & GICR_TYPER_PLPIS) {
>              if (value & GICR_CTLR_ENABLE_LPIS) {
>                  cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> +                /* Check for any pending interr in pending table */
> +                gicv3_redist_update_lpi(cs);
> +                gicv3_redist_update(cs);
>              } else {
>                  cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
>              }
> @@ -532,6 +535,145 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>      return r;
>  }
>
> +static void gicv3_redist_check_lpi_priority(GICv3CPUState *cs, int irq)
> +{
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpict_baddr;
> +    uint8_t lpite;
> +    uint8_t prio;
> +
> +    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
> +
> +    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
> +                       sizeof(lpite)), MEMTXATTRS_UNSPECIFIED, &lpite,
> +                       sizeof(lpite));
> +
> +    if (!(lpite & LPI_CTE_ENABLED)) {
> +        return;
> +    }
> +
> +    if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
> +        prio = lpite & LPI_PRIORITY_MASK;
> +    } else {
> +        prio = ((lpite & LPI_PRIORITY_MASK) >> 1) & 0x80;

Need to OR with 0x80, not AND.

> +    }
> +
> +    if ((prio < cs->hpplpi.prio) ||
> +        ((prio == cs->hpplpi.prio) && (irq <= cs->hpplpi.irq))) {
> +        cs->hpplpi.irq = irq;
> +        cs->hpplpi.prio = prio;
> +        /* LPIs are always non-secure Grp1 interrupts */
> +        cs->hpplpi.grp = GICV3_G1NS;
> +    }
> +}
> +
> +void gicv3_redist_update_lpi(GICv3CPUState *cs)
> +{
> +    /*
> +     * This function scans the LPI pending table and for each pending
> +     * LPI, reads the corresponding entry from LPI configuration table
> +     * to extract the priority info and determine if the current LPI
> +     * priority is lower than the last computed high priority lpi interrupt.
> +     * If yes, replace current LPI as the new high priority lpi interrupt.
> +     */
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpipt_baddr;
> +    uint32_t pendt_size = 0;
> +    uint8_t pend;
> +    int i;
> +    uint64_t idbits;
> +
> +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> +                 GICD_TYPER_IDBITS);
> +
> +    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
> +        !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD)) {
> +        return;
> +    }
> +
> +    cs->hpplpi.prio = 0xff;
> +
> +    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
> +
> +    /* Determine the highest priority pending interrupt among LPIs */
> +    pendt_size = (1ULL << (idbits + 1));
> +
> +    for (i = 0; i < pendt_size / 8; i++) {
> +        address_space_read(as, lpipt_baddr +
> +                (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
> +                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> +        if (!((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend)) {
> +            continue;
> +        }
> +
> +        gicv3_redist_check_lpi_priority(cs, GICV3_LPI_INTID_START + i);
> +    }
> +}
> +
> +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
> +{
> +    /*
> +     * This function updates the pending bit in lpi pending table for
> +     * the irq being activated or deactivated.
> +     */
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpipt_baddr;
> +    bool ispend = false;
> +    uint8_t pend;
> +
> +    /*
> +     * get the bit value corresponding to this irq in the
> +     * lpi pending table
> +     */
> +    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
> +
> +    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                       MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> +    /*
> +     * check if this LPI is better than the current hpplpi, if yes
> +     * just set hpplpi.prio and .irq without doing a full rescan
> +     */
> +    if (level) {
> +        gicv3_redist_check_lpi_priority(cs, irq);
> +    }
> +
> +    ispend = extract32(pend, irq % 8, 1);
> +
> +    /* no change in the value of pending bit,return */

Missing space after comma.

> +    if (ispend == level) {
> +        return;
> +    }

I would put the "is the level same as it already was" check before
we go off and do the priority-check, not after. Then you can do all
the handling of "the level changed" at the end, with
 if (level) {
     gicv3_redist_check_lpi_priority(...);
 } else {
     gicv3_redist_update_lpi(...);
 }

Also, if this is a level == 0, you don't need to do the full rescan
of the LPI table unless the LPI being deactivated is the current
highest priority LPI.

> +    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
> +
> +    address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                        MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> +    if (!level) {
> +        gicv3_redist_update_lpi(cs);
> +    }
> +}
> +
> +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
> +{
> +    uint64_t idbits;
> +
> +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> +                 GICD_TYPER_IDBITS);
> +
> +    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
> +         !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) ||
> +         (irq > (1ULL << (idbits + 1)))) {
> +        return;
> +    }
> +
> +    /* set/clear the pending bit for this irq */
> +    gicv3_redist_lpi_pending(cs, irq, level);
> +
> +    gicv3_redist_update(cs);
> +}
> +
>  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
>  {
>      /* Update redistributor state for a change in an external PPI input line */
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 43ce4a8a95..c0ec1d9a66 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -308,6 +308,11 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>
>  #define L1TABLE_ENTRY_SIZE         8
>
> +#define LPI_CTE_ENABLED          TABLE_ENTRY_VALID_MASK
> +#define LPI_CTE_PRIORITY_OFFSET    2
> +#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)

These aren't using the standard naming convention (_SHIFT for the
bitshift, and the _MASK should be in-place, not in the ls bits).
But you don't use the defines anyway, so you could just not bother
defining them.

thanks
-- PMM

