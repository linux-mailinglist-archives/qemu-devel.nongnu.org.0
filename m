Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3CD6E8033
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:18:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBS4-00018c-EU; Wed, 19 Apr 2023 13:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppBS2-00018O-Q7
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:18:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppBS0-00078c-0X
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:18:38 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q1nVp3jcCz6J7KR;
 Thu, 20 Apr 2023 01:15:46 +0800 (CST)
Received: from localhost (10.48.144.241) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Apr
 2023 18:18:32 +0100
Date: Wed, 19 Apr 2023 18:18:30 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: Jonathan Cameron via <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <linuxarm@huawei.com>
Subject: Re: [PULL 70/73] hw/pxb-cxl: Support passthrough HDM Decoders
 unless overridden
Message-ID: <20230419181830.000040e9@Huawei.com>
In-Reply-To: <CAFEAcA_dpQpWq5HsCfXpwTKDDD7Q-56UzmV6Q-JqPO_hdPF12g@mail.gmail.com>
References: <cover.1678237635.git.mst@redhat.com>
 <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
 <CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com>
 <20230419145754.000001ef@Huawei.com>
 <20230419154957.000030be@huawei.com>
 <CAFEAcA_dpQpWq5HsCfXpwTKDDD7Q-56UzmV6Q-JqPO_hdPF12g@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.144.241]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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

On Wed, 19 Apr 2023 17:25:17 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 19 Apr 2023 at 15:50, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Wed, 19 Apr 2023 14:57:54 +0100
> > Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> >  
> > > On Tue, 11 Apr 2023 11:26:16 +0100
> > > Peter Maydell <peter.maydell@linaro.org> wrote:  
> > > > What was the intention here with the type hierarchy?
> > > > Should TYPE_PXB_CXL_DEVICE be a subclass of TYPE_PXB_DEVICE,
> > > > or should the cxl-related functions not be trying to treat
> > > > it as a PXB device ?  
> > >
> > > I can't immediately recall why, but PXB_DEV and PXB_CXL_DEV use the
> > > same struct PXBDev so here switching to PXB_CXL_DEV(dev)->hdm_for_passthrough
> > > looks to be the minimum fix.
> > >
> > > I'll dig into why / if there is a good reason for why PXB_CXL_DEV doesn't
> > > simply inherit from PXB_DEV then use runtime type checking in the few places it
> > > will matter.  
> >
> > Ah. Looks to be cut and paste from what TYPE_PXB_PCIE_DEV was doing.
> > We probably never considered if that was a good path to take or not.
> > Not clear why they can't both just inherit from TYPE_PXB_DEV.
> > At least superficially it seems to work + is cleaner.
> >
> > Following only lightly tested... May eat babies etc.
> >
> > From 995226fcdfe196e010c5a3850bfca2f97a384307 Mon Sep 17 00:00:00 2001
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Date: Wed, 19 Apr 2023 15:41:44 +0100
> > Subject: [PATCH] hw/pci-bridge: Make PCIe and CXL PXB Devices inherit from
> >  PXB_DEVICE
> >
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> You probably want to send this out as a proper top-level patch:
> both humans and automated tooling tend to not notice patches
> buried inside other list threads.

Absolutely.  Was a case of lazily throwing it over the wall before running out
the door.

> 
> > -static PXBDev *convert_to_pxb(PCIDevice *dev)
> > -{
> > -    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
> > -    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
> > -        return PXB_CXL_DEV(dev);
> > -    }
> > -
> > -    return pci_bus_is_express(pci_get_bus(dev))
> > -        ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
> > -}  
> 
> This function looks super-dubious, so the fact that it
> goes away in this patch is a good sign :-)
> 
> > diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> > index 0aac8e9db0..57f66da5bd 100644
> > --- a/include/hw/pci/pci_bridge.h
> > +++ b/include/hw/pci/pci_bridge.h
> > @@ -85,7 +85,7 @@ struct PCIBridge {
> >  #define PCI_BRIDGE_DEV_PROP_SHPC       "shpc"
> >  typedef struct CXLHost CXLHost;
> >
> > -struct PXBDev {
> > +typedef struct PXBDev {
> >      /*< private >*/
> >      PCIDevice parent_obj;
> >      /*< public >*/
> > @@ -93,14 +93,28 @@ struct PXBDev {
> >      uint8_t bus_nr;
> >      uint16_t numa_node;
> >      bool bypass_iommu;
> > +} PXBDev;
> > +
> > +typedef struct PXBPCIEDev {
> > +    /*< private >*/
> > +    PXBDev parent_obj;
> > +} PXBPCIEDev;
> > +
> > +#define TYPE_PXB_DEVICE "pxb"
> > +DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
> > +                         TYPE_PXB_DEVICE)  
> 
> The documentation for DECLARE_INSTANCE_CHECKER()
> says "Direct usage of this macro should be avoided, and
> the complete OBJECT_DECLARE_TYPE() macro is recommended
> instead. So we should do that. (That will also mean you don't
> need the explicit "typedef"s on your struct declarations,
> because OBJECT_DECLARE_TYPE() will define typedefs for you.)

I'll fix that up and send out properly.  Thanks for the
quick feedback.

Jonathan

> 
> > +
> > +typedef struct PXBCXLDev {
> > +    /*< private >*/
> > +    PXBPCIEDev parent_obj;
> > +    /*< public >*/
> > +
> >      bool hdm_for_passthrough;
> > -    struct cxl_dev {
> > -        CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
> > -    } cxl;
> > -};
> > +    CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
> > +} PXBCXLDev;
> >
> >  #define TYPE_PXB_CXL_DEVICE "pxb-cxl"
> > -DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> > +DECLARE_INSTANCE_CHECKER(PXBCXLDev, PXB_CXL_DEV,
> >                           TYPE_PXB_CXL_DEVICE)
> >
> >  int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,  
> 
> thanks
> -- PMM


