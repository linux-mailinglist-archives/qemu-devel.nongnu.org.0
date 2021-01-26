Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7E3043C9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:27:05 +0100 (CET)
Received: from localhost ([::1]:56896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4RBI-0001XG-2y
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4R5Y-0007u4-FP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:21:08 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4R5N-0006vD-K5
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:21:06 -0500
Received: by mail-ej1-x62f.google.com with SMTP id by1so23800670ejc.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fe6+7iGijWMmyR+8x/yTNe+7VImq4C4ZRtMHjNxpa5Q=;
 b=S/Lt1+uRno0Hh4zMNALGewmcQtTgvMX8MDv2Z3r31AHpMttT4gInzefhfI3yqRbEiL
 qZiCGwXULYWWRmsyk5nuxxz4USRWRmpshGSYUFuihrCSfWf85SkeCDrSLokgp3OcZKN7
 QrwYyTJXVmYm9arLJCTW8+Wmmm+C4ynafSas3AKx/VJN2ji1W0Xlv3HgmR9cUnU17qX3
 t9Lr57Tjh+eP0yQvJF18Pb0cTdM4LVYIOihLNkuRnZLdD0M4Yp5kHKWXpYp3NB6hzuas
 tCb5//N0Zg58WZc9sy1ZFwtSodFg0OwJAw4hcqECnY+rhGCnPp/+cZWge02jwgy8ySju
 bPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fe6+7iGijWMmyR+8x/yTNe+7VImq4C4ZRtMHjNxpa5Q=;
 b=QtblFSd0uDTk3B49MBlmJOkdM5+D1t4eu4Vr3GJVo236lSk5YZg/jICrr6EIVuyVtZ
 234FxwiVWI1RZWiI88EpNB7j261If2oesW7tGMXr85eFdgZoJ5kg7apu7mE59RzfZoj5
 riPW7ZA28A7bkvI+hmQl6ylIyd4R58B1GBb+KdyQ/0KvhMsNVXGajhHhRAQS+lTk5gxd
 9kwy65Ng1hw655rXlBqV5QCJQQkE7TJ2h0pGYEbFWaKLlsqRDsQpcLHh6wj4HLCGxY/f
 N9ul+9zuZLzXUYtQqD3tC/yJZjujuOdB4ORsgKEkML1SCVDl9J8dpU+CZsV0MTBE79Nt
 tuvw==
X-Gm-Message-State: AOAM532qo4Yj/eru6TNb8Kbe7JJonuFiTtsMoLtTWlN+UrYW+HYs2ESj
 iWxqUtq/295O7/i3afa7ni7mytWp/QgV0fVirQXSww==
X-Google-Smtp-Source: ABdhPJzrkfX+BFzaGBuRcEVgE12M71gjAuH4RrGQl0uD9CNpA6Na7CFbby4vOB1ToXdOBb7RGnstE93FCJhfmow997c=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr4062829ejt.56.1611678056136; 
 Tue, 26 Jan 2021 08:20:56 -0800 (PST)
MIME-Version: 1.0
References: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jan 2021 16:20:44 +0000
Message-ID: <CAFEAcA9vjm2Ad9SFoq1ZLid3k86sKJyjb5QJC7VNonD=MRQvUg@mail.gmail.com>
Subject: Re: [PATCH v4] Add support for pvpanic pci device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 11:21, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> This patchset adds support for pvpanic pci device.
>
> v3:
> - patch 1: made pvpanic isa device available only for PC, compile pvpanic-test
>   only when isa device is present
> - patch 2: fixed device id to 0x0011, used OBJECT_DECLARE_TYPE,
>   PVPANIC_PCI_DEVICE, added VMSTATE_PCI_DEVICE, removed INTERFACE_PCIE_DEVICE
> - patch 3: fixed documentation
> - patch 4: add a qtest for pvpanic-pci

This fails make check (x86-64 host, clang, sanitizer build):

Running test qtest-ppc64/pvpanic-pci-test
../../tests/qtest/libqos/pci.c:256:17: runtime error: member access
within null pointer of type 'QPCIDevice' (aka 'struct QPCIDevice')
../../tests/qtest/libqos/pci.c:256:17: runtime error: load of null
pointer of type 'QPCIBus *' (aka 'struct QPCIBus *')
UndefinedBehaviorSanitizer:DEADLYSIGNAL
==24237==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address
0x000000000000 (pc 0x5560e21f4d32 bp 0x5560e35d0c00 sp 0x7ffd75fd4740
T24237)
==24237==The signal is caused by a READ memory access.
==24237==Hint: address points to the zero page.
    #0 0x5560e21f4d31 in qpci_config_readw
/home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/../../tests/qtest/libqos/pci.c:256:17
    #1 0x5560e21f5201 in qpci_device_enable
/home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/../../tests/qtest/libqos/pci.c:107:11
    #2 0x5560e21eaa79 in test_panic
/home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/../../tests/qtest/pvpanic-pci-test.c:64:5
    #3 0x7f4fd6d6cf29  (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x72f29)
    #4 0x7f4fd6d6ce5a  (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x72e5a)
    #5 0x7f4fd6d6ce5a  (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x72e5a)
    #6 0x7f4fd6d6d101 in g_test_run_suite
(/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x73101)
    #7 0x7f4fd6d6d120 in g_test_run
(/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x73120)
    #8 0x5560e21eaa15 in main
/home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/../../tests/qtest/pvpanic-pci-test.c:91:11
    #9 0x7f4fd5d49bf6 in __libc_start_main
/build/glibc-S7xCS9/glibc-2.27/csu/../csu/libc-start.c:310
    #10 0x5560e21ca559 in _start
(/home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/tests/qtest/pvpanic-pci-test+0x7d559)

UndefinedBehaviorSanitizer can not provide additional info.
==24237==ABORTING

thanks
-- PMM

