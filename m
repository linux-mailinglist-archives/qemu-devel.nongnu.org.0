Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E588D5FDEC5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:17:24 +0200 (CEST)
Received: from localhost ([::1]:35670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1pk-0007H4-1l
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oj1mR-0004yr-1T
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:13:59 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oj1mM-00052B-Vk
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:13:58 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MpGKR538vz67GTC;
 Fri, 14 Oct 2022 01:12:11 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 19:13:47 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 13 Oct
 2022 18:13:46 +0100
Date: Thu, 13 Oct 2022 18:13:45 +0100
To: Gregory Price <gregory.price@memverge.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, Huai-Cheng Kuo
 <hchkuo@avery-design.com.tw>, Chris Browy <cbrowy@avery-design.com>,
 <ira.weiny@intel.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v8 4/5] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
Message-ID: <20221013181345.0000630a@huawei.com>
In-Reply-To: <Y0g8UgumJwqU4QyB@memverge.com>
References: <20221013120009.15541-1-Jonathan.Cameron@huawei.com>
 <20221013120009.15541-5-Jonathan.Cameron@huawei.com>
 <Y0g8UgumJwqU4QyB@memverge.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 13 Oct 2022 12:26:58 -0400
Gregory Price <gregory.price@memverge.com> wrote:

> Other than the nitpicks below, lgtm.  Not sure if you need a sign off
> from me given the contributions:
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> 
> > +/* If no cdat_table == NULL returns number of entries */
> > +static int ct3_build_cdat_entries_for_mr(CDATSubHeader **cdat_table,
> > +                                         int dsmad_handle, MemoryRegion *mr)
> > +{
> > +    enum {
> > +        DSMAS,
> > +        DSLBIS0,
> > +        DSLBIS1,
> > +        DSLBIS2,
> > +        DSLBIS3,
> > +        DSEMTS,
> > +        NUM_ENTRIES
> > +    };  
> // ...
> > +    if (!cdat_table) {
> > +        return NUM_ENTRIES;
> > +    }  
> 
> the only thing that i would recommend is making this enum global (maybe
> renaming them CT3_CDAT_[ENTRY_NAME]) and using CT3_CDAT_NUM_ENTRIES
> directly in the function that allocates the cdat buffer itself. I do
> understand the want to keep the enum and the code creating the entries
> co-located though, so i'm just nitpicking here i guess.
> 
> Generally I dislike the pattern of passing a NULL into a function to get
> configuration data, and then calling that function again.  This function
> wants to be named...
> 
> ct3_build_cdat_entries_for_mr_or_get_table_size_if_cdat_is_null(...)
> 

I agree it's a messy pattern, but as things become dynamic I'd expect
we'll have a bunch of checks that really need to be in that function
and would be replicated at the caller to calculate the size of the array.

I'm expecting this code to get more complex over time.

For example adding memory-side cache support based on commandline parameters.
Once we do that, the enum will almost certainly no longer be global as we'll have
a bunch of other entries (potentially different numbers for each region).
Whether that is done with calls to a separate function, or by changing this
one isn't clear to me yet.


> to accurately describe what it does.  Just kinda feels like an extra
> function call for no reason.
> 
> But either way, it works, this is just a nitpick on my side.


> 
> > +static int ct3_build_cdat_table(CDATSubHeader ***cdat_table, void *priv)
> > +{
> > +    g_autofree CDATSubHeader **table = NULL;
> > +    CXLType3Dev *ct3d = priv;
> > +    MemoryRegion *volatile_mr;
> > +    /* ... snip ... */
> > +}  
> 
> s/volatile/nonvolatile

Doh. I'll update the gitlab tree in a minute for this, but leave sending
out the updated version for a few days to let others take a look if they wish.

In meantime, regression in mainline kernel against CXL qemu emulation.
Bisection with 8 steps to go. *sigh*

Jonathan



