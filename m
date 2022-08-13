Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA435919D4
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 12:23:40 +0200 (CEST)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMoIt-0007Wd-HX
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 06:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMoGn-0004qX-7v
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 06:21:29 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMoGj-0000RJ-23
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 06:21:28 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id y127so4909310yby.8
 for <qemu-devel@nongnu.org>; Sat, 13 Aug 2022 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=s3qu38xhtbvJl87MpDEF3axrKsGQKH/PsT9zWIa+kcs=;
 b=YzEXm3JTbZq/AetI/d67T/B6NknfUMUy4o3S362HHnfXHs/LKlpbgL/c1/QfTMnVJb
 XjDonJYz5ef2HKsrl33/BZqxv/4fT1Thgxn/uZgUEiPtI8nSyPNUrPvE6HQGWIaQduhE
 LOVZLbrZ51NwYLmd5GZ6apyhZV96q4SV8UsNxgTr+4ukHC93GqwuCGj8ZYcrMEPjZYDu
 esV6dELHDHvCgh5iFx66KWp4UN1MF0Wu4Dmk5GyyNPcTaUQ6KXjSsWVDdXFvFxb7+ZYJ
 0yfNcflEcS0iQU9xCQTXyjO+5UHYhWLc1Bph9LqTV5Xi3BrqzMxCTFmtJhGRpuwlmO3S
 dNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=s3qu38xhtbvJl87MpDEF3axrKsGQKH/PsT9zWIa+kcs=;
 b=cFc+D+k5fFjYMimma3dAH1Pg6Ujb7woWHpbbGhAxiF8NuH66mx9o8EVRweCRU0bQQb
 2VVO8VR5ZP3rj200sX/h13HwzayXD5ly1okQ3qFCaY0SVL49UsApC0WewVWgCODnX5fj
 v2QSAITmJ7QkaDsZv8L3xM5rnLm+sAo4qVHaeS7AuyDpqpT1LY30Rl+KdjYBdyXmx23y
 gATweRH5RvR+pVTmkISDc7/wtEuNaKfaX/c8JuaOFm+OtabMoFEeiTUe4kSLXssf24je
 emgvBzQkzAJABmlQsqOEvfjHZ/RLIwpL3wNbbfooJVuOSVfCRda1XR/VubNgBIUtAFYW
 v1Ig==
X-Gm-Message-State: ACgBeo3Y0ndQn44nI+KHu1ivNcesGX4p4HC3iFHdlU8oTHAwn2sIX6qm
 V+/9Ss+qKulO2mDJtAyu83rDjf/PnFU7Rjg60s+zPQ==
X-Google-Smtp-Source: AA6agR4SF/NHCmDB+tj6ObWwdepqdqDLqRWFs8s6JIGxhAUQZOBiXoTXv9651yrVHJ3K3fkt5/wpeHZDJyO1yINZA6I=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr5951626ybq.140.1660386083511; Sat, 13
 Aug 2022 03:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD4Fdv54_u9vffu9tNuor4Tu_Ld-eYZkLRmTxi=X2wknnw@mail.gmail.com>
In-Reply-To: <CA+tJHD4Fdv54_u9vffu9tNuor4Tu_Ld-eYZkLRmTxi=X2wknnw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 11:20:42 +0100
Message-ID: <CAFEAcA9vZMKwCN8Qe0FhGta7k5dTaa8oWK+tNZgiLpQh+d-rEQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make semihosting configurable for all privilege
 modes
To: Furquan Shaikh <furquan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Aug 2022 at 00:23, Furquan Shaikh <furquan@rivosinc.com> wrote:
>
> Unlike ARM, RISC-V does not define a separate breakpoint type for
> semihosting. Instead, it is entirely ABI. Thus, we need an option
> to allow users to configure what the ebreak behavior should be for
> different privilege levels - M, S, U, VS, VU. As per the RISC-V
> privilege specification[1], ebreak traps into the execution
> environment. However, RISC-V debug specification[2] provides
> ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> be configured to trap into debug mode instead. This change adds
> settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> should treat ebreak as semihosting traps or trap according to the
> privilege specification.
>
> [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-202=
20723-10eea63/riscv-privileged.pdf
> [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-re=
lease.pdf
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
> ---

As per the discussion thread on the v1 patch, I don't think this
is the right way to solve the underlying problem you ran into.
We should fix that with a generic "allow semihosting calls
from userspace" option.

thanks
-- PMM

