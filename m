Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB5313EC4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:21:58 +0100 (CET)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9C6f-0006Ug-8I
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l95uL-0004L0-Cj; Mon, 08 Feb 2021 07:44:51 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:42889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l95u5-0000Zq-Jm; Mon, 08 Feb 2021 07:44:45 -0500
Received: by mail-lf1-x132.google.com with SMTP id f23so4910296lfk.9;
 Mon, 08 Feb 2021 04:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lXPBcQP7R8grKUPFzZyHeLa7rHYsR4iDBVoMSJS0qX0=;
 b=J3FS4AqRDcOL6CY1dpmjyu8soi70BRYmN+Ls4HecuQv9ZJvb73idlvvenW4pJI9k6F
 3Bwf8ilh7YwqZ4x4d2ZlwXDCG43TOH6ANIyP4sEEomrbnmr/S0rr2nC04JUhpUmkp5ts
 6Z8SvipCBMpx4bDN7hExpqOZ07+vJa9eo8lELNBBz0dkjxux2KhtFtJJWRQ6YSLGueFy
 rKgAqApPHoQe5tgWYYiKDIU+zGtkYki6K4TkLSP6Pq/S+EsTHngy8Ovlpwy2gEuJg7Ay
 bUmWe9++gyAh5UBWSzzrmDI/JPHMde/6OY7RjOJNtpOvE1C0fKas9FFUqp9/GG9U+eUU
 2huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lXPBcQP7R8grKUPFzZyHeLa7rHYsR4iDBVoMSJS0qX0=;
 b=SpuCKbnLOMX47137w7pLy/0UabPMdvqdQUWRx7i6Lbx9MxXUDyYjISZ6XtQJvciJ8O
 62MWRnpLqcxtHQB3oFh8XrA8fveRUyy2yGr3h0o3a0dz5eeyfGYzHq/NeIC1pZL7Di/Z
 E3nPf33eYnjSYdF+/IaPW/dKWTZAljCcArxTxYwqI3Jb3FV/w9mqwCqFdzNaMC3vNdZE
 fadXm5FNf0CAV/PU26Bk/XOn/M5B4wrw6Q8RivLmmbU0pIjxyAVkeNz7NZCSLL3YUlcz
 BHVZkT3yyfkccALkeItWHqls4/hRGOigI34y6pGWx0bxQlC/3xHrqBSAeY6RMAILQ78l
 2XZQ==
X-Gm-Message-State: AOAM532CKDw6L1djM+XpPQUYXAxPqdzOZ5mX6fSdJ9zOxMXKUP9J8HOZ
 QIm/R0n0xfITUB9G+y0k7uc=
X-Google-Smtp-Source: ABdhPJykutZPrGciXpAoiZj80gce+wjmoQIL1D6nD6jTI4vqaxZWe1+BhyzfN554IqiHYNyyVX/Mhw==
X-Received: by 2002:a05:6512:6c4:: with SMTP id
 u4mr10039255lff.63.1612788267707; 
 Mon, 08 Feb 2021 04:44:27 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id b1sm2006047lji.129.2021.02.08.04.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:44:26 -0800 (PST)
Date: Mon, 8 Feb 2021 13:44:25 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
Message-ID: <20210208124425.GI477672@toto>
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, francisco.iglesias@xilinx.com, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> crash. This is observed when testing VxWorks 7.
> 
> Add a basic implementation of QSPI DMA functionality.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

+ Francisco

Hi,

Like Peter commented on the previous version, the DMA unit is actully separate.
This module is better modelled by pushing data through the Stream framework
into the DMA. The DMA model is not upstream but can be found here:
https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c

Feel free to send a patch to upstream with that model (perhaps changing
the filename to something more suitable, e.g xlnx-csu-stream-dma.c).
You can use --author="Edgar E. Iglesias <edgar.iglesias@xilinx.com>".

The DMA should be mapped to 0xFF0F0800 and IRQ 15.

CC:d Francisco, he's going to publish some smoke-tests for this.

Cheers,
Edgar


> 
> ---
> 
> Changes in v2:
> - Remove unconnected TYPE_STREAM_SINK link property
> - Add a TYPE_MEMORY_REGION link property, to allow board codes to tell
>   the device what its view of the world that it is doing DMA to is
> - Replace cpu_physical_memory_write() with address_space_write()
> 
>  include/hw/ssi/xilinx_spips.h |   3 +-
>  hw/ssi/xilinx_spips.c         | 207 +++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 186 insertions(+), 24 deletions(-)
> 
> diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
> index 3eae734..2478839 100644
> --- a/include/hw/ssi/xilinx_spips.h
> +++ b/include/hw/ssi/xilinx_spips.h
> @@ -99,7 +99,8 @@ typedef struct XilinxQSPIPS XilinxQSPIPS;
>  struct XlnxZynqMPQSPIPS {
>      XilinxQSPIPS parent_obj;
>  
> -    StreamSink *dma;
> +    MemoryRegion *dma_mr;
> +    AddressSpace *dma_as;
>      int gqspi_irqline;
>  
>      uint32_t regs[XLNX_ZYNQMP_SPIPS_R_MAX];
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 8a0cc22..9caca7b 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -195,12 +195,72 @@
>  #define R_GQSPI_MOD_ID        (0x1fc / 4)
>  #define R_GQSPI_MOD_ID_RESET  (0x10a0000)
>  
> -#define R_QSPIDMA_DST_CTRL         (0x80c / 4)
> -#define R_QSPIDMA_DST_CTRL_RESET   (0x803ffa00)
> -#define R_QSPIDMA_DST_I_MASK       (0x820 / 4)
> -#define R_QSPIDMA_DST_I_MASK_RESET (0xfe)
> -#define R_QSPIDMA_DST_CTRL2        (0x824 / 4)
> -#define R_QSPIDMA_DST_CTRL2_RESET  (0x081bfff8)
> +#define GQSPI_CNFG_MODE_EN_IO  (0)
> +#define GQSPI_CNFG_MODE_EN_DMA (2)
> +
> +/*
> + * Ref: UG1087 (v1.7) February 8, 2019
> + * https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> + */
> +REG32(GQSPI_DMA_ADDR, 0x800)
> +    FIELD(GQSPI_DMA_ADDR, ADDR, 2, 30)
> +REG32(GQSPI_DMA_SIZE, 0x804)
> +    FIELD(GQSPI_DMA_SIZE, SIZE, 2, 27)
> +REG32(GQSPI_DMA_STS, 0x808)
> +    FIELD(GQSPI_DMA_STS, DONE_CNT, 13, 3)
> +    FIELD(GQSPI_DMA_STS, BUSY, 0, 1)
> +REG32(GQSPI_DMA_CTRL, 0x80c)
> +    FIELD(GQSPI_DMA_CTRL, FIFO_LVL_HIT_THRESH, 25, 7)
> +    FIELD(GQSPI_DMA_CTRL, APB_ERR_RESP, 24, 1)
> +    FIELD(GQSPI_DMA_CTRL, ENDIANNESS, 23, 1)
> +    FIELD(GQSPI_DMA_CTRL, AXI_BRST_TYPE, 22, 1)
> +    FIELD(GQSPI_DMA_CTRL, TIMEOUT_VAL, 10, 12)
> +    FIELD(GQSPI_DMA_CTRL, FIFO_THRESH, 2, 8)
> +    FIELD(GQSPI_DMA_CTRL, PAUSE_STRM, 1, 1)
> +    FIELD(GQSPI_DMA_CTRL, PAUSE_MEM, 0, 1)
> +REG32(GQSPI_DMA_I_STS, 0x814)
> +    FIELD(GQSPI_DMA_I_STS, FIFO_OVERFLOW, 7, 1)
> +    FIELD(GQSPI_DMA_I_STS, INVALID_APB, 6, 1)
> +    FIELD(GQSPI_DMA_I_STS, THRESH_HIT, 5, 1)
> +    FIELD(GQSPI_DMA_I_STS, TIMEOUT_MEM, 4, 1)
> +    FIELD(GQSPI_DMA_I_STS, TIMEOUT_STRM, 3, 1)
> +    FIELD(GQSPI_DMA_I_STS, AXI_BRESP_ERR, 2, 1)
> +    FIELD(GQSPI_DMA_I_STS, DONE, 1, 1)
> +REG32(GQSPI_DMA_I_EN, 0x818)
> +    FIELD(GQSPI_DMA_I_EN, FIFO_OVERFLOW, 7, 1)
> +    FIELD(GQSPI_DMA_I_EN, INVALID_APB, 6, 1)
> +    FIELD(GQSPI_DMA_I_EN, THRESH_HIT, 5, 1)
> +    FIELD(GQSPI_DMA_I_EN, TIMEOUT_MEM, 4, 1)
> +    FIELD(GQSPI_DMA_I_EN, TIMEOUT_STRM, 3, 1)
> +    FIELD(GQSPI_DMA_I_EN, AXI_BRESP_ERR, 2, 1)
> +    FIELD(GQSPI_DMA_I_EN, DONE, 1, 1)
> +REG32(GQSPI_DMA_I_DIS, 0x81c)
> +    FIELD(GQSPI_DMA_I_DIS, FIFO_OVERFLOW, 7, 1)
> +    FIELD(GQSPI_DMA_I_DIS, INVALID_APB, 6, 1)
> +    FIELD(GQSPI_DMA_I_DIS, THRESH_HIT, 5, 1)
> +    FIELD(GQSPI_DMA_I_DIS, TIMEOUT_MEM, 4, 1)
> +    FIELD(GQSPI_DMA_I_DIS, TIMEOUT_STRM, 3, 1)
> +    FIELD(GQSPI_DMA_I_DIS, AXI_BRESP_ERR, 2, 1)
> +    FIELD(GQSPI_DMA_I_DIS, DONE, 1, 1)
> +REG32(GQSPI_DMA_I_MASK, 0x820)
> +    FIELD(GQSPI_DMA_I_MASK, FIFO_OVERFLOW, 7, 1)
> +    FIELD(GQSPI_DMA_I_MASK, INVALID_APB, 6, 1)
> +    FIELD(GQSPI_DMA_I_MASK, THRESH_HIT, 5, 1)
> +    FIELD(GQSPI_DMA_I_MASK, TIMEOUT_MEM, 4, 1)
> +    FIELD(GQSPI_DMA_I_MASK, TIMEOUT_STRM, 3, 1)
> +    FIELD(GQSPI_DMA_I_MASK, AXI_BRESP_ERR, 2, 1)
> +    FIELD(GQSPI_DMA_I_MASK, DONE, 1, 1)
> +REG32(GQSPI_DMA_CTRL2, 0x824)
> +    FIELD(GQSPI_DMA_CTRL2, ARCACHE, 24, 3)
> +    FIELD(GQSPI_DMA_CTRL2, TIMEOUT_EN, 22, 1)
> +    FIELD(GQSPI_DMA_CTRL2, TIMEOUT_PRE, 4, 12)
> +    FIELD(GQSPI_DMA_CTRL2, MAX_OUTS_CMDS, 0, 4)
> +REG32(GQSPI_DMA_ADDR_MSB, 0x828)
> +    FIELD(GQSPI_DMA_ADDR_MSB, ADDR_MSB, 0, 12)
> +
> +#define R_GQSPI_DMA_CTRL_RESET    (0x803ffa00)
> +#define R_GQSPI_DMA_INT_MASK      (0xfe)
> +#define R_GQSPI_DMA_CTRL2_RESET   (0x081bfff8)
>  
>  /* size of TXRX FIFOs */
>  #define RXFF_A          (128)
> @@ -341,6 +401,7 @@ static void xilinx_spips_update_ixr(XilinxSPIPS *s)
>  static void xlnx_zynqmp_qspips_update_ixr(XlnxZynqMPQSPIPS *s)
>  {
>      uint32_t gqspi_int;
> +    uint32_t mode;
>      int new_irqline;
>  
>      s->regs[R_GQSPI_ISR] &= ~IXR_SELF_CLEAR;
> @@ -359,13 +420,20 @@ static void xlnx_zynqmp_qspips_update_ixr(XlnxZynqMPQSPIPS *s)
>                                      IXR_TX_FIFO_NOT_FULL : 0);
>  
>      /* GQSPI Interrupt Trigger Status */
> -    gqspi_int = (~s->regs[R_GQSPI_IMR]) & s->regs[R_GQSPI_ISR] & GQSPI_IXR_MASK;
> -    new_irqline = !!(gqspi_int & IXR_ALL);
> -
> -    /* drive external interrupt pin */
> -    if (new_irqline != s->gqspi_irqline) {
> -        s->gqspi_irqline = new_irqline;
> -        qemu_set_irq(XILINX_SPIPS(s)->irq, s->gqspi_irqline);
> +    mode = ARRAY_FIELD_EX32(s->regs, GQSPI_CNFG, MODE_EN);
> +    if (mode == GQSPI_CNFG_MODE_EN_IO) {
> +        gqspi_int = (~s->regs[R_GQSPI_IMR]) & s->regs[R_GQSPI_ISR] \
> +                                            & GQSPI_IXR_MASK;
> +        new_irqline = !!(gqspi_int & IXR_ALL);
> +
> +        /* drive external interrupt pin */
> +        if (new_irqline != s->gqspi_irqline) {
> +            s->gqspi_irqline = new_irqline;
> +            qemu_set_irq(XILINX_SPIPS(s)->irq, s->gqspi_irqline);
> +        }
> +    } else if (mode == GQSPI_CNFG_MODE_EN_DMA) {
> +        new_irqline = s->regs[R_GQSPI_DMA_I_STS] & ~s->regs[R_GQSPI_DMA_I_MASK];
> +        qemu_set_irq(XILINX_SPIPS(s)->irq, !!new_irqline);
>      }
>  }
>  
> @@ -417,9 +485,9 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
>      s->regs[R_GQSPI_GPIO] = 1;
>      s->regs[R_GQSPI_LPBK_DLY_ADJ] = R_GQSPI_LPBK_DLY_ADJ_RESET;
>      s->regs[R_GQSPI_MOD_ID] = R_GQSPI_MOD_ID_RESET;
> -    s->regs[R_QSPIDMA_DST_CTRL] = R_QSPIDMA_DST_CTRL_RESET;
> -    s->regs[R_QSPIDMA_DST_I_MASK] = R_QSPIDMA_DST_I_MASK_RESET;
> -    s->regs[R_QSPIDMA_DST_CTRL2] = R_QSPIDMA_DST_CTRL2_RESET;
> +    s->regs[R_GQSPI_DMA_CTRL] = R_GQSPI_DMA_CTRL_RESET;
> +    s->regs[R_GQSPI_DMA_I_MASK] = R_GQSPI_DMA_INT_MASK;
> +    s->regs[R_GQSPI_DMA_CTRL2] = R_GQSPI_DMA_CTRL2_RESET;
>      s->man_start_com_g = false;
>      s->gqspi_irqline = 0;
>      xlnx_zynqmp_qspips_update_ixr(s);
> @@ -843,6 +911,66 @@ static const void *pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num)
>      return ret;
>  }
>  
> +static void xlnx_zynqmp_gspips_dma_done(XlnxZynqMPQSPIPS *s)
> +{
> +    int cnt;
> +
> +    s->regs[R_GQSPI_DMA_STS] &= ~R_GQSPI_DMA_STS_BUSY_MASK;
> +    s->regs[R_GQSPI_DMA_I_STS] |= R_GQSPI_DMA_I_STS_DONE_MASK;
> +
> +    cnt = ARRAY_FIELD_EX32(s->regs, GQSPI_DMA_STS, DONE_CNT) + 1;
> +    ARRAY_FIELD_DP32(s->regs, GQSPI_DMA_STS, DONE_CNT, cnt);
> +
> +}
> +
> +static uint32_t xlnx_zynqmp_gspips_dma_advance(XlnxZynqMPQSPIPS *s,
> +                                               uint32_t len, hwaddr dst)
> +{
> +    uint32_t size = s->regs[R_GQSPI_DMA_SIZE];
> +
> +    size -= len;
> +    size &= R_GQSPI_DMA_SIZE_SIZE_MASK;
> +    dst += len;
> +
> +    s->regs[R_GQSPI_DMA_SIZE] = size;
> +    s->regs[R_GQSPI_DMA_ADDR] = (uint32_t) dst;
> +    s->regs[R_GQSPI_DMA_ADDR_MSB] = dst >> 32;
> +
> +    return size;
> +}
> +
> +static size_t xlnx_zynqmp_gspips_dma_push(XlnxZynqMPQSPIPS *s,
> +                                          uint8_t *buf, size_t len, bool eop)
> +{
> +    hwaddr dst = (hwaddr)s->regs[R_GQSPI_DMA_ADDR_MSB] << 32
> +                 | s->regs[R_GQSPI_DMA_ADDR];
> +    uint32_t size = s->regs[R_GQSPI_DMA_SIZE];
> +    uint32_t mlen = MIN(size, len) & (~3); /* Size is word aligned */
> +
> +    if (size == 0 || len <= 0) {
> +        return 0;
> +    }
> +
> +    if (address_space_write(s->dma_as, dst, MEMTXATTRS_UNSPECIFIED, buf, mlen)
> +        != MEMTX_OK) {
> +        return 0;
> +    }
> +
> +    size = xlnx_zynqmp_gspips_dma_advance(s, mlen, dst);
> +
> +    if (size == 0) {
> +        xlnx_zynqmp_gspips_dma_done(s);
> +        xlnx_zynqmp_qspips_update_ixr(s);
> +    }
> +
> +   return mlen;
> +}
> +
> +static bool xlnx_zynqmp_gspips_dma_can_push(XlnxZynqMPQSPIPS *s)
> +{
> +    return s->regs[R_GQSPI_DMA_SIZE] ? true : false;
> +}
> +
>  static void xlnx_zynqmp_qspips_notify(void *opaque)
>  {
>      XlnxZynqMPQSPIPS *rq = XLNX_ZYNQMP_QSPIPS(opaque);
> @@ -850,7 +978,8 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>      Fifo8 *recv_fifo;
>  
>      if (ARRAY_FIELD_EX32(rq->regs, GQSPI_SELECT, GENERIC_QSPI_EN)) {
> -        if (!(ARRAY_FIELD_EX32(rq->regs, GQSPI_CNFG, MODE_EN) == 2)) {
> +        if (ARRAY_FIELD_EX32(rq->regs, GQSPI_CNFG, MODE_EN)
> +            != GQSPI_CNFG_MODE_EN_DMA) {
>              return;
>          }
>          recv_fifo = &rq->rx_fifo_g;
> @@ -861,7 +990,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>          recv_fifo = &s->rx_fifo;
>      }
>      while (recv_fifo->num >= 4
> -           && stream_can_push(rq->dma, xlnx_zynqmp_qspips_notify, rq))
> +           && xlnx_zynqmp_gspips_dma_can_push(rq))
>      {
>          size_t ret;
>          uint32_t num;
> @@ -874,7 +1003,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>  
>          memcpy(rq->dma_buf, rxd, num);
>  
> -        ret = stream_push(rq->dma, rq->dma_buf, num, false);
> +        ret = xlnx_zynqmp_gspips_dma_push(rq, rq->dma_buf, num, false);
>          assert(ret == num);
>          xlnx_zynqmp_qspips_check_flush(rq);
>      }
> @@ -1127,6 +1256,31 @@ static void xlnx_zynqmp_qspips_write(void *opaque, hwaddr addr,
>          case R_GQSPI_GF_SNAPSHOT:
>          case R_GQSPI_MOD_ID:
>              break;
> +        case R_GQSPI_DMA_ADDR:
> +            s->regs[R_GQSPI_DMA_ADDR] = value & R_GQSPI_DMA_ADDR_ADDR_MASK;
> +            break;
> +        case R_GQSPI_DMA_SIZE:
> +            s->regs[R_GQSPI_DMA_SIZE] = value & R_GQSPI_DMA_SIZE_SIZE_MASK;
> +            break;
> +        case R_GQSPI_DMA_STS:
> +            s->regs[R_GQSPI_DMA_STS] &= ~(value &
> +                                          R_GQSPI_DMA_STS_DONE_CNT_MASK);
> +            break;
> +        case R_GQSPI_DMA_I_EN:
> +            s->regs[R_GQSPI_DMA_I_EN]    = value & R_GQSPI_DMA_INT_MASK;
> +            s->regs[R_GQSPI_DMA_I_MASK] &= ~s->regs[R_GQSPI_DMA_I_EN];
> +            s->regs[R_GQSPI_DMA_I_DIS]  &= ~s->regs[R_GQSPI_DMA_I_EN];
> +            break;
> +        case R_GQSPI_DMA_I_DIS:
> +            s->regs[R_GQSPI_DMA_I_DIS]  |= value & R_GQSPI_DMA_INT_MASK;
> +            s->regs[R_GQSPI_DMA_I_MASK] |= s->regs[R_GQSPI_DMA_I_DIS];
> +            s->regs[R_GQSPI_DMA_I_EN]   &= ~s->regs[R_GQSPI_DMA_I_DIS];
> +            s->regs[R_GQSPI_DMA_STS] &= 0;
> +            break;
> +        case R_GQSPI_DMA_ADDR_MSB:
> +            s->regs[R_GQSPI_DMA_ADDR_MSB] = value &
> +                                            R_GQSPI_DMA_ADDR_MSB_ADDR_MSB_MASK;
> +            break;
>          default:
>              s->regs[reg] = value;
>              break;
> @@ -1353,15 +1507,22 @@ static void xlnx_zynqmp_qspips_realize(DeviceState *dev, Error **errp)
>      fifo8_create(&s->rx_fifo_g, xsc->rx_fifo_size);
>      fifo8_create(&s->tx_fifo_g, xsc->tx_fifo_size);
>      fifo32_create(&s->fifo_g, 32);
> +
> +    if (s->dma_mr) {
> +        s->dma_as = g_malloc0(sizeof(AddressSpace));
> +        address_space_init(s->dma_as, s->dma_mr, NULL);
> +    } else {
> +        s->dma_as = &address_space_memory;
> +    }
>  }
>  
>  static void xlnx_zynqmp_qspips_init(Object *obj)
>  {
> -    XlnxZynqMPQSPIPS *rq = XLNX_ZYNQMP_QSPIPS(obj);
> +    XlnxZynqMPQSPIPS *s = XLNX_ZYNQMP_QSPIPS(obj);
>  
> -    object_property_add_link(obj, "stream-connected-dma", TYPE_STREAM_SINK,
> -                             (Object **)&rq->dma,
> -                             object_property_allow_set_link,
> +    object_property_add_link(obj, "xlnx_zynqmp_qspips_dma", TYPE_MEMORY_REGION,
> +                             (Object **)&s->dma_mr,
> +                             qdev_prop_allow_set_link_before_realize,
>                               OBJ_PROP_LINK_STRONG);
>  }
>  
> -- 
> 2.7.4
> 

