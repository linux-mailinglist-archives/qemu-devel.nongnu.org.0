Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81918E6E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 18:50:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOmFr-0002k5-Ky
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 12:50:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hOmDt-0001zT-5n
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:48:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hOmDs-0004hZ-6v
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:48:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37702)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hOmDr-0004hG-Vv
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:48:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DCCA3B712;
	Thu,  9 May 2019 16:48:42 +0000 (UTC)
Received: from work-vm (ovpn-116-174.ams2.redhat.com [10.36.116.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95FF11710E;
	Thu,  9 May 2019 16:48:28 +0000 (UTC)
Date: Thu, 9 May 2019 17:48:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190509164825.GG2868@work-vm>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
	<20190506014904.3621-1-yan.y.zhao@intel.com>
	<20190507151826.502be009@x1.home>
	<20190509173839.2b9b2b46.cohuck@redhat.com>
	<20190509154857.GF2868@work-vm>
	<20190509175404.512ae7aa.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509175404.512ae7aa.cohuck@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 09 May 2019 16:48:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/2] vfio/mdev: add version attribute
 for mdev device
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
	Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
	qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
	yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
	mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
	arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
	kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
	zhenyuw@linux.intel.com, dinechin@redhat.com,
	Alex Williamson <alex.williamson@redhat.com>,
	intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com,
	linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
	jonathan.davies@nutanix.com, shaopeng.he@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Thu, 9 May 2019 16:48:57 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > On Tue, 7 May 2019 15:18:26 -0600
> > > Alex Williamson <alex.williamson@redhat.com> wrote:
> > >   
> > > > On Sun,  5 May 2019 21:49:04 -0400
> > > > Yan Zhao <yan.y.zhao@intel.com> wrote:  
> > >   
> > > > > +  Errno:
> > > > > +  If vendor driver wants to claim a mdev device incompatible to all other mdev
> > > > > +  devices, it should not register version attribute for this mdev device. But if
> > > > > +  a vendor driver has already registered version attribute and it wants to claim
> > > > > +  a mdev device incompatible to all other mdev devices, it needs to return
> > > > > +  -ENODEV on access to this mdev device's version attribute.
> > > > > +  If a mdev device is only incompatible to certain mdev devices, write of
> > > > > +  incompatible mdev devices's version strings to its version attribute should
> > > > > +  return -EINVAL;    
> > > > 
> > > > I think it's best not to define the specific errno returned for a
> > > > specific situation, let the vendor driver decide, userspace simply
> > > > needs to know that an errno on read indicates the device does not
> > > > support migration version comparison and that an errno on write
> > > > indicates the devices are incompatible or the target doesn't support
> > > > migration versions.  
> > > 
> > > I think I have to disagree here: It's probably valuable to have an
> > > agreed error for 'cannot migrate at all' vs 'cannot migrate between
> > > those two particular devices'. Userspace might want to do different
> > > things (e.g. trying with different device pairs).  
> > 
> > Trying to stuff these things down an errno seems a bad idea; we can't
> > get much information that way.
> 
> So, what would be a reasonable approach? Userspace should first read
> the version attributes on both devices (to find out whether migration
> is supported at all), and only then figure out via writing whether they
> are compatible?
> 
> (Or just go ahead and try, if it does not care about the reason.)

Well, I'm OK with something like writing to test whether it's
compatible, it's just we need a better way of saying 'no'.
I'm not sure if that involves reading back from somewhere after
the write or what.

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

