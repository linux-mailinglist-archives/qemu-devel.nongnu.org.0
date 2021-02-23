Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332923227B2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:23:58 +0100 (CET)
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETvA-0000mN-TT
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lETsC-0006U5-Cg; Tue, 23 Feb 2021 04:20:52 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:37819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lETs9-0006m8-Nm; Tue, 23 Feb 2021 04:20:52 -0500
Received: by mail-yb1-xb35.google.com with SMTP id p193so15804130yba.4;
 Tue, 23 Feb 2021 01:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jgrBMyCI0LF+m5pLEVbSUucynjENYvdTOeDv5C6lpw=;
 b=pwI445phw3HhRfZ6juif5++Hl7qzx2RuagqfiXMq+QP316CwuBFGJjb8d0cuM+huPW
 FSS/aEuv+yauLFhxvyv0yu7p3GhFnhKyvWIYsYwjk/4u++2W5mDEd6pqOGonOUql3cW3
 4EdKpGvJy3w4awhyoeeiYGFrLxqFK5jYSrmt3Jcc1nYnPKmVbiaZidslX4W335gpM5if
 nE+xEhKGoT6+5OP/r7kcOgzui4pFE6mRas1Dis8/7C/txtvbsSho/tb3x2KlM7XGqlIy
 GNJ8voTprO06YcPRXlo9qXvUYnIl+8eg384nYUm5kcEigy6kULghRilKaYpLi6tXEVZ5
 VFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jgrBMyCI0LF+m5pLEVbSUucynjENYvdTOeDv5C6lpw=;
 b=Ddz0SZ8oXLqJaSe38A7Thqe6Xr+1ueAqfvJLhZpngGzs3KrTQSfeC/Dpk+W0/6XSK0
 vXkdiDE2oGkaLTZEP9Hip0fcSEgYY4cFpa5WaOtHQwof/4ZOitsWV6EcIPT3QD/xOY3N
 GvDIO4KtCf8qeaa5fCy5CHLDmB9qwX5ha40H10jjPpJMMi1WcjlQpVQHcsPNmQKNNT+e
 zAyPqWo3epAQ1GcGpK1UmKzxZQxMGQmGGJkTB+n9LILJ6NsVgJwdzhxmrDUzRQk89+sF
 DO10gphygmZgIxKdt3JerFJ/dPpMPK/T0XFyopVN3fQErXBtWyXViC8q9KWQeInXRI5R
 8L3g==
X-Gm-Message-State: AOAM532IsOj1DZl2BUDPvdtAixNOpwX2DoCSGEalMrzMKfnuztFfLRdt
 LCC2fJL0x4fKBaVXhnIN375pX20b5CK6TWcHmfg=
X-Google-Smtp-Source: ABdhPJxFXOpOBWhDzoUiPNXR21BKAmXDu8o+qos4E1VvWnZRa5Zb4s/7c98lXe3wsdgN3bnb2B9DmdkvLCRmdCvk1Ds=
X-Received: by 2002:a25:c090:: with SMTP id
 c138mr37518444ybf.314.1614072048326; 
 Tue, 23 Feb 2021 01:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
 <20210222130514.2167-4-bmeng.cn@gmail.com>
 <20210223090144.GS477672@toto>
In-Reply-To: <20210223090144.GS477672@toto>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 23 Feb 2021 17:20:36 +0800
Message-ID: <CAEUhbmU5NXZv84ncgP15thonVQgFRfgmMZqfJQtAxjZ7fj9KcQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA
 module for QSPI
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

On Tue, Feb 23, 2021 at 5:01 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Mon, Feb 22, 2021 at 09:05:12PM +0800, Bin Meng wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Add a Xilinx CSU DMA module to ZynqMP SoC, and connent the stream
> > link of GQSPI to CSU DMA.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v4:
> > - Rename "csu_dma" to "qspi_dma"
> >
> > Changes in v3:
> > - new patch: xlnx-zynqmp: Add XLNX CSU DMA module
> >
> >  include/hw/arm/xlnx-zynqmp.h |  2 ++
> >  hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
> >  hw/arm/Kconfig               |  1 +
> >  3 files changed, 17 insertions(+)
> >
> > diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> > index be15cc8814..2edeed911c 100644
> > --- a/include/hw/arm/xlnx-zynqmp.h
> > +++ b/include/hw/arm/xlnx-zynqmp.h
> > @@ -35,6 +35,7 @@
> >  #include "target/arm/cpu.h"
> >  #include "qom/object.h"
> >  #include "net/can_emu.h"
> > +#include "hw/dma/xlnx_csu_dma.h"
> >
> >  #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
> >  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> > @@ -108,6 +109,7 @@ struct XlnxZynqMPState {
> >      XlnxZynqMPRTC rtc;
> >      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
> >      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
> > +    XlnxCSUDMA qspi_dma;
> >
> >      char *boot_cpu;
> >      ARMCPU *boot_cpu_ptr;
> > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > index 49465a2794..30f43dfda2 100644
> > --- a/hw/arm/xlnx-zynqmp.c
> > +++ b/hw/arm/xlnx-zynqmp.c
> > @@ -50,6 +50,7 @@
> >  #define QSPI_ADDR           0xff0f0000
> >  #define LQSPI_ADDR          0xc0000000
> >  #define QSPI_IRQ            15
> > +#define QSPI_DMA_ADDR       0xff0f0800
> >
> >  #define DP_ADDR             0xfd4a0000
> >  #define DP_IRQ              113
> > @@ -63,6 +64,8 @@
> >  #define RTC_ADDR            0xffa60000
> >  #define RTC_IRQ             26
> >
> > +
> > +
>
> These blank lines look un-related, if you remove them, this looks good to me:
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Thanks for the review.

A RESEND version was already sent out to the ML before. Sorry for the
inconvenience.
http://patchwork.ozlabs.org/project/qemu-devel/patch/20210222131502.3098-4-bmeng.cn@gmail.com/

Regards,
Bin

