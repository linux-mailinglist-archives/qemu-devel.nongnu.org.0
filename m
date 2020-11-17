Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE22B6744
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:23:31 +0100 (CET)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1tK-000713-Js
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kf1ri-0005jq-6V
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:21:50 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kf1rf-0005B8-JY
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:21:49 -0500
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Cb7PQ1SSCz67Djr;
 Tue, 17 Nov 2020 22:19:54 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 17 Nov 2020 15:21:42 +0100
Received: from localhost (10.47.31.177) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 17 Nov
 2020 14:21:42 +0000
Date: Tue, 17 Nov 2020 14:21:34 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 04/25] hw/cxl/device: Introduce a CXL device (8.2.8)
Message-ID: <20201117142134.0000642c@Huawei.com>
In-Reply-To: <20201116211116.s73jj3gyogp5qasf@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-5-ben.widawsky@intel.com>
 <20201116130756.000002a0@Huawei.com>
 <20201116211116.s73jj3gyogp5qasf@intel.com>
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

On Mon, 16 Nov 2020 13:11:16 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> On 20-11-16 13:07:56, Jonathan Cameron wrote:
> > On Tue, 10 Nov 2020 21:47:03 -0800
> > Ben Widawsky <ben.widawsky@intel.com> wrote:
> >   
> > > A CXL device is a type of CXL component. Conceptually, a CXL device
> > > would be a leaf node in a CXL topology. From an emulation perspective,
> > > CXL devices are the most complex and so the actual implementation is
> > > reserved for discrete commits.
> > > 
> > > This new device type is specifically catered towards the eventually
> > > implementation of a Type3 CXL.mem device, 8.2.8.5 in the CXL 2.0
> > > specification.
> > > 
> > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>  
> > 
> > As an RFC, would be good to have questions relavant to individual
> > patches if possible.  Makes it easier to know what you want feedback on.
> > 
> > The REG32 being used for 64 bit registers seems awkward. I'd suggest
> > we either break them up into DW and deal with the edge parts manually.
> > 
> > I'm not sure a REG64 definition would work due to lack of explicit alignment
> > guarantees.  Might be fine though.  
> 
> Agreed, although I think the current frequency with which I've had to do this,
> and the XXX comments are decent, it's definitely a bit ugly. I found at least
> two registers (I don't recall one, but the very important command register was
> the other that you noticed below) which have a field that straddles the 32b
> boundary. I think having to do an upper and lower field for that would kind of
> stink.
> 
> Given that the codebase has gone on long enough without REG64, I didn't want to
> poke that bear, although I had wired it up at some point.
> 
> So for now, I'd like to just leave these as they are.
> 
> > 
> > One buglet inline and a few other comments.
> > 
> > Jonathan  
> 
> Thanks. Anything not responded to is acknowledged and will hopefully make its
> way into v2.
> 

...

> 
> >   
> > > +
> > > +/* 8.2.8.4.5.1 Command Return Codes */
> > > +enum {
> > > +    RET_SUCCESS                 = 0x0,
> > > +    RET_BG_STARTED              = 0x1, /* Background Command Started */
> > > +    RET_EINVAL                  = 0x2, /* Invalid Input */
> > > +    RET_ENOTSUP                 = 0x3, /* Unsupported */
> > > +    RET_ENODEV                  = 0x4, /* Internal Error */  
> > 
> > Mapping that to NODEV seems less than obvious.  
> 
> I tried to be cute and map as many things to errno as possible. Suggestions?

Don't bother being cute? :)
More seriously, I'd carry them as matching the spec out until you actually
have to return a standard error.   Fine to have a conversion function
that does a best possible mapping though so as to keep things consistent
across multiple locations.  Mind you perhaps qemu has a standard idiom for this?

cxl_cmd_ret_to_errno()


> 
> >   
> > > +    RET_ERESTART                = 0x5, /* Retry Required */
> > > +    RET_EBUSY                   = 0x6, /* Busy */
> > > +    RET_MEDIA_DISABLED          = 0x7, /* Media Disabled */
> > > +    RET_FW_EBUSY                = 0x8, /* FW Transfer in Progress */
> > > +    RET_FW_OOO                  = 0x9, /* FW Transfer Out of Order */
> > > +    RET_FW_AUTH                 = 0xa, /* FW Authentication Failed */
> > > +    RET_FW_EBADSLT              = 0xb, /* Invalid Slot */
> > > +    RET_FW_ROLLBACK             = 0xc, /* Activation Failed, FW Rolled Back */
> > > +    RET_FW_REBOOT               = 0xd, /* Activation Failed, Cold Reset Required */
> > > +    RET_ENOENT                  = 0xe, /* Invalid Handle */
> > > +    RET_EFAULT                  = 0xf, /* Invalid Physical Address */
> > > +    RET_POISON_E2BIG            = 0x10, /* Inject Poison Limit Reached */
> > > +    RET_EIO                     = 0x11, /* Permanent Media Failure */
> > > +    RET_ECANCELED               = 0x12, /* Aborted */
> > > +    RET_EACCESS                 = 0x13, /* Invalid Security State */
> > > +    RET_EPERM                   = 0x14, /* Incorrect Passphrase */
> > > +    RET_EPROTONOSUPPORT         = 0x15, /* Unsupported Mailbox */
> > > +    RET_EMSGSIZE                = 0x16, /* Invalid Payload Length */
> > > +    RET_MAX                     = 0x17
> > > +};
> > > +
> > > +/* XXX: actually a 64b register */
> > > +REG32(CXL_DEV_MAILBOX_STS, 0x10)
> > > +    FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)
> > > +    FIELD(CXL_DEV_MAILBOX_STS, ERRNO, 32, 16)
> > > +    FIELD(CXL_DEV_MAILBOX_STS, VENDOR_ERRNO, 48, 16)
> > > +
> > > +/* XXX: actually a 64b register */
> > > +REG32(CXL_DEV_BG_CMD_STS, 0x18)
> > > +    FIELD(CXL_DEV_BG_CMD_STS, BG, 0, 16)
> > > +    FIELD(CXL_DEV_BG_CMD_STS, DONE, 16, 7)
> > > +    FIELD(CXL_DEV_BG_CMD_STS, ERRNO, 32, 16)
> > > +    FIELD(CXL_DEV_BG_CMD_STS, VENDOR_ERRNO, 48, 16)
> > > +
> > > +REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
> > > +
> > > +#endif  
> >   


