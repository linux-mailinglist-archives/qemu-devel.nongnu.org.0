Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234E6ABAAC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:04:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7ho-0005nT-IR; Mon, 06 Mar 2023 05:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pZ7hW-0005mV-9X
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:04:14 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pZ7hT-0008Rr-9H
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:04:14 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PVZ0j3vHPz6J6KM;
 Mon,  6 Mar 2023 18:03:49 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 6 Mar
 2023 10:03:52 +0000
Date: Mon, 6 Mar 2023 10:03:52 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>, Michael Roth
 <michael.roth@amd.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>, Markus Armbruster
 <armbru@redhat.com>, "Daniel P . =?ISO-8859-1?Q?Berrang=E9?="
 <berrange@redhat.com>, Eric Blake <eblake@redhat.com>, Mike Maslenkin
 <mike.maslenkin@gmail.com>, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 6/6] hw/cxl: Add clear poison mailbox command support.
Message-ID: <20230306100352.00004a51@Huawei.com>
In-Reply-To: <6402e9787cad0_606a629499@iweiny-mobl.notmuch>
References: <20230303150908.27889-1-Jonathan.Cameron@huawei.com>
 <20230303150908.27889-7-Jonathan.Cameron@huawei.com>
 <6402e9787cad0_606a629499@iweiny-mobl.notmuch>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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

On Fri, 3 Mar 2023 22:47:20 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> Jonathan Cameron wrote:
> > Current implementation is very simple so many of the corner
> > cases do not exist (e.g. fragmenting larger poison list entries)  
> 
> One coding style change at the bottom and I'm still hung up on that loop
> logic...
> 
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> > v4:
> > - Fix off by one on check of edge of vmr (cut and paste from similar
> >   but long fixed in the volatile memory series)
> > - Drop unnecessary overflow check.
> > - Ensure that even in case of overflow we still delete the element
> >   replaced (in the hole punching case)
> > ---
> >  hw/cxl/cxl-mailbox-utils.c  | 77 +++++++++++++++++++++++++++++++++++++
> >  hw/mem/cxl_type3.c          | 36 +++++++++++++++++
> >  include/hw/cxl/cxl_device.h |  1 +
> >  3 files changed, 114 insertions(+)
> > 
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > index 64a3f3c1bf..0b30307fa3 100644
> > --- a/hw/cxl/cxl-mailbox-utils.c
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -65,6 +65,7 @@ enum {
> >      MEDIA_AND_POISON = 0x43,
> >          #define GET_POISON_LIST        0x0
> >          #define INJECT_POISON          0x1
> > +        #define CLEAR_POISON           0x2
> >  };
> >  
> >  /* 8.2.8.4.5.1 Command Return Codes */
> > @@ -511,6 +512,80 @@ static CXLRetCode cmd_media_inject_poison(struct cxl_cmd *cmd,
> >      return CXL_MBOX_SUCCESS;
> >  }
> >  
> > +static CXLRetCode cmd_media_clear_poison(struct cxl_cmd *cmd,
> > +                                         CXLDeviceState *cxl_dstate,
> > +                                         uint16_t *len)
> > +{
> > +    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
> > +    CXLPoisonList *poison_list = &ct3d->poison_list;
> > +    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
> > +    struct clear_poison_pl {
> > +        uint64_t dpa;
> > +        uint8_t data[64];
> > +    };
> > +    CXLPoison *ent;
> > +    uint64_t dpa;
> > +
> > +    struct clear_poison_pl *in = (void *)cmd->payload;
> > +
> > +    dpa = ldq_le_p(&in->dpa);
> > +    if (dpa + 64 > cxl_dstate->mem_size) {
> > +        return CXL_MBOX_INVALID_PA;
> > +    }
> > +
> > +    /* Always exit loop on entry removal so no need for safe variant */  
> 
> Commenting this is nice but I don't think it is needed.
> 
> > +    QLIST_FOREACH(ent, poison_list, node) {
> > +        /*
> > +         * Test for contained in entry. Simpler than general case
> > +         * as clearing 64 bytes and entries 64 byte aligned
> > +         */
> > +        if ((dpa < ent->start) || (dpa >= ent->start + ent->length)) {
> > +            continue;
> > +        }
> > +        /* Do accounting early as we know one will go away */
> > +        ct3d->poison_list_cnt--;  
> 
> Sorry to get so hung up on this but while I think this code now works I
> still think it is odd and will be an issue to maintain.
> 
> FWIW I don't think we have to keep 'ent' in the list here...
> 
> > +        if (dpa > ent->start) {
> > +            CXLPoison *frag;
> > +            /* Cannot overflow as replacing existing entry */
> > +
> > +            frag = g_new0(CXLPoison, 1);
> > +
> > +            frag->start = ent->start;
> > +            frag->length = dpa - ent->start;
> > +            frag->type = ent->type;
> > +
> > +            QLIST_INSERT_HEAD(poison_list, frag, node);
> > +            ct3d->poison_list_cnt++;
> > +        }
> > +        if (dpa + 64 < ent->start + ent->length) {
> > +            CXLPoison *frag;
> > +
> > +            if (ct3d->poison_list_cnt == CXL_POISON_LIST_LIMIT) {
> > +                cxl_set_poison_list_overflowed(ct3d);
> > +            } else {
> > +                frag = g_new0(CXLPoison, 1);
> > +
> > +                frag->start = dpa + 64;
> > +                frag->length = ent->start + ent->length - frag->start;
> > +                frag->type = ent->type;
> > +                QLIST_INSERT_HEAD(poison_list, frag, node);
> > +                ct3d->poison_list_cnt++;
> > +            }
> > +        }
> > +        /* Any fragments have been added, free original entry */
> > +        QLIST_REMOVE(ent, node);
> > +        g_free(ent);
> > +        break;
> > +    }  
> 
> Why not this?

Fair enough.  I think this is a case of code evolving to a state
that is non optimal in the end so I'll refactor it to something like
you have suggested.

I think we caan simplify it further by dragging the cacheline clear
up to before the list manipulation.

> 
> ...
>     CXLPoison *ent, found = NULL;
> 
> ...
>     QLIST_FOREACH(ent, poison_list, node) {
>         /*
>          * Test for contained in entry. Simpler than general case
>          * as clearing 64 bytes and entries are 64 byte aligned
>          */
>         if ((dpa >= ent->start) && (dpa < ent->start + ent->length)) {
>             found = ent;
> 	    break;
>         }
>     }
> 
>     /*
>      * Do we even need 'found'?  Or is ent null if not found?
>      * I'm not sure how QLIST's work.
>      */
>     if (found) {
>         CXLPoison *frag;
> 
>         QLIST_REMOVE(found, node);
>         ct3d->poison_list_cnt--;
> 
> 	/* If not clearing the start, create new beginning of range */
>         if (dpa > found->start) {
>             frag = g_new0(CXLPoison, 1);
>             frag->start = found->start;
>             frag->length = dpa - found->start;
>             frag->type = found->type;
>             QLIST_INSERT_HEAD(poison_list, frag, node);
>             ct3d->poison_list_cnt++;
> 	}
> 
> 	/* If needed, and space available, create new end of range */
>         if (dpa + 64 < found->start + found->length) {
>             if (ct3d->poison_list_cnt == CXL_POISON_LIST_LIMIT) {
>                 cxl_set_poison_list_overflowed(ct3d);
>             } else {
>                 frag = g_new0(CXLPoison, 1);
> 
>                 frag->start = dpa + 64;
>                 frag->length = found->start + found->length - frag->start;
>                 frag->type = found->type;
>                 QLIST_INSERT_HEAD(poison_list, frag, node);
>                 ct3d->poison_list_cnt++;
>             }
>         }
>         g_free(found);
>     }
> ...
> 
> > +    /* Clearing a region with no poison is not an error so always do so */
> > +    if (cvc->set_cacheline)  
> 
> For QEMU coding style you still need '{' '}'.
Gah.
> 
> Ira

Thanks,

Jonathan



