Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B763A3801
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 01:40:36 +0200 (CEST)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrUHq-0005Tq-Rs
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 19:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lrUGb-0004Yb-Bw
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:39:17 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:44652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lrUGV-0005uL-5p
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:39:17 -0400
Received: by mail-qk1-x72d.google.com with SMTP id c18so14128941qkc.11
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=il4mGfa3ZlzXY9xugGQYUPPxm0UGOL9o7zhNdgGs9sI=;
 b=Czsn7kXycYNIYsUx0ZrP12pwWHOToG2SK+q6UPuLW+fqArWeZpHvEDrBD4goNc+mXU
 CO2Vf/DwLz9XIbdFnVAG1Vq7tIUWN/4QPQO7klLwwBA3L5gDmM980LNuwhXWKgNO4CY4
 LS3KotxFl3LG8c1A24JOxLL1vLhouYEZmSKA0NZx7+0jWDRlBLHpGhn0zvbThdypRDQa
 OB3cjLCgwiH0pEZ/soT9dG3GXzrMvwOnqeOVa2vAcbCtzhsm4aXEbYxvt3G6wNKhNZyG
 sgAEkTeZNCJffI/dUHCwYhJlBPP3Or4du3fe49a0o7cDiuFNUeBWWoJr/HY2KhgQ9wuq
 Mpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=il4mGfa3ZlzXY9xugGQYUPPxm0UGOL9o7zhNdgGs9sI=;
 b=e/mn89u2TeXnjECIjpM2WBVvqyf3FMp/8hLI2B2BEFpiS1J3+TVxX5Ec3mSWL5/FRU
 Y+LMEJ6kiY8tqbgTYjsC5mcUdzJyc55rQYhR6XptjilQDy3kOls4iUyD3YA9gJoJNrk1
 qpDae4l480jS6CRGJWewc4YxI7GZhdlcl9hc1KEs4De8WFIiSfASaG+R5ZXhemP8ag1V
 BBJ7TWJ4JiewepTnqsnRUuvAOtLbC0t77HbRbaUc6OcWqv6iuFeMmuZr2x7QoVAJCUu2
 Rr2jJMQvry77q9vOwb+E672/XZ0PNzNx1SoRevonofF4ypPt3TqiXwcqVrqLZP/EuCHF
 8aaQ==
X-Gm-Message-State: AOAM532QpK/LE8zLSLs/W6f7Ncagb+DOyeszGXcVcYHDhOunh5jCF6dH
 NUglImnmmbNUwoz5V7M4YpdR37Y9cFpePA==
X-Google-Smtp-Source: ABdhPJyeQl4na2nNT15NwXBQRJ7YQqmnd1BPQNbXwEDcofMPeqn3H84gLVZ8YQsMhtjTdm0OdfdXHw==
X-Received: by 2002:a37:a74b:: with SMTP id q72mr1167101qke.59.1623368349828; 
 Thu, 10 Jun 2021 16:39:09 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id e12sm3355432qtj.48.2021.06.10.16.39.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jun 2021 16:39:09 -0700 (PDT)
Date: Thu, 10 Jun 2021 19:39:05 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <551DAA51-CB17-423D-896F-AF0443A5E7AE@getmailspring.com>
In-Reply-To: <CAFEAcA-=w8WA5o-nnR4VuEDV28n65aCzM9M0Km8yTDGy=NHL+A@mail.gmail.com>
References: <CAFEAcA-=w8WA5o-nnR4VuEDV28n65aCzM9M0Km8yTDGy=NHL+A@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] hw/intc: GICv3 redistributor ITS processing
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="60c2a299_6f88f3ab_1571"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--60c2a299_6f88f3ab_1571
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Have addressed all comments except the ones with responses(inline) below:-

On Jun 8 2021, at 9:57 am, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> >
> > Implemented lpi processing at redistributor to get lpi config info
> > from lpi configuration table,determine priority,set pending state in
> > lpi pending table and forward the lpi to cpuif.Added logic to invoke
> > redistributor lpi processing with translated LPI which set/clear LPI
> > from ITS device as part of ITS INT,CLEAR,DISCARD command and
> > GITS_TRANSLATER processing.
> >
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> > hw/intc/arm_gicv3.c | 9 ++
> > hw/intc/arm_gicv3_common.c | 1 +
> > hw/intc/arm_gicv3_cpuif.c | 7 +-
> > hw/intc/arm_gicv3_its.c | 14 ++-
> > hw/intc/arm_gicv3_redist.c | 145 +++++++++++++++++++++++++++++
> > hw/intc/gicv3_internal.h | 10 ++
> > include/hw/intc/arm_gicv3_common.h | 10 ++
> > 7 files changed, 190 insertions(+), 6 deletions(-)
>
> The code for finding/updating the best pending LPI looks a lot
> better in this version -- thanks for working through that.
>
> An important thing which I hadn't realized previously:
> the hpplpi information counts as information cached from the
> LPI configuration tables (because it is based on the priority
> and enable-bit information from those tables). That means that when
> the guest sends the ITS INV or INVALL command we need to throw it
> away and recalculate by calling gicv3_redist_update_lpi().
> (The idea here is that the guest can validly raise the priority
> of an interrupt by the sequence "write to table; INVALL; SYNC",
> and we need to correctly figure out that that might mean that
> that LPI is now the interrupt we should be taking.)
>

> Agreed,will be implementing the INV/INVALL command processing in addition to existing ITS commands

> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index d63f8af604..4d19190b9c 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -165,6 +165,15 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
> cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
> }
>
> + if (cs->gic->lpi_enable && cs->lpivalid) {

You don't need a separate lpivalid flag -- you can use
hpplpi.prio == 0xff as your "no pending LPI" indication.
This is how the existing cs->hppi works.
(irqbetter() will always return false if passed an 0xff priority,
so you don't need to special case check anything here.)

> + if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
> + cs->hppi.irq = cs->hpplpi.irq;
> + cs->hppi.prio = cs->hpplpi.prio;
> + cs->hppi.grp = cs->hpplpi.grp;
> + seenbetter = true;
> + }
> + }
> +
> /* If the best interrupt we just found would preempt whatever
> * was the previous best interrupt before this update, then
> * we know it's definitely the best one now.
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 53dea2a775..223db16fec 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -435,6 +435,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
> memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
>
> cs->hppi.prio = 0xff;
> + cs->hpplpi.prio = 0xff;
>
> /* State in the CPU interface must *not* be reset here, because it
> * is part of the CPU's reset domain, not the GIC device's.
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 81f94c7f4a..5be3efaa3f 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -898,10 +898,12 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
> cs->gicr_iactiver0 = deposit32(cs->gicr_iactiver0, irq, 1, 1);
> cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
> gicv3_redist_update(cs);
> - } else {
> + } else if (irq < GICV3_LPI_INTID_START) {
> gicv3_gicd_active_set(cs->gic, irq);
> gicv3_gicd_pending_clear(cs->gic, irq);
> gicv3_update(cs->gic, irq, 1);
> + } else {
> + gicv3_redist_lpi_pending(cs, irq, 0);
> }
> }
>
> @@ -1317,7 +1319,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
> trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
> gicv3_redist_affid(cs), value);
>
> - if (irq >= cs->gic->num_irq) {
> + if ((irq >= cs->gic->num_irq) && (!(cs->gic->lpi_enable &&
> + (irq >= GICV3_LPI_INTID_START)))) {

Please put the line break after the first &&, not the second. That means
that you avoid linebreaking in the middle of a () expression.
Also you don't need the () on the outside of the !.

> /* This handles two cases:
> * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
> * to the GICC_EOIR, the GIC ignores that write.
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 0a978cf55b..e0fbd4041f 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -211,6 +211,7 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
> bool ite_valid = false;
> uint64_t cte = 0;
> bool cte_valid = false;
> + uint64_t rdbase;
> uint64_t itel = 0;
> uint32_t iteh = 0;
>
> @@ -267,10 +268,15 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
> * command in the queue
> */
> } else {
> - /*
> - * Current implementation only supports rdbase == procnum
> - * Hence rdbase physical address is ignored
> - */
> + rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
> + assert(rdbase <= s->gicv3->num_cpu);

We just read cte from guest memory. We mustn't allow guests to
trigger assert()s in QEMU, so if the value is out of range then
we need to handle it by treating the command as invalid, not by crashing.

Also, your bounds-check is off by one; it should be "<", not "<=".
> +
> + if ((cmd == CLEAR) || (cmd == DISCARD)) {
> + gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
> + } else {
> + gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
> + }
> +
> if (cmd == DISCARD) {
> /* remove mapping from interrupt translation table */
> res = update_ite(s, eventid, dte, itel, iteh);
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index fb9a4ee3cc..bfc6e4e9b9 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -255,6 +255,11 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
> if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> if (value & GICR_CTLR_ENABLE_LPIS) {
> cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> + /* Check for any pending interr in pending table */
> + cs->lpivalid = false;
> + cs->hpplpi.prio = 0xff;
> + gicv3_redist_update_lpi(cs);
> + gicv3_redist_update(cs);
> } else {
> cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> }
> @@ -534,6 +539,146 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
> return r;
> }
>
> +void gicv3_redist_update_lpi(GICv3CPUState *cs)
> +{
> + /*
> + * This function scans the LPI pending table and for each pending
> + * LPI, reads the corresponding entry from LPI configuration table
> + * to extract the priority info and determine if the LPI priority
> + * is lower than the current high priority interrupt.If yes, update

Missing space after ".".
> + * high priority pending interrupt to that of LPI.
> + */
> + AddressSpace *as = &cs->gic->dma_as;
> + uint64_t lpict_baddr, lpipt_baddr;
> + uint32_t pendt_size = 0;
> + uint8_t lpite;
> + uint8_t prio, pend;
> + int i;
> + uint64_t idbits;

You should set hpplpi.prio = 0xff; here, so you don't need to do
it at every callsite.

That is, what you're really doing in this function is "recalculate the
hpplpi information from scratch".

> +
> + idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> + GICD_TYPER_IDBITS);
> +
> + if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||

This is the set of missing brackets that clang complains about: it should
be "!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)" because ! has higher priority
than &.

> + !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD)) {
> + return;
> + }
> +
> + lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
> +
> + lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
> +
> + /* Determine the highest priority pending interrupt among LPIs */
> + pendt_size = (1ULL << (idbits + 1));
> +
> + for (i = 0; i < pendt_size / 8; i++) {
> + address_space_read(as, lpipt_baddr +
> + (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
> + MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> + if ((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend) {

Better written as "if (the pend bit is not set) continue;"
> + address_space_read(as, lpict_baddr + (i * sizeof(lpite)),
> + MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
> +
> + if (!(lpite & LPI_CTE_ENABLED)) {
> + continue;
> + }
> +
> + if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
> + prio = lpite & LPI_PRIORITY_MASK;
> + } else {
> + prio = lpite & LPI_SPRIORITY_MASK;

This isn't the right calculation. When reading a priority value
when GICD_CTLR.DS is zero, you need to shift it right by one
and set bit 7:
prio = ((lpite & LPI_PRIORITY_MASK) >> 1) & 0x80;

> + }
> +
> + if (prio <= cs->hpplpi.prio) {
> + cs->hpplpi.irq = GICV3_LPI_INTID_START + i;
> + cs->hpplpi.prio = prio;
> + /* LPIs are always non-secure Grp1 interrupts */
> + cs->hpplpi.grp = GICV3_G1NS;
> + cs->lpivalid = true;
> + }
> + }
> + }
> +}
> +
> +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
> +{
> + AddressSpace *as = &cs->gic->dma_as;
> + uint64_t lpipt_baddr;
> + bool ispend = false;
> + uint8_t pend;
> +
> + /*
> + * get the bit value corresponding to this irq in the
> + * lpi pending table
> + */
> + lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
> +
> + address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> + MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> + ispend = ((pend >> (irq % 8)) & 0x1);
> +
> + if (ispend) {
> + if (!level) {
> + /*
> + * clear the pending bit and update the lpi pending table
> + */
> + pend &= ~(1 << (irq % 8));
> +
> + address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> + MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> + }
> + } else {
> + if (level) {
> + /*
> + * if pending bit is not already set for this irq,turn-on the
> + * pending bit and update the lpi pending table
> + */
> + pend |= (1 << (irq % 8));
> +
> + address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> + MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> + }
> + }

You can simplify this code a bit:
address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
ispend = extract32(pend, irq % 8, 1);
if (ispend == level) {
return;
}
pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));

> + cs->lpivalid = false;
> + cs->hpplpi.prio = 0xff;
> + gicv3_redist_update_lpi(cs);

You can avoid doing a full update a lot of the time:
* if this LPI is worse than the current value in hpplpi
(where by "worse" I mean lower-priority by the same kind of
comparison irqbetter() does) then we haven't changed the best-available
pending LPI, so we don't need to do an update
* if we set the pending bit to 1 and the LPI is enabled and the priority
of this LPI is better than the current hpplpi, then we know this LPI
is now the best, so we can just set hpplpi.prio and .irq without
doing a full rescan
* if we didn't actually change the value of the pending bit, we
don't need to do an update (you get this for free if you take the
simplification suggestion I make above, which does an early-return
in the "no change" case)

> Accepted the code simplification,but by not calling gicv3_redist_update_lpi(cs) here ,the scenario of an activated LPI fails because
this LPI's priority (which could be lower than current hpplpi) is never checked/updated and gicv3_redist_update_noirqset() fails to present a valid active high priority LPI(if applicable) to the cpu,since it is always checking against a stale hpplpi info.
Have confirmed this with the kvm-unit-tests as well,wherein the LPIs are never processed and test cases fail.

> +}
> +
> +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
> +{
> + AddressSpace *as = &cs->gic->dma_as;
> + uint64_t lpict_baddr;
> + uint8_t lpite;
> + uint64_t idbits;
> +
> + idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> + GICD_TYPER_IDBITS);
> +
> + if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||

This is the other set of missing brackets that clang complains about.
> + !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) ||
> + (irq > (1ULL << (idbits + 1)))) {
> + return;
> + }
> +
> + lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
> +
> + /* get the lpi config table entry corresponding to this irq */
> + address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
> + sizeof(lpite)), MEMTXATTRS_UNSPECIFIED,
> + &lpite, sizeof(lpite));
> +
> + /* check if this irq is enabled before proceeding further */
> + if (!(lpite & LPI_CTE_ENABLED)) {
> + return;
> + }

I don't think you need to make this check -- you can just set/clear
the pending status of the LPI. If the LPI is not enabled then it will
be ignored by gicv3_redist_update_lpi(). This is how non-LPI interrupts
work and I think that LPIs behave the same way. (But it's a big spec,
so I might have missed something -- if I'm wrong, please say so.)

> +
> + /* set/clear the pending bit for this irq */
> + gicv3_redist_lpi_pending(cs, irq, level);
> +
> + gicv3_redist_update(cs);
> +}
> +
> void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
> {
> /* Update redistributor state for a change in an external PPI input line */
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 91dbe01176..bcbccba573 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -308,6 +308,13 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>
> #define L1TABLE_ENTRY_SIZE 8
>
> +#define LPI_CTE_ENABLE_OFFSET 0
> +#define LPI_CTE_ENABLED VALID_MASK
> +#define LPI_CTE_PRIORITY_OFFSET 2
> +#define LPI_CTE_PRIORITY_MASK ((1U << 6) - 1)
> +#define LPI_PRIORITY_MASK 0xfc
> +#define LPI_SPRIORITY_MASK 0x7e
> +
> #define GITS_CMDQ_ENTRY_SIZE 32
> #define NUM_BYTES_IN_DW 8
>
> @@ -452,6 +459,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
> unsigned size, MemTxAttrs attrs);
> void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
> void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
> +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
> +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
> +void gicv3_redist_update_lpi(GICv3CPUState *cs);
> void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
> void gicv3_init_cpuif(GICv3State *s);
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index c1348cc60a..5d839da9c9 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -204,6 +204,16 @@ struct GICv3CPUState {
> * real state above; it doesn't need to be migrated.
> */
> PendingIrq hppi;
> +
> + /*
> + * Current highest priority pending lpi for this CPU.
> + * This is cached information that can be recalculated from the
> + * real state above; it doesn't need to be migrated.

This comment is true for hppi, but not for hpplpi. For hpplpi
it is "cached information that can be recalculated from the LPI
tables in guest memory".

This means that we need either to:
(1) call gicv3_redist_update_lpi() in an appropriate post-load function
so that the field gets re-calculated on the destination end of a migration
(2) migrate the hpplpi fields

Option 1 is what we do for hppi: arm_gicv3_post_load() calls
gicv3_full_update_noirqset(), which does a full recalculation of the
GIC state. Calling gicv3_redist_update_lpi() in arm_gicv3_post_load()
before it calls gicv3_full_update_noirqset() is probably the best thing.

> + */
> + PendingIrq hpplpi;
> +
> + bool lpivalid; /* current highest priority lpi validity status */
> +
> /* This is temporary working state, to avoid a malloc in gicv3_update() */
> bool seenbetter;
> };
> --
> 2.27.0
>

thanks
-- PMM


--60c2a299_6f88f3ab_1571
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Have addressed all comments except the ones with responses(inline) b=
elow<span data-emoji-typing=3D=22true=22>:-</span></div><br><div class=3D=
=22gmail=5Fquote=5Fattribution=22>On Jun 8 2021, at 9:57 am, Peter Maydel=
l &lt;peter.maydell=40linaro.org&gt; wrote:</div><blockquote><div><div>On=
 Wed, 2 Jun 2021 at 19:00, Shashi Mallela &lt;shashi.mallela=40linaro.org=
&gt; wrote:</div><div>&gt;</div><div>&gt; Implemented lpi processing at r=
edistributor to get lpi config info</div><div>&gt; from lpi configuration=
 table,determine priority,set pending state in</div><div>&gt; lpi pending=
 table and forward the lpi to cpuif.Added logic to invoke</div><div>&gt; =
redistributor lpi processing with translated LPI which set/clear LPI</div=
><div>&gt; from ITS device as part of ITS INT,CLEAR,DISCARD command and</=
div><div>&gt; GITS=5FTRANSLATER processing.</div><div>&gt;</div><div>&gt;=
 Signed-off-by: Shashi Mallela &lt;shashi.mallela=40linaro.org&gt;</div><=
div>&gt; ---</div><div>&gt; hw/intc/arm=5Fgicv3.c =7C 9 ++</div><div>&gt;=
 hw/intc/arm=5Fgicv3=5Fcommon.c =7C 1 +</div><div>&gt; hw/intc/arm=5Fgicv=
3=5Fcpuif.c =7C 7 +-</div><div>&gt; hw/intc/arm=5Fgicv3=5Fits.c =7C 14 ++=
-</div><div>&gt; hw/intc/arm=5Fgicv3=5Fredist.c =7C 145 +++++++++++++++++=
++++++++++++</div><div>&gt; hw/intc/gicv3=5Finternal.h =7C 10 ++</div><di=
v>&gt; include/hw/intc/arm=5Fgicv3=5Fcommon.h =7C 10 ++</div><div>&gt; 7 =
files changed, 190 insertions(+), 6 deletions(-)</div><br><div>The code f=
or finding/updating the best pending LPI looks a lot</div><div>better in =
this version -- thanks for working through that.</div><br><div>An importa=
nt thing which I hadn't realized previously:</div><div>the hpplpi informa=
tion counts as information cached from the</div><div>LPI configuration ta=
bles (because it is based on the priority</div><div>and enable-bit inform=
ation from those tables). That means that when</div><div>the guest sends =
the ITS INV or INVALL command we need to throw it</div><div>away and reca=
lculate by calling gicv3=5Fredist=5Fupdate=5Flpi().</div><div>(The idea h=
ere is that the guest can validly raise the priority</div><div>of an inte=
rrupt by the sequence =22write to table; INVALL; SYNC=22,</div><div>and w=
e need to correctly figure out that that might mean that</div><div>that L=
PI is now the interrupt we should be taking.)</div></div></blockquote><di=
v><div>&nbsp;&gt; Agreed,will be implementing the INV/INVALL command proc=
essing in addition to existing ITS commands</div><br><div>&gt; diff --git=
 a/hw/intc/arm=5Fgicv3.c b/hw/intc/arm=5Fgicv3.c</div><div>&gt; index d63=
f8af604..4d19190b9c 100644</div><div>&gt; --- a/hw/intc/arm=5Fgicv3.c</di=
v><div>&gt; +++ b/hw/intc/arm=5Fgicv3.c</div><div>&gt; =40=40 -165,6 +165=
,15 =40=40 static void gicv3=5Fredist=5Fupdate=5Fnoirqset(GICv3CPUState *=
cs)</div><div>&gt; cs-&gt;hppi.grp =3D gicv3=5Firq=5Fgroup(cs-&gt;gic, cs=
, cs-&gt;hppi.irq);</div><div>&gt; =7D</div><div>&gt;</div><div>&gt; + if=
 (cs-&gt;gic-&gt;lpi=5Fenable &amp;&amp; cs-&gt;lpivalid) =7B</div><br><d=
iv>You don't need a separate lpivalid flag -- you can use</div><div>hpplp=
i.prio =3D=3D 0xff as your =22no pending LPI=22 indication.</div><div>Thi=
s is how the existing cs-&gt;hppi works.</div><div>(irqbetter() will alwa=
ys return false if passed an 0xff priority,</div><div>so you don't need t=
o special case check anything here.)</div><br><div>&gt; + if (irqbetter(c=
s, cs-&gt;hpplpi.irq, cs-&gt;hpplpi.prio)) =7B</div><div>&gt; + cs-&gt;hp=
pi.irq =3D cs-&gt;hpplpi.irq;</div><div>&gt; + cs-&gt;hppi.prio =3D cs-&g=
t;hpplpi.prio;</div><div>&gt; + cs-&gt;hppi.grp =3D cs-&gt;hpplpi.grp;</d=
iv><div>&gt; + seenbetter =3D true;</div><div>&gt; + =7D</div><div>&gt; +=
 =7D</div><div>&gt; +</div><div>&gt; /* If the best interrupt we just fou=
nd would preempt whatever</div><div>&gt; * was the previous best interrup=
t before this update, then</div><div>&gt; * we know it's definitely the b=
est one now.</div><div>&gt; diff --git a/hw/intc/arm=5Fgicv3=5Fcommon.c b=
/hw/intc/arm=5Fgicv3=5Fcommon.c</div><div>&gt; index 53dea2a775..223db16f=
ec 100644</div><div>&gt; --- a/hw/intc/arm=5Fgicv3=5Fcommon.c</div><div>&=
gt; +++ b/hw/intc/arm=5Fgicv3=5Fcommon.c</div><div>&gt; =40=40 -435,6 +43=
5,7 =40=40 static void arm=5Fgicv3=5Fcommon=5Freset(DeviceState *dev)</di=
v><div>&gt; memset(cs-&gt;gicr=5Fipriorityr, 0, sizeof(cs-&gt;gicr=5Fipri=
orityr));</div><div>&gt;</div><div>&gt; cs-&gt;hppi.prio =3D 0xff;</div><=
div>&gt; + cs-&gt;hpplpi.prio =3D 0xff;</div><div>&gt;</div><div>&gt; /* =
State in the CPU interface must *not* be reset here, because it</div><div=
>&gt; * is part of the CPU's reset domain, not the GIC device's.</div><di=
v>&gt; diff --git a/hw/intc/arm=5Fgicv3=5Fcpuif.c b/hw/intc/arm=5Fgicv3=5F=
cpuif.c</div><div>&gt; index 81f94c7f4a..5be3efaa3f 100644</div><div>&gt;=
 --- a/hw/intc/arm=5Fgicv3=5Fcpuif.c</div><div>&gt; +++ b/hw/intc/arm=5Fg=
icv3=5Fcpuif.c</div><div>&gt; =40=40 -898,10 +898,12 =40=40 static void i=
cc=5Factivate=5Firq(GICv3CPUState *cs, int irq)</div><div>&gt; cs-&gt;gic=
r=5Fiactiver0 =3D deposit32(cs-&gt;gicr=5Fiactiver0, irq, 1, 1);</div><di=
v>&gt; cs-&gt;gicr=5Fipendr0 =3D deposit32(cs-&gt;gicr=5Fipendr0, irq, 1,=
 0);</div><div>&gt; gicv3=5Fredist=5Fupdate(cs);</div><div>&gt; - =7D els=
e =7B</div><div>&gt; + =7D else if (irq &lt; GICV3=5FLPI=5FINTID=5FSTART)=
 =7B</div><div>&gt; gicv3=5Fgicd=5Factive=5Fset(cs-&gt;gic, irq);</div><d=
iv>&gt; gicv3=5Fgicd=5Fpending=5Fclear(cs-&gt;gic, irq);</div><div>&gt; g=
icv3=5Fupdate(cs-&gt;gic, irq, 1);</div><div>&gt; + =7D else =7B</div><di=
v>&gt; + gicv3=5Fredist=5Flpi=5Fpending(cs, irq, 0);</div><div>&gt; =7D</=
div><div>&gt; =7D</div><div>&gt;</div><div>&gt; =40=40 -1317,7 +1319,8 =40=
=40 static void icc=5Feoir=5Fwrite(CPUARMState *env, const ARMCPRegInfo *=
ri,</div><div>&gt; trace=5Fgicv3=5Ficc=5Feoir=5Fwrite(is=5Feoir0 =3F 0 : =
1,</div><div>&gt; gicv3=5Fredist=5Faffid(cs), value);</div><div>&gt;</div=
><div>&gt; - if (irq &gt;=3D cs-&gt;gic-&gt;num=5Firq) =7B</div><div>&gt;=
 + if ((irq &gt;=3D cs-&gt;gic-&gt;num=5Firq) &amp;&amp; (=21(cs-&gt;gic-=
&gt;lpi=5Fenable &amp;&amp;</div><div>&gt; + (irq &gt;=3D GICV3=5FLPI=5FI=
NTID=5FSTART)))) =7B</div><br><div>Please put the line break after the fi=
rst &amp;&amp;, not the second. That means</div><div>that you avoid lineb=
reaking in the middle of a () expression.</div><div>Also you don't need t=
he () on the outside of the =21.</div><br><div>&gt; /* This handles two c=
ases:</div><div>&gt; * 1. If software writes the ID of a spurious interru=
pt =5Bie 1020-1023=5D</div><div>&gt; * to the GICC=5FEOIR, the GIC ignore=
s that write.</div><div>&gt; diff --git a/hw/intc/arm=5Fgicv3=5Fits.c b/h=
w/intc/arm=5Fgicv3=5Fits.c</div><div>&gt; index 0a978cf55b..e0fbd4041f 10=
0644</div><div>&gt; --- a/hw/intc/arm=5Fgicv3=5Fits.c</div><div>&gt; +++ =
b/hw/intc/arm=5Fgicv3=5Fits.c</div><div>&gt; =40=40 -211,6 +211,7 =40=40 =
static MemTxResult process=5Fint(GICv3ITSState *s, uint64=5Ft value,</div=
><div>&gt; bool ite=5Fvalid =3D false;</div><div>&gt; uint64=5Ft cte =3D =
0;</div><div>&gt; bool cte=5Fvalid =3D false;</div><div>&gt; + uint64=5Ft=
 rdbase;</div><div>&gt; uint64=5Ft itel =3D 0;</div><div>&gt; uint32=5Ft =
iteh =3D 0;</div><div>&gt;</div><div>&gt; =40=40 -267,10 +268,15 =40=40 s=
tatic MemTxResult process=5Fint(GICv3ITSState *s, uint64=5Ft value,</div>=
<div>&gt; * command in the queue</div><div>&gt; */</div><div>&gt; =7D els=
e =7B</div><div>&gt; - /*</div><div>&gt; - * Current implementation only =
supports rdbase =3D=3D procnum</div><div>&gt; - * Hence rdbase physical a=
ddress is ignored</div><div>&gt; - */</div><div>&gt; + rdbase =3D (cte &g=
t;&gt; 1U) &amp; RDBASE=5FPROCNUM=5FMASK;</div><div>&gt; + assert(rdbase =
&lt;=3D s-&gt;gicv3-&gt;num=5Fcpu);</div><br><div>We just read cte from g=
uest memory. We mustn't allow guests to</div><div>trigger assert()s in QE=
MU, so if the value is out of range then</div><div>we need to handle it b=
y treating the command as invalid, not by crashing.</div><br><div>Also, y=
our bounds-check is off by one; it should be =22&lt;=22, not =22&lt;=3D=22=
.</div><br><div>&gt; +</div><div>&gt; + if ((cmd =3D=3D CLEAR) =7C=7C (cm=
d =3D=3D DISCARD)) =7B</div><div>&gt; + gicv3=5Fredist=5Fprocess=5Flpi(&a=
mp;s-&gt;gicv3-&gt;cpu=5Brdbase=5D, pIntid, 0);</div><div>&gt; + =7D else=
 =7B</div><div>&gt; + gicv3=5Fredist=5Fprocess=5Flpi(&amp;s-&gt;gicv3-&gt=
;cpu=5Brdbase=5D, pIntid, 1);</div><div>&gt; + =7D</div><div>&gt; +</div>=
<div>&gt; if (cmd =3D=3D DISCARD) =7B</div><div>&gt; /* remove mapping fr=
om interrupt translation table */</div><div>&gt; res =3D update=5Fite(s, =
eventid, dte, itel, iteh);</div><div>&gt; diff --git a/hw/intc/arm=5Fgicv=
3=5Fredist.c b/hw/intc/arm=5Fgicv3=5Fredist.c</div><div>&gt; index fb9a4e=
e3cc..bfc6e4e9b9 100644</div><div>&gt; --- a/hw/intc/arm=5Fgicv3=5Fredist=
.c</div><div>&gt; +++ b/hw/intc/arm=5Fgicv3=5Fredist.c</div><div>&gt; =40=
=40 -255,6 +255,11 =40=40 static MemTxResult gicr=5Fwritel(GICv3CPUState =
*cs, hwaddr offset,</div><div>&gt; if (cs-&gt;gicr=5Ftyper &amp; GICR=5FT=
YPER=5FPLPIS) =7B</div><div>&gt; if (value &amp; GICR=5FCTLR=5FENABLE=5FL=
PIS) =7B</div><div>&gt; cs-&gt;gicr=5Fctlr =7C=3D GICR=5FCTLR=5FENABLE=5F=
LPIS;</div><div>&gt; + /* Check for any pending interr in pending table *=
/</div><div>&gt; + cs-&gt;lpivalid =3D false;</div><div>&gt; + cs-&gt;hpp=
lpi.prio =3D 0xff;</div><div>&gt; + gicv3=5Fredist=5Fupdate=5Flpi(cs);</d=
iv><div>&gt; + gicv3=5Fredist=5Fupdate(cs);</div><div>&gt; =7D else =7B</=
div><div>&gt; cs-&gt;gicr=5Fctlr &amp;=3D =7EGICR=5FCTLR=5FENABLE=5FLPIS;=
</div><div>&gt; =7D</div><div>&gt; =40=40 -534,6 +539,146 =40=40 MemTxRes=
ult gicv3=5Fredist=5Fwrite(void *opaque, hwaddr offset, uint64=5Ft data,<=
/div><div>&gt; return r;</div><div>&gt; =7D</div><div>&gt;</div><div>&gt;=
 +void gicv3=5Fredist=5Fupdate=5Flpi(GICv3CPUState *cs)</div><div>&gt; +=7B=
</div><div>&gt; + /*</div><div>&gt; + * This function scans the LPI pendi=
ng table and for each pending</div><div>&gt; + * LPI, reads the correspon=
ding entry from LPI configuration table</div><div>&gt; + * to extract the=
 priority info and determine if the LPI priority</div><div>&gt; + * is lo=
wer than the current high priority interrupt.If yes, update</div><br><div=
>Missing space after =22.=22.</div><br><div>&gt; + * high priority pendin=
g interrupt to that of LPI.</div><div>&gt; + */</div><div>&gt; + AddressS=
pace *as =3D &amp;cs-&gt;gic-&gt;dma=5Fas;</div><div>&gt; + uint64=5Ft lp=
ict=5Fbaddr, lpipt=5Fbaddr;</div><div>&gt; + uint32=5Ft pendt=5Fsize =3D =
0;</div><div>&gt; + uint8=5Ft lpite;</div><div>&gt; + uint8=5Ft prio, pen=
d;</div><div>&gt; + int i;</div><div>&gt; + uint64=5Ft idbits;</div><br><=
div>You should set hpplpi.prio =3D 0xff; here, so you don't need to do</d=
iv><div>it at every callsite.</div><br><div>That is, what you're really d=
oing in this function is =22recalculate the</div><div>hpplpi information =
from scratch=22.</div><br><div>&gt; +</div><div>&gt; + idbits =3D MIN(=46=
IELD=5FEX64(cs-&gt;gicr=5Fpropbaser, GICR=5FPROPBASER, IDBITS),</div><div=
>&gt; + GICD=5FTYPER=5FIDBITS);</div><div>&gt; +</div><div>&gt; + if ((=21=
cs-&gt;gicr=5Fctlr &amp; GICR=5FCTLR=5FENABLE=5FLPIS) =7C=7C =21cs-&gt;gi=
cr=5Fpropbaser =7C=7C</div><br><div>This is the set of missing brackets t=
hat clang complains about: it should</div><div>be =22=21(cs-&gt;gicr=5Fct=
lr &amp; GICR=5FCTLR=5FENABLE=5FLPIS)=22 because =21 has higher priority<=
/div><div>than &amp;.</div><br><div>&gt; + =21cs-&gt;gicr=5Fpendbaser =7C=
=7C (idbits &lt; GICR=5FPROPBASER=5FIDBITS=5FTHRESHOLD)) =7B</div><div>&g=
t; + return;</div><div>&gt; + =7D</div><div>&gt; +</div><div>&gt; + lpict=
=5Fbaddr =3D cs-&gt;gicr=5Fpropbaser &amp; R=5FGICR=5FPROPBASER=5FPHYADDR=
=5FMASK;</div><div>&gt; +</div><div>&gt; + lpipt=5Fbaddr =3D cs-&gt;gicr=5F=
pendbaser &amp; R=5FGICR=5FPENDBASER=5FPHYADDR=5FMASK;</div><div>&gt; +</=
div><div>&gt; + /* Determine the highest priority pending interrupt among=
 LPIs */</div><div>&gt; + pendt=5Fsize =3D (1ULL &lt;&lt; (idbits + 1));<=
/div><div>&gt; +</div><div>&gt; + for (i =3D 0; i &lt; pendt=5Fsize / 8; =
i++) =7B</div><div>&gt; + address=5Fspace=5Fread(as, lpipt=5Fbaddr +</div=
><div>&gt; + (((GICV3=5FLPI=5FINTID=5FSTART + i) / 8) * sizeof(pend)),</d=
iv><div>&gt; + MEMTXATTRS=5FUNSPECI=46IED, &amp;pend, sizeof(pend));</div=
><div>&gt; +</div><div>&gt; + if ((1 &lt;&lt; ((GICV3=5FLPI=5FINTID=5FSTA=
RT + i) % 8)) &amp; pend) =7B</div><br><div>Better written as =22if (the =
pend bit is not set) continue;=22</div><br><div>&gt; + address=5Fspace=5F=
read(as, lpict=5Fbaddr + (i * sizeof(lpite)),</div><div>&gt; + MEMTXATTRS=
=5FUNSPECI=46IED, &amp;lpite, sizeof(lpite));</div><div>&gt; +</div><div>=
&gt; + if (=21(lpite &amp; LPI=5FCTE=5FENABLED)) =7B</div><div>&gt; + con=
tinue;</div><div>&gt; + =7D</div><div>&gt; +</div><div>&gt; + if (cs-&gt;=
gic-&gt;gicd=5Fctlr &amp; GICD=5FCTLR=5FDS) =7B</div><div>&gt; + prio =3D=
 lpite &amp; LPI=5FPRIORITY=5FMASK;</div><div>&gt; + =7D else =7B</div><d=
iv>&gt; + prio =3D lpite &amp; LPI=5FSPRIORITY=5FMASK;</div><br><div>This=
 isn't the right calculation. When reading a priority value</div><div>whe=
n GICD=5FCTLR.DS is zero, you need to shift it right by one</div><div>and=
 set bit 7:</div><div>prio =3D ((lpite &amp; LPI=5FPRIORITY=5FMASK) &gt;&=
gt; 1) &amp; 0x80;</div><br><div>&gt; + =7D</div><div>&gt; +</div><div>&g=
t; + if (prio &lt;=3D cs-&gt;hpplpi.prio) =7B</div><div>&gt; + cs-&gt;hpp=
lpi.irq =3D GICV3=5FLPI=5FINTID=5FSTART + i;</div><div>&gt; + cs-&gt;hppl=
pi.prio =3D prio;</div><div>&gt; + /* LPIs are always non-secure Grp1 int=
errupts */</div><div>&gt; + cs-&gt;hpplpi.grp =3D GICV3=5FG1NS;</div><div=
>&gt; + cs-&gt;lpivalid =3D true;</div><div>&gt; + =7D</div><div>&gt; + =7D=
</div><div>&gt; + =7D</div><div>&gt; +=7D</div><div>&gt; +</div><div>&gt;=
 +void gicv3=5Fredist=5Flpi=5Fpending(GICv3CPUState *cs, int irq, int lev=
el)</div><div>&gt; +=7B</div><div>&gt; + AddressSpace *as =3D &amp;cs-&gt=
;gic-&gt;dma=5Fas;</div><div>&gt; + uint64=5Ft lpipt=5Fbaddr;</div><div>&=
gt; + bool ispend =3D false;</div><div>&gt; + uint8=5Ft pend;</div><div>&=
gt; +</div><div>&gt; + /*</div><div>&gt; + * get the bit value correspond=
ing to this irq in the</div><div>&gt; + * lpi pending table</div><div>&gt=
; + */</div><div>&gt; + lpipt=5Fbaddr =3D cs-&gt;gicr=5Fpendbaser &amp; R=
=5FGICR=5FPENDBASER=5FPHYADDR=5FMASK;</div><div>&gt; +</div><div>&gt; + a=
ddress=5Fspace=5Fread(as, lpipt=5Fbaddr + ((irq / 8) * sizeof(pend)),</di=
v><div>&gt; + MEMTXATTRS=5FUNSPECI=46IED, &amp;pend, sizeof(pend));</div>=
<div>&gt; + ispend =3D ((pend &gt;&gt; (irq % 8)) &amp; 0x1);</div><div>&=
gt; +</div><div>&gt; + if (ispend) =7B</div><div>&gt; + if (=21level) =7B=
</div><div>&gt; + /*</div><div>&gt; + * clear the pending bit and update =
the lpi pending table</div><div>&gt; + */</div><div>&gt; + pend &amp;=3D =
=7E(1 &lt;&lt; (irq % 8));</div><div>&gt; +</div><div>&gt; + address=5Fsp=
ace=5Fwrite(as, lpipt=5Fbaddr + ((irq / 8) * sizeof(pend)),</div><div>&gt=
; + MEMTXATTRS=5FUNSPECI=46IED, &amp;pend, sizeof(pend));</div><div>&gt; =
+ =7D</div><div>&gt; + =7D else =7B</div><div>&gt; + if (level) =7B</div>=
<div>&gt; + /*</div><div>&gt; + * if pending bit is not already set for t=
his irq,turn-on the</div><div>&gt; + * pending bit and update the lpi pen=
ding table</div><div>&gt; + */</div><div>&gt; + pend =7C=3D (1 &lt;&lt; (=
irq % 8));</div><div>&gt; +</div><div>&gt; + address=5Fspace=5Fwrite(as, =
lpipt=5Fbaddr + ((irq / 8) * sizeof(pend)),</div><div>&gt; + MEMTXATTRS=5F=
UNSPECI=46IED, &amp;pend, sizeof(pend));</div><div>&gt; + =7D</div><div>&=
gt; + =7D</div><br><div>You can simplify this code a bit:</div><br><div>a=
ddress=5Fspace=5Fread(as, lpipt=5Fbaddr + ((irq / 8) * sizeof(pend)),</di=
v><div>MEMTXATTRS=5FUNSPECI=46IED, &amp;pend, sizeof(pend));</div><div>is=
pend =3D extract32(pend, irq % 8, 1);</div><div>if (ispend =3D=3D level) =
=7B</div><div>return;</div><div>=7D</div><div>pend =3D deposit32(pend, ir=
q % 8, 1, level =3F 1 : 0);</div><div>address=5Fspace=5Fwrite(as, lpipt=5F=
baddr + ((irq / 8) * sizeof(pend)),</div><div>MEMTXATTRS=5FUNSPECI=46IED,=
 &amp;pend, sizeof(pend));</div><br><br><div>&gt; + cs-&gt;lpivalid =3D f=
alse;</div><div>&gt; + cs-&gt;hpplpi.prio =3D 0xff;</div><div>&gt; + gicv=
3=5Fredist=5Fupdate=5Flpi(cs);</div><br><div>You can avoid doing a full u=
pdate a lot of the time:</div><div>* if this LPI is worse than the curren=
t value in hpplpi</div><div>(where by =22worse=22 I mean lower-priority b=
y the same kind of</div><div>comparison irqbetter() does) then we haven't=
 changed the best-available</div><div>pending LPI, so we don't need to do=
 an update</div><div>* if we set the pending bit to 1 and the LPI is enab=
led and the priority</div><div>of this LPI is better than the current hpp=
lpi, then we know this LPI</div><div>is now the best, so we can just set =
hpplpi.prio and .irq without</div><div>doing a full rescan</div><div>* if=
 we didn't actually change the value of the pending bit, we</div><div>don=
't need to do an update (you get this for free if you take the</div><div>=
simplification suggestion I make above, which does an early-return</div><=
div>in the =22no change=22 case)</div><br><div>&gt; Accepted the code sim=
plification,but by not calling gicv3=5Fredist=5Fupdate=5Flpi(cs) here ,th=
e scenario of an activated LPI fails because</div><div>this LPI's priorit=
y (which could be lower than current hpplpi) is never checked/updated and=
 gicv3=5Fredist=5Fupdate=5Fnoirqset() fails to present a valid active hig=
h priority LPI(if applicable) to the cpu,since it is always checking agai=
nst a stale hpplpi info.</div><div>Have confirmed this with the kvm-unit-=
tests as well,wherein the LPIs are never processed and test cases fail.</=
div><br><div>&gt; +=7D</div><div>&gt; +</div><div>&gt; +void gicv3=5Fredi=
st=5Fprocess=5Flpi(GICv3CPUState *cs, int irq, int level)</div><div>&gt; =
+=7B</div><div>&gt; + AddressSpace *as =3D &amp;cs-&gt;gic-&gt;dma=5Fas;<=
/div><div>&gt; + uint64=5Ft lpict=5Fbaddr;</div><div>&gt; + uint8=5Ft lpi=
te;</div><div>&gt; + uint64=5Ft idbits;</div><div>&gt; +</div><div>&gt; +=
 idbits =3D MIN(=46IELD=5FEX64(cs-&gt;gicr=5Fpropbaser, GICR=5FPROPBASER,=
 IDBITS),</div><div>&gt; + GICD=5FTYPER=5FIDBITS);</div><div>&gt; +</div>=
<div>&gt; + if ((=21cs-&gt;gicr=5Fctlr &amp; GICR=5FCTLR=5FENABLE=5FLPIS)=
 =7C=7C =21cs-&gt;gicr=5Fpropbaser =7C=7C</div><br><div>This is the other=
 set of missing brackets that clang complains about.</div><br><div>&gt; +=
 =21cs-&gt;gicr=5Fpendbaser =7C=7C (idbits &lt; GICR=5FPROPBASER=5FIDBITS=
=5FTHRESHOLD) =7C=7C</div><div>&gt; + (irq &gt; (1ULL &lt;&lt; (idbits + =
1)))) =7B</div><div>&gt; + return;</div><div>&gt; + =7D</div><div>&gt; +<=
/div><div>&gt; + lpict=5Fbaddr =3D cs-&gt;gicr=5Fpropbaser &amp; R=5FGICR=
=5FPROPBASER=5FPHYADDR=5FMASK;</div><div>&gt; +</div><div>&gt; + /* get t=
he lpi config table entry corresponding to this irq */</div><div>&gt; + a=
ddress=5Fspace=5Fread(as, lpict=5Fbaddr + ((irq - GICV3=5FLPI=5FINTID=5FS=
TART) *</div><div>&gt; + sizeof(lpite)), MEMTXATTRS=5FUNSPECI=46IED,</div=
><div>&gt; + &amp;lpite, sizeof(lpite));</div><div>&gt; +</div><div>&gt; =
+ /* check if this irq is enabled before proceeding further */</div><div>=
&gt; + if (=21(lpite &amp; LPI=5FCTE=5FENABLED)) =7B</div><div>&gt; + ret=
urn;</div><div>&gt; + =7D</div><br><div>I don't think you need to make th=
is check -- you can just set/clear</div><div>the pending status of the LP=
I. If the LPI is not enabled then it will</div><div>be ignored by gicv3=5F=
redist=5Fupdate=5Flpi(). This is how non-LPI interrupts</div><div>work an=
d I think that LPIs behave the same way. (But it's a big spec,</div><div>=
so I might have missed something -- if I'm wrong, please say so.)</div><b=
r><div>&gt; +</div><div>&gt; + /* set/clear the pending bit for this irq =
*/</div><div>&gt; + gicv3=5Fredist=5Flpi=5Fpending(cs, irq, level);</div>=
<div>&gt; +</div><div>&gt; + gicv3=5Fredist=5Fupdate(cs);</div><div>&gt; =
+=7D</div><div>&gt; +</div><div>&gt; void gicv3=5Fredist=5Fset=5Firq(GICv=
3CPUState *cs, int irq, int level)</div><div>&gt; =7B</div><div>&gt; /* U=
pdate redistributor state for a change in an external PPI input line */</=
div><div>&gt; diff --git a/hw/intc/gicv3=5Finternal.h b/hw/intc/gicv3=5Fi=
nternal.h</div><div>&gt; index 91dbe01176..bcbccba573 100644</div><div>&g=
t; --- a/hw/intc/gicv3=5Finternal.h</div><div>&gt; +++ b/hw/intc/gicv3=5F=
internal.h</div><div>&gt; =40=40 -308,6 +308,13 =40=40 =46IELD(GITS=5FTYP=
ER, CIL, 36, 1)</div><div>&gt;</div><div>&gt; =23define L1TABLE=5FENTRY=5F=
SIZE 8</div><div>&gt;</div><div>&gt; +=23define LPI=5FCTE=5FENABLE=5FO=46=
=46SET 0</div><div>&gt; +=23define LPI=5FCTE=5FENABLED VALID=5FMASK</div>=
<div>&gt; +=23define LPI=5FCTE=5FPRIORITY=5FO=46=46SET 2</div><div>&gt; +=
=23define LPI=5FCTE=5FPRIORITY=5FMASK ((1U &lt;&lt; 6) - 1)</div><div>&gt=
; +=23define LPI=5FPRIORITY=5FMASK 0xfc</div><div>&gt; +=23define LPI=5FS=
PRIORITY=5FMASK 0x7e</div><div>&gt; +</div><div>&gt; =23define GITS=5FCMD=
Q=5FENTRY=5FSIZE 32</div><div>&gt; =23define NUM=5FBYTES=5FIN=5FDW 8</div=
><div>&gt;</div><div>&gt; =40=40 -452,6 +459,9 =40=40 MemTxResult gicv3=5F=
redist=5Fwrite(void *opaque, hwaddr offset, uint64=5Ft data,</div><div>&g=
t; unsigned size, MemTxAttrs attrs);</div><div>&gt; void gicv3=5Fdist=5Fs=
et=5Firq(GICv3State *s, int irq, int level);</div><div>&gt; void gicv3=5F=
redist=5Fset=5Firq(GICv3CPUState *cs, int irq, int level);</div><div>&gt;=
 +void gicv3=5Fredist=5Fprocess=5Flpi(GICv3CPUState *cs, int irq, int lev=
el);</div><div>&gt; +void gicv3=5Fredist=5Flpi=5Fpending(GICv3CPUState *c=
s, int irq, int level);</div><div>&gt; +void gicv3=5Fredist=5Fupdate=5Flp=
i(GICv3CPUState *cs);</div><div>&gt; void gicv3=5Fredist=5Fsend=5Fsgi(GIC=
v3CPUState *cs, int grp, int irq, bool ns);</div><div>&gt; void gicv3=5Fi=
nit=5Fcpuif(GICv3State *s);</div><div>&gt;</div><div>&gt; diff --git a/in=
clude/hw/intc/arm=5Fgicv3=5Fcommon.h b/include/hw/intc/arm=5Fgicv3=5Fcomm=
on.h</div><div>&gt; index c1348cc60a..5d839da9c9 100644</div><div>&gt; --=
- a/include/hw/intc/arm=5Fgicv3=5Fcommon.h</div><div>&gt; +++ b/include/h=
w/intc/arm=5Fgicv3=5Fcommon.h</div><div>&gt; =40=40 -204,6 +204,16 =40=40=
 struct GICv3CPUState =7B</div><div>&gt; * real state above; it doesn't n=
eed to be migrated.</div><div>&gt; */</div><div>&gt; PendingIrq hppi;</di=
v><div>&gt; +</div><div>&gt; + /*</div><div>&gt; + * Current highest prio=
rity pending lpi for this CPU.</div><div>&gt; + * This is cached informat=
ion that can be recalculated from the</div><div>&gt; + * real state above=
; it doesn't need to be migrated.</div><br><div>This comment is true for =
hppi, but not for hpplpi. =46or hpplpi</div><div>it is =22cached informat=
ion that can be recalculated from the LPI</div><div>tables in guest memor=
y=22.</div><br><div>This means that we need either to:</div><div>(1) call=
 gicv3=5Fredist=5Fupdate=5Flpi() in an appropriate post-load function</di=
v><div>so that the field gets re-calculated on the destination end of a m=
igration</div><div>(2) migrate the hpplpi fields</div><br><div>Option 1 i=
s what we do for hppi: arm=5Fgicv3=5Fpost=5Fload() calls</div><div>gicv3=5F=
full=5Fupdate=5Fnoirqset(), which does a full recalculation of the</div><=
div>GIC state. Calling gicv3=5Fredist=5Fupdate=5Flpi() in arm=5Fgicv3=5Fp=
ost=5Fload()</div><div>before it calls gicv3=5Ffull=5Fupdate=5Fnoirqset()=
 is probably the best thing.</div><br><div>&gt; + */</div><div>&gt; + Pen=
dingIrq hpplpi;</div><div>&gt; +</div><div>&gt; + bool lpivalid; /* curre=
nt highest priority lpi validity status */</div><div>&gt; +</div><div>&gt=
; /* This is temporary working state, to avoid a malloc in gicv3=5Fupdate=
() */</div><div>&gt; bool seenbetter;</div><div>&gt; =7D;</div><div>&gt; =
--</div><div>&gt; 2.27.0</div><div>&gt;</div><br><div>thanks</div><div>--=
 PMM</div></div><img class=3D=22mailspring-open=22 alt=3D=22Sent from Mai=
lspring=22 width=3D=220=22 height=3D=220=22 style=3D=22border:0; width:0;=
 height:0;=22 src=3D=22https://link.getmailspring.com/open/551DAA51-CB17-=
423D-896=46-A=460443A5E7AE=40getmailspring.com=3Fme=3D2a4b90d6&amp;recipi=
ent=3DcWVtdS1kZXZlbEBub25nbnUub3Jn=22>
--60c2a299_6f88f3ab_1571--


