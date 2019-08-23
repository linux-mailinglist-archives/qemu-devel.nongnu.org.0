Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C799B5B8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:48:51 +0200 (CEST)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1DgA-0003bb-Mj
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i1DZt-0007sZ-UP
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:42:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i1DZs-0001Bv-SP
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:42:21 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:36739)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i1DZs-0001BG-Kz; Fri, 23 Aug 2019 13:42:20 -0400
Received: by mail-lf1-x141.google.com with SMTP id r5so2207975lfc.3;
 Fri, 23 Aug 2019 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imVA8lcHNIe0JvRJYRvwSFiTQlg+7fZaMzjuyqINFzo=;
 b=t+CRnNn1vGXGJm7j7pJlTvuPtVIadKmJmpM2qPfinHQ3CK8wJQ4+mEAyiIqpU32vm+
 iMM4IevJVarSDRo4OM8sPerByK1IV5dn9Wi4R9fvHL33yh1eWGD7eTFtA+kkmuIK+EyW
 4dT+zPcuM7ToJY91dpWS1GwFGtcbAx2mLAJ6xzh4jpyMnLKJPunBnouiNLr7f7xJcDI5
 OFR1Xc/O3o6WcNkCuvD0jU/wWt0A9o9aKGHvwsNf4u68bJJiG85xUnnCRvCCoPIn9oCa
 /mcXPgokwYcIXXgWK16qiB4Irl0wdIh6X7RjzrRn+rx8bq3JdgcZ5wA0k/GCKylq73Qv
 OTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imVA8lcHNIe0JvRJYRvwSFiTQlg+7fZaMzjuyqINFzo=;
 b=WQYIOdxpK1NCifA9Q1k/e+F6+HY0cGWt4H94XlztQFnv2saNULK5RHFfwXmUM/mG8S
 V+Q9vnJJGTVZQbZdlv40ewAxEOWyx/qUePq9yv3hUpPnRxtXY45Y4VY3WNcoLVLF04M6
 ZrGsioi53vm0rZRVcftkeRSAmnmUrKGk5psa6ZAUc5v+TKcDT3F3Qaptab26CCK/2LUh
 1Gu1s7oU35E/zneaF6hbeKE1E1Xa//CW4gk6X/39N4YtEUPw5lETWq4+VoYUbl1uAaMS
 2Gq8oWOHkW/F73REKdjTWcJxJMBW2uQN1HhXUbmLjE+c53PvUYGSndlF1peSz+he5Jar
 Vczw==
X-Gm-Message-State: APjAAAWeVvfIwwlHtsX2HGowV/NA4N27IPpxGEIgT5ZRXUB5PZc6V792
 H05k66E3AyZ0hmT+vo43c88UqMEPrT3ZcacNeRWQmPM8
X-Google-Smtp-Source: APXvYqzVE1gRfPyFCoWZIfefcp0znqcIoYWOk/uJ8yrN6y/zZu0rQnyE/12YK4t6E+ahbKoqb8+S36AxpJykl3HVZMo=
X-Received: by 2002:a19:7006:: with SMTP id h6mr3540779lfc.5.1566582139133;
 Fri, 23 Aug 2019 10:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
 <1566537069-22741-7-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1566537069-22741-7-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Aug 2019 10:38:13 -0700
Message-ID: <CAKmqyKNuQN9X4VLc3e8vhNrBjg=+tKTJHikSy4QAX8m0FKSp0g@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-devel] [PATCH v5 06/30] riscv: hw: Remove the unnecessary
 include of target/riscv/cpu.h
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
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 22, 2019 at 10:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The inclusion of "target/riscv/cpu.h" is unnecessary in various
> sifive model drivers.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v5:
> - new patch to remove the unnecessary include of target/riscv/cpu.h
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>  hw/riscv/sifive_prci.c | 1 -
>  hw/riscv/sifive_test.c | 1 -
>  hw/riscv/sifive_uart.c | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
> index 1ab98d4..1957dcd 100644
> --- a/hw/riscv/sifive_prci.c
> +++ b/hw/riscv/sifive_prci.c
> @@ -22,7 +22,6 @@
>  #include "hw/sysbus.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> -#include "target/riscv/cpu.h"
>  #include "hw/riscv/sifive_prci.h"
>
>  static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
> diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
> index 655a3d7..31cad9f 100644
> --- a/hw/riscv/sifive_test.c
> +++ b/hw/riscv/sifive_test.c
> @@ -23,7 +23,6 @@
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "sysemu/sysemu.h"
> -#include "target/riscv/cpu.h"
>  #include "hw/riscv/sifive_test.h"
>
>  static uint64_t sifive_test_read(void *opaque, hwaddr addr, unsigned int size)
> diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
> index cd74043..1601bd9 100644
> --- a/hw/riscv/sifive_uart.c
> +++ b/hw/riscv/sifive_uart.c
> @@ -22,7 +22,6 @@
>  #include "hw/sysbus.h"
>  #include "chardev/char.h"
>  #include "chardev/char-fe.h"
> -#include "target/riscv/cpu.h"
>  #include "hw/riscv/sifive_uart.h"
>
>  /*
> --
> 2.7.4
>
>

