Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18906306635
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:33:37 +0100 (CET)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sRT-0005Zq-M5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l4sOh-00046A-6k
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:30:43 -0500
Received: from mga07.intel.com ([134.134.136.100]:36511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l4sOa-0001M0-Ln
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:30:42 -0500
IronPort-SDR: OXSMigXAU8qnFsbldRgfW5KWuimYUOhCUmWBPLJQeDgsmzs6aaM1PX+EUgHJ5arMuKDfXgkC4R
 XL/nHsXTy+rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="244215512"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="244215512"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 13:30:31 -0800
IronPort-SDR: C+MUe39UhmhZgJxUgWpYG+Q/mmm4ssLH+54DyMuDhjNEE/bsee85ymQmHMw4wod6qGqa40iz8W
 32N55AnyEpqQ==
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="403237701"
Received: from nsadhu-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.133.77])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 13:30:29 -0800
Date: Wed, 27 Jan 2021 13:30:28 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC PATCH v2 24/32] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20210127213028.z5qd76xljh2dfu4h@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-25-ben.widawsky@intel.com>
 <20210127220312.6850abe2@redhat.com>
 <20210127211116.3425vvaylg6rzbuv@intel.com>
 <20210127222104.7b7ad988@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127222104.7b7ad988@redhat.com>
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=ben.widawsky@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Chris Browy <cbrowy@avery-design.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-27 22:21:04, Igor Mammedov wrote:
> On Wed, 27 Jan 2021 13:11:16 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > On 21-01-27 22:03:12, Igor Mammedov wrote:
> > > On Tue,  5 Jan 2021 08:53:15 -0800
> > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > >   
> > > > A CXL memory device (AKA Type 3) is a CXL component that contains some
> > > > combination of volatile and persistent memory. It also implements the
> > > > previously defined mailbox interface as well as the memory device
> > > > firmware interface.
> > > > 
> > > > The following example will create a 256M device in a 512M window:
> > > > 
> > > > -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> > > > -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"  
> > > 
> > > I'd expect whole backend used by frontend, so one would not need "size" property
> > > on frontend (like we do with memory devices).
> > > So question is why it partially uses memdev?  
> > 
> > A CXL memory device may participate in an interleave set. In such a case, it
> > would be < the total size of the memory window.
> > 
> > This isn't implemented in the code yet, but it is planned.
> 
> could you add here how it supposed to look like CLI interface wise? 
> 
> also see other questions below.
> 

My mistake on the other questions. I forked another thread for those.

Interleave is still being fleshed out. But generally to set up a 512M address
range interleaves across 2 devices, each 256M, and each connected to a root port
on the host bridge:

# Memory backend
-object memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M

# Host Bridge
-device pxb-cxl id=cxl.0,bus=pcie.0,bus_nr=52,uid=0 len-window-base=1,window-base[0]=0x4c0000000 memdev[0]=cxl-mem1

# 2 root ports
-device cxl-rp,id=rp0,bus=cxl.0,addr=0.0,chassis=0,slot=0,memdev=cxl-mem1
-device cxl-rp,id=rp1,bus=cxl.0,addr=0.1,chassis=0,slot=1,memdev=cxl-mem1

# 2 PMEM devices
-device cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M
-device cxl-type3,bus=rp1,memdev=cxl-mem1,id=cxl-pmem1,size=256M

