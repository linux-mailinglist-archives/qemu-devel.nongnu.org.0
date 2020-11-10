Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606C2AE1D6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 22:33:00 +0100 (CET)
Received: from localhost ([::1]:48376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcbG5-0002Iy-6u
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 16:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjia@nvidia.com>) id 1kcbEZ-0001qZ-7m
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:31:24 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjia@nvidia.com>) id 1kcbET-0007uk-UO
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:31:22 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fab05770000>; Tue, 10 Nov 2020 13:26:15 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 10 Nov 2020 21:26:08 +0000
Date: Tue, 10 Nov 2020 13:26:06 -0800
From: Neo Jia <cjia@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC PATCH for-QEMU-5.2] vfio: Make migration support experimental
Message-ID: <20201110212606.GA22394@nvidia.com>
References: <160494787833.1473.10514376876696596117.stgit@gimli.home>
 <20201109194417.GR3024@work-vm> <20201109132950.6c2dfe02@w520.home>
 <20201110091037.GA3108@work-vm>
 <898ba98f-9967-f3b3-737c-2d18b0281b51@nvidia.com>
 <20201110082050.10ca74d4@w520.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201110082050.10ca74d4@w520.home>
X-NVConfidentiality: public
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605043575; bh=OBuTo1F0P6nc8LQYwT9nQSI504vP2RDz4nq19qaZahc=;
 h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:X-NVConfidentiality:
 User-Agent:X-Originating-IP:X-ClientProxiedBy;
 b=EEe2jcLz7HfWpP8oUYD59U8sE7tebdMSTt2XjUaruj2rOle3fQzKB5UjqTPW7JI/u
 XYQUAw7fgc/INsJFTv3KjMkEgSpqPQDafVcngbj4VQmRxzVpYUW6xAEMv6Zx9VBP90
 wR1Anxt7TguM2oKwu3zcPVak5AN7BF8q969mtFRMQUaMOY7f4RCKjMcIx40jKBQUHG
 LXoU2piDUvyNlv+bdnKnJvnexxmg6vNdoHSkkGitb6NdqefmMk6xAHUBEAxQ5KQ9Q5
 OYPKacNsJl/+0reFILbovSRxMJPTsi9nPRtovCQ7BfQ+wjRc3ptIy6JB40Wi3ZA2w2
 9NyVzI1bw3B+w==
Received-SPF: pass client-ip=216.228.121.143; envelope-from=cjia@nvidia.com;
 helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 16:26:09
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Malcolm Crossley <mcrossley@nvidia.com>,
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 08:20:50AM -0700, Alex Williamson wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, 10 Nov 2020 19:46:20 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
> > On 11/10/2020 2:40 PM, Dr. David Alan Gilbert wrote:
> > > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > >> On Mon, 9 Nov 2020 19:44:17 +0000
> > >> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > >>
> > >>> * Alex Williamson (alex.williamson@redhat.com) wrote:
> > >>>> Per the proposed documentation for vfio device migration:
> > >>>>
> > >>>>    Dirty pages are tracked when device is in stop-and-copy phase
> > >>>>    because if pages are marked dirty during pre-copy phase and
> > >>>>    content is transfered from source to destination, there is no
> > >>>>    way to know newly dirtied pages from the point they were copied
> > >>>>    earlier until device stops. To avoid repeated copy of same
> > >>>>    content, pinned pages are marked dirty only during
> > >>>>    stop-and-copy phase.
> > >>>>
> > >>>> Essentially, since we don't have hardware dirty page tracking for
> > >>>> assigned devices at this point, we consider any page that is pinned
> > >>>> by an mdev vendor driver or pinned and mapped through the IOMMU to
> > >>>> be perpetually dirty.  In the worst case, this may result in all of
> > >>>> guest memory being considered dirty during every iteration of live
> > >>>> migration.  The current vfio implementation of migration has chosen
> > >>>> to mask device dirtied pages until the final stages of migration in
> > >>>> order to avoid this worst case scenario.
> > >>>>
> > >>>> Allowing the device to implement a policy decision to prioritize
> > >>>> reduced migration data like this jeopardizes QEMU's overall ability
> > >>>> to implement any degree of service level guarantees during migration.
> > >>>> For example, any estimates towards achieving acceptable downtime
> > >>>> margins cannot be trusted when such a device is present.  The vfio
> > >>>> device should participate in dirty page tracking to the best of its
> > >>>> ability throughout migration, even if that means the dirty footprint
> > >>>> of the device impedes migration progress, allowing both QEMU and
> > >>>> higher level management tools to decide whether to continue the
> > >>>> migration or abort due to failure to achieve the desired behavior.
> > >>>
> > >>> I don't feel particularly badly about the decision to squash it in
> > >>> during the stop-and-copy phase; for devices where the pinned memory
> > >>> is large, I don't think doing it during the main phase makes much sense;
> > >>> especially if you then have to deal with tracking changes in pinning.
> > >>
> > >>
> > >> AFAIK the kernel support for tracking changes in page pinning already
> > >> exists, this is largely the vfio device in QEMU that decides when to
> > >> start exposing the device dirty footprint to QEMU.  I'm a bit surprised
> > >> by this answer though, we don't really know what the device memory
> > >> footprint is.  It might be large, it might be nothing, but by not
> > >> participating in dirty page tracking until the VM is stopped, we can't
> > >> know what the footprint is and how it will affect downtime.  Is it
> > >> really the place of a QEMU device driver to impose this sort of policy?
> > >
> > > If it could actually track changes then I'd agree we shouldn't impose
> > > any policy; but if it's just marking the whole area as dirty we're going
> > > to need a bodge somewhere; this bodge doesn't look any worse than the
> > > others to me.
> > >
> > >>
> > >>> Having said that, I agree with marking it as experimental, because
> > >>> I'm dubious how useful it will be for the same reason, I worry
> > >>> about whether the downtime will be so large to make it pointless.
> > >>
> >
> > Not all device state is large, for example NIC might only report
> > currently mapped RX buffers which usually not more than a 1GB and could
> > be as low as 10's of MB. GPU might or might not have large data, that
> > depends on its use cases.
> 
> 
> Right, it's only if we have a vendor driver that doesn't pin any memory
> when dirty tracking is enabled and we're running without a viommu that
> we would expect all of guest memory to be continuously dirty.
> 
> 
> > >> TBH I think that's the wrong reason to mark it experimental.  There's
> > >> clearly demand for vfio device migration and even if the practical use
> > >> cases are initially small, they will expand over time and hardware will
> > >> get better.  My objection is that the current behavior masks the
> > >> hardware and device limitations, leading to unrealistic expectations.
> > >> If the user expects minimal downtime, configures convergence to account
> > >> for that, QEMU thinks it can achieve it, and then the device marks
> > >> everything dirty, that's not supportable.
> > >
> > > Yes, agreed.
> >
> > Yes, there is demand for vfio device migration and many devices owners
> > started scoping and development for migration support.
> > Instead of making whole migration support as experimental, we can have
> > opt-in option to decide to mark sys mem pages dirty during iterative
> > phase (pre-copy phase) of migration.
> 
> 
> Per my previous suggestion, I'd think an opt-out would be more
> appropriate, ie. implementing pre-copy dirty page tracking by default.

I think this will be a better approach without marking this feature as
experimental.

Thanks,
Neo

> 
> 
> > >> OTOH if the vfio device
> > >> participates in dirty tracking through pre-copy, then the practical use
> > >> cases will find themselves as migrations will either be aborted because
> > >> downtime tolerances cannot be achieved or downtimes will be configured
> > >> to match reality.  Thanks,
> > >
> > > Without a way to prioritise the unpinned memory during that period,
> > > we're going to be repeatedly sending the pinned memory which is going to
> > > lead to a much larger bandwidth usage that required; so that's going in
> > > completely the wrong direction and also wrong from the point of view of
> > > the user.
> 
> 
> Who decides which is the wrong direction for the user?  If the user
> wants minimal bandwidth regardless of downtime, can't they create a
> procedure to pause the VM, do the migration, then resume?  Are there
> already migration tunables to effectively achieve this?  If a user
> attempts to do a "live" migration, isn't our priority then shifted to
> managing the downtime constraints over the bandwidth?  IOW the policy
> decision is implied by the user actions and configuration of the
> migration, I don't think that at the device level we should be guessing
> which feature to prioritize, just like a vCPU doesn't to stop marking
> dirty pages during pre-copy because it's touching too much memory.
> Higher level policies and configurations should determine inflection
> points... imo.  Thanks,
> 
> Alex
> 

