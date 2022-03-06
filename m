Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79E4CEBED
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 15:27:28 +0100 (CET)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQrr5-0003hJ-KM
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 09:27:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQrpy-00031t-MB
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 09:26:18 -0500
Received: from [2a00:1450:4864:20::62f] (port=45643
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQrpx-000545-5J
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 09:26:18 -0500
Received: by mail-ej1-x62f.google.com with SMTP id qa43so26815822ejc.12
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JNJrWvOygicPSr7KQ/WsgKH1r1FvCZcAW1Q/eth+Xzw=;
 b=OFAWQM92NFsG8rh2rZ+FAKEMt7gaZNJmNdqRKDvCiY9GdbWUl6Gf2CD+LGP2LU0jgE
 0NiSQpjlLebzej0plamUlf3h8+CVFhdYRY1XkLu0FIs7rxucdp9eLn+s0o7NzasNnOmM
 CFehgfqDaECBUWmq6XOFg3IX7EnoV3Os2KuAqMj7S/eoc+j2kEwWM7ypElMkONa2Zsro
 QD1L97W9+gx9qB6cs32O/DVGBp+i6Tbme5tmqlNHieOnV6nAI2NpqaL0+1P41JuQvlGK
 K2LiKhhfNl5MV14mMV+J+Xfr76uOdXiaKHmxtS+cbB6hI419VvUJgknDcotk4g+/Ej1k
 kn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JNJrWvOygicPSr7KQ/WsgKH1r1FvCZcAW1Q/eth+Xzw=;
 b=NA/mY1GCtD9NzIpWAkKdsAtVSaH6778ozZ/Xjdjo7AUzd14AhZQqaAhosnBy+91Dmc
 SPCdXk/Yf1QJEVBQ31ZXAiWrrrr4knT24xPJaS3weEPTjNb1/3IylPgMJ7kenoaGTbsj
 ZXH7K+4oQnW7sZ7ZcdAflzKjB+coFq0Jgc/RAU4pDP7+ZfwnssgBJc+r+rRRUprFAnWQ
 bgnLtgb40lG8Dfmsxm6eO+bVHy8JliWFDnkfvfNl4K8dI/W5hpGbxHyNAci7M1w8nqB0
 TM8qYTgnyB/t3xSnX2VWFkqN03Az0wMym/kvRszvOkl3BLz88XGq7ESXKE6ukaw6UcsW
 b7LA==
X-Gm-Message-State: AOAM531wKfMItMKUJnag6F08vm9izJBhSEDfsFCQp6s4PVq1hdIPuNpF
 eV/LGBJEY+OXDlIUv3Yy5bXQtN9U3FCmerMrfsQfNQ==
X-Google-Smtp-Source: ABdhPJwIGkfnFieItHtuzhJHH0sxdUDD3FkLysk33fexsSdAOb2SrsAsmzuT48hND6+F4Ctphi9U7IsN7a9BDr4UR1M=
X-Received: by 2002:a17:907:3ea1:b0:6db:322:8b5a with SMTP id
 hs33-20020a1709073ea100b006db03228b5amr5312266ejc.230.1646576775721; Sun, 06
 Mar 2022 06:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20220304154032.2071585-1-ani@anisinha.ca>
 <20220304154032.2071585-3-ani@anisinha.ca>
 <20220306053131-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220306053131-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 6 Mar 2022 19:56:04 +0530
Message-ID: <CAARzgwzvXL0D-7c+dWbHCiVcCBv47Jkf9zSAt-LURzgX2DFDAw@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62f.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 liavalb@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 6, 2022 at 4:06 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Mar 04, 2022 at 09:10:30PM +0530, Ani Sinha wrote:
> > From: Liav Albani <liavalb@gmail.com>
> >
> > This can allow the guest OS to determine more easily if i8042 controller
> > is present in the system or not, so it doesn't need to do probing of the
> > controller, but just initialize it immediately, before enumerating the
> > ACPI AML namespace.
> >
> > The 8042 bit in IAPC_BOOT_ARCH was introduced from ACPI spec v2 (FADT
> > revision 2 and above). Therefore, in this change, we only enable this bit for
> > x86/q35 machine types since x86/i440fx machines use FADT ACPI table with
> > revision 1.
> >
> > Signed-off-by: Liav Albani <liavalb@gmail.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/acpi/aml-build.c         |  8 +++++++-
> >  hw/i386/acpi-build.c        |  8 ++++++++
> >  include/hw/acpi/acpi-defs.h |  1 +
> >  include/hw/input/i8042.h    | 15 +++++++++++++++
> >  4 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index 8966e16320..1773cf55f1 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -2152,7 +2152,13 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
> >      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
> >      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> > -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> > +    /* IAPC_BOOT_ARCH */
> > +    if (f->rev == 1) {
> > +        build_append_int_noprefix(tbl, 0, 2);
> > +    } else {
> > +        /* since ACPI v2.0 */
> > +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> > +    }
> >      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
> >      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index ebd47aa26f..4ad4d7286c 100644
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
> > @@ -192,6 +193,13 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
> >              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
> >          },
> >      };
> > +
> > +    /*
> > +     * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
> > +     * Flags, bit offset 1 - 8042.
> > +     */
>
> I think we should drop this comment (and one for microvm).
> If you like, add
>
> /*
> Table 5-8 Fixed ACPI Description Table (FADT) Format
> IAPC_BOOT_ARCH
> */
>
> instead.
>
>
> Let's do that with a patch on top, we have a soft freeze to consider.

Sure.

>
> > +    fadt.iapc_boot_arch = iapc_boot_arch_8042();
> > +
> >      *data = fadt;
> >  }
> >
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index c97e8633ad..2b42e4192b 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
> >      uint16_t plvl2_lat;        /* P_LVL2_LAT */
> >      uint16_t plvl3_lat;        /* P_LVL3_LAT */
> >      uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> > +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
> >      uint8_t minor_ver;         /* FADT Minor Version */
> >
> >      /*
> > diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
> > index 1d90432dae..e070f546e4 100644
> > --- a/include/hw/input/i8042.h
> > +++ b/include/hw/input/i8042.h
> > @@ -23,4 +23,19 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
> >  void i8042_isa_mouse_fake_event(ISAKBDState *isa);
> >  void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
> >
> > +static inline bool i8042_present(void)
> > +{
> > +    bool amb = false;
> > +    return object_resolve_path_type("", TYPE_I8042, &amb) || amb;
> > +}
> > +
> > +/*
> > + * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
> > + * Flags, bit offset 1 - 8042.
> > + */
> > +static inline uint16_t iapc_boot_arch_8042(void)
> > +{
> > +    return i8042_present() ? 0x1 << 1 : 0x0 ;
> > +}
> > +
> >  #endif /* HW_INPUT_I8042_H */
> > --
> > 2.25.1
>

