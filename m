Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B355484A90
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 23:16:17 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4s6K-0001Ts-F8
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 17:16:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4s2e-0006xE-Pc
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:12:28 -0500
Received: from [2607:f8b0:4864:20::12a] (port=33426
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4s2b-0000it-8q
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:12:28 -0500
Received: by mail-il1-x12a.google.com with SMTP id u8so29451293ilk.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 14:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXfHXK2t9iGIP+cIIwx+HHvuH+yAqklA09vn8v8fYzI=;
 b=i+F6VzFTuN98KBerhW2D8ok2IRpN9YHDc5t67vd3RF3SmDKHXL8Lz2Dk+bL9+hRKUm
 WTitDRDmNfi2oM+G23oRZPrTRgIi2Bflb/rjfE/4HqvLX00e8M6XyUGU70OthuUZ5jQQ
 1NklHVYDXXZ5r9mloP8ZGFjlebO4drmmu62jhV/FEp0ydQadKy9n0ikLmOC63ToF4vVW
 IV+L/euS9mtcynoI6kxm8L6BpB7hJrgEWYJnKRHMm53Goihr/D8J95vD/wfvBFkEImLG
 oSgZsmzNg9Q+nGvry150x0Yl/CGV7jPFM34HHQnhwTjsJPLtdGsza57DBtUYp7Zj/0JS
 Hp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXfHXK2t9iGIP+cIIwx+HHvuH+yAqklA09vn8v8fYzI=;
 b=b7R7qEhxCPsaeWA3DaN5wxYPDYcgO7vrUtALEyvELSESKg19J4yGKmFLcGqK0e6eNb
 YGbxYMfZMHBqqNS2QN/Z50kKrZDMt/hXH7l2synbZQCev4Pt8MHPDUZdiJy/XDzrghff
 9GE5GDTtUZFaz2OV9KGkrxhGL410WJcroEflYzesJ1BfMrPsgL3wfvIh87cZJo6F1vXe
 GOwbagMxi4cshOq0Yubae+8e7uN6v+qoinbjwsFrbWq7NU1x4qMWRROWKOhjZjIwgQxV
 bnDhltzryMe4tRCbijwue7iyyvcstqDOjl4I8wq4+r4vq2Pzegswf8lu0gzOfbViQkRT
 0J8g==
X-Gm-Message-State: AOAM5326mMqMcUJm0R/qtRTFvFFBg3N2Sa0PA32GkQ0kB35s07nLrL2C
 Db+hYdbgdQZ0LKLdHYAp2nUOUPvj/5oiDH9gKlk=
X-Google-Smtp-Source: ABdhPJw3WcDFUGxXrvaOBzfrK4GCtxUq6rn7hxKEHykR2m8nd+orsjWsidL0hR3poSeY/o7SB8xjPIj4itOBCdedk58=
X-Received: by 2002:a92:cac5:: with SMTP id m5mr23255173ilq.74.1641334344002; 
 Tue, 04 Jan 2022 14:12:24 -0800 (PST)
MIME-Version: 1.0
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
In-Reply-To: <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Jan 2022 08:11:57 +1000
Message-ID: <CAKmqyKNjPRt2kgyELPQF_c0eGwXajapYgcMYsLja7H3EuvVq+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
To: Konrad Schwarz <konrad.schwarz@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 5, 2022 at 1:56 AM Konrad Schwarz
<konrad.schwarz@siemens.com> wrote:
>
> GDB target descriptions support typed registers;
> such that `info register X' displays not only the hex value of
> register `X', but also the individual bitfields the register
> comprises (if any), using textual labels if possible.
>
> This patch includes type information for GDB for
> a large subset of the RISC-V Control and Status Registers (CSRs).
>
> Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
> ---
>  target/riscv/csr.c                |   2 +
>  target/riscv/csr32-op-gdbserver.h | 109 ++++++++++
>  target/riscv/csr64-op-gdbserver.h |  76 +++++++
>  target/riscv/gdb_csr_type_group.c |  16 ++
>  target/riscv/gdb_csr_type_group.h |   3 +
>  target/riscv/gdb_csr_types.c      | 333 ++++++++++++++++++++++++++++++
>  target/riscv/gdb_csr_types.h      |   3 +
>  target/riscv/gdbstub.c            |  26 ++-
>  target/riscv/meson.build          |   4 +-
>  9 files changed, 566 insertions(+), 6 deletions(-)
>  create mode 100644 target/riscv/csr32-op-gdbserver.h
>  create mode 100644 target/riscv/csr64-op-gdbserver.h
>  create mode 100644 target/riscv/gdb_csr_type_group.c
>  create mode 100644 target/riscv/gdb_csr_type_group.h
>  create mode 100644 target/riscv/gdb_csr_types.c
>  create mode 100644 target/riscv/gdb_csr_types.h
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9f41954894..557b4afe0e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3,6 +3,7 @@
>   *
>   * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
>   * Copyright (c) 2017-2018 SiFive, Inc.
> + * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com

Please don't add these to existing files. In this case you have just
added a newline to this file

>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -2094,5 +2095,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_zero },
>      [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_zero },
>      [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
> +
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/riscv/csr32-op-gdbserver.h b/target/riscv/csr32-op-gdbserver.h
> new file mode 100644
> index 0000000000..e8ec527f23
> --- /dev/null
> +++ b/target/riscv/csr32-op-gdbserver.h
> @@ -0,0 +1,109 @@
> +/* Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com */

All of these files should have the usual file boiler plate

> +
> +  [CSR_USTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "user" },
> +  [CSR_UIE] { .gdb_type = "sie-fields", .gdb_group = "user" },
> +  [CSR_UTVEC] { .gdb_type = "code_ptr", .gdb_group = "user" },
> +  [CSR_USCRATCH] { .gdb_type = "data_ptr", .gdb_group = "user" },
> +  [CSR_UEPC] { .gdb_type = "code_ptr", .gdb_group = "user" },
> +  [CSR_UCAUSE] { .gdb_type = "scause-fields", .gdb_group = "user" },
> +  [CSR_UTVAL] { .gdb_type = "data_ptr", .gdb_group = "user" },
> +  [CSR_UIP] { .gdb_type = "code_ptr", .gdb_group = "user" },
> +  [CSR_CYCLE] { .gdb_type = "uint32", .gdb_group = "user" },
> +  [CSR_TIME] { .gdb_type = "uint32", .gdb_group = "user" },
> +  [CSR_INSTRET] { .gdb_type = "uint32", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER3] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER4] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER5] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER6] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER7] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER8] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER9] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER10] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER11] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER12] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER13] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER14] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER15] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER16] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER17] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER18] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER19] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER20] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER21] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER22] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER23] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER24] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER25] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER26] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER27] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER28] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER29] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER30] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER31] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_CYCLEH] { .gdb_type = "uint32", .gdb_group = "user" },
> +  [CSR_TIMEH] { .gdb_type = "uint32", .gdb_group = "user" },
> +  [CSR_INSTRETH] { .gdb_type = "uint32", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER3H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER4H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER5H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER6H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER7H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER8H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER9H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER10H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER11H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER12H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER13H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER14H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER15H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER16H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER17H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER18H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER19H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER20H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER21H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER22H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER23H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER24H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER25H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER26H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER27H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER28H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER29H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER30H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER31H] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_SSTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "supervisor" },
> +  [CSR_SEDELEG] { .gdb_type = "uint32", .gdb_group = "supervisor" },
> +  [CSR_SIDELEG] { .gdb_type = "sie-fields", .gdb_group = "supervisor" },
> +  [CSR_SIE] { .gdb_type = "sie-fields", .gdb_group = "supervisor" },
> +  [CSR_STVEC] { .gdb_type = "stvec-fields", .gdb_group = "supervisor" },
> +  [CSR_SCOUNTEREN] { .gdb_type = "scounteren-fields", .gdb_group = "supervisor" },
> +  [CSR_SSCRATCH] { .gdb_type = "data_ptr", .gdb_group = "supervisor" },
> +  [CSR_SEPC] { .gdb_type = "code_ptr", .gdb_group = "supervisor" },
> +  [CSR_SCAUSE] { .gdb_type = "scause-fields", .gdb_group = "supervisor" },
> +  [CSR_STVAL] { .gdb_type = "data_ptr", .gdb_group = "supervisor" },
> +  [CSR_SIP] { .gdb_type = "sip-fields", .gdb_group = "supervisor" },
> +  [CSR_SATP] { .gdb_type = "satp-fields", .gdb_group = "supervisor" },
> +  [CSR_HSTATUS] { .gdb_type = "hstatus-fields", .gdb_group = "hypervisor" },
> +  [CSR_HEDELEG] { .gdb_type = "hedeleg-fields", .gdb_group = "hypervisor" },
> +  [CSR_HIDELEG] { .gdb_type = "hie-fields", .gdb_group = "hypervisor" },
> +  [CSR_HIE] { .gdb_type = "hie-fields", .gdb_group = "hypervisor" },
> +  [CSR_HCOUNTEREN] { .gdb_type = "int", .gdb_group = "hypervisor" },
> +  [CSR_HGEIE] { .gdb_type = "uint32", .gdb_group = "hypervisor" },
> +  [CSR_HGEIP] { .gdb_type = "uint32", .gdb_group = "hypervisor" },
> +  [CSR_HTVAL] { .gdb_type = "data_ptr", .gdb_group = "hypervisor" },
> +  [CSR_HIP] { .gdb_type = "hip-fields", .gdb_group = "hypervisor" },
> +  [CSR_HVIP] { .gdb_type = "hvip-fields", .gdb_group = "hypervisor" },
> +  [CSR_HGATP] { .gdb_type = "hgatp-fields", .gdb_group = "hypervisor" },
> +  [CSR_HTIMEDELTA] { .gdb_type = "int", .gdb_group = "hypervisor" },
> +  [CSR_HTIMEDELTAH] { .gdb_type = "int", .gdb_group = "hypervisor" },
> +  [CSR_HTINST] { .gdb_type = "uint32", .gdb_group = "hypervisor" },
> +  [CSR_VSSTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSIE] { .gdb_type = "sie-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSTVEC] { .gdb_type = "stvec-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSSCRATCH] { .gdb_type = "data_ptr", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSEPC] { .gdb_type = "code_ptr", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSCAUSE] { .gdb_type = "scause-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSTVAL] { .gdb_type = "data_ptr", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSIP] { .gdb_type = "sip-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSATP] { .gdb_type = "satp-fields", .gdb_group = "virtual-supervisor" },
> diff --git a/target/riscv/csr64-op-gdbserver.h b/target/riscv/csr64-op-gdbserver.h
> new file mode 100644
> index 0000000000..fc4bc62d9e
> --- /dev/null
> +++ b/target/riscv/csr64-op-gdbserver.h
> @@ -0,0 +1,76 @@
> +/* Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com */
> +
> +  [CSR_USTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "user" },
> +  [CSR_UIE] { .gdb_type = "sie-fields", .gdb_group = "user" },
> +  [CSR_UTVEC] { .gdb_type = "code_ptr", .gdb_group = "user" },
> +  [CSR_USCRATCH] { .gdb_type = "data_ptr", .gdb_group = "user" },
> +  [CSR_UEPC] { .gdb_type = "code_ptr", .gdb_group = "user" },
> +  [CSR_UCAUSE] { .gdb_type = "scause-fields", .gdb_group = "user" },
> +  [CSR_UTVAL] { .gdb_type = "data_ptr", .gdb_group = "user" },
> +  [CSR_UIP] { .gdb_type = "code_ptr", .gdb_group = "user" },
> +  [CSR_CYCLE] { .gdb_type = "uint64", .gdb_group = "user" },
> +  [CSR_TIME] { .gdb_type = "uint64", .gdb_group = "user" },
> +  [CSR_INSTRET] { .gdb_type = "uint64", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER3] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER4] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER5] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER6] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER7] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER8] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER9] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER10] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER11] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER12] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER13] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER14] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER15] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER16] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER17] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER18] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER19] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER20] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER21] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER22] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER23] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER24] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER25] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER26] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER27] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER28] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER29] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER30] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_HPMCOUNTER31] { .gdb_type = "int", .gdb_group = "user" },
> +  [CSR_SSTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "supervisor" },
> +  [CSR_SEDELEG] { .gdb_type = "uint64", .gdb_group = "supervisor" },
> +  [CSR_SIDELEG] { .gdb_type = "sie-fields", .gdb_group = "supervisor" },
> +  [CSR_SIE] { .gdb_type = "sie-fields", .gdb_group = "supervisor" },
> +  [CSR_STVEC] { .gdb_type = "stvec-fields", .gdb_group = "supervisor" },
> +  [CSR_SCOUNTEREN] { .gdb_type = "scounteren-fields", .gdb_group = "supervisor" },
> +  [CSR_SSCRATCH] { .gdb_type = "data_ptr", .gdb_group = "supervisor" },
> +  [CSR_SEPC] { .gdb_type = "code_ptr", .gdb_group = "supervisor" },
> +  [CSR_SCAUSE] { .gdb_type = "scause-fields", .gdb_group = "supervisor" },
> +  [CSR_STVAL] { .gdb_type = "data_ptr", .gdb_group = "supervisor" },
> +  [CSR_SIP] { .gdb_type = "sip-fields", .gdb_group = "supervisor" },
> +  [CSR_SATP] { .gdb_type = "satp-fields", .gdb_group = "supervisor" },
> +  [CSR_HSTATUS] { .gdb_type = "hstatus-fields", .gdb_group = "hypervisor" },
> +  [CSR_HEDELEG] { .gdb_type = "hedeleg-fields", .gdb_group = "hypervisor" },
> +  [CSR_HIDELEG] { .gdb_type = "hie-fields", .gdb_group = "hypervisor" },
> +  [CSR_HIE] { .gdb_type = "hie-fields", .gdb_group = "hypervisor" },
> +  [CSR_HCOUNTEREN] { .gdb_type = "int", .gdb_group = "hypervisor" },
> +  [CSR_HGEIE] { .gdb_type = "uint64", .gdb_group = "hypervisor" },
> +  [CSR_HGEIP] { .gdb_type = "uint64", .gdb_group = "hypervisor" },
> +  [CSR_HTVAL] { .gdb_type = "data_ptr", .gdb_group = "hypervisor" },
> +  [CSR_HIP] { .gdb_type = "hip-fields", .gdb_group = "hypervisor" },
> +  [CSR_HVIP] { .gdb_type = "hvip-fields", .gdb_group = "hypervisor" },
> +  [CSR_HGATP] { .gdb_type = "hgatp-fields", .gdb_group = "hypervisor" },
> +  [CSR_HTIMEDELTA] { .gdb_type = "int", .gdb_group = "hypervisor" },
> +  [CSR_HTINST] { .gdb_type = "uint64", .gdb_group = "hypervisor" },
> +  [CSR_VSSTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSIE] { .gdb_type = "sie-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSTVEC] { .gdb_type = "stvec-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSSCRATCH] { .gdb_type = "data_ptr", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSEPC] { .gdb_type = "code_ptr", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSCAUSE] { .gdb_type = "scause-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSTVAL] { .gdb_type = "data_ptr", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSIP] { .gdb_type = "sip-fields", .gdb_group = "virtual-supervisor" },
> +  [CSR_VSATP] { .gdb_type = "satp-fields", .gdb_group = "virtual-supervisor" },
> diff --git a/target/riscv/gdb_csr_type_group.c b/target/riscv/gdb_csr_type_group.c
> new file mode 100644
> index 0000000000..af394de302
> --- /dev/null
> +++ b/target/riscv/gdb_csr_type_group.c
> @@ -0,0 +1,16 @@
> +/* Copyright 2021 Siemens AG */
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "gdb_csr_type_group.h"
> +
> +struct riscv_gdb_csr_tg const riscv_gdb_csr_type_group[] = {
> +
> +#if !defined(CONFIG_USER_ONLY)
> +#  ifdef TARGET_RISCV64
> +#    include "csr64-op-gdbserver.h"
> +#  elif defined TARGET_RISCV64
> +#    include "csr32-op-gdbserver.h"

This doesn't look right. `if defined TARGET_RISCV64` -> `include
"csr32-op-gdbserver.h"`?

Also this should be dynamic instead of based on the build time CPU, as
the user could use a 32-bit CPU on a 64-bit target build.

> +#  endif
> +#endif /* !CONFIG_USER_ONLY */
> +
> +};
> diff --git a/target/riscv/gdb_csr_type_group.h b/target/riscv/gdb_csr_type_group.h
> new file mode 100644
> index 0000000000..e044913bd7
> --- /dev/null
> +++ b/target/riscv/gdb_csr_type_group.h
> @@ -0,0 +1,3 @@
> +extern struct riscv_gdb_csr_tg {
> +    char const *gdb_type, *gdb_group;
> +} const riscv_gdb_csr_type_group[CSR_TABLE_SIZE];

I feel like all of the header files could be combined into one single
file and instead of using macros just pick the struct.

Alistair

> diff --git a/target/riscv/gdb_csr_types.c b/target/riscv/gdb_csr_types.c
> new file mode 100644
> index 0000000000..48b1db2b88
> --- /dev/null
> +++ b/target/riscv/gdb_csr_types.c
> @@ -0,0 +1,333 @@
> +/* Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com */
> +
> +#include "qemu/osdep.h"
> +#include "gdb_csr_types.h"
> +#define STR(X) #X
> +
> +char const riscv_gdb_csr_types[] =
> +#ifdef TARGET_RISCV32
> +   STR(
> +<enum id="sstatus-fs-type" size="4">
> +  <evalue name="off" value="0"/>
> +  <evalue name="initial" value="1"/>
> +  <evalue name="clean" value="2"/>
> +  <evalue name="dirty" value="3"/>
> +</enum><enum id="sstatus-xs-type" size="4">
> +  <evalue name="off" value="0"/>
> +  <evalue name="initial" value="1"/>
> +  <evalue name="clean" value="2"/>
> +  <evalue name="dirty" value="3"/>
> +</enum><enum id="sstatus-uxl-type" size="4">
> +  <evalue name="32" value="1"/>
> +  <evalue name="64" value="2"/>
> +  <evalue name="128" value="3"/>
> +</enum><enum id="stvec-mode-type" size="4">
> +  <evalue name="direct" value="0"/>
> +  <evalue name="vectored" value="1"/>
> +</enum><enum id="scause-exc-type" size="4">
> +  <evalue name="instruction_address_misaligned" value="0"/>
> +  <evalue name="instruction_access_fault" value="1"/>
> +  <evalue name="illegal_instruction" value="2"/>
> +  <evalue name="breakpoint" value="3"/>
> +  <evalue name="load_address_misaligned" value="4"/>
> +  <evalue name="load_access_fault" value="5"/>
> +  <evalue name="store_address_misaligned" value="6"/>
> +  <evalue name="store_access_fault" value="7"/>
> +  <evalue name="enironment_call_from_U_mode" value="8"/>
> +  <evalue name="enironment_call_from_S_mode" value="9"/>
> +  <evalue name="enironment_call_from_VS_mode" value="10"/>
> +  <evalue name="enironment_call_from_M_mode" value="11"/>
> +  <evalue name="instruction_page_fault" value="12"/>
> +  <evalue name="load_page_fault" value="13"/>
> +  <evalue name="store_page_fault" value="15"/>
> +  <evalue name="instruction_guest_page_fault" value="20"/>
> +  <evalue name="load_guest_page_fault" value="21"/>
> +  <evalue name="virtual_instruction" value="22"/>
> +  <evalue name="store_guest_page_fault" value="23"/>
> +</enum><enum id="satp-mode-type" size="4">
> +  <evalue name="bare" value="0"/>
> +  <evalue name="sv32" value="1"/>
> +  <evalue name="sv39" value="8"/>
> +  <evalue name="sv48" value="9"/>
> +  <evalue name="sv57" value="10"/>
> +  <evalue name="sv64" value="11"/>
> +</enum><enum id="hgatp-mode-type" size="4">
> +  <evalue name="bare" value="0"/>
> +  <evalue name="sv32x4" value="1"/>
> +  <evalue name="sv39x4" value="8"/>
> +  <evalue name="sv48x4" value="9"/>
> +  <evalue name="sv57x4" value="10"/>
> +</enum><flags id="sstatus-fields" size="4">
> +  <field name="sie" start="1" end="1"/>
> +  <field name="mie" start="3" end="3"/>
> +  <field name="spie" start="5" end="5"/>
> +  <field name="ube" start="6" end="6"/>
> +  <field name="mpie" start="7" end="7"/>
> +  <field name="spp" start="8" end="8"/>
> +  <field name="mpp" start="11" end="12"/>
> +  <field name="fs" start="13" end="14" type="sstatus-fs-type"/>
> +  <field name="xs" start="15" end="16" type="sstatus-xs-type"/>
> +  <field name="mprv" start="17" end="17"/>
> +  <field name="sum" start="18" end="18"/>
> +  <field name="mxr" start="19" end="19"/>
> +  <field name="tvm" start="20" end="20"/>
> +  <field name="tw" start="21" end="21"/>
> +  <field name="tsr" start="22" end="23"/>
> +  <field name="uxl" start="32" end="33" type="sstatus-uxl-type"/>
> +  <field name="sxl" start="34" end="35"/>
> +  <field name="sbe" start="36" end="36"/>
> +  <field name="mbe" start="37" end="37"/>
> +  <field name="gva" start="38" end="38"/>
> +  <field name="mpv" start="39" end="39"/>
> +  <field name="sd" start="63" end="63"/>
> +</flags><flags id="sie-fields" size="4">
> +  <field name="ssie" start="1" end="1"/>
> +  <field name="vssie" start="2" end="2"/>
> +  <field name="msie" start="3" end="3"/>
> +  <field name="stie" start="5" end="5"/>
> +  <field name="vstie" start="6" end="6"/>
> +  <field name="mtie" start="7" end="7"/>
> +  <field name="seie" start="9" end="9"/>
> +  <field name="vseie" start="10" end="10"/>
> +  <field name="meie" start="11" end="11"/>
> +  <field name="sgeie" start="12" end="12"/>
> +</flags><flags id="stvec-fields" size="4">
> +  <field name="mode" start="0" end="1" type="stvec-mode-type"/>
> +  <field name="base" start="2" end="63"/>
> +</flags><flags id="scounteren-fields" size="4">
> +  <field name="cy" start="0" end="0"/>
> +  <field name="tm" start="1" end="1"/>
> +  <field name="ir" start="2" end="2"/>
> +  <field name="hpm" start="3" end="31"/>
> +</flags><flags id="scause-fields" size="4">
> +  <field name="exc" start="0" end="30" type="scause-exc-type"/>
> +  <field name="interrupt" start="31" end="31"/>
> +</flags><flags id="sip-fields" size="4">
> +  <field name="ssip" start="1" end="1"/>
> +  <field name="vssip" start="2" end="2"/>
> +  <field name="msip" start="3" end="3"/>
> +  <field name="stip" start="5" end="5"/>
> +  <field name="vstip" start="6" end="6"/>
> +  <field name="mtip" start="7" end="7"/>
> +  <field name="seip" start="9" end="9"/>
> +  <field name="vseip" start="10" end="10"/>
> +  <field name="meip" start="11" end="11"/>
> +  <field name="sgeip" start="12" end="12"/>
> +</flags><flags id="satp-fields" size="4">
> +  <field name="ppn" start="0" end="43"/>
> +  <field name="asid" start="44" end="59"/>
> +  <field name="mode" start="60" end="63" type="satp-mode-type"/>
> +</flags><flags id="hstatus-fields" size="4">
> +  <field name="vsbe" start="5" end="5"/>
> +  <field name="gva" start="6" end="6"/>
> +  <field name="spv" start="7" end="7"/>
> +  <field name="spvp" start="8" end="8"/>
> +  <field name="hu" start="9" end="9"/>
> +  <field name="vgein" start="12" end="17"/>
> +  <field name="vtvm" start="20" end="20"/>
> +  <field name="vtsr" start="22" end="22"/>
> +  <field name="vsxl" start="32" end="33"/>
> +</flags><flags id="hedeleg-fields" size="4">
> +  <field name="instruction_address_misaligned" start="0" end="0"/>
> +  <field name="instruction_access_fault" start="1" end="1"/>
> +  <field name="illegal_instruction" start="2" end="2"/>
> +  <field name="breakpoint" start="3" end="3"/>
> +  <field name="load_address_misaligned" start="4" end="4"/>
> +  <field name="load_access_fault" start="5" end="5"/>
> +  <field name="store_address_misaligned" start="6" end="6"/>
> +  <field name="store_access_fault" start="7" end="7"/>
> +  <field name="enironment_call_from_U_mode" start="8" end="8"/>
> +  <field name="enironment_call_from_S_mode" start="9" end="9"/>
> +  <field name="enironment_call_from_VS_mode" start="10" end="10"/>
> +  <field name="enironment_call_from_M_mode" start="11" end="11"/>
> +  <field name="instruction_page_fault" start="12" end="12"/>
> +  <field name="load_page_fault" start="13" end="13"/>
> +  <field name="store_page_fault" start="15" end="15"/>
> +  <field name="instruction_guest_page_fault" start="20" end="20"/>
> +  <field name="load_guest_page_fault" start="21" end="21"/>
> +  <field name="virtual_instruction" start="22" end="22"/>
> +  <field name="store_guest_page_fault" start="23" end="23"/>
> +</flags><flags id="hie-fields" size="4">
> +  <field name="vssie" start="2" end="2"/>
> +  <field name="vstie" start="6" end="6"/>
> +  <field name="vseie" start="10" end="10"/>
> +  <field name="sgeie" start="12" end="12"/>
> +</flags><flags id="hip-fields" size="4">
> +  <field name="vssip" start="2" end="2"/>
> +  <field name="vstip" start="6" end="6"/>
> +  <field name="vseip" start="10" end="10"/>
> +  <field name="sgeip" start="12" end="12"/>
> +</flags><flags id="hvip-fields" size="4">
> +  <field name="vssip" start="2" end="2"/>
> +  <field name="vstip" start="6" end="6"/>
> +  <field name="vseip" start="10" end="10"/>
> +</flags><flags id="hgatp-fields" size="4">
> +  <field name="ppn" start="0" end="43"/>
> +  <field name="vmid" start="44" end="57"/>
> +  <field name="mode" start="60" end="63" type="hgatp-mode-type"/>
> +</flags>
> +)
> +#elif defined TARGET_RISCV64
> +   STR(
> +<enum id="sstatus-fs-type" size="8">
> +  <evalue name="off" value="0"/>
> +  <evalue name="initial" value="1"/>
> +  <evalue name="clean" value="2"/>
> +  <evalue name="dirty" value="3"/>
> +</enum><enum id="sstatus-xs-type" size="8">
> +  <evalue name="off" value="0"/>
> +  <evalue name="initial" value="1"/>
> +  <evalue name="clean" value="2"/>
> +  <evalue name="dirty" value="3"/>
> +</enum><enum id="sstatus-uxl-type" size="8">
> +  <evalue name="32" value="1"/>
> +  <evalue name="64" value="2"/>
> +  <evalue name="128" value="3"/>
> +</enum><enum id="stvec-mode-type" size="8">
> +  <evalue name="direct" value="0"/>
> +  <evalue name="vectored" value="1"/>
> +</enum><enum id="scause-exc-type" size="8">
> +  <evalue name="instruction_address_misaligned" value="0"/>
> +  <evalue name="instruction_access_fault" value="1"/>
> +  <evalue name="illegal_instruction" value="2"/>
> +  <evalue name="breakpoint" value="3"/>
> +  <evalue name="load_address_misaligned" value="4"/>
> +  <evalue name="load_access_fault" value="5"/>
> +  <evalue name="store_address_misaligned" value="6"/>
> +  <evalue name="store_access_fault" value="7"/>
> +  <evalue name="enironment_call_from_U_mode" value="8"/>
> +  <evalue name="enironment_call_from_S_mode" value="9"/>
> +  <evalue name="enironment_call_from_VS_mode" value="10"/>
> +  <evalue name="enironment_call_from_M_mode" value="11"/>
> +  <evalue name="instruction_page_fault" value="12"/>
> +  <evalue name="load_page_fault" value="13"/>
> +  <evalue name="store_page_fault" value="15"/>
> +  <evalue name="instruction_guest_page_fault" value="20"/>
> +  <evalue name="load_guest_page_fault" value="21"/>
> +  <evalue name="virtual_instruction" value="22"/>
> +  <evalue name="store_guest_page_fault" value="23"/>
> +</enum><enum id="satp-mode-type" size="8">
> +  <evalue name="bare" value="0"/>
> +  <evalue name="sv32" value="1"/>
> +  <evalue name="sv39" value="8"/>
> +  <evalue name="sv48" value="9"/>
> +  <evalue name="sv57" value="10"/>
> +  <evalue name="sv64" value="11"/>
> +</enum><enum id="hgatp-mode-type" size="8">
> +  <evalue name="bare" value="0"/>
> +  <evalue name="sv32x4" value="1"/>
> +  <evalue name="sv39x4" value="8"/>
> +  <evalue name="sv48x4" value="9"/>
> +  <evalue name="sv57x4" value="10"/>
> +</enum><flags id="sstatus-fields" size="8">
> +  <field name="sie" start="1" end="1"/>
> +  <field name="mie" start="3" end="3"/>
> +  <field name="spie" start="5" end="5"/>
> +  <field name="ube" start="6" end="6"/>
> +  <field name="mpie" start="7" end="7"/>
> +  <field name="spp" start="8" end="8"/>
> +  <field name="mpp" start="11" end="12"/>
> +  <field name="fs" start="13" end="14" type="sstatus-fs-type"/>
> +  <field name="xs" start="15" end="16" type="sstatus-xs-type"/>
> +  <field name="mprv" start="17" end="17"/>
> +  <field name="sum" start="18" end="18"/>
> +  <field name="mxr" start="19" end="19"/>
> +  <field name="tvm" start="20" end="20"/>
> +  <field name="tw" start="21" end="21"/>
> +  <field name="tsr" start="22" end="23"/>
> +  <field name="uxl" start="32" end="33" type="sstatus-uxl-type"/>
> +  <field name="sxl" start="34" end="35"/>
> +  <field name="sbe" start="36" end="36"/>
> +  <field name="mbe" start="37" end="37"/>
> +  <field name="gva" start="38" end="38"/>
> +  <field name="mpv" start="39" end="39"/>
> +  <field name="sd" start="63" end="63"/>
> +</flags><flags id="sie-fields" size="8">
> +  <field name="ssie" start="1" end="1"/>
> +  <field name="vssie" start="2" end="2"/>
> +  <field name="msie" start="3" end="3"/>
> +  <field name="stie" start="5" end="5"/>
> +  <field name="vstie" start="6" end="6"/>
> +  <field name="mtie" start="7" end="7"/>
> +  <field name="seie" start="9" end="9"/>
> +  <field name="vseie" start="10" end="10"/>
> +  <field name="meie" start="11" end="11"/>
> +  <field name="sgeie" start="12" end="12"/>
> +</flags><flags id="stvec-fields" size="8">
> +  <field name="mode" start="0" end="1" type="stvec-mode-type"/>
> +  <field name="base" start="2" end="63"/>
> +</flags><flags id="scounteren-fields" size="8">
> +  <field name="cy" start="0" end="0"/>
> +  <field name="tm" start="1" end="1"/>
> +  <field name="ir" start="2" end="2"/>
> +  <field name="hpm" start="3" end="31"/>
> +</flags><flags id="scause-fields" size="8">
> +  <field name="exc" start="0" end="62" type="scause-exc-type"/>
> +  <field name="interrupt" start="63" end="63"/>
> +</flags><flags id="sip-fields" size="8">
> +  <field name="ssip" start="1" end="1"/>
> +  <field name="vssip" start="2" end="2"/>
> +  <field name="msip" start="3" end="3"/>
> +  <field name="stip" start="5" end="5"/>
> +  <field name="vstip" start="6" end="6"/>
> +  <field name="mtip" start="7" end="7"/>
> +  <field name="seip" start="9" end="9"/>
> +  <field name="vseip" start="10" end="10"/>
> +  <field name="meip" start="11" end="11"/>
> +  <field name="sgeip" start="12" end="12"/>
> +</flags><flags id="satp-fields" size="8">
> +  <field name="ppn" start="0" end="43"/>
> +  <field name="asid" start="44" end="59"/>
> +  <field name="mode" start="60" end="63" type="satp-mode-type"/>
> +</flags><flags id="hstatus-fields" size="8">
> +  <field name="vsbe" start="5" end="5"/>
> +  <field name="gva" start="6" end="6"/>
> +  <field name="spv" start="7" end="7"/>
> +  <field name="spvp" start="8" end="8"/>
> +  <field name="hu" start="9" end="9"/>
> +  <field name="vgein" start="12" end="17"/>
> +  <field name="vtvm" start="20" end="20"/>
> +  <field name="vtsr" start="22" end="22"/>
> +  <field name="vsxl" start="32" end="33"/>
> +</flags><flags id="hedeleg-fields" size="8">
> +  <field name="instruction_address_misaligned" start="0" end="0"/>
> +  <field name="instruction_access_fault" start="1" end="1"/>
> +  <field name="illegal_instruction" start="2" end="2"/>
> +  <field name="breakpoint" start="3" end="3"/>
> +  <field name="load_address_misaligned" start="4" end="4"/>
> +  <field name="load_access_fault" start="5" end="5"/>
> +  <field name="store_address_misaligned" start="6" end="6"/>
> +  <field name="store_access_fault" start="7" end="7"/>
> +  <field name="enironment_call_from_U_mode" start="8" end="8"/>
> +  <field name="enironment_call_from_S_mode" start="9" end="9"/>
> +  <field name="enironment_call_from_VS_mode" start="10" end="10"/>
> +  <field name="enironment_call_from_M_mode" start="11" end="11"/>
> +  <field name="instruction_page_fault" start="12" end="12"/>
> +  <field name="load_page_fault" start="13" end="13"/>
> +  <field name="store_page_fault" start="15" end="15"/>
> +  <field name="instruction_guest_page_fault" start="20" end="20"/>
> +  <field name="load_guest_page_fault" start="21" end="21"/>
> +  <field name="virtual_instruction" start="22" end="22"/>
> +  <field name="store_guest_page_fault" start="23" end="23"/>
> +</flags><flags id="hie-fields" size="8">
> +  <field name="vssie" start="2" end="2"/>
> +  <field name="vstie" start="6" end="6"/>
> +  <field name="vseie" start="10" end="10"/>
> +  <field name="sgeie" start="12" end="12"/>
> +</flags><flags id="hip-fields" size="8">
> +  <field name="vssip" start="2" end="2"/>
> +  <field name="vstip" start="6" end="6"/>
> +  <field name="vseip" start="10" end="10"/>
> +  <field name="sgeip" start="12" end="12"/>
> +</flags><flags id="hvip-fields" size="8">
> +  <field name="vssip" start="2" end="2"/>
> +  <field name="vstip" start="6" end="6"/>
> +  <field name="vseip" start="10" end="10"/>
> +</flags><flags id="hgatp-fields" size="8">
> +  <field name="ppn" start="0" end="43"/>
> +  <field name="vmid" start="44" end="57"/>
> +  <field name="mode" start="60" end="63" type="hgatp-mode-type"/>
> +</flags>
> +)
> +# endif
> +;
> diff --git a/target/riscv/gdb_csr_types.h b/target/riscv/gdb_csr_types.h
> new file mode 100644
> index 0000000000..e55c978ac8
> --- /dev/null
> +++ b/target/riscv/gdb_csr_types.h
> @@ -0,0 +1,3 @@
> +/* Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com */
> +
> +extern char const riscv_gdb_csr_types[];
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 23429179e2..9c3f68eeaf 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -2,6 +2,7 @@
>   * RISC-V GDB Server Stub
>   *
>   * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> + * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -155,6 +156,9 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
>      return 0;
>  }
>
> +#include "gdb_csr_types.h"
> +#include "gdb_csr_type_group.h"
> +
>  static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
> @@ -163,21 +167,33 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>      riscv_csr_predicate_fn predicate;
>      int bitsize = 16 << env->misa_mxl_max;
>      int i;
> +    riscv_csr_operations *csr_op;
> +    struct riscv_gdb_csr_tg const *csr_tg;
>
>      g_string_printf(s, "<?xml version=\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
>      g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
>
> -    for (i = 0; i < CSR_TABLE_SIZE; i++) {
> -        predicate = csr_ops[i].predicate;
> +    g_string_append(s, riscv_gdb_csr_types);
> +
> +    for (i = 0, csr_op = csr_ops, csr_tg = riscv_gdb_csr_type_group;
> +            i < CSR_TABLE_SIZE; ++csr_op, ++csr_tg, ++i) {
> +        predicate = csr_op->predicate;
>          if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
> -            if (csr_ops[i].name) {
> -                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
> +            if (csr_op->name) {
> +                g_string_append_printf(s, "<reg name=\"%s\"", csr_op->name);
>              } else {
>                  g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
>              }
>              g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
> -            g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
> +            g_string_append_printf(s, " regnum=\"%d\"", base_reg + i);
> +            if (csr_tg->gdb_type) {
> +                g_string_append_printf(s, " type=\"%s\"", csr_tg->gdb_type);
> +            }
> +            if (csr_tg->gdb_group) {
> +                g_string_append_printf(s, " group=\"%s\"", csr_tg->gdb_group);
> +            }
> +            g_string_append(s, " />\n");
>          }
>      }
>
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index d5e0bc93ea..e1945e54c4 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -25,7 +25,9 @@ riscv_softmmu_ss.add(files(
>    'arch_dump.c',
>    'pmp.c',
>    'monitor.c',
> -  'machine.c'
> +  'machine.c',
> +  'gdb_csr_types.c',
> +  'gdb_csr_type_group.c'
>  ))
>
>  target_arch += {'riscv': riscv_ss}
> --
> Konrad Schwarz
>
>

