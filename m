Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CFD3C2361
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:22:54 +0200 (CEST)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1pWt-0004K1-Py
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m1pVi-000370-Lq; Fri, 09 Jul 2021 08:21:38 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m1pVh-00023U-49; Fri, 09 Jul 2021 08:21:38 -0400
Received: by mail-yb1-xb34.google.com with SMTP id a16so14322498ybt.8;
 Fri, 09 Jul 2021 05:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pnDhNBDuyMauo3uroYMTzMd2E2bMJjq3GcXy240sL3E=;
 b=o64YuIfH7aNlBwaSNlbVbKF8d8Gekgj462cts+7Lsox+cylhHMtB7zsxJzbs3Dd9ou
 ui+Yi+JywKziu33zaIjyQN+mzPhYQ8cyzBCZzijH2pGzoUk8KXbt60LngVGcNypbCT6s
 adydJTlUGgr0i1/069VGHN5iQD1jfcR4v8k428cYlSABrTKaqcnVpoBH+NXvAHS/uNcM
 /dfCl3G8Tg1IibqIk3t1wL29PP3ITRAQK3hNNUh2CoWWnrneqidy8uybBMfwzJL7uVXm
 9tJPkONfGS/sKbrVWQUP2n+ZEn5iM+F1OrOrwKzdMzSIpeapz2+MetacFn9SntygNKGc
 i1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnDhNBDuyMauo3uroYMTzMd2E2bMJjq3GcXy240sL3E=;
 b=SdJNrObmvXq4ELaMlcObUlR9E0UHjRRq97p7Lj12TvPux0QilhSpRE72nmY9qZORzU
 T3y304IOYOhcjJP76fpXKbtB4EOgYs4QMV9zPWrxDgtHBoe6D8VkdyeriUu+1EIOEbJX
 muIjz/mfITXJnIcJ9PpSbczPkVXFuBYhFv3/ALhjbghIg3Wy076NzAweLekwYcxRVvGx
 GGNuSquvrI8rICgk8vmCm61uMW/9PERdxeb/c/ux92eGaR1aKQ3aHHfj67WQuwf2fUhB
 AuC4tM8ndO1gI9pHKag0cSPJZgGbhmCdPESooMxgRkcXQS5/0APdRConhv631064tmhy
 GIeg==
X-Gm-Message-State: AOAM530ree053aduXKnKuVZ6TLqmQy13ChpwWh+hL+y++DJJWetokOGT
 TNbZET9HAvUZE0IfBP9L908PhjTMoH4S0G7+RLM=
X-Google-Smtp-Source: ABdhPJyeRTgrMCraxPGz+3aB65Wjbx1S4pzG5JTlvWGUecqr+UJ/vba/gK2KKNsU4sAhYS3IjwpZmdAVcSSJzeq1JVc=
X-Received: by 2002:a5b:504:: with SMTP id o4mr47842842ybp.332.1625833294774; 
 Fri, 09 Jul 2021 05:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625801868.git.alistair.francis@wdc.com>
 <c9cfbd2dd840fd0076877b8ea4d6dcfce60db5e9.1625801868.git.alistair.francis@wdc.com>
In-Reply-To: <c9cfbd2dd840fd0076877b8ea4d6dcfce60db5e9.1625801868.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 9 Jul 2021 20:21:20 +0800
Message-ID: <CAEUhbmUP9fWzZHEc3hir2fJ15k07VmDcmrc=FzbRy_CZMC6_fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/riscv: opentitan: Add the flash alias
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 9, 2021 at 11:38 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> OpenTitan has an alias of flash avaliable which is called virtual flash.

typo: available

> Add support for that in the QEMU model.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/opentitan.h | 2 ++
>  hw/riscv/opentitan.c         | 6 ++++++
>  2 files changed, 8 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

