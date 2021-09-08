Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B64033C6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:28:58 +0200 (CEST)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNq8n-0006IM-Bl
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq7c-0005bl-Co
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:27:44 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq7a-00060W-Ma
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:27:44 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id z18so1788528ybg.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUmxSghAdpqHCWVw//LaQ/a4NlK+w6RXy/KeGGag82w=;
 b=HJIE+RUtt/6Fjw9vr3I2D2K/FPCwaJiaOLq/geyNQkRBc0vNm8wjbXQIaS/GpX4u7e
 EG27MeKEoYcwTVd8wtAf4oFnmzQhToFuWI+vSMM7N9c6Llj+FRnjsx42pWohjwDf7cgs
 m2TbMuTD0AKN0b1Gz/4x/9g/V2Q72v3b8Z/T9G0XvZRAGDfbdVpMpB2PORASLmWuk5EY
 R1oNEmYzpyminUKumzYjvXPzRS1jwT0q988O8r8TBjr6n6u7xEbD8SJUXvj/acoIzLEH
 luzUebEhLVBXnJD9lOrhvqclAh04L4LieerO5o2IdCkBLr2lOMl7InUq6b+mT+RIR9Iy
 nc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUmxSghAdpqHCWVw//LaQ/a4NlK+w6RXy/KeGGag82w=;
 b=TnDmje+QSwm21qEgn1lBgnOeV9E9RELH1lf/0Uq3tgMhWPGLnqw/hRBb22XjGoHyFs
 gzD+o6ZzzpBHHwV+7YjJw8Xli7HoHPFxPI6z5c9tiBJpESghBtOFcYncdQupe3OZdH+o
 w8aAzTiAl1NoXrhacCHPfH+5HQmJE3rzHg7QbyDNDgA44CyoaM/hgrpIYTwYn2x09s4Z
 bdWFhfRM61FFgYCkCFvVvlwPxEMZ0ELZraAeHDuqwTGwBMx9PrWWOlSVU409kkqN4laR
 +yRhCwevBU90aNSJeHmPye9Ld0pE3fvPOpskpbUWtIh66+JLK2fx2V2bZwOPCGUEVn5m
 THFg==
X-Gm-Message-State: AOAM531zv9a5+aayVtFYvx+uU/QdbMW6Ggrn4Jlo1gie23b2L7klal/T
 BqZoRDVH//+gdwm+KDiuVYTOJr7Wk7T+C4qSI5w=
X-Google-Smtp-Source: ABdhPJzuzadMFZkqZCe5YnSfH9wjaHvbHm8rEsRExBq8/7Qv/QLbkzOfa5Y4yivnqi22aDFSVYrFvg2KQ5mECP7MqRk=
X-Received: by 2002:a25:76c7:: with SMTP id r190mr2778779ybc.467.1631078861574; 
 Tue, 07 Sep 2021 22:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-16-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-16-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:27:31 +0800
Message-ID: <CAEUhbmW5kjC9W+p3rRMNiOn=0nnhpWypfN-5Owj+f4OVOJqtPw@mail.gmail.com>
Subject: Re: [PATCH v10 15/16] target/riscv: Remove RVB (replaced by Zb[abcs])
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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

On Sun, Sep 5, 2021 at 4:53 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> With everything classified as Zb[abcs] and pre-0.93 draft-B
> instructions that are not part of Zb[abcs] removed, we can remove the
> remaining support code for RVB.
>
> Note that RVB has been retired for good and misa.B will neither mean
> 'some' or 'all of' Zb*:
>   https://lists.riscv.org/g/tech-bitmanip/message/532
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Removing RVB moved into a separate commit at the tail-end of the series.
>
>  target/riscv/cpu.c         | 26 --------------------------
>  target/riscv/cpu.h         |  3 ---
>  target/riscv/insn32.decode |  4 ----
>  3 files changed, 33 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

