Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34485496274
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:57:47 +0100 (CET)
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwIM-0002A0-0p
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nAw6Z-0006Bo-9x
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:45:35 -0500
Received: from [2a00:1450:4864:20::22a] (port=37501
 helo=mail-lj1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nAw6W-0002Ee-Tm
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:45:34 -0500
Received: by mail-lj1-x22a.google.com with SMTP id x26so761872ljd.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=StfdDZ/t9t4HrGzIblXTu+m//w9rOknX3oqLSI2awcE=;
 b=js3bbIF5Gby16SLAF3qjpxA2AFE+7PLJhZRNXByQe9mI+LNLtnFkL9a+3hnRCmejPA
 q1zU9vHh6zxWFdF76mlPwCfT6UYsIEdqUIipyzhFYB24ig/Nykm+/xx7FzmnXB6YbUly
 p8ZMMhBH37jjJLiUDgZRBv0TYlZTGVHlNLNQt1DpmLmiOIRKyHwbAkiRqB+3ipHenhGk
 0Ipdi14xfjUMbFFRaqZa2WP7hG8w+9Qk6BJLanpx++7EKDgyrjj4fjPxwLTtop0B0B12
 TGvPE3bngTx3vU8bVzTahgcAheAVcYxc6WrwIoVxcgb6FhuRc/NoyTEtkAonJOfpmk9y
 5msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=StfdDZ/t9t4HrGzIblXTu+m//w9rOknX3oqLSI2awcE=;
 b=U//IbW8dIopjXyWEQQZHNJi+LyzTvTK8d1R/fV9OtmO+McPfl2u/wrRsw1skWHejrh
 S+M22xZS0PCMmzJfBtHtN/3Hi60CLxBAniugNpiqGvIslR4cSzmTnIMujYbU/ZrBxdw9
 HDyt+HsrvJQ7CMkcQI78+J6kwzfTzrGIK9cP5GlSrfyvC8hFwZ9PJbbWJGUqjbt3G4ID
 zqD7/4iDL+HPfAlYZ/HQHnRcIoIgakxozkgbY6Hlw0WI07I/hgpvR+biAMGbTIDZQbfP
 D3616dY8Ey11ufwqKBPFiRHNV0QMjfELKY3tclO8B8kCco144e7lblznt3eHKXcYU4QV
 R2Gw==
X-Gm-Message-State: AOAM530zNcMfp767c1kiH11muySmNk7YDs0bHrbKAJ/YZJT4IZiDLXGv
 oLBCMRXGqSC/nOz3xpFp5aM=
X-Google-Smtp-Source: ABdhPJwMfKEJ36Hy+ApmxgKXm7wslTYKb8pqrPjLfVak6kR6r+A/DnqEd4pNMVrK5ZyxV2gMfw5/7g==
X-Received: by 2002:a2e:988d:: with SMTP id b13mr2392914ljj.413.1642779930269; 
 Fri, 21 Jan 2022 07:45:30 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 w16sm290076lfk.89.2022.01.21.07.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:45:29 -0800 (PST)
Date: Fri, 21 Jan 2022 16:45:28 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Luc Michel <luc@lmichel.fr>
Subject: Re: [PATCH v6 07/12] hw/ssi: Add a model of Xilinx Versal's OSPI
 flash memory controller
Message-ID: <20220121154527.GA19503@fralle-msi>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
 <20220114152841.1740-8-francisco.iglesias@xilinx.com>
 <20220118214632.hhojvvcrj7ovrip7@sekoia-pc.home.lmichel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118214632.hhojvvcrj7ovrip7@sekoia-pc.home.lmichel.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -1012
X-Spam_score: -101.3
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-101.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 alistair23@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Luc,

All the suggestions and corrections look good to me so brought them in in
v7!

Thank you very much reviewing!

Best regards,
Francisco Iglesias


On [2022 Jan 18] Tue 22:46:32, Luc Michel wrote:
> Hi Francisco,
> 
> Impressive beast :-) Nicely done. Maybe I would have split it in a
> couple of commits to ease review. Also, you can use 
> 
> [diff]
>     orderFile = scripts/git.orderfile
> 
> as a local config in your QEMU git so that files are placed in a
> sensible order (.h files will come first), which ease a bit the
> reviewing process.
> 
> See my remarks below. My biggest concern is about the tx_sram fifo.
> The rest are small suggestions here and there.
> 
> On 15:28 Fri 14 Jan     , Francisco Iglesias wrote:
> [snip]
> > +
> > +static int ospi_stig_membank_rd_bytes(XlnxVersalOspi *s)
> > +{
> > +    int rd_data_fld = ARRAY_FIELD_EX32(s->regs, FLASH_COMMAND_CTRL_MEM_REG,
> > +                                       NB_OF_STIG_READ_BYTES_FLD);
> > +    int sizes[6] = { 16, 32, 64, 128, 256, 512 };
> 
> static const int sizes[6]
> 
> (or return (rd_data_fld < 6) ? (1 << (4 + rd_data_fld)) : 0; )
> 
> > +    return (rd_data_fld < 6) ? sizes[rd_data_fld] : 0;
> > +}
> > +
> [snip]
> > +
> > +static void ospi_ahb_decoder_enable_cs(XlnxVersalOspi *s, hwaddr addr)
> > +{
> > +    int cs = ospi_ahb_decoder_cs(s, addr);
> > +
> > +    if (cs >= 0) {
> > +        for (int i = 0; i < s->num_cs; i++) {
> > +            if (cs == i) {
> > +                qemu_set_irq(s->cs_lines[i], 0);
> > +            } else {
> > +                qemu_set_irq(s->cs_lines[i], 1);
> > +            }
> 
> Maybe `qemu_set_irq(s->cs_lines[i], cs != i);` instead of the if/else?
> 
> > +        }
> > +    }
> > +}
> > +
> [snip]
> > +
> > +static void ospi_stig_fill_membank(XlnxVersalOspi *s)
> > +{
> > +    int num_rd_bytes = ospi_stig_membank_rd_bytes(s);
> > +    int idx = num_rd_bytes - 8; /* first of last 8 */
> > +    int i;
> > +
> > +    for (i = 0; i < num_rd_bytes; i++) {
> > +        s->stig_membank[i] = fifo8_pop(&s->rx_fifo);
> > +    }
> > +
> 
> Even though ospi_stig_membank_rd_bytes is safe, I would add a
> 
> g_assert((idx + 4) < ARRAY_SIZE(s->stig_membank));
> 
> here, to be future proof :-)
> 
> > +    /* Fill in lower upper regs */
> > +    s->regs[R_FLASH_RD_DATA_LOWER_REG] = ldl_le_p(&s->stig_membank[idx]);
> > +    s->regs[R_FLASH_RD_DATA_UPPER_REG] = ldl_le_p(&s->stig_membank[idx + 4]);
> > +}
> > +
> [snip]
> > +
> > +static void ospi_tx_sram_write(XlnxVersalOspi *s, uint64_t value,
> > +                               unsigned int size)
> > +{
> > +    int i;
> > +    for (i = 0; i < size; i++) {
> > +        fifo8_push(&s->tx_sram, value >> 8 * i);
> 
> By tracing the callers of this function, it seems that `size' is the
> size of an MMIO access. But you don't seem to check if the tx_sram fifo
> can accept `size' elements (the fifo8_push doc stats it is undefined
> behaviour to push on a full fifo).
> 
> > +    }
> > +}
> > +
> > +
> > +static void ospi_indac_write(void *opaque, uint64_t value, unsigned int size)
> > +{
> > +    XlnxVersalOspi *s = XILINX_VERSAL_OSPI(opaque);
> > +
> > +    if (s->ind_write_disabled) {
> > +        g_assert_not_reached();
> > +    }
> 
> g_assert(!s->ind_write_disabled);
> 
> > +
> > +    if (!ospi_ind_op_completed(s->wr_ind_op)) {
> > +        ospi_tx_sram_write(s, value, size);
> > +        ospi_do_indirect_write(s);
> > +    } else {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "OSPI wr into indac area while no ongoing indac wr\n");
> > +    }
> > +}
> > +
> [snip]
> > diff --git a/include/hw/ssi/xlnx-versal-ospi.h b/include/hw/ssi/xlnx-versal-ospi.h
> > new file mode 100644
> > index 0000000000..c454ff3016
> > --- /dev/null
> > +++ b/include/hw/ssi/xlnx-versal-ospi.h
> > @@ -0,0 +1,111 @@
> > +/*
> > + * Header file for the Xilinx Versal's OSPI controller
> > + *
> > + * Copyright (C) 2021 Xilinx Inc
> > + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a copy
> > + * of this software and associated documentation files (the "Software"), to deal
> > + * in the Software without restriction, including without limitation the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +/*
> > + * This is a model of Xilinx Versal's Octal SPI flash memory controller
> > + * documented in Versal's Technical Reference manual [1] and the Versal ACAP
> > + * Register reference [2].
> > + *
> > + * References:
> > + *
> > + * [1] Versal ACAP Technical Reference Manual,
> > + *     https://www.xilinx.com/support/documentation/architecture-manuals/am011-versal-acap-trm.pdf
> > + *
> > + * [2] Versal ACAP Register Reference,
> > + *     https://www.xilinx.com/html_docs/registers/am012/am012-versal-register-reference.html#mod___ospi.html
> > + *
> > + *
> > + * QEMU interface:
> > + * + sysbus MMIO region 0: MemoryRegion for the device's registers
> > + * + sysbus MMIO region 1: MemoryRegion for flash memory linear address space
> > + *   (data transfer).
> > + * + sysbus IRQ 0: Device interrupt.
> > + * + Named GPIO input "ospi-mux-sel": 0: enables indirect access mode
> > + *   and 1: enables direct access mode.
> > + * + Property "dac-with-indac": Allow both direct accesses and indirect
> > + *   accesses simultaneously.
> > + * + Property "indac-write-disabled": Disable indirect access writes.
> > + */
> > +
> > +#ifndef XILINX_VERSAL_OSPI_H
> > +#define XILINX_VERSAL_OSPI_H
> > +
> > +#include "hw/register.h"
> > +#include "hw/ssi/ssi.h"
> > +#include "qemu/fifo32.h"
> 
> fifo8.h ?
> 
> 
> Thanks.
> 
> -- 
> Luc

