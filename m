Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30524ADA3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 06:18:24 +0200 (CEST)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8c1v-0002Bd-Em
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 00:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1k8c1D-0001m6-6R
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 00:17:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:28095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1k8c1A-00019W-Bf
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 00:17:38 -0400
IronPort-SDR: an/ZJ5bobZjrW+1qF+9ah9e6VbPgbLXK44GfKgj3TInakBpjPQSjEIBIMzro8Ly6c1D8DdTLa9
 Quyvsc806p+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="173281889"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="173281889"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 21:17:29 -0700
IronPort-SDR: dKmYv5lKjelxEcNHuICrNn7mXFMSDL/4It7gVYgGUcXEsEm3Ly1KBPFrwzagYkitMC7xP6XTss
 wsE1vs4BWGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="327289452"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 21:17:23 -0700
Date: Thu, 20 Aug 2020 12:01:16 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Mooney <smooney@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200820040116.GB24121@joy-OptiPlex-7040>
References: <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <242591bb809b68c618f62fdc93d4f8ae7b146b6d.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <242591bb809b68c618f62fdc93d4f8ae7b146b6d.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yan.y.zhao@intel.com;
 helo=mga01.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 00:17:30
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, eskultet@redhat.com,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 20, 2020 at 02:29:07AM +0100, Sean Mooney wrote:
> On Thu, 2020-08-20 at 08:39 +0800, Yan Zhao wrote:
> > On Tue, Aug 18, 2020 at 11:36:52AM +0200, Cornelia Huck wrote:
> > > On Tue, 18 Aug 2020 10:16:28 +0100
> > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > 
> > > > On Tue, Aug 18, 2020 at 05:01:51PM +0800, Jason Wang wrote:
> > > > >    On 2020/8/18 下午4:55, Daniel P. Berrangé wrote:
> > > > > 
> > > > >  On Tue, Aug 18, 2020 at 11:24:30AM +0800, Jason Wang wrote:
> > > > > 
> > > > >  On 2020/8/14 下午1:16, Yan Zhao wrote:
> > > > > 
> > > > >  On Thu, Aug 13, 2020 at 12:24:50PM +0800, Jason Wang wrote:
> > > > > 
> > > > >  On 2020/8/10 下午3:46, Yan Zhao wrote:  
> > > > >  we actually can also retrieve the same information through sysfs, .e.g
> > > > > 
> > > > >  |- [path to device]
> > > > >     |--- migration
> > > > >     |     |--- self
> > > > >     |     |   |---device_api
> > > > >     |    |   |---mdev_type
> > > > >     |    |   |---software_version
> > > > >     |    |   |---device_id
> > > > >     |    |   |---aggregator
> > > > >     |     |--- compatible
> > > > >     |     |   |---device_api
> > > > >     |    |   |---mdev_type
> > > > >     |    |   |---software_version
> > > > >     |    |   |---device_id
> > > > >     |    |   |---aggregator
> > > > > 
> > > > > 
> > > > >  Yes but:
> > > > > 
> > > > >  - You need one file per attribute (one syscall for one attribute)
> > > > >  - Attribute is coupled with kobject
> > > 
> > > Is that really that bad? You have the device with an embedded kobject
> > > anyway, and you can just put things into an attribute group?
> > > 
> > > [Also, I think that self/compatible split in the example makes things
> > > needlessly complex. Shouldn't semantic versioning and matching already
> > > cover nearly everything? I would expect very few cases that are more
> > > complex than that. Maybe the aggregation stuff, but I don't think we
> > > need that self/compatible split for that, either.]
> > 
> > Hi Cornelia,
> > 
> > The reason I want to declare compatible list of attributes is that
> > sometimes it's not a simple 1:1 matching of source attributes and target attributes
> > as I demonstrated below,
> > source mdev of (mdev_type i915-GVTg_V5_2 + aggregator 1) is compatible to
> > target mdev of (mdev_type i915-GVTg_V5_4 + aggregator 2),
> >                (mdev_type i915-GVTg_V5_8 + aggregator 4)
> the way you are doing the nameing is till really confusing by the way
> if this has not already been merged in the kernel can you chagne the mdev
> so that mdev_type i915-GVTg_V5_2 is 2 of mdev_type i915-GVTg_V5_1 instead of half the device
> 
> currently you need to deived the aggratod by the number at the end of the mdev type to figure out
> how much of the phsicial device is being used with is a very unfridly api convention
> 
> the way aggrator are being proposed in general is not really someting i like but i thin this at least
> is something that should be able to correct.
> 
> with the complexity in the mdev type name + aggrator i suspect that this will never be support
> in openstack nova directly requireing integration via cyborg unless we can pre partion the
> device in to mdevs staicaly and just ignore this.
> 
> this is way to vendor sepecif to integrate into something like openstack in nova unless we can guarentee
> taht how aggreator work will be portable across vendors genericly.
> 
> > 
> > and aggragator may be just one of such examples that 1:1 matching does not
> > fit.
> for openstack nova i dont see us support anything beyond the 1:1 case where the mdev type does not change.
>
hi Sean,
I understand it's hard for openstack. but 1:N is always meaningful.
e.g.
if source device 1 has cap A, it is compatible to
device 2: cap A,
device 3: cap A+B,
device 4: cap A+B+C
....
to allow openstack to detect it correctly, in compatible list of
device 2, we would say compatible cap is A;
device 3, compatible cap is A or A+B;
device 4, compatible cap is A or A+B, or A+B+C;

then if openstack finds device A's self cap A is contained in compatible
cap of device 2/3/4, it can migrate device 1 to device 2,3,4.

conversely,  device 1's compatible cap is only A,
so it is able to migrate device 2 to device 1, and it is not able to
migrate device 3/4 to device 1.

Thanks
Yan

> i woudl really prefer if there was just one mdev type that repsented the minimal allcatable unit and the
> aggragaotr where used to create compostions of that. i.e instad of i915-GVTg_V5_2 beign half the device,
> have 1 mdev type i915-GVTg and if the device support 8 of them then we can aggrate 4 of i915-GVTg
> 
> if you want to have muplie mdev type to model the different amoutn of the resouce e.g. i915-GVTg_small i915-GVTg_large
> that is totlaly fine too or even i915-GVTg_4 indcating it sis 4 of i915-GVTg
> 
> failing that i would just expose an mdev type per composable resouce and allow us to compose them a the user level with
> some other construct mudeling a attament to the device. e.g. create composed mdev or somethig that is an aggreateion of
> multiple sub resouces each of which is an mdev. so kind of like how bond port work. we would create an mdev for each of
> the sub resouces and then create a bond or aggrated mdev by reference the other mdevs by uuid then attach only the
> aggreated mdev to the instance.
> 
> the current aggrator syntax and sematic however make me rather uncofrotable when i think about orchestating vms on top
> of it even to boot them let alone migrate them.
> > 
> > So, we explicitly list out self/compatible attributes, and management
> > tools only need to check if self attributes is contained compatible
> > attributes.
> > 
> > or do you mean only compatible list is enough, and the management tools
> > need to find out self list by themselves?
> > But I think provide a self list is easier for management tools.
> > 
> > Thanks
> > Yan
> > 
> 

