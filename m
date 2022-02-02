Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A14A6E16
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 10:50:05 +0100 (CET)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFCH6-0006ic-PL
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 04:50:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFByb-0007sz-T7
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:30:59 -0500
Received: from [2a00:1450:4864:20::431] (port=33749
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFByZ-0007Aq-JP
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:30:57 -0500
Received: by mail-wr1-x431.google.com with SMTP id e8so37186475wrc.0
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 01:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HDe549wYjj6rXvovvVr8/Y0YdCdfc4BnKVCoZ/LneSI=;
 b=kl+YF7bTP3gSX9g+H6nP0YJg4RDIyKhg2bJwTjmPEHuOs7odOdQQl6zquVUJ4150X1
 8iWRW6xJQUsiiBUKMX0P9TGZ1JnSZQKNhST6TrL51+sNX1iqm6+7zWf3Pz4ASO4G9pri
 WOGBNfJhGkwejS3N83TG6hyOWbBRR6hSm5axdV4HhEvq+25AuXaeQNgs+gVnnNdBi6nm
 qRKboKHg2E+UHnhEjEnTSjhosQ4lsyCh7PmBpCNPtftaw+fDc2N+pHdRxEWN/rhHcw9r
 YYwFPnzbMAXBaAq/IUxTguliFwA89Dqwc+4MspbJo+wh3l3q8hjMSqXOWBgdfCKykByd
 8vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDe549wYjj6rXvovvVr8/Y0YdCdfc4BnKVCoZ/LneSI=;
 b=qijczMeLHpL6HciO0jX9Ii5LIHixVZcrwx3grPVlAqp6B2ndUqiGST5cym01kjGBkC
 8PlWcdNW+MlmnYcGDcUmdCqqPsvinzXTbcvfYI+VERR+XbFhQxQs4dHbVJTKz8nLIf5e
 Aj6bUP/tiP6Pw12owuciSUN4qXEVgXZIuMdqqCqx+unAstiibaviFdsCXJuJ/656dONA
 GnjVipp0BN+pUg4RelX8TdzQBiL5aVEUoSXJlP94UPzc0MGKeUQGp3s51Txc0KttCF7l
 TT90Npn0AbkR+epYc4/YccF4+44GHPf0UzjVnEVdacO9G2W7xyO/6dsTonGONgVN1Lik
 jwtA==
X-Gm-Message-State: AOAM531+bHySRm5C7/ns3xxJysb7ehHaW839ZlTKRw1hfIJHctAN3QnK
 Dm0KG3A0bL88gXCZ5exFDtMs7LxSnLP7enq1Z9NlVQ==
X-Google-Smtp-Source: ABdhPJypP4JMxUyl8IZqA2HOeFgm7COF46YN4x+sHJfxYQJs89bAfLM8dqPHb8P7ouTmc+X+pOoSkCxFELVWGfk++rY=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr25296118wrv.521.1643794253456; 
 Wed, 02 Feb 2022 01:30:53 -0800 (PST)
MIME-Version: 1.0
References: <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm> <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain> <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
In-Reply-To: <20220201154736.576e2a7e.alex.williamson@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Feb 2022 09:30:42 +0000
Message-ID: <CAFEAcA-f6ZBgAtKr-nUFTR8nfMGVWF=uExoRaMajN7t6wU7f7g@mail.gmail.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 23:51, Alex Williamson <alex.williamson@redhat.com> wrote:
>
> On Tue, 1 Feb 2022 21:24:08 +0000
> Jag Raman <jag.raman@oracle.com> wrote:
> > The PCIBus data structure already has address_space_mem and
> > address_space_io to contain the BAR regions of devices attached
> > to it. I understand that these two PCIBus members form the
> > PCI address space.
>
> These are the CPU address spaces.  When there's no IOMMU, the PCI bus is
> identity mapped to the CPU address space.  When there is an IOMMU, the
> device address space is determined by the granularity of the IOMMU and
> may be entirely separate from address_space_mem.

Note that those fields in PCIBus are just whatever MemoryRegions
the pci controller model passed in to the call to pci_root_bus_init()
or equivalent. They may or may not be specifically the CPU's view
of anything. (For instance on the versatilepb board, the PCI controller
is visible to the CPU via several MMIO "windows" at known addresses,
which let the CPU access into the PCI address space at a programmable
offset. We model that by creating a couple of container MRs which
we pass to pci_root_bus_init() to be the PCI memory and IO spaces,
and then using alias MRs to provide the view into those at the
guest-programmed offset. The CPU sees those windows, and doesn't
have direct access to the whole PCIBus::address_space_mem.)
I guess you could say they're the PCI controller's view of the PCI
address space ?

We have a tendency to be a bit sloppy with use of AddressSpaces
within QEMU where it happens that the view of the world that a
DMA-capable device matches that of the CPU, but conceptually
they can definitely be different, especially in the non-x86 world.
(Linux also confuses matters here by preferring to program a 1:1
mapping even if the hardware is more flexible and can do other things.
The model of the h/w in QEMU should support the other cases too, not
just 1:1.)

> I/O port space is always the identity mapped CPU address space unless
> sparse translations are used to create multiple I/O port spaces (not
> implemented).  I/O port space is only accessed by the CPU, there are no
> device initiated I/O port transactions, so the address space relative
> to the device is irrelevant.

Does the PCI spec actually forbid any master except the CPU from
issuing I/O port transactions, or is it just that in practice nobody
makes a PCI device that does weird stuff like that ?

thanks
-- PMM

