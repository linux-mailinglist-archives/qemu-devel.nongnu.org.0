Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6550DE1D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:46:11 +0200 (CEST)
Received: from localhost ([::1]:55048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwEL-00060X-AH
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nivfz-00055s-FN
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nivfw-00025T-J3
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650881435;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MJfV5S/BB/MbzPdioRgmTqclgIaNXTER802ZZLyJuik=;
 b=EJWTWelHJ44DyNVl/HrYY0Om23JwcUn/lss27/bQC19WLj3zbDYTh/YEJ4EoxoQE4HqNMw
 5Uo1iUc0C5vOKP/MSbytXXJBI1QFYq1MwKm8JOWJaHRKvfj5DrujsvheOhhQdtqLfpIbt1
 NH0iT1NBiu+xRHY6J1XrgytLjvWyupA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-uzM-iZFhN1GTu9R6Jk9_qg-1; Mon, 25 Apr 2022 06:10:21 -0400
X-MC-Unique: uzM-iZFhN1GTu9R6Jk9_qg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FF1F833972;
 Mon, 25 Apr 2022 10:10:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AECD463DF5;
 Mon, 25 Apr 2022 10:10:16 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:10:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <YmZzhohO81z1PVKS@redhat.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220422160943.6ff4f330.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422160943.6ff4f330.alex.williamson@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 chao.p.peng@intel.com, jgg@nvidia.com, kvm@vger.kernel.org,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, jasowang@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 pasic@linux.ibm.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 Yi Liu <yi.l.liu@intel.com>, nicolinc@nvidia.com, kevin.tian@intel.com,
 Laine Stump <laine@redhat.com>, david@gibson.dropbear.id.au,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 04:09:43PM -0600, Alex Williamson wrote:
> [Cc +libvirt folks]
> 
> On Thu, 14 Apr 2022 03:46:52 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
> 
> > With the introduction of iommufd[1], the linux kernel provides a generic
> > interface for userspace drivers to propagate their DMA mappings to kernel
> > for assigned devices. This series does the porting of the VFIO devices
> > onto the /dev/iommu uapi and let it coexist with the legacy implementation.
> > Other devices like vpda, vfio mdev and etc. are not considered yet.

snip

> > The selection of the backend is made on a device basis using the new
> > iommufd option (on/off/auto). By default the iommufd backend is selected
> > if supported by the host and by QEMU (iommufd KConfig). This option is
> > currently available only for the vfio-pci device. For other types of
> > devices, it does not yet exist and the legacy BE is chosen by default.
> 
> I've discussed this a bit with Eric, but let me propose a different
> command line interface.  Libvirt generally likes to pass file
> descriptors to QEMU rather than grant it access to those files
> directly.  This was problematic with vfio-pci because libvirt can't
> easily know when QEMU will want to grab another /dev/vfio/vfio
> container.  Therefore we abandoned this approach and instead libvirt
> grants file permissions.
> 
> However, with iommufd there's no reason that QEMU ever needs more than
> a single instance of /dev/iommufd and we're using per device vfio file
> descriptors, so it seems like a good time to revisit this.

I assume access to '/dev/iommufd' gives the process somewhat elevated
privileges, such that you don't want to unconditionally give QEMU
access to this device ?

> The interface I was considering would be to add an iommufd object to
> QEMU, so we might have a:
> 
> -device iommufd[,fd=#][,id=foo]
> 
> For non-libivrt usage this would have the ability to open /dev/iommufd
> itself if an fd is not provided.  This object could be shared with
> other iommufd users in the VM and maybe we'd allow multiple instances
> for more esoteric use cases.  [NB, maybe this should be a -object rather than
> -device since the iommufd is not a guest visible device?]

Yes,  -object would be the right answer for something that's purely
a host side backend impl selector.

> The vfio-pci device might then become:
> 
> -device vfio-pci[,host=DDDD:BB:DD.f][,sysfsdev=/sys/path/to/device][,fd=#][,iommufd=foo]
> 
> So essentially we can specify the device via host, sysfsdev, or passing
> an fd to the vfio device file.  When an iommufd object is specified,
> "foo" in the example above, each of those options would use the
> vfio-device access mechanism, essentially the same as iommufd=on in
> your example.  With the fd passing option, an iommufd object would be
> required and necessarily use device level access.
> 
> In your example, the iommufd=auto seems especially troublesome for
> libvirt because QEMU is going to have different locked memory
> requirements based on whether we're using type1 or iommufd, where the
> latter resolves the duplicate accounting issues.  libvirt needs to know
> deterministically which backed is being used, which this proposal seems
> to provide, while at the same time bringing us more in line with fd
> passing.  Thoughts?  Thanks,

Yep, I agree that libvirt needs to have more direct control over this.
This is also even more important if there are notable feature differences
in the 2 backends.

I wonder if anyone has considered an even more distinct impl, whereby
we have a completely different device type on the backend, eg

  -device vfio-iommu-pci[,host=DDDD:BB:DD.f][,sysfsdev=/sys/path/to/device][,fd=#][,iommufd=foo]

If a vendor wants to fully remove the legacy impl, they can then use the
Kconfig mechanism to disable the build of the legacy impl device, while
keeping the iommu impl (or vica-verca if the new iommu impl isn't considered
reliable enough for them to support yet).

Libvirt would use

   -object iommu,id=iommu0,fd=NNN
   -device vfio-iommu-pci,fd=MMM,iommu=iommu0

Non-libvirt would use a simpler

   -device vfio-iommu-pci,host=0000:03:22.1

with QEMU auto-creating a 'iommu' object in the background.

This would fit into libvirt's existing modelling better. We currently have
a concept of a PCI assignment backend, which previously supported the
legacy PCI assignment, vs the VFIO PCI assignment. This new iommu impl
feels like a 3rd PCI assignment approach, and so fits with how we modelled
it as a different device type in the past.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


