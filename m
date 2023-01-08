Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD36619E6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 22:19:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEd3o-0006Sf-2c; Sun, 08 Jan 2023 16:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEd3l-0006SM-2B; Sun, 08 Jan 2023 16:18:29 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEd3j-0004EX-Av; Sun, 08 Jan 2023 16:18:28 -0500
Received: by mail-ed1-x52c.google.com with SMTP id m21so9927641edc.3;
 Sun, 08 Jan 2023 13:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltx1YElexlAgo+DfCBRA7fATaEmShLlgfmTajgHnabw=;
 b=jQ2UfC/5gN18JcDqmXCak7n6f4uCYTf1hP73g3oL4WsmhSYPzV4ixPbetjamtFej1h
 eYmxkLJxqYU+ZCixyotoaXUIqLs6HU+u4uHeB+66cZGJyABIwiF29F/cqn3k6V1RxrpM
 9G2J1AIJvDTmTDqkOHUwi5aqFCLpchdLbeTlfzynS+ER70U0yAoNEeISnsCESlPXIgYM
 S4nVDz8leJ/OFUvUVWIumKeTct2HuUX9jb3oKZf4IgftB+yCk9mUli25bNOVll2tubG3
 5p4/WJgqMTmfoWolLFkX2GGzVXUM/J8U/PTqTPTVUoQzG0wOoTFiAbs2vCbdKFEv6FIl
 z9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltx1YElexlAgo+DfCBRA7fATaEmShLlgfmTajgHnabw=;
 b=VvNxkkMYN3AI8Mpi0O6Y6guZo1h2dCBR246dheEWX8yBzJNqKoUCJMYD+/ICs3BX4+
 xavmmjL+/Rwr6ef6WsemoLuoVhBsKUYzsBbMp6zE0l2uaP+T7lP3b2C5q8M9mBzvAC9/
 QmbB55peckz4X8j1lrIcrIWaUUSyXUBs54W1oOlTDpriZnoSf4aEbJuPcVn/a7sNuD0H
 yaw1UCsN2rUSMqlLzrdqB0HhYkkdsPPNuKsq2+X31MmwAjcdAUlPErar/0UdQ6z7GlIv
 ys+oT1lHMuWsZouqeBrss1kPqOCDVMS5Jx7WFYv2nVIf8dsD+WFBXOX5Mz+je7X7bb14
 Bjaw==
X-Gm-Message-State: AFqh2krl8Fy80RjISzNuFFHicHf085qLNRH2m/freEotgmRFu52ahfZP
 n4BzUg5BbB3Ai+zA0f5hXco=
X-Google-Smtp-Source: AMrXdXvV4mwJbw6o6sd9+koRV5uFZQMBgpr5rhNIzg9Otj09t4/6vjS/sRbKTKC+Bv4y5t88yYGn1g==
X-Received: by 2002:a05:6402:176e:b0:48b:4f30:b083 with SMTP id
 da14-20020a056402176e00b0048b4f30b083mr22115511edb.40.1673212704902; 
 Sun, 08 Jan 2023 13:18:24 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200b8984a967c4b65c7.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:b898:4a96:7c4b:65c7])
 by smtp.gmail.com with ESMTPSA id
 u25-20020aa7d559000000b00463c5c32c6esm2938080edr.89.2023.01.08.13.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 13:18:24 -0800 (PST)
Date: Sun, 08 Jan 2023 21:18:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 00/31] Consolidate PIIX south bridges
In-Reply-To: <7f47fd16-8e87-32d0-9ae5-4b288930c24f@linaro.org>
References: <20230105143228.244965-1-shentey@gmail.com>
 <dcbda1fc-3380-a96b-78c7-b3b35dee5ac4@ilande.co.uk>
 <50FFD7E4-A40C-4428-ACD2-F7C93C687572@gmail.com>
 <7f47fd16-8e87-32d0-9ae5-4b288930c24f@linaro.org>
Message-ID: <3FBCB77A-FC3E-4753-953E-225E1D2D577D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 8=2E Januar 2023 18:28:28 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>On 8/1/23 16:12, Bernhard Beschow wrote:
>> Am 7=2E Januar 2023 23:57:32 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>>> On 05/01/2023 14:31, Bernhard Beschow wrote:
>
>>>> Bernhard Beschow (28):
>>>>     hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>>>     hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>>     hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>>>>       created
>>>>     hw/i386/pc_piix: Allow for setting properties before realizing PI=
IX3
>>>>       south bridge
>>>>     hw/i386/pc: Create RTC controllers in south bridges
>>>>     hw/i386/pc: No need for rtc_state to be an out-parameter
>>>>     hw/isa/piix3: Create USB controller in host device
>>>>     hw/isa/piix3: Create power management controller in host device
>>>>     hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>>>     hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>>>>     hw/isa/piix3: Create ISA PIC in host device
>>>>     hw/isa/piix3: Create IDE controller in host device
>>>>     hw/isa/piix3: Wire up ACPI interrupt internally
>>>>     hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>>     hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>>     hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>>     hw/isa/piix3: Drop the "3" from PIIX base class
>>>>     hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>>     hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>>     hw/isa/piix4: Use ISA PIC device
>>>>     hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>>     hw/isa/piix4: Rename reset control operations to match PIIX3
>>>>     hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>>>     hw/isa/piix: Harmonize names of reset control memory regions
>>>>     hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>>     hw/isa/piix: Rename functions to be shared for interrupt triggeri=
ng
>>>>     hw/isa/piix: Consolidate IRQ triggering
>>>>     hw/isa/piix: Share PIIX3's base class with PIIX4
>
>>> Phil - over to you!
>
>Thanks for the review Mark!
>
>> Shall I respin? I could integrate my PCI series into this one in order =
to avoid the outdated MIPS patches while still delivering a working series=
=2E Yes/No?
>
>If you don't mind, that is certainly easier for me :)

Okay, will do!

