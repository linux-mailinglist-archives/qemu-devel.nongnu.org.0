Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8A3E829D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:13:52 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDWG7-0007Od-Ax
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1mDWFD-00068d-73
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:12:55 -0400
Received: from mga07.intel.com ([134.134.136.100]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1mDWFA-0001fq-AF
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:12:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="278709715"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="278709715"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 11:12:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="675138230"
Received: from luisdsan-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.128.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 11:12:43 -0700
Date: Tue, 10 Aug 2021 11:12:40 -0700
From: Ben Widawsky <ben.widawsky@intel.com>
To: Samarth Saxena <samarths@cadence.com>
Subject: Re: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails
 with assertion
Message-ID: <20210810181240.tkhfcd4erlcqteov@intel.com>
References: <DM6PR07MB8143073FA28EA05BAF7D8B24DDF69@DM6PR07MB8143.namprd07.prod.outlook.com>
 <YRJizxKbMxpwhSrL@work-vm>
 <DM6PR07MB814371B8A41F4B387F02C08ADDF79@DM6PR07MB8143.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR07MB814371B8A41F4B387F02C08ADDF79@DM6PR07MB8143.namprd07.prod.outlook.com>
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Dave.

Samarth,

Easiest is to just use our run_qemu and figure out the diffs (--cmdline will
print the qemu commandline):
https://github.com/pmem/run_qemu

If you're not able to figure it out after that, please let me know.

On 21-08-10 17:38:16, Samarth Saxena wrote:
> Thanks Dave,
> 
> The Qemu version is qemu-6.0.50.
> 
> I am trying to capture the stack and will place it ASAP.
> 
> Regards,
> Samarth
> 
> 
> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com> 
> Sent: Tuesday, August 10, 2021 4:58 PM
> To: Samarth Saxena <samarths@cadence.com>; ben.widawsky@intel.com
> Cc: qemu-devel@nongnu.org
> Subject: Re: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails with assertion
> 
> EXTERNAL MAIL
> 
> 
> * Samarth Saxena (samarths@cadence.com) wrote:
> > Hi All,
> > 
> > I am trying the following command to run Qemu with Kernel 5.14.
> 
> cc'ing in Ben who I think owns the CXL stuff.
> 
> > qemu-system-x86_64 -M q35,accel=kvm,nvdimm=on,cxl=on,hmat=on -m 
> > 8448M,slots=2,maxmem=16G -smp 8,sockets=2,cores=2,threads=2 -hda 
> > /lan/dscratch/singhabh/shradha/ubuntu-20.10-64_with_orig_driver_backup
> > .qcow2 -enable-kvm -usbdevice tablet -L $VB_ROOT/etc/vm/common/ 
> > -object memory-backend-ram,id=cxl-ram,share=on,size=256M -device 
> > "pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,len-window-base=1,window-
> > base[0]=0x4c0000000,memdev[0]=cxl-ram" -device 
> > cxl-rp,id=rp0,bus=cxl.0,addr=0.0,chassis=0,slot=0 -device 
> > cxl-type3,bus=rp0,memdev=cxl-ram,id=cxl-vmem0,size=256M -numa 
> > node,nodeid=0,memdev=cxl-ram -object 
> > memory-backend-ram,id=other-ram,size=8G,prealloc=n,share=off -numa 
> > node,nodeid=1,memdev=other-ram,initiator=0 -numa 
> > cpu,node-id=0,socket-id=0 -numa cpu,node-id=0,socket-id=1
> 
> You probably need to state which qemu tree and version you're using here.
> 
> > I get the following crash before the machine starts to boot.
> > 
> > qemu-system-x86_64: ../softmmu/memory.c:2443: memory_region_add_subregion_common: Assertion `!subregion->container' failed.
> 
> It's probably best to check with Ben, but you'll want a backtrace and figure out which subregion and region you're dealing with.
> 
> Dave
> 
> > 
> > Please help me find what's wrong here.
> > 
> > Regards,
> > [CadenceLogoRed185Regcopy1583174817new51584636989.png]<https://www.cad
> > ence.com/en_US/home.html>
> > Samarth Saxena
> > Sr Principal Software Engineer
> > T: +911204308300
> > [UIcorrectsize1583179003.png]<https://www.cadence.com/en_US/home.html>
> > [16066EmailSignatureFortune100Best2021White92x1271617625037.png]<https
> > ://www.cadence.com/en_US/home/company/careers.html>
> > 
> > 
> > 
> > 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

