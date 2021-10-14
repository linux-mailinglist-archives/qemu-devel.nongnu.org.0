Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C570642D4D2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:26:46 +0200 (CEST)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maw4b-000259-Ur
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1maw2p-0008Ax-HT
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:24:56 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1maw2n-0000GP-Cx
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:24:55 -0400
Received: by mail-wr1-x429.google.com with SMTP id k7so16685658wrd.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wahtm+TVyZHddXYn4SVl2PatCE0EZV81pDWY97EuUhw=;
 b=eIf3cG0+pBLVIG1BepdqM4n8luWd/57DYRe/5AW6WqRMuVuq1Z7QmyHWmPADbXEtkm
 qNZho8TSspdupwncnU5UDKRtSQu/uWzPt/9EeTj1sSkTi6d7KLQudfDlRHEbHsWuc3tM
 3Pbd6qRp96Y4Mc9VmAOuYYBWM5XGxf+tDrj0fVaGtcQlgmlSkYv1wDoCm8EDrAAWojWN
 ao7nZsPnqbv7PbNl8GEOuEdTo+CrgUmiJqGRVWtrGRlf1pBD4qrNme04ngMRJgUE/qew
 FUHzPQ4UK7XQIC/0I7xEk61ZSsumWzTNjk7eVmKdVABMDFussRlXR8UK5DmQQqYi1Iaf
 sEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wahtm+TVyZHddXYn4SVl2PatCE0EZV81pDWY97EuUhw=;
 b=lE2xBAi+Jc5040v2wUn857SaYRY7o6V9rH7OIEa9RWTuirx9rR63Ib2O4fjKdoX8mE
 QWnsVX9Yrp0ac7u9+bW+Df4J2fII4RROl12fpAFLel+SunqxEhlJKKtT4w5+KH5XZ3zR
 Sk2Cm8xTCtJolLQ8vZmy1o7OcluA9IGn+Up7ET8a6EJYT7w4/JQkFpMcxH+zd3zsh6R0
 Kk0jsllq/qwpM15MKEZcanOmcRng9hfWzkmqZ93VRTsqZ/f8hgMgrlDDEFvOx86ToQlL
 23ccveaRUnMi9wwah4+2iUKY2baF9BuysCXMIlBgG4bJL4CiGcm/8GrpYq93B9kHt5pP
 aM+g==
X-Gm-Message-State: AOAM532z5r7ufr4srYg4GGO1mjTvYlgB6M1ns3/Ba7zdSRnCp6zJPshg
 CjkHn+5egfuo/+8NIHBhegLkxQ==
X-Google-Smtp-Source: ABdhPJzVAHpUjKV/G2cRZVdx2LxBA4kaXlXvMpwpm76Fkav55toXyxn0LwsLq24epCP9CTbu7J7UUQ==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr18000859wmr.194.1634199888764; 
 Thu, 14 Oct 2021 01:24:48 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b10sm1710722wrf.68.2021.10.14.01.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:24:48 -0700 (PDT)
Date: Thu, 14 Oct 2021 09:24:26 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 1/2] virtio-iommu: Remove the non transitional name
Message-ID: <YWfpOulVNiS5EV7G@myrica>
References: <20211013191755.767468-1-eric.auger@redhat.com>
 <20211013191755.767468-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013191755.767468-2-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 03:17:54PM -0400, Eric Auger wrote:
> Remove the non transitional name for virtio iommu. Like other
> devices introduced after 1.0 spec, the virtio-iommu does
> not need it.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Andrea Bolognani <abologna@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/virtio-iommu-pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 770c286be7..86fa4e6c28 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -100,7 +100,6 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
>      .base_name             = TYPE_VIRTIO_IOMMU_PCI,
>      .generic_name          = "virtio-iommu-pci",
> -    .non_transitional_name = "virtio-iommu-pci-non-transitional",
>      .instance_size = sizeof(VirtIOIOMMUPCI),
>      .instance_init = virtio_iommu_pci_instance_init,
>      .class_init    = virtio_iommu_pci_class_init,
> -- 
> 2.27.0
> 

