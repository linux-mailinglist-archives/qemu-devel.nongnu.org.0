Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96121FD3A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 17:52:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLV3R-0006Kj-Nd
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 11:52:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hLUum-0007sT-EP
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hLUh8-00019t-Qt
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:29:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28609)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hLUh8-00019d-Iy
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:29:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5F2C309264B;
	Tue, 30 Apr 2019 15:29:20 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04D0A10013D9;
	Tue, 30 Apr 2019 15:29:10 +0000 (UTC)
Date: Tue, 30 Apr 2019 17:29:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Message-ID: <20190430172908.2ae77fa9.cohuck@redhat.com>
In-Reply-To: <20190424081558.GE26247@joy-OptiPlex-7040>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
	<20190419083505.19654-1-yan.y.zhao@intel.com>
	<20190423115932.42619422.cohuck@redhat.com>
	<20190424031036.GB26247@joy-OptiPlex-7040>
	<20190424095624.0ce97328.cohuck@redhat.com>
	<20190424081558.GE26247@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 30 Apr 2019 15:29:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] vfio/mdev: add version field as
 mandatory attribute for mdev device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"aik@ozlabs.ru" <aik@ozlabs.ru>,
	"Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
	"shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	"eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi
	L" <yi.l.liu@intel.com>, "eskultet@redhat.com" <eskultet@redhat.com>,
	"Yang, Ziye" <ziye.yang@intel.com>,
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"libvir-list@redhat.com" <libvir-list@redhat.com>,
	"arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
	"felipe@nutanix.com" <felipe@nutanix.com>,
	"Ken.Xue@amd.com" <Ken.Xue@amd.com>, "Tian, Kevin" <kevin.tian@intel.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>, "Liu,
	Changpeng" <changpeng.liu@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Wang, Zhi A" <zhi.a.wang@intel.com>,
	"jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
	Shaopeng" <shaopeng.he@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Apr 2019 04:15:58 -0400
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Wed, Apr 24, 2019 at 03:56:24PM +0800, Cornelia Huck wrote:
> > On Tue, 23 Apr 2019 23:10:37 -0400
> > Yan Zhao <yan.y.zhao@intel.com> wrote:
> >   
> > > On Tue, Apr 23, 2019 at 05:59:32PM +0800, Cornelia Huck wrote:  
> > > > On Fri, 19 Apr 2019 04:35:04 -0400
> > > > Yan Zhao <yan.y.zhao@intel.com> wrote:

> > > > > @@ -225,6 +228,8 @@ Directories and files under the sysfs for Each Physical Device
> > > > >    [<type-id>], device_api, and available_instances are mandatory attributes
> > > > >    that should be provided by vendor driver.
> > > > >
> > > > > +  version is a mandatory attribute if a mdev device supports live migration.    
> > > > 
> > > > What about "An mdev device wishing to support live migration must
> > > > provide the version attribute."?    
> > > yes, I just want to keep consistent with the line above it 
> > > " [<type-id>], device_api, and available_instances are mandatory attributes
> > >   that should be provided by vendor driver."
> > > what about below one?
> > >   "version is a mandatory attribute if a mdev device wishing to support live
> > >   migration."  
> > 
> > My point is that an attribute is not mandatory if it can be left out :)
> > (I'm not a native speaker, though; maybe this makes perfect sense
> > after all?)
> > 
> > Maybe "version is a required attribute if live migration is supported
> > for an mdev device"?
> >   
> you are right, "mandatory" may bring some confusion.
> Maybe
> "vendor driver must provide version attribute for an mdev device wishing to
> support live migration." ?
> based on your first version :)

"The vendor driver must provide the version attribute for any mdev
device it wishes to support live migration for." ?

> 
> > > 
> > >   
> > > > > +
> > > > >  * [<type-id>]
> > > > >
> > > > >    The [<type-id>] name is created by adding the device driver string as a prefix
> > > > > @@ -246,6 +251,35 @@ Directories and files under the sysfs for Each Physical Device
> > > > >    This attribute should show the number of devices of type <type-id> that can be
> > > > >    created.
> > > > >
> > > > > +* version
> > > > > +
> > > > > +  This attribute is rw. It is used to check whether two devices are compatible
> > > > > +  for live migration. If this attribute is missing, then the corresponding mdev
> > > > > +  device is regarded as not supporting live migration.
> > > > > +
> > > > > +  It consists of two parts: common part and vendor proprietary part.
> > > > > +  common part: 32 bit. lower 16 bits is vendor id and higher 16 bits identifies
> > > > > +               device type. e.g., for pci device, it is
> > > > > +               "pci vendor id" | (VFIO_DEVICE_FLAGS_PCI << 16).
> > > > > +  vendor proprietary part: this part is varied in length. vendor driver can
> > > > > +               specify any string to identify a device.
> > > > > +
> > > > > +  When reading this attribute, it should show device version string of the device
> > > > > +  of type <type-id>. If a device does not support live migration, it should
> > > > > +  return errno.
> > > > > +  When writing a string to this attribute, it returns errno for incompatibility
> > > > > +  or returns written string length in compatibility case. If a device does not
> > > > > +  support live migration, it always returns errno.    
> > > > 
> > > > I'm not sure whether a device that does not support live migration
> > > > should expose this attribute in the first place. Or is that to cover
> > > > cases where a driver supports live migration only for some of the
> > > > devices it supports?    
> > > yes, driver returning error code is to cover the cases where only part of devices it
> > > supports can be migrated.
> > > 
> > >   
> > > > Also, I'm not sure if a string that has to be parsed is a good idea...
> > > > is this 'version' attribute supposed to convey some human-readable
> > > > information as well? The procedure you describe for compatibility
> > > > checking does the checking within the vendor driver which I would
> > > > expect to have a table/rules for that anyway.    
> > > right. if a vendor driver has the confidence to migrate between devices of
> > > diffent platform or mdev types, it can maintain a compatibility table for that
> > > purpose. That's the reason why we would leave the compatibility check to vendor
> > > driver. vendor driver can freely choose its own complicated way to decide
> > > which device is migratable to which device.  
> > 
> > I think there are two scenarios here:
> > - Migrating between different device types, which is unlikely to work,
> >   except in special cases.
> > - Migrating between different versions of the same device type, which
> >   may work for some drivers/devices (and at least migrating to a newer
> >   version looks quite reasonable).
> > 
> > But both should be something that is decided by the individual driver;
> > I hope we don't want to support migration between different drivers :-O
> > 
> > Can we make this a driver-defined format?
> >  
> yes, this is indeed driver-defined format.
> Actually we define it into two parts: common part and vendor proprietary part.
> common part: 32 bit. lower 16 bits is vendor id and higher 16 bits
>              identifies device type. e.g., for pci device, it is
>              "pci vendor id" | (VFIO_DEVICE_FLAGS_PCI << 16).
> vendor proprietary part: this part is varied in length. vendor driver can
>              specify any string to identify a device.
> 
> vendor proprietary part is defined by vendor driver. vendor driver can
> define any format it wishes to use. Also it is its own responsibility to
> ensure backward compatibility if it wants to update format definition in this
> part.
> 
> So user space only needs to get source side's version string, and asks
> target side whether the two are compatible. The decision maker is the
> vendor driver:)

If I followed the discussion correctly, I think you plan to drop this
format, don't you? I'd be happy if a vendor driver can use a simple
number without any prefixes if it so chooses.

I also like the idea of renaming this "migration_version" so that it is
clear we're dealing with versioning of the migration capability (and
not a version of the device or so).

