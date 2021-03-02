Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C332A3BC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:20:45 +0100 (CET)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6pI-0006Og-Tu
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lH6Z3-0004SN-Tx; Tue, 02 Mar 2021 10:03:58 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lH6Yx-0005w2-Ji; Tue, 02 Mar 2021 10:03:56 -0500
Received: by mail-lf1-x12b.google.com with SMTP id f1so31780582lfu.3;
 Tue, 02 Mar 2021 07:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aCToS9SLRtVEndvLhssCf493JbWMtR1pMVRZbHFPGUo=;
 b=CoSQwl5BEv5g6ydNqWBd8E6XXE+FY8Za5hNagfpDbzQ2Eq+dFFFbv4TrcjateP1pJn
 yNV/MxWsTbMk181t9m01AoU94z0PsUDWMigvETTuVdGNAX+YcOPUWm5BOKpG4uVz7i6y
 0nvdNJVjlBG2yAhIamyV2jG8aGEYO1vhVIEYQOMB8Rnm36baDGFhQE3Xxa3Yz+i2//Xx
 OL6LZUCwPoiD6TBhAmdXpssfFqH7R30eH2n2HGhlNqxgpFNNJSxR1NTCFT/qK/sZ57lr
 pcZjgZzH67fk74EfHRIIMKRwxB/SdMZkgZ/pUHWgciCGoTc3DtsUu+BFSDZYq8lP6OWe
 J7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aCToS9SLRtVEndvLhssCf493JbWMtR1pMVRZbHFPGUo=;
 b=SLu4vN59s4ZcK2yFIHnC7PFjbewsuYuuWdzEY+xEGWk+h8OCRFup273AZzK+/TDqWz
 O0a2+LOs+v34gdKhzX0UTuSEcbt2J7eACDwcFDUp97sXHYKUEYhYi95oT7whn70jAZFr
 ma3s/wBz29MRWPuakToZnqi5UqkSxvOI0pyG853b4ulvYP/cCadQ57BiCLnS2LkHKQkZ
 OdWBwP9+yxcGVQjSxtIk08mxKqOvnt7xab2mQZrl2xTftP27vJp29sLCRI2rOJIDFhq5
 hVpdviCgXIkMrSqh+34mcuUCVXfLAokR1LbHizetlw1Yw8L09IKqgJt99cyODpbbxJ5f
 zGPg==
X-Gm-Message-State: AOAM532XMU387R8KW/+z6PJ6z8ARF0ll5t1Ari9xwm02sHEP85fVbNWi
 LEXOdMCvb6aRhEvm9dBn4qc=
X-Google-Smtp-Source: ABdhPJy9BAzbu/8kAENEsIjDyqlUO8rQw313PVHTiGMYkLFMwgSoCQDYdXXJH7ZRsIfja6wnzaTzaQ==
X-Received: by 2002:a05:6512:210b:: with SMTP id
 q11mr12045332lfr.133.1614697429354; 
 Tue, 02 Mar 2021 07:03:49 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id d1sm2672208lfq.156.2021.03.02.07.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 07:03:48 -0800 (PST)
Date: Tue, 2 Mar 2021 16:03:48 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v6 1/5] hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA
 model
Message-ID: <20210302150348.GZ477672@toto>
References: <20210301132011.8494-1-bmeng.cn@gmail.com>
 <20210301132011.8494-2-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301132011.8494-2-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 09:20:07PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> crash. This is observed when testing VxWorks 7.
> 
> This adds a Xilinx CSU DMA model and the implementation is based on
> https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c.
> The DST part of the model is verified along with ZynqMP GQSPI model.


This looked good to me so I moved it into our tree and ran our
testsuite which discovered a couple of more issues.

I'll comment inline and show the fixes I made to make the tests pass.


> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v6:
> - int_enable and int_disable do not have its own state
> - return 0 in int_enable_pre_write() and int_disable_pre_write()
> - remove XLNX_CSU_DMA_INT_R_MASK in int_status_pre_write()
> 
> Changes in v5:
> - int_enable and int_disable do not affect each other
> - do not modify int_status int_disable_pre_write
> - set MEM_DONE in xlnx_csu_dma_done if it's SRC
> 
> Changes in v4:
> - Add complete CSU DMA model based on Edgar's branch
> - Differences with Edgar's branch:
>   1. Match the registers' FIELD to UG1807.
>   2. Remove "byte-align" property. Per UG1807, SIZE and ADDR registers
>      must be word aligned.
>   3. Make the values of int_enable and int_disable mutually exclusive
>      otherwise IRQ cannot be delivered.
>   4. Clear int_status after int_disable is set.
>   5. Coding convention issues clean-up
> 
> Changes in v3:
> - Implement DMA as a separate CSU DMA model
> 
> Changes in v2:
> - Remove unconnected TYPE_STREAM_SINK link property
> - Add a TYPE_MEMORY_REGION link property, to allow board codes to tell
>   the device what its view of the world that it is doing DMA to is
> - Replace cpu_physical_memory_write() with address_space_write()
> 
>  include/hw/dma/xlnx_csu_dma.h |  52 +++
>  hw/dma/xlnx_csu_dma.c         | 743 ++++++++++++++++++++++++++++++++++
>  hw/dma/Kconfig                |   4 +
>  hw/dma/meson.build            |   1 +
>  4 files changed, 800 insertions(+)
>  create mode 100644 include/hw/dma/xlnx_csu_dma.h
>  create mode 100644 hw/dma/xlnx_csu_dma.c
> 
> diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
> new file mode 100644
> index 0000000000..204d94c673
> --- /dev/null
> +++ b/include/hw/dma/xlnx_csu_dma.h
> @@ -0,0 +1,52 @@
> +/*
> + * Xilinx Platform CSU Stream DMA emulation
> + *
> + * This implementation is based on
> + * https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef XLNX_CSU_DMA_H
> +#define XLNX_CSU_DMA_H
> +
> +#define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
> +
> +#define XLNX_CSU_DMA_R_MAX (0x2c / 4)
> +
> +typedef struct XlnxCSUDMA {
> +    SysBusDevice busdev;
> +    MemoryRegion iomem;
> +    MemTxAttrs attr;
> +    MemoryRegion *dma_mr;
> +    AddressSpace *dma_as;
> +    qemu_irq irq;
> +    StreamSink *tx_dev; /* Used as generic StreamSink */
> +    ptimer_state *src_timer;
> +
> +    uint16_t width;
> +    bool is_dst;
> +    bool r_size_last_word;
> +
> +    StreamCanPushNotifyFn notify;
> +    void *notify_opaque;
> +
> +    uint32_t regs[XLNX_CSU_DMA_R_MAX];
> +    RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
> +} XlnxCSUDMA;
> +
> +#define XLNX_CSU_DMA(obj) \
> +    OBJECT_CHECK(XlnxCSUDMA, (obj), TYPE_XLNX_CSU_DMA)
> +
> +#endif
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> new file mode 100644
> index 0000000000..5efb60dd9e
> --- /dev/null
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -0,0 +1,743 @@
> +/*
> + * Xilinx Platform CSU Stream DMA emulation
> + *
> + * This implementation is based on
> + * https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "hw/hw.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "sysemu/dma.h"
> +#include "hw/ptimer.h"
> +#include "hw/stream.h"
> +#include "hw/register.h"
> +#include "hw/dma/xlnx_csu_dma.h"
> +
> +/*
> + * Ref: UG1087 (v1.7) February 8, 2019
> + * https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> + * CSUDMA Module section
> + */
> +REG32(ADDR, 0x0)
> +    FIELD(ADDR, ADDR, 2, 30) /* wo */
> +REG32(SIZE, 0x4)
> +    FIELD(SIZE, SIZE, 2, 27) /* wo */
> +    FIELD(SIZE, LAST_WORD, 0, 1) /* rw, only exists in SRC */
> +REG32(STATUS, 0x8)
> +    FIELD(STATUS, DONE_CNT, 13, 3) /* wtc */
> +    FIELD(STATUS, FIFO_LEVEL, 5, 8) /* ro */
> +    FIELD(STATUS, OUTSTANDING, 1, 4) /* ro */
> +    FIELD(STATUS, BUSY, 0, 1) /* ro */
> +REG32(CTRL, 0xc)
> +    FIELD(CTRL, FIFOTHRESH, 25, 7) /* rw, only exists in DST, reset 0x40 */
> +    FIELD(CTRL, APB_ERR_RESP, 24, 1) /* rw */
> +    FIELD(CTRL, ENDIANNESS, 23, 1) /* rw */
> +    FIELD(CTRL, AXI_BRST_TYPE, 22, 1) /* rw */
> +    FIELD(CTRL, TIMEOUT_VAL, 10, 12) /* rw, reset: 0xFFE */
> +    FIELD(CTRL, FIFO_THRESH, 2, 8) /* rw, reset: 0x80 */
> +    FIELD(CTRL, PAUSE_STRM, 1, 1) /* rw */
> +    FIELD(CTRL, PAUSE_MEM, 0, 1) /* rw */
> +REG32(CRC, 0x10)
> +REG32(INT_STATUS, 0x14)
> +    FIELD(INT_STATUS, FIFO_OVERFLOW, 7, 1) /* wtc */
> +    FIELD(INT_STATUS, INVALID_APB, 6, 1) /* wtc */
> +    FIELD(INT_STATUS, THRESH_HIT, 5, 1) /* wtc */
> +    FIELD(INT_STATUS, TIMEOUT_MEM, 4, 1) /* wtc */
> +    FIELD(INT_STATUS, TIMEOUT_STRM, 3, 1) /* wtc */
> +    FIELD(INT_STATUS, AXI_BRESP_ERR, 2, 1) /* wtc, SRC: AXI_RDERR */
> +    FIELD(INT_STATUS, DONE, 1, 1) /* wtc */
> +    FIELD(INT_STATUS, MEM_DONE, 0, 1) /* wtc */
> +REG32(INT_ENABLE, 0x18)
> +    FIELD(INT_ENABLE, FIFO_OVERFLOW, 7, 1) /* wtc */
> +    FIELD(INT_ENABLE, INVALID_APB, 6, 1) /* wtc */
> +    FIELD(INT_ENABLE, THRESH_HIT, 5, 1) /* wtc */
> +    FIELD(INT_ENABLE, TIMEOUT_MEM, 4, 1) /* wtc */
> +    FIELD(INT_ENABLE, TIMEOUT_STRM, 3, 1) /* wtc */
> +    FIELD(INT_ENABLE, AXI_BRESP_ERR, 2, 1) /* wtc, SRC: AXI_RDERR */
> +    FIELD(INT_ENABLE, DONE, 1, 1) /* wtc */
> +    FIELD(INT_ENABLE, MEM_DONE, 0, 1) /* wtc */
> +REG32(INT_DISABLE, 0x1c)
> +    FIELD(INT_DISABLE, FIFO_OVERFLOW, 7, 1) /* wtc */
> +    FIELD(INT_DISABLE, INVALID_APB, 6, 1) /* wtc */
> +    FIELD(INT_DISABLE, THRESH_HIT, 5, 1) /* wtc */
> +    FIELD(INT_DISABLE, TIMEOUT_MEM, 4, 1) /* wtc */
> +    FIELD(INT_DISABLE, TIMEOUT_STRM, 3, 1) /* wtc */
> +    FIELD(INT_DISABLE, AXI_BRESP_ERR, 2, 1) /* wtc, SRC: AXI_RDERR */
> +    FIELD(INT_DISABLE, DONE, 1, 1) /* wtc */
> +    FIELD(INT_DISABLE, MEM_DONE, 0, 1) /* wtc */
> +REG32(INT_MASK, 0x20)
> +    FIELD(INT_MASK, FIFO_OVERFLOW, 7, 1) /* ro, reset: 0x1 */
> +    FIELD(INT_MASK, INVALID_APB, 6, 1) /* ro, reset: 0x1 */
> +    FIELD(INT_MASK, THRESH_HIT, 5, 1) /* ro, reset: 0x1 */
> +    FIELD(INT_MASK, TIMEOUT_MEM, 4, 1) /* ro, reset: 0x1 */
> +    FIELD(INT_MASK, TIMEOUT_STRM, 3, 1) /* ro, reset: 0x1 */
> +    FIELD(INT_MASK, AXI_BRESP_ERR, 2, 1) /* ro, reset: 0x1, SRC: AXI_RDERR */
> +    FIELD(INT_MASK, DONE, 1, 1) /* ro, reset: 0x1 */
> +    FIELD(INT_MASK, MEM_DONE, 0, 1) /* ro, reset: 0x1 */
> +REG32(CTRL2, 0x24)
> +    FIELD(CTRL2, ARCACHE, 24, 3) /* rw */
> +    FIELD(CTRL2, ROUTE_BIT, 23, 1) /* rw */
> +    FIELD(CTRL2, TIMEOUT_EN, 22, 1) /* rw */
> +    FIELD(CTRL2, TIMEOUT_PRE, 4, 12) /* rw, reset: 0xFFF */
> +    FIELD(CTRL2, MAX_OUTS_CMDS, 0, 4) /* rw, reset: 0x8 */
> +REG32(ADDR_MSB, 0x28)
> +    FIELD(ADDR_MSB, ADDR_MSB, 0, 17) /* wo */
> +
> +#define R_CTRL_TIMEOUT_VAL_RESET    (0xFFE)
> +#define R_CTRL_FIFO_THRESH_RESET    (0x80)
> +#define R_CTRL_FIFOTHRESH_RESET     (0x40)
> +
> +#define R_CTRL2_TIMEOUT_PRE_RESET   (0xFFF)
> +#define R_CTRL2_MAX_OUTS_CMDS_RESET (0x8)
> +
> +#define XLNX_CSU_DMA_ERR_DEBUG      (0)
> +#define XLNX_CSU_DMA_INT_R_MASK     (0xff)
> +
> +/* UG1807: Set the prescaler value for the timeout in clk (~2.5ns) cycles */
> +#define XLNX_CSU_DMA_TIMER_FREQ     (400 * 1000 * 1000)
> +
> +static bool xlnx_csu_dma_is_paused(XlnxCSUDMA *s)
> +{
> +    bool paused;
> +
> +    paused = !!(s->regs[R_CTRL] & R_CTRL_PAUSE_STRM_MASK);
> +    paused |= !!(s->regs[R_CTRL] & R_CTRL_PAUSE_MEM_MASK);
> +
> +    return paused;
> +}
> +
> +static bool xlnx_csu_dma_get_eop(XlnxCSUDMA *s)
> +{
> +    return s->r_size_last_word;
> +}
> +
> +static bool xlnx_csu_dma_burst_is_fixed(XlnxCSUDMA *s)
> +{
> +    return !!(s->regs[R_CTRL] & R_CTRL_AXI_BRST_TYPE_MASK);
> +}
> +
> +static bool xlnx_csu_dma_timeout_enabled(XlnxCSUDMA *s)
> +{
> +    return !!(s->regs[R_CTRL2] & R_CTRL2_TIMEOUT_EN_MASK);
> +}
> +
> +static void xlnx_csu_dma_update_done_cnt(XlnxCSUDMA *s, int a)
> +{
> +    int cnt;
> +
> +    /* Increase DONE_CNT */
> +    cnt = ARRAY_FIELD_EX32(s->regs, STATUS, DONE_CNT) + a;
> +    ARRAY_FIELD_DP32(s->regs, STATUS, DONE_CNT, cnt);
> +}
> +
> +static void xlnx_csu_dma_data_process(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
> +{
> +    uint32_t bswap;
> +    uint32_t i;
> +
> +    bswap = s->regs[R_CTRL] & R_CTRL_ENDIANNESS_MASK;
> +    if (!s->is_dst && !bswap) {

This test is the wrong way, it should say:

if (s->is_dst && !bswap) {



> +        /* Fast when ENDIANNESS cleared or it's SRC */
> +        return;
> +    }
> +
> +    for (i = 0; i < len; i += 4) {
> +        uint8_t *b = &buf[i];
> +        union {
> +            uint8_t u8[4];
> +            uint32_t u32;
> +        } v = {
> +            .u8 = { b[0], b[1], b[2], b[3] }
> +        };
> +
> +        if (!s->is_dst) {
> +            s->regs[R_CRC] += v.u32;
> +        }
> +        if (bswap) {
> +            /*
> +             * No point using bswap, we need to writeback
> +             * into a potentially unaligned pointer.
> +             */
> +            b[0] = v.u8[3];
> +            b[1] = v.u8[2];
> +            b[2] = v.u8[1];
> +            b[3] = v.u8[0];
> +        }
> +    }
> +}
> +
> +/* len is in bytes */
> +static uint32_t xlnx_csu_dma_write(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
> +{
> +    hwaddr addr = (hwaddr)s->regs[R_ADDR_MSB] << 32 | s->regs[R_ADDR];
> +    MemTxResult result = MEMTX_OK;
> +
> +    xlnx_csu_dma_data_process(s, buf, len);
> +    if (xlnx_csu_dma_burst_is_fixed(s)) {
> +        uint32_t i;
> +
> +        for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
> +            uint32_t mlen = MIN(len - i, s->width);
> +
> +            result = address_space_rw(s->dma_as, addr, s->attr,
> +                                      buf, mlen, true);
> +            buf += mlen;
> +        }
> +    } else {
> +        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, true);
> +    }
> +
> +    if (result == MEMTX_OK) {
> +        return len;
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address 0x%lx for mem write",
> +                      __func__, addr);
> +        return 0;
> +    }

This causes a QEMU hang when accessing areas that are not reachable.

We should always return len here even when the access fails and
bonus to set the AXI_BRESP_ERR flag in INT_STATUS (which we had
missed in our model aswell).

e.g:
    if (result != MEMTX_OK) {
        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address 0x%lx for mem write",
                      __func__, addr);
        s->regs[R_INT_STATUS] |= R_INT_STATUS_AXI_BRESP_ERR_MASK;
        xlnx_csu_dma_update_irq(s);
    }
    return len;


> +}
> +
> +/* len is in bytes */
> +static uint32_t xlnx_csu_dma_read(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
> +{
> +    hwaddr addr = (hwaddr)s->regs[R_ADDR_MSB] << 32 | s->regs[R_ADDR];
> +    MemTxResult result = MEMTX_OK;
> +
> +    if (xlnx_csu_dma_burst_is_fixed(s)) {
> +        uint32_t i;
> +
> +        for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
> +            uint32_t mlen = MIN(len - i, s->width);
> +
> +            result = address_space_rw(s->dma_as, addr, s->attr,
> +                                      buf + i, mlen, false);
> +        }
> +    } else {
> +        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, false);
> +    }
> +
> +    if (result == MEMTX_OK) {
> +        xlnx_csu_dma_data_process(s, buf, len);
> +        return len;
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address 0x%lx for mem read",
> +                      __func__, addr);
> +        return 0;
> +    }

Similar as for writes, we need to return len and set the RESP ERR irq.


> +}
> +
> +static void xlnx_csu_dma_update_irq(XlnxCSUDMA *s)
> +{
> +    qemu_set_irq(s->irq, !!(s->regs[R_INT_STATUS] & ~s->regs[R_INT_MASK]));
> +}
> +
> +static void xlnx_csu_dma_done(XlnxCSUDMA *s)
> +{
> +    s->regs[R_STATUS] &= ~R_STATUS_BUSY_MASK;
> +    s->regs[R_INT_STATUS] |= R_INT_STATUS_DONE_MASK;
> +
> +    if (!s->is_dst) {
> +        s->regs[R_INT_STATUS] |= R_INT_STATUS_MEM_DONE_MASK;
> +    }
> +
> +    xlnx_csu_dma_update_done_cnt(s, 1);
> +}
> +
> +static uint32_t xlnx_csu_dma_advance(XlnxCSUDMA *s, uint32_t len)
> +{
> +    uint32_t size = s->regs[R_SIZE];
> +    hwaddr dst = (hwaddr)s->regs[R_ADDR_MSB] << 32 | s->regs[R_ADDR];
> +
> +    assert(len <= size);
> +
> +    size -= len;
> +    s->regs[R_SIZE] = size;
> +
> +    if (!xlnx_csu_dma_burst_is_fixed(s)) {
> +        dst += len;
> +        s->regs[R_ADDR] = (uint32_t) dst;
> +        s->regs[R_ADDR_MSB] = dst >> 32;
> +    }
> +
> +    if (size == 0) {
> +        xlnx_csu_dma_done(s);
> +    }
> +
> +    return size;
> +}
> +
> +static void xlnx_csu_dma_src_notify(void *opaque)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(opaque);
> +    unsigned char buf[4 * 1024];
> +    size_t rlen = 0;
> +
> +    ptimer_transaction_begin(s->src_timer);
> +    /* Stop the backpreassure timer */
> +    ptimer_stop(s->src_timer);
> +
> +    while (s->regs[R_SIZE] && !xlnx_csu_dma_is_paused(s) &&
> +           stream_can_push(s->tx_dev, xlnx_csu_dma_src_notify, s)) {
> +        uint32_t plen = MIN(s->regs[R_SIZE], sizeof buf);
> +        bool eop = false;
> +
> +        /* Did we fit it all? */
> +        if (s->regs[R_SIZE] == plen && xlnx_csu_dma_get_eop(s)) {
> +            eop = true;
> +        }
> +
> +        /* DMA transfer */
> +        xlnx_csu_dma_read(s, buf, plen);
> +        rlen = stream_push(s->tx_dev, buf, plen, eop);
> +        xlnx_csu_dma_advance(s, rlen);
> +    }
> +
> +    if (xlnx_csu_dma_timeout_enabled(s) && s->regs[R_SIZE] &&
> +        !stream_can_push(s->tx_dev, xlnx_csu_dma_src_notify, s)) {
> +        uint32_t timeout = ARRAY_FIELD_EX32(s->regs, CTRL, TIMEOUT_VAL);
> +        uint32_t div = ARRAY_FIELD_EX32(s->regs, CTRL2, TIMEOUT_PRE) + 1;
> +        uint32_t freq = XLNX_CSU_DMA_TIMER_FREQ;
> +
> +        freq /= div;
> +        ptimer_set_freq(s->src_timer, freq);
> +        ptimer_set_count(s->src_timer, timeout);
> +        ptimer_run(s->src_timer, 1);
> +    }
> +
> +    ptimer_transaction_commit(s->src_timer);
> +    xlnx_csu_dma_update_irq(s);
> +}
> +
> +static uint64_t addr_pre_write(RegisterInfo *reg, uint64_t val)
> +{
> +    /* Address is word aligned */
> +    return val & R_ADDR_ADDR_MASK;
> +}
> +
> +static uint64_t size_pre_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +
> +    if (s->regs[R_SIZE] != 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Starting DMA while already running.\n", __func__);
> +    }
> +
> +    if (!s->is_dst) {
> +        s->r_size_last_word = !!(val & R_SIZE_LAST_WORD_MASK);
> +    }
> +
> +    /* Size is word aligned */
> +    return val & R_SIZE_SIZE_MASK;
> +}
> +
> +static uint64_t size_post_read(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +
> +    return val | s->r_size_last_word;
> +}
> +
> +static void size_post_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +
> +    s->regs[R_STATUS] |= R_STATUS_BUSY_MASK;
> +
> +    /*
> +     * Note that if SIZE is programmed to 0, and the DMA is started,
> +     * the interrupts DONE and MEM_DONE will be asserted.
> +     */
> +    if (s->regs[R_SIZE] == 0) {
> +        xlnx_csu_dma_done(s);
> +        xlnx_csu_dma_update_irq(s);
> +        return;
> +    }
> +
> +    /* Set SIZE is considered the last step in transfer configuration */
> +    if (!s->is_dst) {
> +        xlnx_csu_dma_src_notify(s);
> +    } else {
> +        if (s->notify) {
> +            s->notify(s->notify_opaque);
> +        }
> +    }
> +}
> +
> +static uint64_t status_pre_write(RegisterInfo *reg, uint64_t val)
> +{
> +    return val & (R_STATUS_DONE_CNT_MASK | R_STATUS_BUSY_MASK);
> +}
> +
> +static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
> +{
> +    return val & R_ADDR_MSB_ADDR_MSB_MASK;
> +}
> +
> +static void ctrl_post_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +
> +    if (!s->is_dst) {
> +        if (!xlnx_csu_dma_is_paused(s)) {
> +            xlnx_csu_dma_src_notify(s);
> +        }
> +    } else {
> +        if (!xlnx_csu_dma_is_paused(s) && s->notify) {
> +            s->notify(s->notify_opaque);
> +        }
> +    }
> +}
> +
> +static uint64_t int_status_pre_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +
> +    /* DMA counter decrements when flag 'DONE' is cleared */
> +    if ((val & s->regs[R_INT_STATUS] & R_INT_STATUS_DONE_MASK)) {
> +        xlnx_csu_dma_update_done_cnt(s, -1);
> +    }
> +
> +    return s->regs[R_INT_STATUS] & ~val;
> +}
> +
> +static void int_status_post_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +
> +    xlnx_csu_dma_update_irq(s);
> +}
> +
> +static uint64_t int_enable_pre_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +    uint32_t v32 = val;
> +
> +    /*
> +     * R_INT_ENABLE doesn't have its own state.
> +     * It is used to indirectly modify R_INT_MASK.
> +     *
> +     * 1: Enable this interrupt field (the mask bit will be cleared to 0)
> +     * 0: No effect
> +     */
> +    s->regs[R_INT_MASK] &= ~v32;
> +    return 0;
> +}
> +
> +static void int_enable_post_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +
> +    xlnx_csu_dma_update_irq(s);
> +}
> +
> +static uint64_t int_disable_pre_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +    uint32_t v32 = val;
> +
> +    /*
> +     * R_INT_DISABLE doesn't have its own state.
> +     * It is used to indirectly modify R_INT_MASK.
> +     *
> +     * 1: Disable this interrupt field (the mask bit will be set to 1)
> +     * 0: No effect
> +     */
> +    s->regs[R_INT_MASK] |= v32;
> +    return 0;
> +}
> +
> +static void int_disable_post_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
> +
> +    xlnx_csu_dma_update_irq(s);
> +}
> +
> +static const RegisterAccessInfo *xlnx_csu_dma_regs_info[] = {
> +#define DMACH_REGINFO(NAME, snd)                                              \
> +    (const RegisterAccessInfo []) {                                           \
> +        {                                                                     \
> +            .name = #NAME "_ADDR",                                            \
> +            .addr = A_ADDR,                                                   \
> +            .pre_write = addr_pre_write                                       \
> +        }, {                                                                  \
> +            .name = #NAME "_SIZE",                                            \
> +            .addr = A_SIZE,                                                   \
> +            .pre_write = size_pre_write,                                      \
> +            .post_write = size_post_write,                                    \
> +            .post_read = size_post_read                                       \
> +        }, {                                                                  \
> +            .name = #NAME "_STATUS",                                          \
> +            .addr = A_STATUS,                                                 \
> +            .pre_write = status_pre_write,                                    \

The 3 DONE_CNT bits in R_STATUS need to be w1c so that SW can clear the counter.

            .w1c = R_STATUS_DONE_CNT_MASK,                                    \


For reference, I'm attaching the complete diff I used to pass the testsuite:

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index ec06fefa88..cc9eeec74b 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -155,7 +155,7 @@ static void xlnx_csu_dma_data_process(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
     uint32_t i;
 
     bswap = s->regs[R_CTRL] & R_CTRL_ENDIANNESS_MASK;
-    if (!s->is_dst && !bswap) {
+    if (s->is_dst && !bswap) {
         /* Fast when ENDIANNESS cleared or it's SRC */
         return;
     }
@@ -185,6 +185,11 @@ static void xlnx_csu_dma_data_process(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
     }
 }
 
+static void xlnx_csu_dma_update_irq(XlnxCSUDMA *s)
+{
+    qemu_set_irq(s->irq, !!(s->regs[R_INT_STATUS] & ~s->regs[R_INT_MASK]));
+}
+
 /* len is in bytes */
 static uint32_t xlnx_csu_dma_write(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
 {
@@ -206,13 +211,13 @@ static uint32_t xlnx_csu_dma_write(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
         result = address_space_rw(s->dma_as, addr, s->attr, buf, len, true);
     }
 
-    if (result == MEMTX_OK) {
-        return len;
-    } else {
+    if (result != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address 0x%lx for mem write",
                       __func__, addr);
-        return 0;
+        s->regs[R_INT_STATUS] |= R_INT_STATUS_AXI_BRESP_ERR_MASK;
+        xlnx_csu_dma_update_irq(s);
     }
+    return len;
 }
 
 /* len is in bytes */
@@ -236,17 +241,13 @@ static uint32_t xlnx_csu_dma_read(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
 
     if (result == MEMTX_OK) {
         xlnx_csu_dma_data_process(s, buf, len);
-        return len;
     } else {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address 0x%lx for mem read",
                       __func__, addr);
-        return 0;
+        s->regs[R_INT_STATUS] |= R_INT_STATUS_AXI_BRESP_ERR_MASK;
+        xlnx_csu_dma_update_irq(s);
     }
-}
-
-static void xlnx_csu_dma_update_irq(XlnxCSUDMA *s)
-{
-    qemu_set_irq(s->irq, !!(s->regs[R_INT_STATUS] & ~s->regs[R_INT_MASK]));
+    return len;
 }
 
 static void xlnx_csu_dma_done(XlnxCSUDMA *s)
@@ -489,6 +490,7 @@ static const RegisterAccessInfo *xlnx_csu_dma_regs_info[] = {
             .name = #NAME "_STATUS",                                          \
             .addr = A_STATUS,                                                 \
             .pre_write = status_pre_write,                                    \
+            .w1c = R_STATUS_DONE_CNT_MASK,                                    \
             .ro = (R_STATUS_BUSY_MASK                                         \
                    | R_STATUS_FIFO_LEVEL_MASK                                 \
                    | R_STATUS_OUTSTANDING_MASK)                               \

