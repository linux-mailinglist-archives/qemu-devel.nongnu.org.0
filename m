Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592EE3142A4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:12:41 +0100 (CET)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Els-0002Q6-DD
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9AAq-00073L-M8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:18:10 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9AAi-0007Vn-HY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:18:08 -0500
Received: by mail-ej1-x62c.google.com with SMTP id i8so26092191ejc.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JyS40VXubOLOnczGYxqiphHswKI5LfC0arHVwMH5gjY=;
 b=FOIWA+TRigBW6GQf+KawMcexOX3xru5JDZt04SMvCVy/W3gHAwyaV65lkPhnC6XB4d
 xMBth/8C5oSFqecZI1MR6yW+8AEhRQcO6aBNxnCr9C5/XYdyxdjkOmUllL4rvE5lHeNi
 kseHo13nJ35uK6WVO51od+895qLqYdGu4XdMD8+a/Ag4etXvD8YdR6tCVq8OisETQqH5
 bUd9LpMShzZ/zAO6blKRiRZSJeHrZVAemUoj7/eWUy5pzeu6Nkg1BoHlV1+c93tCBZkN
 5dN8oEp3UKqUCUOFRlJ+imQ6/yYijiG/GhKzYSeTK4z0nKxttpiCfn/onvtoHPWo3Pik
 vn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JyS40VXubOLOnczGYxqiphHswKI5LfC0arHVwMH5gjY=;
 b=bDQokyHEW/NeKS3xe3Ul/6nzA44fsdKPErdimzvbUWP46GoKPlT7pMQP1yTvBEH+Ol
 xyuOq4K1FxtCtPOqrfJrOEOCE3LZETOroNHD8lslCo1sDPjCXL15T4dM+u2UNRH4fNQp
 whOctxgEHvKG5fMh9FJ03FC4VRKCBZsIB7CfDrtEkc2O5BpXMl84UwjcQVzQMJ6ydLKU
 1XZ6GP9M0HmpKw5AhzU0udvaQHEp/gKhFaAj6JGOFdIJkUmteuAdNX4LM42aQmEF90VV
 DJgZ7hPeSLju1Fp//VYYg0k36t/LD0ehKj5MTbalMSBxSxJ9C8Z9azwqu3+gY/M0ZSJ6
 9I2A==
X-Gm-Message-State: AOAM530BLzUY+Is5cj8RPIf3TTpmnZpmG3GRYYEvDIeh/KBtq0VwCyyc
 5PdqxhX2slnyov++iM5fbixAe0CMGNkj5AJEWF6LEA==
X-Google-Smtp-Source: ABdhPJycSmwXl5IxMe3vej4WAAWyhPCL0eF/rSRaRZXSBAXfDxXclstoksiip18OlAm6Rp/U2YkEx2XQYfYDsVm5m8I=
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr17810246ejd.4.1612804675654; 
 Mon, 08 Feb 2021 09:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20210202232838.1641382-1-dje@google.com>
 <20210202232838.1641382-2-dje@google.com>
In-Reply-To: <20210202232838.1641382-2-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:17:44 +0000
Message-ID: <CAFEAcA_O7eNxk2hsDxj2=-zHEXP3K4fdVHs8nWqcH3ZaMMKM3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: Add npcm7xx emc model
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 23:29, Doug Evans <dje@google.com> wrote:
>
> This is a 10/100 ethernet device that has several features.
> Only the ones needed by the Linux driver have been implemented.
> See npcm7xx_emc.c for a list of unimplemented features.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  hw/net/meson.build           |   1 +
>  hw/net/npcm7xx_emc.c         | 852 +++++++++++++++++++++++++++++++++++
>  hw/net/trace-events          |  17 +
>  include/hw/net/npcm7xx_emc.h | 286 ++++++++++++
>  4 files changed, 1156 insertions(+)
>  create mode 100644 hw/net/npcm7xx_emc.c
>  create mode 100644 include/hw/net/npcm7xx_emc.h

> +static void emc_reset(NPCM7xxEMCState *emc)
> +{
> +    trace_npcm7xx_emc_reset(emc->emc_num);
> +
> +    memset(&emc->regs[0], 0, sizeof(emc->regs));
> +
> +    /* These regs have non-zero reset values. */
> +    emc->regs[REG_TXDLSA] = 0xfffffffc;
> +    emc->regs[REG_RXDLSA] = 0xfffffffc;
> +    emc->regs[REG_MIIDA] = 0x00900000;
> +    emc->regs[REG_FFTCR] = 0x0101;
> +    emc->regs[REG_DMARFC] = 0x0800;
> +    emc->regs[REG_MPCNT] = 0x7fff;
> +
> +    emc->tx_active = false;
> +    emc->rx_active = false;
> +
> +    qemu_set_irq(emc->tx_irq, 0);
> +    qemu_set_irq(emc->rx_irq, 0);
> +}
> +
> +static void npcm7xx_emc_reset(DeviceState *dev)
> +{
> +    NPCM7xxEMCState *emc = NPCM7XX_EMC(dev);
> +    emc_reset(emc);
> +}

You can't call qemu_set_irq() from a DeviceState::reset method.
Usually it's OK just not to try to set the outbound IRQs and
to assume that the device you're connected to has reset to the
state where its inbound IRQ line is not asserted. If you really
need to set the irq line then you need to switch to 3-phase
reset (some of the other npcm7xx devices do this). But I
suspect that just moving the qemu_set_irq() calls to
emc_soft_reset() would be enough.

> +
> +static void emc_soft_reset(NPCM7xxEMCState *emc)
> +{
> +    /*
> +     * The docs say at least MCMDR.{LBK,OPMOD} bits are not changed during a
> +     * soft reset, but does not go into further detail. For now, KISS.
> +     */
> +    uint32_t mcmdr = emc->regs[REG_MCMDR];
> +    emc_reset(emc);
> +    emc->regs[REG_MCMDR] =
> +        mcmdr & (REG_MCMDR_LBK | REG_MCMDR_OPMOD);
> + }


> +static void emc_try_send_next_packet(NPCM7xxEMCState *emc)
> +{
> +    uint32_t desc_addr = TX_DESC_NTXDSA(emc->regs[REG_CTXDSA]);
> +    NPCM7xxEMCTxDesc tx_desc;
> +    if (emc_read_tx_desc(desc_addr, &tx_desc)) {
> +        /* Error reading descriptor, already reported. */
> +        emc_halt_tx(emc, REG_MISTA_TXBERR);
> +        emc_update_tx_irq(emc);
> +        return;
> +    }
> +
> +    /* Nothing we can do if we don't own the descriptor. */
> +    if (!(tx_desc.flags & TX_DESC_FLAG_OWNER_MASK)) {
> +        trace_npcm7xx_emc_cpu_owned_desc(desc_addr);
> +        emc_halt_tx(emc, REG_MISTA_TDU);
> +        emc_update_tx_irq(emc);
> +        return;
> +     }
> +
> +    /* Give the descriptor back regardless of what happens. */
> +    tx_desc.flags &= ~TX_DESC_FLAG_OWNER_MASK;
> +    tx_desc.status_and_length &= 0xffff;
> +
> +    /* Working buffer for sending out packets. Most packets fit in this. */
> +#define TX_BUFFER_SIZE 2048
> +    uint8_t tx_send_buffer[TX_BUFFER_SIZE];

Don't put local variable declarations in the middle of functions,
please. Coding style says they should be at the start of a
block (so, here, the start of the function). It looks like you've
got middle-of-function declarations in several places in other
functions too, so could you fix them all up please?

> +
> +    /*
> +     * Despite the h/w documentation saying the tx buffer is word aligned,
> +     * the linux driver does not word align the buffer. There is value in not
> +     * aligning the buffer: See the description of NET_IP_ALIGN in linux
> +     * kernel sources.
> +     */
> +    uint32_t next_buf_addr = tx_desc.txbsa;
> +    emc->regs[REG_CTXBSA] = next_buf_addr;
> +    uint32_t length = TX_DESC_PKT_LEN(tx_desc.status_and_length);
> +    uint8_t *buf = &tx_send_buffer[0];
> +    uint8_t *malloced_buf = NULL;

Optional, but you might consider using g_autofree for
malloced_buf, which would let the compiler deal with
g_free()ing it for you on all the function exit paths.

> +
> +    if (length > sizeof(tx_send_buffer)) {
> +        malloced_buf = g_malloc(length);
> +        buf = malloced_buf;
> +    }

Otherwise the patch looks OK I think.

thanks
-- PMM

