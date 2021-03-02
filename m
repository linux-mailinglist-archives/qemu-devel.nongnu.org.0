Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3732A3F6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:26:26 +0100 (CET)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6un-00053k-RT
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lH6pr-00086P-5v; Tue, 02 Mar 2021 10:21:19 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lH6po-0008FN-Kf; Tue, 02 Mar 2021 10:21:18 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id c131so21027664ybf.7;
 Tue, 02 Mar 2021 07:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iyvcHqy4TZ9zgvUdxxp5oLfO86c3VXIenFu+vWz3md4=;
 b=WU1a3yDq9i0k5l+zA6mlMi2mXUJoYNE2gC3yxD0n0Jkf2Re5/TwWn9msMUfi1PZl/d
 RcyvRv4KydMZX1I+jMgrAJnq01i4FfFI7eD9hwm9QENQozsRu7Me52O1p3YcgXn86XRj
 16VToHZPQdVC3jBkgJu/ZOWWJcdiXTd5dovjan/fE/0QTrVOjcPfGavM5+GPHEb57Koh
 Nd22gDfmlVrcvtxaoMO4TK5E2mx5GpuyyIQx3drJvlvWK4U0YpPQsGxtHZmyUGQc2S98
 X4KIKXg7YqqMIuhrnG5DArg5S+HJbLHNUWf/TyIXEU0oihLdw1x1NrYYUmd016IGArIF
 Sujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iyvcHqy4TZ9zgvUdxxp5oLfO86c3VXIenFu+vWz3md4=;
 b=XDd5y2xsouAaYVk8EYG1sLGGP8yfTrn5x5Dn8Xc9gZLWlbzYKvSIjrzmFeWIGfqJb3
 nrH3bCiH4aP+Xw1CtvIaS1t9htrvgBBW1gQ7F8gG0G0u2IAKzkeTeQ/7R3Wq1TDaDOIt
 AaTI3fFwiHxGxPE2u9LFo88qHrhLCw0yDnImclBDyXpOWMjOBfesaZm61I0PwCW9stFy
 GhveVhXfdYdGVsMv5uB4YJ1uVMkv+FTi6uZe9qu9rQJMXH/Th4lOxj+5Nna7MGD9t7Al
 +Gvf3BzFiDj1bJph0EE/NAr3LKrp2tRiN+jhSSbm3AzKfVA0/ykUa2+1ALzuHYkm0aIa
 voIg==
X-Gm-Message-State: AOAM531SA3VZkXiw2YBrh7/Gm7umGYN5glBGthvAxRSzsKsPnrd1k1Wl
 yaimHxMr9M+qpslVDsR6c++ZQRQH+Ssf/3mvW7s=
X-Google-Smtp-Source: ABdhPJz09wVbWRupSU+k5l4/EzcD9SsRRClWhhs1CSUS0XDbwiUqhWSDVjYJjVy9rq7po9Wq3WyPN7jBijrwyiI2XMY=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr33212759ybt.239.1614698474501; 
 Tue, 02 Mar 2021 07:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20210301132011.8494-1-bmeng.cn@gmail.com>
 <20210301132011.8494-2-bmeng.cn@gmail.com>
 <20210302150348.GZ477672@toto>
 <CAEUhbmVeha7EOjz-q-y+cihL_TG1Afz-M4Go9eBTD0g4JcDgOw@mail.gmail.com>
 <20210302151953.GA477672@toto>
In-Reply-To: <20210302151953.GA477672@toto>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 2 Mar 2021 23:21:02 +0800
Message-ID: <CAEUhbmWDqq8tW2_WWZsP39OJt3F8uxgioWCneREjqKDf_K1qkw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA
 model
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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

On Tue, Mar 2, 2021 at 11:19 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Tue, Mar 02, 2021 at 11:16:10PM +0800, Bin Meng wrote:
> > Hi Edgar,
>
> Hi Bin,
>
>
> >
> > On Tue, Mar 2, 2021 at 11:03 PM Edgar E. Iglesias
> > <edgar.iglesias@gmail.com> wrote:
> > >
> > > On Mon, Mar 01, 2021 at 09:20:07PM +0800, Bin Meng wrote:
> > > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > >
> > > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
>
> ....
>
> > > The 3 DONE_CNT bits in R_STATUS need to be w1c so that SW can clear the counter.
> > >
> > >             .w1c = R_STATUS_DONE_CNT_MASK,                                    \
> > >
> > >
> > > For reference, I'm attaching the complete diff I used to pass the testsuite:
> > >
> >
> > Thanks for the review and testing. We will incorporate your diff, test
> > and send v7.
> >
> > Should we include your SoB tag for the diff?
>
> If you take the changes as from my example, you can include:
>
> Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Great, thank you!

Regards,
Bin

