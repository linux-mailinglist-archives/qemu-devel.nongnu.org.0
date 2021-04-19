Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F6364E7C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 01:15:49 +0200 (CEST)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYd7L-0000hl-Vw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 19:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYd65-0000CG-HP; Mon, 19 Apr 2021 19:14:29 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYd63-0003ur-Rp; Mon, 19 Apr 2021 19:14:29 -0400
Received: by mail-il1-x12a.google.com with SMTP id i22so25855028ila.11;
 Mon, 19 Apr 2021 16:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8TPIjvkU10eW5wJkTSfAUvA5+MinnBhLWIoQFZh6C8A=;
 b=vP/+6U2R/1TYo4tovZ+CgvogjeM3d4R8oYpu/smCT7WMz5CGTG+U2YIoatuRBzcfRQ
 nEllutVOe3wqju+QloUlQtN9nGkAWlAzuYvZz0hS1WhEPfabUp3mZpAlM4A8o1FdmSPg
 CLQn4PRq5t0q0MfJUAF9PUzOqJFU0FZVLQvxRTUsE/N5TnKXap60s3zs6f4XdbYWaHub
 q0IOJi/hPe6i874jhyDZOotYxJ1qEOGyQnSuvq7H1v+mi01O7DhPb9XYyKyS6+S5oUTS
 9uRSb802ABmvgR1JNQQN//HxOdUHnEA7QdORHDAO5uoGSka8rZg1mKugQlLwnv1wC/UW
 +4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8TPIjvkU10eW5wJkTSfAUvA5+MinnBhLWIoQFZh6C8A=;
 b=UcKGXqAyyUCOMHz23bZcj9+2+HZrk4M6aNq2b78YsSX9LDhPhV7tcghMnt0gNBUs8F
 Yl82ZPxWujDmhA78mn61CwkE0Mg84lq2qDvkiNi2rQyNI25D/blc4Y5N+UAMHARNS/Gx
 YJiF6/LKbh2iIFVaihBtrxtDdDJXf3VLiEwnRdaPJDoAUkeotHz2op0hjYpFuoxz/iXa
 E934ccU5anBXN8LtWeyVmrChzC3gziNl1b3Dk3aaa7YS4o5xSyj1JtaetBgVPkfezGSL
 6Ht+muKDZRL0W/GyeH79TyesmW8ZpaU+swK87DoED+EoIrbZ0ZAfFpKKLM7QmMV9xw5H
 W4MQ==
X-Gm-Message-State: AOAM5303uSLSL2Ztc2WDRxhsXoyntQznxN73qdM7rBR4oHeoVMkJt710
 YoD8nB6EcsUL/4JlzBsD87YmRKTENHcNg9qNlBo=
X-Google-Smtp-Source: ABdhPJykFQ9SL6zGRfoJfFDX2ft3HZXF0e9fNfAU3td+z3u7W8nF+zczRj4yHHZfAjRgf2oNBCAq3rUdxGvOo/1Vzag=
X-Received: by 2002:a92:d90f:: with SMTP id s15mr19365345iln.227.1618874066238; 
 Mon, 19 Apr 2021 16:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618812899.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1618812899.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Apr 2021 09:13:59 +1000
Message-ID: <CAKmqyKNjNsnxtX8jSCt4JuL=hKctLtcrTeqUNc8WV=F4T-8cQw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] RISC-V: Add support for ePMP v0.9.1
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 4:16 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> This series adds support for ePMP v0.9.1 to the QEMU RISC-V target.
>
> This is based on previous patches, but has been rebased on the latest
> master and updated for the latest spec.
>
> The spec is avaliable at: https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8
>
> This was tested by running Tock on the OpenTitan board.
>
> This is based on the original work by:
>  Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
>  Hou Weiying <weiying_hou@outlook.com>
>  Myriad-Dreamin <camiyoru@gmail.com>
>
> v4:
>  - Fix the pmpcfg write function and log
> v3:
>  - Address Bin's comments on the ePMP implementation
> v2:
>  - Rebase on the RISC-V tree
>
> Alistair Francis (4):
>   target/riscv: Fix the PMP is locked check when using TOR
>   target/riscv: Add the ePMP feature
>   target/riscv/pmp: Remove outdated comment
>   target/riscv: Add ePMP support for the Ibex CPU
>
> Hou Weiying (4):
>   target/riscv: Define ePMP mseccfg
>   target/riscv: Add ePMP CSR access functions
>   target/riscv: Implementation of enhanced PMP (ePMP)
>   target/riscv: Add a config option for ePMP

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h        |   3 +
>  target/riscv/cpu_bits.h   |   3 +
>  target/riscv/pmp.h        |  14 +++
>  target/riscv/cpu.c        |  11 ++
>  target/riscv/csr.c        |  24 +++++
>  target/riscv/pmp.c        | 218 ++++++++++++++++++++++++++++++++++----
>  target/riscv/trace-events |   3 +
>  7 files changed, 254 insertions(+), 22 deletions(-)
>
> --
> 2.31.1
>

