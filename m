Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A640C822A6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 18:43:19 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hug4s-0005Gu-Tz
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 12:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38635)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hug4C-0004pY-Ng
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 12:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hug4B-0000c8-Q8
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 12:42:36 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:42197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hug4B-0000bf-FU; Mon, 05 Aug 2019 12:42:35 -0400
Received: by mail-lj1-x241.google.com with SMTP id t28so79838574lje.9;
 Mon, 05 Aug 2019 09:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hrz37h6pLeTULUQB3j1QQgTdX0pcQyrRA2ZObpkQpNw=;
 b=l1UsnEicm68pYjGummRwSXH82atr2jnneyblBdKY9xTPumrIWN6ffygeArxwgoUsJG
 UjMrYulxxfOObOZwstu0tOAq/dPL+epagC8trT8w78tuwLPHGaKCtQzwhqmslHTzDEBQ
 TevQAeJ3cSFNbYITjmW3vjdvPkVCtHSTvfzALc8Axzwe6PAbAKolanTKTvQKW95Ndgsq
 DM7rGFEEs13e4y/ZQgvTnBYlsThn8sxfJ4Yi+w+9HwC49IMI4oLuOWE8AFlETuLPKCA6
 Dzlxl8TLK/Uxul78lqV6q6cUNLCtxkm3+wrSJL5CXr6yPhY2aESxkyemoceb/0iMdbcc
 CR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hrz37h6pLeTULUQB3j1QQgTdX0pcQyrRA2ZObpkQpNw=;
 b=krRwdg3YdJUeUvufNbSgTDkrQMu9r+v+4cMenuOLqqrfaXKJCR5AeA3XBN/ZZiqHcZ
 LvJhJL/ZTezgcIRf44P+qlATqJ6F6k6HUd35MFoypW01a5zHSfISNY7PcpaK0zOUz9II
 LoqiTWcBSuBtGyaCbLR+o3kBUXNjwl/c2aIA6K/SS3Ocp/4bLADTXElkPT81ltPMgaWe
 JeZSmJqm5x0fKS21GLiunZMyLfWbjfkVxhZvDP9f2qhJm2D6B1WN5GBlYhfLdkGaLeQ9
 xLhaEuFyGM/utDQXuh3LxJNb6ZDGWHtmaJ/gzPxrGWg+X0hITOtnKUpT/urEflPrtHAt
 G2nA==
X-Gm-Message-State: APjAAAXAyXTdLKYGf1A54B9MuCm4xv+8sHqlE352ZAYTJCuUhCsyFQGU
 YEDu4Qk7olKvCCjYFPzGZ8jVzwIl0UmRjmA7f4A=
X-Google-Smtp-Source: APXvYqxpg0xIa6I9cLfbY6VVZnVuvJ3VLX4/ON5rTgb6vTrCYmt2Ilf74IIUZNcn2akkAVuXItORl97tDD63e2r9K3M=
X-Received: by 2002:a2e:4794:: with SMTP id
 u142mr79906227lja.222.1565023353013; 
 Mon, 05 Aug 2019 09:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-8-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-8-git-send-email-bmeng.cn@gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Mon, 5 Aug 2019 12:41:47 -0400
Message-ID: <CANnJOVHeoqJ9pxVur3tTzEHf2kPBw4zHaiEzaUxgOvnTQJEVjQ@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [Qemu-riscv] [PATCH 07/28] riscv: sifive_u: Set
 the minimum number of cpus to 2
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not familiar with QEMU conventions on this, but would it make sense to
require having exactly 5 CPUs to match the real board?

Jonathan


On Mon, Aug 5, 2019 at 12:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> It is not useful if we only have one management CPU.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/riscv/sifive_u.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 08d406f..206eccc 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -428,6 +428,8 @@ static void riscv_sifive_u_machine_init(MachineClass
> *mc)
>       * management CPU.
>       */
>      mc->max_cpus = 5;
> +    /* It is not useful if we only have one management CPU */
> +    mc->min_cpus = 2;
>  }
>
>  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
> --
> 2.7.4
>
>
>
