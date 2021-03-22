Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CBC344EFB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 19:48:35 +0100 (CET)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOPbN-0005Tn-Ed
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 14:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOPZX-0004zW-Ro
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:46:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOPZV-0007p6-0E
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:46:39 -0400
Received: by mail-ed1-x532.google.com with SMTP id l18so12432747edc.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 11:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7oA0sN/jt1rSfJNvFuEQGuZSfwD8H56oTQHpokVl+8I=;
 b=BmVG0v7NXil+CiuL/6saOdHaiqrTsDr0aCX3239rzOpk2vrHdFCo1PrRp2ywSYHlxT
 zCli18n+jQvgIJ3u8YNh41yLL3Za/JcExXED39auE0UwXV4aRXK8jfab8Fz0CKmZ271X
 F+kjx5jfooO8omgzMdO5shx83fIsmJnTdRlTETHkotx8lBLFq59MMQ7fJ/bgEnJDmq4i
 JF7v/Br9HeOmBNlmmdHVmyLQSv3zuH+WTKvrif0NDrMC1pJFaki8OkB71LeBhRdcqUIM
 VkgXWc0QRUCVDIZ3+ReFTKm5oCzX+CKD6BJm+pMx6S8W8pbY4YjJ6OJrFQOxdRKh+XbR
 Qqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oA0sN/jt1rSfJNvFuEQGuZSfwD8H56oTQHpokVl+8I=;
 b=ZqaYHMQe+FEJoMGChM1ewuryjVJkjeZUGZHhzfIkKx2UQCMNX9iEEwlPLSqqwgozQy
 sn+hZbwaeO2OSpcXQ3OraU5Uk5ZZx9WtI4t4KHWn3Z3iTcFtBe9CH4zG3mzvbjXzul6p
 /HaSw9XqDDpIqkKTfjwVrOHzv9k7aYqRIUyx/zhLmjDjp5wEhbQqvomdmN7DoW3U53ns
 UjFBamDNAwh8Z6zTcMwmePI/xw+IUz5QVrhadkNOuSKVj6ofM1umG3SEyFXeDpq3N0G3
 Nlzbm2H6soWi63bdTGngDb5KuerhTx3LKIqa1f6aGhXqVGH+E4JHoEJCrTiL9FJNXNu2
 kwQg==
X-Gm-Message-State: AOAM530QuiN91ilBsz3h6b5B5uoFnM2yFPG+RcPziZEO171X/7eCz+ZF
 Y5LFxb2s2qTyoECuy/W7NsUeHKoCgH8SDtdRuZbscw==
X-Google-Smtp-Source: ABdhPJz6Y1n/HqSYWJSi23BXfJggSWOAL26+g4LAeP3rEoPf8BVy2c+dOS/jknnLs7crybyhT/NYfM+71+VXBasZ5gQ=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr1050272edu.100.1616438795018; 
 Mon, 22 Mar 2021 11:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210322154417.524229-1-mst@redhat.com>
 <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
In-Reply-To: <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 18:46:06 +0000
Message-ID: <CAFEAcA81p5aDj9CzuihLchX3QQB27Z7Jd6cNF9uo-2rh7EXx=w@mail.gmail.com>
Subject: Re: [PULL 00/20] pc,virtio,pci: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 16:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 22 Mar 2021 at 15:44, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit f0f20022a0c744930935fdb7020a8c18347d391a:
> >
> >   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-03-21' into staging (2021-03-22 10:05:45 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 5971d4a968d51a80daaad53ddaec2b285115af62:
> >
> >   acpi: Move setters/getters of oem fields to X86MachineState (2021-03-22 11:39:02 -0400)
> >
> > ----------------------------------------------------------------
> > pc,virtio,pci: fixes, features
> >
> > Fixes all over the place.
> > ACPI index support.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
>
> This triggers a new clang runtime sanitizer warning:

With a backtrace:
$ UBSAN_OPTIONS=print_stacktrace=1
QTEST_QEMU_BINARY=build/clang/qemu-system-mips64el
./build/clang/tests/qtest/endianness-test -p
/mips64el/endianness/fuloong2e
/mips64el/endianness/fuloong2e: ../../hw/pci/pci.c:252:30: runtime
error: shift exponent -1 is negative
    #0 0x55a17bc17a1f in pci_irq_state
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/pci/pci.c:252:30
    #1 0x55a17bc17a1f in pci_irq_handler
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/pci/pci.c:1453
    #2 0x55a17b7ed0a5 in pm_update_sci
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/isa/vt82c686.c:147:5
    #3 0x55a17b7ecce3 in via_pm_reset
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/isa/vt82c686.c:173:5
    #4 0x55a17c546cc7 in resettable_phase_hold
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:182:13
    #5 0x55a17c53839a in bus_reset_child_foreach
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/bus.c:97:13
    #6 0x55a17c546bc2 in resettable_phase_hold
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:173:5
    #7 0x55a17c5435ca in device_reset_child_foreach
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/qdev.c:366:9
    #8 0x55a17c546bc2 in resettable_phase_hold
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:173:5
    #9 0x55a17c53839a in bus_reset_child_foreach
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/bus.c:97:13
    #10 0x55a17c546bc2 in resettable_phase_hold
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:173:5
    #11 0x55a17c545ee0 in resettable_assert_reset
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:60:5
    #12 0x55a17c545dbf in resettable_reset
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:45:5
    #13 0x55a17c545d68 in qemu_devices_reset
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/reset.c:69:9
    #14 0x55a17c47b3eb in qemu_system_reset
/home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/runstate.c:444:9
    #15 0x55a17ba225ee in qdev_machine_creation_done
/home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/machine.c:1279:5
    #16 0x55a17c4bdb03 in qemu_machine_creation_done
/home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/vl.c:2567:5
    #17 0x55a17c4bdb03 in qmp_x_exit_preconfig
/home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/vl.c:2590
    #18 0x55a17c4c2c0b in qemu_init
/home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/vl.c:3611:9
    #19 0x55a17b756db5 in main
/home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/main.c:49:5
    #20 0x7f3a9c9f6bf6 in __libc_start_main
/build/glibc-S9d2JN/glibc-2.27/csu/../csu/libc-start.c:310
    #21 0x55a17b731969 in _start
(/home/petmay01/linaro/qemu-for-merges/build/clang/qemu-system-mips64el+0x1140969)

OK

Suggests the relevant commit is
"acpi:piix4, vt82c686: reinitialize acpi PM device on reset"

This happens because pm_update_sci() calls pci_irq_handler(),
which calls pci_intx(pci_dev), which returns -1, which is not
a valid interrupt number to call pci_irq_handler() with.

Q: given that pci_irq_handler() says it must only be called with
an irqnum in [0..3], shouldn't pci_set_irq() be a bit more
cautious than to pull a byte directly out of PCI_INTERRUPT_PIN
and assume it's valid? (Is this guest-writable, or is it read-only?)

thanks
-- PMM

