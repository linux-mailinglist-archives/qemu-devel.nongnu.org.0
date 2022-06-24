Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B2559CB6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:59:59 +0200 (CEST)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kmt-0004sE-0A
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4khr-0007vw-UZ; Fri, 24 Jun 2022 10:54:47 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4kho-0000yi-VT; Fri, 24 Jun 2022 10:54:47 -0400
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LV0Tc3sHVz67qfF;
 Fri, 24 Jun 2022 22:52:36 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 24 Jun 2022 16:54:41 +0200
Received: from localhost (10.81.207.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 15:54:40 +0100
Date: Fri, 24 Jun 2022 15:54:36 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, <qemu-arm@nongnu.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
Message-ID: <20220624155436.000047cb@Huawei.com>
In-Reply-To: <20220624150844.000005ec@Huawei.com>
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-2-Jonathan.Cameron@huawei.com>
 <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
 <20220624133909.00005f6e@Huawei.com>
 <CAFEAcA8GA+ZXr2eS9bVxnhZRtda17Wx0Ud8CfcA90T6yiaecew@mail.gmail.com>
 <20220624150844.000005ec@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.131]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 24 Jun 2022 15:08:44 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Fri, 24 Jun 2022 13:56:32 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Fri, 24 Jun 2022 at 13:39, Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> wrote:  
> > >
> > > On Fri, 24 Jun 2022 11:48:47 +0100
> > > Peter Maydell <peter.maydell@linaro.org> wrote:    
> > > >
> > > > This seems to be missing code to advertise the new devices in the
> > > > device tree.    
> > >
> > > Intentionally. I am not aware of any current interest
> > > in defining DT support CXL or supporting it in operating systems.
> > > Easy enough to add if anyone does the leg work to figure out the
> > > bindings, but that needs to come from someone who cares and
> > > would need to be driven by OS support and a usecase. The ACPI
> > > stuff here is defined as part of the main CXL spec because the
> > > target class of machines simply doesn't generally use DT.    
> > 
> > I don't really want new devices in the virt board that aren't
> > usable in the common use case of "just pass a kernel with -kernel"...
> > 
> > -- PMM  
> 
> Ok.  In that case, what do you suggest?  
> 
> Options I can think of:
> 
> 1) I can come up with plausible DT bindings, but I'm not sure how
> that will be received by the kernel community, It will add a bunch of
> infrastructure to maintain that may be seen as useless at least in
> the short to medium term. Hence is not in anyone's test matrices etc.

Just occurred to me there is another barrier to an approach that adds
DT bindings.
I fairly sure hw/pci-bridge/pci_expander_bridge.c (PXB)
only works on ACPI platforms and is the only host bridge supported
for CXL emulation in QEMU.

> 
> Dan, how open would you be to adding DT support? We'd have to ignore
> some of the firmware query stuff like QTGs as there isn't an equivalent
> in DT - or we'd have to go as far as defining actual devices with
> mailboxes to query that info.
> 
> 2) Add it to something like the SBSA machine, but that brings a large
> burden in firmware etc and need to communicate everything via DT to
> EDK2 that is needed to build the ACPI tables in a flexible fashion +
> mass of EDK2 development.  Whilst the SBSA model is great for ARM
> specific stuff, requiring the large additional complexity in
> actually using it to test arch independent software is probably
> going to just mean it bit rots.
> 
> 3) Fork virt (obviously sharing as much as possible), potentially I
> guess that could be pretty light weight by declaring a new
> TypeInfo that is very nearly identical to virt with just the few extra
> calls inserted. 
> 
> Any other routes open to me to getting this support available?
> 
> Jonathan
> 
> 


