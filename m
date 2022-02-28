Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C14C650D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:50:05 +0100 (CET)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObjH-0003io-RT
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:50:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nObgs-0001Zw-CX
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:47:34 -0500
Received: from [2a00:1450:4864:20::62c] (port=33384
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nObgq-0000QH-KL
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:47:34 -0500
Received: by mail-ej1-x62c.google.com with SMTP id vz16so23348550ejb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5X5ByGxjtaNXVq7XNb5noOEKk29kf2d737RHA1duNjo=;
 b=lxzqpR/ZhGXyACK/I/M8LiqvijwkWE3k2qMySd2sZWhDCL/sz7d5k3GDdICBbUcp3A
 h0MB6D+0z56o2yFH88M9S8qatBxyFuCBLiL8yv5t2YD4DR8qZb+Op15g5qQ3UwpYTXh0
 CXfDeregRpzoe9hcwOy8xdciAKmlZSIG4ecK61oNG4A4sX27ZRDhqy63l2PFMxU+Gab9
 SVHUFNZDAVBrb3qzYgAWo+DM+tACuuqS973vYJAY6Hz6yMxFZz0wSZ8rLJ7VBqjnyvFg
 /8C6/aHU/XC5wS5Oq+k4u1ayxxEOQERXit/ySYnq7Y3HjE+6gPxQEkQvCDEp6TqHAIy1
 uK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5X5ByGxjtaNXVq7XNb5noOEKk29kf2d737RHA1duNjo=;
 b=xR6IXbadFPgqydCd+1fNkYey/GgXdm3Kf6JD2G1ienAlzJS+HcQSt2uQ5OQfIiTm5T
 JusrHFeJ+uNr/0Zt6rrG4hehRXhTG5D/NJ0zfocONVYb/aIOqz4beLSIILHwIrPH7mWT
 s9J5rt68rGaS2goIcV6jEHaDJ8QnBTG5ANw97JrYwqF2iMVtd0/PTzu/xEeyLzgLIV/H
 A1YrceBA3roLvJ3ZzBTWfzDK6giTl8caMOcbknhRmibzEubR3/QxARLbtKzjVgXmTZew
 AIMPcO5LPRLAm4PsocUaK4XHdGWEyipJtiblBpxnMVcDrYtPru0tZAC8Qu0vF9BBeslv
 Fxyw==
X-Gm-Message-State: AOAM531qTvlKh34xaVDKBIgwmd4WMlx7Ozpuv9CtO/yXuqterdrsA0hg
 1F59Re8oKi0CbkXKXagy2PrC9bZE4BLBlZ+H0/dPBg==
X-Google-Smtp-Source: ABdhPJxTxDxXk+Z2DpME6KliuGmFURyo4Qv0MHIe7NM+gjdbWLsnjXX08sUQxpuRpKg9ieeg4kRfChLiXCZXlvp8XGA=
X-Received: by 2002:a17:906:abd4:b0:6bb:8aee:92c5 with SMTP id
 kq20-20020a170906abd400b006bb8aee92c5mr14654643ejb.660.1646038050192; Mon, 28
 Feb 2022 00:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-4-liavalb@gmail.com>
 <BE89AC1C-6ED9-4F1E-9DE6-EB1E2CC863E7@gmail.com>
 <6e598f82-e68e-548d-7f72-ea7bcbca0e63@gmail.com>
 <A73557B9-3656-4143-984E-F074EFB8ADBD@gmail.com>
 <CAARzgwzNKcjsHib=J5i+UWLTXgxGDdkz4VG-qq+6qAaFmt8gOQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2202281224450.1302049@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2202281224450.1302049@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 28 Feb 2022 14:17:19 +0530
Message-ID: <CAARzgwx8o3t0KZKzEBgQtUwZ24x9u0_Y5Ti-jwq9rpf6DAzK1Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: imammedo@redhat.com, mst@redhat.com, Bernhard Beschow <shentey@gmail.com>,
 Liav Albani <liavalb@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 12:26 PM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> > > >ObjectClass type->name here :)
> > >
> > > I see. What about object_resolve_path_type()? It takes a typename parameter. It even tells you if the match is ambiguous if you care.
> >
> > Yes this is a good suggestion and it will likely work.
> > You can get rid of your first patch and only make the following change:
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 65dbc1ec36..d82c39490c 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -38,6 +38,7 @@
> >  #include "hw/nvram/fw_cfg.h"
> >  #include "hw/acpi/bios-linker-loader.h"
> >  #include "hw/isa/isa.h"
> > +#include "hw/input/i8042.h"
> >  #include "hw/block/fdc.h"
> >  #include "hw/acpi/memory_hotplug.h"
> >  #include "sysemu/tpm.h"
> > @@ -198,7 +199,7 @@ static void init_common_fadt_data(MachineState
> > *ms, Object *o,
> >       * (the earliest acpi revision that supports this).
> >       */
> >
> > -    fadt.iapc_boot_arch = isa_check_device_existence("i8042") ?
> > 0x0002 : 0x0000;
> > +    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042,
> > NULL) ? 0x0002 : 0x0000;
>
>
> This might be incorrect if there are more than one device of that type.
> You need to check for ambiguity as well.

exactly one is added by default, the ISA bus with or without -nodefaults:

~/workspace/qemu/build$ echo -e "info qtree\r\nquit\r\n" |
./qemu-system-x86_64 -monitor stdio 2>/dev/null | grep 8042
          dev: i8042, id ""
~/workspace/qemu/build$ echo -e "info qtree\r\nquit\r\n" |
./qemu-system-x86_64 -nodefaults -monitor stdio 2>/dev/null | grep
8042
          dev: i8042, id ""

