Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E733F9688
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 10:56:50 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJXfN-0000rR-1a
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 04:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJXe9-0008N9-Vj
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 04:55:34 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJXe6-0002jk-8k
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 04:55:33 -0400
Received: by mail-ej1-x631.google.com with SMTP id a25so12281314ejv.6
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/tKzibWRZOK+eJoZsMXcgXdt4+bZQRPIa1a3onCP048=;
 b=OQpKXcQug/nNKHPGav+dRCEgcY4jlWROB8nilZklYegqoY1XddnGw+7s6P9fw5N0Xo
 bQQluY19NU2OnMCtlHmzKYRoOUrB66tTo0cDX6M2ap5DVRtTSKKifig7mk1tghIv+kih
 YX2ZOMbDtyPPrpepEcTswOO7x5Yb4bdd5KQAvcSqno7tR8OyvopogJ0mla+P4rb/KIr5
 b2abMwswfsO01pVpPtGX14nEEnw/R46nd88Sfh5lHS3mv89OzVYSloLUw7zEXkV+et5a
 lvg2gE4TXgCbqRDQq8CAWlx2a57JnKYxjiVUpm1L6fTkzL5kHhr/el1sMDWpetOVyBL4
 B6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/tKzibWRZOK+eJoZsMXcgXdt4+bZQRPIa1a3onCP048=;
 b=NCskfxucTLiz18xqSqZm6AR7jMdeJNHj3B+CJBkmmYxz7fzSOR3D7BKm88NRTdVELW
 tB/Krh7SHZUo//uV/E8OqPi6Uuw0TNnPeu908IjfAp+QjmiFJdE3gNoiD0LNZdaXJVCU
 F+lsnTv29j/JnIyJ9pNovsXaN6f7rdIXzwGs6JCafzK9CPw+e+YB3dX5etbmKjmrZfz0
 8O1QA7jvP9YDPbIiObDF2WNLMPwvWakTeYQDKdBwyvS1trO4ks7VzM4/VGEqM6aY5Itr
 45UwQ4N0PGTMQ3NbDGnocNxLNmKYlUfwB5MdQeJbQIiEtSNSDTH5MwWIhGDKPd6giAHH
 Fz5g==
X-Gm-Message-State: AOAM5338C3XwPVoxc4RrghOvoBTHiP26kMrWmHmoN4f5x6fZn3hIhHxD
 Iw7gljY1KMt7egHpM1cBcHMYpcMeS1VGSOo2EOi5Rg==
X-Google-Smtp-Source: ABdhPJzCMdOp2VX0ukd46drCp9RnPTNEu40Y1+ldrtCP/DhwXPHDAaq4C9nBVFEDI8sVTsyhb0txUs9hcqHhHtSDizU=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr8982584ejn.56.1630054528710; 
 Fri, 27 Aug 2021 01:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210826200720.2196827-1-philmd@redhat.com>
 <20210826200720.2196827-4-philmd@redhat.com>
 <b8842325-cf0c-31f6-a4ba-68890eea4e49@ilande.co.uk>
In-Reply-To: <b8842325-cf0c-31f6-a4ba-68890eea4e49@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Aug 2021 09:54:40 +0100
Message-ID: <CAFEAcA-fn4L9mSqvq+fQ9FhNnvAYv5gJmRMGYbQJNdJ15h81Lg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/usb/xhci: Always expect 'dma' link property to
 be set
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 at 22:15, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 26/08/2021 21:07, Philippe Mathieu-Daud=C3=A9 wrote:
>
> > Simplify by always passing a MemoryRegion property to the device.
> > Doing so we can move the AddressSpace field to the device struct,
> > removing need for heap allocation.
> >
> > Update the MicroVM machine to pass the default system memory instead
> > of a NULL value.
> >
> > We don't need to change the Versal machine, as the link property is
> > initialize as "versal.dwc3_alias" MemoryRegion alias.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > Versal untested
> > ---
> >   hw/usb/hcd-xhci.h        |  2 +-
> >   hw/i386/microvm.c        |  2 ++
> >   hw/usb/hcd-xhci-pci.c    |  3 ++-
> >   hw/usb/hcd-xhci-sysbus.c | 13 ++++++-------
> >   hw/usb/hcd-xhci.c        | 20 ++++++++++----------
> >   5 files changed, 21 insertions(+), 19 deletions(-)
> >
> > diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
> > index 98f598382ad..ea76ec4f277 100644
> > --- a/hw/usb/hcd-xhci.h
> > +++ b/hw/usb/hcd-xhci.h
> > @@ -180,7 +180,7 @@ typedef struct XHCIState {
> >       USBBus bus;
> >       MemoryRegion mem;
> >       MemoryRegion *dma_mr;
> > -    AddressSpace *as;
> > +    AddressSpace as;
> >       MemoryRegion mem_cap;
> >       MemoryRegion mem_oper;
> >       MemoryRegion mem_runtime;
> > diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> > index aba0c832190..2d55114a676 100644
> > --- a/hw/i386/microvm.c
> > +++ b/hw/i386/microvm.c
> > @@ -219,6 +219,8 @@ static void microvm_devices_init(MicrovmMachineStat=
e *mms)
> >           qdev_prop_set_uint32(dev, "slots", XHCI_MAXSLOTS);
> >           qdev_prop_set_uint32(dev, "p2", 8);
> >           qdev_prop_set_uint32(dev, "p3", 8);
> > +        object_property_set_link(OBJECT(dev), "dma",
> > +                                 OBJECT(get_system_memory()), &error_a=
bort);
>
> In a way I could see why you may wish to explicitly set the DMA memory re=
gion, but a
> quick look around suggests that devices where the memory region is unspec=
ified
> (typically using a link property called "dma_mr") then the default is ass=
umed to be
> get_system_memory(). That seems a reasonably intuitive default to me, but=
 presumably
> there is another type of mistake you're trying to guard against here?

Mostly we have allowed a default for "dma link not set" as a transitional
thing. When we added the 'dma' links to a device which had multiple users
and we didn't at the time want to go through and modify all those users to
make sure they all set the link, we made the device default if the link
wasn't set be "behave the same way the device behaved before we added suppo=
rt
for the link property". I think it's useful cleanup to get rid of the
back-compat
default -- from a theoretical perspective devices should mostly not
be directly grabbing and using the system_memory.

> > @@ -43,13 +48,7 @@ static void xhci_sysbus_realize(DeviceState *dev, Er=
ror **errp)
> >       s->irq =3D g_new0(qemu_irq, s->xhci.numintrs);
> >       qdev_init_gpio_out_named(dev, s->irq, SYSBUS_DEVICE_GPIO_IRQ,
> >                                s->xhci.numintrs);
> > -    if (s->xhci.dma_mr) {
> > -        s->xhci.as =3D  g_malloc0(sizeof(AddressSpace));
> > -        address_space_init(s->xhci.as, s->xhci.dma_mr, NULL);
> > -    } else {
> > -        s->xhci.as =3D &address_space_memory;
> > -    }
> > -
> > +    address_space_init(&s->xhci.as, s->xhci.dma_mr, "usb-xhci-dma");
> >       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->xhci.mem);
> >   }
>
> My understanding of the patch is that you're trying to avoid the heap all=
ocation
> above (which is a good idea!) so from that perspective all you need is so=
mewhere to
> store the AddressSpace used for the the xhci-sysbus device, for which XHC=
ISysbusState
> would be the natural choice.
>
> It seems to me that the easiest approach is just to set the s->xhci.as po=
inter in
> xhci_sysbus_realize() in exactly the same as usb_xhci_pci_realize() does:
>
> typedef struct XHCISysbusState {
>      ...
>      ...
>      AddressSpace as;
> } XHCISysbusState
>
> static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
> {
>      XHCISysbusState *s =3D XHCI_SYSBUS(dev);
>      ...
>      ...
>      address_space_init(&s->as, s->xhci.dma_mr ? s->xhci.dma_mr : get_sys=
tem_memory(),
>                         "usb-xhci-dma");
>      s->xhci.as =3D &s->as;
> }
>
> I think this approach is clearer since the xhci-sysbus device always crea=
tes its own
> address space which is either an alias onto normal system memory or the c=
ustom
> MemoryRegion provided via the "dma_mr" link property.

I don't think we should continue to provide the back-compat fallback
for "no link property set", but I agree that we should have
have s->xhci.as =3D &s->as. This means that for the PCI case we can
continue to set s->xhci.as =3D pci_address_space(), so the other patch
that exposes the root MR of the PCI AS then becomes unneeded.

-- PMM

