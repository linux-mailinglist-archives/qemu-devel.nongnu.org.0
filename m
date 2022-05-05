Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FE551C617
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:57582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfHg-0006nB-0m
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmews-0001Fo-TN; Thu, 05 May 2022 13:07:31 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmewq-0001BP-7u; Thu, 05 May 2022 13:07:30 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 f6-20020a4ace86000000b0035f083d2216so821875oos.4; 
 Thu, 05 May 2022 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+QH995lV1H/eaDp3XzJoY1q1espmc3OWGrW7PPstr+4=;
 b=pjDFISlRbj2eidcNnwaKsFmp9jFCxyQbtsJ+bblfPt9Nt+Ic6hUyUwc7cVf/cgoD6N
 y7LExmvmUL2Pz2Hlf+lJHdBTvVRsEyVb8Wkz2vuLO2MOHiCnHkG0gCDDYkIrEjDfsuWq
 FJbOP8x50Py/HCiisqjjLkLDvkSeZosAmgtZ1FjJkA4qDR5o8WUGTGaMbmPaSoUD+C1E
 2YP0rcXqrVTecZBCVOLjTx1te0jsygjObupHOD9R2P3NR4GmQj4ZH4q5GuvgUzasvWBR
 N7R6o+75tBgHS2hMSHKcD3O3kI609Dw1C0srvlVAWzJZk3iFB7zycH60j0ECjT7N0tXJ
 tkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+QH995lV1H/eaDp3XzJoY1q1espmc3OWGrW7PPstr+4=;
 b=ptmoZ0+4lPjZrAeb0hM8C2A4XDAYCBXFzrQb2dWC8IV/PIX0MW9mOI199eOWmdcFk8
 eySyjM1F7NaKYz1vKgniQknFEyDdUC+S5lneMWKDruYn0rMe+W9NYT4UsUHuqMskess2
 pMsMvG0iF2ACMxUNSQ0AYfV8o1aH7PLXEkMNc0ddCwu3L6eElH4kfe495Cwq6SRwbNEV
 +pH7vBYbWNFZ2U2/boLvHADNdAUOgQD5NMk84M52lh2UXiMQXBNqpDbw2oGcuP1bYLbN
 Yn9q9MhpBhctyxbJKpK0z5L+oO01WaV0lZZe7oFxheVUGiRoiPHboqHeIx4qBvUaw4ki
 CZlA==
X-Gm-Message-State: AOAM533sXlsrkNPqoCXbHdGaxmeL6GUehnS31pSG0C4uNVn832FWOhkb
 VTmjTs9/DRLWIV8aJqcqvBE=
X-Google-Smtp-Source: ABdhPJzfPMt62ULTXB/vfKtn9ogqHvVrM6HpVFD836kHXVL3U+RY/oGCdz25FYohmcKyRosSIfMP1Q==
X-Received: by 2002:a4a:de4b:0:b0:35e:bac9:807f with SMTP id
 z11-20020a4ade4b000000b0035ebac9807fmr9683226oot.16.1651770446763; 
 Thu, 05 May 2022 10:07:26 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 y23-20020a0568301d9700b006060322126esm771052oti.62.2022.05.05.10.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:07:25 -0700 (PDT)
Message-ID: <b0ab5827-4df3-ef92-47cb-7fcf69d5fa54@gmail.com>
Date: Thu, 5 May 2022 14:07:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 00/22] target/ppc: Remove hidden usages of *env
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, balaton@eik.bme.hu
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 5/4/22 18:05, Víctor Colombo wrote:
> By running the grep command `git grep -nr 'define \(fpscr\|msr\)_[a-z0-9]\+\>'`
> we can find multiple macros that use `env->fpscr` and `env->msr` but doesn't
> take *env as a parameter.
> 
> Richard Henderson said [1] that these macros hiding the usage of *env "are evil".
> This patch series remove them and substitute with an explicit usage of *env by
> using registerfields API.
> 
> Patch 20 (target/ppc: Add unused msr bits FIELDs) declares unused FIELDs, the
> same that were removed in patch 02 (target/ppc: Remove unused msr_* macros). I
> did that to keep the changes consistent with what was already present before.
> 
> Patch 21 (target/ppc: Change MSR_* to follow POWER ISA numbering convention)
> changes the MSR_* bit number to match POWER ISA by adding a new macro to
> 'invert' the ordering. (added in v2)
> 
> [1]: https://lists.gnu.org/archive/html/qemu-ppc/2021-11/msg00280.html
> 
> Sending a v4 because another patch queued in ppc-next added an usage of
> msr_de
> 
> v2:
> - Abandon the ideia to add an M_MSR_* macro
> - Instead, use registerfields API as suggested by Richard
> - Add patch 21 to invert MSR_* values to match ISA ordering
> 
> v3:
> - Add macro to extract both FE0 and FE1. Use it to simplify the
>    conditionals in patch 17
> - Fix the checks that should be a xor
> - Fix incorrect parameter in FIELD_EX64 (was env->msr should be value)
>    in patch 16
> - Fix patch 13 title
> 
> v4:
> - Rebase on top of target/ppc: Fix BookE debug interrupt generation
> - Add patch target/ppc: Remove msr_de macro. msr_de was not being used
>    anywhere before, but an usage was added in the patch
>    target/ppc: Fix BookE debug interrupt generation
> - Necessary changes in other patches:
>    dont remove msr_de in patch 2
>    context change in other patches
> 
> 
> Víctor Colombo (22):
>    target/ppc: Remove fpscr_* macros from cpu.h
>    target/ppc: Remove unused msr_* macros
>    target/ppc: Remove msr_pr macro
>    target/ppc: Remove msr_le macro
>    target/ppc: Remove msr_ds macro
>    target/ppc: Remove msr_ile macro
>    target/ppc: Remove msr_ee macro
>    target/ppc: Remove msr_ce macro
>    target/ppc: Remove msr_pow macro
>    target/ppc: Remove msr_me macro
>    target/ppc: Remove msr_gs macro
>    target/ppc: Remove msr_fp macro
>    target/ppc: Remove msr_cm macro
>    target/ppc: Remove msr_ir macro
>    target/ppc: Remove msr_dr macro
>    target/ppc: Remove msr_ep macro
>    target/ppc: Remove msr_fe0 and msr_fe1 macros
>    target/ppc: Remove msr_ts macro
>    target/ppc: Remove msr_hv macro
>    target/ppc: Remove msr_de macro
>    target/ppc: Add unused msr bits FIELDs
>    target/ppc: Change MSR_* to follow POWER ISA numbering convention
> 
>   hw/ppc/pegasos2.c        |   2 +-
>   hw/ppc/spapr.c           |   2 +-
>   target/ppc/cpu.c         |   2 +-
>   target/ppc/cpu.h         | 220 ++++++++++++++++++---------------------
>   target/ppc/cpu_init.c    |  23 ++--
>   target/ppc/excp_helper.c |  54 +++++-----
>   target/ppc/fpu_helper.c  |  28 ++---
>   target/ppc/gdbstub.c     |   2 +-
>   target/ppc/helper_regs.c |  15 ++-
>   target/ppc/kvm.c         |   7 +-
>   target/ppc/machine.c     |   2 +-
>   target/ppc/mem_helper.c  |  23 ++--
>   target/ppc/misc_helper.c |   2 +-
>   target/ppc/mmu-radix64.c |  11 +-
>   target/ppc/mmu_common.c  |  40 +++----
>   target/ppc/mmu_helper.c  |   6 +-
>   16 files changed, 220 insertions(+), 219 deletions(-)
> 

