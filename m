Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA541BDD9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 06:10:48 +0200 (CEST)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVQve-0005mg-Ii
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 00:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mVQst-00038I-AP
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 00:07:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:47102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mVQsq-0003Oe-Jl
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 00:07:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso672152wmd.5
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 21:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mlytg1wxM9AOQDWipzIDYX7MJccWzooPncjgXs+JlPc=;
 b=POVM5Q2v4CVqAWr4f0h1bYWdwtPJWQVvFlBm3kjWZcSg8N9nSfo+C5NkxlZMd7HRdh
 LuwBI0T5LWjzjpVALbp/gIqbuHT5y63ek6Trokr0ZGppO6qnmz6rxNnrT3kLGkDJmWz9
 5os+kmeCb0ob/FMEoWPYF0WsAqZguv0EuKFzuTvhadNXeQ4lzQlsmMp7rhZPhYNXlQj/
 F7rO4Q4BKNf3eT+s8DulacwfU42+qG/qJ2Rg9ePjydkBPRXpKH4zqMoi2kRsM9PZE4RD
 7KBhk3aQUmURaCKE8eqXRR4+kLIeH2zeqJfIqi3hlkPNk89GqG56ecP2CphkIg8Q7ruN
 RH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mlytg1wxM9AOQDWipzIDYX7MJccWzooPncjgXs+JlPc=;
 b=G25qPHeK70rKV31WCbkrL2Wtl1U+A+v1ZkGx3bJZsNlTEDWBVHPrLSXdOrEeFb5yEn
 VnI884Qez4pRgPe/VMTsdN4gZpFX4r6TS6sYe05tMq5+AWN2Wdt7E1OjFHAQaiNnhlkb
 SpoJutjIzuOJQJAols8IHONfj1NOyNyk0GPSuI+9V+5aI9ARl8u+OqTzfMGPJbntaNjn
 xXqst3QPGA7wtEumPGAgUgcT6P1lIXa3N/ln4MxqSNRdUL8mZIrdOgQgbACJojgx2gXO
 El3or/H7PtEtRfcCrIsGY8PlUE2pZv6V2KXUBx3RPJoxCyK4eBTXDSH78tMKxKkEdVRX
 Bqpw==
X-Gm-Message-State: AOAM530KFGS//FYmQaF9MVjsj79+ES7K7414TlVEVHAKY53j48TbHgZq
 D+cixTCkk+0yp6/roOAHDW2NiE+8pbrqY2YMHbvL4Q==
X-Google-Smtp-Source: ABdhPJxUvozByW4ArpZBKX5SLCkl0mUlxOq/QPNmiAMHQaGOkFOJIMSYG9XnGdZ8AT7pVYnBvCYJPePmKGQAQT9+gOc=
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr8148335wme.59.1632888469947; 
 Tue, 28 Sep 2021 21:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110603.338681-1-anup.patel@wdc.com>
In-Reply-To: <20210831110603.338681-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Sep 2021 09:37:38 +0530
Message-ID: <CAAhSdy1FdqtY6ubuK3SMqJk8Wb2Bbu26QhR6TMoDZqo=uZzVyg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] QEMU RISC-V ACLINT Support
To: Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32f;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 4:36 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
> over the SiFive CLINT but also maintains backward compatibility with
> the SiFive CLINT.
>
> Latest RISC-V ACLINT specification (will be frozen soon) can be found at:
> https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
>
> This series:
> 1) Replaces SiFive CLINT implementation with RISC-V ACLINT
> 2) Refactors RISC-V virt machine FDT generation
> 3) Adds optional full ACLINT support in QEMU RISC-V virt machine
>
> This series can be found in the riscv_aclint_v4 branch at:
> https://github.com/avpatel/qemu.git
>
> Changes since v3:
>  - Rebased on Alistair's CPU GPIO pins v3 series
>  - Replaced error_report() in PATCH2 with qemu_log_mask()
>
> Changes since v2:
>  - Addresed nit comments in PATCH2
>  - Update SSWI device emulation to match final ACLINT draft specification
>
> Changes since v1:
>  - Split PATCH1 into two patches where one patch renames CLINT sources
>    and another patch updates the implementation
>  - Addressed comments from Alistar and Bin
>
> Anup Patel (4):
>   hw/intc: Rename sifive_clint sources to riscv_aclint sources
>   hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
>   hw/riscv: virt: Re-factor FDT generation
>   hw/riscv: virt: Add optional ACLINT support to virt machine
>
>  docs/system/riscv/virt.rst     |  10 +
>  hw/intc/Kconfig                |   2 +-
>  hw/intc/meson.build            |   2 +-
>  hw/intc/riscv_aclint.c         | 460 +++++++++++++++++++++++
>  hw/intc/sifive_clint.c         | 315 ----------------
>  hw/riscv/Kconfig               |  12 +-
>  hw/riscv/microchip_pfsoc.c     |  11 +-
>  hw/riscv/shakti_c.c            |  13 +-
>  hw/riscv/sifive_e.c            |  13 +-
>  hw/riscv/sifive_u.c            |  11 +-
>  hw/riscv/spike.c               |  16 +-
>  hw/riscv/virt.c                | 652 ++++++++++++++++++++++-----------
>  include/hw/intc/riscv_aclint.h |  80 ++++
>  include/hw/intc/sifive_clint.h |  62 ----
>  include/hw/riscv/virt.h        |   2 +
>  15 files changed, 1047 insertions(+), 614 deletions(-)
>  create mode 100644 hw/intc/riscv_aclint.c
>  delete mode 100644 hw/intc/sifive_clint.c
>  create mode 100644 include/hw/intc/riscv_aclint.h
>  delete mode 100644 include/hw/intc/sifive_clint.h
>
> --
> 2.25.1
>

Ping ??

Regards,
Anup

