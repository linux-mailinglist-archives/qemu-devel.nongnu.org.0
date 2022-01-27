Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B249ED61
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:26:47 +0100 (CET)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCI2-0005VO-6L
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nDCEW-0004iO-2R
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:23:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nDCEQ-0000q2-Hm
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643318579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzO7azUufcqeY4kurW7VdPrNgJb4dACUTSdW9nUm6hY=;
 b=Oy3nhN9OmfYUafmxkg/4k/iUguh0AeE1kUpRRwxMrjPCpMrE127Cg68oXgw2oEUzzJd3Hb
 NnxukJJ01p5Jq4lFUvZcnkry+OsFBPJe8P92a2qTY34shyRHU1pDndC+jJS+ZZOmRDbD5Z
 fNB1ZYAOZn2leq+tlc/EHY8HYBJDrxY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-i9Ld3glpOruOjpWLV5U5Ow-1; Thu, 27 Jan 2022 16:22:56 -0500
X-MC-Unique: i9Ld3glpOruOjpWLV5U5Ow-1
Received: by mail-ot1-f70.google.com with SMTP id
 c3-20020a9d6c83000000b00591cba30d03so2216760otr.7
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 13:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0C8aCpD4ecDdh71gNMgxw9Xhow3wfoBoCtgQJNUr/rU=;
 b=1cFt1OrVK+0S+pMkJYxaTpCA7J3BoLC42kBubylu+I/o9JynwbSx7tl4IxEpwDZv+l
 PCg+inpyQytYayhfgLVbyjZm65glKLl/vzqW3bYb8qABm+w18wYLiyaQXrCoEjDA8CI9
 KojQSUrq5XniO3iz3bb4qMq8SBjltFwn9Anj/cB6mrvPZSBII706aj0L+Sl/iLgi6d7W
 n3zAnPXmOZm0cObqVuBQK9frOr0ry5f28ihOTkedz6CDzHWnXZDV575mIWs0pA0w6Lq/
 0KuWFkb8B2kLw5Fia1L2Jtl08Pt7o5T1vdi9bHy1557UtFtiAZo/sSTwMtIzXjb5sLhS
 COyw==
X-Gm-Message-State: AOAM533OTuTgj3eBNbi3iy02WdUUQtxKvlZf+k5z4x8NU1Do91897ej0
 JZpZwqGolnf8G8+kynJSF9LzOfPNbqHA61D3yIxb2/38apKqpSJiClENGBh2n71svljNiaNY+zD
 DG8j17oKRDcq0pRE=
X-Received: by 2002:a05:6830:2649:: with SMTP id
 f9mr1688253otu.141.1643318575263; 
 Thu, 27 Jan 2022 13:22:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwka7xmpuDqAn6DvfBTk0RWBgiqTgeBd6NMD2bnSKLO/EmpnV1jOSNC1CLZ14iBFAhyS6jNeA==
X-Received: by 2002:a05:6830:2649:: with SMTP id
 f9mr1688228otu.141.1643318575010; 
 Thu, 27 Jan 2022 13:22:55 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id q18sm2900610otf.54.2022.01.27.13.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 13:22:54 -0800 (PST)
Date: Thu, 27 Jan 2022 14:22:53 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220127142253.21ab0025.alex.williamson@redhat.com>
In-Reply-To: <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, "Daniel
 P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 08:30:13 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Jan 26, 2022 at 04:13:33PM -0500, Michael S. Tsirkin wrote:
> > On Wed, Jan 26, 2022 at 08:07:36PM +0000, Dr. David Alan Gilbert wrote:=
 =20
> > > * Stefan Hajnoczi (stefanha@redhat.com) wrote: =20
> > > > On Wed, Jan 26, 2022 at 05:27:32AM +0000, Jag Raman wrote: =20
> > > > >=20
> > > > >  =20
> > > > > > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert@r=
edhat.com> wrote:
> > > > > >=20
> > > > > > * Jag Raman (jag.raman@oracle.com) wrote: =20
> > > > > >>=20
> > > > > >>  =20
> > > > > >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > > > > >>>=20
> > > > > >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman w=
rote: =20
> > > > > >>>> Allow PCI buses to be part of isolated CPU address spaces. T=
his has a
> > > > > >>>> niche usage.
> > > > > >>>>=20
> > > > > >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI d=
evices in
> > > > > >>>> the same machine/server. This would cause address space coll=
ision as
> > > > > >>>> well as be a security vulnerability. Having separate address=
 spaces for
> > > > > >>>> each PCI bus would solve this problem. =20
> > > > > >>>=20
> > > > > >>> Fascinating, but I am not sure I understand. any examples? =
=20
> > > > > >>=20
> > > > > >> Hi Michael!
> > > > > >>=20
> > > > > >> multiprocess QEMU and vfio-user implement a client-server mode=
l to allow
> > > > > >> out-of-process emulation of devices. The client QEMU, which ma=
kes ioctls
> > > > > >> to the kernel and runs VCPUs, could attach devices running in =
a server
> > > > > >> QEMU. The server QEMU needs access to parts of the client=E2=
=80=99s RAM to
> > > > > >> perform DMA. =20
> > > > > >=20
> > > > > > Do you ever have the opposite problem? i.e. when an emulated PC=
I device =20
> > > > >=20
> > > > > That=E2=80=99s an interesting question.
> > > > >  =20
> > > > > > exposes a chunk of RAM-like space (frame buffer, or maybe a map=
ped file)
> > > > > > that the client can see.  What happens if two emulated devices =
need to
> > > > > > access each others emulated address space? =20
> > > > >=20
> > > > > In this case, the kernel driver would map the destination=E2=80=
=99s chunk of internal RAM into
> > > > > the DMA space of the source device. Then the source device could =
write to that
> > > > > mapped address range, and the IOMMU should direct those writes to=
 the
> > > > > destination device.
> > > > >=20
> > > > > I would like to take a closer look at the IOMMU implementation on=
 how to achieve
> > > > > this, and get back to you. I think the IOMMU would handle this. C=
ould you please
> > > > > point me to the IOMMU implementation you have in mind? =20
> > > >=20
> > > > I don't know if the current vfio-user client/server patches already
> > > > implement device-to-device DMA, but the functionality is supported =
by
> > > > the vfio-user protocol.
> > > >=20
> > > > Basically: if the DMA regions lookup inside the vfio-user server fa=
ils,
> > > > fall back to VFIO_USER_DMA_READ/WRITE messages instead.
> > > > https://github.com/nutanix/libvfio-user/blob/master/docs/vfio-user.=
rst#vfio-user-dma-read
> > > >=20
> > > > Here is the flow:
> > > > 1. The vfio-user server with device A sends a DMA read to QEMU.
> > > > 2. QEMU finds the MemoryRegion associated with the DMA address and =
sees
> > > >    it's a device.
> > > >    a. If it's emulated inside the QEMU process then the normal
> > > >       device emulation code kicks in.
> > > >    b. If it's another vfio-user PCI device then the vfio-user PCI p=
roxy
> > > >       device forwards the DMA to the second vfio-user server's devi=
ce B. =20
> > >=20
> > > I'm starting to be curious if there's a way to persuade the guest ker=
nel
> > > to do it for us; in general is there a way to say to PCI devices that
> > > they can only DMA to the host and not other PCI devices? =20
> >=20
> >=20
> > But of course - this is how e.g. VFIO protects host PCI devices from
> > each other when one of them is passed through to a VM. =20
>=20
> Michael: Are you saying just turn on vIOMMU? :)
>=20
> Devices in different VFIO groups have their own IOMMU context, so their
> IOVA space is isolated. Just don't map other devices into the IOVA space
> and those other devices will be inaccessible.

Devices in different VFIO *containers* have their own IOMMU context.
Based on the group attachment to a container, groups can either have
shared or isolated IOVA space.  That determination is made by looking
at the address space of the bus, which is governed by the presence of a
vIOMMU.

If the goal here is to restrict DMA between devices, ie. peer-to-peer
(p2p), why are we trying to re-invent what an IOMMU already does?  In
fact, it seems like an IOMMU does this better in providing an IOVA
address space per BDF.  Is the dynamic mapping overhead too much?  What
physical hardware properties or specifications could we leverage to
restrict p2p mappings to a device?  Should it be governed by machine
type to provide consistency between devices?  Should each "isolated"
bus be in a separate root complex?  Thanks,

Alex


