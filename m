Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6960B638
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 20:51:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on29U-0007v4-75; Mon, 24 Oct 2022 14:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1on29N-0007tY-28; Mon, 24 Oct 2022 14:26:14 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1on29J-0008Cv-Sn; Mon, 24 Oct 2022 14:26:11 -0400
Received: by mail-yb1-xb29.google.com with SMTP id j130so11939572ybj.9;
 Mon, 24 Oct 2022 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNgPj93p4VRr0lMTW+WU4brgUB6WbXANf2TPWcveTzQ=;
 b=QVBUT8gogvK+8tecj/0cbiXsuXurmUePDg8FRnzk/V+nVwAMp603kbIels74qgPvMb
 zAmhHN9EaANX4MLci/+LffwE5M9ibTWcWujRNmZjobLjch9Y+FgyVbZ4/TNd+gaVStch
 3yc5gkYOyOr4ukjD0FnZXQCaqbmBdSrL/a565+XgWSbOrvh9x99PPegfsxp+/d1HlV6K
 wldOO+1g3XXWU3/AtKjvvNVxqc0v21o9hy1+1IFPE8HPrKSJ8qfIMf3Ett/ZwaaRRooQ
 vDU3P77KsBSCOPeWeOZ7qGUbz/iDfQ2ltPwCxoIHxOlLmJ3pWFwPYwtEBgTjHNCWi81A
 wTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNgPj93p4VRr0lMTW+WU4brgUB6WbXANf2TPWcveTzQ=;
 b=0RUIxyHUUWkaG5tJiK9edVUg43/JAXJ1nJvSkvq9eMe7z7DLw8q9W8tuWP/6SrSC5h
 g7buhmJnPB/8g5Y98VtOZuE+cysFrOurvrpkD4tVxKhNjIIzfiIWcLKe46wSn7XrfXuB
 qkfYqlC3vIxhxCZAk2zMSpJulhDfQpLQMp+TYzTMXedijXsoREJNlH/lW9cyLWaEmzJk
 1IFRSPgYwyaei/iI37KhpgTsZwz5BXls54hy86ghrzff2EuE2jWNSFrGhL51HqOoCqXf
 zZwvNM416W13NQFuLDBfm6zZYgJUtWR1k4+BkZLX2ee7jQnLLx7c8/6Mwv9JBtcZljhH
 pfuA==
X-Gm-Message-State: ACrzQf2Oon/KSV7xx0tVE8wJX7+dUuukZ8uSi0KHVOS/iJkT+FFWsDl2
 F0cXwfwusd+etM1ggw5y6KW5KMozwpDrvgxSa74=
X-Google-Smtp-Source: AMsMyM4lSIQcWx1k86MWEPndPAHLIslfd5rsHeTuJ7FDwTSun/Pb6m4og6gszaCso9KRGDaUkKg/GNKrH9otU6PY5LA=
X-Received: by 2002:a25:d210:0:b0:6cb:47d1:8738 with SMTP id
 j16-20020a25d210000000b006cb47d18738mr2264966ybg.207.1666635966537; Mon, 24
 Oct 2022 11:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221021130549.111864-1-marcandre.lureau@redhat.com>
In-Reply-To: <20221021130549.111864-1-marcandre.lureau@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 24 Oct 2022 14:25:54 -0400
Message-ID: <CAJSP0QW6GEJwnusABn4VwY_DFaq4c6idR06eJtG_yZSHsuFWew@mail.gmail.com>
Subject: Re: [PULL 00/11] Dump patches
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, 
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Oct 2022 at 09:37, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 0529245488865038344d64fff7ee05864d3d17=
f6:
>
>   Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/dump-pull-request
>
> for you to fetch changes up to c70f4916a9fc03d70a7d65f4ec59da6c07f1d560:
>
>   dump/win_dump: limit number of processed PRCBs (2022-10-21 16:48:50 +04=
00)
>
> ----------------------------------------------------------------
> dump queue
>
> Hi
>
> The "dump" queue, with:
> - [PATCH v6/v7 00/10] dump: Add arch section and s390x PV dump
> - [PATCH] dump/win_dump: limit number of processed PRCBs

Please check the following s390 compilation issue:

cc -m64 -mcx16 -Ilibqemu-s390x-softmmu.fa.p -I. -I.. -Itarget/s390x
-I../target/s390x -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/pixman-1 -I/usr/include/capstone
-I/usr/include/spice-server -I/usr/include/spice-1
-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
-fdiagnostics-color=3Dauto --coverage -Wall -Winvalid-pch -Werror
-std=3Dgnu11 -O2 -g -isystem /builds/qemu-project/qemu/linux-headers
-isystem linux-headers -iquote . -iquote /builds/qemu-project/qemu
-iquote /builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -p -fPIE
-isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET=3D"s390x-softmmu-config-target.h"'
'-DCONFIG_DEVICES=3D"s390x-softmmu-config-devices.h"' -MD -MQ
libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o -MF
libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o.d -o
libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o -c
../target/s390x/arch_dump.c
../target/s390x/arch_dump.c: In function =E2=80=98s390x_write_elf64_pv=E2=
=80=99:
../target/s390x/arch_dump.c:195:5: error: too few arguments to
function =E2=80=98kvm_s390_dump_cpu=E2=80=99
195 | kvm_s390_dump_cpu(cpu, &note->contents.dynamic);
| ^~~~~~~~~~~~~~~~~
In file included from ../target/s390x/arch_dump.c:20:
/builds/qemu-project/qemu/include/hw/s390x/pv.h:74:19: note: declared here
74 | static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff,
size_t len) { return 0; }
| ^~~~~~~~~~~~~~~~~

https://gitlab.com/qemu-project/qemu/-/jobs/3218295751

Thanks,
Stefan

>
> ----------------------------------------------------------------
>
> Janosch Frank (10):
>   dump: Use a buffer for ELF section data and headers
>   dump: Write ELF section headers right after ELF header
>   dump: Reorder struct DumpState
>   dump: Reintroduce memory_offset and section_offset
>   dump: Add architecture section and section string table support
>   s390x: Add protected dump cap
>   s390x: Introduce PV query interface
>   include/elf.h: add s390x note types
>   s390x: Add KVM PV dump interface
>   s390x: pv: Add dump support
>
> Viktor Prutyanov (1):
>   dump/win_dump: limit number of processed PRCBs
>
>  include/elf.h                |   2 +
>  include/hw/s390x/pv.h        |  19 +++
>  include/sysemu/dump-arch.h   |   3 +
>  include/sysemu/dump.h        |  26 +++-
>  target/s390x/kvm/kvm_s390x.h |   1 +
>  dump/dump.c                  | 288 +++++++++++++++++++++++++++--------
>  dump/win_dump.c              |   7 +
>  hw/s390x/pv.c                | 112 ++++++++++++++
>  hw/s390x/s390-virtio-ccw.c   |   6 +
>  target/s390x/arch_dump.c     | 262 +++++++++++++++++++++++++++----
>  target/s390x/kvm/kvm.c       |   7 +
>  11 files changed, 635 insertions(+), 98 deletions(-)
>
> --
> 2.37.3
>
>

