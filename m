Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0125F5A0255
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:54:07 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwRy-000249-5l
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwPy-0000PM-Sf
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:52:02 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:35599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwPx-0000w6-E1
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:52:02 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-33da3a391d8so75133177b3.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=nNCyu14NpOf2lBSi6vrSm4gSsJKhALhPi0MXBNs/ELo=;
 b=hlNcTlToAmkhKfWnPy4eqtij7Tbx0jaIgWb9ZbI70kQJWMUHwBAYXZ/87qaGbOHqou
 EC2S4NSqee6XWq5QL3/MnHc7X8zuES6XBrjbEgjxrwnB06Z9kVWwbpeArcUce2BGeQS/
 nZpS/38MP2IhbgfF2EhNFS2hbJ9DRHrRlmduPmcrfsG8IngIR1UVcOODzrk0Ki/lqj0h
 kD4/X20f7ZFdoSg9t0mJzNzKJkt6qmOXbInjWCPabhQw7dU83iv3iCkjGlorFc5cZiWv
 qCtPN3gMHsY7g/50DWTwHsyfhMLE0IydttrHeY6vyV9QErLi6r6TBnvjVUyy05ozTw5V
 X4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=nNCyu14NpOf2lBSi6vrSm4gSsJKhALhPi0MXBNs/ELo=;
 b=2oGTk3Pqjo4hKzA/Li8zO4FV6ixdoKbd19ckmbTGvkOfKE2NMKi+ykVjtsijL2Ct+S
 p6Sk0dmpfV9BvdO2sMoLvenfJ368Q8wdLlJVJMcEyEDJNtu41cUihPOtYsxkOjiaQ9K6
 yHy23bIt8vmmBVdbz2lBxh7bh+VnIOCWMc4Bnrap1wuHna6Pv5iTQWNk2qceUH82bBCe
 m+QAkR1c09EfPLY08Fw5KzJE12nVy4OIFUQiJHsUR0wQQr0hllvvdnzXrYwYaN/skJ4C
 n8CbBjiiI6bbvxkALLeRhpiIiEes5dNMl38SWPrNvqPEWhh1UFoUry4Kj8cGrt8JLMQe
 Dnog==
X-Gm-Message-State: ACgBeo0Yi3CU0Hva3hkfCDh/a1RcVR6DuvEjfaxexpWreTpMeIcbeWyu
 /4nWGV9LQlptQHlyBE/hN0lFzdQZU7bPgCLNIVU/QA==
X-Google-Smtp-Source: AA6agR4Xj+sFdgY3tVbKy7OwkidFyosMYZeSOscG/Q0Dz1ERrr0mTVZ9HHPVyHdt/XEsVGUs8DTQYfg+6ojX8eUnqDg=
X-Received: by 2002:a5b:711:0:b0:696:dab:3efa with SMTP id
 g17-20020a5b0711000000b006960dab3efamr740755ybq.193.1661370720376; 
 Wed, 24 Aug 2022 12:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-11-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-11-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:51:18 +0100
Message-ID: <CAFEAcA-Kv16weckhxM-mQrwiPZa5JMY4YkXcD5UfCzDKr4xGtQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> dt-validate and dtc throw a few warnings when parsing the virtio-iommu
> node:
>
>   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
>   pcie@10000000: Unevaluated properties are not allowed (... 'virtio_iommu@16' were unexpected)
>   From schema: linux/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
>   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
>   From schema: dtschema/schemas/pci/pci-bus.yaml
>
>   Warning (pci_device_reg): /pcie@10000000/virtio_iommu@16: PCI unit address format error, expected "2,0"
>
> The compatible property for a PCI child node should follow the rules
> from "PCI Bus Binding to: IEEE Std 1275-1994". It should contain the
> Vendor ID and Device ID (or class code).
>
> The unit-name should be "device,function".
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> Note that this doesn't follow
> linux/Documentation/devicetree/bindings/virtio/iommu.txt, I'll update
> that document when converting it to yaml, hopefully this Linux cycle.
> The "virtio,pci-iommu" compatible string is not actually used by any
> driver and only QEMU implements it, so we can get rid of it.

I'm not sure you can just change the compat string like that,
unless you can guarantee that nobody anywhere has ever
looked for it in a dtb. Also, "virtio,pci-iommu" is much
clearer than "pci1af4,1057"...

-- PMM

