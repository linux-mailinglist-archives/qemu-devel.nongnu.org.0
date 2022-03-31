Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB14ED758
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:54:20 +0200 (CEST)
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrVT-0002YK-Oi
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:54:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZrSl-0000Z0-1b
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:51:31 -0400
Received: from [2607:f8b0:4864:20::1134] (port=45599
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZrSj-0001Ch-6f
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:51:30 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e6650cde1bso247314327b3.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wUin5oJRPkZdX6+MCp4ImIIAmc8k8ft+q3uUTIUDafA=;
 b=xCN0Hip3CDKyBY1Rd7eVeaRkyVijEgBVZMu+jGCzI77pDb+79P42cUyQNZrQNvgfEL
 iULIWsVMFTZbLGYu9pUWZ9ICLn81NDEWc65rfB/m7T7KxVf+g39xvW6XZN2JP3A6W+wQ
 BkuaMbsTRQt7AZYqAxLUKsVhpWz5eR7UNJwWT1RKY3lIJf94sOudFWMuBaAy7cRNGvXi
 IutPAeSKVykA+X0disDoKnTbfe9mqJLFPfdj8QVtvaC/8SI2l5bPbQJ06cVy/XCBAfwi
 zv7ZPDTuFtctFA3uVLgwc6V9KMs4w8fKtxRLfi/Bl6taSGONNqMVvKKz65ARSMan2ZI2
 OfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wUin5oJRPkZdX6+MCp4ImIIAmc8k8ft+q3uUTIUDafA=;
 b=BA0HeOzyqcajr/uHg5iS+cVWdtlT8Yt3xYSC95/5KQ/9Nkq5CWBXfNynM4uK1T/uYz
 bCcrBAVI9avz5zhatjEDr6woNQJo3K7h4BPGrcmELNBLjimqSfqpDUoQONuITRjyPDjR
 GNgiEhflEZT8dVRgHcikyAhkUogqT2CA0SO4V5Ebd/nw3rgwXPKUX8KR0KpIks6bJu0F
 vKvDpPehhEZ/n757k6hPJSiC0Fit23KIlkMhuPOwNYJtV6Y69e96ws+PKdhTqD1fnHEs
 bhNV58ax5hhIZzE6Mz59tdktrG3ro6jSy/iFMQ618b2RiQTyCukQrdc5MyV3NpmjyhZA
 nmaA==
X-Gm-Message-State: AOAM5310w1M0jDCDhc9tVBJnyVaVx5VJL7VEdFHNUTqn0hx8PkUzCgTg
 xlVqiw3ncCTsn4yyQ8HKsdwn7vTMUqRnhxTT5BHvEA==
X-Google-Smtp-Source: ABdhPJzJJvFiUcw8SLcZndGdWJNzA+djR3mbGuK9iM3Y3HPFqWRCvC1bDuMp7rQ5EeQCynGPdLwifH6y3DevqTDRFCU=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr4158734ywf.347.1648720288080; Thu, 31
 Mar 2022 02:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220307224357.682101-1-mst@redhat.com>
 <20220307224357.682101-16-mst@redhat.com>
In-Reply-To: <20220307224357.682101-16-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 10:51:17 +0100
Message-ID: <CAFEAcA-zjv1dqkUo=rt549wO-D9=J-MFfRCm4nMQthh_Gh_eog@mail.gmail.com>
Subject: Re: [PULL v4 15/47] intel_iommu: support snoop control
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 22:45, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Jason Wang <jasowang@redhat.com>
>
> SC is required for some kernel features like vhost-vDPA. So this patch
> implements basic SC feature. The idea is pretty simple, for software
> emulated DMA it would be always coherent. In this case we can simple
> advertise ECAP_SC bit. For VFIO and vhost, thing will be more much
> complicated, so this patch simply fail the IOMMU notifier
> registration.
>
> In the future, we may want to have a dedicated notifiers flag or
> similar mechanism to demonstrate the coherency so VFIO could advertise
> that if it has VFIO_DMA_CC_IOMMU, for vhost kernel backend we don't
> need that since it's a software backend.

Hi; Coverity points out (CID 1487174) an error in this change:

> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3030,6 +3030,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
>      IntelIOMMUState *s = vtd_as->iommu_state;
>
> +    /* TODO: add support for VFIO and vhost users */
> +    if (s->snoop_control) {
> +        error_setg_errno(errp, -ENOTSUP,
> +                         "Snoop Control with vhost or VFIO is not supported");
> +        return -ENOTSUP;
> +    }

error_setg_errno() expects a normal errno value, not a negated
one, so we should be passing it "ENOTSUP" here, not "-ENOTSUP".

thanks
-- PMM

