Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606654DD7B7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 11:10:59 +0100 (CET)
Received: from localhost ([::1]:51720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV9ZS-0001TE-0o
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 06:10:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nV9Xc-0000hY-T7
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 06:09:04 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nV9Xa-0001hb-B7
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 06:09:04 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KKfpQ2ZRLz686k0;
 Fri, 18 Mar 2022 18:07:58 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 18 Mar 2022 11:08:51 +0100
Received: from localhost (10.47.70.82) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 18 Mar
 2022 10:08:50 +0000
Date: Fri, 18 Mar 2022 10:08:46 +0000
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: Peter Maydell <peter.maydell@linaro.org>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
 Samarth Saxena <samarths@cadence.com>, Chris Browy <cbrowy@avery-design.com>, 
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 <qemu-devel@nongnu.org>, <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>, David
 Hildenbrand <david@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, "Shameerali Kolothum Thodi"
 <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 00/46] CXl 2.0 emulation Support
Message-ID: <20220318100846.000033a8@Huawei.com>
In-Reply-To: <d710c6e1-a9b7-ed0d-ca23-c4315355268c@ilande.co.uk>
References: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
 <20220306163119-mutt-send-email-mst@kernel.org>
 <20220307093918.00002f20@Huawei.com> <YihiHNxVjDFI0Z8r@xz-m1.local>
 <20220309112827.00002c73@Huawei.com> <Yimwjtd8SsVLOU5e@xz-m1.local>
 <20220316165034.000037e7@Huawei.com>
 <1efbfeeb-2598-57c5-2e2d-4f5fa2538aa7@ilande.co.uk>
 <20220316175846.00007463@Huawei.com>
 <20220316182618.00003ce5@Huawei.com>
 <31f383e6-01bb-cf9a-6af8-d0f1821b3fd1@ilande.co.uk>
 <20220317164723.00001c14@huawei.com>
 <d710c6e1-a9b7-ed0d-ca23-c4315355268c@ilande.co.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.70.82]
X-ClientProxiedBy: lhreml726-chm.china.huawei.com (10.201.108.77) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Fri, 18 Mar 2022 08:14:58 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:

> On 17/03/2022 16:47, Jonathan Cameron via wrote:
> 
> >> Ah great! As you've already noticed my particular case was performing partial
> >> decoding on a memory region, but there are no issues if you need to dispatch to
> >> another existing address space such as PCI/IOMMU. Creating a separate address space
> >> per device shouldn't be an issue either, as that's effectively how the PCI bus master
> >> requests are handled.
> >>
> >> The address spaces are visible in "info mtree" so if you haven't already, I would
> >> recommend generating a dynamic name for the address space based upon the device
> >> name/address to make it easier for development and debugging.  
> > info mtree already provides the following with a static name
> > address-space: cxl-type3-dpa-space
> >    0000000000000000-000000000fffffff (prio 0, nv-ram): cxl-mem2
> > 
> > So the device association is there anyway.  Hence I'm not sure a dynamic name adds
> > a lot on this occasion and code is simpler without making it dynamic.  
> 
> Is this using a single address space for multiple memory devices, or one per device 
> as you were suggesting in the thread? If it is one per device and cxl-mem2 is the 
> value of the -device id parameter, I still think it is worth adding the same device 
> id into the address space name for the sake of a g_strdup_printf() and corresponding 
> g_free().

One per device.  Ultimately when I add volatile memory support we'll end up with possibly
having to add an mr as a container for the two hostmem mr.   Looking again, the name
above is actually the id of the mr, not the type3 device. Probably better to optionally
use the type3 device name if available.

I'll make the name something like cxl-type3-dpa-space-cxl-pmem3 if id available
and fall back to cxl-type3-dpa-space as before if not.

> 
> Alas I don't currently have the time (and enough knowledge of CXL!) to do a more 
> comprehensive review of the patches, but a quick skim of the series suggests it seems 
> quite mature. The only thing that I noticed was that there doesn't seem to be any 
> trace-events added, which I think may be useful to aid driver developers if they need 
> to debug some of the memory access routing.

Good suggestion.  I'm inclined to add them in a follow up patch though because
this patch set is already somewhat unmanageable from point of view of review.
I already have a number of other patches queued up for a second series adding
more functionality.

> 
> Finally I should point out that there are a number of more experienced PCI developers 
> on the CC list than me, and they should have the final say on patch review. So please 
> consider these comments as recommendations based upon my development work on QEMU, 
> and not as a NAK for proceeding with the series :)

No problem and thanks for your help as (I think) you've solved the biggest open issue :)

Jonathan

> 
> 
> ATB,
> 
> Mark.


