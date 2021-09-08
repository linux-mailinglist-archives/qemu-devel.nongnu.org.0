Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70554033B4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:20:27 +0200 (CEST)
Received: from localhost ([::1]:46864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNq0Y-0005SH-U3
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNpzd-0004mP-RI
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:19:29 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNpzc-0007UI-As
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:19:29 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id z5so1801404ybj.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zIeVm512iomUcOKJ1cIKOq3JlhkPcCHZJ5huZk1PIT0=;
 b=TStNhQQzdB0cNufAFwJUVSnnlrNdHoq/ljkeoG6ze1KfH/yKrDZnsEg1LuihygJmPH
 TxIlzlRoSfjXaZwT0kcySAvz0YwrDkGLnXF6J1T/QJIGAw3iKQFyGB31vo64eewbtSoW
 NDUzgkwDA7LBOy+K/JxoxM3+9aH3JCiLUOySQbTvytNBaSvMUemCMHWQ/WIDmA9E32fE
 D+XXRTaA9iTB3m/RNvrmADEVn6Km159jqUlUJ5o2Gi52o6GzYv6bCwb4yGdxgN8NHsfP
 jR/7+R6AkbpNRAuPLKI67CqSZnIi7+2J6ZwwpzuxB+nVE9tX50RYXAvVWHNOpNVZhJa0
 DAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zIeVm512iomUcOKJ1cIKOq3JlhkPcCHZJ5huZk1PIT0=;
 b=SD7CKcqLEOaxseRz3yaABNmsAjzobTfiT4+NQ7OcXustrIgfCXoKg7OncxsdKfIzaw
 xh5dn6fqzuToc8e6BnxC0NE5iu9/8qqM1U35d8M8Mc2iEnftf7k+cap3oQLPzs6SunL1
 o7ma12s0H64RLa0Ixi1MSwU1fPZ1B3V3xti01wLqkfS/rqJMRLePpG6bkQ5gVKF++16d
 FhYQQ1VBcxdEXruxVkqJlbIPkRcVr7EBCQuVE5cPcrnuZkNWau6JA12Qfqpqk2xoH8uN
 SUCs4k7G+aHwtpsWJUQhkDwjkcimy8LS+It+cAJPwxe1vRWo/CDvGQ4yTLoyJ+SpqXh5
 TjZQ==
X-Gm-Message-State: AOAM532vEdjDDfzjTrFfBnYcP91y6roFWxyNjI/dLFPwdtjvWBoIbzJ2
 UM5+aFqIJdJsnqtwwFPH+MjqlQzdabbYgzwiz1E=
X-Google-Smtp-Source: ABdhPJxn8i3cGF7aCli2+6X/CLpz9zWLCgRt2ZCPhiosvILe1fZXfgdcybHz0pVUTpVFu/Ir1xhqkL92ridIzBb6/ac=
X-Received: by 2002:a05:6902:120a:: with SMTP id
 s10mr2563521ybu.293.1631078367383; 
 Tue, 07 Sep 2021 22:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-7-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-7-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:19:17 +0800
Message-ID: <CAEUhbmUYuYLT4wj6KQG+vewf-oAzcLSsrr_Er0bxzvYG8diUwg@mail.gmail.com>
Subject: Re: [PATCH v10 06/16] target/riscv: Remove the W-form instructions
 from Zbs
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 4:49 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> Zbs 1.0.0 (just as the 0.93 draft-B before) does no provide for W-form

does not

> instructions for Zbs (single-bit instructions).  Remove them.
>
> Note that these instructions had already been removed for the 0.93
> version of the draft-B extenstion and have not been present in the

extension

> binutils patches circulating in January 2021.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Remove the W-form instructions from Zbs in a separate commit.
>
>  target/riscv/insn32.decode              |  7 ----
>  target/riscv/insn_trans/trans_rvb.c.inc | 56 -------------------------
>  2 files changed, 63 deletions(-)
>

Otherwise,
Acked-by: Bin Meng <bmeng.cn@gmail.com>

