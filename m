Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A055748D7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:27:59 +0200 (CEST)
Received: from localhost ([::1]:33972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv8Y-0001qh-7J
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBuyC-0002g2-7w
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:17:16 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:35666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBuyA-0008E8-6D
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:17:15 -0400
Received: by mail-yb1-xb31.google.com with SMTP id e69so2205729ybh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CAfvAOYciNl1muRdrB4iDeDytV37AZVp5iGqhm+f4v0=;
 b=hDERgRlA9w3Y6kncXm7fQziiRuXxDCTh/26XqQb+gKc5DmGDhHjk8L0oe7VwOJ8rFC
 80OjIvU+Ifm65zy00xyVMIvD2MclqSD1u1Ds6dpuAjT8HdrYLeUxAqdKXUZnP/JA+Fv9
 vpTFt1fdWgn4MRKTlzu00XaySceqJVw0pogDPlC16RDJtQFVf9ojqsAfGXiyEsjAOH3g
 Ln45Q1joQKMDYWq6ReawC4C8P3bppvPhRYcxuLtNItG2aHysOMZtzPXDUBrxBqWAR44F
 5njtiQISRCfliIMyDim8hYj5fy8Bay/laTvMhCeQy49ppEgDQurvJJmNWkY/rrt2kZHq
 E6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CAfvAOYciNl1muRdrB4iDeDytV37AZVp5iGqhm+f4v0=;
 b=HsuBIZFi0TpAdnfOf6Xq3NvYtVYMfrQsM7KB3weH+fRS0WnpusXLiFlGHqDcS1UjiR
 mYmJHHjaMGdkJyaoHZ9jW4lsIuCL3UoH1d2e0Ldl9mT69Nx6smBYn9AUnSKMNZ2TmXOK
 ehGeCGTEWjKzbLg1701R3yLyqKtRbtohwigqJBKPfBAR5oy4beyoFrxrmXxSeE5JIdIn
 ZfEF3GK9ZYQXJ0lPFuOKvZBoGAIfEkEC7Mh9VjMvz+PT1IDtR+3gCkgBrnBKGXJy41fo
 wfEoIOLewlAv/hWtCPs8vn76VBeO6anskUI9va4NdMKHFXdEm1qBZOO3fmRPDlb/JExA
 2uuw==
X-Gm-Message-State: AJIora/0L7AOpLjOO+zRbr43AP1c+l2BhBhoGOmxsbUBPxDlxCdPn+ft
 99AXAtq7vK7etT4J0wJoPVp+ixXUH7hEG7w2/w/LIA==
X-Google-Smtp-Source: AGRyM1vYUaAPI0WKaL0pvFtjjIMVAnA7Bogt7YPo9yRS26hOigYaoTeUZGt1jz5BYvXzoBgUd6T18BJBy2Hf19UBT1s=
X-Received: by 2002:a25:cb0e:0:b0:66f:7b31:3563 with SMTP id
 b14-20020a25cb0e000000b0066f7b313563mr7702546ybg.85.1657790233134; Thu, 14
 Jul 2022 02:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220610075631.367501-1-mst@redhat.com>
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 10:16:34 +0100
Message-ID: <CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=qxqptZpwTp=TkcXrhg@mail.gmail.com>
Subject: Re: [PULL 00/54] virtio,pc,pci: fixes,cleanups,features
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 10 Jun 2022 at 08:57, Michael S. Tsirkin <mst@redhat.com> wrote:
> ----------------------------------------------------------------
> virtio,pc,pci: fixes,cleanups,features
>
> more CXL patches
> VIOT
> Igor's huge AML rework
> fixes, cleanups all over the place

Hi. On my macos machine (an x86 one), 'make check' output for
the bios-tables-test for both i386 and x86-64 guests now includes
a warning message:

qemu-system-i386: -device isa-applesmc: warning: Using AppleSMC with invali=
d key

I have not bisected but I rather suspect that this is the result of
the applesmc test changes in this pullreq.

>       tests: acpi: add applesmc testcase


 45/582 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test
  OK             108.07s   47 subtests passed
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:

Looking for expected file 'tests/data/acpi/pc/FACP'
Using expected file 'tests/data/acpi/pc/FACP'
Looking for expected file 'tests/data/acpi/pc/APIC'
Using expected file 'tests/data/acpi/pc/APIC'
Looking for expected file 'tests/data/acpi/pc/HPET'
Using expected file 'tests/data/acpi/pc/HPET'
Looking for expected file 'tests/data/acpi/pc/WAET'
Using expected file 'tests/data/acpi/pc/WAET'
Looking for expected file 'tests/data/acpi/pc/FACS'
Using expected file 'tests/data/acpi/pc/FACS'
Looking for expected file 'tests/data/acpi/pc/DSDT'
Using expected file 'tests/data/acpi/pc/DSDT'

[snip]
Looking for expected file 'tests/data/acpi/q35/FACS.acpierst'
Looking for expected file 'tests/data/acpi/q35/FACS'
Using expected file 'tests/data/acpi/q35/FACS'
Looking for expected file 'tests/data/acpi/q35/DSDT.acpierst'
Using expected file 'tests/data/acpi/q35/DSDT.acpierst'
qemu-system-i386: -device isa-applesmc: warning: Using AppleSMC with invali=
d key

Looking for expected file 'tests/data/acpi/q35/FACP.applesmc'
Looking for expected file 'tests/data/acpi/q35/FACP'
Using expected file 'tests/data/acpi/q35/FACP'
[snip]


Could somebody investigate why this happens and fix it, please?

thanks
-- PMM

