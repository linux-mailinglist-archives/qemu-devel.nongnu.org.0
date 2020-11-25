Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854A2C4604
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 17:54:59 +0100 (CET)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khy4I-00007y-Ko
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 11:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1khy36-00087O-18
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:53:44 -0500
Received: from mga11.intel.com ([192.55.52.93]:7764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1khy33-0001WJ-2I
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:53:43 -0500
IronPort-SDR: l5eryvrF8NGyWsC8CK3ealxYRzGv2+rFr8tyNC9mB31KNwyv8yVE597vTeaOojkShDuDz1Yzwu
 qXmeUKjyhd8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="168655832"
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; d="scan'208";a="168655832"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 08:53:36 -0800
IronPort-SDR: djwmSpV/Cql2xvEMW4GRKjsTDKxjUQcPLg6sXWQmZSuwIlKnBKouWvYpmjUMFGJyC6ao+mI3P2
 6+DyrGWVl23w==
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; d="scan'208";a="547359033"
Received: from jsyrstad-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.133.29])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 08:53:34 -0800
Date: Wed, 25 Nov 2020 08:53:33 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 18/25] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20201125165333.zn5tpwfjnwmjmcdu@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-19-ben.widawsky@intel.com>
 <b2d95e72-51d9-72d2-b340-aefb00928a76@redhat.com>
 <87d00hk89c.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d00hk89c.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-13 08:47:59, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
> > On 11/10/20 11:47 PM, Ben Widawsky wrote:
> >> A CXL memory device (AKA Type 3) is a CXL component that contains some
> >> combination of volatile and persistent memory. It also implements the
> >> previously defined mailbox interface as well as the memory device
> >> firmware interface.
> >> 
> >> The following example will create a 256M device in a 512M window:
> >> 
> >> -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> >> -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
> >> 
> >> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> >> ---
> >
> >> +++ b/qapi/machine.json
> >> @@ -1394,6 +1394,7 @@
> >>  { 'union': 'MemoryDeviceInfo',
> >>    'data': { 'dimm': 'PCDIMMDeviceInfo',
> >>              'nvdimm': 'PCDIMMDeviceInfo',
> >> +            'cxl': 'PCDIMMDeviceInfo',
> >>              'virtio-pmem': 'VirtioPMEMDeviceInfo',
> >>              'virtio-mem': 'VirtioMEMDeviceInfo'
> >>            }
> >
> > Missing documentation of the new data type, and the fact that it will be
> > introduced in 6.0.
> 
> Old wish list item: improve the QAPI schema frontend to flag this.
> 

"Introduced in 6.0" - quite the optimist. Kidding aside, this is the area where
I could use some feedback. CXL Type 3 memory devices can contain both volatile
and persistent memory at the same time. As such, I think I'll need a new type to
represent that, but I'd love to know how best to accomplish that.

> >                     Also, Markus has been trying to get rid of so-called
> > "simple unions" in favor of "flat unions" - every time we modify an
> > existing simple union, it is worth asking if it is time to first flatten
> > this.
> 
> 0. Simple unions can be transformed into flat unions.  The
> transformation can either preserve the nested wire format, or flatten
> it.  See docs/devel/qapi-code-gen.txt "A simple union can always be
> re-written as a flat union ..."
> 
> 1. No new simple unions.
> 
> 2. Existing simple unions that can be flattened without breaking
> backward compatibility have long been flattened.
> 
> 3. The remaining simple unions are part of QMP, where we need to
> preserve the wire format.  We could turn them into flat union preserving
> the wire format.  Only worthwhile if we kill simple unions and simplify
> scripts/qapi/.  Opportunity to make the flat union syntax less
> cumbersome.  Not done due to lack of time.
> 
> 4. Kevin and I have been experimenting with ways to provide both flat
> and nested wire format.  This would pave the way for orderly deprecation
> of the nested wire format.  May not be practical for QMP output.
> 

So is there anything for me to do here?

