Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8121260030A
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 21:57:47 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok9lZ-0007uq-L1
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 15:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ok9fE-0004GF-70
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 15:51:12 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ok9f9-0005an-Pu
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 15:51:09 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id b145so11233022yba.0
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cyvAJXXuBmUA3TCe4fs0DflZiALHevHhuKzfXEPvf4E=;
 b=LKRpvLbQ3SmUTsDHEOicbkTcxS54wujiA3RYymNWo3mJC9Rt9Nakzpjt7oMqOJmEK4
 Ycd57YqGB1g2YC0Z9g7Fz264clg1TjJRVxy1pau5o3Fc4ju8CvxSJal44IrZi8C6SRje
 Xuq6kF3IUZL4YF60EdMRz3UUUexVAULRMQXYe7YE4XLJ+rweiCW/ClJN/SA+TbjO9wTh
 phZg3MesZqMZJr609Gz8nULDVGvWNK+J4uZzY6DVdlyy5DIfZFcRlnxyAlQrgWykahiH
 aZrrRV4OglrgfKKuKnjEE197MOhAlUD4MSn1k/CZYaUKdAdqBubd8+H3hfkM6x7z5mRU
 z/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cyvAJXXuBmUA3TCe4fs0DflZiALHevHhuKzfXEPvf4E=;
 b=CFcCnqlSlULZrfKGw2U30n71Pe2JfV8pBevtfI/yfwzFLUguaL6WpmjNNjXyP5qZqo
 BQf9RGkQ9DVU5rBZO70uepSdw9j5P0BdPQ4lPxNwb0s4xnZn8nlpb0w2scQF4x4r5Kcd
 KYTt0arW/dGZk7lh2pJD6FAkvjhlA9cRGuqGY4z7N3cwo3EB/1AmDJLhQCcGiRp3HVTd
 yNwkLORPEF/bMWHadEo/R8zaY1OkYyqi394AUVImB2pupMCy733OyOVy6Dq3pB+TSooT
 Yyhwf+KtIet7P0oeONtyaSpT04QjV8H+sflKD68uqHbsfzyEakXkV+Ey3yzSSpI5Dve2
 IuGw==
X-Gm-Message-State: ACrzQf2r8Bg2aoBHizI31n9s/KzcEJe6I/ZdkmEnfnZX6zSoaUFawkJl
 yKaDZbwnk+5PHi/0bkFR8CSc1xfXcK61doKQEvs=
X-Google-Smtp-Source: AMsMyM6I5mW/oBKHPLyDlFq9p+zmYpBeMS8OuwCLEuiS2jvLJuE9pefNdHC7623y9nPwT/qSU9+LWClpoXLxM/gqUo0=
X-Received: by 2002:a25:4fc1:0:b0:6bc:c570:f99e with SMTP id
 d184-20020a254fc1000000b006bcc570f99emr6668070ybb.58.1665949866205; Sun, 16
 Oct 2022 12:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221014072356.2075517-1-laurent@vivier.eu>
In-Reply-To: <20221014072356.2075517-1-laurent@vivier.eu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 16 Oct 2022 15:50:54 -0400
Message-ID: <CAJSP0QWcxLFQnrsqJxVw4k1-bsnq1XVGFQj12FLpAi5ar397VQ@mail.gmail.com>
Subject: Re: [PULL 0/2] M68k for 7.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 14 Oct 2022 at 03:26, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:
>
>   Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request
>
> for you to fetch changes up to fa327be58280f76d2565ff0bdb9b0010ac97c3b0:
>
>   m68k: write bootinfo as rom section and re-randomize on reboot (2022-10-11 23:02:46 +0200)
>
> ----------------------------------------------------------------
> Pull request m68k branch 20221014
>
> Update rng seed boot parameter
>
> ----------------------------------------------------------------
>
> Jason A. Donenfeld (2):
>   m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
>   m68k: write bootinfo as rom section and re-randomize on reboot

This commit breaks mingw64 due to the Windows LLP64 data model where
pointers don't fit into unsigned long
(https://en.wikipedia.org/wiki/LP64#64-bit_data_models). Please use
uintptr_t instead of unsigned long:

x86_64-w64-mingw32-gcc -m64 -mcx16 -Ilibqemu-m68k-softmmu.fa.p -I.
-I.. -Itarget/m68k -I../target/m68k -Iqapi -Itrace -Iui -Iui/shader
-I/usr/x86_64-w64-mingw32/sys-root/mingw/include/pixman-1
-I/usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0
-I/usr/x86_64-w64-mingw32/sys-root/mingw/lib/glib-2.0/include
-fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
-iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -mms-bitfields -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=2 -fno-pie -no-pie -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
-fstack-protector-strong -DNEED_CPU_H
'-DCONFIG_TARGET="m68k-softmmu-config-target.h"'
'-DCONFIG_DEVICES="m68k-softmmu-config-devices.h"' -MD -MQ
libqemu-m68k-softmmu.fa.p/hw_m68k_virt.c.obj -MF
libqemu-m68k-softmmu.fa.p/hw_m68k_virt.c.obj.d -o
libqemu-m68k-softmmu.fa.p/hw_m68k_virt.c.obj -c ../hw/m68k/virt.c
In file included from ../hw/m68k/virt.c:23:
../hw/m68k/virt.c: In function 'virt_init':
../hw/m68k/bootinfo.h:58:26: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
58 | base = (void *)(((unsigned long)base + 3) & ~3); \
| ^
../hw/m68k/virt.c:261:13: note: in expansion of macro 'BOOTINFOSTR'
261 | BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
| ^~~~~~~~~~~
../hw/m68k/bootinfo.h:58:16: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
58 | base = (void *)(((unsigned long)base + 3) & ~3); \
| ^
../hw/m68k/virt.c:261:13: note: in expansion of macro 'BOOTINFOSTR'
261 | BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
| ^~~~~~~~~~~
../hw/m68k/bootinfo.h:75:26: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
75 | base = (void *)(((unsigned long)base + 3) & ~3); \
| ^
../hw/m68k/virt.c:268:9: note: in expansion of macro 'BOOTINFODATA'
268 | BOOTINFODATA(param_ptr, BI_RNG_SEED,
| ^~~~~~~~~~~~
../hw/m68k/bootinfo.h:75:16: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
75 | base = (void *)(((unsigned long)base + 3) & ~3); \
| ^
../hw/m68k/virt.c:268:9: note: in expansion of macro 'BOOTINFODATA'
268 | BOOTINFODATA(param_ptr, BI_RNG_SEED,
| ^~~~~~~~~~~~
cc1: all warnings being treated as errors

https://gitlab.com/qemu-project/qemu/-/jobs/3179717070

>
>  hw/m68k/bootinfo.h                            | 48 ++++++------
>  .../standard-headers/asm-m68k/bootinfo-virt.h |  4 +-
>  include/standard-headers/asm-m68k/bootinfo.h  |  8 +-
>  hw/m68k/q800.c                                | 76 ++++++++++++++-----
>  hw/m68k/virt.c                                | 57 +++++++++-----
>  5 files changed, 130 insertions(+), 63 deletions(-)
>
> --
> 2.37.3
>
>

