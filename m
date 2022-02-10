Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B52A4B19CE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:50:54 +0100 (CET)
Received: from localhost ([::1]:59116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIJDB-0001uX-Ey
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nIJC1-0001Db-Lq
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nIJBy-0001yA-7W
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644536977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MN3vdqmmTW8/mSllGzMKg2lh73aXQc2X8nylIBLLdSk=;
 b=Skwt8/JeiPdKhWC5VraHyqRaGZYz/iTVHG7t62PCehwRCVeKCKCz5A/vkH3PMy3JaEFP+5
 k1q55wqQ6de//XvVqSgiQhjN5srMHULe/tdwarZgk8s4j8TwkVIic7J7FqfL4k+zcJjar7
 r1y/2JqyurZpn5e9WC+VNm5C99bOnok=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-CaHCQEzINzSRi_4IWH9mxA-1; Thu, 10 Feb 2022 18:49:36 -0500
X-MC-Unique: CaHCQEzINzSRi_4IWH9mxA-1
Received: by mail-il1-f198.google.com with SMTP id
 p8-20020a056e02144800b002be41f4c3d2so4974380ilo.15
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=MN3vdqmmTW8/mSllGzMKg2lh73aXQc2X8nylIBLLdSk=;
 b=wFOrC5Wnx72Avo1mH26xtZIdkweNwomCKmcIL6qTf4wvZVP4z1aMSZagZWqNQYvAWY
 uI13P9qJcYna6fy0HWnOeB4A4/kMh156gYs1LmtyRFSRwhCeKhSXfwvgjkR1ry5V2x09
 X+u1718flhrjyqVghz+wT7UoeTb/T3pTgmcPuBlPJDrKzGcMrDObBpTn6G9ijnFB7Y33
 C7zFz+gQ0ttobNX02pkxArfPwJL1CbpZJrSg8LJmW3lqmaB1iZS5Su8km8XVYho6H7Kw
 KCvsoZFDbjriPa5Nml4Kllc/TtthmSzNAm1awg/WQQ2F9HVby6XE7RzZOOkrvA7oy32d
 ok1g==
X-Gm-Message-State: AOAM530ELGL1m4/fugllW3BVkRLmBvH4fQhy8bnkzn1Pbo5xVqiulf14
 z+gzubkoUsbpVbQZKeVg/lnEGT136TjGQLg3hVJ0rb2v1udbaH0j2l4ojhFFEMSRKK+nM4yKzsR
 ENdxiHDBugvuERrI=
X-Received: by 2002:a05:6e02:1849:: with SMTP id
 b9mr5102328ilv.288.1644536975816; 
 Thu, 10 Feb 2022 15:49:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCL40p/v4bWAHJafvvMNr8wV1uqNIKX7MUcw6CbOVjXjiRrnc+VOJ7ALzOY8Ov/cFHkGGTAg==
X-Received: by 2002:a05:6e02:1849:: with SMTP id
 b9mr5102310ilv.288.1644536975566; 
 Thu, 10 Feb 2022 15:49:35 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id d11sm12065598ioc.49.2022.02.10.15.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 15:49:35 -0800 (PST)
Date: Thu, 10 Feb 2022 16:49:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220210164933.53b32a1e.alex.williamson@redhat.com>
In-Reply-To: <20220210182157-mutt-send-email-mst@kernel.org>
References: <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
 <20220201223432.4f58518f.alex.williamson@redhat.com>
 <69BE660C-C527-459B-A392-F5546A0BEB5B@oracle.com>
 <20220210022543-mutt-send-email-mst@kernel.org>
 <9E989878-326F-4E72-85DD-34D1CB72F0F8@oracle.com>
 <20220210161734.18f36e8b.alex.williamson@redhat.com>
 <20220210182157-mutt-send-email-mst@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, "Daniel
 P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 18:28:56 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Feb 10, 2022 at 04:17:34PM -0700, Alex Williamson wrote:
> > On Thu, 10 Feb 2022 22:23:01 +0000
> > Jag Raman <jag.raman@oracle.com> wrote:
> >  =20
> > > > On Feb 10, 2022, at 3:02 AM, Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> > > >=20
> > > > On Thu, Feb 10, 2022 at 12:08:27AM +0000, Jag Raman wrote:   =20
> > > >>=20
> > > >> Thanks for the explanation, Alex. Thanks to everyone else in the t=
hread who
> > > >> helped to clarify this problem.
> > > >>=20
> > > >> We have implemented the memory isolation based on the discussion i=
n the
> > > >> thread. We will send the patches out shortly.
> > > >>=20
> > > >> Devices such as =E2=80=9Cname" and =E2=80=9Ce1000=E2=80=9D worked =
fine. But I=E2=80=99d like to note that
> > > >> the LSI device (TYPE_LSI53C895A) had some problems - it doesn=E2=
=80=99t seem
> > > >> to be IOMMU aware. In LSI=E2=80=99s case, the kernel driver is ask=
ing the device to
> > > >> read instructions from the CPU VA (lsi_execute_script() -> read_dw=
ord()),
> > > >> which is forbidden when IOMMU is enabled. Specifically, the driver=
 is asking
> > > >> the device to access other BAR regions by using the BAR address pr=
ogrammed
> > > >> in the PCI config space. This happens even without vfio-user patch=
es. For example,
> > > >> we could enable IOMMU using =E2=80=9C-device intel-iommu=E2=80=9D =
QEMU option and also
> > > >> adding the following to the kernel command-line: =E2=80=9Cintel_io=
mmu=3Don iommu=3Dnopt=E2=80=9D.
> > > >> In this case, we could see an IOMMU fault.   =20
> > > >=20
> > > > So, device accessing its own BAR is different. Basically, these
> > > > transactions never go on the bus at all, never mind get to the IOMM=
U.   =20
> > >=20
> > > Hi Michael,
> > >=20
> > > In LSI case, I did notice that it went to the IOMMU. The device is re=
ading the BAR
> > > address as if it was a DMA address.
> > >  =20
> > > > I think it's just used as a handle to address internal device memor=
y.
> > > > This kind of trick is not universal, but not terribly unusual.
> > > >=20
> > > >    =20
> > > >> Unfortunately, we started off our project with the LSI device. So =
that lead to all the
> > > >> confusion about what is expected at the server end in-terms of
> > > >> vectoring/address-translation. It gave an impression as if the req=
uest was still on
> > > >> the CPU side of the PCI root complex, but the actual problem was w=
ith the
> > > >> device driver itself.
> > > >>=20
> > > >> I=E2=80=99m wondering how to deal with this problem. Would it be O=
K if we mapped the
> > > >> device=E2=80=99s BAR into the IOVA, at the same CPU VA programmed =
in the BAR registers?
> > > >> This would help devices such as LSI to circumvent this problem. On=
e problem
> > > >> with this approach is that it has the potential to collide with an=
other legitimate
> > > >> IOVA address. Kindly share your thought on this.
> > > >>=20
> > > >> Thank you!   =20
> > > >=20
> > > > I am not 100% sure what do you plan to do but it sounds fine since =
even
> > > > if it collides, with traditional PCI device must never initiate cyc=
les   =20
> > >=20
> > > OK sounds good, I=E2=80=99ll create a mapping of the device BARs in t=
he IOVA. =20
> >=20
> > I don't think this is correct.  Look for instance at ACPI _TRA support
> > where a system can specify a translation offset such that, for example,
> > a CPU access to a device is required to add the provided offset to the
> > bus address of the device.  A system using this could have multiple
> > root bridges, where each is given the same, overlapping MMIO aperture. =
=20
> > >From the processor perspective, each MMIO range is unique and possibly=
 =20
> > none of those devices have a zero _TRA, there could be system memory at
> > the equivalent flat memory address. =20
>=20
> I am guessing there are reasons to have these in acpi besides firmware
> vendors wanting to find corner cases in device implementations though
> :). E.g. it's possible something else is tweaking DMA in similar ways. I
> can't say for sure and I wonder why do we care as long as QEMU does not
> have _TRA.

How many complaints do we get about running out of I/O port space on
q35 because we allow an arbitrary number of root ports?  What if we
used _TRA to provide the full I/O port range per root port?  32-bit
MMIO could be duplicated as well.

> > So if the transaction actually hits this bus, which I think is what
> > making use of the device AddressSpace implies, I don't think it can
> > assume that it's simply reflected back at itself.  Conventional PCI and
> > PCI Express may be software compatible, but there's a reason we don't
> > see IOMMUs that provide both translation and isolation in conventional
> > topologies.
> >=20
> > Is this more a bug in the LSI device emulation model?  For instance in
> > vfio-pci, if I want to access an offset into a BAR from within QEMU, I
> > don't care what address is programmed into that BAR, I perform an
> > access relative to the vfio file descriptor region representing that
> > BAR space.  I'd expect that any viable device emulation model does the
> > same, an access to device memory uses an offset from an internal
> > resource, irrespective of the BAR address. =20
>=20
> However, using BAR seems like a reasonable shortcut allowing
> device to use the same 64 bit address to refer to system
> and device RAM interchangeably.

A shortcut that breaks when an IOMMU is involved.

> > It would seem strange if the driver is actually programming the device
> > to DMA to itself and if that's actually happening, I'd wonder if this
> > driver is actually compatible with an IOMMU on bare metal. =20
>=20
> You know, it's hardware after all. As long as things work vendors
> happily ship the device. They don't really worry about theoretical issues=
 ;).

We're talking about a 32-bit conventional PCI device from the previous
century.  IOMMUs are no longer theoretical, but not all drivers have
kept up.  It's maybe not the best choice as the de facto standard
device, imo.  Thanks,

Alex


