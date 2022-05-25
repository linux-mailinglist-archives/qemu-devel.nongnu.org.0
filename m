Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2F53465E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 00:22:20 +0200 (CEST)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntzOU-0002le-M1
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 18:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntzMp-0001z6-Tb
 for qemu-devel@nongnu.org; Wed, 25 May 2022 18:20:36 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntzMl-0003wl-2r
 for qemu-devel@nongnu.org; Wed, 25 May 2022 18:20:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so2832006pja.4
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 15:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=t1HtxLa0ADRbGKchIlUUjUUqsgB8GBhZWQCyt3y4Sfk=;
 b=cnmtoXY5yGKjwKhJjNk3mbUtMDwdhqZLg1rOOBMR1ZrfUW9SRjQpHIjJpCStraTOrm
 QfErlCAki2x0Qj47K1mvFHn2fCOAewjzYyvul9YDFusVKbhjPBEMfDzggzG0UxIJUaE5
 kkt4DoWABEDSX5P4vles0LVN0q/nD/r2E/FeaeOjPifUof9/mjeQtVW2bmI6i8PCLkX+
 SQMED7BDZ9mZ/J8LnKLa0L1/VBnkk/dkFYvy0QQWqMvx04XWC/fmlSnHUuqKFNo2g2T2
 iOW0eLDrRRccHO9RtOMCNfU9Om2tjYmwtOXfpMw9dYkpnjt9Hr/OFERJzLXqfZccQWbi
 4bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t1HtxLa0ADRbGKchIlUUjUUqsgB8GBhZWQCyt3y4Sfk=;
 b=oUoHuEBsVGuliIW9lQR4EqThuVuJ/s8TS970tsWdYixhZ6Pvu9HcQMZpFlJV03eJkp
 xGyoyoUo7Cm4FDJEGJmih4yoSzNg0Y/0n0czKQg/I+afePyjS+d3efmd7n8tB75Epf6s
 z7T9En4EjFOZD4LuRRG4qLZLJUzazU8XWnOfRKhLGQ1goO+lNNXrsayoSoDW45+rRrR4
 a41nKGYLZe3xwxPA5K/GGrUYMTdBSCdm5khT2ITIJKD6QneLhKzCdRuNEghdL44I3mPO
 CaTasmWnyFCUw0AtTaAWFAxSMjOgBQvd06n+5b5ageUJkOA1QONb1t3k048ioBppkQiV
 CtHQ==
X-Gm-Message-State: AOAM5327jLkGlzFY/wrsy2+7zxfQZuvwQ6hEsy1AWZwEfSNbbODZ+mho
 4DSaijBwomJon2mmkhj9hAO7eQ==
X-Google-Smtp-Source: ABdhPJwIk0rFeCuI1zk9SYA0qN/Af+w9yYkgNxFt/Af+wP8hmBl9SiVBcU2PdLXeZbAE3tx9JmTUsw==
X-Received: by 2002:a17:902:ce02:b0:153:bd65:5c0e with SMTP id
 k2-20020a170902ce0200b00153bd655c0emr34419935plg.160.1653517229338; 
 Wed, 25 May 2022 15:20:29 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a170902c40e00b0015e8d4eb27esm10035346plk.200.2022.05.25.15.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 15:20:28 -0700 (PDT)
Message-ID: <8627593e-5770-3d6e-ad4b-253eea44c06e@linaro.org>
Date: Wed, 25 May 2022 15:20:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/17] Misc patches for 2022-05-25
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220525192852.301633-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/25/22 12:28, Paolo Bonzini wrote:
> The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:
> 
>    Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 9ad6634ec956bcf3558059aae8c6b2b5ee985307:
> 
>    i386: docs: Convert hyperv.txt to rST (2022-05-25 21:26:35 +0200)
> 
> ----------------------------------------------------------------
> * ac97 cleanups (Zoltan)
> * default the amount of prealloc-threads to smp-cpus (Jaroslav)
> * fix disabling MPX on "-cpu host" with MPX-capable host (Maciej)
> * thread-pool performance optimizations (myself)
> * Hyper-V enlightenment enabling and docs (Vitaly)
> * check ELF header in elf2dmp (Viktor)
> * tweak LBREn migration (Weijiang)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> BALATON Zoltan (3):
>        hw/audio/ac97: Coding style fixes to avoid checkpatch errors
>        hw/audio/ac97: Remove unimplemented reset functions
>        hw/audio/ac97: Remove unneeded local variables
> 
> Jaroslav Jindrak (1):
>        hostmem: default the amount of prealloc-threads to smp-cpus
> 
> Lev Kujawski (1):
>        ide_ioport_read: Return lower octet of data register instead of 0xFF
> 
> Maciej S. Szmigiero (1):
>        target/i386/kvm: Fix disabling MPX on "-cpu host" with MPX-capable host
> 
> Paolo Bonzini (3):
>        thread-pool: optimize scheduling of completion bottom half
>        thread-pool: replace semaphore with condition variable
>        thread-pool: remove stopping variable
> 
> Viktor Prutyanov (1):
>        contrib/elf2dmp: add ELF dump header checking
> 
> Vitaly Kuznetsov (6):
>        i386: Use hv_build_cpuid_leaf() for HV_CPUID_NESTED_FEATURES
>        i386: Hyper-V Enlightened MSR bitmap feature
>        i386: Hyper-V XMM fast hypercall input feature
>        i386: Hyper-V Support extended GVA ranges for TLB flush hypercalls
>        i386: Hyper-V Direct TLB flush hypercall
>        i386: docs: Convert hyperv.txt to rST
> 
> Yang Weijiang (1):
>        target/i386: Remove LBREn bit check when access Arch LBR MSRs
> 
>   docs/hyperv.txt                | 270 ---------------
>   docs/system/i386/hyperv.rst    | 288 ++++++++++++++++
>   docs/system/target-i386.rst    |   1 +
>   target/i386/cpu.h              |   5 +-
>   target/i386/kvm/hyperv-proto.h |   9 +-
>   backends/hostmem.c             |   2 +-
>   contrib/elf2dmp/qemu_elf.c     |  53 +++
>   hw/audio/ac97.c                | 752 ++++++++++++++++++++---------------------
>   hw/ide/core.c                  |   6 +-
>   hw/ide/macio.c                 |   4 +-
>   target/i386/cpu.c              |  16 +
>   target/i386/kvm/kvm.c          |  76 +++--
>   util/thread-pool.c             |  74 ++--
>   13 files changed, 823 insertions(+), 733 deletions(-)
>   delete mode 100644 docs/hyperv.txt
>   create mode 100644 docs/system/i386/hyperv.rst


