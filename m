Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E09D4BBA03
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 14:20:56 +0100 (CET)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL3Bt-0002Kj-0D
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 08:20:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL35W-0000LA-Ok
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:14:18 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=35472
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL35U-0006xk-SD
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:14:18 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id bt13so19521418ybb.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 05:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t7dWSBaEI4sryHmzz0lZxu4tlr5G7J4fSVYonKCI2C4=;
 b=b0BO4YBfbpyf9b/5YVMvY3w3snknOkW8guoA4TiM3I08LzoyUJ3KOKoeLRw8aC4C4i
 r0MRL9Xx8SMwTsOWzBeaDfMAS5A4edsx/FI0nxgUBkYOynKjNgCv4M+RUl7a2jFQvvQb
 zpbfijXEbAMK/llT+SjkTK4zw1GKUypLph8T18FMo6mZLrXrxjd5SD9hN0GYIw+0017O
 QmzN3Ylv/s+C5c/jGsSOwTsAXv+uFgkGns/HD5uP5BwQ0WEQ9yruGO0XG+6hTxKB3AbL
 mNfS6SHExQ/btmYjsCDYqMmob2dc+b1D/fA307h/XSL6QOloDMWW5a6zzaun1BvjwnK3
 H0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t7dWSBaEI4sryHmzz0lZxu4tlr5G7J4fSVYonKCI2C4=;
 b=xXqMxpl8OebFAWlgbPwQgnIj5gqMMhXbR2QnJ+bDb3rDsPE5DoNfO/f1VF8sgB2Z3r
 ox+ZqOjDan2gMNTwaT9bG8JSn4MaFukxTATa0RbhXXEg1gTdxSFz8iDT/OAml5+bBSku
 Cz9/8e3TgdPTCUuB/CjkO2FXRo3rPBXjOhKDRIm9GXZHG9KAWeWPdzVsI39soEcHaqAb
 WAe4A9juY4kdvd6FpOp8IM0DUcnImRDmIz+u8s9Log4vH0AKSHusXDkXRae5oesu1Ssw
 mRKWGOwUpePH5UsqOSODvRRTg83iNY5OyrmEECizWIkV2P9MuN0l5osjZ9xsST3GHrm9
 UIuw==
X-Gm-Message-State: AOAM532+ueOdEVBOlOTO8qtf6dugvBGO80WMj2ZVzpHIOBkkZ2jHN0FQ
 fcE5tP6FT9R5FcQDaWqz+9GxooWpVOTW6QPAQRMCGA==
X-Google-Smtp-Source: ABdhPJwN3s0Aiwhls6Tq8PJKdyQZNwtKp9DdmQJn45BchcA7WjGJiuVULX68X8Do1PWyAOU09myGes91axWkg97aWRs=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr4053797ybe.67.1645190050144; Fri, 18
 Feb 2022 05:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20220208211937.79580-1-vineetg@rivosinc.com>
In-Reply-To: <20220208211937.79580-1-vineetg@rivosinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 13:13:59 +0000
Message-ID: <CAFEAcA8-h2TH0kG64mec6Yu6MTTSKOVTpVAToqA167MYWa4ZxQ@mail.gmail.com>
Subject: Re: [PATCH] build: fix build failure with gcc 11.2 by disabling
 -fcf-protection
To: Vineet Gupta <vineetg@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, gnu-toolchain@rivosinc.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 21:29, Vineet Gupta <vineetg@rivosinc.com> wrote:
>
> When doing RV qemu builds with host gcc 11.2, ran into following build fa=
ilure
>
> | cc -MMD -MP -MT linuxboot_dma.o -MF ./linuxboot_dma.d -O2 -g -march=3Di=
486 -Wall \
> |   -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissi=
ng-prototypes \
> |   -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat=
-security \
> |   -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-e=
xterns \
> |   -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno=
-missing-include-dirs \
> |   -Wno-shift-negative-value -Wno-psabi -fno-pie -ffreestanding -IQEMU/i=
nclude \
> |   -fno-stack-protector   -m16   -Wa,-32 \
> |   -c QEMU/pc-bios/optionrom/linuxboot_dma.c -o linuxboot_dma.o
> |cc1: error: =E2=80=98-fcf-protection=E2=80=99 is not compatible with thi=
s target
>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> ---
> This might be a crude fix to the problem

I think this patch
https://patchew.org/QEMU/20220103090112.312202-1-bjorn@kernel.org/
fixes the same problem...

thanks
-- PMM

