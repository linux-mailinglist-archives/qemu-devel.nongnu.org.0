Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE4A66E345
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHofm-0005MV-KL; Tue, 17 Jan 2023 11:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHofN-00057c-Ge
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:18:29 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHofL-0004cp-TK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:18:29 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 cx21-20020a17090afd9500b00228f2ecc6dbso80852pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A4/5fYgXR1pyHfT5U1fw1lkncpm6Gmpw8YQoQ2kh474=;
 b=g6kqHK46iC0TL4hFdx4Ejv/5Jc9hvF+LpfPvYELv7OYWvz4EY7SoJjKFOkDtckAFHv
 WRORMaSYSz8jHfKdXPtZlc2kFKd3PTQBHcpJmCIzvpPVUuGtyB3eLDebJSIo1LLYgVOI
 ZusFKbMxtipRVcuxX6NTRt3+YRliDKaGQEP0OS0xXQoElWZtA80La+AUPv13qrOGSlJ6
 kSeYBqWykh1lseEM0+JVNPdTIZf82Dkw7SPW90PYA0vB6Zf9O6lb12YSmuqEUArPVdVQ
 x+wAk/Zwk97gfjapn4AZfYRvhfq7awhb3n1fH+/HyXtOb04G8bWvWvorX87m39T7mSaj
 un/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A4/5fYgXR1pyHfT5U1fw1lkncpm6Gmpw8YQoQ2kh474=;
 b=zY51nZMNDpclCP+CWgtdQ9J9HTnMGIdvNEhNwdCwvcqymNrdg0Sr9hcxP4kS7RrIk4
 aurbLeCrP+NC30N3y+hLzOuC72srpldp29fncgoMZsNXm5P72Wm1prwBVxCOw75q9CcT
 Hj2b+f/jH8SoASnAzXQhOkptc3p9x0nWo2YuePvxQnKLDqeGLfy7eSCIq9GsfZzJ+RJL
 1zOo1qevsD6nTI3+mcSUyoUx7Y54MTVoeVhFkfzWJ7FHgRPz/u3lDF92ehjAGGzly/b2
 KEP/4yDir8fJOvJquhXXK6ebUa9MMbFRe5Ry+A/xz3/rIcMZ2Fehznn46m4N0IfDAMjX
 DWIQ==
X-Gm-Message-State: AFqh2kr2jyv8zkypLxsJO019j7vNSoRXAc9wRIGSK7BCnT6C99dFOyqa
 0qiKRKBiVgMShOXiv6ivDDfqIEnxcy/yS8z3Tr21PQ==
X-Google-Smtp-Source: AMrXdXtmWyVfgJzmesu3dQ5gV8JtyaZEVyUkSSwHvXyWTabM8rQvvLSthYn27JPMpSrQzyPc6LZsxPem3F33nNJprIM=
X-Received: by 2002:a17:90b:46c9:b0:219:e2f1:81ad with SMTP id
 jx9-20020a17090b46c900b00219e2f181admr317716pjb.19.1673972305782; Tue, 17 Jan
 2023 08:18:25 -0800 (PST)
MIME-Version: 1.0
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local>
 <Y8Yq5faCjAKzMa9O@kbusch-mbp> <20230117160933.GB3091262@roeck-us.net>
In-Reply-To: <20230117160933.GB3091262@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 16:18:14 +0000
Message-ID: <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
To: Guenter Roeck <linux@roeck-us.net>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jens Axboe <axboe@fb.com>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, 
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 17 Jan 2023 at 16:10, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Jan 16, 2023 at 09:58:13PM -0700, Keith Busch wrote:
> > On Mon, Jan 16, 2023 at 10:14:07PM +0100, Klaus Jensen wrote:
> > > I noticed that the Linux driver does not use the INTMS/INTMC registers
> > > to mask interrupts on the controller while processing CQEs. While not
> > > required by the spec, it is *recommended* in setups not using MSI-X to
> > > reduce the risk of spurious and/or missed interrupts.
> >
> > That's assuming completions are deferred to a bottom half. We don't do
> > that by default in Linux nvme, though you can ask the driver to do that
> > if you want.
> >
> > > With the patch below, running 100 boot iterations, no timeouts were
> > > observed on QEMU emulated riscv64 or mips64.
> > >
> > > No changes are required in the QEMU hw/nvme interrupt logic.
> >
> > Yeah, I can see why: it forces the irq line to deassert then assert,
> > just like we had forced to happen within the device side patches. Still,
> > none of that is supposed to be necessary, but this idea of using these
> > registers is probably fine.
>
> There is still no answer why this would be necessary in the first place,
> on either side. In my opinion, unless someone can confirm that the problem
> is seen with real hardware, we should assume that it happens on the qemu
> side and address it there.

Sure, but that means identifying what the divergence
between QEMU's implementation and the hardware is first. I don't
want a fudged fix in QEMU's code any more than you want one in
the kernel's driver code :-)

thanks
-- PMM

