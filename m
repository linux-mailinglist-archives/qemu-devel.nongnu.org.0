Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB8370016
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:00:27 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXRC-00054Q-EG
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lcX9o-0004bZ-SJ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:42:28 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lcX9m-0001M2-Tp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:42:28 -0400
Received: by mail-io1-xd31.google.com with SMTP id f21so32468411ioh.8
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jl4uES12pKonCmk010DAD/WMlnckCJU91Af/UAAnP5w=;
 b=LDmzzQoTFPUzhVSWRv5XEiKwphKTi+tLtKfkAQ/Lk44ieq45cb0kcCXiv/0FQPON5n
 zcjsoaEUBIAkk9BhjgPdvYTl7UfToIfiQwe/q0THpbgsHdS/ZfY1VwT8L0lGeZbR8ow7
 ZM2DKgw22T7XNdP/e1R0R8m6Z0jZfEVl7gwC5ofavzzl8rkE7dUtqX0naIbGGfQfh2kS
 0Uk8gVlhjCnInkTufbHl5GkAK6JICSpkIoVdum+Oymmlc834HaZ1G1jKrkVxkaoO/Cq6
 Ra+Cf9dsgQKfDwqW+jE/ec9XERsuzo9NlYaCR/QVINqVqOLSQ/Jp0mQPiknGy9ECaPYr
 c6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jl4uES12pKonCmk010DAD/WMlnckCJU91Af/UAAnP5w=;
 b=X1JHP1rWMQPh2+g6s5RfV8feQvvFeVy0XHLyl7JXzz4+JYTACloglD0XcDIhyueCcm
 kqnzUSUGnRrMFq8+8hvG1CCCe97qhX919c4ZDcfRuj9fwqZd+D53G9RMoTWX7Odfji0x
 pJUXz4MW5lpkkLy/9Az6CrmcVuzufsCwbEBDKB6l+h8AvY0zZcMfF74bCoLVHGPUmeQH
 M1sd0HuXabpb0Q0gOGAOpJfMmOp7M+8ljoY0/wOYJ2yRdOyL4G82eKmUeF0yqNmnpAGJ
 rDQefkoq6geF2+0fnD0gMjAWBj/Fg7iGd91PNZ7jN6PvOTpjmHeQrmjt/C1UQZ3aGYnF
 w44w==
X-Gm-Message-State: AOAM532Wh8asrjyDfizxXWgGDqc2XC6XSkPu2OhpUOfpV671yCc0ZVLA
 TT6Kj2QMdxfYmfb+ko8vBYVBHZ6Co5ovOIXTLoE=
X-Google-Smtp-Source: ABdhPJwpefAz8Wt6s3paLZ91hJyR4rQ4ebB/pMe2bCZ6B247EQNINXAKEW879zmCtCmlvGefbPIKZ/v0+DVE+KigvOA=
X-Received: by 2002:a6b:5907:: with SMTP id n7mr4391483iob.3.1619804545200;
 Fri, 30 Apr 2021 10:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
 <20210426152203.379dab00@redhat.com>
 <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
 <20210427121850.68d2a8dd@redhat.com> <YIhfWoRgJtaKZhh8@work-vm>
 <CANsN3OSs4GyT10P6xUp-s823U8VnWAmihWXQ1jSnF07wyYjxuA@mail.gmail.com>
 <YIm0w2RgQgosIyiB@work-vm> <20210428133740.6ccbbba6@redhat.com>
 <YIpyA+ZoOYxX0c06@work-vm> <20210429070901.52402ac2@x1.home.shazbot.org>
 <YIry/WqbeRvD4zCa@work-vm>
In-Reply-To: <YIry/WqbeRvD4zCa@work-vm>
From: Dev Audsin <dev.devaqemu@gmail.com>
Date: Fri, 30 Apr 2021 18:41:39 +0100
Message-ID: <CANsN3OS5zXQ4_8jwssweNER-ff-KwA8SYomJfOMZ90FhNVUAZQ@mail.gmail.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=dev.devaqemu@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks David. I did a quick test with the above patch and it seems to
work for me. With this patch, apparently I can  create a VM with
SR-IOV VF and DAX cache ( virtio_fs_cache_size = 1024).

Thanks
Dev

On Thu, Apr 29, 2021 at 6:55 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Alex Williamson (alex.williamson@redhat.com) wrote:
> > On Thu, 29 Apr 2021 09:44:51 +0100
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >
> > > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > > > On Wed, 28 Apr 2021 20:17:23 +0100
> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > >
> > > > > * Dev Audsin (dev.devaqemu@gmail.com) wrote:
> > > > > > Thanks Dave for your explanation.
> > > > > > Any suggestions on how to make VFIO not attempt to map into the
> > > > > > unaccessible and unallocated RAM.
> > > > >
> > > > > I'm not sure;:
> > > > >
> > > > > static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> > > > > {
> > > > >     return (!memory_region_is_ram(section->mr) &&
> > > > >             !memory_region_is_iommu(section->mr)) ||
> > > > >            section->offset_within_address_space & (1ULL << 63);
> > > > > }
> > > > >
> > > > > I'm declaring that region with memory_region_init_ram_ptr;  should I be?
> > > > > it's not quite like RAM.
> > > > > But then I *do* want a kvm slot for it, and I do want it to be accessed
> > > > > by mapping rather htan calling IO functions; that makes me think mr->ram
> > > > > has to be true.
> > > > > But then do we need to add another flag to memory-regions; if we do,
> > > > > what is it;
> > > > >    a) We don't want an 'is_virtio_fs' - it needs to be more generic
> > > > >    b) 'no_vfio' also feels wrong
> > > > >
> > > > > Is perhaps 'not_lockable' the right thing to call it?
> > > >
> > > > This reasoning just seems to lead back to "it doesn't work, therefore
> > > > don't do it" rather than identifying the property of the region that
> > > > makes it safe not to map it for device DMA (assuming that's actually
> > > > the case).
> > >
> > > Yes, I'm struggling to get to what that generic form of that property
> > > is, possibly because I've not got an example of another case to compare
> > > it with.
> > >
> > > > It's clearly "RAM" as far as QEMU is concerned given how
> > > > it's created, but does it actually appear in the VM as generic physical
> > > > RAM that the guest OS could program to the device as a DMA target?  If
> > > > not, what property makes that so, create a flag for that.  Thanks,
> > >
> > > The guest sees it as a PCI-bar; so it knows it's not 'generic physical
> > > RAM' - but can a guest set other BARs (like frame buffers or pmem) as
> > > DMA targets?  If so, how do I distinguish our bar?
> >
> > They can, this is how peer-to-peer DMA between devices works.  However,
> > we can perhaps take advantage that drivers are generally a bit more
> > cautious in probing that this type of DMA works before relying on it,
> > and declare it with memory_region_init_ram_device_ptr() which vfio
> > would not consider fatal if it fails to map it.  The other semantic
> > difference is that ram_device_mem_ops are used for read/write access to
> > avoid some of the opcodes that are not meant to be used for physical
> > device memory with the default memcpy ops.  If you expect this region
> > to be mapped as a kvm memory slot, presumably these would never get
> > used anyway.  Thanks,
>
> Oh, nice, I hadn't spotted memory_region_init_ram_device_ptr();
>
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 7afd9495c9..11fb9b5979 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -604,7 +604,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>
> -        memory_region_init_ram_ptr(&fs->cache, OBJECT(vdev),
> +        memory_region_init_ram_device_ptr(&fs->cache, OBJECT(vdev),
>                                     "virtio-fs-cache",
>                                     fs->conf.cache_size, cache_ptr);
>      }
>
> apparently still works for us; Dev does that fix it for you?
>
> Dave
>
> > Alex
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

