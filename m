Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C7B4861EE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:15:15 +0100 (CET)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Ora-0004Vs-0u
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:15:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5OpR-0002zx-58
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5OpN-0004l5-W8
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641460377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e6gCAsG81yQJohdVUmetev9cPtRF6/NkutzFa8kVAu8=;
 b=Ug5JXkrEyKtV2t1YyMgjnmmESHV9yhTtXN4HsBjyye2B+TLkVtpiDZb+Pc+9aKA2l/gyTK
 LVA0qdGq5ZRmBRkflBmhMnHj/+dT2ndzY4ueGzc92xziVnob0NKhCFUKHUuQ9/KDPBaaH5
 nCXqcTSr1EO6LjnTNf7lzwO3Ijhm+GA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-6Tmj0-FzNmGmuSlMjAQzaQ-1; Thu, 06 Jan 2022 04:12:54 -0500
X-MC-Unique: 6Tmj0-FzNmGmuSlMjAQzaQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z10-20020a05640235ca00b003f8efab3342so1513199edc.2
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e6gCAsG81yQJohdVUmetev9cPtRF6/NkutzFa8kVAu8=;
 b=HapdZyxz9GJRCsQAzlvTXmclVvWtVHLOIQvOY5KhU1Ip74vKcUPpEbAdI7ihzXbp58
 nAs0v+dprwdupqA/eWg5VTAcuiHarWSKaZftYlOmF3FJRQMT5sFL0s9iXdDcxWrZSq8y
 th8b3Bh+9ApspvDLPSV1fh3jRjcfMZUdDxA50ZajCZSLkYJjlU+fbOBrLbebj3YLKZ6z
 /99dDQttlf6FMjxkYNTIMu84uGF6LK1gxIJ4RW4gs6RcVdEPdfjotyucFrxC083Zwid+
 VNIzV3QBVPR6l8X5smzTYMbtxZik6Qr2xrJxUMPpnqEGAJPQMMUh2m5KggckfAqNcpJV
 5i2A==
X-Gm-Message-State: AOAM531IctDxwot/WMEHPBGh04ihBu6nbzHiDTPi83Ri4W8zd0j0It5L
 bTXEVUeCuH/tL2q6BzQ7gxwY9aX08k6+OUNg1xjg4vApqK6CjsWwYWWycmOczSLp4UI/ovbw7Kc
 neq674LryT+GxUJw=
X-Received: by 2002:a17:907:8a26:: with SMTP id
 sc38mr1908756ejc.362.1641460372979; 
 Thu, 06 Jan 2022 01:12:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygtNTozj7YPNxg4Vg6c4SqjATocqXMuG8AUCm/5YqmU7TTijGOUCOrebiM8bI6qn56Sp1U9g==
X-Received: by 2002:a17:907:8a26:: with SMTP id
 sc38mr1908727ejc.362.1641460372648; 
 Thu, 06 Jan 2022 01:12:52 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id s5sm343411ejn.205.2022.01.06.01.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 01:12:51 -0800 (PST)
Date: Thu, 6 Jan 2022 04:12:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Message-ID: <20220106040130-mutt-send-email-mst@kernel.org>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20211222181003-mutt-send-email-mst@kernel.org>
 <f1cadf51-795b-200c-8abb-f8f97b34c228@oracle.com>
 <20220105161046-mutt-send-email-mst@kernel.org>
 <e95009cf-aea2-7fc7-c049-687c1badc471@oracle.com>
 <20220105180332-mutt-send-email-mst@kernel.org>
 <c080ec57-d9e1-3e1b-11ab-5bb3f9c13508@oracle.com>
MIME-Version: 1.0
In-Reply-To: <c080ec57-d9e1-3e1b-11ab-5bb3f9c13508@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 06:24:25PM -0500, Steven Sistare wrote:
> On 1/5/2022 6:09 PM, Michael S. Tsirkin wrote:
> > On Wed, Jan 05, 2022 at 04:40:43PM -0500, Steven Sistare wrote:
> >> On 1/5/2022 4:14 PM, Michael S. Tsirkin wrote:
> >>> On Wed, Jan 05, 2022 at 12:24:21PM -0500, Steven Sistare wrote:
> >>>> On 12/22/2021 6:15 PM, Michael S. Tsirkin wrote:
> >>>>> On Wed, Dec 22, 2021 at 11:05:24AM -0800, Steve Sistare wrote:
> >>>>>> Enable vfio-pci devices to be saved and restored across an exec restart
> >>>>>> of qemu.
> >>>>>>
> >>>>>> At vfio creation time, save the value of vfio container, group, and device
> >>>>>> descriptors in cpr state.
> >>>>>>
> >>>>>> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
> >>>>>> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
> >>>>>> at a different VA after exec.  DMA to already-mapped pages continues.  Save
> >>>>>> the msi message area as part of vfio-pci vmstate, save the interrupt and
> >>>>>> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
> >>>>>> vfio descriptors.  The flag is not cleared earlier because the descriptors
> >>>>>> should not persist across miscellaneous fork and exec calls that may be
> >>>>>> performed during normal operation.
> >>>>>>
> >>>>>> On qemu restart, vfio_realize() finds the saved descriptors, uses
> >>>>>> the descriptors, and notes that the device is being reused.  Device and
> >>>>>> iommu state is already configured, so operations in vfio_realize that
> >>>>>> would modify the configuration are skipped for a reused device, including
> >>>>>> vfio ioctl's and writes to PCI configuration space.  The result is that
> >>>>>> vfio_realize constructs qemu data structures that reflect the current
> >>>>>> state of the device.  However, the reconstruction is not complete until
> >>>>>> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
> >>>>>> state.  It rebuilds vector data structures and attaches the interrupts to
> >>>>>> the new KVM instance.  cpr-load then invokes the main vfio listener callback,
> >>>>>> which walks the flattened ranges of the vfio_address_spaces and calls
> >>>>>> VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly, it
> >>>>>> starts the VM and suppresses vfio pci device reset.
> >>>>>>
> >>>>>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
> >>>>>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
> >>>>>> support.  Part 3 adds INTX support.
> >>>>>>
> >>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >>>>>> ---
> >>>>>>  MAINTAINERS                   |   1 +
> >>>>>>  hw/pci/pci.c                  |  10 ++++
> >>>>>>  hw/vfio/common.c              | 115 ++++++++++++++++++++++++++++++++++++++----
> >>>>>>  hw/vfio/cpr.c                 |  94 ++++++++++++++++++++++++++++++++++
> >>>>>>  hw/vfio/meson.build           |   1 +
> >>>>>>  hw/vfio/pci.c                 |  77 ++++++++++++++++++++++++++++
> >>>>>>  hw/vfio/trace-events          |   1 +
> >>>>>>  include/hw/pci/pci.h          |   1 +
> >>>>>>  include/hw/vfio/vfio-common.h |   8 +++
> >>>>>>  include/migration/cpr.h       |   3 ++
> >>>>>>  migration/cpr.c               |  10 +++-
> >>>>>>  migration/target.c            |  14 +++++
> >>>>>>  12 files changed, 324 insertions(+), 11 deletions(-)
> >>>>>>  create mode 100644 hw/vfio/cpr.c
> >>>>>>
> >>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>>>> index cfe7480..feed239 100644
> >>>>>> --- a/MAINTAINERS
> >>>>>> +++ b/MAINTAINERS
> >>>>>> @@ -2992,6 +2992,7 @@ CPR
> >>>>>>  M: Steve Sistare <steven.sistare@oracle.com>
> >>>>>>  M: Mark Kanda <mark.kanda@oracle.com>
> >>>>>>  S: Maintained
> >>>>>> +F: hw/vfio/cpr.c
> >>>>>>  F: include/migration/cpr.h
> >>>>>>  F: migration/cpr.c
> >>>>>>  F: qapi/cpr.json
> >>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >>>>>> index 0fd21e1..e35df4f 100644
> >>>>>> --- a/hw/pci/pci.c
> >>>>>> +++ b/hw/pci/pci.c
> >>>>>> @@ -307,6 +307,16 @@ static void pci_do_device_reset(PCIDevice *dev)
> >>>>>>  {
> >>>>>>      int r;
> >>>>>>  
> >>>>>> +    /*
> >>>>>> +     * A reused vfio-pci device is already configured, so do not reset it
> >>>>>> +     * during qemu_system_reset prior to cpr-load, else interrupts may be
> >>>>>> +     * lost.  By contrast, pure-virtual pci devices may be reset here and
> >>>>>> +     * updated with new state in cpr-load with no ill effects.
> >>>>>> +     */
> >>>>>> +    if (dev->reused) {
> >>>>>> +        return;
> >>>>>> +    }
> >>>>>> +
> >>>>>>      pci_device_deassert_intx(dev);
> >>>>>>      assert(dev->irq_state == 0);
> >>>>>>  
> >>>>>
> >>>>>
> >>>>> Hmm that's a weird thing to do. I suspect this works because
> >>>>> "reused" means something like "in the process of being restored"?
> >>>>> Because clearly, we do not want to skip this part e.g. when
> >>>>> guest resets the device.
> >>>>
> >>>> Exactly.  vfio_realize sets the flag if it detects the device is reused during
> >>>> a restart, and vfio_pci_post_load clears the reused flag.
> >>>>
> >>>>> So a better name could be called for, but really I don't
> >>>>> love how vfio gets to poke at internal PCI state.
> >>>>> I'd rather we found a way just not to call this function.
> >>>>> If we can't, maybe an explicit API, and make it
> >>>>> actually say what it's doing?
> >>>>
> >>>> How about:
> >>>>
> >>>> pci_set_restore(PCIDevice *dev) { dev->restore = true; }
> >>>> pci_clr_restore(PCIDevice *dev) { dev->restore = false; }
> >>>>
> >>>> vfio_realize()
> >>>>   pci_set_restore(pdev)
> >>>>
> >>>> vfio_pci_post_load()
> >>>>   pci_clr_restore(pdev)
> >>>>
> >>>> pci_do_device_reset()
> >>>>     if (dev->restore)
> >>>>         return;
> >>>>
> >>>> - Steve
> >>>
> >>>
> >>> Not too bad. I'd like a better definition of what dev->restore is
> >>> exactly and to add them in comments near where it
> >>> is defined and used.
> >>
> >> Will do.
> >>
> >>> E.g. does this mean "device is being restored because of qemu restart"?
> >>>
> >>> Do we need a per device flag for this thing or would a global
> >>> "qemu restart in progress" flag be enough?
> >>
> >> A global flag (or function, which already exists) would suppress reset for all
> >> PCI devices, not just vfio-pci.  I am concerned that for some devices, vmstate 
> >> load may implicitly depend on the device having been reset for correctness, by 
> >> virtue of some fields being initialized in the reset function.
> >>
> >> - Steve

I took a look and I don't really see any cases like this.
I think pci_qdev_realize will initialize the pci core to a correct state,
pci_do_device_reset isn't necessary right after realize.
It seems safe to just skip it for all devices unconditionally.
A bunch of devices do depend on reset to init them correctly,
e.g. hw/ide/piix.c sets pci status in piix_ide_reset.
But pci core does not seem to.


> > So just so I understand, how do these other devices work with restart?
> > Do they use the save/loadvm machinery? And the reason vfio doesn't
> > is because it generally does not support savevm/loadvm?
> 
> They all use save/loadvm.  vfio-pci also uses save/loadvm to preserve its soft state,
> plus it preserves its device descriptors.  The only bit we are skipping is the reset
> function for vfio-pci, because the hardware device is actively processing dma and 
> interrupts, and they would be lost.  Reset is called unconditionally for all devices 
> during qemu startup, prior to loadvm, by the path qdev_machine_creation_done() ->
> qemu_system_reset().
> 
> - Steve


