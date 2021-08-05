Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AF33E1548
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 15:06:21 +0200 (CEST)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBd4l-0003w3-T9
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 09:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mBcyA-0006OO-Vr
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:59:31 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mBcy9-0005tL-1Y
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:59:30 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so11347864pji.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=LZq413J8zYjDWxuH0l9B8gSyq/remLjr+sZX895DCos=;
 b=pDuTQ7ZUSToU+PABVYKT/A3vL+30NDDf0GHC0sMZXN/HbAJbshUbjMZBCe75ndS6jD
 OL5KK00UB0Yprc2bTD1+aM62Sl2ztV6/4mu/jaCP4we9+ARuC9mGgvg5o2NnJeENBi/X
 udRhGTaf8pX9e2jpjUA7mBhX16KNHG0bOkk/0UhVDAPmHlAwufaR8XPx3WHUhCE1w4Df
 j5Jdw0h6IpGC+VSSKFVEtrhAaW6LFjd3vVzGVOxwYFBSMzVUO5irUfqHHa+D1WAQJDrC
 qALvIrEn62IRohvbOtpM/xFeur8UU/M9HPqMMBpb0yBwGhXOje5LjbLe51RrwYENj/ol
 h0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=LZq413J8zYjDWxuH0l9B8gSyq/remLjr+sZX895DCos=;
 b=Ii8IrDejzJYPsYiYwsZn1NDv0TmSbbfw/utNkoR7LxtP3p4wWvL/GuBfQUst2AuMJP
 t7Y6VXMxyVDpxckf7Et0JdnjqjXfHl45FpKscdOppxpsh+ymfQtJuGBvHjrOS62TsfqY
 WcyS7Y5TMoO1NuY3RSuwyFTI/DEwqtRZAqbjQq2AINQHV5hdluGN7bLvw//ktJXwNjwN
 cYkPxn7wWTWhLHEjk/+AxiX0QySY2FULOLoiqTauJRGOwdfmC8MUEaldwKN9TkR0E03g
 VpFPkGXcbaON/I1L1RruxlqjUkWBtzrLJkg8MrnWkg22PJqR7ES0Pp8f8fKSLT30ueRB
 KjHQ==
X-Gm-Message-State: AOAM533KkrsuarOUgF8TY7ibjQlhm+y6aJcuTZs0Q1t6ULVUtwl4aWtW
 dV2puLI0aChT+wzgA/HyKj5JMg==
X-Google-Smtp-Source: ABdhPJz9nUIOsFV281kjtb4N/JNvao57fdOOfJQZbb7g8fRU3tF+wtZLxuOg8xszPwfuF6Rg8KXjFQ==
X-Received: by 2002:a17:902:c94f:b029:12c:dd57:c580 with SMTP id
 i15-20020a170902c94fb029012cdd57c580mr3891335pla.42.1628168367415; 
 Thu, 05 Aug 2021 05:59:27 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.119.116])
 by smtp.googlemail.com with ESMTPSA id 31sm7755668pgy.26.2021.08.05.05.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:59:26 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 5 Aug 2021 18:29:20 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
In-Reply-To: <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2108051826190.291909@anisinha-lenovo>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
 <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102c.google.com
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
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 5 Aug 2021, Ani Sinha wrote:

>
>
> On Thu, 5 Aug 2021, Igor Mammedov wrote:
>
> > On Mon, 26 Jul 2021 22:27:43 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >
> > > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > > return value from this function call. Instead of returning early when the value
> > > returned is NULL, assert instead. Since there are only two possible host buses
> > > for i386 - q35 and i440fx, a null value return from the function does not make
> > > sense in most cases and is likely an error situation.
> > >
> > > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  hw/acpi/pcihp.c      |  8 ++++++++
> > >  hw/i386/acpi-build.c | 15 ++++++---------
> > >  2 files changed, 14 insertions(+), 9 deletions(-)
> > >
> > > changelog:
> > > v1: initial patch
> > > v2: removed comment addition - that can be sent as a separate patch.
> > > v3: added assertion for null host values for all cases except one.
> > >
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index f4d706e47d..054ee8cbc5 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
> > >      bsel_is_set = true;
> > >
> > >      if (!host) {
> > > +        /*
> > > +         * This function can be eventually called from
> > > +         * qemu_devices_reset() -> acpi_pcihp_reset() even
> > > +         * for architectures other than i386. Hence, we need
> > > +         * to ignore null values for host here.
> > > +         */
> > >          return;
> > >      }
> >
> > I suspect it's a MIPS target that call this code unnecessarily.
> > It would be better to get rid of this condition altogether.
> > Frr that I can suggest to make acpi_pcihp_reset() stub and
> > replace pcihp.c with stub (perhaps use acpi-x86-stub.c) when building
> > for MIPS.
> >
> > then a bunch of asserts/ifs won't be necessary,
> > just one in acpi_get_i386_pci_host() will be sufficient.
> >
>
> OK this is a good idea.
> I can see that mips-softmmu-config-devices.h has
> CONFIG_ACPI_X86 turned on for mips. This does not seem right.
>
> The issue here is:
>
> $ grep -R CONFIG_ACPI_X86 *
> devices/mips-softmmu/common.mak:CONFIG_ACPI_X86=y
>
> So after
>
> -CONFIG_ACPI_X86=y
> -CONFIG_PIIX4=y
>
> (the second one is needed because after removing first one we get:
>
> /usr/bin/ld: libcommon.fa.p/hw_isa_piix4.c.o: in function `piix4_create':
> /home/anisinha/workspace/qemu/build/../hw/isa/piix4.c:269: undefined
> reference to `piix4_pm_init'
>
> This is because in hw/acpi/meson.build, piix4.c is conditional on
> CONFIG_ACPI_X86. )
>
> /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_gt64xxx_pci.c.o: in
> function `gt64120_pci_set_irq':
> /home/anisinha/workspace/qemu/build/../hw/mips/gt64xxx_pci.c:1020:
> undefined reference to `piix4_dev'
> /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_malta.c.o: in function
> `mips_malta_init':
> /home/anisinha/workspace/qemu/build/../hw/mips/malta.c:1404: undefined
> reference to `piix4_create'
>
> So should mips be doing piix stuff anyway? Is Piix4 etc not x86 specific?

Apparently this is by design:
https://qemu.readthedocs.io/en/stable/system/target-mips.html

which means mips malta will continue to use the x86 specific functions
like acpi_pcihp_reset(). Creating a stub for this with acpi-x86-stub.c
will result in a double symbol definition because CONFIG_PC is off for
mips.

