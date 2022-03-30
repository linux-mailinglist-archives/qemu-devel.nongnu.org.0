Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEF04EBAB3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:20:13 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZRgh-0006hE-HI
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:20:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZRXF-0004E6-5i
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:10:25 -0400
Received: from [2607:f8b0:4864:20::d30] (port=42509
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZRXD-0004GP-JW
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:10:24 -0400
Received: by mail-io1-xd30.google.com with SMTP id r2so23603929iod.9;
 Tue, 29 Mar 2022 23:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zowoyxh+/jiR8XpKQ/4+kwFO7DqvS5ntnWO24EzrYa4=;
 b=qZh/i3KXOOTlkjzhHgKlxCkhWhv6CVuAhkZbTt6fQZRxCB3Nv8/pk9bqLlcQz6aeBk
 QCWIB9KjaDRXHvap1FNmaYvoW2OrK6wAqBLI8B28gy3/l3Atv+EcxL4sp/B4boV0ffhH
 cUltPVF5S68bbv/DMbVAECLM5c9/uJKLsKRutdz9s/yytvzxXtoPMb/T2AKbFOnWhy82
 mydl00xn9uAIRggjvj1SsUU/vLJh069epDV+QqCSkbie4yMq3Oh9Q9ILjlG47XHtb/Ow
 oSfkC/eScBFJ006SPgitz6F550ujQ51+ikwbGVrw8uBqSHNnJwSB7uw/nvFXvIjGVb5d
 Dtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zowoyxh+/jiR8XpKQ/4+kwFO7DqvS5ntnWO24EzrYa4=;
 b=FxVUI/Gl/f5u2C8uEA/ck0jjwFzbm/5c3IcrvnZdry70ORsmnWQjHIbsh76ZEARgf3
 FEHgGMVJeTkR+mnYKzMuX22DHroQgtWe8Z442scckaEPpNMEGPZlvH7+mw97PV5taNNl
 bmNRgMBxYFK1NJ7tQVmTNRCwO0J77Odsmjp/p+I6kEZoeKxb2i4RTU/I4m5YeBVrqOes
 4rTwNcAod341FCTuXaWk0dPxdUHmU76zo3ub6PDxKY8H9oRMsXn3Dn4b0M3hqM3Lx2hC
 iBckws6MhgI1ohq37yUKstwYNi9uEiQMXkmfi++mMLPn8/MNzzqUwZvgsy6+BX08I7bH
 CU5Q==
X-Gm-Message-State: AOAM5332QGyFwG2OSjBNzjzUkN2+AIvXZ8gjxEElieVZ5QAejf/qpjyS
 nYUGBmzlwyoGtEyaXN09hn/Pt5xhIDRSt92Cog8=
X-Google-Smtp-Source: ABdhPJzrxpsg72RCTHMv9qZsbaPVfOnWixuyjQxwDFI96Q61wYVMDOOXgmagBU0H6J/41hgPtdzVWXBkIMfOZ8TjJ9s=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr11026477iov.93.1648620622123; Tue, 29
 Mar 2022 23:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220315192300.250310-1-idan.horowitz@gmail.com>
 <CAKmqyKPu71vO6WtqSHc_XjXrzCicj-_GRm+11njcRxYH3KhbQA@mail.gmail.com>
In-Reply-To: <CAKmqyKPu71vO6WtqSHc_XjXrzCicj-_GRm+11njcRxYH3KhbQA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 Mar 2022 16:09:56 +1000
Message-ID: <CAKmqyKNft_EE26PWDhsXe3juPE8h_z6RtdsCrqpB6Yj9qQO2YQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 9:42 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Mar 16, 2022 at 5:26 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
> >
> > If the pages which control the translation of the currently executing
> > instructions are changed, and then the TLB is flushed using sfence.vma
> > we have to exit the current TB early, to ensure we don't execute stale
> > instructions.
> >
> > Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
>
> Thanks!
>
> Applied to riscv-to-apply.next

This results in failed Linux boots, I have dropped this patch

Alistair

