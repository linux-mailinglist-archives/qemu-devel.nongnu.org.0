Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E84D00B9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:08:18 +0100 (CET)
Received: from localhost ([::1]:57902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE25-000203-Hg
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDyN-0004ox-R3
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:04:28 -0500
Received: from [2a00:1450:4864:20::634] (port=45652
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDyJ-0002FC-3G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:04:24 -0500
Received: by mail-ej1-x634.google.com with SMTP id qa43so32103005ejc.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 06:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=2Y90WPu/ibUrczArYh9/KpM+FIRANf02neSnzaWwlLA=;
 b=Ak5wgpv7G4F/xrNPrMyBgdXC0GefhMyrGo4R4+gHFILn1Xfvg3FX87Sx4pY7LahhY2
 19IOnP8+8oXArANTO0b/PvC6rfLcqdb1fFxqGqB9ZWKsc/Qhy6k7F1N76eLAmtpSXCZO
 ug/XmOr7JO6K2+Wto0dABryWUKGzgniGKlyBsAAz9dMzYV8siZQ1xM1bbVqP64shzHIC
 dDGO8c2iGSByn0crkP7xzRqRwxrtK4d13YfRqg1KkbHpp5VAUsYOhJLtjwgeOIpaBBBy
 4DidouKpM5jYH9BxtvwS85cj+/maoJIsdpmjWbGQIJtnmzGdtsMVMXziwqo4DAuscvZB
 khGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=2Y90WPu/ibUrczArYh9/KpM+FIRANf02neSnzaWwlLA=;
 b=NiO8wcp1PPEwE2ZmrpZwJCxNBQ+xJt4V7baxRYixBqnfH87wJ5j5pH0TSPLMWYNROZ
 20sW0SyZpKQYg28KPcBiWX9nTNCtTD+sQKHffbBgmFBJE7dE6NBLq6tLH8zTnU87bb4h
 bvxUZR9xmzHR47AuIIeOBUiD/lZ+lI9C6a/5lnYZE02TOOlHUNbwcMglhhjy5Eb9Akq3
 lMJTejoCrArE2nJRKv0dnSsBccfeSCLJK5cdYh5+qMPaVC0+xEA6HjqVLzDV90sRdaU2
 028J4IZaqMFS/B7G/43otyxsX6TgK4HjsYmKY5y5t3qPBa2QSo6lb4aXnuRuZ/EARHHn
 480Q==
X-Gm-Message-State: AOAM532VfzluVy8U/na7SYdwdUOeDGuvOl/xF5d//mNk3oA7mu8vCgRF
 uZg+9DZBNBZ9ZbDBb4GT944=
X-Google-Smtp-Source: ABdhPJyDXEtpffGPh6nJTN6mIBraSLo9rPc9/Tmvats2A8YfgBHo06/jzp9exVcHChQjaKeas5esTA==
X-Received: by 2002:a17:907:6e17:b0:6da:83a3:c27a with SMTP id
 sd23-20020a1709076e1700b006da83a3c27amr8945474ejc.415.1646661861019; 
 Mon, 07 Mar 2022 06:04:21 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-143-092.89.12.pool.telefonica.de.
 [89.12.143.92]) by smtp.gmail.com with ESMTPSA id
 y18-20020a056402271200b0041110d6b80asm6299817edd.39.2022.03.07.06.04.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Mar 2022 06:04:20 -0800 (PST)
Date: Mon, 07 Mar 2022 14:04:18 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/13] hw: ISA & MIPS patches from Bernhard Beschow
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
Message-ID: <9827C057-A2C7-41FB-AEA8-A52E934D73C2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 7=2E M=C3=A4rz 2022 13:43:40 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>
>This is a combination of 2 series posted by Bernhard Beschow:
>
>"malta: Fix PCI IRQ levels to be preserved during migration" v4
>https://lore=2Ekernel=2Eorg/qemu-devel/20220217101924=2E15347-1-shentey@g=
mail=2Ecom/
>
>"isa: Resolve unneeded IRQ attributes from ISADevice" v3
>https://lore=2Ekernel=2Eorg/qemu-devel/20220301220037=2E76555-1-shentey@g=
mail=2Ecom/
>
>Bernhard, can you check if the 2nd series got rebased properly?

Looks good, ship it! ;)

Thank you so much for pushing this over the finish line!!

Best regards,
Bernhard

>
>Thanks,
>
>Phil=2E
>
>Bernhard Beschow (13):
>  hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved during
>    migration
>  malta: Move PCI interrupt handling from gt64xxx_pci to piix4
>  hw/isa/piix4: Resolve redundant i8259[] attribute
>  hw/isa/piix4: Pass PIIX4State as opaque parameter for piix4_set_irq()
>  hw/isa/piix4: Resolve global instance variable
>  hw/isa/piix4: Replace some magic IRQ constants
>  hw/mips/gt64xxx_pci: Resolve gt64120_register()
>  hw/rtc/mc146818rtc: QOM'ify IRQ number
>  hw/rtc/m48t59-isa: QOM'ify IRQ number
>  hw/input/pckbd: QOM'ify IRQ numbers
>  hw/isa/isa-bus: Remove isabus_dev_print()
>  hw/isa: Drop unused attributes from ISADevice
>  hw/isa: Inline and remove one-line isa_init_irq()
>
> hw/audio/cs4231a=2Ec            |  2 +-
> hw/audio/gus=2Ec                |  2 +-
> hw/audio/sb16=2Ec               |  2 +-
> hw/block/fdc-isa=2Ec            |  2 +-
> hw/char/parallel=2Ec            |  2 +-
> hw/char/serial-isa=2Ec          |  2 +-
> hw/ide/isa=2Ec                  |  2 +-
> hw/input/pckbd=2Ec              | 26 ++++++++++--
> hw/ipmi/isa_ipmi_bt=2Ec         |  2 +-
> hw/ipmi/isa_ipmi_kcs=2Ec        |  2 +-
> hw/isa/isa-bus=2Ec              | 37 +---------------
> hw/isa/piix4=2Ec                | 56 +++++++++++++++++++++---
> hw/mips/gt64xxx_pci=2Ec         | 80 +++--------------------------------
> hw/mips/malta=2Ec               |  7 +--
> hw/net/ne2000-isa=2Ec           |  2 +-
> hw/rtc/m48t59-isa=2Ec           |  9 +++-
> hw/rtc/mc146818rtc=2Ec          | 13 +++++-
> hw/tpm/tpm_tis_isa=2Ec          |  2 +-
> include/hw/isa/isa=2Eh          |  3 --
> include/hw/mips/mips=2Eh        |  3 --
> include/hw/rtc/mc146818rtc=2Eh  |  1 +
> include/hw/southbridge/piix=2Eh |  2 -
> tests/qemu-iotests/172=2Eout    | 26 ------------
> 23 files changed, 114 insertions(+), 171 deletions(-)
>


