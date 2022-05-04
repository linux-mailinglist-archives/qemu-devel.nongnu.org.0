Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D351AF47
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 22:34:46 +0200 (CEST)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmLht-0006T8-BE
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 16:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmLgb-0005WQ-49; Wed, 04 May 2022 16:33:25 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:42615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmLgZ-00066z-FB; Wed, 04 May 2022 16:33:24 -0400
Received: by mail-oi1-x230.google.com with SMTP id w194so1149014oie.9;
 Wed, 04 May 2022 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ls2YESuPHouHy4eJcjH62jn447e2NQGcQO76B7wzLoo=;
 b=P2Pii3d+twMSpfGTCe7EnEVfr5HTQO6tz9WYunoLLVeEBFLc4DDaC58wCrBojpKR0J
 KOfk//mluLuiqZuApvsOuOkanv/IwSD5pRNyDNMtI3yLhXE1N/0MTe7/tVh7Os5/OPaD
 hOQgPBLX8OP5gk1Jb4XsPxQQIuamrCueFCdpJ95qwvtIve4s/lxUY6Byqkb1uGdOxDzU
 a9ysJ7TyRQJrZCn3b9YhAEHQsmiO8O5Gv+/eOdOqxAtb38UO5n7Ofugh9I0senXGg2w4
 ruYMM90yH4rytjdvA+vx/zqYku2iFgL9Y3716b6vFhc3B/qnWI0Pz5ATc1QiCBP0gIoo
 Xr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ls2YESuPHouHy4eJcjH62jn447e2NQGcQO76B7wzLoo=;
 b=2OBTbUbuEJXI401W3aFW69OCAU8PAMhWXQWObyIaZpTl2NZPCFcjtQ7fs+XmT/oYGi
 okGd2cn/INxOeTzxff0dMFMF2CE2sKmBIxnR1hgLkc47eOaB+I6Il/966PdIKQueDbKR
 v0eiI0hbJgfI3M1ihdfn/bdz/Y37OnteAMV2I607jTwcNHZtfPF/xmBmYHjqCo8MFrOK
 qiZNlj72XERK2jSLH3A0n/Go+fxomyoGjC9cxdOKaUGlXQcDYY4C1aQWYfC81BN8MrCg
 Cma1XnyC2HogQ5WVO2g/kKRHkyGw2rxOaF9jL0Z/5N0/lOoFPN+4zuX1ENQnXlS3x8rN
 9SAg==
X-Gm-Message-State: AOAM531VZIb+1mUVa+Wd62HC6VCD96chDP6rgN0c/cs+MQg1MMGxh8Zw
 2TDZ5+SNd1hkl7i88EpWhPA=
X-Google-Smtp-Source: ABdhPJy5kp1JrsV6sHOlrAAzSHY+GXZUuu/mW/ryKBHTPyW33H3vlkRkdH1MoonQnR4VqAU8A/avDA==
X-Received: by 2002:a05:6808:18a2:b0:325:ce71:e16 with SMTP id
 bi34-20020a05680818a200b00325ce710e16mr682329oib.94.1651696401912; 
 Wed, 04 May 2022 13:33:21 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 t9-20020a0568301e2900b006060322126bsm5356539otr.59.2022.05.04.13.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 13:33:21 -0700 (PDT)
Message-ID: <1f75f784-af04-3ed4-f8ad-d13eb4216b6e@gmail.com>
Date: Wed, 4 May 2022 17:33:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 00/21] target/ppc: Remove hidden usages of *env
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, balaton@eik.bme.hu
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

I asked Victor to rebase this series on top of ppc-next at:

gitlab.com/danielhb/qemu/tree/ppc-next

Because of

"[PATCH v2] target/ppc: Fix BookE debug interrupt generation​"

that added new occurrences of the msr_de macro that wasn't being handled.
I believe that the changes needed are not removing msr_de in patch 02 and
adding a new patch to handle the two existing msr_de instances.


After this series is fully reviewed I'll send a PR with it ASAP to avoid
further conflicts.


Thanks,


Daniel





On 5/3/22 17:24, Víctor Colombo wrote:
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
> Patches requiring review: 11, 14, 15, 16, 17, 21
> Patch 17 was reviewed before, but I created a macro to extract both FE0
>      and FE1, so decided to drop the R-b for you to take a look at the
>      new version. Thanks
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
> Víctor Colombo (21):
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
>    target/ppc: Add unused msr bits FIELDs
>    target/ppc: Change MSR_* to follow POWER ISA numbering convention
> 
>   hw/ppc/pegasos2.c        |   2 +-
>   hw/ppc/spapr.c           |   2 +-
>   target/ppc/cpu.c         |   2 +-
>   target/ppc/cpu.h         | 219 ++++++++++++++++++---------------------
>   target/ppc/cpu_init.c    |  23 ++--
>   target/ppc/excp_helper.c |  54 +++++-----
>   target/ppc/fpu_helper.c  |  28 ++---
>   target/ppc/gdbstub.c     |   2 +-
>   target/ppc/helper_regs.c |  11 +-
>   target/ppc/kvm.c         |   7 +-
>   target/ppc/machine.c     |   2 +-
>   target/ppc/mem_helper.c  |  23 ++--
>   target/ppc/misc_helper.c |   2 +-
>   target/ppc/mmu-radix64.c |  11 +-
>   target/ppc/mmu_common.c  |  40 +++----
>   target/ppc/mmu_helper.c  |   6 +-
>   16 files changed, 217 insertions(+), 217 deletions(-)
> 

