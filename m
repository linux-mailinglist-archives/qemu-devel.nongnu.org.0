Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AEE4368BC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 19:08:20 +0200 (CEST)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdbYC-0005pQ-4H
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mdbWR-00043N-KS
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:06:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mdbWJ-0005Bs-Ip
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:06:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 g79-20020a1c2052000000b00323023159e1so432310wmg.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tEGhx5P3FcpsCBX6IaldfqX9RQtIXBdFtyUSKwEgIPQ=;
 b=wi84dFsfa2KJZdXM1ZIgbSVV9JFNKXLRun5LkWmI3p3eLFZ1LI3G4qdVz0ejAK2Mf4
 x1beFqehB8OIjG5vd1nPIJVaXfTUiKH/yvcoMKy4b/qu1XRudBzUv69/SCUERo8Ykrqz
 gVXpNbLQqUMs68Z1ZT1jpqr1OHCogkutGyncbgVPR1TJcxqvGQFIldspIDd4NyUdidVp
 krql+V8voXNe1ka/nyZUxYcayZNkP7cTf1vGnkSuBdZGaO5kW0wPVQc08+ZeH05VsfUT
 ICOqrIVKo5mIicLiNum+dIGMVwytU4ks3D8QcJgTNKGm7dCSnduQ8oVMmaWagLns2woQ
 s73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEGhx5P3FcpsCBX6IaldfqX9RQtIXBdFtyUSKwEgIPQ=;
 b=IsMZIidGpvN9nupMFSYJZzbmaGX+jRd8IaxBW8qoXyJ10pMGOZtah7CJLAcmjVDTKi
 loCSmijFjOq6BV8FNFRsR/w3/l7ATt07qkX6nuCbe/2jIh2y/N6gNMPn92xqTJNn7Y1n
 4x804foAI+9kfLC5L031qH4H9T3QjNxhw/C+X2G1HZpxbPRNv7A7Dnf5ZTr37C9ecRIJ
 FdmC5IjBHTbjcmiOozu/lwmmP5wDmMqA6h14LnqsI2F9/CwLvGfeRSMZG1k1Bm/isVVk
 XQZbtBnTHsUEJFYU/AtimIWArXhlxCfeBEPFOGKzJTqKRZdWjKxGuBF8YOjWrFw2v6hT
 zr8A==
X-Gm-Message-State: AOAM53259E1J3/r8gd9BgX2xA/YzvTii5BMAeZvEzeTw8PdWGSkPDJh0
 JyrAs6DC0FKr6ZVdsTZjR/gTsBRLsURLFIiBChvMBA==
X-Google-Smtp-Source: ABdhPJw1tvqSTLGhSFTfRea8Wuwo+wjgf9id9lEqBd77jlyX+Fq7eczxDL8GHlyNYamcUD+q3Zw3D3pO7z87FFquRnI=
X-Received: by 2002:a7b:c742:: with SMTP id w2mr8178932wmk.61.1634835980038;
 Thu, 21 Oct 2021 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-6-anup.patel@wdc.com>
 <CAEUhbmUiq4hPgEP9xiEsb0kbDwYJyBqet+gnn+ydrJekxwnNyg@mail.gmail.com>
In-Reply-To: <CAEUhbmUiq4hPgEP9xiEsb0kbDwYJyBqet+gnn+ydrJekxwnNyg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Oct 2021 22:36:08 +0530
Message-ID: <CAAhSdy0Eq2kDojgZMof93AqbL6P6DBJXC85rNxzE7cXPGZ4GcA@mail.gmail.com>
Subject: Re: [PATCH v2 05/22] target/riscv: Allow setting CPU feature from
 machine/device emulation
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32f;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 4, 2021 at 8:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Sep 2, 2021 at 7:42 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The machine or device emulation should be able to force set certain
> > CPU features because:
> > 1) We can have certain CPU features which are in-general optional
> >    but implemented by RISC-V CPUs on machine.
>
> on the machine
>
> > 2) We can have devices which require certain CPU feature. For example,
>
> a certain
>
> >    AIA IMSIC devices expects AIA CSRs implemented by RISC-V CPUs.
>
> expect

Okay, I will update the commit description based on the above comments.

Regards,
Anup

>
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.c | 11 +++--------
> >  target/riscv/cpu.h |  5 +++++
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >
>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

