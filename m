Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B26258836
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 08:28:52 +0200 (CEST)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCzml-0003Iy-Oe
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 02:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kCzlj-0002S3-I5
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 02:27:47 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kCzlh-0001ic-CH
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 02:27:47 -0400
Received: by mail-wm1-x341.google.com with SMTP id e11so234972wme.0
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 23:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tuxcbYwpybOb4Ni8MRXT1mk/aPk9jMOeobYxqoeKaEk=;
 b=ItoegMdYDq9JKd6ZOKJRwqGKKiC/tolhcZwxFWXiWn62GamXVDdY4/+uVO3joIljJ7
 uzw129xRxqp9kXfnCk66QEElS96g71DgdBbqfPbcxq1LGzhy+n1XiBsbMbWvpz7/O4Wf
 m1mITumInmDU5FPm/xAcWqjkRF6hj7ZZlb0gHbH7OOcwptEuDdgTh8lgrm1D+5Hb9HVi
 15gp0x3tn0n47WAXeKGWr7IESM1Y5Ja7fAWdacXTHNarTLFE5FCSYNTns+uCEf5HyW59
 irmoaDo/hkRZ1OzFxPaCSt/Z5r8vWnxPM1fOGwesOt0b7I41LoSktocftEz6pvQiBlXK
 Vy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tuxcbYwpybOb4Ni8MRXT1mk/aPk9jMOeobYxqoeKaEk=;
 b=g5+38PZotvh4YKZmqzs10jHIE31km1lA3LYZfnpBenWJq4qdCN6O6CmCuvWBeo6goT
 ShMlT86es7tcRcJfm6rflshdMScfJJi2sA47pxDUJAmp0z/wtqMMpUPLzCYCrlrx5ELk
 cWNGFIy014aOsbxX0+1ZpWwxPjWqcxl7+sgHzJTRZGmLgZ5bcUO7S+rFXlrjxpwCSBQm
 poxsJfYvLfBpcR0w/1lTvgDFRv4PZIU9vhRtRLL9kJREe3jZU1v1rHB8K7Ldoy4Id1NM
 0Rfp5zXWK71zmksoE9tWI6aSGmFoBBfiwsG1btoYgWvBa/fE8n086YDIP71AsEkmfjYb
 wz+A==
X-Gm-Message-State: AOAM530aV1d4a4WWqENOGgB22DFmWC2k62tw9SZccdGRv7VHC5z5l8zS
 XtnGtclfFn1J31QHgtffYgLlU5svuwFX3hpZcqmffw==
X-Google-Smtp-Source: ABdhPJwdm4fqDC4Tga1FGGsAaap4+kT8BG6vxiCaHsn4UqGX3kwmit5CapORGTvrkf5fRQTc05kEKLDPD8LteUyT/Aw=
X-Received: by 2002:a1c:e256:: with SMTP id z83mr182833wmg.137.1598941663618; 
 Mon, 31 Aug 2020 23:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200827133954.2118749-1-mst@redhat.com>
 <20200827133954.2118749-7-mst@redhat.com>
 <20200827194115.673f94de@imammedo-mac>
 <CAARzgwzLcu5iHrXNZrVbg2Yx27AvyYWrKqBZ0wK7CveQ_eKgsQ@mail.gmail.com>
 <20200828114907.42961cd3@redhat.com>
 <d67e8431-b23a-46ee-94f3-544c4476848e@Spark>
 <CAMDeoFXa2NPwCE3u-OVsBGQQWOY9yk_048iL8gieboGU5Hj7+w@mail.gmail.com>
In-Reply-To: <CAMDeoFXa2NPwCE3u-OVsBGQQWOY9yk_048iL8gieboGU5Hj7+w@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 1 Sep 2020 11:57:32 +0530
Message-ID: <CAARzgwx+61UKm7-Qhgwm-Da60BuYmMKUMC7vcscOQf3SihYvmg@mail.gmail.com>
Subject: Re: [PULL 06/13] Introduce a new flag for i440fx to disable PCI
 hotplug on the root bus
To: Julia Suvorova <jusual@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::341;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 28, 2020 at 6:40 PM Julia Suvorova <jusual@redhat.com> wrote:
>
> On Fri, Aug 28, 2020 at 11:53 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> >
> > Ani
> > On Aug 28, 2020, 15:19 +0530, Igor Mammedov <imammedo@redhat.com>, wrote:
> >
> > On Thu, 27 Aug 2020 23:29:34 +0530
> >
> > Ani Sinha <ani@anisinha.ca> wrote:
> >
> >
> > On Thu, Aug 27, 2020 at 11:11 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> >
> > On Thu, 27 Aug 2020 09:40:34 -0400
> >
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> >
> > From: Ani Sinha <ani@anisinha.ca>
> >
> >
> > We introduce a new global flag 'acpi-root-pci-hotplug' for i440fx with which
> >
> > we can turn on or off PCI device hotplug on the root bus. This flag can be
> >
> > used to prevent all PCI devices from getting hotplugged or unplugged from the
> >
> > root PCI bus.
> >
> > This feature is targetted mostly towards Windows VMs. It is useful in cases
> >
> > where some hypervisor admins want to deploy guest VMs in a way so that the
> >
> > users of the guest OSes are not able to hot-eject certain PCI devices from
> >
> > the Windows system tray. Laine has explained the use case here in detail:
> >
> > https://www.redhat.com/archives/libvir-list/2020-February/msg00110.html
> >
> >
> > Julia has resolved this issue for PCIE buses with the following commit:
> >
> > 530a0963184e57e71a5b538 ("pcie_root_port: Add hotplug disabling option")
> >
> >
> > This commit attempts to introduce similar behavior for PCI root buses used in
> >
> > i440fx machine types (although in this case, we do not have a per-slot
> >
> > capability to turn hotplug on or off).
> >
> >
> > Usage:
> >
> > -global PIIX4_PM.acpi-root-pci-hotplug=off
> >
> >
> > By default, this option is enabled which means that hotplug is turned on for
> >
> > the PCI root bus.
> >
> >
> > The previously existing flag 'acpi-pci-hotplug-with-bridge-support' for PCI-PCI
> >
> > bridges remain as is and can be used along with this new flag to control PCI
> >
> > hotplug on PCI bridges.
> >
> >
> > This change has been tested using a Windows 2012R2 server guest image and also
> >
> > with a Windows 2019 server guest image on a Ubuntu 18.04 host using the latest
> >
> > master qemu from upstream.
> >
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >
> > Message-Id: <20200821165403.26589-1-ani@anisinha.ca>
> >
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> >
> >
> > Tested-by: Igor Mammedov <imammedo@redhat.com>
> >
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >
> > A glitch in scripts?
> >
> > I didn't review nor tested this (v8) version
> >
> >
> > oops! I am so eager to get this done and dusted :)
> >
> > it's merged now,
> >
> >
> > Wait it merged without your review?
>
> Yeah, not only added into the pull request, but actually merged.
>
> >
> > can you add a test case for it please?
> >
> >
> > You can use test_acpi_piix4_tcg_bridge() as model.
> >
> > See header comment at the top of bios-tables-test.c
> >
> > for how to prepare and submit testcase.
> >
> >
> > Will get on it.
>
> Also, while the whole approach seems good to me, it leaves the hotplug
> registers initialized (see build_piix4_pci_hotplug()), even if both
> root and bridges hotplug are disabled. Which you can exploit by
> writing something like this to the io registers:
>
> outl 0xae10 0
> outl 0xae08 your_slot
>
> And because of these quite interesting lines the device will be
> successfully unplugged:
>
> static PCIBus *acpi_pcihp_find_hotplug_bus(AcpiPciHpState *s, int bsel)
> {
> ...
>     /* Make bsel 0 eject root bus if bsel property is not set,
>      * for compatibility with non acpi setups.
>      * TODO: really needed?
>      */
>     if (!bsel && !find.bus) {
>         find.bus = s->root;
>     }
>     return find.bus;
> }
>

I have sent a patch to address this. Please review.

> Could you please cover both issues in the follow-up patches?

Also julia, looking at the code, should we also set pm->pcihp_io_len
to 0 as well in case where bridge and pci bus 0 hotplugs are both
disabled? This is because I see:

   /* reserve PCIHP resources */
    if (pm->pcihp_io_len) {

which we do not want to do if PCI hotplug is disabled altogether?

>
> Best regards, Julia Suvorova.
>
> >
> >
> >
> > ---
> >
> > include/hw/acpi/pcihp.h | 2 +-
> >
> > hw/acpi/pcihp.c | 23 ++++++++++++++++++++++-
> >
> > hw/acpi/piix4.c | 5 ++++-
> >
> > 3 files changed, 27 insertions(+), 3 deletions(-)
> >
> >
> > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> >
> > index 8bc4a4c01d..02f4665767 100644
> >
> > --- a/include/hw/acpi/pcihp.h
> >
> > +++ b/include/hw/acpi/pcihp.h
> >
> > @@ -67,7 +67,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >
> > Error **errp);
> >
> >
> > /* Called on reset */
> >
> > -void acpi_pcihp_reset(AcpiPciHpState *s);
> >
> > +void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
> >
> >
> > extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
> >
> >
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> >
> > index 9e31ab2da4..39b1f74442 100644
> >
> > --- a/hw/acpi/pcihp.c
> >
> > +++ b/hw/acpi/pcihp.c
> >
> > @@ -104,6 +104,24 @@ static void acpi_set_pci_info(void)
> >
> > }
> >
> > }
> >
> >
> > +static void acpi_pcihp_disable_root_bus(void)
> >
> > +{
> >
> > + static bool root_hp_disabled;
> >
> > + PCIBus *bus;
> >
> > +
> >
> > + if (root_hp_disabled) {
> >
> > + return;
> >
> > + }
> >
> > +
> >
> > + bus = find_i440fx();
> >
> > + if (bus) {
> >
> > + /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
> >
> > + qbus_set_hotplug_handler(BUS(bus), NULL);
> >
> > + }
> >
> > + root_hp_disabled = true;
> >
> > + return;
> >
> > +}
> >
> > +
> >
> > static void acpi_pcihp_test_hotplug_bus(PCIBus *bus, void *opaque)
> >
> > {
> >
> > AcpiPciHpFind *find = opaque;
> >
> > @@ -209,8 +227,11 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
> >
> > }
> >
> > }
> >
> >
> > -void acpi_pcihp_reset(AcpiPciHpState *s)
> >
> > +void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
> >
> > {
> >
> > + if (acpihp_root_off) {
> >
> > + acpi_pcihp_disable_root_bus();
> >
> > + }
> >
> > acpi_set_pci_info();
> >
> > acpi_pcihp_update(s);
> >
> > }
> >
> > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> >
> > index 26bac4f16c..e6163bb6ce 100644
> >
> > --- a/hw/acpi/piix4.c
> >
> > +++ b/hw/acpi/piix4.c
> >
> > @@ -78,6 +78,7 @@ typedef struct PIIX4PMState {
> >
> >
> > AcpiPciHpState acpi_pci_hotplug;
> >
> > bool use_acpi_hotplug_bridge;
> >
> > + bool use_acpi_root_pci_hotplug;
> >
> >
> > uint8_t disable_s3;
> >
> > uint8_t disable_s4;
> >
> > @@ -324,7 +325,7 @@ static void piix4_pm_reset(DeviceState *dev)
> >
> > pci_conf[0x5B] = 0x02;
> >
> > }
> >
> > pm_io_space_update(s);
> >
> > - acpi_pcihp_reset(&s->acpi_pci_hotplug);
> >
> > + acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
> >
> > }
> >
> >
> > static void piix4_pm_powerdown_req(Notifier *n, void *opaque)
> >
> > @@ -635,6 +636,8 @@ static Property piix4_pm_properties[] = {
> >
> > DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
> >
> > DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
> >
> > use_acpi_hotplug_bridge, true),
> >
> > + DEFINE_PROP_BOOL("acpi-root-pci-hotplug", PIIX4PMState,
> >
> > + use_acpi_root_pci_hotplug, true),
> >
> > DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
> >
> > acpi_memory_hotplug.is_enabled, true),
> >
> > DEFINE_PROP_END_OF_LIST(),
> >
> >
> >
> >
>

