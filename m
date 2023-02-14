Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD2696D45
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:47:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0Kb-0007xb-J6; Tue, 14 Feb 2023 13:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pS0KV-0007xM-Kh
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:47:03 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pS0KT-0000M5-OO
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:47:03 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id 81so8770330ybp.5
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kQ3FrJMaHnkFKzZwd1xIg5PfKaUDqwH/TVgmEGhSUw=;
 b=Bvgub5mPyNAnBHcGiUlNrM1s3GGC007u5B55po9ir+aZzM7S36BCUq6cCTROE0ORko
 0ZTEPYzK7QE/tIWq+dhWFVbjVPwoQhZIw/XLBoZUdU6Ey+WkQRUZp4FPRRsFVIb3pz1e
 o3h0YtWT98IZmyAvDBLV/QROvWs60K9p/I0yDPFbi2Tih5coLPGpq9oxU9IAp5Ihp/im
 3zRrUfxsYLE5sy8pkKOsolTGyTdiDJU9PDzZahVnz/MvgFeu3qgXkENf5nLlbipUnmjk
 Zjy6RH7GQqKNC/igrf+TXeWoyx0mkiYRwsowoto8wqHJdFD1Pv5nJ/Rel0HNCd0vsnbQ
 FEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kQ3FrJMaHnkFKzZwd1xIg5PfKaUDqwH/TVgmEGhSUw=;
 b=xgHbL5P3RobOjUowe5//ti9NjVIhsoFUrNQMxyUPVMSfgGS2nTHeHtl07yc9jZO5Js
 wvC6d/LDFr2vRHYEnrClZADKt0TtliAoAv3QPaEMXA38xAia2dkhqNPL5dHZkVMKkTrq
 TxMkRthNaltOJQObT1ov/UgRGMfWrVBYqvphXuATqeaGJksFkttArzR7kLKxyc68OPjM
 mnkFBCC83a52EA2ndqDQSscUbGU1A2Mqw5848bDXyBfgTO8uaVUnM8ztq6Pc/fw3Do6+
 MEFwD9iDSJDJBo0FS9evSSXvnbrZlBPB4ZzF/XCoWVrwAN0hmTcMN6FWELbX1CR9z7AE
 zO+Q==
X-Gm-Message-State: AO0yUKVTjBG6N4zBc3DQlWlgBlPTS0a3gv8jA1HZ2G63QAb6rtBGkTgm
 GqD7ShSxD64N0X3ddi11wl8J2ZL+J70HKraAibM=
X-Google-Smtp-Source: AK7set+EEvMkLTnonk6N1K94RN06v+rFH7CUFH9TTGCjDOkkOEZddhfVgu2R9h2gkr8aKXPKpORmdkbZfnbYy1V7qT4=
X-Received: by 2002:a25:e907:0:b0:80b:b818:e841 with SMTP id
 n7-20020a25e907000000b0080bb818e841mr381299ybd.94.1676400420483; Tue, 14 Feb
 2023 10:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20230205042951.3570008-1-alxndr@bu.edu> <Y+uq234pKMdKpPyT@fedora>
 <f5f42e9a-e0eb-341a-32ff-4d1ebd8830b7@linaro.org>
 <323ad0aa-e38f-bcc1-8c6f-0732c1cd0fc0@redhat.com>
In-Reply-To: <323ad0aa-e38f-bcc1-8c6f-0732c1cd0fc0@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 14 Feb 2023 13:46:48 -0500
Message-ID: <CAJSP0QWeK-EKt_LhWE4i28zDxh78qrvqtFtSD0XQmy89+JxxgQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Retire Fork-Based Fuzzing
To: Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-devel@nongnu.org, 
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Feb 2023 at 12:59, Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 2/14/23 17:08, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 14/2/23 16:38, Stefan Hajnoczi wrote:
> >> On Sat, Feb 04, 2023 at 11:29:41PM -0500, Alexander Bulekov wrote:
> >>> Hello,
> >>> This series removes fork-based fuzzing.
> >>> How does fork-based fuzzing work?
> >>>   * A single parent process initializes QEMU
> >>>   * We identify the devices we wish to fuzz (fuzzer-dependent)
> >>>   * Use QTest to PCI enumerate the devices
> >>>   * After that we start a fork-server which forks the process and exe=
cutes
> >>>     fuzzer inputs inside the disposable children.
> >>>
> >>> In a normal fuzzing process, everything happens in a single process.
> >>>
> >>> Pros of fork-based fuzzing:
> >>>   * We only need to do common configuration once (e.g. PCI enumeratio=
n).
> >>>   * Fork provides a strong guarantee that fuzzer inputs will not inte=
rfere with
> >>>     each-other
> >>>   * The fuzzing process can continue even after a child-process crash=
es
> >>>   * We can apply our-own timers to child-processes to exit slow input=
s, early
> >>>
> >>> Cons of fork-based fuzzing:
> >>>   * Fork-based fuzzing is not supported by libfuzzer. We had to build=
 our own
> >>>     fork-server and rely on tricks using linker-scripts and shared-me=
mory to
> >>>     support fuzzing. ( https://physics.bu.edu/~alxndr/libfuzzer-forks=
erver/ )
> >>>   * Fork-based fuzzing is currently the main blocker preventing us fr=
om enabling
> >>>     other fuzzers such as AFL++ on OSS-Fuzz
> >>>   * Fork-based fuzzing may be a reason why coverage-builds are failin=
g on
> >>>     OSS-Fuzz. Coverage is an important fuzzing metric which would all=
ow us to
> >>>     find parts of the code that are not well-covered.
> >>>   * Fork-based fuzzing has high overhead. fork() is an expensive syst=
em-call,
> >>>     especially for processes running ASAN (with large/complex) VMA la=
youts.
> >>>   * Fork prevents us from effectively fuzzing devices that rely on
> >>>     threads (e.g. qxl).
> >>>
> >>> These patches remove fork-based fuzzing and replace it with reboot-ba=
sed
> >>> fuzzing for most cases. Misc notes about this change:
> >>>   * libfuzzer appears to be no longer in active development. As such,=
 the
> >>>     current implementation of fork-based fuzzing (while having some n=
ice
> >>>     advantages) is likely to hold us back in the future. If these cha=
nges
> >>>     are approved and appear to run successfully on OSS-Fuzz, we shoul=
d be
> >>>     able to easily experiment with other fuzzing engines (AFL++).
> >>>   * Some device do not completely reset their state. This can lead to
> >>>     non-reproducible crashes. However, in my local tests, most crashe=
s
> >>>     were reproducible. OSS-Fuzz shouldn't send us reports unless it c=
an
> >>>     consistently reproduce a crash.
> >>>   * In theory, the corpus-format should not change, so the existing
> >>>     corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
> >>>     fuzzers.
> >>>   * Each fuzzing process will now exit after a single crash is found.=
 To
> >>>     continue the fuzzing process, use libfuzzer flags such as -jobs=
=3D-1
> >>>   * We no long control input-timeouts (those are handled by libfuzzer=
).
> >>>     Since timeouts on oss-fuzz can be many seconds long, I added a li=
mit
> >>>     on the number of DMA bytes written.
> >>>
> >>> Alexander Bulekov (10):
> >>>    hw/sparse-mem: clear memory on reset
> >>>    fuzz: add fuzz_reboot API
> >>>    fuzz/generic-fuzz: use reboots instead of forks to reset state
> >>>    fuzz/generic-fuzz: add a limit on DMA bytes written
> >>>    fuzz/virtio-scsi: remove fork-based fuzzer
> >>>    fuzz/virtio-net: remove fork-based fuzzer
> >>>    fuzz/virtio-blk: remove fork-based fuzzer
> >>>    fuzz/i440fx: remove fork-based fuzzer
> >>>    fuzz: remove fork-fuzzing scaffolding
> >>>    docs/fuzz: remove mentions of fork-based fuzzing
> >>>
> >>>   docs/devel/fuzzing.rst              |  22 +-----
> >>>   hw/mem/sparse-mem.c                 |  13 +++-
> >>>   meson.build                         |   4 -
> >>>   tests/qtest/fuzz/fork_fuzz.c        |  41 ----------
> >>>   tests/qtest/fuzz/fork_fuzz.h        |  23 ------
> >>>   tests/qtest/fuzz/fork_fuzz.ld       |  56 --------------
> >>>   tests/qtest/fuzz/fuzz.c             |   6 ++
> >>>   tests/qtest/fuzz/fuzz.h             |   2 +-
> >>>   tests/qtest/fuzz/generic_fuzz.c     | 111 +++++++------------------=
---
> >>>   tests/qtest/fuzz/i440fx_fuzz.c      |  27 +------
> >>>   tests/qtest/fuzz/meson.build        |   6 +-
> >>>   tests/qtest/fuzz/virtio_blk_fuzz.c  |  51 ++-----------
> >>>   tests/qtest/fuzz/virtio_net_fuzz.c  |  54 ++------------
> >>>   tests/qtest/fuzz/virtio_scsi_fuzz.c |  51 ++-----------
> >>>   14 files changed, 72 insertions(+), 395 deletions(-)
> >>>   delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
> >>>   delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
> >>>   delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld
> >>>
> >>> --
> >>> 2.39.0
> >>>
> >>
> >> Whose tree should this go through? Laurent's qtest tree?
> >
> > Do you mean Thomas?
> >
> > $ git shortlog -cs tests/qtest/fuzz | sort -rn
> >      32  Thomas Huth
> >      26  Paolo Bonzini
> >      19  Stefan Hajnoczi
> >       6  Markus Armbruster
> >       5  Alexander Bulekov
> >       4  Marc-Andr=C3=A9 Lureau
> >       3  Peter Maydell
> >       2  Laurent Vivier
> >       1  Michael S. Tsirkin
> >       1  Gerd Hoffmann
> >
> > In doubt, cc'ing both :)
>
> Yes, Thomas is the real maintainer.

Want to update the ./MAINTAINERS file? That's where I found your name.
Thomas is only listed as a reviewer.

Stefan

