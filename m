Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B7672F66
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 04:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pILKs-0004ZN-4Q; Wed, 18 Jan 2023 22:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pILKp-0004Ya-Hl; Wed, 18 Jan 2023 22:11:27 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pILKn-0007k2-3O; Wed, 18 Jan 2023 22:11:26 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id j185so792297vsc.13;
 Wed, 18 Jan 2023 19:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=960IVmsZ9To/VifNgAGQMUlqzUX9d/iKqOt0VhAMV68=;
 b=XwcHEd9EYpjZEBPxHqshjJdEFcyX9gtmvtcodJLfCn5RjsiAzrEhQfTr8X90X9MT7N
 QalirrHz52gmchR0fbW5rmADwG4gbI5R4CnM4z+k1swUaYNNfcVg5KovZLrFC1hDe9V9
 Ab0Tqou9YGuuz+4pmI+aPfmKpULkhODl6oOd7451ESsxFeM6A9T/WFJ+xuehiQ1AmL+r
 JYw6rAPG/84FmXAJO8piDABYvT42RkLhgYsZjUqVKxxNBgoZ7llOEESK95ukfL2Vsmxk
 kZTH7+1bNb2wIZuMWcO2sDtowiRTjpSSP5VYytn8cnNX4LSe7sZCNKXJDHiDM3FfyO3Q
 iXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=960IVmsZ9To/VifNgAGQMUlqzUX9d/iKqOt0VhAMV68=;
 b=CDT78a4ULLTbv2ItlX8tbYDF03dX/74yKXwRaZVJ0TI2lm1K9fMCOEAKEC8hbY7Ih8
 039AqBgkLaWthoncdaHbQYltcl0L9EimE/r9TO9vmzvFnnHTPeYxpUY0RKPFUfeLnSm+
 AiqK1mr41Ufi0cyLkNHV+LIISDVaMvl17xdaR9bfXnkKISfF/tEPLss1vU7ic16oaRyW
 2nga3OMpHGs6CIqc3gcAuOB29WKfesF6atxkT9OIsHpzgWlC60cPovUJGo5uOsWKHiR+
 pIPn0sXAqqE6PDAujIf98fcN6aeAoRbvCFDcJ3JpI8+cdvo2V9vDpVdVlkuX4C5Wfha/
 Fu0Q==
X-Gm-Message-State: AFqh2komNFlQ960TtvUI+TAvq8p1dR61LK58d7llCY8RSwaDxL154ozo
 3kT9RLlaBogp9H7kP0hoK3m+fcX3W4uGPLxePSg=
X-Google-Smtp-Source: AMrXdXv5PYOGmr4SnFGgeLMEj9BAYk2S+B8fIaCCmhugSR4upZT4M1lcorxE9MNG1kHyrG/EI6Av2RjL1Q3nlioF3iU=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr1268218vsl.10.1674097883643; Wed, 18
 Jan 2023 19:11:23 -0800 (PST)
MIME-Version: 1.0
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local>
 <Y8Yq5faCjAKzMa9O@kbusch-mbp> <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp> <Y8h7aOuVfCb+RsAP@kbusch-mbp>
 <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
 <Y8iulgdgOdVCjuKE@kbusch-mbp>
In-Reply-To: <Y8iulgdgOdVCjuKE@kbusch-mbp>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 13:10:57 +1000
Message-ID: <CAKmqyKMveR=RD6fgnzY0SV39tofD+Ws_AbrSZXE_o4m=M6GZHg@mail.gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
To: Keith Busch <kbusch@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 Klaus Jensen <its@irrelevant.dk>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Jan 19, 2023 at 12:44 PM Keith Busch <kbusch@kernel.org> wrote:
>
> On Thu, Jan 19, 2023 at 10:41:42AM +1000, Alistair Francis wrote:
> > On Thu, Jan 19, 2023 at 9:07 AM Keith Busch <kbusch@kernel.org> wrote:
> > > ---
> > > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > > index c2dfacf028..f8f7af08dc 100644
> > > --- a/hw/intc/sifive_plic.c
> > > +++ b/hw/intc/sifive_plic.c
> > > @@ -157,7 +157,6 @@ static uint64_t sifive_plic_read(void *opaque, hw=
addr addr, unsigned size)
> > >              uint32_t max_irq =3D sifive_plic_claimed(plic, addrid);
> > >
> > >              if (max_irq) {
> > > -                sifive_plic_set_pending(plic, max_irq, false);
> > >                  sifive_plic_set_claimed(plic, max_irq, true);
> > >              }
> > >
> >
> > This change isn't correct. The PLIC spec
> > (https://github.com/riscv/riscv-plic-spec/releases/download/1.0.0_rc5/r=
iscv-plic-1.0.0_rc5.pdf)
> > states:
> >
> > """
> > On receiving a claim message, the PLIC core will atomically determine
> > the ID of the highest-priority pending interrupt for the target and
> > then clear down the corresponding source=E2=80=99s IP bit
> > """
> >
> > which is what we are doing here. We are clearing the pending interrupt
> > inside the PLIC
>
> Thanks for the link. That's very helpful.
>
> If you're familiar with this area, could you possibly clear up this part
> of that spec?
>
> "
> On receiving an interrupt completion message, if the interrupt is
> level-triggered and the interrupt is still asserted, a new interrupt
> request will be forwarded to the PLIC core.
> "
>
> Further up, it says the "interrupt gateway" is responsible for
> forwarding new interrupt requests while the level remains asserted, but
> it doesn't look like anything is handling that, which essentially turns
> this into an edge interrupt. Am I missing something, or is this really
> not being handled?

Yeah, that wouldn't be handled. In QEMU the PLIC relies on QEMUs
internal GPIO lines to trigger an interrupt. So with the current setup
we only support edge triggered interrupts.

It looks like we also drop the pending bit if the original interrupt
de-asserts, which appears to be incorrect as well.

Alistair

