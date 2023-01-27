Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4667EC41
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSKg-0002TH-BX; Fri, 27 Jan 2023 12:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pLSKe-0002T6-4n
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:16:08 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pLSKY-0004YK-HN
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:16:07 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P3PMr3tQnz686w8;
 Sat, 28 Jan 2023 01:15:04 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 17:15:53 +0000
Date: Fri, 27 Jan 2023 17:15:53 +0000
To: Fan Ni <fan.ni@samsung.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Michael Tsirkin
 <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, "alison.schofield@intel.com"
 <alison.schofield@intel.com>
Subject: Re: [PATCH 2/2] hw/pxb-cxl: Support passthrough HDM Decoders unless
 overridden
Message-ID: <20230127171553.00001bfb@Huawei.com>
In-Reply-To: <20230127170210.GA211474@bgt-140510-bm03>
References: <20230125152703.9928-1-Jonathan.Cameron@huawei.com>
 <20230125152703.9928-3-Jonathan.Cameron@huawei.com>
 <CGME20230126215736uscas1p2166334bf8185239cf6ac70053dc386c5@uscas1p2.samsung.com>
 <20230126215727.GA203951@bgt-140510-bm03>
 <20230127100149.0000563e@Huawei.com>
 <20230127170210.GA211474@bgt-140510-bm03>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 27 Jan 2023 17:02:36 +0000
Fan Ni <fan.ni@samsung.com> wrote:

> On Fri, Jan 27, 2023 at 10:01:49AM +0000, Jonathan Cameron wrote:
> 
> > On Thu, 26 Jan 2023 21:57:35 +0000
> > Fan Ni <fan.ni@samsung.com> wrote:
> >   
> > > On Wed, Jan 25, 2023 at 03:27:03PM +0000, Jonathan Cameron wrote:
> > >   
> > > > The CXL r3.0 specification allows for there to be no HDM decoders on CXL
> > > > Host Bridges if they have only a single root port. Instead, all accesses
> > > > directed to the host bridge (as specified in CXL Fixed Memory Windows)
> > > > are assumed to be routed to the single root port.
> > > > 
> > > > Linux currently assumes this implementation choice. So to simplify testing,
> > > > make QEMU emulation also default to no HDM decoders under these particular
> > > > circumstances, but provide a hdm_for_passthrough boolean option to have
> > > > HDM decoders as previously.
> > > > 
> > > > Technically this is breaking backwards compatibility, but given the only
> > > > known software stack used with the QEMU emulation is the Linux kernel
> > > > and this configuration did not work before this change, there are
> > > > unlikely to be any complaints that it now works. The option is retained
> > > > to allow testing of software that does allow for these HDM decoders to exist,
> > > > once someone writes it.
> > > > 
> > > > Reported-by: Fan Ni <fan.ni@samsung.com>
> > > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> >   
> > > >      pxb_dev_realize_common(dev, CXL, errp);
> > > > -    pxb_dev_reset(DEVICE(dev));
> > > > +    pxb_cxl_dev_reset(DEVICE(dev));
> > > >  }
> > > >  
> > > > +static Property pxb_cxl_dev_properties[] = {
> > > > +    /* Note: 0 is not a legal PXB bus number. */
> > > > +    DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
> > > > +    DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
> > > > +    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
> > > > +    DEFINE_PROP_BOOL("hdm_for_passthrough", PXBDev, hdm_for_passthrough, false),    
> > > when setting hdm_for_passthrough to true at the qemu command line, we
> > > will see the segfault issue as before. I think this is expected as it
> > > is the logic in cxl_cfmws_find_device. Wondering if there will be
> > > following fixes to handle the case when hdm_for_passthrough is true.  
> > 
> > Absolutely, I'd expect a kernel fix for that case, but it's probably not
> > high priority for anyone given we don't yet have any hardware that does that
> > (as far as I know anyway!)
> > 
> > I wanted to keep the control here to make that easy to test when we do
> > have the fix in place.
> > Jonathan  
> Make sense!
> 
> Reviwed-by: Fan Ni <fan.ni@samsung.com>
> Tested-by: Fan Ni <fan.ni@samsung.com>

Thanks!

Typo in Reviewed-by If this version gets picked up hopefully Michael can
fix whilst applying. If I do a v2 for other feedback I'll fix it.

Jonathan

