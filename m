Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50093644DE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 15:45:31 +0200 (CEST)
Received: from localhost ([::1]:54060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUDS-0000Sb-SN
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 09:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUBH-0007jY-2S
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:43:15 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUBE-00058A-RP
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:43:14 -0400
Received: by mail-ed1-x52e.google.com with SMTP id k17so1262072edr.7
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lYas/TlTAS1s1f3CGkoMY6n2QFtVAZSR0X8+2blwnYU=;
 b=Fc6iNaLgYxA1QB0mO3bjzQTsYAz6bcilhMn10fYTAo/6q/hxbIOjgTcNPpC6HuWP2V
 9dhCUKDMR10a0niG6K0/MRswVmEJHdeqCzpAkaCIo279ah4R8w2kI6e38l9cjAHvhq4j
 /gOh1yD7pIQOhoCXvpFrR6caKU0TEqP3hp10y9eWLzXUVxtg0jt/2X89c3C7roA7A7lX
 +B7TxqEY+ueuJZ6ohifnUDHjwXt5japUYukTTOeGedPtBCTS1tX5suLkNpUs8N44HXre
 ErCqoM7RO9VcI82o2D9Rgohqho8JWlpVKONehCw5KIO45QJPtwTna+IVp/3OmK7oiFNw
 nlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lYas/TlTAS1s1f3CGkoMY6n2QFtVAZSR0X8+2blwnYU=;
 b=P6O20k1jlHgyMZb7OFrpygPJoBtGWGD6EIJO2B3/B2NGHtKkmu/qNJlNDrzskmetlN
 YZD5xn+1KNndcrDmqIKM2+tOIZnP1Z2zR3ww9C627/782iHI4OXvZJBx7LH31ghmGj/c
 R/wYW8ah5KnaKV3LIpKLTQm7qCS4E4kR+1MDgzLnVC+3Fy21xT9234O53/N+ju6XWT/H
 LzSYR46GbnDqn97EBWQLQFY0DmUJnYmt64AkHdR2M+fCYbrSbF2Grd1iOc2JHIOYFq8F
 Xn3FpR1g2KEldcMQmURSk3Cln5RLdCm330/w8L5dK1nfM1gyP9HWY2ORLqJ8S2GP2/2T
 J2DA==
X-Gm-Message-State: AOAM532Id6486tlspk53XuWV7QGJcRTaDfP3UNBoSV44R3jDp6CJayC4
 2dMhZ+ezwJil7Mc9VIXwwSPXkgVsu+GAGJ6EexkbgA==
X-Google-Smtp-Source: ABdhPJyuayk7x5wlan/5MHMK53AnmC9gxVVhjSs6q+cgni/ld8XV5zKYKKAn/IdaHCl/VU2/D5Urq7G2q3jfyekNz+w=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr22320562edd.52.1618839791160; 
 Mon, 19 Apr 2021 06:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210325163315.27724-1-peter.maydell@linaro.org>
 <1df78911-9858-b747-b22b-7e5254cd3cac@amsat.org>
In-Reply-To: <1df78911-9858-b747-b22b-7e5254cd3cac@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 14:42:19 +0100
Message-ID: <CAFEAcA_TuKCJ31xsv_j49oQfOFuEipmMnsNb2czPZRMPTN=wxg@mail.gmail.com>
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Arnd Bergmann <arnd@arndb.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 18:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 3/25/21 5:33 PM, Peter Maydell wrote:
> > Currently the gpex PCI controller implements no special behaviour for
> > guest accesses to areas of the PIO and MMIO where it has not mapped
> > any PCI devices, which means that for Arm you end up with a CPU
> > exception due to a data abort.
> >
> > Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> > like this return -1 for reads and ignore writes.  In the interests of
> > not being surprising, make host CPU accesses to these windows behave
> > as -1/discard where there's no mapped PCI device.
> >
> > The old behaviour generally didn't cause any problems, because
> > almost always the guest OS will map the PCI devices and then only
> > access where it has mapped them. One corner case where you will see
> > this kind of access is if Linux attempts to probe legacy ISA
> > devices via a PIO window access. So far the only case where we've
> > seen this has been via the syzkaller fuzzer.
> >
> > Reported-by: Dmitry Vyukov <dvyukov@google.com>
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > v1->v2 changes: put in the hw_compat machinery.
> >
> > Still not sure if I want to put this in 6.0 or not.
> >
> >  include/hw/pci-host/gpex.h |  4 +++
> >  hw/core/machine.c          |  1 +
> >  hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 58 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> > index d48a020a952..fcf8b638200 100644
> > --- a/include/hw/pci-host/gpex.h
> > +++ b/include/hw/pci-host/gpex.h
> > @@ -49,8 +49,12 @@ struct GPEXHost {
> >
> >      MemoryRegion io_ioport;
> >      MemoryRegion io_mmio;
> > +    MemoryRegion io_ioport_window;
> > +    MemoryRegion io_mmio_window;
> >      qemu_irq irq[GPEX_NUM_IRQS];
> >      int irq_num[GPEX_NUM_IRQS];
> > +
> > +    bool allow_unmapped_accesses;
> >  };
> >
> >  struct GPEXConfig {
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 257a664ea2e..9750fad7435 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -41,6 +41,7 @@ GlobalProperty hw_compat_5_2[] =3D {
> >      { "PIIX4_PM", "smm-compat", "on"},
> >      { "virtio-blk-device", "report-discard-granularity", "off" },
> >      { "virtio-net-pci", "vectors", "3"},
> > +    { "gpex-pcihost", "allow-unmapped-accesses", "false" },
> >  };
> >  const size_t hw_compat_5_2_len =3D G_N_ELEMENTS(hw_compat_5_2);
> >
> > diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> > index 2bdbe7b4561..a6752fac5e8 100644
> > --- a/hw/pci-host/gpex.c
> > +++ b/hw/pci-host/gpex.c
> > @@ -83,12 +83,51 @@ static void gpex_host_realize(DeviceState *dev, Err=
or **errp)
> >      int i;
> >
> >      pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
> > +    sysbus_init_mmio(sbd, &pex->mmio);
> > +
> > +    /*
> > +     * Note that the MemoryRegions io_mmio and io_ioport that we pass
> > +     * to pci_register_root_bus() are not the same as the
> > +     * MemoryRegions io_mmio_window and io_ioport_window that we
> > +     * expose as SysBus MRs. The difference is in the behaviour of
> > +     * accesses to addresses where no PCI device has been mapped.
> > +     *
> > +     * io_mmio and io_ioport are the underlying PCI view of the PCI
> > +     * address space, and when a PCI device does a bus master access
> > +     * to a bad address this is reported back to it as a transaction
> > +     * failure.
> > +     *
> > +     * io_mmio_window and io_ioport_window implement "unmapped
> > +     * addresses read as -1 and ignore writes"; this is traditional
> > +     * x86 PC behaviour, which is not mandated by the PCI spec proper
> > +     * but expected by much PCI-using guest software, including Linux.
>
> I suspect PCI-ISA bridges to provide an EISA bus.

I'm not sure what you mean here -- there isn't an ISA bridge
or an EISA bus involved here. This is purely about the behaviour
of the memory window the PCI host controller exposes to the CPU
(and in particular the window for when a PCI device's BAR is
set to "IO" rather than "MMIO"), though we change both here.

> > +     * In the interests of not being unnecessarily surprising, we
> > +     * implement it in the gpex PCI host controller, by providing the
> > +     * _window MRs, which are containers with io ops that implement
> > +     * the 'background' behaviour and which hold the real PCI MRs as
> > +     * subregions.
> > +     */
> >      memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX=
);
> >      memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1=
024);
> >
> > -    sysbus_init_mmio(sbd, &pex->mmio);
> > -    sysbus_init_mmio(sbd, &s->io_mmio);
> > -    sysbus_init_mmio(sbd, &s->io_ioport);
> > +    if (s->allow_unmapped_accesses) {
> > +        memory_region_init_io(&s->io_mmio_window, OBJECT(s),
> > +                              &unassigned_io_ops, OBJECT(s),
> > +                              "gpex_mmio_window", UINT64_MAX);
>
> EISA -> 4 * GiB
>
> unassigned_io_ops allows 64-bit accesses. Here we want up to 32.
>
> Maybe we don't care.
>
> > +        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
> > +                              &unassigned_io_ops, OBJECT(s),
> > +                              "gpex_ioport_window", 64 * 1024);
>
> Ditto, unassigned_io_ops accepts 64-bit accesses.

These are just using the same sizes as the io_mmio and io_ioport
MRs which the existing code creates.

> >  static void gpex_host_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(klass);
> > @@ -117,6 +166,7 @@ static void gpex_host_class_init(ObjectClass *klass=
, void *data)
> >      dc->realize =3D gpex_host_realize;
> >      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> >      dc->fw_name =3D "pci";
> > +    device_class_set_props(dc, gpex_host_properties);
>
> IMO this change belongs to the parent bridges,
> TYPE_PCI_HOST_BRIDGE and TYPE_PCIE_HOST_BRIDGE.

Arnd had a look through the kernel sources and apparently not
all PCI host controllers do this -- there are a few SoCs where the
kernel has to put in special case code to allow for the fact that
it will get a bus error for accesses to unmapped parts of the
window. So I concluded that the specific controller implementation
was the right place for it.

thanks
-- PMM

