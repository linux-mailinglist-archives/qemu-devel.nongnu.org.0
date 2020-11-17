Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917202B6749
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:26:06 +0100 (CET)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1vp-0001Nw-EO
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kf1uq-0000j8-2w
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:25:04 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kf1uo-0006Az-Aw
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:25:03 -0500
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Cb7T956vPz67F5r;
 Tue, 17 Nov 2020 22:23:09 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 17 Nov 2020 15:24:58 +0100
Received: from localhost (10.47.31.177) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 17 Nov
 2020 14:24:57 +0000
Date: Tue, 17 Nov 2020 14:24:49 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 06/25] hw/cxl/device: Add device status (8.2.8.3)
Message-ID: <20201117142449.00005c95@Huawei.com>
In-Reply-To: <20201116211841.y6ihb7i7ywrwsk2f@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-7-ben.widawsky@intel.com>
 <20201116131608.000052e6@Huawei.com>
 <20201116211841.y6ihb7i7ywrwsk2f@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.31.177]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 07:29:50
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 13:18:41 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> On 20-11-16 13:16:08, Jonathan Cameron wrote:
> > On Tue, 10 Nov 2020 21:47:05 -0800
> > Ben Widawsky <ben.widawsky@intel.com> wrote:
> >   
> > > This implements the CXL device status registers from 8.2.8.3.1 in the
> > > CXL 2.0 specification. It is capability ID 0001h.
> > > 
> > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>  
> > 
> > It does some other stuff it shouldn't as well.  Please tidy that up before
> > v2.  A few other passing comments inline.
> > 
> > Thanks,
> > 
> > Jonathan
> > 
> >   
> > > ---
> > >  hw/cxl/cxl-device-utils.c   | 45 +++++++++++++++++++++++++++++++++-
> > >  include/hw/cxl/cxl_device.h | 49 ++++++++++++-------------------------
> > >  2 files changed, 60 insertions(+), 34 deletions(-)
> > > 
> > > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > > index a391bb15c6..78144e103c 100644
> > > --- a/hw/cxl/cxl-device-utils.c
> > > +++ b/hw/cxl/cxl-device-utils.c
> > > @@ -33,6 +33,42 @@ static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
> > >      return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
> > >  }
> > >  
> > > +static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
> > > +{
> > > +    uint64_t retval = 0;  
> > 
> > Doesn't seem to be used.
> >   
> 
> It's required for ldn_le_p, or did you mean something else?

Nope just failed to notice that use. oops

> 
> > > +  
> > 
> > Perhaps break the alignment check out to a utility function given this sanity check
> > is same as in previous patch.
> >   
> > > +    switch (size) {
> > > +    case 4:
> > > +        if (unlikely(offset & (sizeof(uint32_t) - 1))) {
> > > +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > > +            return 0;
> > > +        }
> > > +        break;
> > > +    case 8:
> > > +        if (unlikely(offset & (sizeof(uint64_t) - 1))) {
> > > +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > > +            return 0;
> > > +        }
> > > +        break;
> > > +    }
> > > +
> > > +    return ldn_le_p(&retval, size);
> > > +}

