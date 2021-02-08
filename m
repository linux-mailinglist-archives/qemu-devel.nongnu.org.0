Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A1D3141F2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:37:11 +0100 (CET)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EDW-0005Se-So
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l9Ahj-0007qr-RZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:52:07 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:37312
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l9Ahi-0002Di-7E
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:52:07 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 41F1C123439; Mon,  8 Feb 2021 09:52:02 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 5F4EA122C69;
 Mon,  8 Feb 2021 09:51:55 -0800 (PST)
Date: Mon, 8 Feb 2021 09:51:53 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH v1 01/01] PCIe DOE for PCIe and CXL 2.0
Message-ID: <20210208175153.o5rtag2diyn4ztqq@mail.bwidawsk.net>
References: <4F370DAB-1EFE-490B-B93F-312AC5081057@avery-design.com>
 <20210205160954.00006728@Huawei.com>
 <20210205171936.nx62hs4z4vr5g2er@intel.com>
 <20210205184942.00002233@Huawei.com>
 <593ADBD3-9A16-4875-AF5B-57E346A3460A@avery-design.com>
 <20210208105551.00005c12@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210208105551.00005c12@Huawei.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, vishal.l.verma@intel.com, jgroves@micron.com,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, armbru@redhat.com, imammedo@redhat.com,
 david@redhat.com, ira.weiny@intel.com, dan.j.williams@intel.com,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-08 10:55:51, Jonathan Cameron wrote:
> ...
> 
> > 
> > >   
> > >>   
> > >>>> 
> > >>>> Just like you we feel what's most important is to have DOE supported so that
> > >>>> UEFI and Linux kernel and drivers can progress.  We're also contributing to
> > >>>> writing compliance tests for the CXL Compliance Software Development WG.    
> > >>> 
> > >>> Great.    
> > >> 
> > >> Is anyone doing the kernel enabling for it?  
> > > 
> > > Planning to look at this but plenty of other things on my todo list if someone
> > > else gets to it first.
> > > 
> > > Generic DOE support should be straight forward (the infrastructure).
> > > Parsing CDAT also straight forward.
> > > Doing something with the results is hard unless we just provide an interface for
> > > userspace to query them for a given device - or dump the table
> > > (I think we do want to be able to that). 
> > > 
> > > What I'm really not sure on is how to handle NUMA domains that are created late
> > > in the kernel boot sequence.  The  ACPI flow is set up with the assumption
> > > that we can get them from SRAT very early in boot. Need to figure out how to
> > > work around that. (e.g. preallocate a bunch of spare nodes for example though that's
> > > ugly).  Note IIRC the kernel doesn't do runtime update of any of the ACPI
> > > performance parameters yet (_SLI, _HMA) so there probably isn't any infrastructure
> > > that we can reuse.
> > > 
> > > There is also the firmware based enumeration and description option (OS not necessarily
> > > aware of CXL) in which this is all up to EDK2 and the kernel gets it all presented
> > > as standard tables.  
> > 
> > Do we know who’s on this as part of the EDK2 development?  It would be great if they could
> > address the SRAT/HMAT generation from reading CDAT.  EDK2 does address CXL 1.1 now.
> 
> No idea who, if anyone, is looking at this currently.  Perhaps ask on the EDK2 list?
> 
> Jonathan
> 

I did ping the folks at #edk2 in OFTC a few months back and got basically no
response. Mailing list might be best though.

> > 
> > > 
> > > As you can perhaps tell from my half done reviews, this week disappeared in
> > > other things so bit of catch up for me to do next week.
> > > 
> > > Thanks,
> > > 
> > > Joanthan
> > > 
> ...
> 

