Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3982C345C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 00:10:57 +0100 (CET)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khhSa-0001dr-En
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 18:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1khhRK-0001B4-1z
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 18:09:38 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:54236
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1khhRI-0001Jf-C6
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 18:09:37 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id D8BEA122C6A; Tue, 24 Nov 2020 15:09:33 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 465A7122C3F;
 Tue, 24 Nov 2020 15:09:30 -0800 (PST)
Date: Tue, 24 Nov 2020 15:09:28 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 03/25] hw/cxl/component: Introduce CXL components
 (8.1.x, 8.2.5)
Message-ID: <20201124230928.zf6uli3dl7levn72@mail.bwidawsk.net>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-4-ben.widawsky@intel.com>
 <20201116120352.00004f25@Huawei.com>
 <20201116191936.nhchktyrnc5ijoue@intel.com>
 <20201117122940.00002902@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117122940.00002902@Huawei.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-17 12:29:40, Jonathan Cameron wrote:

[snip]

> > >   
> > > > +
> > > > +/* 8.2.5.10 - CXL Security Capability Structure */
> > > > +#define CXL_SEC_REGISTERS_OFFSET (CXL_RAS_REGISTERS_OFFSET + CXL_RAS_REGISTERS_SIZE)
> > > > +#define CXL_SEC_REGISTERS_SIZE   0 /* We don't implement 1.1 downstream ports */
> > > > +
> > > > +/* 8.2.5.11 - CXL Link Capability Structure */
> > > > +#define CXL_LINK_REGISTERS_OFFSET (CXL_SEC_REGISTERS_OFFSET + CXL_SEC_REGISTERS_SIZE)
> > > > +#define CXL_LINK_REGISTERS_SIZE   0x38  
> > > 
> > > Bit odd to introduce this but not define anything... Can't we bring these
> > > in when we need them later?  
> > 
> > Repeating my comment from 00/25...
> > 
> > For this specific patch series I liked providing #defines in bulk so that it's
> > easy enough to just bring up the spec and review them. Not sure if there is a
> > preference from others in the community on this.
> 
> Personally I'd prefer to see the lot if you are going to do that, on basis
> should only need reviewing against the spec once.
> Not sure others will agree though as "the lot" is an awful lot.
> 

I took a shot at stripping some of this out, but it turns out I already use all
of it for the cxl-component-utils. While some of them aren't directly used, the
space reservations for the various caps make sense here IMO.

So for v2, I'm going to leave this as is, and if there is a desire to do things
differently, I think I'd need a suggestion of how to do so.

[snip]


> 
> Thanks,
> 
> Jonathan
> 

