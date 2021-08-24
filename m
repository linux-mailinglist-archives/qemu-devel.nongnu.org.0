Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A23C3F5CD3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 13:07:43 +0200 (CEST)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIUHN-00020J-UC
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 07:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIUGa-0001G7-UI
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:06:53 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIUGZ-0007pm-5f
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:06:52 -0400
Received: by mail-pf1-x42e.google.com with SMTP id r9so1967087pfh.6
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=j5EKy/b1NrAh169gSdC66r8+FdAZVocl7hp5n9DKnrI=;
 b=1uhRkhGxgA4n3jnVxBcbVfg73D6YbToaQ8imkU9hyaSj+3+NCPTlvNaSSFccJABvD8
 49Id2qF1hJ/3LVwHPKSgPX/2iqTeHTOTwTKmUV5RszTeKfV+m8aGcrVLQVskE53QnZpJ
 Yq3FTY73yXZmLOpjUteH0CngYnluK+pkWDcCYbVpxwCoBkESOGlsMmL7F45A7o+ZaYcA
 /1HrW6CjAMnzgFogw7nLCH05GsshV+ycx5lf1bB8TNSt8z+cUF1DP6NJx3NIbqKo3jaY
 t4/rt0Oq5ufl1KmO4pPlYUhGvpibqiz8q6tJpJKSh8pZwYQymzTR7xSyVzwX71SLc64n
 5pdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=j5EKy/b1NrAh169gSdC66r8+FdAZVocl7hp5n9DKnrI=;
 b=hMMwdblifLHPR+8mGH8sCoM3Z4Fpg5MMGKq1EoZ/XaWvuNjeFZxij54I4QthKIi4VI
 5vFNEA9cy6UFd8s9eT9HVc8u0mwjkCkd2CuGaF4lkusGRewNtjGgmXvA+JjS0J8GARYa
 DVjcj5oSKbHUzSCkuM7Ltry/lGLiJeinmOdM6aEX6ayj/ls/wKJeWtdmEWUD1u6cWMek
 xXQCNVOxxHrrSedhjL7dx9EchK3xtDvFyeE8B2jNH4j8SjQxRhMjvBogg7WlII3N7AdE
 5AgLGfwMVjbEfiPIKUzNDWLyH6FBDnGKpl/dgnJNFHCl4OsmdAwAoUAgSc2VqonGU1GT
 zG/w==
X-Gm-Message-State: AOAM531P5TjXTw9Z8KD3QDsW8WqkJ/261g6/UTSnW0vEYQY0ipkf6wpo
 Kg0AIFbWnhef8Z+90adBA+gdXA==
X-Google-Smtp-Source: ABdhPJxKmzloXr+00VotqFyCKspVoNr2psl64AOnQpppZouEfy4ofxZKppV6RCWgn42b0ELDQuFDrQ==
X-Received: by 2002:aa7:8484:0:b029:3e0:805e:9f67 with SMTP id
 u4-20020aa784840000b02903e0805e9f67mr38777446pfn.73.1629803209690; 
 Tue, 24 Aug 2021 04:06:49 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.135.45])
 by smtp.googlemail.com with ESMTPSA id c19sm2144175pjs.1.2021.08.24.04.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 04:06:49 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 24 Aug 2021 16:36:44 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
In-Reply-To: <alpine.DEB.2.22.394.2108241603590.891355@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2108241636100.892262@anisinha-lenovo>
References: <20210821150535.763541-1-ani@anisinha.ca>
 <20210823190444-mutt-send-email-mst@kernel.org>
 <20210824105614.2762541f@redhat.com>
 <alpine.DEB.2.22.394.2108241603590.891355@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42e.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 24 Aug 2021, Ani Sinha wrote:

>
>
> On Tue, 24 Aug 2021, Igor Mammedov wrote:
>
> > On Mon, 23 Aug 2021 19:06:47 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:
> > > > Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
> > > > We need to validate the presence of this property before performing any hotplug
> > > > related callback operations. Currently validation of the existence of this
> > > > property was absent from acpi_pcihp_device_unplug_cb() function but is present
> > > > in other hotplug/unplug callback functions. Hence, this change adds the missing
> > > > check for the above function.
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > >
> > > I queued this but I have a general question:
> > I convinced myself that this patch is wrong, pls drop it.
> >
> > > are all these errors logged with LOG_GUEST_ERROR?
> > > Because if not we have a security problem.
> > > I also note that bsel is an internal property,
> > > I am not sure we should be printing this to users,
> > > it might just confuse them.
> > >
> > > Same question for all the other places validating bsel.
> >
> > Commit message misses reproducer/explanation about
> > how it could be triggered?
> >
> > If it's actually reachable, from my point of view
> > putting checks all through out call chain is not robust
> > and it's easy to miss issues caused by invalid bsel.
> > Instead of putting check all over the code, I'd
> > check value on entry points (pci_read/pci_write)
> > if code there is broken.
> >
> > >
> > > > ---
> > > >  hw/acpi/pcihp.c | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > index 0fd0c1d811..9982815a87 100644
> > > > --- a/hw/acpi/pcihp.c
> > > > +++ b/hw/acpi/pcihp.c
> > > > @@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> > > >                                   DeviceState *dev, Error **errp)
> > > >  {
> > > >      PCIDevice *pdev = PCI_DEVICE(dev);
> > > > +    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
> > > > +
> > > > +    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
> > > >
> > > > -    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
> > > > -                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
> > > > +    if (bsel < 0) {
> > > > +        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> > > > +                   ACPI_PCIHP_PROP_BSEL "' set");
> > > > +        return;
> > > > +    }
> >
> > 1st:
> >  Error here is useless. this path is triggered on guest
> >  MMIO write and there is no consumer for error whatsoever.
> >  If I recall correctly, in such cases we in PCIHP code we make
> >  such access a silent NOP. And tracing is there for a us
> >  to help figure out what's going on.
> >
> > 2nd:
> >  if it got this far, it means a device on a bus with bsel
> >  was found and we are completing cleanup. Error-ing out at
> >  this point will leak acpi_index.
>
> The above two points seems to apply in this case as well and so should we
> do this?
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 0fd0c1d811..c7692f5d5f 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -400,12 +400,6 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>
>      trace_acpi_pci_unplug_request(bsel, slot);
>
> -    if (bsel < 0) {
> -        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> -                   ACPI_PCIHP_PROP_BSEL "' set");
> -        return;
> -    }
> -
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }

or add g_assert() on both instead.

