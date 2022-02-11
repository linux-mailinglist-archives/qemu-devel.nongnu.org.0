Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70574B1A6A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 01:28:42 +0100 (CET)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIJnk-0000cH-TP
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 19:28:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nIJmI-0008K0-LU
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nIJmD-0001hZ-UT
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644539224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWKDYOshri6/YD2GIcwXUI4i1qEOrl9mueMWB7Wlvng=;
 b=gow0X22yDq7AgT6ZjBF8wMZkLLY25tNMjY8Ipr+WSz12e5t55wIlQ7xeSHP6Ti8VoLEZY5
 NhBKVn90Rr4w/KEvMS3x6FY11XvFrE5lUxU8VWfi9WP8ZyUCQhwxLRDQcnAES3EIZWq7Fo
 TcoRNcNwnrEePj4J2qyyukN9xn7dIrs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-paRBAn2MO-SCuME8v2YWNg-1; Thu, 10 Feb 2022 19:27:03 -0500
X-MC-Unique: paRBAn2MO-SCuME8v2YWNg-1
Received: by mail-ed1-f69.google.com with SMTP id
 en7-20020a056402528700b00404aba0a6ffso4367457edb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 16:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZWKDYOshri6/YD2GIcwXUI4i1qEOrl9mueMWB7Wlvng=;
 b=RZ9apfBj40Ed0PdCrnWrr4T1nmpHx4Q/GSQWklLOl6rw4U2YGvN821j/kE0q49/G/6
 Mn0AfaiinH8iHzmjLdGT79fGpiEbK/bHidGwH2pl/bY6L3x1dFR6HQkAFB/dB4XLx1ql
 LXxJz77bvLtbknOTYmC4Stae8cCBDL7Qyy4Fpi6OO1L7V1ymWr02FETQQyYf2tRVHkBn
 EBlT6bTsM0xZRpx4e68qIW/LYz977KZ6iAvkkAw5mQkh6b7safuOxLJVgvuDNzqLFEQL
 0rWP12ItAZQ/EFtqRssFVrXsvpyA+V/bRc6XljqRj1f4nVE5pR2dhIV4cJeyD0gTUt6b
 oevA==
X-Gm-Message-State: AOAM531FGy7Bi9h3nAR2FV3N+fe8ZW9VDSXtYTtBZu6at//3FR3A/u4S
 PBa4cqUkRKjZpbFssGl3AkkY6M27GNYjhUBG737hJRQFuzxhzZbCclhZgY3Q9nvVR904NfQyW6s
 5AymxW1s6Ypg6NA4=
X-Received: by 2002:a05:6402:5191:: with SMTP id
 q17mr10886684edd.403.1644539222091; 
 Thu, 10 Feb 2022 16:27:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUEDZOtUBtbXx/sgT5abVaGdnwsGOR/ZGSP4cmsmzjv5hPxf3FIbvSdcrD/e/NcWiDqtSOuA==
X-Received: by 2002:a05:6402:5191:: with SMTP id
 q17mr10886662edd.403.1644539221875; 
 Thu, 10 Feb 2022 16:27:01 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:c2e4:719d:a20b:e234:2b71])
 by smtp.gmail.com with ESMTPSA id gu2sm7405176ejb.221.2022.02.10.16.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:27:01 -0800 (PST)
Date: Thu, 10 Feb 2022 19:26:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220210190654-mutt-send-email-mst@kernel.org>
References: <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
 <20220201223432.4f58518f.alex.williamson@redhat.com>
 <69BE660C-C527-459B-A392-F5546A0BEB5B@oracle.com>
 <20220210022543-mutt-send-email-mst@kernel.org>
 <9E989878-326F-4E72-85DD-34D1CB72F0F8@oracle.com>
 <20220210161734.18f36e8b.alex.williamson@redhat.com>
 <20220210182157-mutt-send-email-mst@kernel.org>
 <20220210164933.53b32a1e.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220210164933.53b32a1e.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 04:49:33PM -0700, Alex Williamson wrote:
> On Thu, 10 Feb 2022 18:28:56 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Feb 10, 2022 at 04:17:34PM -0700, Alex Williamson wrote:
> > > On Thu, 10 Feb 2022 22:23:01 +0000
> > > Jag Raman <jag.raman@oracle.com> wrote:
> > >   
> > > > > On Feb 10, 2022, at 3:02 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > 
> > > > > On Thu, Feb 10, 2022 at 12:08:27AM +0000, Jag Raman wrote:    
> > > > >> 
> > > > >> Thanks for the explanation, Alex. Thanks to everyone else in the thread who
> > > > >> helped to clarify this problem.
> > > > >> 
> > > > >> We have implemented the memory isolation based on the discussion in the
> > > > >> thread. We will send the patches out shortly.
> > > > >> 
> > > > >> Devices such as “name" and “e1000” worked fine. But I’d like to note that
> > > > >> the LSI device (TYPE_LSI53C895A) had some problems - it doesn’t seem
> > > > >> to be IOMMU aware. In LSI’s case, the kernel driver is asking the device to
> > > > >> read instructions from the CPU VA (lsi_execute_script() -> read_dword()),
> > > > >> which is forbidden when IOMMU is enabled. Specifically, the driver is asking
> > > > >> the device to access other BAR regions by using the BAR address programmed
> > > > >> in the PCI config space. This happens even without vfio-user patches. For example,
> > > > >> we could enable IOMMU using “-device intel-iommu” QEMU option and also
> > > > >> adding the following to the kernel command-line: “intel_iommu=on iommu=nopt”.
> > > > >> In this case, we could see an IOMMU fault.    
> > > > > 
> > > > > So, device accessing its own BAR is different. Basically, these
> > > > > transactions never go on the bus at all, never mind get to the IOMMU.    
> > > > 
> > > > Hi Michael,
> > > > 
> > > > In LSI case, I did notice that it went to the IOMMU. The device is reading the BAR
> > > > address as if it was a DMA address.
> > > >   
> > > > > I think it's just used as a handle to address internal device memory.
> > > > > This kind of trick is not universal, but not terribly unusual.
> > > > > 
> > > > >     
> > > > >> Unfortunately, we started off our project with the LSI device. So that lead to all the
> > > > >> confusion about what is expected at the server end in-terms of
> > > > >> vectoring/address-translation. It gave an impression as if the request was still on
> > > > >> the CPU side of the PCI root complex, but the actual problem was with the
> > > > >> device driver itself.
> > > > >> 
> > > > >> I’m wondering how to deal with this problem. Would it be OK if we mapped the
> > > > >> device’s BAR into the IOVA, at the same CPU VA programmed in the BAR registers?
> > > > >> This would help devices such as LSI to circumvent this problem. One problem
> > > > >> with this approach is that it has the potential to collide with another legitimate
> > > > >> IOVA address. Kindly share your thought on this.
> > > > >> 
> > > > >> Thank you!    
> > > > > 
> > > > > I am not 100% sure what do you plan to do but it sounds fine since even
> > > > > if it collides, with traditional PCI device must never initiate cycles    
> > > > 
> > > > OK sounds good, I’ll create a mapping of the device BARs in the IOVA.  
> > > 
> > > I don't think this is correct.  Look for instance at ACPI _TRA support
> > > where a system can specify a translation offset such that, for example,
> > > a CPU access to a device is required to add the provided offset to the
> > > bus address of the device.  A system using this could have multiple
> > > root bridges, where each is given the same, overlapping MMIO aperture.  
> > > >From the processor perspective, each MMIO range is unique and possibly  
> > > none of those devices have a zero _TRA, there could be system memory at
> > > the equivalent flat memory address.  
> > 
> > I am guessing there are reasons to have these in acpi besides firmware
> > vendors wanting to find corner cases in device implementations though
> > :). E.g. it's possible something else is tweaking DMA in similar ways. I
> > can't say for sure and I wonder why do we care as long as QEMU does not
> > have _TRA.
> 
> How many complaints do we get about running out of I/O port space on
> q35 because we allow an arbitrary number of root ports?  What if we
> used _TRA to provide the full I/O port range per root port?  32-bit
> MMIO could be duplicated as well.

It's an interesting idea. To clarify what I said, I suspect some devices
are broken in presence of translating bridges unless DMA
is also translated to match.

I agree it's a mess though, in that some devices when given their own
BAR to DMA to will probably just satisfy the access from internal
memory, while others will ignore that and send it up as DMA
and both types are probably out there in the field.


> > > So if the transaction actually hits this bus, which I think is what
> > > making use of the device AddressSpace implies, I don't think it can
> > > assume that it's simply reflected back at itself.  Conventional PCI and
> > > PCI Express may be software compatible, but there's a reason we don't
> > > see IOMMUs that provide both translation and isolation in conventional
> > > topologies.
> > > 
> > > Is this more a bug in the LSI device emulation model?  For instance in
> > > vfio-pci, if I want to access an offset into a BAR from within QEMU, I
> > > don't care what address is programmed into that BAR, I perform an
> > > access relative to the vfio file descriptor region representing that
> > > BAR space.  I'd expect that any viable device emulation model does the
> > > same, an access to device memory uses an offset from an internal
> > > resource, irrespective of the BAR address.  
> > 
> > However, using BAR seems like a reasonable shortcut allowing
> > device to use the same 64 bit address to refer to system
> > and device RAM interchangeably.
> 
> A shortcut that breaks when an IOMMU is involved.

Maybe. But if that's how hardware behaves, we have little choice but
emulate it.

> > > It would seem strange if the driver is actually programming the device
> > > to DMA to itself and if that's actually happening, I'd wonder if this
> > > driver is actually compatible with an IOMMU on bare metal.  
> > 
> > You know, it's hardware after all. As long as things work vendors
> > happily ship the device. They don't really worry about theoretical issues ;).
> 
> We're talking about a 32-bit conventional PCI device from the previous
> century.  IOMMUs are no longer theoretical, but not all drivers have
> kept up.  It's maybe not the best choice as the de facto standard
> device, imo.  Thanks,
> 
> Alex

More importantly lots devices most likely don't support arbitrary
configurations and break if you try to create something that matches the
spec but never or even rarely occurs on bare metal.

-- 
MST


