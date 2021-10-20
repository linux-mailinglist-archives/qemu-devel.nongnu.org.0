Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA51434E6F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:59:52 +0200 (CEST)
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdD4J-0004Hd-LP
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdD2F-0002Qr-Iv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:57:43 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdD2D-0003rH-RO
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:57:43 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 136so2982306pgc.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j/BSM1NtGtUJuZBkikYYglLhadup4cDc5ZB/aZuPQv8=;
 b=UwKDXj6bAE2o4sGUvothVhuf0hAbJSLfZyouoY1MT6hg8N26G1V58X5a4/ThcgpeCw
 Nf6ZumajJj5d7wUFDVNzcUUZvxBJ+ATcnZ3VT++nPf5Oc0Aw1NgoFlpK3iaRm7mYbJ9m
 k2lyTBQHseXOH0IhD9PL4DZtXwvi0+6E3iVdEDiLfS8xcy36++t0Io8DsVGwgaq3Gamw
 p+rXM1pXW0yhLzk7uXOCraNwxn+YElnQYXLDdwR9CPRNEy7FVPTRIRo6lEc7i8hScRDM
 0M69JPltJ3Lwlm9d98IyaHbaRH8sNUwhwI5CCOKVCovO3jwyRHu207u9TljC6ElHkaWC
 7CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/BSM1NtGtUJuZBkikYYglLhadup4cDc5ZB/aZuPQv8=;
 b=pdWLplX3dkyYsDkQ6U5WpYRUgkN32Zs0jx1NSA9iK9JwlDdeqd3s2/hpgUYzIagdE5
 pdaXrweJq3iSEAboCXsEnL96eMLi1nOTlvKxT/KPrPoBiu9AYIsrOfpDZ/ihxKoYWcSa
 H5fqSFNfNIuaR1vZF7rG1zhUkeVWo3YsdtxAlIk0C8gUY1+DJCtBr6B9ih4YfZ6AGD72
 AU4oNX/xGfjECsrZG0MMiM0OyO14uqBaJUCrp/OkFBzfn7ofFZb/ekU3WP0o6oNTqcV4
 A/eGeXG1AVmDb03IGlCe3T0N532WTvd59hQT8R562peHaPo3AQQiN2JzTfZ2UvjFwUhn
 d/fQ==
X-Gm-Message-State: AOAM532fXuwa0UiqkDyAHRAJ/7Dsq0Mncj+6f0gLAzq0Y9L+V0qspESr
 b7hSRJcH9pxwfqvOKmsV/8Cl/w==
X-Google-Smtp-Source: ABdhPJw/4NB8n32lPUMSBh5NPoTu3i9zRzHf+pf3zCiI76La3GcLQhDtJ2ux+xB02woUhtHBUttEDw==
X-Received: by 2002:a63:15:: with SMTP id 21mr336870pga.479.1634741860360;
 Wed, 20 Oct 2021 07:57:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm3421100pfc.121.2021.10.20.07.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 07:57:39 -0700 (PDT)
Subject: Re: [PATCH v3 07/21] target/riscv: setup everything so that
 riscv128-softmmu compiles
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-8-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a5d64f7-0587-4ade-85c3-6b0cea5228bd@linaro.org>
Date: Wed, 20 Oct 2021 07:57:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-8-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
> This patch is kind of a mess because several files have to be slightly
> modified to allow for a new target. Most of these modifications have to deal
> with changing what was a binary choice into a ternary one.  Although we did
> our best to avoid testing for TARGET_RISCV128 (which we did), it is
> implicitly there in '#else' statements.
> Most added infrastructure files are no far from being copies of the 64-bit
> version.
> Once this patch applied, adding risc128-sofmmu to --target-list produces
> a (no so useful yet) executable.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   configs/devices/riscv128-softmmu/default.mak | 17 +++++++
>   configs/targets/riscv128-softmmu.mak         |  6 +++
>   include/disas/dis-asm.h                      |  1 +
>   include/hw/riscv/sifive_cpu.h                |  3 ++
>   target/riscv/cpu-param.h                     |  5 ++
>   target/riscv/cpu.h                           |  3 ++
>   disas/riscv.c                                |  5 ++
>   target/riscv/cpu.c                           | 23 +++++++++-
>   target/riscv/gdbstub.c                       |  3 ++
>   target/riscv/insn_trans/trans_rvd.c.inc      | 12 ++---
>   target/riscv/insn_trans/trans_rvf.c.inc      |  6 +--
>   gdb-xml/riscv-128bit-cpu.xml                 | 48 ++++++++++++++++++++
>   gdb-xml/riscv-128bit-virtual.xml             | 12 +++++
>   target/riscv/Kconfig                         |  3 ++
>   14 files changed, 137 insertions(+), 10 deletions(-)
>   create mode 100644 configs/devices/riscv128-softmmu/default.mak
>   create mode 100644 configs/targets/riscv128-softmmu.mak
>   create mode 100644 gdb-xml/riscv-128bit-cpu.xml
>   create mode 100644 gdb-xml/riscv-128bit-virtual.xml

So... do we really want to go down this route, with a separate binary?  It seems like we 
could reasonably support rv128 in the qemu-system-riscv64 binary with -cpu rv128.

> +++ b/gdb-xml/riscv-128bit-cpu.xml
> @@ -0,0 +1,48 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!-- Register numbers are hard-coded in order to maintain backward
> +     compatibility with older versions of tools that didn't use xml
> +     register descriptions.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<!-- FIXME : All GPRs are marked as 64-bits since gdb doesn't like 128-bit registers for now. -->

If the widths are not correct, we can just as easily skip it for now.


r~

