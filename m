Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F4B3227E5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:34:29 +0100 (CET)
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEU5M-0002U5-V2
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lEU47-0001vB-64; Tue, 23 Feb 2021 04:33:11 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:44353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lEU45-0004D8-BV; Tue, 23 Feb 2021 04:33:10 -0500
Received: by mail-lf1-x135.google.com with SMTP id p21so10083767lfu.11;
 Tue, 23 Feb 2021 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e7dFqhUtIpYFt4hq/yQtPc/IbLJ93wHB6PGXEyKvg2I=;
 b=Dmhfow854Xwm5PPZucPBBz7nqCLl4Ga3ghR1/RjcaYAMcyCt7EeMGgjIFnQOKnsKMB
 dUy95CXAY5ONe1CeIGdG3M5OP1cD0ON6QGjc6m8LrZd54UKFsLCwIK6FgINBx2Cb7Xcy
 z2x4s1U2XEstGfnfOJBm4bvOP0mfTM2Wu+GuLW8VusgVrj84xrWqeyPraPoCY/fh84Ym
 DiHMShAJT/QKjYbv4nSu9vksC8wV4QJYQC7WXhg4NX5VI7wwyTLDImg48nblrojIUMyQ
 W0AITotqyQ1CG4jdSBMp+GCrQS2894W8Bi+GWiPKcROaRK2pTRmbIme4YEX/y+JsxTE4
 tRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e7dFqhUtIpYFt4hq/yQtPc/IbLJ93wHB6PGXEyKvg2I=;
 b=PBhpcrx/3Nc+jv4HkQJSJZofovg6O+EsewCuiEDOuI0g9UF3/QmUpnMoWvzfxm/zIs
 oPFGX9lGZqHIJ/TXiSQd//95wgialk2JUfDCrM+oByjB/79WqKs3hTVNf8Bz0wXQnh7w
 /zThMhTCaEGPSIr0j1CVU+KBU/OtXH9KUcNxhwq8tWAw0zXy7iqIctOZFhcjhXX1UIgo
 gFG4p05yy2obIhgdDznQcVz68lT8P05DSEtFBv42G+7AFeE6cxtfDciU366ZExySLRsO
 xWibIH1ozwjKYmgp50axq9mu8BTt8vNQnEoWGYx1O6Oot8ojbvbQvap2aUFY9uMPfca8
 lqCw==
X-Gm-Message-State: AOAM532pObf6bgS84NoWKe6Png6iqNfBuQENglzI/NjiQ/UrruVlMRKV
 78qPRdT1hO2NZ8IjWlRnQhk=
X-Google-Smtp-Source: ABdhPJwTPFKjlmee80UYFAyY6SDw5vA+JtaCfzs1wSE1fKgofx0qlXPBBLejAx5Li7bRiQ3l3d5Ytg==
X-Received: by 2002:a19:5505:: with SMTP id n5mr15485790lfe.401.1614072787012; 
 Tue, 23 Feb 2021 01:33:07 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id w26sm2488555lfr.186.2021.02.23.01.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 01:33:06 -0800 (PST)
Date: Tue, 23 Feb 2021 10:33:06 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v4 1/5] hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA
 model
Message-ID: <20210223093306.GX477672@toto>
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
 <20210222130514.2167-2-bmeng.cn@gmail.com>
 <20210223092127.GU477672@toto>
 <CAEUhbmX-nLxDYAHDZQga4ADpy2+2cnKsfxMYucxNC=zUdfFupw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmX-nLxDYAHDZQga4ADpy2+2cnKsfxMYucxNC=zUdfFupw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
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

On Tue, Feb 23, 2021 at 05:23:43PM +0800, Bin Meng wrote:
> Hi Edgar,
> 
> On Tue, Feb 23, 2021 at 5:21 PM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > On Mon, Feb 22, 2021 at 09:05:10PM +0800, Bin Meng wrote:
> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >
> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> > > crash. This is observed when testing VxWorks 7.
> > >
> > > This adds a Xilinx CSU DMA model and the implementation is based on
> > > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c.
> > > The DST part of the model is verified along with ZynqMP GQSPI model.
> > >
> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > ---
> > >
> > > Changes in v4:
> > > - Add complete CSU DMA model based on Edgar's branch
> > > - Differences with Edgar's branch:
> > >   1. Match the registers' FIELD to UG1807.
> > >   2. Remove "byte-align" property. Per UG1807, SIZE and ADDR registers
> > >      must be word aligned.
> >
> > The relaxation of alignment is a new feature, not included on the ZynqMP but
> > it will be included in future versions. Would be nice to keep it but we can
> > also add it later since it's not really related to QSPI.
> 
> I think Xilinx folks can add the "byte-align" property in the future
> patches. Is this a new feature for Versal?

It's not in silicon yet, yeah, we can add it later.


> 
> >
> > >   3. Make the values of int_enable and int_disable mutually exclusive
> > >      otherwise IRQ cannot be delivered.
> >
> > This doesn't sound right. The enable and disable regs are stateless.
> > They both indirectly modify the MASK register.
> >
> > I.e, setting a bit in the enable register will clear the correspoding bit in the
> > mask register, atomically, without the need for read-modify-write of MASK.
> >
> > The disable register does the opposite.
> >
> > >   4. Clear int_status after int_disable is set.
> >
> > This doesn't sound right either. Status is a w1c register, i.e bits get set
> > when the interrupt event happens in the DMA and bits only get cleared when
> > SW writes a 1 to the STATUS reg to clear bits (write one to clear, w1c).
> >
> > Other than the interrupt issues, I think this looks good.
> 
> Without these interrupt fixes, our tests cannot pass. We will have a
> further look at your comments.

This is a common interrupt handling pattern in most Xilinx devices.
You can look at the xlnx-zdma.c IMR, ISR, IEN, IDS regs as an example.

Cheers,
Edgar

