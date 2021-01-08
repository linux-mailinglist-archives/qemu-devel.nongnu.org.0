Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F72EF653
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:15:00 +0100 (CET)
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvLn-0003FZ-Vs
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvJW-0000b0-Oq
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:12:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvJF-0004sd-2P
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:12:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d13so9656765wrc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E3wLZ5ZQgEBY3BL5WGa0zC+m36hgQAMvpdbWNLUcHrw=;
 b=V0G9wM/6lZGIBU98HR7IZk1iSi5i2x3gfU9Y+zINP7D29/XWgmUoX9NztYQAGLmh1R
 uWATs6pcTcvvMksJJ2Y6IzrlQz7NJAUkMK/F0+mverBPRDdwq1UzJBEiy38AGhy4HjDg
 Hg7f0G6VBStPkAKnOOYlLkeWP2i6/1R0IIiV7uQe1DBsqE6IsB9l7rwqiohmSh0Lt0Hv
 ZjRBbXjcisBZdbTLQwFFvuk5iRAujGBzT8+u3sI4PZRNMEeiKLMCAU2giwFYeMz8AZ2f
 m7C+01FfYdgvDObilhDAqkcwu7+4GUF9MqTT54YIav97o5rS5kYeiHjxFIyiOVZYL+M3
 ujfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E3wLZ5ZQgEBY3BL5WGa0zC+m36hgQAMvpdbWNLUcHrw=;
 b=AJiB+rowikE8+PM8PZG9P1cWl8e0vEid9e4vJkkGJm2JkVEDt64BYpwy48fE8k8XwO
 nEN9T2Xd8hAT6DqPdtvQnmRwUaJ1RykWCef3YlRvvIyiRz8ovYAtwA5fgL23t8xPoKNw
 1PzaMs9dm0YMUTT+dGH+aWnxXH/nJVk1zxKM16atrnwsI/UuTys1Dv25rbHD4Oe5LOyr
 Bino7LtJoedkt4CCMd2zmseJhgBt45GjDN1ESicAmEe4QEe/cIhhNmLC0Z+5joNouRxS
 Xr9N7uPfff0tjkB28kWk+6tc2ifg1x6iZS0cTNZEax8xXbaGoYdr4ebNw75QMb3pH5Xp
 LcSg==
X-Gm-Message-State: AOAM530pxfnds+y8aeyiBIVAXiaU8vJiPkNlLZF+qXCUA6Z9VRT+sguB
 j12TyMJzWgd+cXVcUxoqKN750yAtjA0Leg==
X-Google-Smtp-Source: ABdhPJz6J1xjG8i2eZvuYPccR/Yk1AedWp136gIseRPhuMsmhEbnROQoYX7haYdpaAqGtDv0XfI1cA==
X-Received: by 2002:adf:a201:: with SMTP id p1mr4619555wra.65.1610125937526;
 Fri, 08 Jan 2021 09:12:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v1sm13540456wrr.48.2021.01.08.09.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 09:12:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/ppc: Delete unused ppc405cr_init() code
Date: Fri,  8 Jan 2021 17:12:10 +0000
Message-Id: <20210108171212.16500-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108171212.16500-1-peter.maydell@linaro.org>
References: <20210108171212.16500-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function ppc405cr_init() has apparently been unused since it was
added in commit 8ecc7913525ecb in 2007.

Remove this dead code, so we don't have to convert it away from using
ppcuic_init().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/ppc405.h    |   6 -
 hw/ppc/ppc405_uc.c | 345 ---------------------------------------------
 2 files changed, 351 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 7ed25cfa1bf..e6c702f7e0d 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -62,12 +62,6 @@ ram_addr_t ppc405_set_bootinfo (CPUPPCState *env, ppc4xx_bd_info_t *bd,
 void ppc4xx_plb_init(CPUPPCState *env);
 void ppc405_ebc_init(CPUPPCState *env);
 
-CPUPPCState *ppc405cr_init(MemoryRegion *address_space_mem,
-                        MemoryRegion ram_memories[4],
-                        hwaddr ram_bases[4],
-                        hwaddr ram_sizes[4],
-                        uint32_t sysclk, qemu_irq **picp,
-                        int do_init);
 CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 381720aced9..3e191ae4af5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1155,351 +1155,6 @@ static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
     qemu_register_reset(ppc4xx_gpt_reset, gpt);
 }
 
-/*****************************************************************************/
-/* PowerPC 405CR */
-enum {
-    PPC405CR_CPC0_PLLMR  = 0x0B0,
-    PPC405CR_CPC0_CR0    = 0x0B1,
-    PPC405CR_CPC0_CR1    = 0x0B2,
-    PPC405CR_CPC0_PSR    = 0x0B4,
-    PPC405CR_CPC0_JTAGID = 0x0B5,
-    PPC405CR_CPC0_ER     = 0x0B9,
-    PPC405CR_CPC0_FR     = 0x0BA,
-    PPC405CR_CPC0_SR     = 0x0BB,
-};
-
-enum {
-    PPC405CR_CPU_CLK   = 0,
-    PPC405CR_TMR_CLK   = 1,
-    PPC405CR_PLB_CLK   = 2,
-    PPC405CR_SDRAM_CLK = 3,
-    PPC405CR_OPB_CLK   = 4,
-    PPC405CR_EXT_CLK   = 5,
-    PPC405CR_UART_CLK  = 6,
-    PPC405CR_CLK_NB    = 7,
-};
-
-typedef struct ppc405cr_cpc_t ppc405cr_cpc_t;
-struct ppc405cr_cpc_t {
-    clk_setup_t clk_setup[PPC405CR_CLK_NB];
-    uint32_t sysclk;
-    uint32_t psr;
-    uint32_t cr0;
-    uint32_t cr1;
-    uint32_t jtagid;
-    uint32_t pllmr;
-    uint32_t er;
-    uint32_t fr;
-};
-
-static void ppc405cr_clk_setup (ppc405cr_cpc_t *cpc)
-{
-    uint64_t VCO_out, PLL_out;
-    uint32_t CPU_clk, TMR_clk, SDRAM_clk, PLB_clk, OPB_clk, EXT_clk, UART_clk;
-    int M, D0, D1, D2;
-
-    D0 = ((cpc->pllmr >> 26) & 0x3) + 1; /* CBDV */
-    if (cpc->pllmr & 0x80000000) {
-        D1 = (((cpc->pllmr >> 20) - 1) & 0xF) + 1; /* FBDV */
-        D2 = 8 - ((cpc->pllmr >> 16) & 0x7); /* FWDVA */
-        M = D0 * D1 * D2;
-        VCO_out = (uint64_t)cpc->sysclk * M;
-        if (VCO_out < 400000000 || VCO_out > 800000000) {
-            /* PLL cannot lock */
-            cpc->pllmr &= ~0x80000000;
-            goto bypass_pll;
-        }
-        PLL_out = VCO_out / D2;
-    } else {
-        /* Bypass PLL */
-    bypass_pll:
-        M = D0;
-        PLL_out = (uint64_t)cpc->sysclk * M;
-    }
-    CPU_clk = PLL_out;
-    if (cpc->cr1 & 0x00800000)
-        TMR_clk = cpc->sysclk; /* Should have a separate clock */
-    else
-        TMR_clk = CPU_clk;
-    PLB_clk = CPU_clk / D0;
-    SDRAM_clk = PLB_clk;
-    D0 = ((cpc->pllmr >> 10) & 0x3) + 1;
-    OPB_clk = PLB_clk / D0;
-    D0 = ((cpc->pllmr >> 24) & 0x3) + 2;
-    EXT_clk = PLB_clk / D0;
-    D0 = ((cpc->cr0 >> 1) & 0x1F) + 1;
-    UART_clk = CPU_clk / D0;
-    /* Setup CPU clocks */
-    clk_setup(&cpc->clk_setup[PPC405CR_CPU_CLK], CPU_clk);
-    /* Setup time-base clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_TMR_CLK], TMR_clk);
-    /* Setup PLB clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_PLB_CLK], PLB_clk);
-    /* Setup SDRAM clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_SDRAM_CLK], SDRAM_clk);
-    /* Setup OPB clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_OPB_CLK], OPB_clk);
-    /* Setup external clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_EXT_CLK], EXT_clk);
-    /* Setup UART clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_UART_CLK], UART_clk);
-}
-
-static uint32_t dcr_read_crcpc (void *opaque, int dcrn)
-{
-    ppc405cr_cpc_t *cpc;
-    uint32_t ret;
-
-    cpc = opaque;
-    switch (dcrn) {
-    case PPC405CR_CPC0_PLLMR:
-        ret = cpc->pllmr;
-        break;
-    case PPC405CR_CPC0_CR0:
-        ret = cpc->cr0;
-        break;
-    case PPC405CR_CPC0_CR1:
-        ret = cpc->cr1;
-        break;
-    case PPC405CR_CPC0_PSR:
-        ret = cpc->psr;
-        break;
-    case PPC405CR_CPC0_JTAGID:
-        ret = cpc->jtagid;
-        break;
-    case PPC405CR_CPC0_ER:
-        ret = cpc->er;
-        break;
-    case PPC405CR_CPC0_FR:
-        ret = cpc->fr;
-        break;
-    case PPC405CR_CPC0_SR:
-        ret = ~(cpc->er | cpc->fr) & 0xFFFF0000;
-        break;
-    default:
-        /* Avoid gcc warning */
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
-static void dcr_write_crcpc (void *opaque, int dcrn, uint32_t val)
-{
-    ppc405cr_cpc_t *cpc;
-
-    cpc = opaque;
-    switch (dcrn) {
-    case PPC405CR_CPC0_PLLMR:
-        cpc->pllmr = val & 0xFFF77C3F;
-        break;
-    case PPC405CR_CPC0_CR0:
-        cpc->cr0 = val & 0x0FFFFFFE;
-        break;
-    case PPC405CR_CPC0_CR1:
-        cpc->cr1 = val & 0x00800000;
-        break;
-    case PPC405CR_CPC0_PSR:
-        /* Read-only */
-        break;
-    case PPC405CR_CPC0_JTAGID:
-        /* Read-only */
-        break;
-    case PPC405CR_CPC0_ER:
-        cpc->er = val & 0xBFFC0000;
-        break;
-    case PPC405CR_CPC0_FR:
-        cpc->fr = val & 0xBFFC0000;
-        break;
-    case PPC405CR_CPC0_SR:
-        /* Read-only */
-        break;
-    }
-}
-
-static void ppc405cr_cpc_reset (void *opaque)
-{
-    ppc405cr_cpc_t *cpc;
-    int D;
-
-    cpc = opaque;
-    /* Compute PLLMR value from PSR settings */
-    cpc->pllmr = 0x80000000;
-    /* PFWD */
-    switch ((cpc->psr >> 30) & 3) {
-    case 0:
-        /* Bypass */
-        cpc->pllmr &= ~0x80000000;
-        break;
-    case 1:
-        /* Divide by 3 */
-        cpc->pllmr |= 5 << 16;
-        break;
-    case 2:
-        /* Divide by 4 */
-        cpc->pllmr |= 4 << 16;
-        break;
-    case 3:
-        /* Divide by 6 */
-        cpc->pllmr |= 2 << 16;
-        break;
-    }
-    /* PFBD */
-    D = (cpc->psr >> 28) & 3;
-    cpc->pllmr |= (D + 1) << 20;
-    /* PT   */
-    D = (cpc->psr >> 25) & 7;
-    switch (D) {
-    case 0x2:
-        cpc->pllmr |= 0x13;
-        break;
-    case 0x4:
-        cpc->pllmr |= 0x15;
-        break;
-    case 0x5:
-        cpc->pllmr |= 0x16;
-        break;
-    default:
-        break;
-    }
-    /* PDC  */
-    D = (cpc->psr >> 23) & 3;
-    cpc->pllmr |= D << 26;
-    /* ODP  */
-    D = (cpc->psr >> 21) & 3;
-    cpc->pllmr |= D << 10;
-    /* EBPD */
-    D = (cpc->psr >> 17) & 3;
-    cpc->pllmr |= D << 24;
-    cpc->cr0 = 0x0000003C;
-    cpc->cr1 = 0x2B0D8800;
-    cpc->er = 0x00000000;
-    cpc->fr = 0x00000000;
-    ppc405cr_clk_setup(cpc);
-}
-
-static void ppc405cr_clk_init (ppc405cr_cpc_t *cpc)
-{
-    int D;
-
-    /* XXX: this should be read from IO pins */
-    cpc->psr = 0x00000000; /* 8 bits ROM */
-    /* PFWD */
-    D = 0x2; /* Divide by 4 */
-    cpc->psr |= D << 30;
-    /* PFBD */
-    D = 0x1; /* Divide by 2 */
-    cpc->psr |= D << 28;
-    /* PDC */
-    D = 0x1; /* Divide by 2 */
-    cpc->psr |= D << 23;
-    /* PT */
-    D = 0x5; /* M = 16 */
-    cpc->psr |= D << 25;
-    /* ODP */
-    D = 0x1; /* Divide by 2 */
-    cpc->psr |= D << 21;
-    /* EBDP */
-    D = 0x2; /* Divide by 4 */
-    cpc->psr |= D << 17;
-}
-
-static void ppc405cr_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[7],
-                               uint32_t sysclk)
-{
-    ppc405cr_cpc_t *cpc;
-
-    cpc = g_malloc0(sizeof(ppc405cr_cpc_t));
-    memcpy(cpc->clk_setup, clk_setup,
-           PPC405CR_CLK_NB * sizeof(clk_setup_t));
-    cpc->sysclk = sysclk;
-    cpc->jtagid = 0x42051049;
-    ppc_dcr_register(env, PPC405CR_CPC0_PSR, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_CR0, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_CR1, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_JTAGID, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_PLLMR, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_ER, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_FR, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_SR, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc405cr_clk_init(cpc);
-    qemu_register_reset(ppc405cr_cpc_reset, cpc);
-}
-
-CPUPPCState *ppc405cr_init(MemoryRegion *address_space_mem,
-                        MemoryRegion ram_memories[4],
-                        hwaddr ram_bases[4],
-                        hwaddr ram_sizes[4],
-                        uint32_t sysclk, qemu_irq **picp,
-                        int do_init)
-{
-    clk_setup_t clk_setup[PPC405CR_CLK_NB];
-    qemu_irq dma_irqs[4];
-    PowerPCCPU *cpu;
-    CPUPPCState *env;
-    qemu_irq *pic, *irqs;
-
-    memset(clk_setup, 0, sizeof(clk_setup));
-    cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405crc"),
-                      &clk_setup[PPC405CR_CPU_CLK],
-                      &clk_setup[PPC405CR_TMR_CLK], sysclk);
-    env = &cpu->env;
-    /* Memory mapped devices registers */
-    /* PLB arbitrer */
-    ppc4xx_plb_init(env);
-    /* PLB to OPB bridge */
-    ppc4xx_pob_init(env);
-    /* OBP arbitrer */
-    ppc4xx_opba_init(0xef600600);
-    /* Universal interrupt controller */
-    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] =
-        ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] =
-        ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
-    *picp = pic;
-    /* SDRAM controller */
-    ppc4xx_sdram_init(env, pic[14], 1, ram_memories,
-                      ram_bases, ram_sizes, do_init);
-    /* External bus controller */
-    ppc405_ebc_init(env);
-    /* DMA controller */
-    dma_irqs[0] = pic[26];
-    dma_irqs[1] = pic[25];
-    dma_irqs[2] = pic[24];
-    dma_irqs[3] = pic[23];
-    ppc405_dma_init(env, dma_irqs);
-    /* Serial ports */
-    if (serial_hd(0) != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
-                       PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
-                       DEVICE_BIG_ENDIAN);
-    }
-    if (serial_hd(1) != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
-                       PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
-                       DEVICE_BIG_ENDIAN);
-    }
-    /* IIC controller */
-    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500, pic[2]);
-    /* GPIO */
-    ppc405_gpio_init(0xef600700);
-    /* CPU control */
-    ppc405cr_cpc_init(env, clk_setup, sysclk);
-
-    return env;
-}
-
 /*****************************************************************************/
 /* PowerPC 405EP */
 /* CPU control */
-- 
2.20.1


