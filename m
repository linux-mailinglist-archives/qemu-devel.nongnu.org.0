Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EBC2C9517
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 03:17:19 +0100 (CET)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjvEE-0004vS-Fu
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 21:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjvDC-0004Rd-U1; Mon, 30 Nov 2020 21:16:14 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:34135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjvDA-0001dS-2L; Mon, 30 Nov 2020 21:16:14 -0500
Received: by mail-il1-x141.google.com with SMTP id x15so193856ilq.1;
 Mon, 30 Nov 2020 18:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3vjHFKy7KBmImLMItewectQEZhcQ2INzp7i8mHmpBs=;
 b=bjDmCA6mZMWYv1VxF1BVf1Y6z+0EbBckM4sKH82lz0NskJ38s0RXBQngIDW8rM6sq0
 d8s6i9Sx3AxnLr/mGozppHZPyVRhz+PsrhT+C1tIllBvho8/i9Ilg4/uxyiRgRXyWbWC
 37///QkHNwLzSVxfGHxA0PgwUOljC90svEbXzcWiMpFND4ELaJZqLtPTy4F8O4DlUzkh
 lbtP+IB6FG+RMQ+FnPQ3OksjbUWesYSfuVlQaMf56k68hVbdvzWVEo/Wxazmnd8W2ULL
 Wy7dK5AFsb277yNtV2nAU+DHNIB8RigKF9bFyNkFHAvwRmRprfuCplpH8ozZekrpwAqi
 2eSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3vjHFKy7KBmImLMItewectQEZhcQ2INzp7i8mHmpBs=;
 b=PPypy1f0k+SWd84QhOZuxvn1iLz6V1MAkiYzKAq3nkYTEabfwpHU6JzGYcmYvh5tRu
 9zwNWAVEsrpav/L41QjGD+9OxgwVoqiBavq3sKOeOjCPk0dRPW5QnSwhEh8pJlQBXCrZ
 b5nppyrY4DcZzhfcIM7WXqSjllXbi4b7EUc7pcrCtU6292Z3TrROF3WDSiBHH6Po0pAZ
 78xI72F8UkCkrLC/kY8u0ByLjlQaLxB6MFDWUyTsS2wBIU/2A7P1J7puPUdVdGVHnwmr
 lMVO2m4mBDjJTI0+odQ0YfUkPVkFg8fzyZhTayoTKXH+RyreBf1ljXvNQOou1bzXQrSd
 OGlQ==
X-Gm-Message-State: AOAM530jXdqBbTrtm74IiKPLSNA7+9lz2/F5TZoCf+nk7cnXZ1+WLYHF
 /iJ4UIfcMGex3awL0eKjKmPk45ClDkXT3YBec7Q=
X-Google-Smtp-Source: ABdhPJw5gt9m1MACxXDI8CLV3qYvtZqc5kfxkwx/mSNwRgqJSPxJbF9cZuSLZNQgxjfBSOImyXogODv1b51lfcfHaOM=
X-Received: by 2002:a92:4c3:: with SMTP id 186mr654029ile.177.1606788970132;
 Mon, 30 Nov 2020 18:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20201130012810.899-1-jiangyifei@huawei.com>
In-Reply-To: <20201130012810.899-1-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 18:03:53 -0800
Message-ID: <CAKmqyKOp1uP3uqrOp0hib34nSO1NKxRY13Uq5en90gKtzT-p3Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix the bug of HLVX/HLV/HSV
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Wubin \(H\)" <wu.wubin@huawei.com>,
 "dengkai \(A\)" <dengkai1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 29, 2020 at 5:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> We found that the hypervisor virtual-machine load and store instructions,
> included HLVX/HLV/HSV, couldn't access guest userspace memory.
>
> In the riscv-privileged spec, HLVX/HLV/HSV is defined as follow:
> "As usual when V=1, two-stage address translation is applied, and
> the HS-level sstatus.SUM is ignored."
>
> But get_physical_address() doesn't ignore sstatus.SUM, when HLVX/HLV/HSV
> accesses guest userspace memory. So this patch fixes it.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a2787b1d48..7274f971a4 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -367,7 +367,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>          vm = get_field(env->hgatp, HGATP_MODE);
>          widened = 2;
>      }
> -    sum = get_field(env->mstatus, MSTATUS_SUM);
> +    /* status.SUM will be ignored if execute on background */
> +    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background;
>      switch (vm) {
>      case VM_1_10_SV32:
>        levels = 2; ptidxbits = 10; ptesize = 4; break;
> --
> 2.19.1
>
>

