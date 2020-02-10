Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4036115853E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 22:49:41 +0100 (CET)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Gw0-0004Qa-AN
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 16:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j1Gsu-0002iI-KV
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 16:46:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j1Gst-0007Gf-Ep
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 16:46:28 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41112)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j1Gst-0007C8-3w
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 16:46:27 -0500
Received: by mail-pg1-x542.google.com with SMTP id 70so2468996pgf.8
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 13:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IeOm7hpSFIGFkdQhxKOH2BAg3N9pNkx3FwZUvGEAD5Y=;
 b=QFBqB0Lv48H86rdRKD4AW7PPBUVqhgB4n1/JCgqv+PqvkRAceDKyYV7JmKRkGdcjXD
 zSdf+NRwwKisCRwGjb6VLdDgPCZv1ZpKv4dEQzQcuZAqwZ4PmV6q0v05YIRQWfqpFgLA
 2EDqKQGQtDOr/awV0aBh9dveBK/6Jfd12zhWSD7b/ppXNH+k5p1lwP5cAvuAzfTGT0LD
 kQZ18LIpfy0D4DXxBClt9Owo8e4H5vCbXwsyPwZFnsmkbY/y9aHrYWp4XXQLcIi7KCFZ
 AR757KjKN5BsctLjrz36j4t1q0nDwDjEC1Y+pQ1QDJX2fK39+RyRyB0yLHxqJ37R2qA1
 XiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IeOm7hpSFIGFkdQhxKOH2BAg3N9pNkx3FwZUvGEAD5Y=;
 b=WtjzIY7Hf97VVLKsPJJs4X+PR4uD80Dk7wix9omoRJcr+Y+ETtH3lQP41dILNMQ/cU
 dvspjmoLyp5C85kTfAL4TzhrSlBet/vpo32o3Jh8rUkgv5xOyb2GtVxmE7VIMZZ/+qk8
 noF2YDSNkgtIYzutto+rdp6HrzGsMGsAkdBTmgv/YZg7pVLkwQDBjNN+up/pPJqVQmm2
 amzbCQhVeSU44mb1NQr4yiovkTyd79fbayDP13j9rTdyyyU/qCzGaDcMvdvLfuWktC2R
 tNRh3QuFemCXELr0e/QRmNTccZfqUJn66iOa3uWPjqXELwXk+y4JH9wrgCsLckyAb2gk
 nHOg==
X-Gm-Message-State: APjAAAW/t9QAmMqfvu0H4Lg3DJ/UPw252nfHyIwwY2WvAcpqYVn2lXvm
 khUx7IJ4oHix/RlK2lfl7rPb0NH7AsA=
X-Google-Smtp-Source: APXvYqyzjqx++4TuPpPinFpXXZarmgvZQIjG4hfHR19fCqm8huUWzBgcK4set+PBcXGbHqwRTdjj4w==
X-Received: by 2002:a62:6342:: with SMTP id x63mr3047294pfb.103.1581371185341; 
 Mon, 10 Feb 2020 13:46:25 -0800 (PST)
Received: from localhost ([2600:1012:b161:af3e:21a9:6308:301b:ae65])
 by smtp.gmail.com with ESMTPSA id k63sm385817pjb.10.2020.02.10.13.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 13:46:24 -0800 (PST)
Date: Mon, 10 Feb 2020 13:46:24 -0800 (PST)
X-Google-Original-Date: Mon, 10 Feb 2020 13:44:59 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 07/35] target/riscv: Add the force HS exception mode
In-Reply-To: <aa605609b28f811897f61d9b6a48f2ad6e396f0f.1580518859.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-d8e0b6f3-e24d-4dce-a5a2-a46e59db8950@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 31 Jan 2020 17:01:54 PST (-0800), Alistair Francis wrote:
> Add a FORCE_HS_EXCEP mode to the RISC-V virtulisation status. This bit
> specifies if an exeption should be taken to HS mode no matter the
> current delegation status. This is used when an exeption must be taken
> to HS mode, such as when handling interrupts.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_bits.h   |  6 ++++++
>  target/riscv/cpu_helper.c | 18 ++++++++++++++++++
>  3 files changed, 26 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a9cbd8584e..42720d65f9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -273,6 +273,8 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> +bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
> +void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 2cdb0de4fe..ad6479796c 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -432,6 +432,12 @@
>
>  /* Virtulisation Register Fields */
>  #define VIRT_ONOFF          1
> +/* This is used to save state for when we take an exception. If this is set
> + * that means that we want to force a HS level exception (no matter what the
> + * delegation is set to). This will occur for things such as a second level
> + * page table fault.
> + */
> +#define FORCE_HS_EXCEP      2
>
>  /* RV32 satp CSR field masks */
>  #define SATP32_MODE         0x80000000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 5844e543f3..1e28103500 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -100,6 +100,24 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>      env->virt = set_field(env->virt, VIRT_ONOFF, enable);
>  }
>
> +bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return false;
> +    }
> +
> +    return get_field(env->virt, FORCE_HS_EXCEP);
> +}
> +
> +void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return;
> +    }
> +
> +    env->virt = set_field(env->virt, FORCE_HS_EXCEP, enable);
> +}
> +
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>  {
>      CPURISCVState *env = &cpu->env;

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

