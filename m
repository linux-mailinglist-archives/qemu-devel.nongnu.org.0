Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4E578DAB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 00:42:12 +0200 (CEST)
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDZRL-0006cj-IL
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 18:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDZP2-0004dU-JN
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 18:39:49 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDZOz-0001hB-UB
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 18:39:48 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 s18-20020a17090aa11200b001f1e9e2438cso1176547pjp.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mCQOoVd7PgOaaVm/HMP4vZK6z/+q5YtuUdq7IMWp0oU=;
 b=fod6MMb77UZVEDydrt1WRTOaO/2b8z6APDsqx+n9uonl4f/+LsqxlQKJYLmegnW4wq
 4mWzXb7LgOh6uwzniz2aQ8msshMFIrf4DHIis6phkcjpD3dcl31B9wHLeyfktLR/td+U
 gnV8DA30LRBgGlo0THQThSCavymidTbNq7ivfLZIDAbWUoVQG2tcy49u8Gj4IkvgiCu0
 cQU6dMOxbvWEuLmr+ckL8lCNKwaK6hp/iZg5fZt3kYk4BGREgTJgBd0UwbiiDUlY+TPw
 YbxlkaNCp0nAwErir4mb41FDtUyfpdzavW2M5kdMnuLh6ijB8CEN7B++qK1e6moX+3cq
 K4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCQOoVd7PgOaaVm/HMP4vZK6z/+q5YtuUdq7IMWp0oU=;
 b=0QKnvZaf9GM6yd6lwt9aGwccj9TEQSyo0ACuaq90Tk5DIrm1FR4qgGS11SNLAvICD+
 vw55AQy+tl6JfxPLg07j4ZV5CZTxZ5rHlaSHHBRKbzyyqF8c1yCXNHidnXJgq8l52eDN
 s+fTBhIF2+q2I7cDkybRfTPKpS8Ra2oBMTt+jng99sXqucsqoedEhM5txIwWxIE4WWNR
 2gk/0nEjf9e0nMXNOBB2E4A7qmaFWlv3tN/a+SBTtppqr3smJVUdKDMTtZLC52T4wHwK
 r/O0B4Y0A4oDIMwbYgD7ywnkqTlEk3IhkUU/GPDXeWHNcGZtX6afGmD6cjpxwVDbV4gm
 7GYw==
X-Gm-Message-State: AJIora/tAUit97LpkoICpODcKVY6Nkz+tp6vyQ6oLpu5NzXwY3XeC7Kg
 4sraptAJYthGextj72h0UB5u4y9X6XmxeFyK5cA=
X-Google-Smtp-Source: AGRyM1t6vzbnA58YhzELBRQ9sN5g2b0QQnLivPoiv6zTxHw2d7cf4ryQyF5caspqllWe0xDWwZH5x/Nd6O989KT8OyQ=
X-Received: by 2002:a17:90b:3b4d:b0:1f0:4547:8a31 with SMTP id
 ot13-20020a17090b3b4d00b001f045478a31mr35071079pjb.129.1658183984414; Mon, 18
 Jul 2022 15:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
 <YsYxM6gmJf7y/nJc@zx2c4.com>
 <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
 <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
 <CAKmqyKOJFz7i5sORoZ4sbjeLg_=b3=Nim6zfPRK0Dp1w29KfSQ@mail.gmail.com>
 <CAHmME9qqOVhKOiCc=UVZcj07GwGFcBJB6UdOY5LXpFpy9GA=Rg@mail.gmail.com>
 <CAKmqyKM16Hjwu1kQgvk-18bSszRKTTvpP7oeZx=hwP-m-KsL-w@mail.gmail.com>
 <YsxTtkdp7p10qzc3@zx2c4.com> <Ys8A7NOcFkMck9Gi@zx2c4.com>
In-Reply-To: <Ys8A7NOcFkMck9Gi@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jul 2022 08:39:17 +1000
Message-ID: <CAKmqyKMxdJsiSN0=F3QFhXy8Mh3Wm6NPUXmJaSHM207FLkzczw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 14, 2022 at 3:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi again,
>
> On Mon, Jul 11, 2022 at 06:45:42PM +0200, Jason A. Donenfeld wrote:
> > I've reproduced the problem and determined the root cause. This is a
> > generic issue with the mmio get_cycles() implementation before 5.9 on
> > no-MMU configs, which was fixed during the 5.9 cycle. I don't believe
> > that this is the only thing affected on that .0 kernel, where fixes were
> > ostensibly backported. Given the relative age of risc-v, the fact that
> > 5.8.0 was broken anyway, and that likely nobody is using this kernel in
> > that configuration without applying updates, I'm pretty sure my patch is
> > safe to apply. I'd recommend updating the broken kernel in your CI.
> >
> > Meanwhile, the rng-seed field is part of the DT spec. Holding back the
> > (virtual) hardware just because some random dot-zero non-LTS release had
> > a quickly fixed bug seems ridiculous, and the way in which progress gets
> > held up, hacks accumulate, and generally nothing good gets done. It will
> > only hamper security, functionality, and boot speed, while helping no
> > real practical case that can't be fixed in a better way.
> >
> > So I believe you should apply the rng-seed commit so that the RISC-V
> > machine honors that DT field.
> >
> > Regards,
> > Jason
> >
>
> Just following up on this... Hoping we can get this into a tree soon.

Yep! Sorry, I have been off sick for the last week.

I just updated my test images to a newer kernel, which means this
passes my tests

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Thanks,
> Jason

