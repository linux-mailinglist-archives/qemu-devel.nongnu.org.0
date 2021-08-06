Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09DF3E28EF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 12:54:00 +0200 (CEST)
Received: from localhost ([::1]:51688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxUF-0005A6-I2
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 06:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mBxSx-0004Sb-68
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:52:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mBxSv-0005gB-Bf
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:52:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so17061240pjb.2
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=x9jeNd7WtUQd1QLFxmMf40qts1TEo0AeSjN9hamcoyw=;
 b=V7SDnAmbFztIIHdjTjk34Yg8kJGQ6SbsszaXHNyrDhA6UjxYPc4S2kdRAVPhFABHpd
 a3ndeV9ZJftmIkpp3qtgBqM8VJJYUssZXnrx33d6urToSO7fSmoP3tZ5wlqNdyaX+vJM
 JJtONSsQKAPwU+ZHTd/0wgcz3qgm/uThf9y9vHZPm4jEVgfE1ki9tTXia4fpxQSajYLQ
 LAwBneiuhC+kxMk+Y8kma7kdMixXRQuInzwnw+p8AImZIt4yhqw6cMXPupUN3wIic5VM
 BZo96nmJYg6gcNoBFgTzzwp2RCcvMXxt21eoNeV2mUxnfl8NG+kUjYCpqUledlYXZyJd
 8HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=x9jeNd7WtUQd1QLFxmMf40qts1TEo0AeSjN9hamcoyw=;
 b=PvwrzFNSweOnti0waPuQiX26mBkrSzxKyfT00YgO33orbNnH8ECdbj4CpTINEy47Rc
 yO3hxOVCOHgZZsYMOxcYtC2RZPDjtRpwXKYwMRdT5fQ8KJ228ib3RU3JmfIwV0vPDq5Y
 HT+jaUoSKTkV+sT87MSVxi3xrt2khkloNwosA7EX4GB77+QGmS1goKLUz1jXIpN2Jwnh
 sStPliDqeoezKOBkZ/0kaL4UkzVeEw2mG2KHMYFBXzZL6QGol0sZwMB1Uf3iaBzJfO1G
 iDuKyF0nuoCYG/5fBr/Ucm4iZlmW/e9xn7btfODPoTTfya1Ip87kklCWILH2yPeW4Vja
 ZBQQ==
X-Gm-Message-State: AOAM533MTxvGGjuzwp1+QJdRAeffgO3ikqK7aBuif4S4PYy1l+IA56kG
 3KrMWMeb9L4YqkkF4FNfexfsSg==
X-Google-Smtp-Source: ABdhPJyT+/AOpiR1VuzN6x4H2UPy1wB23KS6g+JzSw3oPekWnB5V8ILbz5vEMFWeXB8MlBrYeyP4hQ==
X-Received: by 2002:a17:90b:1b0c:: with SMTP id
 nu12mr20884097pjb.177.1628247155612; 
 Fri, 06 Aug 2021 03:52:35 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.244.201])
 by smtp.googlemail.com with ESMTPSA id y7sm12639387pjb.52.2021.08.06.03.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:52:35 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 6 Aug 2021 16:22:18 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
In-Reply-To: <20210806123754.1a1fa8a8@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2108061618320.433849@anisinha-lenovo>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
 <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051826190.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
 <20210806123754.1a1fa8a8@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
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



On Fri, 6 Aug 2021, Igor Mammedov wrote:

> On Thu, 5 Aug 2021 19:42:35 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Thu, 5 Aug 2021, Ani Sinha wrote:
> >
> > >
> > >
> > > On Thu, 5 Aug 2021, Ani Sinha wrote:
> > >
> > > >
> > > >
> > > > On Thu, 5 Aug 2021, Igor Mammedov wrote:
> > > >
> > > > > On Mon, 26 Jul 2021 22:27:43 +0530
> > > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > > >
> > > > > > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > > > > > return value from this function call. Instead of returning early when the value
> > > > > > returned is NULL, assert instead. Since there are only two possible host buses
> > > > > > for i386 - q35 and i440fx, a null value return from the function does not make
> > > > > > sense in most cases and is likely an error situation.
> > > > > >
> > > > > > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> > > > > >
> > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > ---
> > > > > >  hw/acpi/pcihp.c      |  8 ++++++++
> > > > > >  hw/i386/acpi-build.c | 15 ++++++---------
> > > > > >  2 files changed, 14 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > changelog:
> > > > > > v1: initial patch
> > > > > > v2: removed comment addition - that can be sent as a separate patch.
> > > > > > v3: added assertion for null host values for all cases except one.
> > > > > >
> > > > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > > > index f4d706e47d..054ee8cbc5 100644
> > > > > > --- a/hw/acpi/pcihp.c
> > > > > > +++ b/hw/acpi/pcihp.c
> > > > > > @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
> > > > > >      bsel_is_set = true;
> > > > > >
> > > > > >      if (!host) {
> > > > > > +        /*
> > > > > > +         * This function can be eventually called from
> > > > > > +         * qemu_devices_reset() -> acpi_pcihp_reset() even
> > > > > > +         * for architectures other than i386. Hence, we need
> > > > > > +         * to ignore null values for host here.
> > > > > > +         */
> > > > > >          return;
> > > > > >      }
> > > > >
> > > > > I suspect it's a MIPS target that call this code unnecessarily.
> > > > > It would be better to get rid of this condition altogether.
> > > > > Frr that I can suggest to make acpi_pcihp_reset() stub and
> > > > > replace pcihp.c with stub (perhaps use acpi-x86-stub.c) when building
> > > > > for MIPS.
> > > > >
> > > > > then a bunch of asserts/ifs won't be necessary,
> > > > > just one in acpi_get_i386_pci_host() will be sufficient.
> > > > >
> > > >
> > > > OK this is a good idea.
> > > > I can see that mips-softmmu-config-devices.h has
> > > > CONFIG_ACPI_X86 turned on for mips. This does not seem right.
> > > >
> > > > The issue here is:
> > > >
> > > > $ grep -R CONFIG_ACPI_X86 *
> > > > devices/mips-softmmu/common.mak:CONFIG_ACPI_X86=y
> > > >
> > > > So after
> > > >
> > > > -CONFIG_ACPI_X86=y
> > > > -CONFIG_PIIX4=y
> > > >
> > > > (the second one is needed because after removing first one we get:
> > > >
> > > > /usr/bin/ld: libcommon.fa.p/hw_isa_piix4.c.o: in function `piix4_create':
> > > > /home/anisinha/workspace/qemu/build/../hw/isa/piix4.c:269: undefined
> > > > reference to `piix4_pm_init'
> > > >
> > > > This is because in hw/acpi/meson.build, piix4.c is conditional on
> > > > CONFIG_ACPI_X86. )
> > > >
> > > > /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_gt64xxx_pci.c.o: in
> > > > function `gt64120_pci_set_irq':
> > > > /home/anisinha/workspace/qemu/build/../hw/mips/gt64xxx_pci.c:1020:
> > > > undefined reference to `piix4_dev'
> > > > /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_malta.c.o: in function
> > > > `mips_malta_init':
> > > > /home/anisinha/workspace/qemu/build/../hw/mips/malta.c:1404: undefined
> > > > reference to `piix4_create'
> > > >
> > > > So should mips be doing piix stuff anyway? Is Piix4 etc not x86 specific?
> > >
> > > Apparently this is by design:
> > > https://qemu.readthedocs.io/en/stable/system/target-mips.html
> > >
> > > which means mips malta will continue to use the x86 specific functions
> > > like acpi_pcihp_reset(). Creating a stub for this with acpi-x86-stub.c
> > > will result in a double symbol definition because CONFIG_PC is off for
> > > mips.
> > >
> >
> > Also to be noted that there is a stub for acpi_get_i386_pci_host() which
> > simply returns NULL. This activates when CONFIG_PC is disabled. It is this
> > stub that gets called for mips and hence the check for non-null host is
> > needed in acpi_set_pci_info() function.
> that were half measures to deal around code that shouldn't be called,
> now with pcihp being used by both pc and q35 we don't have reason to
> keep around null checks modulo mips calling code that shouldn't be
> called there to begin with.

So malta mips does not need ACPI hotplug? In that case, maybe we should
not make pcihp.c dependent on CONFIG_ACPI_X86. Ideas welcome.


