Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2E50E3C7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:55:23 +0200 (CEST)
Received: from localhost ([::1]:48638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj07W-0003Cy-V9
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nizqe-0000l2-FA
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:37:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nizqb-0006Nu-Op
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650897472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhyqkvZiXbRxPiBMWj6oIQlfqnIMog7MDN3Wn9vBOhY=;
 b=hezHL/4PL9x6GbBkqosioqcyvrNh7ZoiadUOayVWB0nM6cVFClzP7qJ3AtXjxK7RYOotFw
 wWrIG1z59F+Ya2qsbZyCh0JolyJZcHnQqTBD7LVKMWZt6fiVHwpGEKRLv9lWBsNuFsvaz0
 TA5S26A92+4gPKEBj6uZ2/+V+Bphb7M=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-BSFF6kl2OZCi0eorOj1w5A-1; Mon, 25 Apr 2022 10:37:51 -0400
X-MC-Unique: BSFF6kl2OZCi0eorOj1w5A-1
Received: by mail-io1-f71.google.com with SMTP id
 j6-20020a5d93c6000000b0064fbbf9566bso11672865ioo.12
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=UhyqkvZiXbRxPiBMWj6oIQlfqnIMog7MDN3Wn9vBOhY=;
 b=JSqhK+Qrcx70Z9EE3kN0CbEp5+vptJTHSwFwGqVc2bZCYnnGlOkyqtfNNn/NcFtOuB
 QUaGfRXI+JwuiqahLnjzGK9vQgFmq6VZI4winAsIynl3Z4NUqgs/HBiMA4OMBTF1ftFH
 djX5xnClHvyA7K99xNHm99UIl1qP3dYlCsoU2zxphOWOCdORWZWmxjp3v5bNpS/MINYI
 oC72iiVPus78NuisMQQjkbvKmYZjzLAcgk08GPeKS/LnvMh6qDdLKcyglEYGyAmt690k
 TnfnYvTzqXwexKqlO8uifYhkpwYcHePNOqVjxQtJujb8EZ6MDpoWzlJdP8Q+P6MQMTlZ
 1lgQ==
X-Gm-Message-State: AOAM530t/vf8bpjL1IN94rxUZkcLAby/pU9WWbATxtH22wp0bFBVAJnH
 U6wM4pTInSgBZnsf3gqV7j82z4cKHSbMReWsNYRGBeTibwhLXtgF0y7Ava3IjY8WoxtmgFf8t8F
 x7pkaWPANWO27vbM=
X-Received: by 2002:a05:6638:240a:b0:32a:a215:41a3 with SMTP id
 z10-20020a056638240a00b0032aa21541a3mr8316595jat.156.1650897470362; 
 Mon, 25 Apr 2022 07:37:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS7GTFh2yY895Pni62/QdISmWYLk7VmGOTC4VuBWdATuKGT727MB+40Ctal/9iM5+RXQofbQ==
X-Received: by 2002:a05:6638:240a:b0:32a:a215:41a3 with SMTP id
 z10-20020a056638240a00b0032aa21541a3mr8316573jat.156.1650897469981; 
 Mon, 25 Apr 2022 07:37:49 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 s5-20020a0566022bc500b0065490deaf19sm7718890iov.31.2022.04.25.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:37:49 -0700 (PDT)
Date: Mon, 25 Apr 2022 08:37:48 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <20220425083748.3465c50f.alex.williamson@redhat.com>
In-Reply-To: <YmZzhohO81z1PVKS@redhat.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220422160943.6ff4f330.alex.williamson@redhat.com>
 <YmZzhohO81z1PVKS@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Mon, 25 Apr 2022 11:10:14 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Apr 22, 2022 at 04:09:43PM -0600, Alex Williamson wrote:
> > [Cc +libvirt folks]
> >=20
> > On Thu, 14 Apr 2022 03:46:52 -0700
> > Yi Liu <yi.l.liu@intel.com> wrote:
> >  =20
> > > With the introduction of iommufd[1], the linux kernel provides a gene=
ric
> > > interface for userspace drivers to propagate their DMA mappings to ke=
rnel
> > > for assigned devices. This series does the porting of the VFIO devices
> > > onto the /dev/iommu uapi and let it coexist with the legacy implement=
ation.
> > > Other devices like vpda, vfio mdev and etc. are not considered yet. =
=20
>=20
> snip
>=20
> > > The selection of the backend is made on a device basis using the new
> > > iommufd option (on/off/auto). By default the iommufd backend is selec=
ted
> > > if supported by the host and by QEMU (iommufd KConfig). This option is
> > > currently available only for the vfio-pci device. For other types of
> > > devices, it does not yet exist and the legacy BE is chosen by default=
. =20
> >=20
> > I've discussed this a bit with Eric, but let me propose a different
> > command line interface.  Libvirt generally likes to pass file
> > descriptors to QEMU rather than grant it access to those files
> > directly.  This was problematic with vfio-pci because libvirt can't
> > easily know when QEMU will want to grab another /dev/vfio/vfio
> > container.  Therefore we abandoned this approach and instead libvirt
> > grants file permissions.
> >=20
> > However, with iommufd there's no reason that QEMU ever needs more than
> > a single instance of /dev/iommufd and we're using per device vfio file
> > descriptors, so it seems like a good time to revisit this. =20
>=20
> I assume access to '/dev/iommufd' gives the process somewhat elevated
> privileges, such that you don't want to unconditionally give QEMU
> access to this device ?

It's not that much dissimilar to /dev/vfio/vfio, it's an unprivileged
interface which should have limited scope for abuse, but more so here
the goal would be to de-privilege QEMU that one step further that it
cannot open the device file itself.

> > The interface I was considering would be to add an iommufd object to
> > QEMU, so we might have a:
> >=20
> > -device iommufd[,fd=3D#][,id=3Dfoo]
> >=20
> > For non-libivrt usage this would have the ability to open /dev/iommufd
> > itself if an fd is not provided.  This object could be shared with
> > other iommufd users in the VM and maybe we'd allow multiple instances
> > for more esoteric use cases.  [NB, maybe this should be a -object rathe=
r than
> > -device since the iommufd is not a guest visible device?] =20
>=20
> Yes,  -object would be the right answer for something that's purely
> a host side backend impl selector.
>=20
> > The vfio-pci device might then become:
> >=20
> > -device vfio-pci[,host=3DDDDD:BB:DD.f][,sysfsdev=3D/sys/path/to/device]=
[,fd=3D#][,iommufd=3Dfoo]
> >=20
> > So essentially we can specify the device via host, sysfsdev, or passing
> > an fd to the vfio device file.  When an iommufd object is specified,
> > "foo" in the example above, each of those options would use the
> > vfio-device access mechanism, essentially the same as iommufd=3Don in
> > your example.  With the fd passing option, an iommufd object would be
> > required and necessarily use device level access.
> >=20
> > In your example, the iommufd=3Dauto seems especially troublesome for
> > libvirt because QEMU is going to have different locked memory
> > requirements based on whether we're using type1 or iommufd, where the
> > latter resolves the duplicate accounting issues.  libvirt needs to know
> > deterministically which backed is being used, which this proposal seems
> > to provide, while at the same time bringing us more in line with fd
> > passing.  Thoughts?  Thanks, =20
>=20
> Yep, I agree that libvirt needs to have more direct control over this.
> This is also even more important if there are notable feature differences
> in the 2 backends.
>=20
> I wonder if anyone has considered an even more distinct impl, whereby
> we have a completely different device type on the backend, eg
>=20
>   -device vfio-iommu-pci[,host=3DDDDD:BB:DD.f][,sysfsdev=3D/sys/path/to/d=
evice][,fd=3D#][,iommufd=3Dfoo]
>=20
> If a vendor wants to fully remove the legacy impl, they can then use the
> Kconfig mechanism to disable the build of the legacy impl device, while
> keeping the iommu impl (or vica-verca if the new iommu impl isn't conside=
red
> reliable enough for them to support yet).
>=20
> Libvirt would use
>=20
>    -object iommu,id=3Diommu0,fd=3DNNN
>    -device vfio-iommu-pci,fd=3DMMM,iommu=3Diommu0
>=20
> Non-libvirt would use a simpler
>=20
>    -device vfio-iommu-pci,host=3D0000:03:22.1
>=20
> with QEMU auto-creating a 'iommu' object in the background.
>=20
> This would fit into libvirt's existing modelling better. We currently have
> a concept of a PCI assignment backend, which previously supported the
> legacy PCI assignment, vs the VFIO PCI assignment. This new iommu impl
> feels like a 3rd PCI assignment approach, and so fits with how we modelled
> it as a different device type in the past.

I don't think we want to conflate "iommu" and "iommufd", we're creating
an object that interfaces into the iommufd uAPI, not an iommu itself.
Likewise "vfio-iommu-pci" is just confusing, there was an iommu
interface previously, it's just a different implementation now and as
far as the VM interface to the device, it's identical.  Note that a
"vfio-iommufd-pci" device multiplies the matrix of every vfio device
for a rather subtle implementation detail.

My expectation would be that libvirt uses:

 -object iommufd,id=3Diommufd0,fd=3DNNN
 -device vfio-pci,fd=3DMMM,iommufd=3Diommufd0

Whereas simple QEMU command line would be:

 -object iommufd,id=3Diommufd0
 -device vfio-pci,iommufd=3Diommufd0,host=3D0000:02:00.0

The iommufd object would open /dev/iommufd itself.  Creating an
implicit iommufd object is someone problematic because one of the
things I forgot to highlight in my previous description is that the
iommufd object is meant to be shared across not only various vfio
devices (platform, ccw, ap, nvme, etc), but also across subsystems, ex.
vdpa.

If the old style were used:

 -device vfio-pci,host=3D0000:02:00.0

Then QEMU would use vfio for the IOMMU backend.

If libvirt/userspace wants to query whether "legacy" vfio is still
supported by the host kernel, I think it'd only need to look for
whether the /dev/vfio/vfio container interface still exists.

If we need some means for QEMU to remove legacy support, I'd rather
find a way to do it via probing device options.  It's easy enough to
see if iommufd support exists by looking for the presence of the
iommufd option for the vfio-pci device and Kconfig within QEMU could be
used regardless of whether we define a new device name.  Thanks,

Alex


