Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3D6E7F98
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:26:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAcq-00031v-Lm; Wed, 19 Apr 2023 12:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppAce-0002f8-F0
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:25:34 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppAcc-00008v-LC
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:25:32 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso356219866b.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681921529; x=1684513529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3Q8+l74vIqWMqPbUpJL9qfFdjNr0wk9EK44q+VAxY3I=;
 b=nKwWP6wcTBBqgb41QDmvUDeEiKcV464QZPx+bFFAP12GVJTUvvTypDrE7Lxm76B+Xq
 sEznF35/cy6h5BgNlqC4NuR462UAycOIPXL4DS7goUEfWvjB8BRUDJ8AegRnYLPMJ40M
 kkolnf4HgFAXD0J8mvirPhWc9pzEGoHJ5EvL31R7p79PeW6uMTammqnFnW0u8XOd4QDW
 Y7gr/5hlbNQaNs0vx7KWp4WZSR35mhpPcMw4gMEJL4feEQKOeh5683+uQAjrOQtAJuwq
 7XqX4Lq4yhQGg1IHAg2XrDUo1opQnXsUZFqPxekqUr/diP+X+VR87iGMSJP82/ngPa34
 hwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921529; x=1684513529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Q8+l74vIqWMqPbUpJL9qfFdjNr0wk9EK44q+VAxY3I=;
 b=AVe4kBtcHDzU7N0mpDwNXiNjwg+wpgV7BDPDZdRlVCAHcq3Uc5cPzbT1Ly0NxyD4Nx
 qTH+B18BZaFoMsXRlGYekMenu6NizMtcHUFc+MbB+SaT0+1eRUNV+zRj4mIYumwgE83k
 cBkBO15NPIUnr+P2n3iRXXohVfUVUw6Ysn3EtQGKE+fHui/tgyTZcewWf82olUqu4jbl
 LDylr26ydb8QMpaNM2Xro8JAL6qb05i0zeJnbCSuJWlS+wbha+FjTX9kMcoLC6F7j5I1
 5TvEZqxVksnvtXwslOrkUdZIHOqNfDDMzYxMBFa72zJf3KiVOUeuhoH6hd714p1I3frf
 kArQ==
X-Gm-Message-State: AAQBX9eQCErhNVlKfk5lSVSIpy3nk50OuRHE7cdMlhSeM5vNy2hDLb1P
 kdKVMvyLk4tzxoG0CiJefUDGH5bv2G11mef40tprRg==
X-Google-Smtp-Source: AKy350apKWSNxPB6zw7HKRX8bKdxmSoPdoTAU6337WWwUNNAKBERs1Wfgcz6Rb75c85aAmozZrDUJe7e4tL+vMbKa5Q=
X-Received: by 2002:a50:9b0b:0:b0:506:8669:83df with SMTP id
 o11-20020a509b0b000000b00506866983dfmr2865827edi.6.1681921528741; Wed, 19 Apr
 2023 09:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678237635.git.mst@redhat.com>
 <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
 <CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com>
 <20230419145754.000001ef@Huawei.com> <20230419154957.000030be@huawei.com>
In-Reply-To: <20230419154957.000030be@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Apr 2023 17:25:17 +0100
Message-ID: <CAFEAcA_dpQpWq5HsCfXpwTKDDD7Q-56UzmV6Q-JqPO_hdPF12g@mail.gmail.com>
Subject: Re: [PULL 70/73] hw/pxb-cxl: Support passthrough HDM Decoders unless
 overridden
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 19 Apr 2023 at 15:50, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Wed, 19 Apr 2023 14:57:54 +0100
> Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
>
> > On Tue, 11 Apr 2023 11:26:16 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > What was the intention here with the type hierarchy?
> > > Should TYPE_PXB_CXL_DEVICE be a subclass of TYPE_PXB_DEVICE,
> > > or should the cxl-related functions not be trying to treat
> > > it as a PXB device ?
> >
> > I can't immediately recall why, but PXB_DEV and PXB_CXL_DEV use the
> > same struct PXBDev so here switching to PXB_CXL_DEV(dev)->hdm_for_passthrough
> > looks to be the minimum fix.
> >
> > I'll dig into why / if there is a good reason for why PXB_CXL_DEV doesn't
> > simply inherit from PXB_DEV then use runtime type checking in the few places it
> > will matter.
>
> Ah. Looks to be cut and paste from what TYPE_PXB_PCIE_DEV was doing.
> We probably never considered if that was a good path to take or not.
> Not clear why they can't both just inherit from TYPE_PXB_DEV.
> At least superficially it seems to work + is cleaner.
>
> Following only lightly tested... May eat babies etc.
>
> From 995226fcdfe196e010c5a3850bfca2f97a384307 Mon Sep 17 00:00:00 2001
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Date: Wed, 19 Apr 2023 15:41:44 +0100
> Subject: [PATCH] hw/pci-bridge: Make PCIe and CXL PXB Devices inherit from
>  PXB_DEVICE
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

You probably want to send this out as a proper top-level patch:
both humans and automated tooling tend to not notice patches
buried inside other list threads.

> -static PXBDev *convert_to_pxb(PCIDevice *dev)
> -{
> -    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
> -        return PXB_CXL_DEV(dev);
> -    }
> -
> -    return pci_bus_is_express(pci_get_bus(dev))
> -        ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
> -}

This function looks super-dubious, so the fact that it
goes away in this patch is a good sign :-)

> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index 0aac8e9db0..57f66da5bd 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -85,7 +85,7 @@ struct PCIBridge {
>  #define PCI_BRIDGE_DEV_PROP_SHPC       "shpc"
>  typedef struct CXLHost CXLHost;
>
> -struct PXBDev {
> +typedef struct PXBDev {
>      /*< private >*/
>      PCIDevice parent_obj;
>      /*< public >*/
> @@ -93,14 +93,28 @@ struct PXBDev {
>      uint8_t bus_nr;
>      uint16_t numa_node;
>      bool bypass_iommu;
> +} PXBDev;
> +
> +typedef struct PXBPCIEDev {
> +    /*< private >*/
> +    PXBDev parent_obj;
> +} PXBPCIEDev;
> +
> +#define TYPE_PXB_DEVICE "pxb"
> +DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
> +                         TYPE_PXB_DEVICE)

The documentation for DECLARE_INSTANCE_CHECKER()
says "Direct usage of this macro should be avoided, and
the complete OBJECT_DECLARE_TYPE() macro is recommended
instead. So we should do that. (That will also mean you don't
need the explicit "typedef"s on your struct declarations,
because OBJECT_DECLARE_TYPE() will define typedefs for you.)

> +
> +typedef struct PXBCXLDev {
> +    /*< private >*/
> +    PXBPCIEDev parent_obj;
> +    /*< public >*/
> +
>      bool hdm_for_passthrough;
> -    struct cxl_dev {
> -        CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
> -    } cxl;
> -};
> +    CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
> +} PXBCXLDev;
>
>  #define TYPE_PXB_CXL_DEVICE "pxb-cxl"
> -DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> +DECLARE_INSTANCE_CHECKER(PXBCXLDev, PXB_CXL_DEV,
>                           TYPE_PXB_CXL_DEVICE)
>
>  int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,

thanks
-- PMM

