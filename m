Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3443A37AE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 01:13:26 +0200 (CEST)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrTrZ-0000UM-8e
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 19:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTqp-00089L-8a; Thu, 10 Jun 2021 19:12:39 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTqn-0005Ll-E6; Thu, 10 Jun 2021 19:12:38 -0400
Received: by mail-io1-xd33.google.com with SMTP id 5so28900657ioe.1;
 Thu, 10 Jun 2021 16:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dcGYdzIzcWOpzDZfoKpS4jbuO3gYyTExPeTaBvQ2BTQ=;
 b=XkE4VgkrIIMujm1WrqnCzmbNGC8fH7xOVwL1RYp3Ht/CsBINs4V+ZIb+lJEJe+dPxn
 B6jZaELcMqLG3Cbw+mQugVaJ8p1amG+LqmYMNtIv0iwwoFhDQTwxipD9ZzxbZsa7C4G8
 CdtpzlIPt8zQwHLhRHPr5qMV28uKxWOrrRuXGuuxuytYBAI558g2YuGTLuSnDhTgTdFi
 PqhnahgCdtwFLneKGRsXqTRzLg4Z1N5jdfp4oHB/jyb4cPW7i8BhPna7GyOK+11bTPGE
 AGfStrIs321sCbclFp5BUfizusXVJlNGejGtYWRwx7rovP3dAql5DJgefmtiolSjJrze
 037w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dcGYdzIzcWOpzDZfoKpS4jbuO3gYyTExPeTaBvQ2BTQ=;
 b=PFqRRNWCDIDpJCYibJlehIXcWZk4TQ7xgLJeEBOAx3bzq2gBxbjfnsiTll+bkBtxeO
 N3WQgJ5bUOdmor2oshj/NV9t6YIVxGPdIkkIRSSNfrxr6ols75S09kv7PshQ6Jmy3xMw
 M6dNtULfv6WkeIUNrzW9fqxHpml2VZXiv82M+HjJ13iRT55VNfnAxlS0lGMHjL3bQTYk
 G+TaSVvnt8uPn+hapFYWbOCjk4Y6H8YYrOZQOWMFQxuPqDEkrCIDugSWX9ps9Mpb6E62
 YyLk421y/0mokyLUWe1NUOkiBtZ0aNoHWBQ+rBBEgQ2A8unE871njC5oivNWLGcRwjPL
 6cvg==
X-Gm-Message-State: AOAM533p7xJIvuzG4PqcNxVE8cVyWCcHhle11ov2ZmXpJDWCELRvA8K1
 eSEpk+UMqpbb0RYyQnYDr/G6sAgDP4/dXrt9SWE=
X-Google-Smtp-Source: ABdhPJx7uHgSrGcmQ+sZXRL0Z/HLZgqP4PbIe9DJa+wAekyWxxwnW7Qg6k451y//GWLguPLnv8niB4K/puqUjFY65g4=
X-Received: by 2002:a5e:8349:: with SMTP id y9mr704140iom.105.1623366755926;
 Thu, 10 Jun 2021 16:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210522155902.374439-1-josemartins90@gmail.com>
In-Reply-To: <20210522155902.374439-1-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 09:12:09 +1000
Message-ID: <CAKmqyKMvaLn5YUPVBngDjziud-t8P717cp-LsrOBo-VG18BMiw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: hardwire bits in hideleg and hedeleg
To: Jose Martins <josemartins90@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 23, 2021 at 1:59 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> The specification mandates for certain bits to be hardwired in the
> hypervisor delegation registers. This was not being enforced.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>
> ---
>  target/riscv/csr.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d2585395bf..9b74a00cc9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -394,6 +394,7 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
>                                             VS_MODE_INTERRUPTS;
> +static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
>  static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
>                                       VS_MODE_INTERRUPTS;
>  static const target_ulong delegable_excps =
> @@ -416,6 +417,14 @@ static const target_ulong delegable_excps =
>      (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
>      (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
>      (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
> +static const target_ulong vs_delegable_excps = delegable_excps &
> +    ~((1ULL << (RISCV_EXCP_S_ECALL)) |

> +    (1ULL << (RISCV_EXCP_VS_ECALL)) |
> +    (1ULL << (RISCV_EXCP_M_ECALL)) |

These two are both read only 0, shouldn't they not be included in this list?

> +    (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
> +    (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
> +    (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
> +    (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
>  static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
> @@ -963,7 +972,7 @@ static int read_hedeleg(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    env->hedeleg = val;
> +    env->hedeleg = val & vs_delegable_excps;

Because we then allow a write to occur here.

Alistair

>      return 0;
>  }
>
> @@ -975,7 +984,7 @@ static int read_hideleg(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    env->hideleg = val;
> +    env->hideleg = val & vs_delegable_ints;
>      return 0;
>  }
>
> --
> 2.30.2
>
>

