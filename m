Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA53D5A03
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 15:05:39 +0200 (CEST)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m80Ic-0007AM-4q
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 09:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m80Gl-00050L-LJ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:03:43 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m80Gh-0000mJ-B5
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:03:41 -0400
Received: by mail-ed1-x52b.google.com with SMTP id u12so10481217eds.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o9YtlpMs57gkF874ra4K+P45JBe0PW3DkFA2j/etbWw=;
 b=mAQVaOPwGXEWm/EDSx46gn+L/yUR5b0L/GYAM9ZzeUYtU52/PZ8pz+NBWR1EF/wXNs
 FfICTnEw4J+A3DQm/77PhMSCaSB/O+GZ/RjXnFyN6oJpHEV+iFdABHnQE1AdMXF6Usx5
 9sSc86Wsb2QTnHlM08aLnXp8DcbDA+TDifft3c+iXaK4QaRi/xxAcmHc7DilRtlrY0Op
 4nx7YQxtuL9X8LNljP9kio+iMBXq11jEgzmY/Ni4jfgVyl2OcOwkMG1Hp4BcnBspBLRm
 3lCXit6/rUQCiwlGVoF/o69OayJ5YJ3PGF1f3Y0muU1pJMI55suxaIWs/o3wf3ZZzckn
 KMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o9YtlpMs57gkF874ra4K+P45JBe0PW3DkFA2j/etbWw=;
 b=aiwpJe2FaqWXC2XHIw8rzzhvlG9IMSq9Ljn1P4S5/V2X9l2b2ZxkwfBwfBFVhaIEcx
 enZOZ/dv5ihtQjJv/IlWBp48zKj4ykS8PNRevKgYbnhd9+u9pr3+275++7KfHu4t3iel
 o96HVnzPkaISdit4viNCdyvprg2MxoFCQuKHosyFm7WG2mj09bntSw4QQjAQHlRSXd/K
 IyCsEkjniQsMLnOcszQpMYcwCfy7MUfgCWVHODLAS/fsrnTZKoTjFjgnrvDV5/NyCXfe
 aVjsQBsvKvwOunrmaFqd3TrJMZDQI5sKo1fGX047fFv9r2h5nmcE6rqn7lhbo52hOaKe
 sjtw==
X-Gm-Message-State: AOAM5330yUsC8RiywAfW3/4QkRQmUpfp8fmYbe1DzzSjCMcUbJ7MDEyd
 znze3r/mvkG4d9oI0Ox5CZeeNABESDvN4bhZBcN+tA==
X-Google-Smtp-Source: ABdhPJx7jejGkwwXVwjDTXDdOmURQXPyr83rZBlKYngv9ii01e3wTTtd7dViwGlOX+8vnjheQpBH0RQYRtUjN1I/4rg=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr20962239edt.100.1627304617709; 
 Mon, 26 Jul 2021 06:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
 <20210725080817.ivlkutnow7sojoyd@sekoia-pc.home.lmichel.fr>
 <57459310-fe80-0cc2-5ffb-5b42bfe1a351@embedded-brains.de>
In-Reply-To: <57459310-fe80-0cc2-5ffb-5b42bfe1a351@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 14:02:55 +0100
Message-ID: <CAFEAcA8DAt+o-XZepg8xtj4i3xLW_yChwPnDZVM0O=rW8+9qJQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gic: Fix set/clear pending of PPI/SPI
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 09:06, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
> Ok, I will remove this part from the patch in v2. I probably didn't
> fully understand how the Qemu GICv2 emulation works. What I wanted to
> address is this behaviour (see GICv2 manual) when someone changes the
> GICD_ITARGETSR<n> (n > 1):
>
> "Has an effect on any pending interrupts. This means:
>
> * adding a CPU interface to the target list of a pending interrupt makes
> that interrupt pending on that CPU interface
>
>
> * removing a CPU interface from the target list of a pending interrupt
> removes the pending state of that interrupt on that CPU interface.
>
> Note
>
> There is a small but finite time required for any change to take effect."

We do get this wrong, but none of your changes to the file actually
change this behaviour :-)

What we currently do for writes to GICD_ITARGETS<r> is:

        /* Interrupt CPU Target. RAZ/WI on uniprocessor GICs, with the
         * annoying exception of the 11MPCore's GIC.
         */
        if (s->num_cpu != 1 || s->revision == REV_11MPCORE) {
            irq = (offset - 0x800);
            if (irq >= s->num_irq) {
                goto bad_reg;
            }
            if (irq < 29 && s->revision == REV_11MPCORE) {
                value = 0;
            } else if (irq < GIC_INTERNAL) {
                value = ALL_CPU_MASK;
            }
            s->irq_target[irq] = value & ALL_CPU_MASK;
        }

which is to say that we update irq_target[] but we don't change the
status of any pending interrupt. We should add code here that
checks whether irq is pending on any core and if so marks it as
instead pending on the targets we just set up, something like

 if (irq >= GIC_INTERNAL && s->irq_state[irq].pending) {
     /*
      * Changing the target of an interrupt that is currently pending
      * updates the set of CPUs it is pending on
      */
     GIC_DIST_SET_PENDING(irq, value);
 }

thanks
-- PMM

