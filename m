Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60983510346
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:24:03 +0200 (CEST)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNys-000498-DI
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1njNx2-0002h4-U8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1njNx0-0002IL-0T
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650990124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGZ0c19UOYNIFPHkBnm5Z4ZDrm/gdum8i5HQX1C3eZw=;
 b=Q4NJCcNHq1qf/sFUefYjqTK0O4Mx/cOlg2OSEAjsjv0UEUoilKhk/riUQw24zvzu3o0Xn4
 g29lxVMvGcAHJEYUkyZkPZXChT+TuZVCI4JLTiP64JW7pL8bPpkHW4H/hKOLduOhx3wUSd
 D2SqkMQj0LWxHo/rT0HFb3m+13psKC4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-HPXUHMbaM-uG8ezKRQrNtw-1; Tue, 26 Apr 2022 12:22:03 -0400
X-MC-Unique: HPXUHMbaM-uG8ezKRQrNtw-1
Received: by mail-io1-f72.google.com with SMTP id
 q5-20020a0566022f0500b00654a56b1dfbso14510168iow.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=zGZ0c19UOYNIFPHkBnm5Z4ZDrm/gdum8i5HQX1C3eZw=;
 b=V8LxdZta3l2WL7gaIhQitICZsRHJYKwF2k3xD8SV7+8Yi/FWteKkHF9ayUa1xMkztQ
 WAmPJqtuUhwqZoMveeVu9DcTCuWKijqxFKXHT+TySXLdjRdh6m7KSkPPwWlW+KB5pLke
 Im6lZ3SekKFlw8VB1rUhuPX3AQuilCwGe4d0A1KuWxt+YRH7Ppz+FQC3w3po5T4+BwO2
 6h54la312ZhPWmMof9KhyFUeyX13tR0WQlsp4DjRc4jy8vN2HZAMfQSsYvievCesJJvv
 VHg2UNJd18o/y0kVhllnZMYy4Ybb86hd3MG6nb3vD1nZCVqHngGN4tyQ0By7LD+rBF/3
 3JCQ==
X-Gm-Message-State: AOAM532VxNepqkCrKWZx6SB+griSi0koZIS37S4Intp7QtQTqf4aXr9Z
 SeYu7aPKwL7js3dJ4ab2AXzjoCo/9S9a10/n109VtldbG7pQaegnDXfy9FO3n4U7utMOaf3Vsj5
 8yIYhFkt0I9ajhwo=
X-Received: by 2002:a05:6638:533:b0:32a:d418:b77b with SMTP id
 j19-20020a056638053300b0032ad418b77bmr6808544jar.237.1650990122423; 
 Tue, 26 Apr 2022 09:22:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwxxqc4dnDfzNCYOy8s/UWECcXyiOBGUZLjbvVuUOPPjs8DjJRfoZC8Wcsr08kyrWwg6nGWA==
X-Received: by 2002:a05:6638:533:b0:32a:d418:b77b with SMTP id
 j19-20020a056638053300b0032ad418b77bmr6808517jar.237.1650990122069; 
 Tue, 26 Apr 2022 09:22:02 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o19-20020a056e0214d300b002cbec3af6casm8316098ilk.30.2022.04.26.09.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:22:01 -0700 (PDT)
Date: Tue, 26 Apr 2022 10:21:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <20220426102159.5ece8c1f.alex.williamson@redhat.com>
In-Reply-To: <BN9PR11MB5276F549912E03553411736D8CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220422160943.6ff4f330.alex.williamson@redhat.com>
 <YmZzhohO81z1PVKS@redhat.com>
 <20220425083748.3465c50f.alex.williamson@redhat.com>
 <BN9PR11MB5276F549912E03553411736D8CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, Laine Stump <laine@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 08:37:41 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Monday, April 25, 2022 10:38 PM
> >=20
> > On Mon, 25 Apr 2022 11:10:14 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >  =20
> > > On Fri, Apr 22, 2022 at 04:09:43PM -0600, Alex Williamson wrote: =20
> > > > [Cc +libvirt folks]
> > > >
> > > > On Thu, 14 Apr 2022 03:46:52 -0700
> > > > Yi Liu <yi.l.liu@intel.com> wrote:
> > > > =20
> > > > > With the introduction of iommufd[1], the linux kernel provides a =
=20
> > generic =20
> > > > > interface for userspace drivers to propagate their DMA mappings t=
o =20
> > kernel =20
> > > > > for assigned devices. This series does the porting of the VFIO de=
vices
> > > > > onto the /dev/iommu uapi and let it coexist with the legacy =20
> > implementation. =20
> > > > > Other devices like vpda, vfio mdev and etc. are not considered ye=
t. =20
> > >
> > > snip
> > > =20
> > > > > The selection of the backend is made on a device basis using the =
new
> > > > > iommufd option (on/off/auto). By default the iommufd backend is =
=20
> > selected =20
> > > > > if supported by the host and by QEMU (iommufd KConfig). This opti=
on =20
> > is =20
> > > > > currently available only for the vfio-pci device. For other types=
 of
> > > > > devices, it does not yet exist and the legacy BE is chosen by def=
ault. =20
> > > >
> > > > I've discussed this a bit with Eric, but let me propose a different
> > > > command line interface.  Libvirt generally likes to pass file
> > > > descriptors to QEMU rather than grant it access to those files
> > > > directly.  This was problematic with vfio-pci because libvirt can't
> > > > easily know when QEMU will want to grab another /dev/vfio/vfio
> > > > container.  Therefore we abandoned this approach and instead libvirt
> > > > grants file permissions.
> > > >
> > > > However, with iommufd there's no reason that QEMU ever needs more =
=20
> > than =20
> > > > a single instance of /dev/iommufd and we're using per device vfio f=
ile
> > > > descriptors, so it seems like a good time to revisit this. =20
> > >
> > > I assume access to '/dev/iommufd' gives the process somewhat elevated
> > > privileges, such that you don't want to unconditionally give QEMU
> > > access to this device ? =20
> >=20
> > It's not that much dissimilar to /dev/vfio/vfio, it's an unprivileged
> > interface which should have limited scope for abuse, but more so here
> > the goal would be to de-privilege QEMU that one step further that it
> > cannot open the device file itself.
> >  =20
> > > > The interface I was considering would be to add an iommufd object to
> > > > QEMU, so we might have a:
> > > >
> > > > -device iommufd[,fd=3D#][,id=3Dfoo]
> > > >
> > > > For non-libivrt usage this would have the ability to open /dev/iomm=
ufd
> > > > itself if an fd is not provided.  This object could be shared with
> > > > other iommufd users in the VM and maybe we'd allow multiple instanc=
es
> > > > for more esoteric use cases.  [NB, maybe this should be a -object r=
ather =20
> > than =20
> > > > -device since the iommufd is not a guest visible device?] =20
> > >
> > > Yes,  -object would be the right answer for something that's purely
> > > a host side backend impl selector.
> > > =20
> > > > The vfio-pci device might then become:
> > > >
> > > > -device vfio- =20
> > pci[,host=3DDDDD:BB:DD.f][,sysfsdev=3D/sys/path/to/device][,fd=3D#][,io=
mmufd=3Df
> > oo] =20
> > > >
> > > > So essentially we can specify the device via host, sysfsdev, or pas=
sing
> > > > an fd to the vfio device file.  When an iommufd object is specified,
> > > > "foo" in the example above, each of those options would use the
> > > > vfio-device access mechanism, essentially the same as iommufd=3Don =
in
> > > > your example.  With the fd passing option, an iommufd object would =
be
> > > > required and necessarily use device level access.
> > > >
> > > > In your example, the iommufd=3Dauto seems especially troublesome for
> > > > libvirt because QEMU is going to have different locked memory
> > > > requirements based on whether we're using type1 or iommufd, where =
=20
> > the =20
> > > > latter resolves the duplicate accounting issues.  libvirt needs to =
know =20
>=20
> Based on current plan there is probably a transition window between the
> point where the first vfio device type (vfio-pci) gaining iommufd support
> and the point where all vfio types supporting iommufd. Libvirt can figure
> out which one to use iommufd by checking the presence of
> /dev/vfio/devices/vfioX. But what would be the resource limit policy
> in Libvirt in such transition window when both type1 and iommufd might
> be used? Or do we just expect Libvirt to support iommufd only after the
> transition window ends to avoid handling such mess?

Good point regarding libvirt testing for the vfio device files for use
with iommufd, so libvirt would test if /dev/iommufd exists and if the
device they want to assign maps to a /dev/vfio/devices/vfioX file.  This
was essentially implicit in the fd=3D# option to the vfio-pci device.

In mixed combinations, I'd expect libvirt to continue to add the full
VM memory to the locked memory limit for each non-iommufd device added.

> > > > deterministically which backed is being used, which this proposal s=
eems
> > > > to provide, while at the same time bringing us more in line with fd
> > > > passing.  Thoughts?  Thanks, =20
> > >
> > > Yep, I agree that libvirt needs to have more direct control over this.
> > > This is also even more important if there are notable feature differe=
nces
> > > in the 2 backends.
> > >
> > > I wonder if anyone has considered an even more distinct impl, whereby
> > > we have a completely different device type on the backend, eg
> > >
> > >   -device vfio-iommu- =20
> > pci[,host=3DDDDD:BB:DD.f][,sysfsdev=3D/sys/path/to/device][,fd=3D#][,io=
mmufd=3Df
> > oo] =20
> > >
> > > If a vendor wants to fully remove the legacy impl, they can then use =
the
> > > Kconfig mechanism to disable the build of the legacy impl device, whi=
le
> > > keeping the iommu impl (or vica-verca if the new iommu impl isn't =20
> > considered =20
> > > reliable enough for them to support yet).
> > >
> > > Libvirt would use
> > >
> > >    -object iommu,id=3Diommu0,fd=3DNNN
> > >    -device vfio-iommu-pci,fd=3DMMM,iommu=3Diommu0
> > >
> > > Non-libvirt would use a simpler
> > >
> > >    -device vfio-iommu-pci,host=3D0000:03:22.1
> > >
> > > with QEMU auto-creating a 'iommu' object in the background.
> > >
> > > This would fit into libvirt's existing modelling better. We currently=
 have
> > > a concept of a PCI assignment backend, which previously supported the
> > > legacy PCI assignment, vs the VFIO PCI assignment. This new iommu impl
> > > feels like a 3rd PCI assignment approach, and so fits with how we mod=
elled
> > > it as a different device type in the past. =20
> >=20
> > I don't think we want to conflate "iommu" and "iommufd", we're creating
> > an object that interfaces into the iommufd uAPI, not an iommu itself.
> > Likewise "vfio-iommu-pci" is just confusing, there was an iommu
> > interface previously, it's just a different implementation now and as
> > far as the VM interface to the device, it's identical.  Note that a
> > "vfio-iommufd-pci" device multiplies the matrix of every vfio device
> > for a rather subtle implementation detail.
> >=20
> > My expectation would be that libvirt uses:
> >=20
> >  -object iommufd,id=3Diommufd0,fd=3DNNN
> >  -device vfio-pci,fd=3DMMM,iommufd=3Diommufd0
> >=20
> > Whereas simple QEMU command line would be:
> >=20
> >  -object iommufd,id=3Diommufd0
> >  -device vfio-pci,iommufd=3Diommufd0,host=3D0000:02:00.0
> >=20
> > The iommufd object would open /dev/iommufd itself.  Creating an
> > implicit iommufd object is someone problematic because one of the
> > things I forgot to highlight in my previous description is that the
> > iommufd object is meant to be shared across not only various vfio
> > devices (platform, ccw, ap, nvme, etc), but also across subsystems, ex.
> > vdpa. =20
>=20
> Out of curiosity - in concept one iommufd is sufficient to support all
> ioas requirements across subsystems while having multiple iommufd's
> instead lose the benefit of centralized accounting. The latter will also
> cause some trouble when we start virtualizing ENQCMD which requires
> VM-wide PASID virtualization thus further needs to share that=20
> information across iommufd's. Not unsolvable but really no gain by
> adding such complexity. So I'm curious whether Qemu provide
> a way to restrict that certain object type can only have one instance
> to discourage such multi-iommufd attempt?

I don't see any reason for QEMU to restrict iommufd objects.  The QEMU
philosophy seems to be to let users create whatever configuration they
want.  For libvirt though, the assumption would be that a single
iommufd object can be used across subsystems, so libvirt would never
automatically create multiple objects.

We also need to be able to advise libvirt as to how each iommufd object
or user of that object factors into the VM locked memory requirement.
When used by vfio-pci, we're only mapping VM RAM, so we'd ask libvirt
to set the locked memory limit to the size of VM RAM per iommufd,
regardless of the number of devices using a given iommufd.  However, I
don't know if all users of iommufd will be exclusively mapping VM RAM.
Combinations of devices where some map VM RAM and others map QEMU
buffer space could still require some incremental increase per device
(I'm not sure if vfio-nvme is such a device).  It seems like heuristics
will still be involved even after iommufd solves the per-device
vfio-pci locked memory limit issue.  Thanks,

Alex


