Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDC54E55D3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 16:59:03 +0100 (CET)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3O2-0002MR-6X
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 11:59:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nX3Mr-0001fP-SI
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:57:49 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nX3Mo-0004hs-NJ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:57:49 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KNtH51cCDz67MK3;
 Wed, 23 Mar 2022 23:55:29 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 23 Mar 2022 16:57:43 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 23 Mar
 2022 15:57:42 +0000
Date: Wed, 23 Mar 2022 15:57:41 +0000
To: Alison Schofield <alison.schofield@intel.com>
CC: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, Alex =?ISO-8859-1?Q?Benn?=
 =?ISO-8859-1?Q?=E9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=
 =?ISO-8859-1?Q?aud=E9?= <f4bug@amsat.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, 
 Chris Browy <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, 
 Dan Williams <dan.j.williams@intel.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v8 19/46] hw/cxl/device: Add some trivial commands
Message-ID: <20220323155741.00005f1e@huawei.com>
In-Reply-To: <20220318165622.GA1119244@alison-desk>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-20-Jonathan.Cameron@huawei.com>
 <20220318165622.GA1119244@alison-desk>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 18 Mar 2022 09:56:22 -0700
Alison Schofield <alison.schofield@intel.com> wrote:

> On Fri, Mar 18, 2022 at 03:06:08PM +0000, Jonathan Cameron wrote:
> > From: Ben Widawsky <ben.widawsky@intel.com>
> > 
> > GET_FW_INFO and GET_PARTITION_INFO, for this emulation, is equivalent to
> > info already returned in the IDENTIFY command. To have a more robust
> > implementation, add those.
> > 
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-mailbox-utils.c | 69 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >   
> 
> snip
> 
> >  
> > +static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
> > +                                           CXLDeviceState *cxl_dstate,
> > +                                           uint16_t *len)
> > +{
> > +    struct {
> > +        uint64_t active_vmem;
> > +        uint64_t active_pmem;
> > +        uint64_t next_vmem;
> > +        uint64_t next_pmem;
> > +    } QEMU_PACKED *part_info = (void *)cmd->payload;
> > +    QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
> > +    uint64_t size = cxl_dstate->pmem_size;
> > +
> > +    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> > +        return CXL_MBOX_INTERNAL_ERROR;
> > +    }
> > +
> > +    /* PMEM only */
> > +    part_info->active_vmem = 0;
> > +    part_info->next_vmem = 0;
> > +    part_info->active_pmem = size / (256 << 20);
> > +    part_info->next_pmem = part_info->active_pmem;  
> 
> Setting next like this is logical, but it's not per the CXL spec:
> 
> 8.2.9.5.2.1
> "Next Persistent Capacity: If non-zero, this value shall become the
> Active Persistent Capacity on the next cold reset. If both this field and the
> Next Volatile Capacity field are zero, there is no pending change to the
> partitioning."
> 
> next_(vmem|pmem) should start as zero and only change as the result
> of a successful set_partition_info command.

Ah.  Good point and now fixed up.

> 
> From your cover letter:
> * Volatile memory devices (easy but it's more code so left for now).
> Wondering if this is something I could do, and follow that with
> set_partition support. Does that sound reasonable?

Sure, that would be great.

It raises an interesting question for what the volatile / non volatile
backend will look like.  So what is the command line?

So far I'd been assuming we'd do it as separate memdev devices
for volatile from those for non volatile because chances are
someone testing would back the volatile with RAM the non volatile with
a file.  If we enable the partitioning control that approach won't
make much sense.  Various options come to mind.
1) Just back with one memdev and present that as persistent or not
   but actually always have it persistent under the hood.
2) Allow backing with 2 memdevs and don't support the set_partition
   command. Lazy approach I was planing on doing eventualy.
3) Support 3 memdevs.  The middle one of which is the part we
   allow to be repartitioned if it is provided

Also, to actually enable this we'd probably want more HDM decoders
than currently supported and flags for CFMWS which aren't there
yet (Ben asked for them but I've left it for a future patch set).

Lots still to do once the initial patch set is moving forwards.
I don't mind queuing stuff up it gitlab though and then we can
send suitable series to the list once the earlier part has been
applied.  In the meantime we would have a moderately stable
based to build on top of.

Thanks,

Jonathan



 
> 
> Alison
> 
> > +
> > +    *len = sizeof(*part_info);
> > +    return CXL_MBOX_SUCCESS;
> > +}
> > +  
> 
> snip
> 
> 


