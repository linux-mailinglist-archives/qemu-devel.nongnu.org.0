Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B70331FA10
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:45:34 +0100 (CET)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD669-0007gl-7C
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:45:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD619-00045p-7C
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:40:23 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD617-0000NW-11
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:40:22 -0500
Received: by mail-ej1-x632.google.com with SMTP id u20so12605009ejb.7
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 05:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GXS+Sn9iwX6HIZ5fjFEn06VJ/kc6QolvQEbDNPs628o=;
 b=FMhGF1t/QFlh0n9nNKyT6mawRGkwrPnBg0Nw/8dziY9KcrOkCdnFKlGZbMFRtu08kU
 H5wtWbXqJJ6aIGFJXhbYKmBzOd3r6x/MNBt8lYkjNWPwqaqyH8RLhZe72lvLuK/Xi2TT
 GzkM3wvoYOsTLGsEz11v1qQDwXDS3Rje/sc/d2359CoHmSCidzCnMEsgQx/a03R1tA5C
 1Aqjo75iWjbuS9F21VOb2rsMHj1Ce1aAfD0LJ+lBgU9oFs3lPa30uawa6hXPW++2euKJ
 IdExYyty8y/hlQMUH2D6pyufits5Tb6fNaZsq5X3mmTZOyt8iHTapwLkhtCRpr37kRCc
 XpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GXS+Sn9iwX6HIZ5fjFEn06VJ/kc6QolvQEbDNPs628o=;
 b=NmL+mk+dm5jXxTAmsBDBpgbeXXMcIR7y0KMYFFfIsEUM9yHH/sR6Tf5ECJU3qlkAJZ
 r0M3vR3KJlm4ADe8YIcgjklPYDkgxqEPNbYHPvxpVdPKBp2LJm+cE1GLCa30LlUoYsyO
 FFCXH6QHOiAYCmiXyS3bapNIw9KzYg+HLJVlh0TFz/TSCryRA8uzI8ch+JwcYyyL4CNk
 Cdpo39qGbXXQhrAPT2W6o6zdjz6RyH4wPLWDlHjbS1fTkC6iY6YukBv7ENhICg2oqX/x
 EMDB6m0NV0HlD4Dwky2Rgu4inJ6lx3fSaaTAB7Mz3Uc9pCzOPIobpVYcO7AWPn+LpckV
 rUUQ==
X-Gm-Message-State: AOAM5321dodKi5dmhYGzU1iUt2miSVE7Fbwg5xsomro0fBanhef1q8VE
 qaGCDLIPZ8QvSDGHVYVrTQe2qrBktl0N1VhmA4Dy/A==
X-Google-Smtp-Source: ABdhPJwfCTvhOK0wInNtMm3quQ/kxozLxeHvMNHaIzb7iaHwtZipnjsQdvWik4g9C1kxVhMCnnscjx3Qo30HSMBbmI0=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr9101795ejd.250.1613742018577; 
 Fri, 19 Feb 2021 05:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
 <CAFEAcA_aEtpfMScS3uzrpbBqAgqGWsWjeisUXCSpqdJJ7=uCYw@mail.gmail.com>
 <CAEUhbmXeYDkKiNnkffRoE8dZc_=-vByoQfr6gdSSUNubkCaB8Q@mail.gmail.com>
 <CAFEAcA8BwTO7OT91B=d1tZrk9+PMiSLTmKtiv_Yd2BNdb1syRQ@mail.gmail.com>
 <2bd4745b-03f2-220c-619f-2298d99038cc@amsat.org>
In-Reply-To: <2bd4745b-03f2-220c-619f-2298d99038cc@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 13:40:07 +0000
Message-ID: <CAFEAcA_X-P21_LfAfF9rjibbFN2jwjQMs+ESAN=BJvuYRTJ5rw@mail.gmail.com>
Subject: Re: [PULL 00/19] riscv-to-apply queue
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 13:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> [+John/Richards/Paolo/Gueunter]
>
> On 2/18/21 3:22 PM, Peter Maydell wrote:
> > On Thu, 18 Feb 2021 at 14:07, Bin Meng <bmeng.cn@gmail.com> wrote:
> >> On Thu, Feb 18, 2021 at 9:26 PM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
> >>> Fails to compile, 32 bit hosts:
> >>>
> >>> ../../hw/riscv/virt.c: In function 'virt_machine_init':
> >>> ../../hw/riscv/virt.c:621:43: error: comparison is always false due t=
o
> >>> limited range of data type [-Werror=3Dtype-limits]
> >>>          if ((uint64_t)(machine->ram_size) > 10 * GiB) {
> >>>                                            ^
> >>> ../../hw/riscv/virt.c:623:33: error: large integer implicitly
> >>> truncated to unsigned type [-Werror=3Doverflow]
> >>>              machine->ram_size =3D 10 * GiB;
> >>>                                  ^~
> >>
> >> This kind of error is tricky. I wonder whether we should deprecate
> >> 32-bit host support though.
> >
> > 32-bit host is still not uncommon outside the x86 world...
> >
> > The thing that makes this particular check awkward is that
> > machine->ram_size is a ram_addr_t, whose size is 64 bits if
> > either (a) the host is 64 bits or (b) CONFIG_XEN_BACKEND is
> > enabled, so it's effectively only 32-bits on 32-bit-not-x86.
> >
> > It might be a good idea if we decided that we would just make
> > ram_addr_t 64-bits everywhere, to avoid this kind of "we
> > have an unusual config only on some more-obscure hosts" issue.
> > (We did that for hwaddr back in commit 4be403c8158e1 in 2012,
> > when it was still called target_phys_addr_t.) This change
> > would probably be a performance hit for 32-bit-non-x86 hosts;
> > it would be interesting to see whether it was measurably
> > significant.
>
> You once explained me we have 'hwaddr' (physical address)
> of 64-bit because we can 64-bit buses on 32-bit targets.
> hwaddr is available in all emulation modes.

Yes, but also we have 64-bit hwaddr everywhere because trying
to deal with different build configs having different sizes
of this type is just painful for development compared to its
benefit.

> ram_addr_t is restricted to system emulation. I understand
> it as the limit addressable by a CPU.

It's the type used internally to QEMU to represent an address
within guest RAM in a unique way. CODING_STYLE.rst describes it as:
# ram_addr_t is a QEMU internal address space that maps
# guest RAM physical addresses into an intermediate address
# space that can map to host virtual address spaces.
It doesn't correspond to anything in particular in the guest.

> Back to your comment, we only have 32-bit ram_addr_t on
> system-emulation on 32-bit (non-x86) hosts.
>
> Question I asked yesterday on IRC, do you know if there
> is still interest in having system-emulation on 32-bit
> hosts?
>
> It is important to keep user-mode emulation on 32-bit hosts,
> but I doubt there are many uses of system-emulation on them
> (even less non non-x86 archs).

I'm sure you can find some people who are using it...

thanks
-- PMM

