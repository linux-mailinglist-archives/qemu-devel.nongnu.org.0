Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE7F3F5796
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 07:26:10 +0200 (CEST)
Received: from localhost ([::1]:45996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIOwr-0007gz-9g
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 01:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIOvx-00071Z-VT
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 01:25:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIOvq-0008EI-5C
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 01:25:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id j2so7121146pll.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 22:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=irWu+fJ3yhnhKxSDS2ktftPNEQ+etNMQJjcVx208QoQ=;
 b=FKPYJFQWXbw5dCxzr7zLdQQRvUkRgvY6FfW6Xe97xDlwPB0IgH4ShGwQZHGFjERX1G
 wksxlx+Cr1dJ0om0NPzsoCWGX3aujM/4LEwGCB7Cd1HqxhBx7mn8VLH5mbwkUGHbLs0z
 S2nvk0uSqs6CvcFQ55UBUelbtnAWa/WxM85kh98ogOAe2Mz3/skMNyRd01ds/zWs7vFa
 /i6qTFKUGKTl44dmjWSqobroLqqzkCYAr20G1AUOqYMhyrqUPwC4pMIpt8zaEtJ3twsu
 90VQigk0Z8wL9VekVV46UZUrH7RwF4h0aukagX337xK0YrRvshChr9LH+Val2ucbnvYJ
 cSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=irWu+fJ3yhnhKxSDS2ktftPNEQ+etNMQJjcVx208QoQ=;
 b=joDk1d6266FUcy1p6DSLCNryfPRhMqHetVjJQpSnYWAoOkHpJNzu4m/zXoSBUavrfF
 RZd8olkYcbpR/izC8kiw/kKpjoiRjrqDIQ+Enqzi+XVY2oeDd+dySRYgTxxn0IU6qUFr
 1UR8VWp9HCs8uG9T7WF9TmwaW1fhg+P6uU3FqVS91tfrHTmLEJLYaVi2n01/sboXcWFb
 cPlbswHtnljHbRO3t5ZL1h87JFkTewr1rIxikLRLzvu9JG9iI3U7qC7bPemYk72mfjbE
 Xvkg7OYQRoqVXBxl39Z2IwbTAlsIbZuel8uuWLPXtNLCcXuSZ3y2OMzF0Ga5PtzPpVbx
 zKtw==
X-Gm-Message-State: AOAM533u2OcuQg9Lh2nmm/Ph/PIvMQzWsrNL6pZ5ZcegjQjOoVvdDP8v
 qHJpM0VBh/SMUvdEm+GH1B63DQ==
X-Google-Smtp-Source: ABdhPJzsPmkWjoALMyeQUjmMPgORpz5C/4/fewu8eahJTkRQD/+Cz7QHoFW+jfK7+lzbKILW4aVdvw==
X-Received: by 2002:a17:90a:5147:: with SMTP id
 k7mr2462871pjm.204.1629782704059; 
 Mon, 23 Aug 2021 22:25:04 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.135.45])
 by smtp.googlemail.com with ESMTPSA id pc6sm938502pjb.29.2021.08.23.22.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 22:25:03 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 24 Aug 2021 10:54:56 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
In-Reply-To: <20210823190444-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2108241048300.875198@anisinha-lenovo>
References: <20210821150535.763541-1-ani@anisinha.ca>
 <20210823190444-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62e.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 23 Aug 2021, Michael S. Tsirkin wrote:

> On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:
> > Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
> > We need to validate the presence of this property before performing any hotplug
> > related callback operations. Currently validation of the existence of this
> > property was absent from acpi_pcihp_device_unplug_cb() function but is present
> > in other hotplug/unplug callback functions. Hence, this change adds the missing
> > check for the above function.
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
>
> I queued this but I have a general question:
> are all these errors logged with LOG_GUEST_ERROR?

I do not think they are logged that way. These logs go to stderr which can
end up in the qemu guest specific log file when qemu is run daemonized.

That being said, other platforms, for example virtio-pci also seems to do
what we do. They use error_setg() as well under similar conditions.

> Because if not we have a security problem.
> I also note that bsel is an internal property,

yeah this I think is an issue. We can change the log so as to not say
anything about bsel. I will let Igor comment. I can send out a separate
patch to fix this.

> I am not sure we should be printing this to users,
> it might just confuse them.
>
> Same question for all the other places validating bsel.
>
> > ---
> >  hw/acpi/pcihp.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index 0fd0c1d811..9982815a87 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> >                                   DeviceState *dev, Error **errp)
> >  {
> >      PCIDevice *pdev = PCI_DEVICE(dev);
> > +    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
> > +
> > +    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
> >
> > -    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
> > -                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
> > +    if (bsel < 0) {
> > +        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> > +                   ACPI_PCIHP_PROP_BSEL "' set");
> > +        return;
> > +    }
> >
> >      /*
> >       * clean up acpi-index so it could reused by another device
> > --
> > 2.25.1
>
>

