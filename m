Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA49366E001
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHme2-00026t-DA; Tue, 17 Jan 2023 09:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmdy-00025j-En
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:08:54 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmdw-00004x-Ne
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:08:54 -0500
Received: by mail-pg1-x531.google.com with SMTP id 36so22021589pgp.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijSFhdmlc0s9SB2xm0yaLKr/VqvKu6szPpvEw8r1pH8=;
 b=E4+EVUMPLutMCLcSngL/GJ5K/HBVba6E18wEvkB7XSCEcxyZwCf+Fjk9bw+HGQC2s7
 yo6oYp85C6SM3UtEiyeuk3N8pvJcqK0ZZHLjsg5tvv8uf5rn1Qo4oe2J+PlvyzxcG+KQ
 196x6iiWzHWnLQ+LisfFN8JFts+aYX57S8xsCN+bVNgjWnDxi5kZbcgtE7LnRMKM5yRw
 jKEv+9ylaC589iHMmjmO81keOQEHJw8tCLNexuTwtNsUNnsTrC6ZQzlejpIoNUSf7AzQ
 3w/rf8sgyN97r3Ie1y+YtiFXwZSbWGTFGPtg9L0xzqHZJXpBzyDYoMWkk2p1Q01wT9Oc
 D3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ijSFhdmlc0s9SB2xm0yaLKr/VqvKu6szPpvEw8r1pH8=;
 b=I2Jzo5ewvGRvZGFXVMjQIVUpPRNg0dY5sQYa/N3a7aYsGvmOkfJTbFdzQYb22630vF
 lDWtYnoEv/g8cubw3QwwZZsers61VAFZZhiuzlsCS4VuNOdlTITZOOCPy2fuWDTlTyGx
 2EweQiq/zokjnWwPsCkTAj9gZsFstCox9HZWPLJmYXwR3TvRZWKi3Bx34EFVYzGA9aaA
 8jDEzyH5DCDFCIeEleSZD2WyR2mPAwXYCtxAtSOPTgkIXgvL00VvyRnK1o/0tk0XR5yf
 Nbt2zGWAUMbNEyIJf+iL7BnXuF+siBAHIWbgIKSLEZeW1sSJr20qbRYP15t1VMOoVEKr
 /08w==
X-Gm-Message-State: AFqh2krM1gtiDkIsfrcPqLnrtCh+bGB22pAHddJepvS1C/6ZX26WrJe0
 4jCBzQsMkhzhpfm6pnuccNqA453s+wwXOfqa0qFRlE7hhX6INQ==
X-Google-Smtp-Source: AMrXdXtZz28mHdP1VuU4IHdb+UnfkoccQ5O+UVv7pyAy9iVDO2yA1dGRu/gMK5+77kdzYZdjiecPSkxAxh0ZOURWtRo=
X-Received: by 2002:a63:1005:0:b0:4af:9f91:54d1 with SMTP id
 f5-20020a631005000000b004af9f9154d1mr159144pgl.192.1673964529617; Tue, 17 Jan
 2023 06:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
 <20230113133923.1642627-3-alex.bennee@linaro.org>
In-Reply-To: <20230113133923.1642627-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 14:08:38 +0000
Message-ID: <CAFEAcA9mFK2ELNpVqifFukkMBoceYGNd-9Znwm8bz4nZL7hOFw@mail.gmail.com>
Subject: Re: [PATCH 2/4] docs: add a new section to outline emulation support
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, 
 Markus Armbruster <armbru@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Jagannathan Raman <jag.raman@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 13 Jan 2023 at 13:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This affects both system and user mode emulation so we should probably
> list it up front.

I'm not super-enthusiastic about this simply because it
breaks the current arrangement we have where everything
in about/ is relatively brief meta-information about QEMU:
build platforms, deprecated and removed features, license.

On the other hand I don't have an obvious better idea to
hand for where to put it.

> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/about/emulation.rst      | 103 ++++++++++++++++++++++++++++++++++
>  docs/about/index.rst          |   1 +
>  docs/devel/tcg-plugins.rst    |   2 +
>  docs/system/arm/emulation.rst |   2 +
>  4 files changed, 108 insertions(+)
>  create mode 100644 docs/about/emulation.rst
>
> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
> new file mode 100644
> index 0000000000..d919175b5e
> --- /dev/null
> +++ b/docs/about/emulation.rst
> @@ -0,0 +1,103 @@
> +Emulation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +QEMU's Tiny Code Generator (TCG) gives it the ability to emulate a
> +number of CPU architectures on any supported platform. Both
> +:ref:`System Emulation` and :ref:`User Mode Emulation` are supported
> +depending on the guest architecture.
> +
> +.. list-table:: Supported Guest Architectures for Emulation
> +  :widths: 30 10 10 50
> +  :header-rows: 1
> +
> +  * - Architecture (qemu name)
> +    - System
> +    - User-mode
> +    - Notes
> +  * - Alpha
> +    - Yes
> +    - Yes
> +    - Legacy 64 bit RISC ISA developed by DEC
> +  * - Arm (arm, aarch64)
> +    - Yes
> +    - Yes
> +    - Wide range of features, see :ref:`Arm Emulation` for details
> +  * - AVR
> +    - Yes
> +    - No
> +    - 8 bit micro controller, often used in maker projects
> +  * - Cris
> +    - Yes
> +    - Yes
> +    - Embedded RISC chip developed by AXIS
> +  * - Hexagon
> +    - No
> +    - Yes
> +    - Family of DSPs by Qualcomm
> +  * - PA-RISC (hppa)
> +    - Yes
> +    - Yes
> +    - A legacy RISC system used in HPs old minicomputers

"HP's"

> +  * - x86 (i386, x86_64)
> +    - Yes
> +    - Yes
> +    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
> +  * - Loongarch
> +    - Yes
> +    - Yes
> +    - A MIPs-like 64bit RISC architecture developed in China

"MIPS-like".

> +  * - m68k
> +    - Yes
> +    - Yes
> +    - Motorola 68000 variants and ColdFire
> +  * - Microblaze
> +    - Yes
> +    - Yes
> +    - RISC based soft-core by Xilinx
> +  * - MIPS (mips, mipsel, mips64, mips64el)
> +    - Yes
> +    - Yes
> +    - Venerable RISC architecture originally out of Stanford University
> +  * - Nios2
> +    - Yes
> +    - Yes
> +    - 32 bit embedded soft-core by Altera
> +  * - OpenRISC
> +    - Yes
> +    - Yes
> +    - Open source RISC architecture developed by the OpenRISC community
> +  * - Power (ppc, ppc64)
> +    - Yes
> +    - Yes
> +    - A general purpose RISC architecture now managed by IBM
> +  * - RISC-V
> +    - Yes
> +    - Yes
> +    - An open standard RISC ISA maintained by RISC-V International
> +  * - RX
> +    - Yes
> +    - No
> +    - A 32 bit micro controller developed by Renesas
> +  * - s390x
> +    - Yes
> +    - Yes
> +    - A 64 bit CPU found in IBM's System Z mainframes
> +  * - sh4
> +    - Yes
> +    - Yes
> +    - A 32 bit RISC embedded CPU developed by Hitachi
> +  * - SPARC (sparc, sparc64)
> +    - Yes
> +    - Yes
> +    - A RISC ISA originally developed by Sun Microsystems
> +  * - Tricore
> +    - Yes
> +    - No
> +    - A 32 bit RISC/uController/DSP developed by Infineon
> +  * - Xtensa
> +    - Yes
> +    - Yes
> +    - A configurable 32 bit soft core now owned by Cadence
> +

-- PMM

