Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6561BC554
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 18:36:00 +0200 (CEST)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTTDD-0001FC-Db
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 12:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jTT9h-0006K6-Mk
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jTT6S-00059P-Qo
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:32:21 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:35255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jTT6S-00058k-78; Tue, 28 Apr 2020 12:29:00 -0400
Received: by mail-lf1-x144.google.com with SMTP id r17so17414392lff.2;
 Tue, 28 Apr 2020 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FqFrx3AtsWg3hF4P86xZUzpHt2bLDXIXLE49JYEUGNM=;
 b=rObErc3f23HbpDRnxQMgWiJ6a7LaVtcZjgCaipBq4DkCNYSh+ibz4iGA9cN/G1wa9m
 Ac+oHsQ3i6opW6dQ7Xw7Oe0hbcWuPlOHv8Cn8KxkLCQcRmS5t3qC232bbV6KeQMTpUTA
 ir9ko5j1HJx+b7Z5+VIqwTAyT68iLdwu1hoxe2T3bVXNUnWHTqxAB+skh3osErXN9zRC
 z60zuYPRW2fIUF0j+iiB+0JU6rQihTpVvn0y8tZDdSEdSnwzduKBP7kQNyfKp7Q+DS9B
 1JAVHRVYxHiv46kT4h/zTCV8wW7NnxC81A5tQV0Lta9nbrEJnjc1q18ReNQyDRX3scnZ
 spgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FqFrx3AtsWg3hF4P86xZUzpHt2bLDXIXLE49JYEUGNM=;
 b=UKwZn25Eud+NWgM+h4SAPD1592U1TuxI5wM8JvtRMPEAT0pwBcVU+luX0vwtROPz/5
 99B6hBZopCHgV3nU11A0MlPye5W2VeDRTin5/UkDSs/BVAQFyihBYZ6iGewjLGfKytaD
 X12EULxKGa7zm2lcYh6iQexLSCWqe9sE5WAQajCh/NwAt0ce9LkUCkfqG05CEVcjoRGd
 GCTo9VGETsZblznGicVra2+JnnMUe/Qn7rQSdowdnKe+trqoIkOCyN2xxp6px9a0lZnp
 B+i6n0cC0TQcBsTOFnRUF6vX9CJL8TJrrWUR5DdJEOQMFBJvonl7UyWOOZhnzyiQ5vv7
 RcHg==
X-Gm-Message-State: AGi0Pub8CmOUXQeJ/lC//Qx6pJtmZadJQhLlAVpn5Y0Ww3elbIXB/a2f
 nnPehel1zPBHdxVK4d0ND10=
X-Google-Smtp-Source: APiQypIyifDo1FMKUV2r4nYdCvjZ9aOH3ugNqOPRCtWvQ5QTaDSdTdi9hJnRUyeNuZs9GDwsAwzx9A==
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr18702956lfp.4.1588091337042; 
 Tue, 28 Apr 2020 09:28:57 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id j24sm12083091ljg.60.2020.04.28.09.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:28:55 -0700 (PDT)
Date: Tue, 28 Apr 2020 18:28:23 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: Re: [PATCH v3 1/4] hw/net/can: Introduce Xilinx ZynqMP CAN controller
Message-ID: <20200428162823.GL2669@toto>
References: <1587603369-14644-1-git-send-email-fnu.vikram@xilinx.com>
 <1587603369-14644-2-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587603369-14644-2-git-send-email-fnu.vikram@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::144
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
Cc: damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, francisco.iglesias@xilinx.com,
 "open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 22, 2020 at 05:56:06PM -0700, Vikram Garhwal wrote:
> XlnxCAN is developed based on SocketCAN, QEMU CAN bus implementation.
> Bus connection and socketCAN connection for each CAN module can be set
> through command lines.

+ Damien (there's a reset question for you inline)
+ Francisco

Nice Vikram!

I've copied Francisco since he was quite invovled with this too.

Some comments inline.

Cheers,
Edgar

> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  hw/net/can/Makefile.objs         |    1 +
>  hw/net/can/xlnx-zynqmp-can.c     | 1113 ++++++++++++++++++++++++++++++++++++++
>  include/hw/net/xlnx-zynqmp-can.h |   76 +++
>  3 files changed, 1190 insertions(+)
>  create mode 100644 hw/net/can/xlnx-zynqmp-can.c
>  create mode 100644 include/hw/net/xlnx-zynqmp-can.h
> 
> diff --git a/hw/net/can/Makefile.objs b/hw/net/can/Makefile.objs
> index 9f0c4ee..0fe87dd 100644
> --- a/hw/net/can/Makefile.objs
> +++ b/hw/net/can/Makefile.objs
> @@ -2,3 +2,4 @@ common-obj-$(CONFIG_CAN_SJA1000) += can_sja1000.o
>  common-obj-$(CONFIG_CAN_PCI) += can_kvaser_pci.o
>  common-obj-$(CONFIG_CAN_PCI) += can_pcm3680_pci.o
>  common-obj-$(CONFIG_CAN_PCI) += can_mioe3680_pci.o
> +common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-can.o
> diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
> new file mode 100644
> index 0000000..31799c0
> --- /dev/null
> +++ b/hw/net/can/xlnx-zynqmp-can.c
> @@ -0,0 +1,1113 @@
> +/*
> + * QEMU model of the Xilinx CAN device.
> + *
> + * Copyright (c) 2020 Xilinx Inc.
> + *
> + * Written-by: Vikram Garhwal<fnu.vikram@xilinx.com>
> + *
> + * Based on QEMU CAN Device emulation implemented by Jin Yang, Deniz Eren and
> + * Pavel Pisa
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +#include "hw/irq.h"
> +#include "qapi/error.h"
> +#include "qemu/bitops.h"
> +#include "qemu/log.h"
> +#include "qemu/cutils.h"
> +#include "sysemu/sysemu.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +#include "net/can_emu.h"
> +#include "net/can_host.h"
> +#include "qemu/event_notifier.h"
> +#include "qom/object_interfaces.h"
> +#include "hw/net/xlnx-zynqmp-can.h"
> +
> +#ifndef XLNX_ZYNQMP_CAN_ERR_DEBUG
> +#define XLNX_ZYNQMP_CAN_ERR_DEBUG 0
> +#endif
> +
> +#define DB_PRINT(...) do { \
> +    if (XLNX_ZYNQMP_CAN_ERR_DEBUG) { \
> +        qemu_log(__VA_ARGS__); \
> +    } \
> +} while (0)
> +
> +#define MAX_DLC            8
> +#undef ERROR
> +
> +REG32(SOFTWARE_RESET_REGISTER, 0x0)
> +    FIELD(SOFTWARE_RESET_REGISTER, CEN, 1, 1)
> +    FIELD(SOFTWARE_RESET_REGISTER, SRST, 0, 1)
> +REG32(MODE_SELECT_REGISTER, 0x4)
> +    FIELD(MODE_SELECT_REGISTER, SNOOP, 2, 1)
> +    FIELD(MODE_SELECT_REGISTER, LBACK, 1, 1)
> +    FIELD(MODE_SELECT_REGISTER, SLEEP, 0, 1)
> +REG32(ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER, 0x8)
> +    FIELD(ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER, BRP, 0, 8)
> +REG32(ARBITRATION_PHASE_BIT_TIMING_REGISTER, 0xc)
> +    FIELD(ARBITRATION_PHASE_BIT_TIMING_REGISTER, SJW, 7, 2)
> +    FIELD(ARBITRATION_PHASE_BIT_TIMING_REGISTER, TS2, 4, 3)
> +    FIELD(ARBITRATION_PHASE_BIT_TIMING_REGISTER, TS1, 0, 4)
> +REG32(ERROR_COUNTER_REGISTER, 0x10)
> +    FIELD(ERROR_COUNTER_REGISTER, REC, 8, 8)
> +    FIELD(ERROR_COUNTER_REGISTER, TEC, 0, 8)
> +REG32(ERROR_STATUS_REGISTER, 0x14)
> +    FIELD(ERROR_STATUS_REGISTER, ACKER, 4, 1)
> +    FIELD(ERROR_STATUS_REGISTER, BERR, 3, 1)
> +    FIELD(ERROR_STATUS_REGISTER, STER, 2, 1)
> +    FIELD(ERROR_STATUS_REGISTER, FMER, 1, 1)
> +    FIELD(ERROR_STATUS_REGISTER, CRCER, 0, 1)
> +REG32(STATUS_REGISTER, 0x18)
> +    FIELD(STATUS_REGISTER, SNOOP, 12, 1)
> +    FIELD(STATUS_REGISTER, ACFBSY, 11, 1)
> +    FIELD(STATUS_REGISTER, TXFLL, 10, 1)
> +    FIELD(STATUS_REGISTER, TXBFLL, 9, 1)
> +    FIELD(STATUS_REGISTER, ESTAT, 7, 2)
> +    FIELD(STATUS_REGISTER, ERRWRN, 6, 1)
> +    FIELD(STATUS_REGISTER, BBSY, 5, 1)
> +    FIELD(STATUS_REGISTER, BIDLE, 4, 1)
> +    FIELD(STATUS_REGISTER, NORMAL, 3, 1)
> +    FIELD(STATUS_REGISTER, SLEEP, 2, 1)
> +    FIELD(STATUS_REGISTER, LBACK, 1, 1)
> +    FIELD(STATUS_REGISTER, CONFIG, 0, 1)
> +REG32(INTERRUPT_STATUS_REGISTER, 0x1c)
> +    FIELD(INTERRUPT_STATUS_REGISTER, TXFEMP, 14, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, TXFWMEMP, 13, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, RXFWMFLL, 12, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, WKUP, 11, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, SLP, 10, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, BSOFF, 9, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, ERROR, 8, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, RXNEMP, 7, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, RXOFLW, 6, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, RXUFLW, 5, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, RXOK, 4, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, TXBFLL, 3, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, TXFLL, 2, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, TXOK, 1, 1)
> +    FIELD(INTERRUPT_STATUS_REGISTER, ARBLST, 0, 1)
> +REG32(INTERRUPT_ENABLE_REGISTER, 0x20)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ETXFEMP, 14, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ETXFWMEMP, 13, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ERXFWMFLL, 12, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, EWKUP, 11, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ESLP, 10, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, EBSOFF, 9, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, EERROR, 8, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ERXNEMP, 7, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ERXOFLW, 6, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ERXUFLW, 5, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ERXOK, 4, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ETXBFLL, 3, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ETXFLL, 2, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, ETXOK, 1, 1)
> +    FIELD(INTERRUPT_ENABLE_REGISTER, EARBLST, 0, 1)
> +REG32(INTERRUPT_CLEAR_REGISTER, 0x24)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CTXFEMP, 14, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CTXFWMEMP, 13, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CRXFWMFLL, 12, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CWKUP, 11, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CSLP, 10, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CBSOFF, 9, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CERROR, 8, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CRXNEMP, 7, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CRXOFLW, 6, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CRXUFLW, 5, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CRXOK, 4, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CTXBFLL, 3, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CTXFLL, 2, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CTXOK, 1, 1)
> +    FIELD(INTERRUPT_CLEAR_REGISTER, CARBLST, 0, 1)
> +REG32(TIMESTAMP_REGISTER, 0x28)
> +    FIELD(TIMESTAMP_REGISTER, CTS, 0, 1)
> +REG32(WIR, 0x2c)
> +    FIELD(WIR, EW, 8, 8)
> +    FIELD(WIR, FW, 0, 8)
> +REG32(TXFIFO_ID, 0x30)
> +    FIELD(TXFIFO_ID, IDH, 21, 11)
> +    FIELD(TXFIFO_ID, SRRRTR, 20, 1)
> +    FIELD(TXFIFO_ID, IDE, 19, 1)
> +    FIELD(TXFIFO_ID, IDL, 1, 18)
> +    FIELD(TXFIFO_ID, RTR, 0, 1)
> +REG32(TXFIFO_DLC, 0x34)
> +    FIELD(TXFIFO_DLC, DLC, 28, 4)
> +REG32(TXFIFO_DATA1, 0x38)
> +    FIELD(TXFIFO_DATA1, DB0, 24, 8)
> +    FIELD(TXFIFO_DATA1, DB1, 16, 8)
> +    FIELD(TXFIFO_DATA1, DB2, 8, 8)
> +    FIELD(TXFIFO_DATA1, DB3, 0, 8)
> +REG32(TXFIFO_DATA2, 0x3c)
> +    FIELD(TXFIFO_DATA2, DB4, 24, 8)
> +    FIELD(TXFIFO_DATA2, DB5, 16, 8)
> +    FIELD(TXFIFO_DATA2, DB6, 8, 8)
> +    FIELD(TXFIFO_DATA2, DB7, 0, 8)
> +REG32(TXHPB_ID, 0x40)
> +    FIELD(TXHPB_ID, IDH, 21, 11)
> +    FIELD(TXHPB_ID, SRRRTR, 20, 1)
> +    FIELD(TXHPB_ID, IDE, 19, 1)
> +    FIELD(TXHPB_ID, IDL, 1, 18)
> +    FIELD(TXHPB_ID, RTR, 0, 1)
> +REG32(TXHPB_DLC, 0x44)
> +    FIELD(TXHPB_DLC, DLC, 28, 4)
> +REG32(TXHPB_DATA1, 0x48)
> +    FIELD(TXHPB_DATA1, DB0, 24, 8)
> +    FIELD(TXHPB_DATA1, DB1, 16, 8)
> +    FIELD(TXHPB_DATA1, DB2, 8, 8)
> +    FIELD(TXHPB_DATA1, DB3, 0, 8)
> +REG32(TXHPB_DATA2, 0x4c)
> +    FIELD(TXHPB_DATA2, DB4, 24, 8)
> +    FIELD(TXHPB_DATA2, DB5, 16, 8)
> +    FIELD(TXHPB_DATA2, DB6, 8, 8)
> +    FIELD(TXHPB_DATA2, DB7, 0, 8)
> +REG32(RXFIFO_ID, 0x50)
> +    FIELD(RXFIFO_ID, IDH, 21, 11)
> +    FIELD(RXFIFO_ID, SRRRTR, 20, 1)
> +    FIELD(RXFIFO_ID, IDE, 19, 1)
> +    FIELD(RXFIFO_ID, IDL, 1, 18)
> +    FIELD(RXFIFO_ID, RTR, 0, 1)
> +REG32(RXFIFO_DLC, 0x54)
> +    FIELD(RXFIFO_DLC, DLC, 28, 4)
> +    FIELD(RXFIFO_DLC, RXT, 0, 16)
> +REG32(RXFIFO_DATA1, 0x58)
> +    FIELD(RXFIFO_DATA1, DB0, 24, 8)
> +    FIELD(RXFIFO_DATA1, DB1, 16, 8)
> +    FIELD(RXFIFO_DATA1, DB2, 8, 8)
> +    FIELD(RXFIFO_DATA1, DB3, 0, 8)
> +REG32(RXFIFO_DATA2, 0x5c)
> +    FIELD(RXFIFO_DATA2, DB4, 24, 8)
> +    FIELD(RXFIFO_DATA2, DB5, 16, 8)
> +    FIELD(RXFIFO_DATA2, DB6, 8, 8)
> +    FIELD(RXFIFO_DATA2, DB7, 0, 8)
> +REG32(AFR, 0x60)
> +    FIELD(AFR, UAF4, 3, 1)
> +    FIELD(AFR, UAF3, 2, 1)
> +    FIELD(AFR, UAF2, 1, 1)
> +    FIELD(AFR, UAF1, 0, 1)
> +REG32(AFMR1, 0x64)
> +    FIELD(AFMR1, AMIDH, 21, 11)
> +    FIELD(AFMR1, AMSRR, 20, 1)
> +    FIELD(AFMR1, AMIDE, 19, 1)
> +    FIELD(AFMR1, AMIDL, 1, 18)
> +    FIELD(AFMR1, AMRTR, 0, 1)
> +REG32(AFIR1, 0x68)
> +    FIELD(AFIR1, AIIDH, 21, 11)
> +    FIELD(AFIR1, AISRR, 20, 1)
> +    FIELD(AFIR1, AIIDE, 19, 1)
> +    FIELD(AFIR1, AIIDL, 1, 18)
> +    FIELD(AFIR1, AIRTR, 0, 1)
> +REG32(AFMR2, 0x6c)
> +    FIELD(AFMR2, AMIDH, 21, 11)
> +    FIELD(AFMR2, AMSRR, 20, 1)
> +    FIELD(AFMR2, AMIDE, 19, 1)
> +    FIELD(AFMR2, AMIDL, 1, 18)
> +    FIELD(AFMR2, AMRTR, 0, 1)
> +REG32(AFIR2, 0x70)
> +    FIELD(AFIR2, AIIDH, 21, 11)
> +    FIELD(AFIR2, AISRR, 20, 1)
> +    FIELD(AFIR2, AIIDE, 19, 1)
> +    FIELD(AFIR2, AIIDL, 1, 18)
> +    FIELD(AFIR2, AIRTR, 0, 1)
> +REG32(AFMR3, 0x74)
> +    FIELD(AFMR3, AMIDH, 21, 11)
> +    FIELD(AFMR3, AMSRR, 20, 1)
> +    FIELD(AFMR3, AMIDE, 19, 1)
> +    FIELD(AFMR3, AMIDL, 1, 18)
> +    FIELD(AFMR3, AMRTR, 0, 1)
> +REG32(AFIR3, 0x78)
> +    FIELD(AFIR3, AIIDH, 21, 11)
> +    FIELD(AFIR3, AISRR, 20, 1)
> +    FIELD(AFIR3, AIIDE, 19, 1)
> +    FIELD(AFIR3, AIIDL, 1, 18)
> +    FIELD(AFIR3, AIRTR, 0, 1)
> +REG32(AFMR4, 0x7c)
> +    FIELD(AFMR4, AMIDH, 21, 11)
> +    FIELD(AFMR4, AMSRR, 20, 1)
> +    FIELD(AFMR4, AMIDE, 19, 1)
> +    FIELD(AFMR4, AMIDL, 1, 18)
> +    FIELD(AFMR4, AMRTR, 0, 1)
> +REG32(AFIR4, 0x80)
> +    FIELD(AFIR4, AIIDH, 21, 11)
> +    FIELD(AFIR4, AISRR, 20, 1)
> +    FIELD(AFIR4, AIIDE, 19, 1)
> +    FIELD(AFIR4, AIIDL, 1, 18)
> +    FIELD(AFIR4, AIRTR, 0, 1)
> +
> +static void can_update_irq(XlnxZynqMPCANState *s)
> +{
> +    unsigned int irq;
> +
> +    /* Watermark register interrupts. */
> +    if ((fifo32_num_free(&s->tx_fifo) / CAN_FRAME_SIZE) >
> +            ARRAY_FIELD_EX32(s->regs, WIR, EW)) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXFWMEMP, 1);
> +    }
> +
> +    if ((fifo32_num_used(&s->rx_fifo) / CAN_FRAME_SIZE) >
> +            ARRAY_FIELD_EX32(s->regs, WIR, FW)) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFWMFLL, 1);
> +    }
> +
> +    /* RX Interrupts. */
> +    if (fifo32_num_used(&s->rx_fifo) >= CAN_FRAME_SIZE) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXNEMP, 1);
> +    }
> +
> +    /* TX interrupts. */
> +    if (fifo32_is_empty(&s->tx_fifo)) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXFEMP, 1);
> +    }
> +
> +    if (fifo32_is_full(&s->tx_fifo)) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXFLL, 1);
> +    }
> +
> +    if (fifo32_is_full(&s->txhpb_fifo)) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXBFLL, 1);
> +    }
> +
> +    irq = s->regs[R_INTERRUPT_STATUS_REGISTER];
> +    irq &= s->regs[R_INTERRUPT_ENABLE_REGISTER];

Since you're working with s->regs[], it would be cleaner to make
irq the same type as the regs (i.e uint32_t).

> +
> +    qemu_set_irq(s->irq, irq);
> +}
> +
> +static void can_ier_post_write(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +
> +    can_update_irq(s);
> +}
> +
> +static uint64_t can_icr_pre_write(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t val = val64;
> +
> +    s->regs[R_INTERRUPT_STATUS_REGISTER] &= ~val;
> +    can_update_irq(s);
> +
> +    return 0;
> +}
> +
> +static void can_config_reset(XlnxZynqMPCANState *s)
> +{
> +    /* Reset all the configuration registers. */
> +    register_reset(&s->reg_info[R_SOFTWARE_RESET_REGISTER]);
> +    register_reset(&s->reg_info[R_MODE_SELECT_REGISTER]);
> +    register_reset(
> +              &s->reg_info[R_ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER]);
> +    register_reset(&s->reg_info[R_ARBITRATION_PHASE_BIT_TIMING_REGISTER]);
> +    register_reset(&s->reg_info[R_STATUS_REGISTER]);
> +    register_reset(&s->reg_info[R_INTERRUPT_STATUS_REGISTER]);
> +    register_reset(&s->reg_info[R_INTERRUPT_ENABLE_REGISTER]);
> +    register_reset(&s->reg_info[R_INTERRUPT_CLEAR_REGISTER]);
> +    register_reset(&s->reg_info[R_WIR]);
> +}
> +
> +static void can_config_mode(XlnxZynqMPCANState *s)
> +{
> +    register_reset(&s->reg_info[R_ERROR_COUNTER_REGISTER]);
> +    register_reset(&s->reg_info[R_ERROR_STATUS_REGISTER]);
> +
> +    /* Put XlnxZynqMPCANState in configuration mode. */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, CONFIG, 1);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, WKUP, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, SLP, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, BSOFF, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ERROR, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ARBLST, 0);
> +
> +    can_update_irq(s);
> +}
> +
> +static void update_status_register_mode_bits(XlnxZynqMPCANState *s)
> +{
> +    /* Wake up interrupt bit. */
> +    bool wakeup_irq_val = (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER,
> +                            SLEEP) == 0) && ARRAY_FIELD_EX32(s->regs,
> +                            STATUS_REGISTER, SLEEP);

Looks like you have too many layers of parentheses here?

> +
> +    /* Sleep interrupt bit. */
> +    bool sleep_irq_val = (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER,
> +                            SLEEP) && (ARRAY_FIELD_EX32(s->regs,
> +                            STATUS_REGISTER, SLEEP) == 0));

Here too.


> +
> +    /* Clear previous core mode status bits. */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, LBACK, 0);
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SLEEP, 0);
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SNOOP, 0);
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, NORMAL, 0);
> +
> +    /* set current mode bit and generate irqs accordingly. */
> +    if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, LBACK)) {
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, LBACK, 1);
> +    } else if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SLEEP)) {
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SLEEP, 1);
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, SLP,
> +                            sleep_irq_val);
> +    } else if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SNOOP)) {
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SNOOP, 1);
> +    } else {
> +        /*
> +         * If all bits are zero then XlnxZynqMPCANState is set in normal mode.
> +         */
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, NORMAL, 1);
> +        /* Set wakeup interrupt bit. */
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, WKUP,
> +                            wakeup_irq_val);
> +    }
> +
> +    can_update_irq(s);
> +}
> +
> +static void can_exit_sleep_mode(XlnxZynqMPCANState *s)
> +{
> +    ARRAY_FIELD_DP32(s->regs, MODE_SELECT_REGISTER, SLEEP, 0);
> +    update_status_register_mode_bits(s);
> +}
> +
> +static void generate_frame(qemu_can_frame *frame, uint32_t *data)
> +{
> +    frame->can_id = data[0];
> +    frame->can_dlc = FIELD_EX32(data[1], TXFIFO_DLC, DLC);
> +
> +    frame->data[0] = FIELD_EX32(data[2], TXFIFO_DATA1, DB3);
> +    frame->data[1] = FIELD_EX32(data[2], TXFIFO_DATA1, DB2);
> +    frame->data[2] = FIELD_EX32(data[2], TXFIFO_DATA1, DB1);
> +    frame->data[3] = FIELD_EX32(data[2], TXFIFO_DATA1, DB0);
> +
> +    frame->data[4] = FIELD_EX32(data[3], TXFIFO_DATA2, DB7);
> +    frame->data[5] = FIELD_EX32(data[3], TXFIFO_DATA2, DB6);
> +    frame->data[6] = FIELD_EX32(data[3], TXFIFO_DATA2, DB5);
> +    frame->data[7] = FIELD_EX32(data[3], TXFIFO_DATA2, DB4);
> +}
> +
> +static bool tx_ready_check(XlnxZynqMPCANState *s)
> +{
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, SRST)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Attempting to transfer data while"
> +                      " XlnxZynqMPCANState%d is in reset mode\n",
> +                      s->cfg.ctrl_idx);
> +        return false;
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN) == 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Attempting to transfer data while"
> +                      " XlnxZynqMPCANState%d is in configuration mode.Reset the"

Missing space after dot "mode.Reset".                                  ^^^

> +                      " core so operations can start fresh\n",
> +                      s->cfg.ctrl_idx);
> +        return false;
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SNOOP)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Attempting to transfer data while"
> +                        " XlnxZynqMPCANState%d is in SNOOP MODE\n",
> +                         s->cfg.ctrl_idx);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
> +{
> +    qemu_can_frame frame;
> +    uint32_t data[CAN_FRAME_SIZE];
> +    int i;
> +    bool can_tx = tx_ready_check(s);
> +
> +    if (can_tx) {
> +        while (!fifo32_is_empty(fifo)) {
> +            for (i = 0; i < CAN_FRAME_SIZE; i++) {
> +                data[i] = fifo32_pop(fifo);
> +            }
> +
> +            if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, LBACK)) {
> +                /*
> +                 * Controller is in loopback. In Loopback mode, the CAN core
> +                 * transmits a recessive bitstream on to the XlnxZynqMPCANState
> +                 * Bus. Any message transmitted is looped back to the RX line
> +                 * and acknowledged. The XlnxZynqMPCANState core receives any
> +                 * message that it transmits.
> +                 */
> +                if (fifo32_is_full(&s->rx_fifo)) {
> +                    DB_PRINT("Loopback: RX FIFO is full."
> +                             "TX FIFO will be flushed.\n");
> +
> +                    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER,
> +                                      RXOFLW, 1);
> +                } else {
> +                    for (i = 0; i < CAN_FRAME_SIZE; i++) {
> +                        fifo32_push(&s->rx_fifo, data[i]);
> +                    }
> +
> +                    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER,
> +                                      RXOK, 1);
> +                }
> +            } else {
> +                /* Normal mode Tx. */
> +                generate_frame(&frame, data);
> +
> +                can_bus_client_send(&s->bus_client, &frame, 1);
> +            }
> +        }
> +
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 1);
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, TXBFLL, 0);
> +
> +        if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP)) {
> +            can_exit_sleep_mode(s);
> +        }
> +    } else {
> +        DB_PRINT("CAN is not enabled for data transfer.\n");
> +    }
> +
> +    can_update_irq(s);
> +}
> +
> +static uint64_t can_srr_pre_write(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t val = val64;
> +
> +    ARRAY_FIELD_DP32(s->regs, SOFTWARE_RESET_REGISTER, CEN,
> +                        FIELD_EX32(val, SOFTWARE_RESET_REGISTER, CEN));
> +
> +    if (FIELD_EX32(val, SOFTWARE_RESET_REGISTER, SRST)) {
> +        DB_PRINT("Resetting XlnxZynqMPCANState%d\n", s->cfg.ctrl_idx);
> +
> +        /* First, core will do software reset then will enter in config mode. */
> +        can_config_reset(s);
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN) == 0) {
> +        can_config_mode(s);
> +

I would drop this blank line.


> +    } else {
> +        /*
> +         * Leave config mode. Now XlnxZynqMPCANState core will enter Normal,
> +         * Sleep, snoop or Loopback mode depending upon LBACK, SLEEP, SNOOP
> +         * register states.
> +         */
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, CONFIG, 0);
> +
> +        /* XlnxZynqMP CAN is out of config mode. it will send pending data. */
> +        transfer_fifo(s, &s->txhpb_fifo);
> +        transfer_fifo(s, &s->tx_fifo);
> +    }
> +
> +    update_status_register_mode_bits(s);
> +
> +    return s->regs[R_SOFTWARE_RESET_REGISTER];
> +}
> +
> +static uint64_t can_msr_pre_write(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t val = val64;
> +    uint8_t multi_mode = 0;
> +
> +    /*
> +     * Multiple mode set check. This is done to make sure user doesn't set
> +     * multiple modes.
> +     */
> +    multi_mode = FIELD_EX32(val, MODE_SELECT_REGISTER, LBACK) +
> +                 FIELD_EX32(val, MODE_SELECT_REGISTER, SLEEP) +
> +                 FIELD_EX32(val, MODE_SELECT_REGISTER, SNOOP);
> +
> +    if (multi_mode > 1) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Attempting to configure several modes "
> +                     "simultaneously. One mode will be selected according to "
> +                     "their priority: LBACK > SLEEP > SNOOP.\n ");
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN) == 0) {
> +        /* We are in configuration mode, any mode can be selected. */
> +        s->regs[R_MODE_SELECT_REGISTER] = val;
> +    } else {
> +        bool sleep_mode_bit = FIELD_EX32(val, MODE_SELECT_REGISTER, SLEEP);
> +
> +        ARRAY_FIELD_DP32(s->regs, MODE_SELECT_REGISTER, SLEEP, sleep_mode_bit);
> +
> +        if (FIELD_EX32(val, MODE_SELECT_REGISTER, LBACK)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Attempting to set LBACK mode "
> +                          "without setting CEN bit as 0\n");
> +        } else if (FIELD_EX32(val, MODE_SELECT_REGISTER, SNOOP)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Attempting to set SNOOP mode "
> +                              "without setting CEN bit as 0\n");
> +        }
> +
> +        update_status_register_mode_bits(s);
> +    }
> +    return s->regs[R_MODE_SELECT_REGISTER];
> +}
> +
> +static uint64_t can_brpr_pre_write(RegisterInfo  *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t val = val64;
> +
> +    /* Only allow writes when in config mode. */
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) {
> +        val = s->regs[R_ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER];
> +    }
> +
> +    return val;
> +}
> +
> +static uint64_t can_btr_pre_write(RegisterInfo  *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t val = val64;
> +
> +    /* Only allow writes when in config mode. */
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) {
> +        val = s->regs[R_ARBITRATION_PHASE_BIT_TIMING_REGISTER];
> +    }
> +
> +    return val;
> +}
> +
> +static uint64_t can_tcr_pre_write(RegisterInfo  *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t val = val64;
> +
> +    if (FIELD_EX32(val, TIMESTAMP_REGISTER, CTS)) {
> +        s->rx_time_stamp = 0;
> +    }
> +
> +    return 0;
> +}
> +
> +static void update_rx_fifo(XlnxZynqMPCANState *s, const qemu_can_frame *frame)
> +{
> +    uint32_t filter_pass = 0;
> +
> +    /* If no filter is enabled. Message will be stored in FIFO. */
> +    if (!((ARRAY_FIELD_EX32(s->regs, AFR, UAF1)) |
> +       (ARRAY_FIELD_EX32(s->regs, AFR, UAF2)) |
> +       (ARRAY_FIELD_EX32(s->regs, AFR, UAF3)) |
> +       (ARRAY_FIELD_EX32(s->regs, AFR, UAF4)))) {
> +        filter_pass = 1;
> +    }
> +
> +    /*
> +     * Messages that pass any of the acceptance filters will be stored in
> +     * the RX FIFO.
> +     */
> +    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF1)) {
> +        uint32_t id_masked = s->regs[R_AFMR1] & frame->can_id;
> +        uint32_t filter_id_masked = s->regs[R_AFMR1] & s->regs[R_AFIR1];
> +
> +        if (filter_id_masked == id_masked) {
> +            filter_pass = 1;
> +        }
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF2)) {
> +        uint32_t id_masked = s->regs[R_AFMR2] & frame->can_id;
> +        uint32_t filter_id_masked = s->regs[R_AFMR2] & s->regs[R_AFIR2];
> +
> +        if (filter_id_masked == id_masked) {
> +            filter_pass = 1;
> +        }
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF3)) {
> +        uint32_t id_masked = s->regs[R_AFMR3] & frame->can_id;
> +        uint32_t filter_id_masked = s->regs[R_AFMR3] & s->regs[R_AFIR3];
> +
> +        if (filter_id_masked == id_masked) {
> +            filter_pass = 1;
> +        }
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF4)) {
> +        uint32_t id_masked = s->regs[R_AFMR4] & frame->can_id;
> +        uint32_t filter_id_masked = s->regs[R_AFMR4] & s->regs[R_AFIR4];
> +
> +        if (filter_id_masked == id_masked) {
> +            filter_pass = 1;
> +        }
> +    }
> +
> +    /* Store the message in fifo if it passed through any of the filters. */
> +    if (filter_pass && frame->can_dlc <= MAX_DLC) {
> +
> +        if (fifo32_is_full(&s->rx_fifo)) {
> +            DB_PRINT("RX FIFO is full.\n");
> +
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 1);
> +        } else {
> +            s->rx_time_stamp += 1;
> +
> +            fifo32_push(&s->rx_fifo, frame->can_id);
> +
> +            fifo32_push(&s->rx_fifo, (deposit32(0, R_RXFIFO_DLC_DLC_SHIFT,
> +                                                R_RXFIFO_DLC_DLC_LENGTH,
> +                                                frame->can_dlc) |
> +                                      deposit32(0, R_RXFIFO_DLC_RXT_SHIFT,
> +                                                R_RXFIFO_DLC_RXT_LENGTH,
> +                                                s->rx_time_stamp)));
> +
> +            /* First 32 bit of the data. */
> +            fifo32_push(&s->rx_fifo, (deposit32(0, R_TXFIFO_DATA1_DB3_SHIFT,
> +                                        R_TXFIFO_DATA1_DB3_LENGTH,
> +                                        frame->data[0]) |
> +                                      deposit32(0, R_TXFIFO_DATA1_DB2_SHIFT,
> +                                        R_TXFIFO_DATA1_DB2_LENGTH,
> +                                        frame->data[1]) |
> +                                      deposit32(0, R_TXFIFO_DATA1_DB1_SHIFT,
> +                                        R_TXFIFO_DATA1_DB1_LENGTH,
> +                                        frame->data[2]) |
> +                                      deposit32(0, R_TXFIFO_DATA1_DB0_SHIFT,
> +                                        R_TXFIFO_DATA1_DB0_LENGTH,
> +                                        frame->data[3])));
> +            /* Last 32 bit of the data. */
> +            fifo32_push(&s->rx_fifo, (deposit32(0, R_TXFIFO_DATA2_DB7_SHIFT,
> +                                         R_TXFIFO_DATA2_DB7_LENGTH,
> +                                         frame->data[4]) |
> +                                      deposit32(0, R_TXFIFO_DATA2_DB6_SHIFT,
> +                                         R_TXFIFO_DATA2_DB6_LENGTH,
> +                                         frame->data[5]) |
> +                                      deposit32(0, R_TXFIFO_DATA2_DB5_SHIFT,
> +                                         R_TXFIFO_DATA2_DB5_LENGTH,
> +                                         frame->data[6]) |
> +                                      deposit32(0, R_TXFIFO_DATA2_DB4_SHIFT,
> +                                          R_TXFIFO_DATA2_DB4_LENGTH,
> +                                          frame->data[7])));
> +
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
> +        }
> +
> +        can_update_irq(s);
> +

I would drop this blank line...

> +    } else {
> +        DB_PRINT("Message didn't pass through any filter"
> +                  "or dlc is not in range\n");
> +    }
> +}
> +
> +static uint64_t can_rxfifo_pre_read(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t r = 0;
> +
> +    if (!fifo32_is_empty(&s->rx_fifo)) {
> +        r = fifo32_pop(&s->rx_fifo);
> +    } else {
> +        DB_PRINT("No message in RXFIFO\n");
> +
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXUFLW, 1);
> +    }
> +
> +    can_update_irq(s);
> +    return r;
> +}
> +
> +static void can_filter_enable_post_write(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +
> +    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF1) &&
> +        ARRAY_FIELD_EX32(s->regs, AFR, UAF2) &&
> +        ARRAY_FIELD_EX32(s->regs, AFR, UAF3) &&
> +        ARRAY_FIELD_EX32(s->regs, AFR, UAF4)) {
> +
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, ACFBSY, 1);
> +

Another odd blank line.

> +    } else {
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, ACFBSY, 0);
> +    }
> +}
> +
> +static uint64_t can_filter_mask_pre_write(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t reg_idx = (reg->access->addr) / 4;
> +    uint32_t val = val64;
> +    uint32_t filter_number = (reg_idx - R_AFMR1) / 2;
> +
> +    /* modify an acceptance filter, the corresponding UAF bit should be '0.' */
> +    if (!(s->regs[R_AFR] & (1 << filter_number))) {
> +        s->regs[reg_idx] = val;
> +    } else {
> +        DB_PRINT("Acceptance filter %d mask is not set as it's corresponding "
> +                 "UAF bit is not set to 0\n", filter_number + 1);
> +    }
> +
> +    return s->regs[reg_idx];
> +}
> +
> +static uint64_t can_filter_id_pre_write(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t reg_idx = (reg->access->addr) / 4;
> +    uint32_t val = val64;
> +    uint32_t filter_number = (reg_idx - R_AFIR1) / 2;
> +
> +    if (!(s->regs[R_AFR] & (1 << filter_number))) {
> +        s->regs[reg_idx] = val;
> +    } else {
> +        DB_PRINT("Acceptance filter %d id is not set as it's corresponding "
> +                 "UAF bit is not set to 0\n", filter_number + 1);

Should this be a LOG_GUEST_ERROR?


> +    }
> +
> +    return s->regs[reg_idx];
> +}
> +
> +static void can_tx_post_write(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
> +    uint32_t val = val64;
> +
> +    bool is_txhpb = reg->access->addr > A_TXFIFO_DATA2;
> +
> +    bool initiate_transfer = (reg->access->addr == A_TXFIFO_DATA2) ||
> +                             (reg->access->addr == A_TXHPB_DATA2);
> +
> +    Fifo32 *f = is_txhpb ? &s->txhpb_fifo : &s->tx_fifo;
> +
> +    DB_PRINT("TX FIFO write for CAN%d\n", s->cfg.ctrl_idx);
> +
> +    if (!fifo32_is_full(f)) {
> +        fifo32_push(f, val);
> +    } else {
> +        DB_PRINT("TX FIFO is full.\n");

Doesn't this trigger any SW visible event like an interrupt, set some status bit?
We should probably LOG_GUEST_ERROR here too...

> +    }
> +
> +    /* Initiate the message send if TX register is written. */
> +    if (initiate_transfer &&
> +            ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) {
> +        transfer_fifo(s, f);
> +    }
> +
> +    can_update_irq(s);
> +}
> +
> +static const RegisterAccessInfo can_regs_info[] = {
> +    {   .name = "SOFTWARE_RESET_REGISTER",
> +        .addr = A_SOFTWARE_RESET_REGISTER,
> +        .rsvd = 0xfffffffc,
> +        .pre_write = can_srr_pre_write,
> +    },{ .name = "MODE_SELECT_REGISTER",
> +        .addr = A_MODE_SELECT_REGISTER,
> +        .rsvd = 0xfffffff8,
> +        .pre_write = can_msr_pre_write,
> +    },{ .name = "ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER",
> +        .addr = A_ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER,
> +        .rsvd = 0xffffff00,
> +        .pre_write = can_brpr_pre_write,
> +    },{ .name = "ARBITRATION_PHASE_BIT_TIMING_REGISTER",
> +        .addr = A_ARBITRATION_PHASE_BIT_TIMING_REGISTER,
> +        .rsvd = 0xfffffe00,
> +        .pre_write = can_btr_pre_write,
> +    },{ .name = "ERROR_COUNTER_REGISTER",
> +        .addr = A_ERROR_COUNTER_REGISTER,
> +        .rsvd = 0xffff0000,
> +        .ro = 0xffffffff,
> +    },{ .name = "ERROR_STATUS_REGISTER",
> +        .addr = A_ERROR_STATUS_REGISTER,
> +        .rsvd = 0xffffffe0,
> +        .w1c = 0x1f,
> +    },{ .name = "STATUS_REGISTER",  .addr = A_STATUS_REGISTER,
> +        .reset = 0x1,
> +        .rsvd = 0xffffe000,
> +        .ro = 0x1fff,
> +    },{ .name = "INTERRUPT_STATUS_REGISTER",
> +        .addr = A_INTERRUPT_STATUS_REGISTER,
> +        .reset = 0x6000,
> +        .rsvd = 0xffff8000,
> +        .ro = 0x7fff,
> +    },{ .name = "INTERRUPT_ENABLE_REGISTER",
> +        .addr = A_INTERRUPT_ENABLE_REGISTER,
> +        .rsvd = 0xffff8000,
> +        .post_write = can_ier_post_write,
> +    },{ .name = "INTERRUPT_CLEAR_REGISTER",
> +        .addr = A_INTERRUPT_CLEAR_REGISTER,
> +        .rsvd = 0xffff8000,
> +        .pre_write = can_icr_pre_write,
> +    },{ .name = "TIMESTAMP_REGISTER",
> +        .addr = A_TIMESTAMP_REGISTER,
> +        .rsvd = 0xfffffffe,
> +        .pre_write = can_tcr_pre_write,
> +    },{ .name = "WIR",  .addr = A_WIR,
> +        .reset = 0x3f3f,
> +        .rsvd = 0xffff0000,
> +    },{ .name = "TXFIFO_ID",  .addr = A_TXFIFO_ID,
> +        .post_write = can_tx_post_write,
> +    },{ .name = "TXFIFO_DLC",  .addr = A_TXFIFO_DLC,
> +        .rsvd = 0xfffffff,
> +        .post_write = can_tx_post_write,
> +    },{ .name = "TXFIFO_DATA1",  .addr = A_TXFIFO_DATA1,
> +        .post_write = can_tx_post_write,
> +    },{ .name = "TXFIFO_DATA2",  .addr = A_TXFIFO_DATA2,
> +        .post_write = can_tx_post_write,
> +    },{ .name = "TXHPB_ID",  .addr = A_TXHPB_ID,
> +        .post_write = can_tx_post_write,
> +    },{ .name = "TXHPB_DLC",  .addr = A_TXHPB_DLC,
> +        .rsvd = 0xfffffff,
> +        .post_write = can_tx_post_write,
> +    },{ .name = "TXHPB_DATA1",  .addr = A_TXHPB_DATA1,
> +        .post_write = can_tx_post_write,
> +    },{ .name = "TXHPB_DATA2",  .addr = A_TXHPB_DATA2,
> +        .post_write = can_tx_post_write,
> +    },{ .name = "RXFIFO_ID",  .addr = A_RXFIFO_ID,
> +        .ro = 0xffffffff,
> +        .post_read = can_rxfifo_pre_read,
> +    },{ .name = "RXFIFO_DLC",  .addr = A_RXFIFO_DLC,
> +        .rsvd = 0xfff0000,
> +        .post_read = can_rxfifo_pre_read,
> +    },{ .name = "RXFIFO_DATA1",  .addr = A_RXFIFO_DATA1,
> +        .post_read = can_rxfifo_pre_read,
> +    },{ .name = "RXFIFO_DATA2",  .addr = A_RXFIFO_DATA2,
> +        .post_read = can_rxfifo_pre_read,
> +    },{ .name = "AFR",  .addr = A_AFR,
> +        .rsvd = 0xfffffff0,
> +        .post_write = can_filter_enable_post_write,
> +    },{ .name = "AFMR1",  .addr = A_AFMR1,
> +        .pre_write = can_filter_mask_pre_write,
> +    },{ .name = "AFIR1",  .addr = A_AFIR1,
> +        .pre_write = can_filter_id_pre_write,
> +    },{ .name = "AFMR2",  .addr = A_AFMR2,
> +        .pre_write = can_filter_mask_pre_write,
> +    },{ .name = "AFIR2",  .addr = A_AFIR2,
> +        .pre_write = can_filter_id_pre_write,
> +    },{ .name = "AFMR3",  .addr = A_AFMR3,
> +        .pre_write = can_filter_mask_pre_write,
> +    },{ .name = "AFIR3",  .addr = A_AFIR3,
> +        .pre_write = can_filter_id_pre_write,
> +    },{ .name = "AFMR4",  .addr = A_AFMR4,
> +        .pre_write = can_filter_mask_pre_write,
> +    },{ .name = "AFIR4",  .addr = A_AFIR4,
> +        .pre_write = can_filter_id_pre_write,
> +    }
> +};
> +
> +static const MemoryRegionOps can_ops = {
> +    .read = register_read_memory,
> +    .write = register_write_memory,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void xlnx_zynqmp_can_reset(DeviceState *dev)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(dev);
> +    unsigned int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->reg_info); ++i) {
> +        register_reset(&s->reg_info[i]);

These register resets will end up triggering update_irq() calls but that
interrupt propagation may get lost because devices reset in random order
so the receiving device may get reset after this one. This is a problem
with many models I think but with Damiens new reset API we can trigger
update_irq() post-reset.

@Damien, are there any examples Vikram could look at to solve this?


> +    }
> +
> +    /*
> +     * Reset FIFOs when CAN model is reset. This will clear the fifo writes
> +     * done by post_write which gets called from register_reset function,
> +     * post_write handle will not be able to trigger tx because CAN will be
> +     * disabled when software_reset_register is cleared first.
> +     */
> +    fifo32_reset(&s->rx_fifo);
> +    fifo32_reset(&s->tx_fifo);
> +    fifo32_reset(&s->txhpb_fifo);
> +}
> +
> +static bool xlnx_zynqmp_can_can_receive(CanBusClientState *client)
> +{
> +    XlnxZynqMPCANState *s = container_of(client, XlnxZynqMPCANState,
> +                                         bus_client);
> +
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, SRST)) {
> +        DB_PRINT("XlnxZynqMPCANState%d Controller is reset\n", s->cfg.ctrl_idx);
> +        return false;
> +    } else if ((ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) == 0) {
> +        DB_PRINT("XlnxZynqMPCANState%d is disabled. Incoming messages will be"
> +                 "discarded\n", s->cfg.ctrl_idx);
> +        return false;
> +    } else {
> +        return true;
> +    }
> +}
> +
> +static ssize_t xlnx_zynqmp_can_receive(CanBusClientState *client,
> +                               const qemu_can_frame *buf, size_t buf_size) {
> +    XlnxZynqMPCANState *s = container_of(client, XlnxZynqMPCANState,
> +                                        bus_client);
> +    const qemu_can_frame *frame = buf;
> +
> +    DB_PRINT("Incoming data for CAN%d\n", s->cfg.ctrl_idx);
> +
> +    if (buf_size <= 0) {
> +        DB_PRINT("junk data received on XlnxZynqMPCANState bus\n");
> +        return 0;
> +    }
> +    if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, LBACK)) {
> +        /*
> +         * XlnxZynqMPCANState will not participate in normal bus communication
> +         *  and does not receive any messages transmitted by other CAN nodes.
> +         */
> +        DB_PRINT("XlnxZynqMPCANState is in loopback mode."
> +                 " It will not receive data.\n");
> +
> +    } else if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SNOOP)) {
> +        /* Snoop Mode: Just keep the data. no response back. */
> +        update_rx_fifo(s, frame);
> +    } else if ((ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP))) {
> +        /*
> +         * XlnxZynqMPCANState is in sleep mode. Any data on bus will bring it
> +         * to wake up state.
> +         */
> +        can_exit_sleep_mode(s);
> +        update_rx_fifo(s, frame);
> +    } else if ((ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP)) == 0) {
> +        update_rx_fifo(s, frame);
> +    } else {
> +        DB_PRINT("Can't receive data as XlnxZynqMPCANState is not configured"
> +                  " correctly.\n");
> +    }
> +
> +    return 1;
> +}
> +
> +static CanBusClientInfo can_xilinx_bus_client_info = {
> +    .can_receive = xlnx_zynqmp_can_can_receive,
> +    .receive = xlnx_zynqmp_can_receive,
> +};
> +
> +static int xlnx_zynqmp_can_connect_to_bus(XlnxZynqMPCANState *s,
> +                                          CanBusState *bus)
> +{
> +    s->bus_client.info = &can_xilinx_bus_client_info;
> +
> +    if (can_bus_insert_client(bus, &s->bus_client) < 0) {
> +        return -1;
> +    }
> +    return 0;
> +}
> +
> +static void xlnx_zynqmp_can_realize(DeviceState *dev, Error **errp)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(dev);
> +
> +    if (s->cfg.ctrl_idx > MAX_CAN_CTRLS) {
> +        error_setg(errp, "ctrl-idx: %d exceeds max XlnxZynqMPCANState"
> +                   " controller index", s->cfg.ctrl_idx);
> +        return;
> +    }
> +
> +    if (s->canbus[s->cfg.ctrl_idx]) {
> +        if (xlnx_zynqmp_can_connect_to_bus(s, s->canbus[s->cfg.ctrl_idx]) < 0) {
> +            error_setg(errp, "xlnx_zynqmp_can_connect_to_bus failed");
> +        }
> +
> +    } else {
> +        /* If no bus is set. */
> +        DB_PRINT("Canbus%d property is not set for xlnxCAN%d\n",
> +                 s->cfg.ctrl_idx, s->cfg.ctrl_idx);
> +    }
> +
> +    /* Create RX FIFO, TXFIFO, TXHPB storage. */
> +    fifo32_create(&s->rx_fifo, RXFIFO_SIZE);
> +    fifo32_create(&s->tx_fifo, RXFIFO_SIZE);
> +    fifo32_create(&s->txhpb_fifo, CAN_FRAME_SIZE);
> +}
> +
> +static void xlnx_zynqmp_can_init(Object *obj)
> +{
> +    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    RegisterInfoArray *reg_array;
> +
> +    memory_region_init(&s->iomem, obj, TYPE_XLNX_ZYNQMP_CAN,
> +                        XLNX_ZYNQMP_CAN_R_MAX * 4);
> +    reg_array = register_init_block32(DEVICE(obj), can_regs_info,
> +                               ARRAY_SIZE(can_regs_info),
> +                               s->reg_info, s->regs,
> +                               &can_ops,
> +                               XLNX_ZYNQMP_CAN_ERR_DEBUG,
> +                               XLNX_ZYNQMP_CAN_R_MAX * 4);
> +
> +    memory_region_add_subregion(&s->iomem, 0x00, &reg_array->mem);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> +
> +    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
> +                             (Object **)&s->canbus[0],
> +                             qdev_prop_allow_set_link_before_realize,
> +                             0, &error_abort);
> +
> +    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
> +                             (Object **)&s->canbus[1],
> +                             qdev_prop_allow_set_link_before_realize,
> +                             0, &error_abort);
> +}
> +
> +static const VMStateDescription vmstate_can = {
> +    .name = TYPE_XLNX_ZYNQMP_CAN,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_FIFO32(rx_fifo, XlnxZynqMPCANState),
> +        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPCANState, XLNX_ZYNQMP_CAN_R_MAX),
> +        VMSTATE_UINT8(cfg.ctrl_idx, XlnxZynqMPCANState),
> +        VMSTATE_END_OF_LIST(),
> +    }
> +};
> +
> +static Property xlnx_zynqmp_can_properties[] = {
> +    DEFINE_PROP_UINT8("ctrl-idx", XlnxZynqMPCANState, cfg.ctrl_idx, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void xlnx_zynqmp_can_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->reset = xlnx_zynqmp_can_reset;
> +    dc->realize = xlnx_zynqmp_can_realize;
> +    device_class_set_props(dc, xlnx_zynqmp_can_properties);
> +    dc->vmsd = &vmstate_can;
> +}
> +
> +static const TypeInfo can_info = {
> +    .name          = TYPE_XLNX_ZYNQMP_CAN,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(XlnxZynqMPCANState),
> +    .class_init    = xlnx_zynqmp_can_class_init,
> +    .instance_init = xlnx_zynqmp_can_init,
> +};
> +
> +static void can_register_types(void)
> +{
> +    type_register_static(&can_info);
> +}
> +
> +type_init(can_register_types)
> diff --git a/include/hw/net/xlnx-zynqmp-can.h b/include/hw/net/xlnx-zynqmp-can.h
> new file mode 100644
> index 0000000..3038542
> --- /dev/null
> +++ b/include/hw/net/xlnx-zynqmp-can.h
> @@ -0,0 +1,76 @@
> +/*
> + * QEMU model of the Xilinx CAN device.
> + *
> + * Copyright (c) 2020 Xilinx Inc.
> + *
> + * Written-by: Vikram Garhwal<fnu.vikram@xilinx.com>
> + *
> + * Based on QEMU CAN Device emulation implemented by Jin Yang, Deniz Eren and
> + * Pavel Pisa.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_CAN_XILINX_H
> +#define HW_CAN_XILINX_H

We should probably name these guarding macros according to the filename.


> +
> +#include "hw/register.h"
> +#include "net/can_emu.h"
> +#include "net/can_host.h"
> +#include "qemu/fifo32.h"
> +
> +#define TYPE_XLNX_ZYNQMP_CAN "xlnx.zynqmp-can"
> +
> +#define XLNX_ZYNQMP_CAN(obj) \
> +     OBJECT_CHECK(XlnxZynqMPCANState, (obj), TYPE_XLNX_ZYNQMP_CAN)
> +
> +#define MAX_CAN_CTRLS      2
> +#define XLNX_ZYNQMP_CAN_R_MAX     (0x84 / 4)
> +#define MAILBOX_CAPACITY   64
> +
> +/* Each CAN_FRAME will have 4 * 32bit size. */
> +#define CAN_FRAME_SIZE     4
> +#define RXFIFO_SIZE        (MAILBOX_CAPACITY * CAN_FRAME_SIZE)
> +
> +
> +typedef struct XlnxZynqMPCANState {
> +    SysBusDevice        parent_obj;
> +    MemoryRegion        iomem;
> +
> +    qemu_irq            irq;
> +
> +    CanBusClientState   bus_client;
> +    CanBusState         *canbus[MAX_CAN_CTRLS];
> +
> +    struct {
> +        uint8_t         ctrl_idx;
> +   } cfg;

Indentation looks odd here.


> +
> +    RegisterInfo        reg_info[XLNX_ZYNQMP_CAN_R_MAX];
> +    uint32_t            regs[XLNX_ZYNQMP_CAN_R_MAX];
> +
> +    uint16_t            rx_time_stamp;
> +
> +    Fifo32                rx_fifo;
> +    Fifo32                tx_fifo;
> +    Fifo32                txhpb_fifo;

These ones look misaligned.

> +
> +} XlnxZynqMPCANState;
> +
> +#endif
> -- 
> 2.7.4
> 

