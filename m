Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFB9662D85
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:49:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEw27-0005RZ-ES; Mon, 09 Jan 2023 12:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEw23-0005QD-JX; Mon, 09 Jan 2023 12:34:00 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEw21-0003oW-2m; Mon, 09 Jan 2023 12:33:58 -0500
Received: by mail-ed1-x529.google.com with SMTP id s5so13595841edc.12;
 Mon, 09 Jan 2023 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BrD3dAuDlRJQEgOIeTTcHkbf46/a3HVv2V/5SNLI3k=;
 b=pRMMqjcQQQQG2YM1IhFN/sErVdBg9AdlNJf9Nu7wwqCftcGKP3MhKxuYBI+0Ddzfez
 292pogKTyYNl/7FSKDSzbdp1ubnwCFtlbD+aJNetOdvy/lMb3eo8n38l4EQmYIpfi8gL
 xm/wSliaBOTqquirutWorLDU201qG0MKtC7FrAvLL1Xp6nPHqC1sKQr2jN8WvQ8bdSRd
 8EyCdsUkYqYWNUzfrFpG2zk9FIPj/p0kSjmNvauCNnJ527soTYyICbjhHX0f24r/Y99c
 RGJwClRY2gF0Wz33xTYlamASv0HIrqhicU9+gQkWa3SYDRvachply9bKN/oR4EfSjgA1
 U8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BrD3dAuDlRJQEgOIeTTcHkbf46/a3HVv2V/5SNLI3k=;
 b=NzEnJLlWduBPDyU9aeEXVYytiVM3A1+c6if/lA5fjpWPLpOMxQrKEMAVTzQgHSGchr
 MMbfFSRdDgdZZ6ZaoDC0xzRDKU8mbTPJEEKrBNx8e1jPasXYcmqPi9uSXovuoTVH55V8
 4LZdAxWao8w2CLwmOfAaeIc2huDSuavUIirxAPlGbhBwG+MtOsoGh+f62MUK9vEMcnQG
 8mw11ZjpNzznNy4Pq/uG/ueTC9C7OYqSm6JtQvBj+CiYz4OnpmrL6SmXLAc+dqFu1mvx
 SCFDYOsBxM7EvrAOZMY+g7EuoHgOCBekHiQ9+QaqGuN8mgKaAbCBve05uA027NH+Kffu
 DrCQ==
X-Gm-Message-State: AFqh2krJE6tst9ZOX4VFzuNavo4Z73RRf/53YUpSo+wy+RDRfqBHcmR6
 RLHfJB8rj9AUpPDpAYFvX50=
X-Google-Smtp-Source: AMrXdXuTyuzIjBp6npnJQlxIp4aPX9j90feaM9k/kmCSdnwPIl737MYWa3OEMUl+AtCgVLLBGu7Flw==
X-Received: by 2002:a05:6402:34f:b0:475:b13b:7d78 with SMTP id
 r15-20020a056402034f00b00475b13b7d78mr57212582edw.39.1673285634932; 
 Mon, 09 Jan 2023 09:33:54 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20074734860dc6c494f.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:7473:4860:dc6c:494f])
 by smtp.gmail.com with ESMTPSA id
 a3-20020aa7cf03000000b0049019b48373sm3963266edy.85.2023.01.09.09.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:33:54 -0800 (PST)
Date: Mon, 09 Jan 2023 17:33:49 +0000
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
Message-ID: <82E6442C-A4A7-4287-98FF-DBCF99E68BEE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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

v6 is out! I've also rebased onto latest master which resolves some merge =
conflicts (PCI, building) for you=2E I hope you don't mind some minor clean=
ups that I've made to the PCI INTx series which aligns board code with my l=
atest fuloong2e cleanup series=2E

Best regards,
Bernhard
>

