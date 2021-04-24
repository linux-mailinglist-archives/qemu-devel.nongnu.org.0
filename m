Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55536A240
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:02:05 +0200 (CEST)
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLfQ-0001Cx-6o
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1laLdu-00007p-Qj
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:00:31 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:39714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1laLdq-0000TQ-H9
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:00:30 -0400
Received: by mail-qk1-x733.google.com with SMTP id e13so42845358qkl.6
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0ONt9Mc3xsmjeASnAUlR/VgM0ULJQqXgu0P7Dks4Z8=;
 b=1TPltidKQInjyUxiZYTw2E/QjWBjppUB710kfoGuWneGVeKksuzYlMtMdSeUGjg4q/
 WczWECO2WGoY/l5ar2Fjy8NjXWXzdsVoGI8UrEGRESIZXyNWGxfMlC74o2iCLKg+CvbE
 9O7QS7QgR4cy52dHQq15QVucH0ZkbbQ95NoQR4KE8h8nVdshH2tq7f2u0toaN5L3s3px
 ZAxo3PVG/pV46R898G0mOtIoH4LNycjhmMd7ZwPMF30YzL8v/Msk7I5TbkcCVnW63vP8
 y/Gvwbljae9QRyGfhGfF9UqyWhhWpHljpqmbnIYZnx7EriLxQwlHqVaWcTg98Ti6jFZC
 UVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0ONt9Mc3xsmjeASnAUlR/VgM0ULJQqXgu0P7Dks4Z8=;
 b=PsuYaxzs9WljbLAZYE5TelbE7F7IeAz54TF6UsYWYSGrkvTc66bDX4yeKMtzn5/Q1q
 EWqhfQiiwlLDFr2QzHhFcvCpUIMEMVGzsoegatT7IOj2QbZja6KFlOXYIsxMW0s24CZD
 S6mq+bxzOlr6KgTQ76WLDZr8llZmWam17TGc4kMZeSpikCZ7Uig7zGGDcy3lijzZV+53
 X4FRYtkF7PRWaFSmDbaezTWwDu4/pCH9To6mfl6s3trd47I752VlKn7E+LJO9BMHslSS
 +SGxqJ0is75pG8Oeje5liQ2123CXqHMpqDq5w0tGWiYdqdN7Y1KfkJX2no9dIrRFQlR1
 zOcA==
X-Gm-Message-State: AOAM531OnPwUH7idbEmtBZb7OXgmkO66yUrpmG0DRY4fkT4XGoNcSsji
 y2oo9YPJhSEnRe4PCKeXlCTC6ujdlNsZ+SDRnBMaw/BSclhyWRd9
X-Google-Smtp-Source: ABdhPJzpXnR8+1oepenIm0iwAa4N7h9TMq0CZ7HSaAzjP7nlHejBAVufP6vZ1rFQDnbICrowuAd+eh5R4rGL1JHu6aw=
X-Received: by 2002:a05:620a:24c5:: with SMTP id
 m5mr9588249qkn.195.1619283624846; 
 Sat, 24 Apr 2021 10:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210424160016.15200-1-imp@bsdimp.com>
 <161928329883.914.6777541491206073571@72b6d80f974b>
In-Reply-To: <161928329883.914.6777541491206073571@72b6d80f974b>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 24 Apr 2021 11:00:13 -0600
Message-ID: <CANCZdfqhzK1R8oZh+vsWG1cFbFSCJrQUtxcvH3hSA=c=P_UeFA@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] bsd-user style and reorg patches
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003ffa9c05c0bad915"
Received-SPF: none client-ip=2607:f8b0:4864:20::733;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Alex Richardson <arichardson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003ffa9c05c0bad915
Content-Type: text/plain; charset="UTF-8"

This is a false positive. The files were wrong before, so it's detecting
residual wrongness in the incremental changes.

The cumulative diff of all 48 patches passes with only warnings:

Use of uninitialized value $acpi_testexpected in string eq at ../scripts/
checkpatch.pl line 1529.
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#2:
new file mode 100644

WARNING: architecture specific defines should be avoided
#1641: FILE: bsd-user/freebsd/host_os.h:20:
+#ifndef __HOST_OS_H_

WARNING: architecture specific defines should be avoided
#3123: FILE: bsd-user/netbsd/host_os.h:20:
+#ifndef __HOST_OS_H_

WARNING: architecture specific defines should be avoided
#3154: FILE: bsd-user/openbsd/host_os.h:20:
+#ifndef __HOST_OS_H_

total: 0 errors, 4 warnings, 4264 lines checked

Warner

On Sat, Apr 24, 2021 at 10:55 AM <no-reply@patchew.org> wrote:

> Patchew URL:
> https://patchew.org/QEMU/20210424160016.15200-1-imp@bsdimp.com/
>
>
>
> Hi,
>
> This series seems to have some coding style problems. See output below for
> more information:
>
> Type: series
> Message-id: 20210424160016.15200-1-imp@bsdimp.com
> Subject: [PATCH v2 00/48] bsd-user style and reorg patches
>
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20210424160016.15200-1-imp@bsdimp.com ->
> patchew/20210424160016.15200-1-imp@bsdimp.com
> Switched to a new branch 'test'
> be1f8df bsd-user: put back a break; that had gone missing...
> 19b2708 bsd-user: style tweak: don't assign in if statement.
> 1bf13fe bsd-user: style tweak: Return is not a function call.
> de239a3 bsd-user: style tweak: Use preferred {} in if/else statements.
> cf2e30f bsd-user: style tweak: use preferred block comments
> 1a93628 bsd-user: style tweak: fold long lines
> 1448c0f bsd-user: style tweak: spaces around operators and commas
> 11e0aae bsd-user: style tweak: don't assign in if statements
> 2c53346 bsd-user: style tweak: Use preferred block comments
> 8946d14 bsd-user: style tweak: spaces around =, remove stray space
> ab7c026 bsd-user: style tweak: use {} for all if statements, format else
> correctly
> 3a3b578 bsd-user: style tweak: don't assign in if statements
> d32211e bsd-user: style tweak: Use preferred block comments
> 695b534 bsd-user: style tweak: use {} for all if statements, format else
> correctly
> eca311e bsd-user: style tweak: don't assign in if statements
> 45bfe91 bsd-user: style tweak: Use preferred block comments
> d00c21e bsd-user: style tweak: remove spacing after '*' and add after }
> 780e9f4 bsd-user: style tweak: use {} for all if statements, format else
> correctly
> e92240f bsd-user: style tweak: fix block comments
> cb3234a bsd-user: style tweak: use {} correctly
> 522e458 bsd-user: style tweak: comments
> e7e00a4 bsd-user: style tweak: space pedantry
> 55da1fd bsd-user: move sparc cpu_loop into target_arch_cpu.h as
> target_cpu_loop
> c546aa9 bsd-user: move x86 (i386 and x86_64) cpu_loop to target_arch_cpu.h
> f19b57e bsd-user: create target_arch_cpu.h
> 7ed989c bsd-user: introduce host_os.h for bsd-specific code and defaults
> 9cb365d bsd-user: use qemu_strtoul in preference to strtol
> 4454689 bsd-user: style nits: return is not a function
> 0c748d0 bsd-user: style tweak: use {} consistently in for / if / else
> statements
> 3ce10b8 bsd-user: style tweak: move extern to header file
> 3aa06bf bsd-user: style tweak: Use preferred block comments
> 2e4fcda bsd-user: style tweak: Fix commentary issues
> 4416126 bsd-user: style tweak: Put {} around all if/else/for statements
> dc7ae60 bsd-user: style tweak: return is not a function, eliminate ()
> b84160d bsd-user: style tweak: Remove #if 0'd code
> df39a25 bsd-user: style tweak: Remove #if 0'd code
> 9d92841 bsd-user: style tweak: Remove #if 0'd code
> 7ef0035 bsd-user: style tweak: Remove #if 0'd code
> 00a0b5e bsd-user: Remove commented out code
> c87209f bsd-user: style tweak: use C not C++ comments
> 1284f86 bsd-user: style tweak: use C not C++ comments
> afedaf7 bsd-user: style tweak: keyword space (
> d903536 bsd-user: style tweak: keyword space (
> a9aa3e4 bsd-user: style tweak: keyword space (
> 64b81a2 bsd-user: style tweak: keyword space (
> 1c1ed78 bsd-user: whitespace changes
> 3d281e8 bsd-user: whitespace changes
> 6f7ee37 bsd-user: whitespace changes
>
> === OUTPUT BEGIN ===
> 1/48 Checking commit 6f7ee37e5c9f (bsd-user: whitespace changes)
> 2/48 Checking commit 3d281e896a43 (bsd-user: whitespace changes)
> WARNING: line over 80 characters
> #149: FILE: bsd-user/elfload.c:541:
> +#define TARGET_ELF_PAGESTART(_v) ((_v) & ~(unsigned
> long)(TARGET_ELF_EXEC_PAGESIZE - 1))
>
> ERROR: braces {} are necessary for all arms of this statement
> #331: FILE: bsd-user/elfload.c:867:
> +    if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum >
> TARGET_PAGE_SIZE)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #341: FILE: bsd-user/elfload.c:873:
> +    if (!elf_phdata)
> [...]
>
> ERROR: space prohibited between function name and open parenthesis '('
> #382: FILE: bsd-user/elfload.c:894:
> +        free (elf_phdata);
>
> ERROR: spaces required around that '<' (ctx:VxV)
> #391: FILE: bsd-user/elfload.c:899:
> +    for (i = 0; i<interp_elf_ex->e_phnum; i++, eppnt++) {
>                   ^
>
> WARNING: Block comments use a leading /* on a separate line
> #409: FILE: bsd-user/elfload.c:905:
> +        /* in order to avoid hardcoding the interpreter load
>
> WARNING: Block comments use * on subsequent lines
> #410: FILE: bsd-user/elfload.c:906:
> +        /* in order to avoid hardcoding the interpreter load
> +           address in qemu, we allocate a big enough memory zone */
>
> WARNING: Block comments use a trailing */ on a separate line
> #410: FILE: bsd-user/elfload.c:906:
> +           address in qemu, we allocate a big enough memory zone */
>
> WARNING: line over 80 characters
> #442: FILE: bsd-user/elfload.c:934:
> +                                eppnt->p_filesz +
> TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr),
>
> WARNING: line over 80 characters
> #446: FILE: bsd-user/elfload.c:938:
> +                                eppnt->p_offset -
> TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr));
>
> ERROR: line over 90 characters
> #507: FILE: bsd-user/elfload.c:978:
> +    elf_bss = TARGET_ELF_PAGESTART(elf_bss + qemu_host_page_size - 1); /*
> What we have mapped so far */
>
> ERROR: space required after that ',' (ctx:VxV)
> #554: FILE: bsd-user/elfload.c:1186:
> +    bprm->p = copy_elf_strings(bprm->envc, bprm->envp,
> bprm->page,bprm->p);
>                                                                   ^
>
> ERROR: space required after that ',' (ctx:VxV)
> #555: FILE: bsd-user/elfload.c:1187:
> +    bprm->p = copy_elf_strings(bprm->argc, bprm->argv,
> bprm->page,bprm->p);
>                                                                   ^
>
> ERROR: space required after that ';' (ctx:VxV)
> #590: FILE: bsd-user/elfload.c:1230:
> +    for (i = 0;i < elf_ex.e_phnum; i++) {
>                ^
>
> ERROR: suspect code indent for conditional statements (12, 14)
> #626: FILE: bsd-user/elfload.c:1268:
> +            if (strcmp(elf_interpreter, "/usr/lib/libc.so.1") == 0 ||
> [...]
>                ibcs2_interpreter = 1;
>
> total: 9 errors, 6 warnings, 666 lines checked
>
> Patch 2/48 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 3/48 Checking commit 1c1ed7831e8a (bsd-user: whitespace changes)
> ERROR: consider using qemu_strtol in preference to strtol
> #102: FILE: bsd-user/main.c:835:
> +            guest_base = strtol(argv[optind++], NULL, 0);
>
> ERROR: braces {} are necessary for all arms of this statement
> #143: FILE: bsd-user/main.c:1126:
> +        for (i = 0; i < 8; i++)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #146: FILE: bsd-user/main.c:1128:
> +        for (i = 0; i < 8; i++)
> [...]
>
> total: 3 errors, 0 warnings, 119 lines checked
>
> Patch 3/48 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 4/48 Checking commit 64b81a2f81d0 (bsd-user: style tweak: keyword space ()
> 5/48 Checking commit a9aa3e409bd8 (bsd-user: style tweak: keyword space ()
> 6/48 Checking commit d903536bcaa8 (bsd-user: style tweak: keyword space ()
> ERROR: space required after that ';' (ctx:VxV)
> #32: FILE: bsd-user/syscall.c:274:
> +    for (i = 0;i < count; i++) {
>                ^
>
> ERROR: space required after that ';' (ctx:VxV)
> #41: FILE: bsd-user/syscall.c:300:
> +    for (i = 0;i < count; i++) {
>                ^
>
> total: 2 errors, 0 warnings, 60 lines checked
>
> Patch 6/48 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 7/48 Checking commit afedaf7c29e2 (bsd-user: style tweak: keyword space ()
> 8/48 Checking commit 1284f86e9b7b (bsd-user: style tweak: use C not C++
> comments)
> 9/48 Checking commit c87209f1f0f9 (bsd-user: style tweak: use C not C++
> comments)
> 10/48 Checking commit 00a0b5ee4157 (bsd-user: Remove commented out code)
> 11/48 Checking commit 7ef00352a15f (bsd-user: style tweak: Remove #if 0'd
> code)
> 12/48 Checking commit 9d92841f7d3a (bsd-user: style tweak: Remove #if 0'd
> code)
> 13/48 Checking commit df39a2547ed7 (bsd-user: style tweak: Remove #if 0'd
> code)
> 14/48 Checking commit b84160d0a3db (bsd-user: style tweak: Remove #if 0'd
> code)
> 15/48 Checking commit dc7ae6073667 (bsd-user: style tweak: return is not a
> function, eliminate ())
> 16/48 Checking commit 4416126bd67b (bsd-user: style tweak: Put {} around
> all if/else/for statements)
> 17/48 Checking commit 2e4fcdafda97 (bsd-user: style tweak: Fix commentary
> issues)
> 18/48 Checking commit 3aa06bf4a169 (bsd-user: style tweak: Use preferred
> block comments)
> 19/48 Checking commit 3ce10b8d1073 (bsd-user: style tweak: move extern to
> header file)
> 20/48 Checking commit 0c748d0a6ea1 (bsd-user: style tweak: use {}
> consistently in for / if / else statements)
> 21/48 Checking commit 4454689b7dff (bsd-user: style nits: return is not a
> function)
> 22/48 Checking commit 9cb365d13f71 (bsd-user: use qemu_strtoul in
> preference to strtol)
> 23/48 Checking commit 7ed989c1d383 (bsd-user: introduce host_os.h for
> bsd-specific code and defaults)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/
> checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #24:
> new file mode 100644
>
> WARNING: architecture specific defines should be avoided
> #48: FILE: bsd-user/freebsd/host_os.h:20:
> +#ifndef __HOST_OS_H_
>
> WARNING: architecture specific defines should be avoided
> #101: FILE: bsd-user/netbsd/host_os.h:20:
> +#ifndef __HOST_OS_H_
>
> WARNING: architecture specific defines should be avoided
> #132: FILE: bsd-user/openbsd/host_os.h:20:
> +#ifndef __HOST_OS_H_
>
> total: 0 errors, 4 warnings, 91 lines checked
>
> Patch 23/48 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 24/48 Checking commit f19b57e6a271 (bsd-user: create target_arch_cpu.h)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/
> checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #31:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 111 lines checked
>
> Patch 24/48 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 25/48 Checking commit c546aa906cbe (bsd-user: move x86 (i386 and x86_64)
> cpu_loop to target_arch_cpu.h)
> 26/48 Checking commit 55da1fd9d9a3 (bsd-user: move sparc cpu_loop into
> target_arch_cpu.h as target_cpu_loop)
> 27/48 Checking commit e7e00a4308a1 (bsd-user: style tweak: space pedantry)
> ERROR: spaces required around that '=' (ctx:WxV)
> #78: FILE: bsd-user/elfload.c:1226:
> +    start_data =n 0;
>                 ^
>
> total: 1 errors, 0 warnings, 73 lines checked
>
> Patch 27/48 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 28/48 Checking commit 522e4589fc17 (bsd-user: style tweak: comments)
> 29/48 Checking commit cb3234ad892f (bsd-user: style tweak: use {}
> correctly)
> 30/48 Checking commit e92240f03f40 (bsd-user: style tweak: fix block
> comments)
> 31/48 Checking commit 780e9f44ba8b (bsd-user: style tweak: use {} for all
> if statements, format else correctly)
> 32/48 Checking commit d00c21e0a91a (bsd-user: style tweak: remove spacing
> after '*' and add after })
> 33/48 Checking commit 45bfe917b433 (bsd-user: style tweak: Use preferred
> block comments)
> 34/48 Checking commit eca311e2127b (bsd-user: style tweak: don't assign in
> if statements)
> 35/48 Checking commit 695b53466022 (bsd-user: style tweak: use {} for all
> if statements, format else correctly)
> 36/48 Checking commit d32211e78858 (bsd-user: style tweak: Use preferred
> block comments)
> 37/48 Checking commit 3a3b578aff7b (bsd-user: style tweak: don't assign in
> if statements)
> 38/48 Checking commit ab7c026d39c0 (bsd-user: style tweak: use {} for all
> if statements, format else correctly)
> 39/48 Checking commit 8946d1425629 (bsd-user: style tweak: spaces around
> =, remove stray space)
> 40/48 Checking commit 2c5334681060 (bsd-user: style tweak: Use preferred
> block comments)
> 41/48 Checking commit 11e0aae47a39 (bsd-user: style tweak: don't assign in
> if statements)
> 42/48 Checking commit 1448c0f5067c (bsd-user: style tweak: spaces around
> operators and commas)
> WARNING: line over 80 characters
> #24: FILE: bsd-user/syscall.c:81:
> +                                        MAP_ANON | MAP_FIXED |
> MAP_PRIVATE, -1, 0));
>
> ERROR: line over 90 characters
> #85: FILE: bsd-user/syscall.c:396:
> +        ret = do_freebsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3,
> arg4, arg5, arg6, arg7, arg8, 0);
>
> WARNING: line over 80 characters
> #94: FILE: bsd-user/syscall.c:475:
> +        ret = do_netbsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4,
> arg5, arg6, 0);
>
> WARNING: line over 80 characters
> #103: FILE: bsd-user/syscall.c:554:
> +        ret = do_openbsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3,
> arg4, arg5, arg6, 0);
>
> total: 1 errors, 3 warnings, 81 lines checked
>
> Patch 42/48 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 43/48 Checking commit 1a936284fa25 (bsd-user: style tweak: fold long lines)
> 44/48 Checking commit cf2e30fc41ca (bsd-user: style tweak: use preferred
> block comments)
> 45/48 Checking commit de239a3b68bb (bsd-user: style tweak: Use preferred
> {} in if/else statements.)
> ERROR: do not use assignment in if condition
> #139: FILE: bsd-user/syscall.c:248:
> +    if (!(hnamep = lock_user(VERIFY_READ, namep, namelen, 1))) {
>
> ERROR: do not use assignment in if condition
> #143: FILE: bsd-user/syscall.c:251:
> +    if (newp && !(hnewp = lock_user(VERIFY_READ, newp, newlen, 1))) {
>
> ERROR: do not use assignment in if condition
> #147: FILE: bsd-user/syscall.c:254:
> +    if (!(holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0))) {
>
> ERROR: do not use assignment in if condition
> #210: FILE: bsd-user/syscall.c:371:
> +        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
>
> ERROR: do not use assignment in if condition
> #218: FILE: bsd-user/syscall.c:378:
> +        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
>
> ERROR: do not use assignment in if condition
> #238: FILE: bsd-user/syscall.c:398:
> +        if (!(p = lock_user_string(arg1))) {
>
> ERROR: do not use assignment in if condition
> #271: FILE: bsd-user/syscall.c:482:
> +        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
>
> ERROR: do not use assignment in if condition
> #279: FILE: bsd-user/syscall.c:489:
> +        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
>
> ERROR: do not use assignment in if condition
> #287: FILE: bsd-user/syscall.c:496:
> +        if (!(p = lock_user_string(arg1))) {
>
> ERROR: do not use assignment in if condition
> #320: FILE: bsd-user/syscall.c:568:
> +        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
>
> ERROR: do not use assignment in if condition
> #328: FILE: bsd-user/syscall.c:575:
> +        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
>
> ERROR: do not use assignment in if condition
> #336: FILE: bsd-user/syscall.c:582:
> +        if (!(p = lock_user_string(arg1))) {
>
> total: 12 errors, 0 warnings, 318 lines checked
>
> Patch 45/48 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 46/48 Checking commit 1bf13fe0ac6b (bsd-user: style tweak: Return is not a
> function call.)
> 47/48 Checking commit 19b2708a0763 (bsd-user: style tweak: don't assign in
> if statement.)
> 48/48 Checking commit be1f8df08151 (bsd-user: put back a break; that had
> gone missing...)
> === OUTPUT END ===
>
> Test command exited with code: 1
>
>
> The full log is available at
>
> http://patchew.org/logs/20210424160016.15200-1-imp@bsdimp.com/testing.checkpatch/?type=message
> .
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com

--0000000000003ffa9c05c0bad915
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is a false positive. The files were wrong before=
, so it&#39;s detecting residual wrongness in the incremental changes.</div=
><div><br></div><div>The cumulative diff of all 48 patches passes with only=
 warnings:</div><div><br></div><div>Use of uninitialized value $acpi_testex=
pected in string eq at ../scripts/<a href=3D"http://checkpatch.pl">checkpat=
ch.pl</a> line 1529.<br>WARNING: added, moved or deleted file(s), does MAIN=
TAINERS need updating?<br>#2:<br>new file mode 100644<br><br>WARNING: archi=
tecture specific defines should be avoided<br>#1641: FILE: bsd-user/freebsd=
/host_os.h:20:<br>+#ifndef __HOST_OS_H_<br><br>WARNING: architecture specif=
ic defines should be avoided<br>#3123: FILE: bsd-user/netbsd/host_os.h:20:<=
br>+#ifndef __HOST_OS_H_<br><br>WARNING: architecture specific defines shou=
ld be avoided<br>#3154: FILE: bsd-user/openbsd/host_os.h:20:<br>+#ifndef __=
HOST_OS_H_<br><br>total: 0 errors, 4 warnings, 4264 lines checked<br></div>=
<div><br></div><div>Warner<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Apr 24, 2021 at 10:55 AM &lt;<a href=
=3D"mailto:no-reply@patchew.org">no-reply@patchew.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Patchew URL: <a href=
=3D"https://patchew.org/QEMU/20210424160016.15200-1-imp@bsdimp.com/" rel=3D=
"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20210424160016.1520=
0-1-imp@bsdimp.com/</a><br>
<br>
<br>
<br>
Hi,<br>
<br>
This series seems to have some coding style problems. See output below for<=
br>
more information:<br>
<br>
Type: series<br>
Message-id: <a href=3D"mailto:20210424160016.15200-1-imp@bsdimp.com" target=
=3D"_blank">20210424160016.15200-1-imp@bsdimp.com</a><br>
Subject: [PATCH v2 00/48] bsd-user style and reorg patches<br>
<br>
=3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D<br>
#!/bin/bash<br>
git rev-parse base &gt; /dev/null || exit 0<br>
git config --local diff.renamelimit 0<br>
git config --local diff.renames True<br>
git config --local diff.algorithm histogram<br>
./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_bl=
ank">checkpatch.pl</a> --mailback base..<br>
=3D=3D=3D TEST SCRIPT END =3D=3D=3D<br>
<br>
Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384<br>
From <a href=3D"https://github.com/patchew-project/qemu" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/patchew-project/qemu</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:20210424160016.15200-1-imp@bsdimp.com" target=3D"_blank">20210424160016.1=
5200-1-imp@bsdimp.com</a> -&gt; patchew/<a href=3D"mailto:20210424160016.15=
200-1-imp@bsdimp.com" target=3D"_blank">20210424160016.15200-1-imp@bsdimp.c=
om</a><br>
Switched to a new branch &#39;test&#39;<br>
be1f8df bsd-user: put back a break; that had gone missing...<br>
19b2708 bsd-user: style tweak: don&#39;t assign in if statement.<br>
1bf13fe bsd-user: style tweak: Return is not a function call.<br>
de239a3 bsd-user: style tweak: Use preferred {} in if/else statements.<br>
cf2e30f bsd-user: style tweak: use preferred block comments<br>
1a93628 bsd-user: style tweak: fold long lines<br>
1448c0f bsd-user: style tweak: spaces around operators and commas<br>
11e0aae bsd-user: style tweak: don&#39;t assign in if statements<br>
2c53346 bsd-user: style tweak: Use preferred block comments<br>
8946d14 bsd-user: style tweak: spaces around =3D, remove stray space<br>
ab7c026 bsd-user: style tweak: use {} for all if statements, format else co=
rrectly<br>
3a3b578 bsd-user: style tweak: don&#39;t assign in if statements<br>
d32211e bsd-user: style tweak: Use preferred block comments<br>
695b534 bsd-user: style tweak: use {} for all if statements, format else co=
rrectly<br>
eca311e bsd-user: style tweak: don&#39;t assign in if statements<br>
45bfe91 bsd-user: style tweak: Use preferred block comments<br>
d00c21e bsd-user: style tweak: remove spacing after &#39;*&#39; and add aft=
er }<br>
780e9f4 bsd-user: style tweak: use {} for all if statements, format else co=
rrectly<br>
e92240f bsd-user: style tweak: fix block comments<br>
cb3234a bsd-user: style tweak: use {} correctly<br>
522e458 bsd-user: style tweak: comments<br>
e7e00a4 bsd-user: style tweak: space pedantry<br>
55da1fd bsd-user: move sparc cpu_loop into target_arch_cpu.h as target_cpu_=
loop<br>
c546aa9 bsd-user: move x86 (i386 and x86_64) cpu_loop to target_arch_cpu.h<=
br>
f19b57e bsd-user: create target_arch_cpu.h<br>
7ed989c bsd-user: introduce host_os.h for bsd-specific code and defaults<br=
>
9cb365d bsd-user: use qemu_strtoul in preference to strtol<br>
4454689 bsd-user: style nits: return is not a function<br>
0c748d0 bsd-user: style tweak: use {} consistently in for / if / else state=
ments<br>
3ce10b8 bsd-user: style tweak: move extern to header file<br>
3aa06bf bsd-user: style tweak: Use preferred block comments<br>
2e4fcda bsd-user: style tweak: Fix commentary issues<br>
4416126 bsd-user: style tweak: Put {} around all if/else/for statements<br>
dc7ae60 bsd-user: style tweak: return is not a function, eliminate ()<br>
b84160d bsd-user: style tweak: Remove #if 0&#39;d code<br>
df39a25 bsd-user: style tweak: Remove #if 0&#39;d code<br>
9d92841 bsd-user: style tweak: Remove #if 0&#39;d code<br>
7ef0035 bsd-user: style tweak: Remove #if 0&#39;d code<br>
00a0b5e bsd-user: Remove commented out code<br>
c87209f bsd-user: style tweak: use C not C++ comments<br>
1284f86 bsd-user: style tweak: use C not C++ comments<br>
afedaf7 bsd-user: style tweak: keyword space (<br>
d903536 bsd-user: style tweak: keyword space (<br>
a9aa3e4 bsd-user: style tweak: keyword space (<br>
64b81a2 bsd-user: style tweak: keyword space (<br>
1c1ed78 bsd-user: whitespace changes<br>
3d281e8 bsd-user: whitespace changes<br>
6f7ee37 bsd-user: whitespace changes<br>
<br>
=3D=3D=3D OUTPUT BEGIN =3D=3D=3D<br>
1/48 Checking commit 6f7ee37e5c9f (bsd-user: whitespace changes)<br>
2/48 Checking commit 3d281e896a43 (bsd-user: whitespace changes)<br>
WARNING: line over 80 characters<br>
#149: FILE: bsd-user/elfload.c:541:<br>
+#define TARGET_ELF_PAGESTART(_v) ((_v) &amp; ~(unsigned long)(TARGET_ELF_E=
XEC_PAGESIZE - 1))<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#331: FILE: bsd-user/elfload.c:867:<br>
+=C2=A0 =C2=A0 if (sizeof(struct elf_phdr) * interp_elf_ex-&gt;e_phnum &gt;=
 TARGET_PAGE_SIZE)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#341: FILE: bsd-user/elfload.c:873:<br>
+=C2=A0 =C2=A0 if (!elf_phdata)<br>
[...]<br>
<br>
ERROR: space prohibited between function name and open parenthesis &#39;(&#=
39;<br>
#382: FILE: bsd-user/elfload.c:894:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free (elf_phdata);<br>
<br>
ERROR: spaces required around that &#39;&lt;&#39; (ctx:VxV)<br>
#391: FILE: bsd-user/elfload.c:899:<br>
+=C2=A0 =C2=A0 for (i =3D 0; i&lt;interp_elf_ex-&gt;e_phnum; i++, eppnt++) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
<br>
WARNING: Block comments use a leading /* on a separate line<br>
#409: FILE: bsd-user/elfload.c:905:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* in order to avoid hardcoding the interprete=
r load<br>
<br>
WARNING: Block comments use * on subsequent lines<br>
#410: FILE: bsd-user/elfload.c:906:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* in order to avoid hardcoding the interprete=
r load<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address in qemu, we allocate a bi=
g enough memory zone */<br>
<br>
WARNING: Block comments use a trailing */ on a separate line<br>
#410: FILE: bsd-user/elfload.c:906:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address in qemu, we allocate a bi=
g enough memory zone */<br>
<br>
WARNING: line over 80 characters<br>
#442: FILE: bsd-user/elfload.c:934:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eppnt-&gt;p_filesz + TARGET_ELF_PAGE=
OFFSET(eppnt-&gt;p_vaddr),<br>
<br>
WARNING: line over 80 characters<br>
#446: FILE: bsd-user/elfload.c:938:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eppnt-&gt;p_offset - TARGET_ELF_PAGE=
OFFSET(eppnt-&gt;p_vaddr));<br>
<br>
ERROR: line over 90 characters<br>
#507: FILE: bsd-user/elfload.c:978:<br>
+=C2=A0 =C2=A0 elf_bss =3D TARGET_ELF_PAGESTART(elf_bss + qemu_host_page_si=
ze - 1); /* What we have mapped so far */<br>
<br>
ERROR: space required after that &#39;,&#39; (ctx:VxV)<br>
#554: FILE: bsd-user/elfload.c:1186:<br>
+=C2=A0 =C2=A0 bprm-&gt;p =3D copy_elf_strings(bprm-&gt;envc, bprm-&gt;envp=
, bprm-&gt;page,bprm-&gt;p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
<br>
ERROR: space required after that &#39;,&#39; (ctx:VxV)<br>
#555: FILE: bsd-user/elfload.c:1187:<br>
+=C2=A0 =C2=A0 bprm-&gt;p =3D copy_elf_strings(bprm-&gt;argc, bprm-&gt;argv=
, bprm-&gt;page,bprm-&gt;p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
<br>
ERROR: space required after that &#39;;&#39; (ctx:VxV)<br>
#590: FILE: bsd-user/elfload.c:1230:<br>
+=C2=A0 =C2=A0 for (i =3D 0;i &lt; elf_ex.e_phnum; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
ERROR: suspect code indent for conditional statements (12, 14)<br>
#626: FILE: bsd-user/elfload.c:1268:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(elf_interpreter, &quo=
t;/usr/lib/libc.so.1&quot;) =3D=3D 0 ||<br>
[...]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibcs2_interpreter =
=3D 1;<br>
<br>
total: 9 errors, 6 warnings, 666 lines checked<br>
<br>
Patch 2/48 has style problems, please review.=C2=A0 If any of these errors<=
br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
3/48 Checking commit 1c1ed7831e8a (bsd-user: whitespace changes)<br>
ERROR: consider using qemu_strtol in preference to strtol<br>
#102: FILE: bsd-user/main.c:835:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_base =3D strtol(argv[optin=
d++], NULL, 0);<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#143: FILE: bsd-user/main.c:1126:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 8; i++)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#146: FILE: bsd-user/main.c:1128:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 8; i++)<br>
[...]<br>
<br>
total: 3 errors, 0 warnings, 119 lines checked<br>
<br>
Patch 3/48 has style problems, please review.=C2=A0 If any of these errors<=
br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
4/48 Checking commit 64b81a2f81d0 (bsd-user: style tweak: keyword space ()<=
br>
5/48 Checking commit a9aa3e409bd8 (bsd-user: style tweak: keyword space ()<=
br>
6/48 Checking commit d903536bcaa8 (bsd-user: style tweak: keyword space ()<=
br>
ERROR: space required after that &#39;;&#39; (ctx:VxV)<br>
#32: FILE: bsd-user/syscall.c:274:<br>
+=C2=A0 =C2=A0 for (i =3D 0;i &lt; count; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
ERROR: space required after that &#39;;&#39; (ctx:VxV)<br>
#41: FILE: bsd-user/syscall.c:300:<br>
+=C2=A0 =C2=A0 for (i =3D 0;i &lt; count; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
total: 2 errors, 0 warnings, 60 lines checked<br>
<br>
Patch 6/48 has style problems, please review.=C2=A0 If any of these errors<=
br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
7/48 Checking commit afedaf7c29e2 (bsd-user: style tweak: keyword space ()<=
br>
8/48 Checking commit 1284f86e9b7b (bsd-user: style tweak: use C not C++ com=
ments)<br>
9/48 Checking commit c87209f1f0f9 (bsd-user: style tweak: use C not C++ com=
ments)<br>
10/48 Checking commit 00a0b5ee4157 (bsd-user: Remove commented out code)<br=
>
11/48 Checking commit 7ef00352a15f (bsd-user: style tweak: Remove #if 0&#39=
;d code)<br>
12/48 Checking commit 9d92841f7d3a (bsd-user: style tweak: Remove #if 0&#39=
;d code)<br>
13/48 Checking commit df39a2547ed7 (bsd-user: style tweak: Remove #if 0&#39=
;d code)<br>
14/48 Checking commit b84160d0a3db (bsd-user: style tweak: Remove #if 0&#39=
;d code)<br>
15/48 Checking commit dc7ae6073667 (bsd-user: style tweak: return is not a =
function, eliminate ())<br>
16/48 Checking commit 4416126bd67b (bsd-user: style tweak: Put {} around al=
l if/else/for statements)<br>
17/48 Checking commit 2e4fcdafda97 (bsd-user: style tweak: Fix commentary i=
ssues)<br>
18/48 Checking commit 3aa06bf4a169 (bsd-user: style tweak: Use preferred bl=
ock comments)<br>
19/48 Checking commit 3ce10b8d1073 (bsd-user: style tweak: move extern to h=
eader file)<br>
20/48 Checking commit 0c748d0a6ea1 (bsd-user: style tweak: use {} consisten=
tly in for / if / else statements)<br>
21/48 Checking commit 4454689b7dff (bsd-user: style nits: return is not a f=
unction)<br>
22/48 Checking commit 9cb365d13f71 (bsd-user: use qemu_strtoul in preferenc=
e to strtol)<br>
23/48 Checking commit 7ed989c1d383 (bsd-user: introduce host_os.h for bsd-s=
pecific code and defaults)<br>
Use of uninitialized value $acpi_testexpected in string eq at ./scripts/<a =
href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpat=
ch.pl</a> line 1529.<br>
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?<b=
r>
#24: <br>
new file mode 100644<br>
<br>
WARNING: architecture specific defines should be avoided<br>
#48: FILE: bsd-user/freebsd/host_os.h:20:<br>
+#ifndef __HOST_OS_H_<br>
<br>
WARNING: architecture specific defines should be avoided<br>
#101: FILE: bsd-user/netbsd/host_os.h:20:<br>
+#ifndef __HOST_OS_H_<br>
<br>
WARNING: architecture specific defines should be avoided<br>
#132: FILE: bsd-user/openbsd/host_os.h:20:<br>
+#ifndef __HOST_OS_H_<br>
<br>
total: 0 errors, 4 warnings, 91 lines checked<br>
<br>
Patch 23/48 has style problems, please review.=C2=A0 If any of these errors=
<br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
24/48 Checking commit f19b57e6a271 (bsd-user: create target_arch_cpu.h)<br>
Use of uninitialized value $acpi_testexpected in string eq at ./scripts/<a =
href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpat=
ch.pl</a> line 1529.<br>
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?<b=
r>
#31: <br>
new file mode 100644<br>
<br>
total: 0 errors, 1 warnings, 111 lines checked<br>
<br>
Patch 24/48 has style problems, please review.=C2=A0 If any of these errors=
<br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
25/48 Checking commit c546aa906cbe (bsd-user: move x86 (i386 and x86_64) cp=
u_loop to target_arch_cpu.h)<br>
26/48 Checking commit 55da1fd9d9a3 (bsd-user: move sparc cpu_loop into targ=
et_arch_cpu.h as target_cpu_loop)<br>
27/48 Checking commit e7e00a4308a1 (bsd-user: style tweak: space pedantry)<=
br>
ERROR: spaces required around that &#39;=3D&#39; (ctx:WxV)<br>
#78: FILE: bsd-user/elfload.c:1226:<br>
+=C2=A0 =C2=A0 start_data =3Dn 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
<br>
total: 1 errors, 0 warnings, 73 lines checked<br>
<br>
Patch 27/48 has style problems, please review.=C2=A0 If any of these errors=
<br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
28/48 Checking commit 522e4589fc17 (bsd-user: style tweak: comments)<br>
29/48 Checking commit cb3234ad892f (bsd-user: style tweak: use {} correctly=
)<br>
30/48 Checking commit e92240f03f40 (bsd-user: style tweak: fix block commen=
ts)<br>
31/48 Checking commit 780e9f44ba8b (bsd-user: style tweak: use {} for all i=
f statements, format else correctly)<br>
32/48 Checking commit d00c21e0a91a (bsd-user: style tweak: remove spacing a=
fter &#39;*&#39; and add after })<br>
33/48 Checking commit 45bfe917b433 (bsd-user: style tweak: Use preferred bl=
ock comments)<br>
34/48 Checking commit eca311e2127b (bsd-user: style tweak: don&#39;t assign=
 in if statements)<br>
35/48 Checking commit 695b53466022 (bsd-user: style tweak: use {} for all i=
f statements, format else correctly)<br>
36/48 Checking commit d32211e78858 (bsd-user: style tweak: Use preferred bl=
ock comments)<br>
37/48 Checking commit 3a3b578aff7b (bsd-user: style tweak: don&#39;t assign=
 in if statements)<br>
38/48 Checking commit ab7c026d39c0 (bsd-user: style tweak: use {} for all i=
f statements, format else correctly)<br>
39/48 Checking commit 8946d1425629 (bsd-user: style tweak: spaces around =
=3D, remove stray space)<br>
40/48 Checking commit 2c5334681060 (bsd-user: style tweak: Use preferred bl=
ock comments)<br>
41/48 Checking commit 11e0aae47a39 (bsd-user: style tweak: don&#39;t assign=
 in if statements)<br>
42/48 Checking commit 1448c0f5067c (bsd-user: style tweak: spaces around op=
erators and commas)<br>
WARNING: line over 80 characters<br>
#24: FILE: bsd-user/syscall.c:81:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_ANON=
 | MAP_FIXED | MAP_PRIVATE, -1, 0));<br>
<br>
ERROR: line over 90 characters<br>
#85: FILE: bsd-user/syscall.c:396:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_freebsd_syscall(cpu_env, arg1 &amp;=
 0xffff, arg2, arg3, arg4, arg5, arg6, arg7, arg8, 0);<br>
<br>
WARNING: line over 80 characters<br>
#94: FILE: bsd-user/syscall.c:475:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_netbsd_syscall(cpu_env, arg1 &amp; =
0xffff, arg2, arg3, arg4, arg5, arg6, 0);<br>
<br>
WARNING: line over 80 characters<br>
#103: FILE: bsd-user/syscall.c:554:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_openbsd_syscall(cpu_env, arg1 &amp;=
 0xffff, arg2, arg3, arg4, arg5, arg6, 0);<br>
<br>
total: 1 errors, 3 warnings, 81 lines checked<br>
<br>
Patch 42/48 has style problems, please review.=C2=A0 If any of these errors=
<br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
43/48 Checking commit 1a936284fa25 (bsd-user: style tweak: fold long lines)=
<br>
44/48 Checking commit cf2e30fc41ca (bsd-user: style tweak: use preferred bl=
ock comments)<br>
45/48 Checking commit de239a3b68bb (bsd-user: style tweak: Use preferred {}=
 in if/else statements.)<br>
ERROR: do not use assignment in if condition<br>
#139: FILE: bsd-user/syscall.c:248:<br>
+=C2=A0 =C2=A0 if (!(hnamep =3D lock_user(VERIFY_READ, namep, namelen, 1)))=
 {<br>
<br>
ERROR: do not use assignment in if condition<br>
#143: FILE: bsd-user/syscall.c:251:<br>
+=C2=A0 =C2=A0 if (newp &amp;&amp; !(hnewp =3D lock_user(VERIFY_READ, newp,=
 newlen, 1))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#147: FILE: bsd-user/syscall.c:254:<br>
+=C2=A0 =C2=A0 if (!(holdp =3D lock_user(VERIFY_WRITE, oldp, oldlen, 0))) {=
<br>
<br>
ERROR: do not use assignment in if condition<br>
#210: FILE: bsd-user/syscall.c:371:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user(VERIFY_WRITE, arg2, arg3=
, 0))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#218: FILE: bsd-user/syscall.c:378:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user(VERIFY_READ, arg2, arg3,=
 1))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#238: FILE: bsd-user/syscall.c:398:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user_string(arg1))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#271: FILE: bsd-user/syscall.c:482:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user(VERIFY_WRITE, arg2, arg3=
, 0))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#279: FILE: bsd-user/syscall.c:489:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user(VERIFY_READ, arg2, arg3,=
 1))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#287: FILE: bsd-user/syscall.c:496:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user_string(arg1))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#320: FILE: bsd-user/syscall.c:568:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user(VERIFY_WRITE, arg2, arg3=
, 0))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#328: FILE: bsd-user/syscall.c:575:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user(VERIFY_READ, arg2, arg3,=
 1))) {<br>
<br>
ERROR: do not use assignment in if condition<br>
#336: FILE: bsd-user/syscall.c:582:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user_string(arg1))) {<br>
<br>
total: 12 errors, 0 warnings, 318 lines checked<br>
<br>
Patch 45/48 has style problems, please review.=C2=A0 If any of these errors=
<br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
46/48 Checking commit 1bf13fe0ac6b (bsd-user: style tweak: Return is not a =
function call.)<br>
47/48 Checking commit 19b2708a0763 (bsd-user: style tweak: don&#39;t assign=
 in if statement.)<br>
48/48 Checking commit be1f8df08151 (bsd-user: put back a break; that had go=
ne missing...)<br>
=3D=3D=3D OUTPUT END =3D=3D=3D<br>
<br>
Test command exited with code: 1<br>
<br>
<br>
The full log is available at<br>
<a href=3D"http://patchew.org/logs/20210424160016.15200-1-imp@bsdimp.com/te=
sting.checkpatch/?type=3Dmessage" rel=3D"noreferrer" target=3D"_blank">http=
://patchew.org/logs/20210424160016.15200-1-imp@bsdimp.com/testing.checkpatc=
h/?type=3Dmessage</a>.<br>
---<br>
Email generated automatically by Patchew [<a href=3D"https://patchew.org/" =
rel=3D"noreferrer" target=3D"_blank">https://patchew.org/</a>].<br>
Please send your feedback to <a href=3D"mailto:patchew-devel@redhat.com" ta=
rget=3D"_blank">patchew-devel@redhat.com</a></blockquote></div></div>

--0000000000003ffa9c05c0bad915--

