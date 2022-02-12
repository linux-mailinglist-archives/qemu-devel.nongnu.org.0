Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF44B368D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 17:43:08 +0100 (CET)
Received: from localhost ([::1]:44060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIvUI-00041c-Te
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 11:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIvTE-0003L4-4Y
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 11:42:00 -0500
Received: from [2a00:1450:4864:20::42b] (port=39795
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIvTC-0006pE-AL
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 11:41:59 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d27so20114198wrc.6
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 08:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PaXO6VouobJGQ4Ttj4KiZ2KwriLwd0WNywCs5PRA/i0=;
 b=U02uHMLN0Sd9LQxi39ETb8X34VD42BjgyypsEAichev14U1Dk2IfRUxFLsaHW6vQnJ
 NeZdblJRIMml1P4+u/1qlQ62wF+H6fyog3C8M6NBsB3NgAnt5QpW2fonRbqpN0Whu0Nq
 VllxYy7LMg65mNfcxz4jbPVsJgU6MCifX5rnl9z8ZG1/g+l+mq4Lzyxds0SKIMvsbTP9
 oJsSq4kSiYsKPMziauoUL7+i6Su+S6oSTKrTXcwTkEG1BV50dofrG5/qn2n5qoLxxN0/
 ufVRhmCzDR5nkcut3wHQ6oF0b9he9e9ZFD4YkdR1oRDkzXQoL6zdc8quYfxaKpm+JFtZ
 goaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PaXO6VouobJGQ4Ttj4KiZ2KwriLwd0WNywCs5PRA/i0=;
 b=TbtmohdGF8FUmTRoru8qrfU7OgO7V99FYBDncs4+Zmc5ZcebyofjrH3JH6kfxF+cRR
 24Rru4vwf7DZkeZjqEs9qUWGk+5MxahSKNBWE12byxjR8xUhPeFEcbMEf1TWvLo6PIB6
 ekXsMWd4D8J0rm05fS0+Qw6OI7YfzyZxGRHGwqOVNyJKYeiL71c3gNUdzAx2ndhBlNFZ
 4eP7CfWmg+ngC0BRfoR4IbD/a4xNIG/14Ma9JxeSUz6k6UnvfuA2gOaPOXCj5buFrhlB
 xiZLFNyX1YEO80zb4ZtsHh2PCCLI5YwXOFy1j82PsXhxh1o/NWTcB6Ha8k6qGLWLplqw
 QH3A==
X-Gm-Message-State: AOAM533YLnR4wMbA9GmGfewVi3A0eSfjcyxpTQi05hw2SgAD7NCsPn5d
 T41FH1w8IVQnQJAri7+W81/RsGpU66vhti6tRMASVw==
X-Google-Smtp-Source: ABdhPJw3QRz403GOLQ6D0GogoUSH7X2P8xAsvTmJ5ZPiO2aaO7l5ti1rw4VcjViC1WDWog/Kixh+ZaUpFmwxrJnmffk=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr5533929wrs.521.1644684116734; 
 Sat, 12 Feb 2022 08:41:56 -0800 (PST)
MIME-Version: 1.0
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-5-shentey@gmail.com>
 <ebb5f8ad-64dc-8349-4d1c-7d8b623d60b2@eik.bme.hu>
In-Reply-To: <ebb5f8ad-64dc-8349-4d1c-7d8b623d60b2@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Feb 2022 16:41:45 +0000
Message-ID: <CAFEAcA9BBFHH7eqzB_zW-VDZWuXDEkYUb=P1ocPn_UyaZZFZ3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] isa/piix4: Fix PCI IRQ levels to be preserved in
 VMState
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Feb 2022 at 13:42, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> By the way the corresponding member in struct PIIXState in
> include/hw/southbridge/piix.h has a comment saying:
>
>      /* This member isn't used. Just for save/load compatibility */
>      int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>
> and only seems to be filled in piix3_pre_save() but never used. So what's
> the point of this then? Maybe piix3 also uses a bitmap to store these
> levels instead? There's a uint64_t pic_levels member above the unused
> array but I haven't checked the implementation.

I think what has happened here is that originally piix3 used
the same implementation piix4 currently does -- where it stores
locally the value of the (incoming) PCI IRQ levels, and then when it wants
to know the value of the (outgoing) PIC IRQ levels it loops round
to effectively OR together all the PCI IRQ levels for those PCI
IRQs which are configured to that particular PIC interrupt.

Then in commit e735b55a8c11 (in 2011) piix3 was changed to call
pci_bus_get_irq_level() to get the value of a PCI IRQ rather than
looking at its local cache of that information in the pci_irq_levels[]
array. This is the source of the "save/load compatibility" thing --
before doing a vmsave piix3_pre_save() fills in that field so that
it appears in the outbound data stream and thus a migration from
a new QEMU to an old pre-e735b55a8c11 QEMU will still work. (This
was important at the time, but could probably be cleaned up now.)

The next commit after that one is ab431c283e7055bcd, which
is an optimization that fixes the equivalent of the "XXX: optimize"
marker in the gt64120_pci_set_irq()/piix4 code -- this does
something slightly more complicated involving the pic_levels
field, in order to avoid having to do the "loop over all the
PCI IRQ levels" whenever it needs to set/reset a PIC interrupt.

We could pick up one or both (or none!) of these two changes
for the piix4 code. (If we're breaking migration compat anyway
we wouldn't need to include the save-load compat part of
the first change.)

thanks
-- PMM

