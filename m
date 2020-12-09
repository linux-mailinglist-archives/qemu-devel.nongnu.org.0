Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23732D3FCF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:25:13 +0100 (CET)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwem-0007Ga-VN
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwce-0006Ob-Lp
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:23:00 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwcZ-0001p3-MZ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:23:00 -0500
Received: by mail-wr1-x443.google.com with SMTP id y17so1113688wrr.10
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/NmmE6eduDNhog/TVtfB4YpAOCnL41L+GOdv8o82+Ao=;
 b=WN8Pacob9dp5GHgVx8Bu4MPkT0KCllh0ytL2EgInEMHD3WwuPWLvuNjLyOjwVf3aVP
 /ZGd4qrd4g/IUkK0TgERceo8CcUIW2viZh+/xpx3OoZ/ybbjg7XvtRk/e8D/EIyI8VaN
 gd74xx6YZ0O7QUdaHyGRvyJvjb0a9VCnGKBjB4QQzJ9omDXGSUQEbWAKTLsTLtGsQ5mb
 gJAiHRokEUnSJggWm+bnRJw6xqP/vMcXqyYhEAYJ95nJSDqZEEyJJOkJ5+tyL6Tgqf5T
 TIndFbbQOgTxzQXeT6MtWqHdODdYZLP7Bcr8oetl9MOy0mPIeSPlEf0OdY5OvWxHoHR5
 GATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/NmmE6eduDNhog/TVtfB4YpAOCnL41L+GOdv8o82+Ao=;
 b=BwdmhVWvrZ6b365K3icKgM3R9/wP8/cBG4865GisNpmVIW3qORunNQtMMHlS9RSqeB
 k9yMkDwyzyOBrncpqffeo9ySIWfe5C68ETEwMQe9G1/9w5WRZK+ZP6GrJpYvUXCf7ywo
 5x/r5qrfjxTOVY/IvuBh0nptg+iw/QsWizyomp7N7GtEqsFuwIbJpCLjZh3Aet9/i6Zd
 Ios70itEH7MGIJ/9q3VI97BhW4EzAr2uPLtXwUS0IpAuQ9W68PYiUcjKLmEB4NUPMkQ+
 kJ7ISyR8+sMZiXdJV/m9XK68gsyw0YNJMz0zhaHpjuTxp0p5Cp+lGes1NGyiF5ywT6Eq
 JPag==
X-Gm-Message-State: AOAM531fXZWmDC08Klo6EnFFoi5IRhOt2ZsGlpeNq2uk7kFFP1UR8uIZ
 tIPfDtBOckcFFvsBHVm4y3U28Q==
X-Google-Smtp-Source: ABdhPJxnyM4fgLq7gy+iM84EktlqF6tXPQVL3D2/TsObBlCrfQdJM9kDNo+/50d8uhjtguISvYygsw==
X-Received: by 2002:adf:9104:: with SMTP id j4mr1986743wrj.198.1607509373496; 
 Wed, 09 Dec 2020 02:22:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g192sm2437247wme.48.2020.12.09.02.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:22:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94E721FF7E;
 Wed,  9 Dec 2020 10:22:50 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <160746485564.12203.12089995279684573296@600e7e483b3a>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [RFC v9 00/22] i386 cleanup
Date: Wed, 09 Dec 2020 10:22:33 +0000
In-reply-to: <160746485564.12203.12089995279684573296@600e7e483b3a>
Message-ID: <875z5bffd1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, paul@xen.org, jasowang@redhat.com,
 peterx@redhat.com, haxm-team@intel.com, colin.xu@intel.com, ohering@suse.de,
 sstabellini@kernel.org, brogers@suse.com, cota@braap.org, cfontana@suse.de,
 anthony.perard@citrix.com, philmd@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, ehabkost@redhat.com, richard.henderson@linaro.org,
 dirty@apple.com, dfaggioli@suse.com, r.bolshakov@yadro.com,
 sunilmut@microsoft.com, mtosatti@redhat.com, wenchao.wang@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


no-reply@patchew.org writes:

> Patchew URL: https://patchew.org/QEMU/20201208194839.31305-1-cfontana@sus=
e.de/
>
>
>
> Hi,
>
> This series seems to have some coding style problems. See output below for
> more information:

Also replicated in:

https://gitlab.com/stsquad/qemu/-/jobs/899057106

>
> Type: series
> Message-id: 20201208194839.31305-1-cfontana@suse.de
> Subject: [RFC v9 00/22] i386 cleanup
>
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20201208194839.31305-1-cfontana@suse.de -> p=
atchew/20201208194839.31305-1-cfontana@suse.de
> Switched to a new branch 'test'
> 1df468e cpu: introduce cpu_accel_instance_init
> 273e6bc hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn
> 6c8c6a4 cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
> c7ecc11 i386: split cpu accelerators from cpu.c, using AccelCPUClass
> 739ef2b accel: introduce AccelCPUClass extending CPUClass
> 706469e accel: replace struct CpusAccel with AccelOpsClass
> c3aa222 accel: extend AccelState and AccelClass to user-mode
> c45684a cpu: move do_unaligned_access to tcg_ops
> bca539a cpu: move cc->transaction_failed to tcg_ops
> 74feabd cpu: move cc->do_interrupt to tcg_ops
> f22d896 target/arm: do not use cc->do_interrupt for KVM directly
> 9a74429 cpu: Move debug_excp_handler to tcg_ops
> bf5b24b cpu: Move tlb_fill to tcg_ops
> 481a06e cpu: Move cpu_exec_* to tcg_ops
> af72917 cpu: Move synchronize_from_tb() to tcg_ops
> f9b393d accel/tcg: split TCG-only code from cpu_exec_realizefn
> 2019e4f target/riscv: remove CONFIG_TCG, as it is always TCG
> 53b3f4e cpu: Introduce TCGCpuOperations struct
> 8a0c2e9 cpu: Remove unnecessary noop methods
> 043b89c tcg: Make CPUClass.debug_excp_handler optional
> b271ab4 tcg: make CPUClass.cpu_exec_* optional
> ac15b62 tcg: cpu_exec_{enter,exit} helpers
> 0560b09 i386: move TCG cpu class initialization out of helper.c
> 36ae5f1 i386: move cpu dump out of helper.c into cpu-dump.c
> ef2d207 i386: move TCG accel files into tcg/
> 9d7a737 i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
> 42deca7 i386: move hax accel files into hax/
> 7dfc2be i386: move whpx accel files into whpx/
> 4d4c885 i386: move kvm accel files into kvm/
> d9966d5 accel/tcg: rename tcg-cpus functions to match module name
> a8f0cbf accel/tcg: split tcg_start_vcpu_thread
> 5e46bf0 accel/tcg: split CpusAccel into three TCG variants
>
> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> 1/32 Checking commit 5e46bf019fb7 (accel/tcg: split CpusAccel into three =
TCG variants)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #57:=20
> new file mode 100644
>
> total: 0 errors, 1 warnings, 1156 lines checked
>
> Patch 1/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 2/32 Checking commit a8f0cbf6b610 (accel/tcg: split tcg_start_vcpu_thread)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #103:=20
> deleted file mode 100644
>
> total: 0 errors, 1 warnings, 201 lines checked
>
> Patch 2/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 3/32 Checking commit d9966d571c7e (accel/tcg: rename tcg-cpus functions t=
o match module name)
> 4/32 Checking commit 4d4c885ff790 (i386: move kvm accel files into kvm/)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #167:=20
> rename from target/i386/hyperv-proto.h
>
> total: 0 errors, 1 warnings, 150 lines checked
>
> Patch 4/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 5/32 Checking commit 7dfc2bea3c57 (i386: move whpx accel files into whpx/)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #50:=20
> new file mode 100644
>
> total: 0 errors, 1 warnings, 32 lines checked
>
> Patch 5/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 6/32 Checking commit 42deca72cda4 (i386: move hax accel files into hax/)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #25:=20
> rename from target/i386/hax-all.c
>
> total: 0 errors, 1 warnings, 47 lines checked
>
> Patch 6/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 7/32 Checking commit 9d7a7374d252 (i386: hvf: remove stale MAINTAINERS en=
try for old hvf stubs)
> 8/32 Checking commit ef2d207c5f81 (i386: move TCG accel files into tcg/)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #44:=20
> rename from target/i386/bpt_helper.c
>
> total: 0 errors, 1 warnings, 39 lines checked
>
> Patch 8/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 9/32 Checking commit 36ae5f191d8c (i386: move cpu dump out of helper.c in=
to cpu-dump.c)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #11:=20
> new file mode 100644
>
> ERROR: braces {} are necessary for all arms of this statement
> #128: FILE: target/i386/cpu-dump.c:113:
> +    if (!(env->hflags & HF_PE_MASK) || !(sc->flags & DESC_P_MASK))
> [...]
>
> WARNING: Block comments use a leading /* on a separate line
> #172: FILE: target/i386/cpu-dump.c:157:
> +/* ARRAY_SIZE check is not required because
>
> WARNING: Block comments use a leading /* on a separate line
> #211: FILE: target/i386/cpu-dump.c:196:
> +/* ARRAY_SIZE check is not required because
>
> ERROR: line over 90 characters
> #373: FILE: target/i386/cpu-dump.c:358:
> +        qemu_fprintf(f, "RAX=3D%016" PRIx64 " RBX=3D%016" PRIx64 " RCX=
=3D%016" PRIx64 " RDX=3D%016" PRIx64 "\n"
>
> ERROR: line over 90 characters
> #374: FILE: target/i386/cpu-dump.c:359:
> +                     "RSI=3D%016" PRIx64 " RDI=3D%016" PRIx64 " RBP=3D%0=
16" PRIx64 " RSP=3D%016" PRIx64 "\n"
>
> ERROR: line over 90 characters
> #375: FILE: target/i386/cpu-dump.c:360:
> +                     "R8 =3D%016" PRIx64 " R9 =3D%016" PRIx64 " R10=3D%0=
16" PRIx64 " R11=3D%016" PRIx64 "\n"
>
> ERROR: line over 90 characters
> #376: FILE: target/i386/cpu-dump.c:361:
> +                     "R12=3D%016" PRIx64 " R13=3D%016" PRIx64 " R14=3D%0=
16" PRIx64 " R15=3D%016" PRIx64 "\n"
>
> ERROR: line over 90 characters
> #377: FILE: target/i386/cpu-dump.c:362:
> +                     "RIP=3D%016" PRIx64 " RFL=3D%08x [%c%c%c%c%c%c%c] C=
PL=3D%d II=3D%d A20=3D%d SMM=3D%d HLT=3D%d\n",
>
> ERROR: space required before the open parenthesis '('
> #436: FILE: target/i386/cpu-dump.c:421:
> +    for(i =3D 0; i < 6; i++) {
>
> WARNING: line over 80 characters
> #448: FILE: target/i386/cpu-dump.c:433:
> +        qemu_fprintf(f, "CR0=3D%08x CR2=3D%016" PRIx64 " CR3=3D%016" PRI=
x64 " CR4=3D%08x\n",
>
> ERROR: space required before the open parenthesis '('
> #453: FILE: target/i386/cpu-dump.c:438:
> +        for(i =3D 0; i < 4; i++)
>
> ERROR: braces {} are necessary for all arms of this statement
> #453: FILE: target/i386/cpu-dump.c:438:
> +        for(i =3D 0; i < 4; i++)
> [...]
>
> ERROR: space required before the open parenthesis '('
> #469: FILE: target/i386/cpu-dump.c:454:
> +        for(i =3D 0; i < 4; i++) {
>
> ERROR: braces {} are necessary for all arms of this statement
> #476: FILE: target/i386/cpu-dump.c:461:
> +        if ((unsigned)env->cc_op < CC_OP_NB)
> [...]
> +        else
> [...]
>
> WARNING: line over 80 characters
> #477: FILE: target/i386/cpu-dump.c:462:
> +            snprintf(cc_op_name, sizeof(cc_op_name), "%s", cc_op_str[env=
->cc_op]);
>
> ERROR: space required before the open parenthesis '('
> #497: FILE: target/i386/cpu-dump.c:482:
> +        for(i =3D 0; i < 8; i++) {
>
> ERROR: spaces required around that '=3D' (ctx:VxV)
> #507: FILE: target/i386/cpu-dump.c:492:
> +        for(i=3D0;i<8;i++) {
>               ^
>
> ERROR: space required after that ';' (ctx:VxV)
> #507: FILE: target/i386/cpu-dump.c:492:
> +        for(i=3D0;i<8;i++) {
>                 ^
>
> ERROR: spaces required around that '<' (ctx:VxV)
> #507: FILE: target/i386/cpu-dump.c:492:
> +        for(i=3D0;i<8;i++) {
>                   ^
>
> ERROR: space required after that ';' (ctx:VxV)
> #507: FILE: target/i386/cpu-dump.c:492:
> +        for(i=3D0;i<8;i++) {
>                     ^
>
> ERROR: space required before the open parenthesis '('
> #507: FILE: target/i386/cpu-dump.c:492:
> +        for(i=3D0;i<8;i++) {
>
> ERROR: braces {} are necessary for all arms of this statement
> #512: FILE: target/i386/cpu-dump.c:497:
> +            if ((i & 1) =3D=3D 1)
> [...]
> +            else
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #517: FILE: target/i386/cpu-dump.c:502:
> +        if (env->hflags & HF_CS64_MASK)
> [...]
> +        else
> [...]
>
> ERROR: spaces required around that '=3D' (ctx:VxV)
> #521: FILE: target/i386/cpu-dump.c:506:
> +        for(i=3D0;i<nb;i++) {
>               ^
>
> ERROR: space required after that ';' (ctx:VxV)
> #521: FILE: target/i386/cpu-dump.c:506:
> +        for(i=3D0;i<nb;i++) {
>                 ^
>
> ERROR: spaces required around that '<' (ctx:VxV)
> #521: FILE: target/i386/cpu-dump.c:506:
> +        for(i=3D0;i<nb;i++) {
>                   ^
>
> ERROR: space required after that ';' (ctx:VxV)
> #521: FILE: target/i386/cpu-dump.c:506:
> +        for(i=3D0;i<nb;i++) {
>                      ^
>
> ERROR: space required before the open parenthesis '('
> #521: FILE: target/i386/cpu-dump.c:506:
> +        for(i=3D0;i<nb;i++) {
>
> ERROR: braces {} are necessary for all arms of this statement
> #528: FILE: target/i386/cpu-dump.c:513:
> +            if ((i & 1) =3D=3D 1)
> [...]
> +            else
> [...]
>
> total: 25 errors, 5 warnings, 1077 lines checked
>
> Patch 9/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 10/32 Checking commit 0560b09d8481 (i386: move TCG cpu class initializati=
on out of helper.c)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #282:=20
> new file mode 100644
>
> total: 0 errors, 1 warnings, 610 lines checked
>
> Patch 10/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 11/32 Checking commit ac15b624a91f (tcg: cpu_exec_{enter,exit} helpers)
> 12/32 Checking commit b271ab48c45b (tcg: make CPUClass.cpu_exec_* optiona=
l)
> 13/32 Checking commit 043b89c9c315 (tcg: Make CPUClass.debug_excp_handler=
 optional)
> 14/32 Checking commit 8a0c2e9a0e2c (cpu: Remove unnecessary noop methods)
> 15/32 Checking commit 53b3f4e5b390 (cpu: Introduce TCGCpuOperations struc=
t)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #92:=20
> new file mode 100644
>
> total: 0 errors, 1 warnings, 301 lines checked
>
> Patch 15/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 16/32 Checking commit 2019e4f802bb (target/riscv: remove CONFIG_TCG, as i=
t is always TCG)
> 17/32 Checking commit f9b393d26c70 (accel/tcg: split TCG-only code from c=
pu_exec_realizefn)
> 18/32 Checking commit af729170f4b8 (cpu: Move synchronize_from_tb() to tc=
g_ops)
> 19/32 Checking commit 481a06e3b020 (cpu: Move cpu_exec_* to tcg_ops)
> 20/32 Checking commit bf5b24bcd22f (cpu: Move tlb_fill to tcg_ops)
> WARNING: line over 80 characters
> #22: FILE: accel/tcg/cputlb.c:1289:
> +    ok =3D cc->tcg_ops.tlb_fill(cpu, addr, size, access_type, mmu_idx, f=
alse, retaddr);
>
> total: 0 errors, 1 warnings, 259 lines checked
>
> Patch 20/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 21/32 Checking commit 9a74429f2029 (cpu: Move debug_excp_handler to tcg_o=
ps)
> 22/32 Checking commit f22d896967f8 (target/arm: do not use cc->do_interru=
pt for KVM directly)
> 23/32 Checking commit 74feabd5bae5 (cpu: move cc->do_interrupt to tcg_ops)
> 24/32 Checking commit bca539a6251e (cpu: move cc->transaction_failed to t=
cg_ops)
> WARNING: line over 80 characters
> #67: FILE: include/hw/core/cpu.h:857:
> +        cc->tcg_ops.do_transaction_failed(cpu, physaddr, addr, size, acc=
ess_type,
>
> total: 0 errors, 1 warnings, 144 lines checked
>
> Patch 24/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 25/32 Checking commit c45684ac5ad9 (cpu: move do_unaligned_access to tcg_=
ops)
> 26/32 Checking commit c3aa2224bd71 (accel: extend AccelState and AccelCla=
ss to user-mode)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #24:=20
> new file mode 100644
>
> total: 0 errors, 1 warnings, 359 lines checked
>
> Patch 26/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 27/32 Checking commit 706469ebcc15 (accel: replace struct CpusAccel with =
AccelOpsClass)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #115:=20
> new file mode 100644
>
> total: 0 errors, 1 warnings, 691 lines checked
>
> Patch 27/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 28/32 Checking commit 739ef2bd13aa (accel: introduce AccelCPUClass extend=
ing CPUClass)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #99:=20
> new file mode 100644
>
> total: 0 errors, 1 warnings, 123 lines checked
>
> Patch 28/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 29/32 Checking commit c7ecc117664f (i386: split cpu accelerators from cpu=
.c, using AccelCPUClass)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #664:=20
> new file mode 100644
>
> WARNING: line over 80 characters
> #1435: FILE: target/i386/tcg/cpu.c:104:
> +    memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as=
_mem, 0);
>
> total: 0 errors, 2 warnings, 1296 lines checked
>
> Patch 29/32 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 30/32 Checking commit 6c8c6a4d84dd (cpu: call AccelCPUClass::cpu_realizef=
n in cpu_exec_realizefn)
> 31/32 Checking commit 273e6bca6404 (hw/core/cpu: call qemu_init_vcpu in c=
pu_common_realizefn)
> 32/32 Checking commit 1df468eafd63 (cpu: introduce cpu_accel_instance_ini=
t)
> =3D=3D=3D OUTPUT END =3D=3D=3D
>
> Test command exited with code: 1
>
>
> The full log is available at
> http://patchew.org/logs/20201208194839.31305-1-cfontana@suse.de/testing.c=
heckpatch/?type=3Dmessage.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com


--=20
Alex Benn=C3=A9e

