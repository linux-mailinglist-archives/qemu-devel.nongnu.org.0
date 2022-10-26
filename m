Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6060E675
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:29:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onk6o-0000Li-V0; Wed, 26 Oct 2022 13:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1onk6n-0000LT-4n
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1onk6k-0008IJ-Fo
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666804945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZy6sCXe4dMHOfiGJjoPUlSiBTuSdlWaK61a+pMpmp8=;
 b=dB0yLhhdzEW+QkU7oC3IMlDmo8crid2zV3ZI5w0JHLUlzhRw8GCGiU/Qz2prlBKD0TI5A9
 Nbdxqqg3iaYP5h9OqIOtfV9QRKhJugaQC4w/+yHfLw7PbsdGYgwe0TtNgXeBfg7ZFBZKRt
 gSKM0j30SeWLTCIY/bw/E2iVs+epG8s=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-IHe5uKG-OjKWNmKGhQKIBQ-1; Wed, 26 Oct 2022 13:22:23 -0400
X-MC-Unique: IHe5uKG-OjKWNmKGhQKIBQ-1
Received: by mail-il1-f199.google.com with SMTP id
 h8-20020a056e021b8800b002f9c2e31750so13827015ili.1
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 10:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZy6sCXe4dMHOfiGJjoPUlSiBTuSdlWaK61a+pMpmp8=;
 b=mMJL5+ZBq0IupT0KvmK6WwOCs2PRdgAVs64Re/H+kibNlV6FYCOnGz6gLC5qIwiX+4
 Qc82XB1lqmbMLTxHx4ncOJ3IVX9vxUPb89//8fukkvdWtD12SBLB9l+pqm/kZaT9SJnM
 qlA3SXw1xF1DYz5aDVJUsL1Z+brJDa4f1DOF2ynPEq4yHkE/by3T/I7CKGaf4d1H3HsD
 rTVjmOFwO2lokp8gYxbjeW764JnCyavSYucrSD6YHIud3BDLC+NF8xHcvJ3+gMgSKItw
 ZbbvZUnVUt0YMMjnrnX+yuN3VRKl75Zw8mE7rOtSMjxiC+eT8+QtGhfM7y0zDrtOBpZL
 IyWg==
X-Gm-Message-State: ACrzQf3Glgy1NXSUhhsMIy/v2jGQWn7gpK7B+gWW42SCEXRNyqJ9X26/
 WKC6UWZYqH9o9OxVX/RxJZk7ayPFnhqFItUIFPaTZcKNcOHDMmYFjxfGlC03yvd8nxi1surFoeY
 1xmJHJEWKILdqcek=
X-Received: by 2002:a05:6e02:1be7:b0:300:348d:99d with SMTP id
 y7-20020a056e021be700b00300348d099dmr2216469ilv.297.1666804943089; 
 Wed, 26 Oct 2022 10:22:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6c93+EUyu8hVOtf71n0B37zOirfktMNdM9EeTMn1/FbRZeC0M0dfarruXnqLSOjGbll2tirA==
X-Received: by 2002:a05:6e02:1be7:b0:300:348d:99d with SMTP id
 y7-20020a056e021be700b00300348d099dmr2216439ilv.297.1666804942750; 
 Wed, 26 Oct 2022 10:22:22 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a15-20020a92c70f000000b002f9f44625fbsm2221180ilp.52.2022.10.26.10.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 10:22:22 -0700 (PDT)
Date: Wed, 26 Oct 2022 11:22:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: qemu-devel@nongnu.org, Steve Sistare <steven.sistare@oracle.com>,
 yc-core@yandex-team.ru, Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 0/4] Allow to pass pre-created VFIO container/group to QEMU
Message-ID: <20221026112220.36d8d21b.alex.williamson@redhat.com>
In-Reply-To: <2cc9ecc1-97d8-44de-4609-35e703dd627b@yandex-team.com>
References: <20221017105407.3858-1-arbn@yandex-team.com>
 <20221017092105.0476385c.alex.williamson@redhat.com>
 <2cc9ecc1-97d8-44de-4609-35e703dd627b@yandex-team.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 26 Oct 2022 15:07:32 +0300
Andrey Ryabinin <arbn@yandex-team.com> wrote:

> On 10/17/22 18:21, Alex Williamson wrote:
> > On Mon, 17 Oct 2022 13:54:03 +0300
> > Andrey Ryabinin <arbn@yandex-team.com> wrote:
> >   
> >> These patches add possibility to pass VFIO device to QEMU using file
> >> descriptors of VFIO container/group, instead of creating those by QEMU.
> >> This allows to take away permissions to open /dev/vfio/* from QEMU and
> >> delegate that to managment layer like libvirt.
> >>
> >> The VFIO API doen't allow to pass just fd of device, since we also need to have
> >> VFIO container and group. So these patches allow to pass created VFIO container/group
> >> to QEMU via command line/QMP, e.g. like this:
> >>             -object vfio-container,id=ct,fd=5 \
> >>             -object vfio-group,id=grp,fd=6,container=ct \
> >>             -device vfio-pci,host=05:00.0,group=grp  
> > 
> > This suggests that management tools need to become intimately familiar
> > with container and group association restrictions for implicit
> > dependencies, such as device AddressSpace.  We had considered this
> > before and intentionally chosen to allow QEMU to manage that
> > relationship.  Things like PCI bus type and presence of a vIOMMU factor
> > into these relationships.
> >   
> 
> This is already the case. These patches doesn't change much.
> QEMU doesn't allow to adding device from one group to several address spaces.
> So the management tool needs to know whether devices are in the same group or not
> and whether QEMU will create separate address spaces for these devices or not.
> 
> E.g.
> qemu-system-x86_64 -nodefaults -M q35,accel=kvm,kernel-irqchip=split \
>         -device intel-iommu,intremap=on,caching-mode=on \
>         -device vfio-pci,host=00:1f.3 \
>         -device vfio-pci,host=00:1f.4 
> qemu-system-x86_64: -device vfio-pci,host=00:1f.4: vfio 0000:00:1f.4: group 14 used in multiple address spaces

Obviously QEMU fails this configuration.  It must.  How does that
suggest that a management tool, like libvirt, is already aware of this
requirement.  In fact, libvirt will happily validate xml creating such
a configuration.  The point was that tools like libvirt would need to
provide these group and container file descriptors and they currently
impose no restrictions or working knowledge on the relationship between
devices, groups, containers, and address spaces.

> > In the above example, what happens in a mixed environment, for example
> > if we then add '-device vfio-pci,host=06:00.0' to the command line?
> > Isn't QEMU still going to try to re-use the container if it exists in
> > the same address space? Potentially this device could also be a member
> > of the same group.  How would the management tool know when to expect
> > the provided fds be released?
> >   
> 
> Valid point, container indeed will be reused and second device will occupy it.
> But we could make new container instead. Using several containers in one address
> space won't be a problem, right?
> Of course several devices from same group won't be allowed to be added in mixed way.

Potentially, yes, that is a problem.  Each container represents a
separate IOMMU context, separate DMA map and unmap operations, and
separate locked page accounting.  So if libvirt chooses the more
trivial solution to impose a new container for every group, that
translates to space, time, and process accounting overhead.

> > We also have an outstanding RFC for iommufd that already proposes an fd
> > passing interface, where iommufd removes many of the issues of the vfio
> > container by supporting multiple address spaces within a single fd
> > context, avoiding the duplicate locked page accounting issues between
> > containers, and proposing a direct device fd interface for vfio.  Why at
> > this point in time would we choose to expand the QEMU vfio interface in
> > this way?  Thanks,
> >   
> 
> It sounds nice, but iommufd is new API which doesn't exist in any kernel yet.
> These patches is something that can be used on existing, already deployed kernels.

OTOH, we expect iommufd in the near term, non-RFC patches are posted.
The vfio kernel modules have undergone significant churn in recent
kernels to align with the development goals of iommufd.  QEMU support to
accept file descriptors for "legacy" implementations of vfio is only
the beginning, where the next step would require the management tools
to be sufficiently enlightened to implement file descriptor passing.
All of that suggests development and maintenance effort for something
we're actively trying to replace.  Thanks,

Alex


