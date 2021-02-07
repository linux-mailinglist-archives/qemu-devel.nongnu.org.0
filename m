Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D631257D
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 16:49:13 +0100 (CET)
Received: from localhost ([::1]:53342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8mJE-0003Lu-Gw
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 10:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8mHC-0002lJ-G9; Sun, 07 Feb 2021 10:47:06 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8mGx-0002tr-Kj; Sun, 07 Feb 2021 10:47:06 -0500
Received: by mail-yb1-xb36.google.com with SMTP id m76so12126819ybf.0;
 Sun, 07 Feb 2021 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S7aA6v6YMd5jGxjwZMyGB+V4IiPhmBwtwiPIXv/uttM=;
 b=Y97PNqUAtf+973Pf89zDtbdId+J36lSKdwF8fGKDx8iB+nRkh/QtFSIlhbgc0TU+pI
 dxeUNha9TEPb2Oi6vdrpSX6lhXsmHMHaJ2SODmBM118rJV6xJPnlGTOXFgQtAHfhR3lS
 mqj8h0rY3T2Y1iw8Lbxocph9TFJF/6o2C7UN4v9qJj/leJq4D0YWAzwYN+ZnJdcUGKen
 OqFp1oEWr0SRMZtASdVL98+/MOGEF12tFfSN0WzQEpDUD1ppGsPsTjdh8rz68Yu+q3SD
 IsZFgzFbYeW8QQhX0oMe5HP/ethIweRRZDQf8MBGhqxmGfnQLzaKWByOe3X+JtRoWmt5
 8IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7aA6v6YMd5jGxjwZMyGB+V4IiPhmBwtwiPIXv/uttM=;
 b=ZFCoMrAvpBS/V8ZzTsC7yfTF/yu5GBSq4bA9mI7OgHPjTlH9V8fQk6v9NM6H3abchR
 uGQglGUozNUFYADZPLLyBxkIdyvUS6SAlSNInzcYB/U9aNvXYIDLoGfJIGv3cdbEMe9m
 G7fITmolJtJTrh8lv0/MZNfZ6Tz2kLTw2Eqi1xqV1WCcV+gz7tOK0bbAx/DfmCNjBGjC
 JmQsllSz+FnQzdMdeyNss4tuk4KCkqAbHBZoXhP1WKUs7iRHvtkqnRQOkUo8JOiOXRlX
 VG59beX/9ceqZ60eEldfDtvEp1gyEaVdc79IKyzYLqrZ/G8F47tmcTwRYN041MH6lUal
 pwMA==
X-Gm-Message-State: AOAM530LomwiPSHjrzsaCZwGpN5xIzYjx4NEt3KBDV8+GOw1OoYs1NFu
 QCVbwZC8X8bpVlPmKrmqejsWKUiIzLMe1aFASRE=
X-Google-Smtp-Source: ABdhPJxolAIJHnRSBeXnXMYNwBNHRVN6lqq+EH4e6z9Nl6hJZ6T8TtEeWAvd0H6L8YjSEScEBsDQcRfaPY10eKtAcFs=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr19004105ybp.314.1612712810259; 
 Sun, 07 Feb 2021 07:46:50 -0800 (PST)
MIME-Version: 1.0
References: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
 <1612622294-37297-3-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-VWeAPSTFKJ6dZ4-M7OYdqyw1wwBgzpNuasPYRzMvRWQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-VWeAPSTFKJ6dZ4-M7OYdqyw1wwBgzpNuasPYRzMvRWQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 7 Feb 2021 23:46:39 +0800
Message-ID: <CAEUhbmUp+fzbbiFn4rz46PD6CQqSAzm7psHDczuBEEe_WRV2BA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Sat, Feb 6, 2021 at 11:28 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 6 Feb 2021 at 14:38, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> > crash. This is observed when testing VxWorks 7.
> >
> > Add a basic implementation of QSPI DMA functionality.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> > +static size_t xlnx_zynqmp_gspips_dma_push(XlnxZynqMPQSPIPS *s,
> > +                                          uint8_t *buf, size_t len, bool eop)
> > +{
> > +    hwaddr dst = (hwaddr)s->regs[R_GQSPI_DMA_ADDR_MSB] << 32
> > +                 | s->regs[R_GQSPI_DMA_ADDR];
> > +    uint32_t size = s->regs[R_GQSPI_DMA_SIZE];
> > +    uint32_t mlen = MIN(size, len) & (~3); /* Size is word aligned */
> > +
> > +    if (size == 0 || len <= 0) {
> > +        return 0;
> > +    }
> > +
> > +    cpu_physical_memory_write(dst, buf, mlen);
> > +    size = xlnx_zynqmp_gspips_dma_advance(s, mlen, dst);
> > +
> > +    if (size == 0) {
> > +        xlnx_zynqmp_gspips_dma_done(s);
> > +        xlnx_zynqmp_qspips_update_ixr(s);
> > +    }
> > +
> > +   return mlen;
> > +}
>
> > @@ -861,7 +986,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
> >          recv_fifo = &s->rx_fifo;
> >      }
> >      while (recv_fifo->num >= 4
> > -           && stream_can_push(rq->dma, xlnx_zynqmp_qspips_notify, rq))
> > +           && xlnx_zynqmp_gspips_dma_can_push(rq))
> >      {
> >          size_t ret;
> >          uint32_t num;
> > @@ -874,7 +999,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
> >
> >          memcpy(rq->dma_buf, rxd, num);
> >
> > -        ret = stream_push(rq->dma, rq->dma_buf, num, false);
> > +        ret = xlnx_zynqmp_gspips_dma_push(rq, rq->dma_buf, num, false);
> >          assert(ret == num);
> >          xlnx_zynqmp_qspips_check_flush(rq);
> >      }
>
> This seems to be removing the existing handling of DMA to the
> TYPE_STREAM_SINK via the stream_* functions -- that doesn't look
> right. I don't know any of the details of this device, but if it
> has two different modes of DMA then we need to support both of them,
> surely ?

This DMA engine is a built-in engine dedicated for QSPI so I think
there is no need to use the stream_* functions.

> If the device really should be doing its own DMA memory
> accesses, please don't use cpu_physical_memory_write() for
> this. The device should take a TYPE_MEMORY_REGION link property,
> and the board code should set this to tell the device what
> its view of the world that it is doing DMA to is. Then the
> device in its realize method calls address_space_init() to create
> an AddressSpace for this MemoryRegion, and does memory accesses
> using functions like address_space_read()/address_space_write()/
> address_space_ld*()/etc. (Examples in hw/dma, eg pl080.c.)
> Note that the address_space* functions have a return value
> indicating whether the access failed, which you should handle.
> (The pl080 code doesn't do that, but that's because it's older code.)

Sure will switch to use DMA AddressSpace in v2.

Regards,
Bin

