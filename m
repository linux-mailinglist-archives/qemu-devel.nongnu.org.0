Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F02DA4B6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:27:50 +0100 (CET)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koyBx-0005JH-Cf
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1koyAN-0004To-HX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:26:11 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1koyAI-0004LN-Rd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:26:11 -0500
Received: by mail-pf1-x441.google.com with SMTP id w6so13389592pfu.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HYUhfX1zytIqrkUcOpkaMcJQQLgNGL6yx6VjqU6UAoA=;
 b=YdPjys8NB+Xy5LfKDIJ6nf9rkIw4e2043qlyFFNPh9rnpccCgtTxDW6RbbnKUbU9D+
 vjCHJGFXTB7J7WiQhdqFAgfQmXShSv+el8NG+zcvT16uND0JIbw7PPBPqCy1Wn7UQynj
 fOpGf/LFXXulu1gFRhwXm4oFMKvttnM6juaLC2yj6evFmpp8xF+Ady4NQYM5iLBoiOte
 ztfegKA7dIVwK92zQlvD9ZbCHfXXHvNAJXmYuDWnFS/+z/dRdVLEXviiP0Nl4DuvZg3/
 3ZzjibjY8r2iY2jh8VTcOvpmekKZC1bFgSF5JkmLUM4044jRPWuwSjPGpKcLtBOXLm0m
 /RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HYUhfX1zytIqrkUcOpkaMcJQQLgNGL6yx6VjqU6UAoA=;
 b=EEpBnhvD79kXPgUa4ExVgHC3lJskhzT25C9Ab92+ZP1lL9E7TI1RlPl699uBj9aFWX
 GWUmNQjSKejTqakhvsIwZ49DI5wsnDR0qaLZDVogaChUjXVHgMYIjG4qOGN5UGObxaTW
 VgWKkesDhZulJnA1grgngGU2Hnxy1lOJ3/pxeYcsJHvi5t0ma+Q+S95AbjGrbtKdw2LA
 AtQWe7Ub4jq0KU75CsH0aR2WKN8K9rIHwidHtF0iirSJyTtgv/09Lg8rOfbMDqWxfQ6j
 eBT7A3n3CU3S00a01zCSa+bArnLN4V9roTPmIgiGRWbXemzdrLi8dmPHkBxM6dmUV9zO
 A2+w==
X-Gm-Message-State: AOAM53019ygH79MXC0cwp9wrWxvQlxQSygJnHyUawkIs4h2hVMuwP7bI
 oA+5YB5M1LvwdveSHj018ts+0PyiAs2gyCUy
X-Google-Smtp-Source: ABdhPJzS9wcJzL9357awFtpiGNgMSirLqpXirlGlB4M7E1sbXyaZAF10dhmWWKmIBBsCVIqUM/v6ew==
X-Received: by 2002:a63:f154:: with SMTP id o20mr26315148pgk.127.1607991964361; 
 Mon, 14 Dec 2020 16:26:04 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y22sm21101347pgi.35.2020.12.14.16.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 16:26:03 -0800 (PST)
Date: Mon, 14 Dec 2020 16:26:03 -0800 (PST)
X-Google-Original-Date: Mon, 14 Dec 2020 16:26:01 PST (-0800)
Subject: Re: [PATCH v2 00/15]  RISC-V: Start to remove xlen preprocess
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-711fa828-e3ae-408f-a908-76b1aacb67a5@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x441.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 08 Dec 2020 14:56:08 PST (-0800), Alistair Francis wrote:
> The RISC-V QEMU port currently has lot of preprocessor directives that
> check if we are targetting a 32-bit or 64-bit CPU. This means that the
> 64-bit RISC-V target can not run 32-bit CPUs. This is different to most
> other QEMU architectures and doesn't allow us to mix xlens (such as when
> running Hypervisors with different xlen guests).
> This series is a step toward removing some of those to allow us to use
> 32-bit CPUs on 64-bit RISC-V targets.
> v2:
>  - Rebase on the latest RISC-V tree
>
> Alistair Francis (15):
>   hw/riscv: Expand the is 32-bit check to support more CPUs
>   target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
>   riscv: spike: Remove target macro conditionals
>   riscv: virt: Remove target macro conditionals
>   hw/riscv: boot: Remove compile time XLEN checks
>   hw/riscv: virt: Remove compile time XLEN checks
>   hw/riscv: spike: Remove compile time XLEN checks
>   hw/riscv: sifive_u: Remove compile time XLEN checks
>   target/riscv: fpu_helper: Match function defs in HELPER macros
>   target/riscv: Add a riscv_cpu_is_32bit() helper function
>   target/riscv: Specify the XLEN for CPUs
>   target/riscv: cpu: Remove compile time XLEN checks
>   target/riscv: cpu_helper: Remove compile time XLEN checks
>   target/riscv: csr: Remove compile time XLEN checks
>   target/riscv: cpu: Set XLEN independently from target
>
>  include/hw/riscv/boot.h   |   8 +-
>  include/hw/riscv/spike.h  |   6 --
>  include/hw/riscv/virt.h   |   6 --
>  target/riscv/cpu.h        |   8 ++
>  target/riscv/cpu_bits.h   |   4 +-
>  hw/riscv/boot.c           |  69 +++++++++------
>  hw/riscv/sifive_u.c       |  57 ++++++------
>  hw/riscv/spike.c          |  50 ++++++-----
>  hw/riscv/virt.c           |  36 ++++----
>  target/riscv/cpu.c        |  84 ++++++++++++------
>  target/riscv/cpu_helper.c |  12 +--
>  target/riscv/csr.c        | 182 ++++++++++++++++++++------------------
>  target/riscv/fpu_helper.c |  16 ++--
>  13 files changed, 302 insertions(+), 236 deletions(-)

Thanks, this is awesome!  That's always been one of the headaches floating
around the port that I was hoping to have some time to sort out :).  I just
gave it a quick look, but

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

as it certainly seems better than before.

