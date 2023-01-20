Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0456752E1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 12:00:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIp7q-0002cf-PZ; Fri, 20 Jan 2023 06:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIp7m-0002cW-DS
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:59:58 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIp7j-0006xX-Uk
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:59:58 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NyxHY6vx3z688Kq;
 Fri, 20 Jan 2023 18:55:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 10:59:51 +0000
Date: Fri, 20 Jan 2023 10:59:50 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: Gregory Price <gourry.memverge@gmail.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, Alison Schofield <alison.schofield@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, <a.manzanares@samsung.com>,
 <hchkuo@avery-design.com.tw>, <cbrowy@avery-design.com>,
 <ira.weiny@intel.com>, <dan.j.williams@intel.com>
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20230120105950.00004d27@Huawei.com>
In-Reply-To: <Y8nAlDYxCtC/vINL@memverge.com>
References: <Y6CNcuIzUVmKL0SM@memverge.com>
 <20221219172502.00001338@Huawei.com>
 <Y6CloIiuruB/h7qp@memverge.com>
 <20221220153453.00000436@Huawei.com>
 <Y6IMoxKZOc7eUPCg@memverge.com>
 <20230103155629.00007466@Huawei.com>
 <CAD3UvdQ7nZab7Y+tbc1Ox-zqzse4C16dwv6qtOAgfe4dA6_crQ@mail.gmail.com>
 <20230103181524.00003e14@huawei.com>
 <Y8l6wYKstOB/iBzT@memverge.com>
 <20230119173112.00005acc@Huawei.com>
 <Y8nAlDYxCtC/vINL@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
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

On Thu, 19 Jan 2023 17:13:40 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Thu, Jan 19, 2023 at 05:31:12PM +0000, Jonathan Cameron wrote:
> > On Thu, 19 Jan 2023 12:15:45 -0500
> > Gregory Price <gregory.price@memverge.com> wrote:
> >   
> > > Found a bug, not sure how we missed this, probably happed with rebasing
> > > and some fixups. We're presently reporting the volatile region as
> > > non-volatile, 1 line patch.
> > > 
> > > Jonathan do you want a separate patch shipped or would you rather just
> > > apply a fixup to the commit in your current branch?  
> > I'll fix up as I'd only squash the patch in anyway.
> > 
> > If tomorrow is slightly less crazy busy than today I'll push out a new
> > tree with this and the pass through decoders support RFC
> > (I'll post that to the lists as well)
> > 
> > Jonathan
> >   
> 
> Aye aye! 
> 
> One other change to consider: the .EFI_memory_type_attr right now is set
> to RESERVED.  Should this field actually be EFI_MEMORY_SP? Or is there a
> reason for explicitly Reserved?
> 
> 0: EfiConventionalMemory
> 1: EfiConventionalMemory w/ EFI_MEMORY_SP Attribute
> 2: EfiReservedMemoryType
> 
> I remember reading a while back that the intended marking is
> special-purpose rather than reserved, but i'm hitting my wall on
> knowledge.  
> 
> Dan may know, but I couldn't divine the correct setting from the kernel
> (obviously this is EFI level code, so i didn't expect to).

Yes, would be better to report as EfiConventionalMemory + SP
Shouldn't hugely matter from practical point of view though (I haven't
checked) as both mean driver managed and this is more about
policy than anything else.

> 
> 
> 
> One other thing that I am noticing:  When a CFMW is registered, an
> nvdimm_bridge device becomes present in /sys/bus/cxl/devices -
> regardless of whether the type3 device is persistent or volatile.
> 

That's one for Dan.  Key here is I don't think anyone is claiming the
kernel code yet supports 'hot plug / cold plug' of volatile type 3
devices.  I expect a non trivial amount of work to enable that
simply because it hasn't previously been of interest.

> This makes me believe we aren't setting something up correctly in the
> CDAT or something, but other than the below changes everything else
> looks correct.  This could imply a kernel driver bug, but i've been
> validating against real hardware and this behavior is not seen, even
> with functional CXL memory expander devices (which the BIOS obviously
> has a hand in setting up).
> 
> I started validating the DVSECs, but likewise i didn't see any
> indication of error either.
> 
> 
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 919cdf141e..4daa0cf0f6 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -132,8 +132,9 @@ static int ct3_build_cdat_entries_for_mr(CDATSubHeader **cdat_table,
>              .length = sizeof(*dsemts),
>          },
>          .DSMAS_handle = dsmad_handle,
> -        /* Reserved - the non volatile from DSMAS matters */
> -        .EFI_memory_type_attr = 2,
> +        /* Reserved if NV - the non volatile from DSMAS matters
> +         * otherwise label this EFI_MEMORY_SP (special purpose) */
> +        .EFI_memory_type_attr = is_pmem ? 2 : 1,
>          .DPA_offset = 0,
>          .DPA_length = int128_get64(mr->size),
>      };
> @@ -187,7 +188,7 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table, void *priv)
>      /* Now fill them in */
>      if (volatile_mr) {
>          rc = ct3_build_cdat_entries_for_mr(table, dsmad_handle++, volatile_mr,
> -                                           true, 0);
> +                                           false, 0);
>          if (rc < 0) {
>              return rc;
>          }


