Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15A6185B1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 09:02:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOd4a-0006MU-Sh
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 03:02:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yan.y.zhao@intel.com>) id 1hOd3P-0005dc-Gq
	for qemu-devel@nongnu.org; Thu, 09 May 2019 03:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yan.y.zhao@intel.com>) id 1hOd3K-0003Bs-Jp
	for qemu-devel@nongnu.org; Thu, 09 May 2019 03:01:19 -0400
Received: from mga09.intel.com ([134.134.136.24]:3100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
	id 1hOd3K-0003A6-CN
	for qemu-devel@nongnu.org; Thu, 09 May 2019 03:01:14 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 May 2019 00:01:10 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
	([10.239.13.9])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2019 00:01:05 -0700
Date: Thu, 9 May 2019 02:55:27 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Boris Fiuczynski <fiuczy@linux.ibm.com>
Message-ID: <20190509065527.GG24397@joy-OptiPlex-7040>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
	<20190506014904.3621-1-yan.y.zhao@intel.com>
	<20190507151826.502be009@x1.home>
	<20190508112740.GA24397@joy-OptiPlex-7040>
	<20190508152242.4b54a5e7@x1.home>
	<5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-devel] [libvirt] [PATCH v2 1/2] vfio/mdev: add version
 attribute for mdev device
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"aik@ozlabs.ru" <aik@ozlabs.ru>,
	"Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
	"shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	"eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
	Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	"libvir-list@redhat.com" <libvir-list@redhat.com>,
	"arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
	"felipe@nutanix.com" <felipe@nutanix.com>,
	"Ken.Xue@amd.com" <Ken.Xue@amd.com>, "Tian, Kevin" <kevin.tian@intel.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	"intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>, "Liu,
	Changpeng" <changpeng.liu@intel.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Wang, Zhi A" <zhi.a.wang@intel.com>,
	"dinechin@redhat.com" <dinechin@redhat.com>, "He,
	Shaopeng" <shaopeng.he@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 08, 2019 at 11:27:47PM +0800, Boris Fiuczynski wrote:
> On 5/8/19 11:22 PM, Alex Williamson wrote:
> >>> I thought there was a request to make this more specific to migration
> >>> by renaming it to something like migration_version.  Also, as an
> >>>   
> >> so this attribute may not only include a mdev device's parent device info and
> >> mdev type, but also include numeric software version of vendor specific
> >> migration code, right?
> > It's a vendor defined string, it should be considered opaque to the
> > user, the vendor can include whatever they feel is relevant.
> > 
> Would a vendor also be allowed to provide a string expressing required 
> features as well as containing backend resource requirements which need 
> to be compatible for a successful migration? Somehow a bit like a cpu 
> model... maybe even as json or xml...
> I am asking this with vfio-ap in mind. In that context checking 
> compatibility of two vfio-ap mdev devices is not as simple as checking 
> if version A is smaller or equal to version B.
>
I think so. vendor driver is allowed to put whatever content into the
migration_version string as long as it thinks it's necessary. 
vendor driver only needs ensure in the target mdev device, the write(2)
operation on its migration_version attribute would correctly fail or succeeed
based on the input string.

Thanks
Yan
> -- 
> Mit freundlichen Grüßen/Kind regards
>     Boris Fiuczynski
> 
> IBM Deutschland Research & Development GmbH
> Vorsitzender des Aufsichtsrats: Matthias Hartmann
> Geschäftsführung: Dirk Wittkopp
> Sitz der Gesellschaft: Böblingen
> Registergericht: Amtsgericht Stuttgart, HRB 243294
> 

