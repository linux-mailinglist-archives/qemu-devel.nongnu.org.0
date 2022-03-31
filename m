Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2294EDFF5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:57:34 +0200 (CEST)
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZz37-0000e3-4P
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:57:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZyxS-0006C1-OM
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:51:42 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=45718
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZyxQ-0004Ps-SJ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:51:42 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id e203so705000ybc.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0NLvs8V/2smM7HMmU6Tp2k/EYFQ2VvaTu62i/x9y2ZU=;
 b=TTdI5WJ8zBGIlF4fmqK4p3zTYgb8PNs1NPo2nRHQJzmfpJXjax9hEGkGgPiFzOakLb
 b/eRyGPuzxPfciDvvkXVU6JPwGznJ43FD6TdtGyPBdGIe5waud/dXJLYPLcLqMMVvV6i
 no/8JVUxdjQhqRkm+kCXjZQu7F8ujURIF0wskM/2Pp8XQ11yHX/tM2oZoke5Lm1/XxOX
 /IbY3SyrntZJ4+CXglCJTy5SsoOLJCaLYlK8AAky5qxL0nd6bMgsdYfSC8FetRnYBjGN
 NVYPYiycSScDNbCsUnlb0c2BgEmImWNz+Y+cPw967NlB/CLYBmD6BGF6L65anU9PMpwZ
 gC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0NLvs8V/2smM7HMmU6Tp2k/EYFQ2VvaTu62i/x9y2ZU=;
 b=qDcpRJQeVE/A8za5gqL1obexqG0yI/lx6tGesjIS0yXFxeMlDyCyAU0QwJ1Z08dDbI
 N2XVOf99rOEyKDUZIQygsxK4TeiyeZ2kr+1S73Ted8ciiF5dA++3QdxVJB4+vlwGCO0X
 OCb8Y2LhVS944VIlFfBu8TaPgM0A9VOKuaa1YVN0dreGINz/l0w3phRngNINHpxF8RDW
 N5lZ9R7+1FuqKL++m69U3fUVsF+VmJOlXjTRAJ8yFfnAumKm7ihyF3lLCS7hV1DB2h+d
 x346t/qdTE9SJwMIXr09xRbmE7AxuxPJy7P/WAxYTCMkBZkjixFdHoEHz/BVBQn7qFSq
 UkbA==
X-Gm-Message-State: AOAM530ibB3hscjOI0k1DGxE0vHcNVyUGhS/NJFehL+M/nPdapFp+vv7
 ulvvOPt0nB3Ase5WYQuH/M7R9TfqN9wx7SRfnv8YNw==
X-Google-Smtp-Source: ABdhPJy1aRToNspNWmaTlOj+DqWZyeoefU3TQ6oJzXTVhhcjI2tVQ314ladSPwH/y75HckJowTstYYzf/iPc12Pm14c=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr5142565ybt.479.1648749099807; Thu, 31
 Mar 2022 10:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
 <20200203061123.59150-20-david@gibson.dropbear.id.au>
In-Reply-To: <20200203061123.59150-20-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 18:51:28 +0100
Message-ID: <CAFEAcA-_KiR1ZVPu3auXkTE3CtayyfPwT+0sd2y+X_5xOdGk_w@mail.gmail.com>
Subject: Re: [PULL 19/35] ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Feb 2020 at 06:11, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>
> These changes introduces models for the PCIe Host Bridge (PHB4) of the
> POWER9 processor. It includes the PowerBus logic interface (PBCQ),
> IOMMU support, a single PCIe Gen.4 Root Complex, and support for MSI
> and LSI interrupt sources as found on a POWER9 system using the XIVE
> interrupt controller.

Hi; Coverity has just spotted an error in this old change
(CID 1487176):

> +++ b/hw/pci-host/pnv_phb4_pec.c

> +static void pnv_pec_pci_xscom_write(void *opaque, hwaddr addr,
> +                                    uint64_t val, unsigned size)
> +{
> +    PnvPhb4PecState *pec = PNV_PHB4_PEC(opaque);
> +    uint32_t reg = addr >> 3;
> +
> +    switch (reg) {
> +    case PEC_PCI_PBAIB_HW_CONFIG:
> +    case PEC_PCI_PBAIB_READ_STK_OVR:
> +        pec->pci_regs[reg] = val;

This write function switches on 'reg' and is written assuming
that these PEC_PCI* constants are valid array indexes...

> +        break;
> +    default:
> +        phb_pec_error(pec, "%s @0x%"HWADDR_PRIx"=%"PRIx64"\n", __func__,
> +                      addr, val);
> +    }
> +}

> +++ b/include/hw/pci-host/pnv_phb4.h

> +struct PnvPhb4PecState {
> +    DeviceState parent;
> +
> +    /* PEC number in chip */
> +    uint32_t index;
> +    uint32_t chip_id;
> +
> +    MemoryRegion *system_memory;
> +
> +    /* Nest registers, excuding per-stack */
> +#define PHB4_PEC_NEST_REGS_COUNT    0xf
> +    uint64_t nest_regs[PHB4_PEC_NEST_REGS_COUNT];
> +    MemoryRegion nest_regs_mr;
> +
> +    /* PCI registers, excluding per-stack */
> +#define PHB4_PEC_PCI_REGS_COUNT     0x2
> +    uint64_t pci_regs[PHB4_PEC_PCI_REGS_COUNT];
> +    MemoryRegion pci_regs_mr;

...but we define the pci_regs[] array in PnvPhb4PecState to
have only 2 elements...

> +++ b/include/hw/pci-host/pnv_phb4_regs.h

> +/* XSCOM PCI global registers */
> +#define PEC_PCI_PBAIB_HW_CONFIG         0x00
> +#define PEC_PCI_PBAIB_READ_STK_OVR      0x02

...and here we define PEC_PCI_PBAIB_READ_STK_OVR as 2, which makes
it not a valid index into pci_regs[].

Which of these is wrong?

thanks
-- PMM

