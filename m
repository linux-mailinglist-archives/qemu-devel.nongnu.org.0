Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681A51BC5F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:44:15 +0200 (CEST)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmY1u-0000I5-GO
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmXnL-0002oj-1G
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:29:11 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:41910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmXnJ-00005X-17
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:29:10 -0400
Received: by mail-io1-xd35.google.com with SMTP id z26so4111348iot.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jutkbPbsoAbqQJt+ny+NpS+OK9Uj8ivO7sEvrfIDjBk=;
 b=aDJCdcGTbRbHgafmN3pz494hvIjQmPg6Yvdsl2qdnPM2Wcan2utmsxlWU7rXRICNdK
 KyOxHjeAq3tMfOe9mMUc/A0j1Byh6j/ZMWnHfulSOJMPvS5KV+SvKQPbnZaMJ1bl68un
 amIdempiQZv+T+izWYGwb0aLno28GyQHOO9hhyKrJ5lbRkWVCRtDI9OIH3WHjbubvZxb
 ql/6vRseQHfXecQJSIfnjCm9h93Z9RrSTA/GeXF4LXT+ZAdzPxbk+xPuR9W5lhCuSq3I
 k3ftutcxEgviv0sVJdNxRZWsRTKgW1tu6ZdWzK5vo62TbQrP83rJ2+8RaMbhGfi7r5ul
 zfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jutkbPbsoAbqQJt+ny+NpS+OK9Uj8ivO7sEvrfIDjBk=;
 b=YvGWxyUFnhVAMsiDqXAi5A1YZo7whXSMBNDjrPU4fyMffCDBp6eocl7NabY+J21IKB
 GbolUzaG/osukd13i0Hmw9hIxSDfgLgacq3Gv+ZUm2ki2v/T7qbOCPSx9O4422TK4ETJ
 KZnIW3VBkt/6GPqeUg27U6fF+vazpaT6WyDl7+lpaVIFyieZNYOI/0Ve0zF2HAfBISFY
 hz7/h07HEyGr8QR/PPaKVhMr4wVt0dlmZ17F5F9pQvv7GTrTbVr4A5gVOnLKP/HK1huM
 ZR+rOzuFQOHSNO0j314WXxcaM7neobKVrY2KGfKw8wBoqhF6x7s62gq7WYz/2szxBj8V
 M64g==
X-Gm-Message-State: AOAM530+nBZQ1QDI2SWQCGRHZV5NMiIuZGDcMWPK9u7LV0dtN8jyxYEL
 TJjQ6zmztK7efsZWVA8VHXJNb2sbRbmzO9Mn7y8=
X-Google-Smtp-Source: ABdhPJzB9g2Ii0Me27EGPRoKdwEnVo8rg3YHRboOt389C0FHnnFytdo/RQj4fG7WiNufQS8Xqe1SzoRh0a8/2pfsIK4=
X-Received: by 2002:a05:6638:370b:b0:32b:21bf:ecec with SMTP id
 k11-20020a056638370b00b0032b21bfececmr11368681jav.267.1651742947713; Thu, 05
 May 2022 02:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-205d4899-352a-4ef8-b8c9-d251d83d8071@palmer-ri-x1c9>
 <9112465.1c07.180920d7dab.Coremail.shuizhuyuanluo@126.com>
In-Reply-To: <9112465.1c07.180920d7dab.Coremail.shuizhuyuanluo@126.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 May 2022 19:28:41 +1000
Message-ID: <CAKmqyKMN67aUDbufbg2OQq2R-jiwO7c3NajJerSrPZa4RwPcUA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Expose risc-v V and H isa bit in
 get_elf_hwcap()
To: nihui <shuizhuyuanluo@126.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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

On Thu, May 5, 2022 at 12:30 PM nihui <shuizhuyuanluo@126.com> wrote:
>
> Ah, I admit that I haven't tested the availability of the H extension,
> I could update the new patch to only add the V extension.
>
> Regarding the motivation for this modification,
> the ncnn project uses the risc-v vector extension to optimize the efficiency of nn inference.
> I am very happy to find that qemu already supports rvv.

I'm glad to hear that QEMU is helping you test Vector extensions!

> I want to use qemu's userspace mode to do unit testing faster and more conveniently on the ci server.

Does your Linux system expose V via hwcap? As Palmer says I think you
are currently stuck with just enabling it at build time as Linux
doesn't expose this information to userspace

>
> In the past, I used the rvv branch of sifive/qemu.
> On that branch, the V bit exists in hwcap and works well [1].
> I can distinguish at runtime whether the current system supports rvv by checking this bit.
>
> As an early adopter of rvv, I think exposing V bit will help rvv to be more tested and widely used.
> After all, rvv is not enabled by default.

I agree, but Linux and other software doesn't support Vector yet (at
least not that I know of) so it's difficult to enable by default.

> This V bit will only exist in the -cpu rv64,v=true parameter, which is for some advanced developers.
> We know that qemu currently implements rvv-1.0 and removes rvv-0.7.1.
>
> [1] https://github.com/sifive/qemu/commit/7a3e8e23b4cf1422ec48e9d4b4009337a05a635d
>
> best wishes
> nihui
>
> At 2022-05-05 00:05:31, "Palmer Dabbelt" <palmer@dabbelt.com> wrote:
> >On Wed, 04 May 2022 08:10:03 PDT (-0700), alistair23@gmail.com wrote:
> >> On Wed, May 4, 2022 at 2:32 PM nihui <shuizhuyuanluo@126.com> wrote:
> >>>
> >>> This patch brings the optional risc-v vector and hypervisor bits
> >>> in hwcap so that application could detect these isa support from
> >>> /proc/self/auxv correctly in qemu userspace mode.
> >>>
> >>> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
> >>> ---
> >>>  linux-user/elfload.c | 3 ++-
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> >>> index 61063fd974..3f0ef2b8f6 100644
> >>> --- a/linux-user/elfload.c
> >>> +++ b/linux-user/elfload.c
> >>> @@ -1484,7 +1484,8 @@ static uint32_t get_elf_hwcap(void)
> >>>  #define MISA_BIT(EXT) (1 << (EXT - 'A'))
> >>>      RISCVCPU *cpu = RISCV_CPU(thread_cpu);
> >>>      uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
> >>> -                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
> >>> +                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C')
> >>> +                    | MISA_BIT('V') | MISA_BIT('H');
> >>
> >> The kernel doesn't support H or V. I understand V should be supported
> >> in the future, but what is the use case for H?
> >
> >IMO even V is a bit in question: sure that bit's likely to be set at
> >some point, but there's many flavors of V now and we'll have to give
> >userspace a way to differentiate between them.  There's been some
> >proposals (see Kito's talk from Plumbers last year, for example) about
> >how to deal with this, but nothing really concrete has shown up yet.
> >
> >If we flip on the V bit in user mode emulation then we run the risk of
> >having a wacky ABI here, where QEMU is setting the V bit but then not
> >setting whatever extra info is expected to come along with it.  That'd
> >mean userspace has to deal with that case -- maybe that's not the worst
> >problem, and I guess it's better than just assuming V is always on,
> >which is all userspace can do now, but any ABI divergence is going to
> >lead to headaches at some point.
> >
> >IMO the right way forward here is to just sort out what the actual
> >interface is, last time I talked to Kito about it we had a rough idea of
> >where to go and plans to do it.  Not sure what's up these days, so I've
> >added him to the thread.  If it's a long way off then we can always toss
> >some intermediate thing together like this, but if it's close then it's
> >probably best to just get the interface ironed out and then have it
> >match.

Thank you for the patch, we really appreciate it and I hope to see
more patches from you in the future!

I think in this case though we shouldn't take this patch in QEMU at
the moment. It's important that QEMU follows Linux here, as we don't
want to diverge.

Alistair

