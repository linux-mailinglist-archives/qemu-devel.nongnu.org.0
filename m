Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C756EE6EE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:38:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMbW-0001Fz-Ly; Tue, 25 Apr 2023 13:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1prMbT-0000za-Il; Tue, 25 Apr 2023 13:37:23 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1prMbQ-0005no-0S; Tue, 25 Apr 2023 13:37:23 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q5Tb34lQJz67Pmj;
 Wed, 26 Apr 2023 01:32:15 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 25 Apr
 2023 18:37:14 +0100
Date: Tue, 25 Apr 2023 18:37:13 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 <qemu-arm@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <linuxarm@huawei.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI
 eXpander Bridges
Message-ID: <20230425183713.000054c3@huawei.com>
In-Reply-To: <CAFEAcA8QXcpkxdXMWP8X9tLem6K8qC3CwZ2-t-fqEpGR-nJBTg@mail.gmail.com>
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
 <20230424164058.00000a3d@Huawei.com>
 <CAFEAcA_2JP=cM-SCGVhnhnP_6zYr748=A=G=Sh+BH+gkFmwnZA@mail.gmail.com>
 <20230424225626.00001219@huawei.com>
 <CAFEAcA8QXcpkxdXMWP8X9tLem6K8qC3CwZ2-t-fqEpGR-nJBTg@mail.gmail.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Apr 2023 09:28:44 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 24 Apr 2023 at 22:56, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Mon, 24 Apr 2023 16:45:48 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
> > > On the other hand, having QEMU enumerate PCI devices is *also* a
> > > very different model from today, where we assume that the guest
> > > code is the one that is going to deal with enumerating PCI devices.
> > > To my mind one of the major advantages of PCI is exactly that it
> > > is entirely probeable and discoverable, so that there is no need
> > > for the dtb to include a lot of information that the kernel can
> > > find out for itself by directly asking the hardware...  
> >
> > I absolutely agree that QEMU enumerating PCI seem silly level of complexity
> > to introduce. So easy route is to just use the bus numbers to partition
> > resources. We have those available without any complexity. It's not the
> > same as how it's done with ACPI, but then the alternatives are either
> > (though maybe they are closer).  Note current proposed algorithm may be
> > too simplistic (perhaps some alignment forcing should adjust the division
> > of the resources to start on round number addresses)  
> 
> I think we definitely need to talk about this later this week,
> but my initial view is that if:
>  (1) the guest kernel can get the information it needs to do this
>      by probing the hardware

Not currently (from a quick look) - see below. But we could potentially
make it visible by augmenting the config space of the PCIe devices
that are discoverable.  Or we could in theory ignore the bus numbers
that we do provide as QEMU parameters, but that would be rather
surprising for users.

>  (2) doing it in QEMU gives you "this isn't a great allocation"
>      "we don't really have the info we need to do it optimally"
>      "this is more of a policy decision" effects
>      (which is what it's sounding like to me)
> 
> this is a really strong argument for "guest software should be
> doing this". DTB-booting kernels has always meant the kernel
> doing a lot of work that under ACPI/UEFI/x86-PC is typically
> done by firmware, and this seems similar to me.

We could explore only solving the problem for pxb-cxl for now.
However, we would still be talking infrastructure in kernel only
to support emulated CXL devices and I can see that being
controversial. A normal CXL host bridge is not something
we can enumerate.

I guess this may call for a PoC on the kernel side of things to
see how bad it looks. I suspect very ugly indeed :( but I could
be wrong.

I think we'll also have to augment the PXB PCI devices
that appear on the main bus to provide discoverability they don't
currently have (such as bus numbers)  Probably a DVSEC entry
in PCI extended space.

Current dump of what is there:

root@debian:~# lspci -s 05.0  -xxxx -vvv
00:05.0 Host bridge: Red Hat, Inc. QEMU PCIe Expander bridge
        Subsystem: Red Hat, Inc. QEMU PCIe Expander bridge
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 36 1b 0b 00 00 00 a0 00 00 00 00 06 00 00 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 00 11
30: 00 00 00 00 00 00 00 00 00 00 00 00 ff 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Which is pretty light on info.

Jonathan


> 
> thanks
> -- PMM


