Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC7387BB8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:54:44 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj17K-0006It-HO
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj0zz-0004wP-Na
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:47:08 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj0zy-00041w-3K
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:47:07 -0400
Received: by mail-ed1-x530.google.com with SMTP id i13so11515072edb.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xARzHUIRMEhCNf96AnGj29qMlJoEGNinUlqxQJUx2Qs=;
 b=qnspe40xM/zI/uQp6iCeD/whvfic7pIZbseKy8vkAYZntvmfjMcnwOwBe0+OHDLgph
 Bpnu7Zdy3u6gW1+6I9F3gswPP9XMjXEWUI1mhjLVyvwFy6LpRfMXfhX/rYAMlhIsrbav
 Ti3AVHRYHuVs45a2NP7DPX1Kg6Qq3JzajnhScHK41zu8q9wTlNEHsDhMPIIyfOVSFi+n
 PF+Lcrojwq6i84+r5be0KfcMw2aZsu/Q2gJ9yQHHPFM2glEjAwfkW0E+K5SjGY3kAb4B
 8gfnOxtzCusWAJ8OO0QLlk0+AoSP6AXdCdsbvsYSCTuQmUe+BtmxmOL2spv5gannXMsu
 EOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xARzHUIRMEhCNf96AnGj29qMlJoEGNinUlqxQJUx2Qs=;
 b=qU6kMLaz86I3KAsIinAa2nbxAWWUMGTj7u2uTUox1kYThIaVzytnnSyPi6IDcCGf4f
 9h6bdizpoOlyj2+PiWH01OOW1h3lN2tkKo5HRSTTP8ADCYW94X9hpC4X+008PiCF6RXR
 IoZf0fzut2e25+I5z8VXKhOuaXOqDxQhqg+WDst+s2yV7cXDCZPE0Tj64prgXk4JHa7V
 KLSj4DTi2soXBTBvCGx4sgwJKrltqaeHZf2CrtGj/Y6oeoYDwecrY7Tk2NzQdrt6Z/xn
 Ao+bpqfIXliD+UWZ6b1H1xdRO5lSY3nXYuxj+Ik60wDOnujmNuHmLTaYMfVUvly2k8+7
 xyhg==
X-Gm-Message-State: AOAM533/z26naYexjhGr76pfuXn0JO2hQ2miGc+nWhBq4gQzqhDrcHDF
 nXxOMbfE5Nz5lTvTYv3PwxPxwk9dXpOMm5Q85HlzYg==
X-Google-Smtp-Source: ABdhPJwJYJQcTLJOyHH5J6+iBb3EQk03+OYHzIcy9X7ifE9hoO92RV9IvKm4GiO4mGgC8X9K6QvVVNSuAuXbdhYfnQs=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr7380990edd.251.1621349224321; 
 Tue, 18 May 2021 07:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 15:46:47 +0100
Message-ID: <CAFEAcA9wAnK11NNObOrqV8MMgf7h9=Q2nNarEe+GY0SNPPuneQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.
>
> Changes in v3:
>  - review comments addressed
>
> Shashi Mallela (8):
>   hw/intc: GICv3 ITS initial framework
>   hw/intc: GICv3 ITS register definitions added
>   hw/intc: GICv3 ITS command queue framework
>   hw/intc: GICv3 ITS Command processing
>   hw/intc: GICv3 ITS Feature enablement
>   hw/intc: GICv3 redistributor ITS processing
>   hw/arm/sbsa-ref: add ITS support in SBSA GIC
>   hw/arm/virt: add ITS support in virt GIC

Something in here breaks "make check":

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-from-laptop/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-aarch64 tests/qtest/bios-tables-test
--tap -k

Looking for expected file 'tests/data/acpi/virt/FACP'
Using expected file 'tests/data/acpi/virt/FACP'
Looking for expected file 'tests/data/acpi/virt/APIC'
Using expected file 'tests/data/acpi/virt/APIC'
Looking for expected file 'tests/data/acpi/virt/GTDT'
Using expected file 'tests/data/acpi/virt/GTDT'
Looking for expected file 'tests/data/acpi/virt/MCFG'
Using expected file 'tests/data/acpi/virt/MCFG'
Looking for expected file 'tests/data/acpi/virt/SPCR'
Using expected file 'tests/data/acpi/virt/SPCR'
Looking for expected file 'tests/data/acpi/virt/IORT'
**
ERROR:../../tests/qtest/bios-tables-test.c:385:load_expected_aml:
assertion failed: (exp_sdt.aml_file)
ERROR qtest-aarch64/bios-tables-test - Bail out!
ERROR:../../tests/qtest/bios-tables-test.c:385:load_expected_aml:
assertion failed: (exp_sdt.aml_file)

(and then it hangs)

-- PMM

