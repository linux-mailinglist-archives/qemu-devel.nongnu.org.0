Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABE1F5E80
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 01:01:56 +0200 (CEST)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj9jH-0002Rd-7G
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 19:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jj9hu-0001vU-DF; Wed, 10 Jun 2020 19:00:30 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34338)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jj9ht-0001P1-AD; Wed, 10 Jun 2020 19:00:30 -0400
Received: by mail-io1-xd42.google.com with SMTP id m81so4272463ioa.1;
 Wed, 10 Jun 2020 16:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qamDXaiTgwLwXEIs/y53unU+2O9fo4AUGs1266Zl+do=;
 b=MedzxXnNuFflUqitjVnnrdUH2V6w65mnedouw6i2bOF0ravQhIdyPH5lSFku6jeaq3
 XA4oL2EM94EcqMCjtWPmhRQ9VszeVrtP4N/Ma2wyYtdjnkpaOa0x2P6YraPvhl8vvg7V
 cB/ohcfSNZ028hoydHApX/DC4Q7m0Ge9pMCyD2cKFjncUwc4oFR1yLjTyKWMyOTsPAJB
 DESULIqGnW+xdm0WCj3K+K+JbqXPd1Q4uvEvTP2SVVtO2N233AungdE5RGeVfC95RZs2
 MKPMUM8P1bNmH2G4fZ2S5ipQ1WtrNwGGuxzWLU1KHs3qf0gqwjeg3sYDFcNO55Tf4oJB
 YVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qamDXaiTgwLwXEIs/y53unU+2O9fo4AUGs1266Zl+do=;
 b=a+A0jLa+ns9AgSfqV70/cXbDBoxty6xuNcHr83fLk2FJM9tHmKA0QbQj2Qtqcq993T
 eOOcgI4ZNC09KAWRQN+/KhcmoFHWDL5vYdXF7ITZKUV77lbtXaW2Bju/HxhueRE6hS6y
 q4Ji4tRmxVvWUBGZpAUGUFwBO9hC9+NZGjVNyDeNsxz+VGRi+YaUsLZN9oys/UOCh+gJ
 48jerL2TTqhZDLYbi515gkBc7woIfLivnFVOXQIc/hqLSEqz5f4CjAorz6/xkBOaIft2
 LmYl58Iy2j5Cp43153wCemqCiVN2UTP5471LyQRRRnVlHKU0JDTIZh+BRmigxzjLYmG4
 rS6Q==
X-Gm-Message-State: AOAM533yz/cDAPSoGXnmt7r9c621a5eqW0XplAkFzEmCkvC+tGV5iDyY
 B9aXFAQNupOoOpepG3KBd3CIeA83QB2gTyJbFXc=
X-Google-Smtp-Source: ABdhPJyV183mTenRxyZ0PdXeZPqPD1t16OCWhyQ1+1NKiYW7uc0yEhCiZQYGfbDt+7nH50pKHeKQgaGdFZYjfTnkVQc=
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr554897jaj.106.1591830015612; 
 Wed, 10 Jun 2020 16:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <1591342707-9729-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1591342707-9729-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Jun 2020 15:50:53 -0700
Message-ID: <CAKmqyKM9=cXV=GAOOF6q1-KVM+uXYxtapWNjgoUJN8T9jPBccA@mail.gmail.com>
Subject: Re: [PATCH 1/4] riscv: Generalize CPU init routine for the base CPU
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 5, 2020 at 12:40 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> There is no need to have two functions that have exactly the same
> codes for 32-bit and 64-bit base CPUs.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/cpu.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9007a25..d38d829 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -126,9 +126,7 @@ static void riscv_any_cpu_init(Object *obj)
>      set_resetvec(env, DEFAULT_RSTVEC);
>  }
>
> -#if defined(TARGET_RISCV32)
> -
> -static void riscv_base32_cpu_init(Object *obj)
> +static void riscv_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
> @@ -136,6 +134,8 @@ static void riscv_base32_cpu_init(Object *obj)
>      set_resetvec(env, DEFAULT_RSTVEC);
>  }
>
> +#if defined(TARGET_RISCV32)
> +
>  static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -173,14 +173,6 @@ static void rv32imafcu_nommu_cpu_init(Object *obj)
>
>  #elif defined(TARGET_RISCV64)
>
> -static void riscv_base64_cpu_init(Object *obj)
> -{
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    /* We set this in the realise function */
> -    set_misa(env, 0);
> -    set_resetvec(env, DEFAULT_RSTVEC);
> -}
> -
>  static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -601,13 +593,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      },
>      DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
>  #if defined(TARGET_RISCV32)
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base32_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32imcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_init),
>  #elif defined(TARGET_RISCV64)
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base64_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64imacu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64gcsu_priv1_10_0_cpu_init),
>  #endif
> --
> 2.7.4
>
>

