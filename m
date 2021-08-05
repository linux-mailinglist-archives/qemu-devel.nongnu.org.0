Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78453E1479
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:11:40 +0200 (CEST)
Received: from localhost ([::1]:57880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcDr-00006R-TC
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mBcCI-00072i-Px
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:10:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mBcCG-00029d-VN
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:10:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so14237663pjr.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=mzsaEfLcXVmfGXTtl+BW+UOMxuXzIpucaTiPnykKKVc=;
 b=LmPC1RodMt8hs5DM0fSciz3hcFM3r2BR15c3t+zVdmXON9Sae1A8c+w0aw1ZuIn9E0
 +lrrPNvOyODmsyEPjskaAUJLL+EPPD50+J82UiUgBO9v7UPXLZaNhOI8lnTyuKpSZZRd
 doI2Bf6iRLTmjV/35zi0mFbDk6sPkVuQOyTf1oGllQ5fF+gdkLTk0mDRg8t4iKoFrO5P
 VmrkdtDDVdpSHA3eOJini92Fyy35DJ93RDgLwnjCh12Fji+jNcFpyP5qZ4hkwU80wKjZ
 K6fgkJeJ12mj4JuBwKT43akSMK7cpQaGCdQn0OlknuDKVakt/EIUKI9ZZCTCpqSNZSTE
 eZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=mzsaEfLcXVmfGXTtl+BW+UOMxuXzIpucaTiPnykKKVc=;
 b=afTjBAU8EZg6usI/zebuBG8vz3w3IxvLPQOIG/TwnxyhiOU+OPO1KjNOFEOLdvYysN
 +8CE+FVLxTKhO6IDDyb8snPiXEnnlUwZJgCGUXIDeRX0up1+SKZjhHoF51Yx0hysQDJZ
 9k3MT8QO2hm/gROuKMpHsicFtq0bUe2+IrRS/gKjlLc+9nXV0k5eDxVn2XD68ogsU7ln
 1ILA9S0eUuHXDijBTBzO9DCeIZpfSOAEtaymJHyw2s2IRb2i0m6tezRkmL1LEuLZFt2d
 CO+Pw16KLNES48dYmi9oabLoJnu4UIcVqwicoWlU1LY+QViGDUp+C+cBT4HOAZpCww+3
 Lcww==
X-Gm-Message-State: AOAM530J/84KmtmUZLaKkmg7hUZFDKD/XBeRLWrsjiQcU0NmBXyuVLvB
 meZZP8KYVgRJJ4xAF60jtrR3Ow==
X-Google-Smtp-Source: ABdhPJxteZMA/wWxLkL4CTv8zqJec301NfHZNLvOz78uzWcFeFJUr30KD1xqW6DD+fCII1YHy1AjdA==
X-Received: by 2002:a17:90a:3b0f:: with SMTP id
 d15mr15426396pjc.71.1628165399520; 
 Thu, 05 Aug 2021 05:09:59 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.119.116])
 by smtp.googlemail.com with ESMTPSA id n33sm7503213pgm.55.2021.08.05.05.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:09:59 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 5 Aug 2021 17:39:43 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
In-Reply-To: <20210805111543.5fb99abf@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, jusual@redhat.com,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 5 Aug 2021, Igor Mammedov wrote:

> On Mon, 26 Jul 2021 22:27:43 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > return value from this function call. Instead of returning early when the value
> > returned is NULL, assert instead. Since there are only two possible host buses
> > for i386 - q35 and i440fx, a null value return from the function does not make
> > sense in most cases and is likely an error situation.
> >
> > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/acpi/pcihp.c      |  8 ++++++++
> >  hw/i386/acpi-build.c | 15 ++++++---------
> >  2 files changed, 14 insertions(+), 9 deletions(-)
> >
> > changelog:
> > v1: initial patch
> > v2: removed comment addition - that can be sent as a separate patch.
> > v3: added assertion for null host values for all cases except one.
> >
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index f4d706e47d..054ee8cbc5 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
> >      bsel_is_set = true;
> >
> >      if (!host) {
> > +        /*
> > +         * This function can be eventually called from
> > +         * qemu_devices_reset() -> acpi_pcihp_reset() even
> > +         * for architectures other than i386. Hence, we need
> > +         * to ignore null values for host here.
> > +         */
> >          return;
> >      }
>
> I suspect it's a MIPS target that call this code unnecessarily.
> It would be better to get rid of this condition altogether.
> Frr that I can suggest to make acpi_pcihp_reset() stub and
> replace pcihp.c with stub (perhaps use acpi-x86-stub.c) when building
> for MIPS.
>
> then a bunch of asserts/ifs won't be necessary,
> just one in acpi_get_i386_pci_host() will be sufficient.
>

OK this is a good idea.
I can see that mips-softmmu-config-devices.h has
CONFIG_ACPI_X86 turned on for mips. This does not seem right.

The issue here is:

$ grep -R CONFIG_ACPI_X86 *
devices/mips-softmmu/common.mak:CONFIG_ACPI_X86=y

So after

-CONFIG_ACPI_X86=y
-CONFIG_PIIX4=y

(the second one is needed because after removing first one we get:

/usr/bin/ld: libcommon.fa.p/hw_isa_piix4.c.o: in function `piix4_create':
/home/anisinha/workspace/qemu/build/../hw/isa/piix4.c:269: undefined
reference to `piix4_pm_init'

This is because in hw/acpi/meson.build, piix4.c is conditional on
CONFIG_ACPI_X86. )

/usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_gt64xxx_pci.c.o: in
function `gt64120_pci_set_irq':
/home/anisinha/workspace/qemu/build/../hw/mips/gt64xxx_pci.c:1020:
undefined reference to `piix4_dev'
/usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_malta.c.o: in function
`mips_malta_init':
/home/anisinha/workspace/qemu/build/../hw/mips/malta.c:1404: undefined
reference to `piix4_create'

So should mips be doing piix stuff anyway? Is Piix4 etc not x86 specific?

How to handle this?



