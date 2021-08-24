Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A43F5C39
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:38:34 +0200 (CEST)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITp5-0005Zf-Sn
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIToK-0004ti-5o
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 06:37:40 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIToI-0004CF-FW
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 06:37:39 -0400
Received: by mail-pl1-x633.google.com with SMTP id q21so2977993plq.3
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 03:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=dnHGf/wBPHCxJzJyFg5/CGbXRTFQpWl5wVzOc+r0hYU=;
 b=k+LuLW1fvuk9XMYQj6U1Pkbjg/23zS7xgD6rP9VBp93H1131nIHw1lEnXQ+WY3/lle
 ykF8udiMsckD7n3ivBMVpR662i5MywwmWEbk+AkMUDRXqKB2hd8jHsm/3mRyhJnmtsXm
 s/1E1tF5YmuKi60YX7L7jueirxq2GP2zrhCqKRgPo3Hsolbtu3CCVKInZnloNQEpomBV
 PPTX3hOnsJm7twSZw7myWQjelYKKie9BXja6ZlJTW6lXEOwAr5yQcSLLCSGkUSNYmG6O
 OynfrW2PtQbWeLmHzJg/0L660oDYTaqzSzQTIY/t8Theb5q4FsKnxJoQwAOneEvVNkne
 OnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=dnHGf/wBPHCxJzJyFg5/CGbXRTFQpWl5wVzOc+r0hYU=;
 b=m54mHkaizPJaqqGCYgOVP28vWsUMpoFbjhUeVKhjeQ5o3f0IAYSoxtTQfUSIWoJTNz
 DUDfOFypXOiWDOfScdj04ll50rWGK7AGc40OuF31TJ7beYrVSRAa/kWwTCYTeDhe6ihb
 6P+RDZWh2cP7NWPAKhlQbMoDcvooG+/w5L0VPTAAQ26WgyZ9STOsK3/gP3DkKQOqOEti
 vxlaI+7OAVIML+e1obOTKN6AtCx5BEWr/vXEqT/B2zIYVfJoxyqw+8J/aSxhTzu75Yq8
 RnIhV8YtNxQnPEA0xBNzBw98vAGnIoKqOhclxWsLbueXeOYG8ZMdUv6s0N4UjY4mRx/V
 ON7w==
X-Gm-Message-State: AOAM531E87mr4VeEPCCbHmJIPnG+yA54b/EaTMvyzE56nCeA8yKEU3AI
 DE23I1yUHu3g1RInwUJQf1vK9g==
X-Google-Smtp-Source: ABdhPJzR4NLqo2nQyHeADypyMw58F/sHGTN9Ke7VFyUAdrbeKw5CHicxg078RV5GHzQoqvsuJ4zCUQ==
X-Received: by 2002:a17:90b:3d7:: with SMTP id
 go23mr2592512pjb.115.1629801456429; 
 Tue, 24 Aug 2021 03:37:36 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.135.45])
 by smtp.googlemail.com with ESMTPSA id q18sm2244392pfj.46.2021.08.24.03.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 03:37:35 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 24 Aug 2021 16:07:30 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
In-Reply-To: <20210824105614.2762541f@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2108241603590.891355@anisinha-lenovo>
References: <20210821150535.763541-1-ani@anisinha.ca>
 <20210823190444-mutt-send-email-mst@kernel.org>
 <20210824105614.2762541f@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x633.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, philmd@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 24 Aug 2021, Igor Mammedov wrote:

> On Mon, 23 Aug 2021 19:06:47 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> > On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:
> > > Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
> > > We need to validate the presence of this property before performing any hotplug
> > > related callback operations. Currently validation of the existence of this
> > > property was absent from acpi_pcihp_device_unplug_cb() function but is present
> > > in other hotplug/unplug callback functions. Hence, this change adds the missing
> > > check for the above function.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >
> > I queued this but I have a general question:
> I convinced myself that this patch is wrong, pls drop it.
>
> > are all these errors logged with LOG_GUEST_ERROR?
> > Because if not we have a security problem.
> > I also note that bsel is an internal property,
> > I am not sure we should be printing this to users,
> > it might just confuse them.
> >
> > Same question for all the other places validating bsel.
>
> Commit message misses reproducer/explanation about
> how it could be triggered?
>
> If it's actually reachable, from my point of view
> putting checks all through out call chain is not robust
> and it's easy to miss issues caused by invalid bsel.
> Instead of putting check all over the code, I'd
> check value on entry points (pci_read/pci_write)
> if code there is broken.
>
> >
> > > ---
> > >  hw/acpi/pcihp.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index 0fd0c1d811..9982815a87 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> > >                                   DeviceState *dev, Error **errp)
> > >  {
> > >      PCIDevice *pdev = PCI_DEVICE(dev);
> > > +    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
> > > +
> > > +    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
> > >
> > > -    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
> > > -                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
> > > +    if (bsel < 0) {
> > > +        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> > > +                   ACPI_PCIHP_PROP_BSEL "' set");
> > > +        return;
> > > +    }
>
> 1st:
>  Error here is useless. this path is triggered on guest
>  MMIO write and there is no consumer for error whatsoever.
>  If I recall correctly, in such cases we in PCIHP code we make
>  such access a silent NOP. And tracing is there for a us
>  to help figure out what's going on.
>
> 2nd:
>  if it got this far, it means a device on a bus with bsel
>  was found and we are completing cleanup. Error-ing out at
>  this point will leak acpi_index.

The above two points seems to apply in this case as well and so should we
do this?

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 0fd0c1d811..c7692f5d5f 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -400,12 +400,6 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,

     trace_acpi_pci_unplug_request(bsel, slot);

-    if (bsel < 0) {
-        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
-                   ACPI_PCIHP_PROP_BSEL "' set");
-        return;
-    }
-
     s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }


I wanted to check before sending out a formal patch. I like symmetric
code.

