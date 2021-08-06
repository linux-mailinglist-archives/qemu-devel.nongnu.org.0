Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6773E2110
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 03:35:39 +0200 (CEST)
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBolu-0002RB-Dq
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 21:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBokz-0001fh-Ga; Thu, 05 Aug 2021 21:34:41 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBokt-0005R4-97; Thu, 05 Aug 2021 21:34:41 -0400
Received: by mail-yb1-xb36.google.com with SMTP id z18so12296299ybg.8;
 Thu, 05 Aug 2021 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lKnF+w80qr/csC9y51YwAvtG2ETwf4fA9nJaqZRINGQ=;
 b=XZlinaW6hJROsbgPnQzGWyhBiftVBDh8uCIN3c7OdxJ/+Q3eOqt/vaCR+vSbuLprQI
 +05B2pDqCBtrfN2/IUVf38GbJme+jAONIegkb4MyHxxz4i57o3USvrCNjRyixS+ALgSt
 7cWSvDxN2euN30O2p57sDEKZxOCUp4msE2ZMnXOl7oKgrEGlIFQxvrfwNxeiEEFprh0/
 g2BpurYwQa2q2rPfJfWRDP1pEENmMd/jnjzEyZlqwZyfvD3oSqYgO/tYFVWDVuujEkYX
 Sbyjy4mkrNm9hTNIP5VufanWf6pyZSVQKX9ZR0bwFCfJ+QhfWnNV+adUcY0dhQkNPa6T
 yXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lKnF+w80qr/csC9y51YwAvtG2ETwf4fA9nJaqZRINGQ=;
 b=gfLlRr1eug5etWNkXprGAzTU4ntF1o4Okj4AgFYPoyfDgGvuxCZEhQn5MhOQ6xzmaJ
 nfJghruTiFkYVAwjvwmSmrRpQxuU904hjOkSb6KSICvVcrq98esd1snLiDRkgdRCeN1q
 xLehljef4U8/h6MEl4aY6nLVgHJ/48e2Jl0XpNqwEbkgraJePdJvUNTYWrR35dVLNC3b
 QuNprHybdEKG4++lpQkdy9lc2zyld5R5Yyx6lpzB0WSqwU/mxtGmFp1tZc4+gX6Ilfsh
 UAfb2qGv0Tn6VrOS21Z71bU1UcdA9MFvffANlMIjkV1P/IjokYXzwxyxuLLlCe6H7cMO
 i9Fw==
X-Gm-Message-State: AOAM532kWgU83gr4AHZdm2rhnv4sk+l67Nu3cguswh3OCJSTZZ+mPJCg
 uDI5dWT/h1xTS657+tUxOnhr2+oqYj6ZFNWwP4M=
X-Google-Smtp-Source: ABdhPJz06H3T949pMfn89sVzPNIOKBG2wVB5Gf6Qy8pcQUAUTNW1iaSZby5Ha8CLGqflV4UMUYVmMFCJtE+zxhlRO/A=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr10088550ybg.306.1628213673572; 
 Thu, 05 Aug 2021 18:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210724122407.2486558-1-anup.patel@wdc.com>
 <20210724122407.2486558-2-anup.patel@wdc.com>
In-Reply-To: <20210724122407.2486558-2-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 09:34:22 +0800
Message-ID: <CAEUhbmWcRoa+MSwoqSMDJELfMhe2Cq0xd_zGf-d=hXnwjzHb8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/intc: Rename sifive_clint sources to
 riscv_aclint sources
To: Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 24, 2021 at 8:24 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We will be upgrading SiFive CLINT implementation into RISC-V ACLINT
> implementation so let's first rename the sources.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/intc/Kconfig                                    |  2 +-
>  hw/intc/meson.build                                |  2 +-
>  hw/intc/{sifive_clint.c => riscv_aclint.c}         |  2 +-
>  hw/riscv/Kconfig                                   | 12 ++++++------
>  hw/riscv/microchip_pfsoc.c                         |  2 +-
>  hw/riscv/shakti_c.c                                |  2 +-
>  hw/riscv/sifive_e.c                                |  2 +-
>  hw/riscv/sifive_u.c                                |  2 +-
>  hw/riscv/spike.c                                   |  2 +-
>  hw/riscv/virt.c                                    |  2 +-
>  include/hw/intc/{sifive_clint.h => riscv_aclint.h} |  0
>  11 files changed, 15 insertions(+), 15 deletions(-)
>  rename hw/intc/{sifive_clint.c => riscv_aclint.c} (99%)
>  rename include/hw/intc/{sifive_clint.h => riscv_aclint.h} (100%)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

