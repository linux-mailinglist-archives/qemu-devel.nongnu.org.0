Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D3613E1F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 20:21:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opaKg-0003tr-O3; Mon, 31 Oct 2022 15:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opaJy-0003mP-L4
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:19:52 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opaJv-0005Bc-L5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:19:42 -0400
Received: by mail-yb1-xb31.google.com with SMTP id i127so14796808ybc.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iQ4VGYANnqN+mQHrh4e524wVfnAgJbgEUO5aym1ACBU=;
 b=opL+QzkgCzPxPhyk5UCzmmPVE6SjseLmvdSqwe9AcfgU1QnFCERpniE5vpbmBGvP1b
 Ami4UjTdV6FFujgHo7PvWg1jkKvmpSrlgDBNK8YFkaOxpnWlSUbfdhoEFw8FGJJ0w+S3
 fL22PZ2HiV3kWhXk6hiIVb4/INTCgISEvMlRlfd60FF5dgWhHVw09URZFrJGGD4x758r
 vtqSeXgL+TiFooMOinUxSsF047tmgM3AZpyMzIydc+2QeFkZKx38GcTAlVnnnohMPwhn
 RnTFz6tdOjW06CJ+Mi0ITD65/wdwv6DY4OkKW8TZS2tTv27QJgm+FrQ9N3fd/BPt8wgL
 dTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iQ4VGYANnqN+mQHrh4e524wVfnAgJbgEUO5aym1ACBU=;
 b=RNhCxsjhqfjOXO7JUgfJPnvcJQcQAh/0fA2cFG/WL8ygaN/VBtTF5XxPyiuRfMwe5A
 8Ev+X/W/mWSKSXBJy+6SkpOzk1L45LpZ6yKZn0ZLQKq/VC6ghw/mfgpK7cre/ZBhzA+E
 Z+ApbR0mYBj5I/w5TRrrLhD/D7roZ3U1t4amy6a6cI4qSC7Yvn6FLCj+92+x78YAZ38z
 kVB6IBhGYZ2c6LjNYizxWU1VHdOFpFJXr9MbNg1kEd9oqVGDtvdnAKfxiQF8ZPwRjvm6
 t6DU0HepEwX0nIIvoig69FB/2L6Zvzq2iOb++cVfzKovHjvBX4Uqik9Rn9sDpXsrU4dc
 7P8A==
X-Gm-Message-State: ACrzQf2aZnlxbpN62ekEuOD+qaPxR5RYFfM2btmUgmRxVmdN3ulDvViu
 4nx7QBOLuDpgVI7rhto7c5EoSOyKhN5ovpa/EmE=
X-Google-Smtp-Source: AMsMyM5rAX/9sFAL6UAR9aUl+ZqbjxzkfimZVVfyhGwqVwKU1r7tp4LkCqJ7C3O7CAr7Ki5hYmUThTwq+/R95gIoAVw=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr14671111ybe.642.1667243977431; Mon, 31
 Oct 2022 12:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXafXM0CJDe5G=--3Xa4O5ifqz=yvO=ubWLaS-KNBVkwQ@mail.gmail.com>
In-Reply-To: <CAJSP0QXafXM0CJDe5G=--3Xa4O5ifqz=yvO=ubWLaS-KNBVkwQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 15:19:25 -0400
Message-ID: <CAJSP0QXndDKsc2wy4uTPtT7uN5yV4ZMn+Nn7uV190JmhnfSROA@mail.gmail.com>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>, Lei He <helei.sig11@bytedance.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 15:14, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Mon, 31 Oct 2022 at 08:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > Lei He (4):
> >       virtio-crypto: Support asynchronous mode
>
> The following clang warning breaks the build. Please resend a fixed
> pull request, thanks!

On second thought, I have fixed up the merge commit manually since
Michael is offline tomorrow for the soft freeze deadline. If CI passes
then I'll apply this pull request (with my fixup) and you won't need
to resend.

>
> clang -m64 -mcx16 -Ilibqemu-x86_64-softmmu.fa.p -I. -I.. -Itarget/i386
> -I../target/i386 -Iqapi -Itrace -Iui -Iui/shader
> -I/usr/include/pixman-1 -I/usr/include/capstone
> -I/usr/include/spice-server -I/usr/include/spice-1
> -I/usr/include/cacard -I/usr/include/glib-2.0
> -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4
> -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -flto
> -fcolor-diagnostics -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
> -isystem /builds/qemu-project/qemu/linux-headers -isystem
> linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
> /builds/qemu-project/qemu/include -iquote
> /builds/qemu-project/qemu/tcg/i386 -pthread -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
> -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
> -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
> -Wexpansion-to-defined -Wno-initializer-overrides
> -Wno-missing-include-dirs -Wno-shift-negative-value
> -Wno-string-plus-int -Wno-typedef-redefinition
> -Wno-tautological-type-limit-compare -Wno-psabi
> -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong
> -fsanitize=safe-stack -fsanitize=cfi-icall
> -fsanitize-cfi-icall-generalize-pointers -fno-sanitize-trap=cfi-icall
> -fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
> '-DCONFIG_TARGET="x86_64-softmmu-config-target.h"'
> '-DCONFIG_DEVICES="x86_64-softmmu-config-devices.h"' -MD -MQ
> libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -MF
> libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o.d -o
> libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -c
> ../hw/virtio/virtio-crypto.c
> ../hw/virtio/virtio-crypto.c:569:30: error: unused variable
> 'in_iov_copy' [-Werror,-Wunused-variable]
> g_autofree struct iovec *in_iov_copy = req->in_iov;
> ^
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3253703167
>
> Stefan

