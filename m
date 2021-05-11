Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D5A37A479
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:22:19 +0200 (CEST)
Received: from localhost ([::1]:58504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPWs-0008CI-E5
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgPSb-0005c5-Sr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:17:53 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:35696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgPSa-0005FJ-5K
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:17:53 -0400
Received: by mail-il1-x12d.google.com with SMTP id r5so16697257ilb.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PS3K6oQXTiccpCZYz9qcib71QAK6axPUeCR0oTgrwGU=;
 b=gXBcpzoNoPMx4B5C0IDAWc3wq0KLCUG2R7N7zGz81QjDj4/uEI2b2dhjc/pvtE8VT6
 x4M+a2OSDKTaDfKJwbu+K/0/XzaiplvpOOGpDw4UerKA8lYO7z0YVAB12uaI6bQE+IqH
 4OVmIUohPpgPxciyuYp4p3jh4VSHAuc+J7WFL9BZtZ/zlpalK0ZEpn+h559fERAzvsfA
 6He3Jt2jxrf+fTGoxqJJwxzhKNZW2MOxjU//sOv/FaHELBetBVL6NdmqFD2SyC0xntje
 YLK2/pjONLTRdsMbZuUcapv5OehcRHlBN0qACIrF+Ho4wh1LY3Pd+ry9JGSj+iHEZGS0
 FrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PS3K6oQXTiccpCZYz9qcib71QAK6axPUeCR0oTgrwGU=;
 b=HmOi9bbRd2IltIEMt4mDkiuogfgS5idcbVHIY3d69iRe7FTj0ko+KIL7eTOW/isK25
 CgbL+EqOY9SabpnPbrBgQ6aUriS7jDochG4a2hdGn0WbP0/2n+NaXVzkZQ83djpuyKF2
 VbthcVUI2fpMtyoC4dY82D/UgX8zB+y1pdHeUtX6QEIRtOGUNJNDP+6hMM10Uu1XDTng
 I4o+U8balMFklu47hJZNf8zAGYX+0rIXWSwS+BuzC1c6APbYnohpbEOyypnpmABQjim2
 Am6g0oJC/SQc9PDx0kf8P0YBjHpGLU6bK/vEtUk1qykQxAI7euN6ZiTglrPBR71Y7gVT
 6l0Q==
X-Gm-Message-State: AOAM532LvCRj4H29z2Gy6EZRl09ibGQVJvbWaH8tSu0jYQT+wk0B35hb
 P2dwaOr2SgW1Mb65jFGOlNSVfkbpUVh/YrwQeAA=
X-Google-Smtp-Source: ABdhPJx9xp4T7JTq6V5hvK3bHUBWJ/hhqtFY7+9ES0t+DxMhwIUTN/7m/galyMyazEY/puuiSyuoW4sssJy7YIgiM2w=
X-Received: by 2002:a92:6b05:: with SMTP id g5mr25516555ilc.40.1620728271004; 
 Tue, 11 May 2021 03:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
 <CAFEAcA--Ge5Fy1bHxkfVxe90S2qqK=XDid0UemEVFosb7-uojA@mail.gmail.com>
In-Reply-To: <CAFEAcA--Ge5Fy1bHxkfVxe90S2qqK=XDid0UemEVFosb7-uojA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 May 2021 20:17:24 +1000
Message-ID: <CAKmqyKNZ3bjHVWs7YHSf31HcXZXqjQsp62wwNPnnVachstUA2A@mail.gmail.com>
Subject: Re: [PULL v2 00/42] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>,
 Vijai Kumar K <vijai@behindbytes.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 6:30 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 6 May 2021 at 00:23, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > The following changes since commit d45a5270d075ea589f0b0ddcf963a5fea1f500ac:
> >
> >   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.1-pull-request' into staging (2021-05-05 13:52:00 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210506
> >
> > for you to fetch changes up to d9e1a4683bc52ff218dcc133f73017bc4c496346:
> >
> >   target/riscv: Fix the RV64H decode comment (2021-05-06 08:59:59 +1000)
> >
> > ----------------------------------------------------------------
> > A large collection of RISC-V fixes, improvements and features
> >
> >  - Clenaup some left over v1.9 code
> >  - Documentation improvements
> >  - Support for the shakti_c machine
> >  - Internal cleanup of the CSR accesses
> >  - Updates to the OpenTitan platform
> >  - Support for the virtio-vga
> >  - Fix for the saturate subtract in vector extensions
> >  - Experimental support for the ePMP spec
> >  - A range of other internal code cleanups and bug fixes
> >
>
> This triggers new runtime errors in the clang sanitizer build:
>
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-
> vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-riscv64
> tests/qtest/qom-test --tap -k
> PASS 1 qtest-riscv64/qom-test /riscv64/qom/virt
> PASS 2 qtest-riscv64/qom-test /riscv64/qom/none
> PASS 3 qtest-riscv64/qom-test /riscv64/qom/microchip-icicle-kit
> PASS 4 qtest-riscv64/qom-test /riscv64/qom/spike
> PASS 5 qtest-riscv64/qom-test /riscv64/qom/sifive_e
> ../../hw/core/loader.c:459:15: runtime error: null pointer passed as
> argument 1, which is declared to never be null
> /usr/include/fcntl.h:161:6: note: nonnull attribute specified here
> Bad address
> ../../hw/core/loader.c:73:15: runtime error: null pointer passed as
> argument 1, which is declared to never be null
> /usr/include/fcntl.h:161:6: note: nonnull attribute specified here
> PASS 6 qtest-riscv64/qom-test /riscv64/qom/shakti_c
> PASS 7 qtest-riscv64/qom-test /riscv64/qom/sifive_u
>
> (and same again in the test-hmp test)
>
> Looks like something's passing a NULL filename to an image
> loading function.

Strange. I can easily reproduce this failure but `make check` still
returns 0. So although my tests saw the error they never failed and
because of that I never noticed the problem (I only read the logs on
failures).

It seems this is from the shakti_c machine, I have fixed it and will
send a new PR.

Alistair

>
> thanks
> -- PMM

