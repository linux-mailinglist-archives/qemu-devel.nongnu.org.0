Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694D81268B1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 19:09:05 +0100 (CET)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii0ER-000349-Cu
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 13:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1ii08m-0004uN-W4
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:03:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1ii08l-0005Np-Rn
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:03:12 -0500
Received: from charlie.dont.surf ([128.199.63.193]:60870)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1ii08j-0004wK-Ao; Thu, 19 Dec 2019 13:03:09 -0500
Received: from apples.localdomain (ip-5-186-120-84.cgn.fibianet.dk
 [5.186.120.84])
 by charlie.dont.surf (Postfix) with ESMTPSA id 32871BF506;
 Thu, 19 Dec 2019 18:03:05 +0000 (UTC)
Date: Thu, 19 Dec 2019 19:03:01 +0100
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v4 22/24] nvme: bump controller pci device id
Message-ID: <20191219180301.iook7nrslzopxy2w@apples.localdomain>
References: <20191219130921.309264-1-k.jensen@samsung.com>
 <CGME20191219130949eucas1p172304dc579f8bda43a8febd234064799@eucas1p1.samsung.com>
 <20191219130921.309264-23-k.jensen@samsung.com>
 <20191219161609.GA24055@redsun51.ssa.fujisawa.hgst.com>
 <20191219172314.kwikdbmqgisptpte@apples.localdomain>
 <20191219174619.GA24792@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219174619.GA24792@redsun51.ssa.fujisawa.hgst.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dec 20 02:46, Keith Busch wrote:
> On Thu, Dec 19, 2019 at 06:24:57PM +0100, Klaus Birkelund Jensen wrote:
> > On Dec 20 01:16, Keith Busch wrote:
> > > On Thu, Dec 19, 2019 at 02:09:19PM +0100, Klaus Jensen wrote:
> > > > @@ -2480,7 +2480,7 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev)
> > > >      pci_conf[PCI_INTERRUPT_PIN] = 1;
> > > >      pci_config_set_prog_interface(pci_conf, 0x2);
> > > >      pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_INTEL);
> > > > -    pci_config_set_device_id(pci_conf, 0x5845);
> > > > +    pci_config_set_device_id(pci_conf, 0x5846);
> > > >      pci_config_set_class(pci_conf, PCI_CLASS_STORAGE_EXPRESS);
> > > >      pcie_endpoint_cap_init(pci_dev, 0x80);
> > > 
> > > We can't just pick a number here, these are supposed to be assigned by the
> > > vendor. A day will come when I will be in trouble for using the existing
> > > identifier: I found out to late it was supposed to be for internal use
> > > only as it was never officially reserved, so lets not make the same
> > > mistake for some future device.
> > > 
> > 
> > Makes sense. And there is no "QEMU" vendor, is there?
> 
> I'm not sure if we can use this, but there is a PCI_VENDOR_ID_QEMU,
> 0x1234, defined in include/hw/pci/pci.h.
> 

Maybe it's possible to use PCI_VENDOR_ID_REDHAT?

