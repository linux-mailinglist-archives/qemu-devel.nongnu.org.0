Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C8A2E338F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:05:05 +0100 (CET)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kthuC-0005FG-27
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kthsU-0004JL-RV
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:03:18 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:35671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kthsS-0005R6-Eq
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:03:18 -0500
Received: by mail-qt1-x829.google.com with SMTP id b9so6166987qtr.2
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 18:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1vvtwf0nOfxK4YgmHwd1YQAt6TuVmZ21LmVROG4F890=;
 b=W7j9r1c8LuuAEPtWWuox8wdi8CbU0IQoDhw9AhQJLU6e7r/CxYx0/SnZKvkH6a1xBL
 NZl/TVh32CKdJJu4898zdUqBiHOir9vkXDy8oA13fHeOqV3d7rT/bTpgDDmFulQe4Itc
 n6iyA7sR0/y7UYgNtFq3Wp9OeB/J7VHsJKT5sNcSE5MrxJB+620q4F48S1r9GRNdlk8j
 z4A7emXDyYELqo1j5p0WN6OsUyZnRK3mDQYmgYZR/7X7gvWblZNNH+UZqBlHkwkHw3er
 oR6O5NcQbtOyakZikXLtcO8kirWLlHNk5IpYUH6UT1S/3MeUVLWjj0dkxDW8/PVbqoO5
 6eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vvtwf0nOfxK4YgmHwd1YQAt6TuVmZ21LmVROG4F890=;
 b=duK4ZQtwQj8i5H9NBVTIFJvatEZN9if6YKObY97upvf06wKEnju8jHKQTd7rL0wcLC
 B7bWpsu/8eM3OExAk1XOJ2uijFYkL4PamGmvzW9ushISSpZevXa8ihGPJwHEsXUUCtJn
 J5B8ZFw2ybH4DP2TS4OBywRoiIe6vO2gFWRAN3iWXiOokQTe4aAWDF0KJygkVT6nksLD
 tzdPPSR7xWS+h76T8+5xp8QnhOPfR+ijOBgqOVPvoQs3D9qLsAO5kKLEGZ2dwKTg6CTY
 0g+OtkazkMdW3T9zgQzNeZQAdL3Ln7hNwl9ktq0mUPlCdmLXh4NKYc80LjQfVWA4bCB/
 Vazw==
X-Gm-Message-State: AOAM53255XVZUQwzaQIyKuH74yjttcYAmEqg8RfdRQ/Muj7u/hc9VSoC
 QUt106spbXcPqqYiZrUVy56Zzz0eWHYUr2FDkEg=
X-Google-Smtp-Source: ABdhPJw0hjEHK5EdciYkyJQS/LnNzp7Fco+caeOA0Cuyiu39VJxOzNPvCIVAnU7ONDRlYDqhNGah95YhM6P+vOEAEds=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr42574392qta.215.1609120994938; 
 Sun, 27 Dec 2020 18:03:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <2157782addb379824c71edd301108f7799302694.1609031406.git.balaton@eik.bme.hu>
 <CAAhV-H6YE5-GbK52Pj-Lrr2uCkaXR298umq1vonBCXN5cxQFwg@mail.gmail.com>
 <1c298c6b-eee-7c3d-87c9-eab53bc43dc1@eik.bme.hu>
In-Reply-To: <1c298c6b-eee-7c3d-87c9-eab53bc43dc1@eik.bme.hu>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 28 Dec 2020 10:03:02 +0800
Message-ID: <CABDp7VpoY=SiTJ2G5DEuyPdfi1j=w7hOt+9L5qD2YXaBe7=Piw@mail.gmail.com>
Subject: Re: [PATCH 01/12] vt82c686: Add APM and ACPI dependencies for VT82C686
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=zltjiangshi@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OK, just do it as Philippe suggested.

Huacai

On Mon, Dec 28, 2020 at 9:42 AM BALATON Zoltan via
<qemu-devel@nongnu.org> wrote:
>
> Hello,
>
> On Mon, 28 Dec 2020, Huacai Chen wrote:
> > Hi, BALATON
> >
> > On Sun, Dec 27, 2020 at 9:21 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >>
> >> Compiling vt82c686.c fails without APM and ACPI_PM functions. Add
> >> dependency on these in Kconfig to fix this.
> >>
> >> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >> ---
> >>  hw/isa/Kconfig | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> >> index c7f07854f7..2ca2593ee6 100644
> >> --- a/hw/isa/Kconfig
> >> +++ b/hw/isa/Kconfig
> >> @@ -47,6 +47,8 @@ config VT82C686
> >>      select ACPI_SMBUS
> >>      select SERIAL_ISA
> >>      select FDC
> >> +    select APM
> >> +    select ACPI_X86
> > I feel a bit uncomfortable with ACPI_X86 in the MIPS code, can we just
> > select ACPI? And if that is not enough, can we select more options?
>
> This patch is not new, I've tried submitting it before but got rejeceted
> for similar reason:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2019-03/msg03428.html
>
> Then Philippe said he had a better alternative but it's still not fixed in
> master so this patch is needed and you likely already depend on X86
> without knowing as something is pulling these in for MIPS. This can be
> reproduced e,g, by adding this device to PPC as:
>
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index d235a096c6..90b53d40c2 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -64,6 +64,7 @@ config SAM460EX
>       select SMBUS_EEPROM
>       select USB_EHCI_SYSBUS
>       select USB_OHCI
> +    select VT82C686
>
>   config PREP
>       bool
>
> then compiling --target-list=ppc-softmmu
> Even after:
>
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index c7f07854f7..75986671b9 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -47,6 +47,8 @@ config VT82C686
>       select ACPI_SMBUS
>       select SERIAL_ISA
>       select FDC
> +    select APM
> +    select ACPI
>
>   config SMC37C669
>       bool
>
> I get:
>
> [] Linking target qemu-system-ppc
> FAILED: qemu-system-ppc
> ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_pm_realize':
> hw/isa/vt82c686.c:378: undefined reference to `acpi_pm_tmr_init'
> ld: hw/isa/vt82c686.c:379: undefined reference to `acpi_pm1_evt_init'
> ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `pm_update_sci':
> hw/isa/vt82c686.c:192: undefined reference to `acpi_pm1_evt_get_sts'
> ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_pm_realize':
> hw/isa/vt82c686.c:380: undefined reference to `acpi_pm1_cnt_init'
> ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `pm_update_sci':
> hw/isa/vt82c686.c:200: undefined reference to `acpi_pm_tmr_update'
> collect2: error: ld returned 1 exit status
>
> So my patch just makes existing dependencies explicit and allows this to
> build but I'm OK with any other fix you propose that fixes the above case
> as that's how I'll try to use this in the future. (I did look at this when
> first found it and concluded that I could not make a better fix than
> depending on ACPI_X86 here. I forgot the details but it was way more work
> than I want to take up for this so please propose a better fix if you
> can't accept this patch.)
>
> Maybe Philippe remembers some more.
>
> Regards,
> BALATON Zoltan
>


-- 
Huacai Chen

