Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6796EC8DA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:29:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsVK-0003V9-TS; Mon, 24 Apr 2023 05:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqsVI-0003Sn-0E
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:29:00 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqsV2-0006Va-Q9
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:28:59 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-504ecbfddd5so6027834a12.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328522; x=1684920522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4aEXJmczxLXUjgXfVtfrGKjMhk25dJWX4NT5N+vfZ7c=;
 b=LdO9+j4GmOndnjnyDkhM988mOzeZRV2h4qTUPoac69zfW+X3Jntxiqei8Z9wYAmmNb
 KXSXTEgrVdEmIzlip1Uuf0/DXZqtp71q2QphUfZON84YfshPYpagm/0worVGZ2C9cMJ9
 esjGff0lNAq0lN7EN3xuH2+8jeKXXSL1aQ2dR1q1e4U+V0YcKIreFiFHvQ2LwVI8UlIB
 jsHhEpAXNdZSXEE/T0FfLrExNmjIrTlxshBrIxlDWMyHk+U8heZBC93XS97BwFwsXtu/
 pSox56gyOMvHpxOhSxL0kmZsCPL6VqA6e4KErgxQ0IQmzYdCS6lU0n2cF2Cmn34+eQkH
 JeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328522; x=1684920522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aEXJmczxLXUjgXfVtfrGKjMhk25dJWX4NT5N+vfZ7c=;
 b=SyYVbPJiDni+bVhWxJsG5VM2YOoAjmy2BjB6Nx7evbpR1Vpk+igficZCkXz2XQwOcg
 V0hMJBRYN+eSQO5R6D4/MBe0R+G9wOVqhDSUEH2fMBdPf2G3WQsBH/BSVNkXsPBHcKFH
 cGDrSXN3ctyums6tJFv8PvOzWUZCsbEct4jhoyKANMEzdCwyWbYaITxB0Rxm4VkBHvZa
 WWLZ+tdB+tA9tL30McbaQ1FgfcSAgN8y4yH+mQy241k7VqCqAUAHPRXrhhj5rl8m9icI
 5jw+ypLc7fTtV+tACre1MWoU0XZR1CNUvcOeTAdiksNUnjVvYlq0Yz2+iqPS9Mt4YBbg
 n4+w==
X-Gm-Message-State: AAQBX9crZ7GC8QZIAhHItoXB2PS/dIY1+ONSox7ULbXkSbYxP/E+7e+V
 U5XFpDJgK8d9jGy/eT5DNPCvk4iy/Ry2dNYw1MWPDQ==
X-Google-Smtp-Source: AKy350YFvxhPho0YLfZ5o/JKs4w2+JX8FJDn7vjCWSP2/crp/7m1HzLF3UAQHLTbguo7e/GdbQEoP8UhOm/Vp2twQno=
X-Received: by 2002:aa7:d3da:0:b0:508:47af:c191 with SMTP id
 o26-20020aa7d3da000000b0050847afc191mr9462094edr.30.1682328521695; Mon, 24
 Apr 2023 02:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2023 10:28:30 +0100
Message-ID: <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI eXpander
 Bridges
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 21 Apr 2023 at 17:50, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> This patch and the problem it is trying to resolve will form part of a talk
> I will be giving next week at Linaro Connect. https://sched.co/1K85p
>
> So in the spirit of giving people almost no warning... Plus being able to
> say the discussion has kicked off here is the simplest solution I could
> come up with. If we can agree on an approach to the sizing of memory
> windows question by Thursday even better (I'll update the slides!) ;)
>
> This is a precursor for CXL on arm-virt (for which DT support was
> requested). CXL QEMU emulation uses pxb-cxl which inherits from the
> slightly simpler pxb-pcie. ACPI support for these additional host bridges
> has been available for some time but relies an interesting dance with
> EDK2:
> * During initial board creation the PXB buses are largely ignored
>   and ACPI tables + DT passed to EDK2 only expose the root bus on
>   which the section of the PXB instance that exists as a normal PCI EP
>   may be discovered.
> * EDK2 then carries out full PCI bus enumeration, including the buses
>   below the PXB host bridges.
> * Finally EDK2 calls back into QEMU to rebuild the tables via
>   virt_acpi_build_update(), at which point the correct DSDT for the
>   PXB host bridges is generated and an adjust DSDT section is generated
>   for the primary host bridge (holes are bunched in the _CRS).
>
> For device tree bindings there is no such dance with the firmware and as
> such we need QEMU to directly present device tree entries for the primary
> PCIe bus and the PXB instances.

So, not knowing anything about CXL, my naive question is:
this is PCI, why can't we handle it the way we handle everything
else PCI, i.e. present the PCI controller in the DTB and it's
the guest kernel's job to probe, enumerate, etc whatever it wants ?

thanks
-- PMM

