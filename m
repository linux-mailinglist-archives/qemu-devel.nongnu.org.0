Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF96AF9C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 21:14:16 +0200 (CEST)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnStz-0002IF-5p
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 15:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hnStj-0001fq-Pw
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 15:14:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hnSth-0002Zg-Av
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 15:13:59 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:35231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hnSth-0002Yw-22
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 15:13:57 -0400
Received: by mail-ed1-f50.google.com with SMTP id w20so21566500edd.2
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 12:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+grflneV5s+yI3e45LS2PBdl2Me0meHyNuplIQLCn1o=;
 b=LMssDj6HSmi8kDtAvCqRNd9EWZHxllO2gD+iCygpjYZXxIH3XpTkPSCiOdJ4hfhiBf
 cvRr/llbgFH029F3VrNbsijaDSc0HEhdljFD6SctJ9mIZxsuUIyB9BT6Jq19aFbHX42+
 vRbXvn8rC/KyBdbdocloQGZlBXlT7ETQuWRQG26cQtN6hpIRgaRUKTKUKH5/VMyTZsKs
 x5JpzJBZs+z4+KWsGptU9MU7MkdYLdvqmp0pLhWWkHwUlVnXjrsS3gQ99RDjNQ0yq9Og
 hcI6KixIiCGefU08D3xMhk68OFFdBsK2y22APvXM8i/mJKz+8KVLIakHdWLJ9sC90kvb
 DCIg==
X-Gm-Message-State: APjAAAU0tKhgbZN+rsZwUOvwzeUCREHUrAxFNx/kfvU2MSeAR1gu+gPN
 xD8qlVAc/qnQfZN6vjE1pQh1dbVe7NgGAOOOkbuy7g==
X-Google-Smtp-Source: APXvYqyTcWKiWJOrwbn3KsPtFVXbJ1eXeh4aG6Ct/1/GdYTyz15KLnZTPnII1qLCv/E1xuhMORXktEB/Nlf891Z6VLo=
X-Received: by 2002:a17:906:e009:: with SMTP id
 cu9mr27308115ejb.267.1563304435649; 
 Tue, 16 Jul 2019 12:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <1563264677-39718-1-git-send-email-pbonzini@redhat.com>
 <1563264677-39718-9-git-send-email-pbonzini@redhat.com>
 <94cbff56-cca6-119e-b873-d8fcdf9e11f8@redhat.com>
In-Reply-To: <94cbff56-cca6-119e-b873-d8fcdf9e11f8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Jul 2019 21:13:44 +0200
Message-ID: <CABgObfYK2fNfbRZ2MNY8vj05et_KOv9ce2tYqgBfbDbN=nMuDQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PULL 08/19] hw/i386: turn off vmport if
 CONFIG_VMPORT is disabled
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
Cc: Julio Montes <julio.montes@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Should VMMOUSE also be implied?

Paolo

Il mar 16 lug 2019, 20:55 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> h=
a
scritto:

> Hi,
>
> On 7/16/19 10:11 AM, Paolo Bonzini wrote:
> > From: Julio Montes <julio.montes@intel.com>
> >
> > vmport device is not included when CONFIG_VMPORT is disabled, hence
> > QEMU fails with the following error:
> >
> > `Unknown device 'vmport' for bus 'ISA': unknown.`
> >
> > v2: imply VMPORT (Paolo Bonzini )
> >
> > Signed-off-by: Julio Montes <julio.montes@intel.com>
> > Message-Id: <20190712160257.18270-1-julio.montes@intel.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  hw/i386/Kconfig | 4 ++--
> >  hw/i386/pc.c    | 5 +++++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> > index 4ddf2a9..b9c96ac 100644
> > --- a/hw/i386/Kconfig
> > +++ b/hw/i386/Kconfig
> > @@ -51,6 +51,7 @@ config PC_ACPI
> >  config I440FX
> >      bool
> >      imply E1000_PCI
> > +    imply VMPORT
> >      select PC_PCI
> >      select PC_ACPI
> >      select ACPI_SMBUS
> > @@ -58,7 +59,6 @@ config I440FX
> >      select IDE_PIIX
> >      select DIMM
> >      select SMBIOS
> > -    select VMPORT
> >      select VMMOUSE
> >      select FW_CFG_DMA
> >
> > @@ -77,6 +77,7 @@ config Q35
> >      imply VTD
> >      imply AMD_IOMMU
> >      imply E1000E_PCI_EXPRESS
> > +    imply VMPORT
> >      select PC_PCI
> >      select PC_ACPI
> >      select PCI_EXPRESS_Q35
> > @@ -84,7 +85,6 @@ config Q35
> >      select AHCI_ICH9
> >      select DIMM
> >      select SMBIOS
> > -    select VMPORT
> >      select VMMOUSE
> >      select FW_CFG_DMA
> >
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index c33ce47..549c437 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -83,6 +83,7 @@
> >  #include "hw/mem/memory-device.h"
> >  #include "sysemu/replay.h"
> >  #include "qapi/qmp/qerror.h"
> > +#include "config-devices.h"
> >
> >  /* debug PC/ISA interrupts */
> >  //#define DEBUG_IRQ
> > @@ -2793,7 +2794,11 @@ static void pc_machine_initfn(Object *obj)
> >
> >      pcms->max_ram_below_4g =3D 0; /* use default */
> >      pcms->smm =3D ON_OFF_AUTO_AUTO;
> > +#ifdef CONFIG_VMPORT
> >      pcms->vmport =3D ON_OFF_AUTO_AUTO;
> > +#else
> > +    pcms->vmport =3D ON_OFF_AUTO_OFF;
> > +#endif /* CONFIG_VMPORT */
> >      /* acpi build is enabled by default if machine supports it */
> >      pcms->acpi_build_enabled =3D
> PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
> >      pcms->smbus_enabled =3D true;
> >
>
> Testing v4.1.0-rc1, this commit breaks ./configure
> --without-default-devices:
>
>   GEN     i386-softmmu/config-devices.mak.tmp
>     select VMMOUSE if I440FX
>     select VMMOUSE if Q35
>     config VMMOUSE depends on VMPORT
> Traceback (most recent call last):
>   File "scripts/minikconf.py", line 703, in <module>
>     config =3D data.compute_config()
>   File "scripts/minikconf.py", line 253, in compute_config
>     clause.process()
>   File "scripts/minikconf.py", line 188, in process
>     self.dest.set_value(False, self)
>   File "scripts/minikconf.py", line 118, in set_value
>     raise KconfigDataError('contradiction between clauses when setting
> %s' % self)
> __main__.KconfigDataError: contradiction between clauses when setting
> VMMOUSE
>
> 97fd1ea8c1065839ae4c19bfdc3590033a5b9788 is the first bad commit
> commit 97fd1ea8c1065839ae4c19bfdc3590033a5b9788
> Author: Julio Montes <julio.montes@intel.com>
> Date:   Fri Jul 12 16:02:57 2019 +0000
>
>     hw/i386: turn off vmport if CONFIG_VMPORT is disabled
>
>     vmport device is not included when CONFIG_VMPORT is disabled, hence
>     QEMU fails with the following error:
>
>     `Unknown device 'vmport' for bus 'ISA': unknown.`
>
>     v2: imply VMPORT (Paolo Bonzini )
>
>     Signed-off-by: Julio Montes <julio.montes@intel.com>
>     Message-Id: <20190712160257.18270-1-julio.montes@intel.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
