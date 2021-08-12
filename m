Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329AC3EA700
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 16:59:30 +0200 (CEST)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mECB4-0002nU-Vh
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 10:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEC9f-0001Hp-Kv
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 10:57:59 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEC9d-0001DT-U0
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 10:57:59 -0400
Received: by mail-ej1-x62c.google.com with SMTP id z20so12178502ejf.5
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09vX17giHDt3mB9HD5U/Xu1O6fbeHRac3JDA3ZzOejY=;
 b=h7qsjMUnoXhU5KvEtD1ijLfOpq15yOyVuInbgh80p+O4NS62NB3XMwNJBIiaB5lc7/
 b43ZiCG1nNbjqLWi9KYa8XKcbzN/L993lMniAF7Egj9ukkkvJvNfLjKZ6942NsoloPJi
 05waRkdLJ7bdZFz7fVrHO7RsVeerOepdLE3eUSbx7sYamM1mXatiguWMF0n7JxWVOeHs
 PyXmqpm+tUf9gVREyrw+/jkCB/ev0+tyx8aJNtcSyPq8mSBMILJFe92wQLkW0pmu2WOe
 SoEJ8h5QDCYOKcw5mWHptTGxTaVM/FUWDMdkj8acNJUvBSQ0P5uth5l/dWxGjZcRC6Et
 /K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09vX17giHDt3mB9HD5U/Xu1O6fbeHRac3JDA3ZzOejY=;
 b=c3MT6HpGBKqqCMz2Q4Niq8VT899+Fq11teu9V0V+qKfp1rB7fw5B/8z+SGrhWFwuvz
 a8lB1DBSt2bV9UsCDdxIzVo92d7jSw1WQX0PDebEokb/2VdwmIa/+U6U2NwwwvuexrTQ
 0cclHt8pmCniWXfmARyqFkgS7BIgEIdq9GMDQ3dpsxau+XMqOH3gYUdnjhmGd6iPzcYp
 9w0hquurZhl8Kk3PgCqQ0SYc5wCdAEEa5rk+lCazuANwNpX7UXMlnfIpkMKWRJ5MefgY
 45j4+4dulWnbjw5gmqvIlB/GUEV39pvRP8+guyCc/Zqjc2OSTe/mw8vUnJfxIUfWVWbl
 SCpg==
X-Gm-Message-State: AOAM530CsptQCgje2n+0iKwwTx/86m1sea8Q5+QEfHMCVLX3pytTik9t
 InLoOupOQ/6I1y92uldRez0HAwkxV/Ilg7nxGo4+Pg==
X-Google-Smtp-Source: ABdhPJzRlul58+QBI58ngiiMbRgMXIz9hxX8naD7LO24oWqjxcDbzxFzGUzCOp66coZTb10ziIxl1W6LxIEZvHbh6mw=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr4013478ejy.407.1628780275331; 
 Thu, 12 Aug 2021 07:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200825184836.1282371-1-alistair.francis@wdc.com>
 <20200825184836.1282371-6-alistair.francis@wdc.com>
 <CAFEAcA94GQMqsRp3tQ7NF7+fA2BK+PdJZScHWgLM5x12RVOiZg@mail.gmail.com>
In-Reply-To: <CAFEAcA94GQMqsRp3tQ7NF7+fA2BK+PdJZScHWgLM5x12RVOiZg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 15:57:10 +0100
Message-ID: <CAFEAcA-2pnpntTUGeAu+BVHmbROsK82+Qsjh0cgtH1azCCr6UA@mail.gmail.com>
Subject: Re: [PULL 05/18] hw/riscv: virt: Allow creating multiple NUMA sockets
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <alistair23@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Atish Patra <atish.patra@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 10:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 25 Aug 2020 at 20:03, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > We extend RISC-V virt machine to allow creating a multi-socket
> > machine. Each RISC-V virt machine socket is a NUMA node having
> > a set of HARTs, a memory instance, a CLINT instance, and a PLIC
> > instance. Other devices are shared between all sockets. We also
> > update the generated device tree accordingly.
>
> Hi; Coverity (CID 1460752) points out that this code has
> a misunderstanding of the length argument to strncat().
> (I think this patch is just doing code-movement of this block of code,
> but it seemed like the easiest place to send an email about the issue.)
>
> > +        /* Per-socket PLIC hart topology configuration string */
> > +        plic_hart_config_len =
> > +            (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
> > +        plic_hart_config = g_malloc0(plic_hart_config_len);
> > +        for (j = 0; j < hart_count; j++) {
> > +            if (j != 0) {
> > +                strncat(plic_hart_config, ",", plic_hart_config_len);
> > +            }
> > +            strncat(plic_hart_config, VIRT_PLIC_HART_CONFIG,
> > +                plic_hart_config_len);
> > +            plic_hart_config_len -= (strlen(VIRT_PLIC_HART_CONFIG) + 1);
> > +        }
>
> The length argument to strncat() is here being used as if it were
> "do not write more than length bytes", but strncat() will write
> length+1 bytes in the "source too long" case (length characters
> from the source string plus the trailing NUL). This isn't actually
> an issue here because we carefully precalculate the allocation length
> to be exactly correct, but it means that the code looks like it has
> a guard against accidental miscalculation and overrun but it doesn't.
>
> It might be preferable to write this to use glib string methods
> rather than raw strlen/strncat, for example:

Since I'd mostly written the code here anyway, I turned it
into an actual patch:
https://patchew.org/QEMU/20210812144647.10516-1-peter.maydell@linaro.org/

-- PMM

