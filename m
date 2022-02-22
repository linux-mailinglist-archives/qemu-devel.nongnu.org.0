Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39404BFE36
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:13:11 +0100 (CET)
Received: from localhost ([::1]:53106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXmp-0001yk-2I
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:13:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMXNf-0000iN-Dx
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:47:13 -0500
Received: from [2607:f8b0:4864:20::b30] (port=38809
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMXHs-00081X-FZ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:41:13 -0500
Received: by mail-yb1-xb30.google.com with SMTP id y6so41970269ybc.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YqKcUuaac5OKqv+FKIk5aXsldevQcMVVgqj6xkN41DM=;
 b=LMgdsUepFz9b7tY+/1x3oPUBMXUPYot8Ii5+Uo6kDaduq0pF5D5PRUawKKXl++vk1R
 gCzEHl+yMynsB71JXZhp4GkM3cxQzNbPsNrh8FsO2iexEEVGbnBmQ42ENEqoIwIzM/CJ
 V1z9W9AyiiMzQBg9ekL/SqSNOoiNdldEVSpsQ7+fKLo0lxd+D2ab8oA9XwlWraQFS+jZ
 mcR83YsR8FvxIa8Kf18wOCjB/EONcV92r7ji5k1/m6bFH6bIrV+7gc+b9jyZ72xKmlQl
 berwpbrPB817/l3kqULaMhUn7syGV3rYmigXOkK0vvyyUIcxrH8hDFo+jyMZE01XhuAi
 JHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YqKcUuaac5OKqv+FKIk5aXsldevQcMVVgqj6xkN41DM=;
 b=1yaebNzNZ5pn7cWJ9mUq38kqjdP98ndm3aNoiUj0MfptG8BIytfmXv/iyPI/P6DhYS
 zHay0Y3O0S0v33g7Ry0R7QfzFyuZPvkBCqGe8zTVZVWNJuSQkHQWljnNBRpSqelgfHLd
 g/bYK4/KEiUzBaxLUwYj5RUxT82a39KiJLUk1pybHtiOm8mFurbhqWY4+JbEUUXkENDt
 3LlLMdf9kSv6OMSP3icXS2Gv988npxyykCv3BYvVKQjLaBDMcFOSZGNlsPiH67s2oFdD
 MigldyQyydHQVwl8FfxBBXgoXJAGhXExG4qpPRvgFpGJZaQtqq9YpzUqUUz/HFfF6OuJ
 orVA==
X-Gm-Message-State: AOAM5321Ai2MtGrCFgNj/SnbGLLDPZ/zSvCEyVB5KEDyiQ//g538wc05
 IBbGXvAyzYFluCdyOLuHHI4DjUxfEUYElI+ooPI6Gg==
X-Google-Smtp-Source: ABdhPJxJ94BC8K9AIU3O1i7+C90Wd59EPhRa7uJRVRd2is3oOb973EfYwPwuc57HTuzhYLXJ8srBOGARIXfyUvgwhRw=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr24106650ybq.479.1645544471376; Tue, 22
 Feb 2022 07:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
 <CAEUhbmVpGwjqvhLN1LCY3EokL9_a_v9okL=ZwUb_JYMZcvv3zw@mail.gmail.com>
 <CAKmqyKNLZGD-81xnFp_NMXKRuK-0EgP4FqW4AeLeKuMD+TAQEw@mail.gmail.com>
In-Reply-To: <CAKmqyKNLZGD-81xnFp_NMXKRuK-0EgP4FqW4AeLeKuMD+TAQEw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 15:41:00 +0000
Message-ID: <CAFEAcA-NBvhbK1_9N5P_+cUYnh9wJObi==yx85txbNq6jBgT=g@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/riscv: virt: Set the clock-frequency
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Dec 2021 at 06:35, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Dec 20, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > As per the device tree specification let's set the clock-frequency for
> > > the virt CPUs.
> > >
> > > QEMU doesn't really have an exact clock, so let's just 1000000 as it's a
> > > nice round number and matches the sifive_u CLINT_TIMEBASE_FREQ.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/472 (RISC-V virt)
> >
> > I tend to think this issue is not valid, as the comment in the issue
> > says the value should reflect the running frequency.
> >
> > Note the "clock-frequency" was once in the codes but was intentionally
> > removed before because it is not needed:
> >
> > See commit 7ae05377b85f (" riscv: hw: Drop "clock-frequency" property
> > of cpu nodes")
>
> Hmmm... Good point.
>
> But if the device tree spec says it's required then I think we should
> include it. Even if it isn't super relevant for us

I talked with one of the device tree spec maintainers, and he said
that the "required" note on this property in the spec is a leftover
from the spec text for PPC ePAPR, and it isn't actually required
these days. Many DTs for real-hardware Arm boards don't set the
property, and it's not marked as required in the devicetree
yaml schema for the cpu node:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/cpus.yaml#L63

thanks
-- PMM

