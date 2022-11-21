Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B546318C9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 04:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owx4N-0007Gx-Dk; Sun, 20 Nov 2022 22:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1owx4L-0007GZ-QP
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 22:02:01 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1owx4J-0005Z1-Uu
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 22:02:01 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so6600889otl.10
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 19:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1GC5szBlmSrZNXAp6q6CL2QPUkkIjAV+S+QUdZgBYgw=;
 b=DC4UaAEnJWGo9umR1qVFF1H7FjKT6Hyrj0x2PCMStQZZ8J9Dm2T6miKBor2Fr4blVJ
 nSjTDxZpt8SeckksG9c7jFWEE73YzmL8EJpFq18zkLXE1pCGCxjkZ1hH/pR7rgsDJCPf
 q/mYbsaPVoRWrx3Sw3U9ectbv1rWhBcf+QU0OywnnN4cZ7j8wkQ7nsMu3jCr5ebS3ijl
 hxbGI4WnEfo3kG/71LliQoIhv9lMn1n7NQIeqcjdt9Gybi48Ow7uGDlCh7Y5szM6BXa8
 LGWz4q13bH0PaeZu5UR524Z2VJnjYyIBarBkTfnSdgMvvsvwZ1T+WvILLxyUgM4K8Uzk
 HfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1GC5szBlmSrZNXAp6q6CL2QPUkkIjAV+S+QUdZgBYgw=;
 b=jkI7L3UQrAocidscm1cPjkwHRUqtJskoc5Zw40mBli0lyd7qOPShJeAvC6jeY6AEEn
 B/eqasX739KUYWCphVPNJye2Gb0sHbDlJ/FZvhT6QkfPZRu3x4AzUxTMXsMJ5UXG5eiP
 K/a/tz1fZEclVJ/7QYQq4ou2GxbwTOXWfo9OqgWfL8Bv/LYYaXr5WuxSf/SLJZv6yyI+
 K8Ytda4GdRIlKNwVw4gLc50CloDRCNBiLhFg26ph/ErIhCLs/Nl/NeCTVNKT3c+/V0Hy
 gcGCV2MLA+QXEaa2SyUTDTaSTe+9ch31ocjxDK4TsQ8RxOy4m5yMuYrEflS9UOaZ+23J
 gnjQ==
X-Gm-Message-State: ANoB5pmG9z102ThUsUyPcxvZr1+wKiPzGkW2U291QCStVQOvSfzWTfnQ
 fkSjuvd+HLaEgRcbDXaT4kXzac56P0q59wPoCkmWkw==
X-Google-Smtp-Source: AA0mqf7CFE3bV2P0evt9gsd+lsflp142lxrBlijNUQz7B+30Y/xLi887tnoJu61JOKuHt+YyGYxm/T5sHCNzDvsccGA=
X-Received: by 2002:a9d:5e0f:0:b0:662:2458:3ef7 with SMTP id
 d15-20020a9d5e0f000000b0066224583ef7mr8792737oti.150.1668999718082; Sun, 20
 Nov 2022 19:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 21 Nov 2022 08:31:47 +0530
Message-ID: <CAK9=C2WPJRmQ31h3EvEm-JHX8MtrgZFwOyx20Dp88HCbeLkPMw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Nested virtualization fixes for QEMU
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=apatel@ventanamicro.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alistair,

On Tue, Nov 8, 2022 at 6:27 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series mainly includes fixes discovered while developing nested
> virtualization running on QEMU.
>
> These patches can also be found in the riscv_nested_fixes_v2 branch at:
> https://github.com/avpatel/qemu.git
>
> Changes since v1:
>  - Added Alistair's Reviewed-by tags to appropriate patches
>  - Added detailed comment block in PATCH4
>
> Anup Patel (5):
>   target/riscv: Typo fix in sstc() predicate
>   target/riscv: Update VS timer whenever htimedelta changes
>   target/riscv: Don't clear mask in riscv_cpu_update_mip() for VSTIP
>   target/riscv: No need to re-start QEMU timer when timecmp ==
>     UINT64_MAX
>   target/riscv: Ensure opcode is saved for all relevant instructions

Friendly ping ?

Regards,
Anup

>
>  target/riscv/cpu_helper.c                   |  2 --
>  target/riscv/csr.c                          | 18 ++++++++++-
>  target/riscv/insn_trans/trans_rva.c.inc     | 10 ++++--
>  target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvh.c.inc     |  3 ++
>  target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
>  target/riscv/insn_trans/trans_svinval.c.inc |  3 ++
>  target/riscv/time_helper.c                  | 36 ++++++++++++++++++---
>  10 files changed, 70 insertions(+), 10 deletions(-)
>
> --
> 2.34.1
>

