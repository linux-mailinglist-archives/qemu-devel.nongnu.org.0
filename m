Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679F84BB491
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:47:25 +0100 (CET)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKyvE-0005im-GK
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:47:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKyZp-0007Y7-Bc
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKyZn-0001Vu-C6
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645172714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBMkzP1V6Pqx1aMfZkyHdoi4EkE4+7SXGrUwGNcm06o=;
 b=Cvx1gVtpfX4LVDNQJ7izTpSEjZdWN5YR3H87MfMY+kmxzc6Q5lngRVP243LtM6EusaQ+9L
 VCPBR4YFAY2QYf1LLFp3M0FprCE8K0GXqAnGKsCCFfMkgMBCZvpOZxsy3WaMW/W7R22Dab
 Kk+bEU7tmj7XgiJT/kxfMZs2HP/8dts=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-FszMdHJMMcK3iSlmH3th9Q-1; Fri, 18 Feb 2022 03:25:13 -0500
X-MC-Unique: FszMdHJMMcK3iSlmH3th9Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 o5-20020a50c905000000b00410effbf65dso5084962edh.17
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 00:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aBMkzP1V6Pqx1aMfZkyHdoi4EkE4+7SXGrUwGNcm06o=;
 b=y4QIDhMVwFBQGDly1avAIzbH+dz6v7CJgFKj+/3QB1Cjb6QSclDUOeeveeCFUhaJ2m
 ooFrswhT5M1y5jBLsDzOPLs1LrTWa4JKmgXFJjxj0VJZTJV+/uCh6mPVWQCNfpu394Yg
 MlaBlja7bmWbwQ6XwMAoFOVnMgdzuEl5TFgj5bnhabnlNL4xJyrkjbjFK9c7s3NJ3hai
 baFiczEh0sZBZBFpfRz/eQVHDKe4S81Hi49LPW7q7yYU8SUpQxa0YMuIUyOF7kWVWcLo
 UJU8FCy8Ua3SY/DH0Ji0vv+OYpNmJLCYxds2887CQbOLRFqOssNNJSsA/dzxAJCXi/mK
 TM8A==
X-Gm-Message-State: AOAM531iDKQnhsvfnaXLnFGWu7gSiCM6S4grVvds1TAsXcI151V6Nsw8
 tcXLBidzurK6W/uBeVND1KZpGSrgz0wwo2J6j+U2pySuLXtywo5IdmmsGL4Y5G7VY9rN1X2ulyH
 jSPZzFVTZVJ9LeEQ=
X-Received: by 2002:a17:906:dd7:b0:6b8:783f:a49d with SMTP id
 p23-20020a1709060dd700b006b8783fa49dmr5370460eji.623.1645172711937; 
 Fri, 18 Feb 2022 00:25:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySGYud7nLzKcF4wUXbHgfXW8CanD5MTFgvq7dJzjxNPmXbtvyac4creBIVFx6NOiWBQeYs/Q==
X-Received: by 2002:a17:906:dd7:b0:6b8:783f:a49d with SMTP id
 p23-20020a1709060dd700b006b8783fa49dmr5370441eji.623.1645172711659; 
 Fri, 18 Feb 2022 00:25:11 -0800 (PST)
Received: from redhat.com ([2.55.156.211])
 by smtp.gmail.com with ESMTPSA id q5sm1954504ejc.115.2022.02.18.00.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 00:25:10 -0800 (PST)
Date: Fri, 18 Feb 2022 03:25:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 03/15] pcie: Add a helper to the SR/IOV API
Message-ID: <20220218032501-mutt-send-email-mst@kernel.org>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-4-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20220217174504.1051716-4-lukasz.maniak@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:44:52PM +0100, Lukasz Maniak wrote:
> From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> 
> Convenience function for retrieving the PCIDevice object of the N-th VF.
> 
> Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> Reviewed-by: Knut Omang <knuto@ifi.uio.no>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/pci/pcie_sriov.c         | 10 +++++++++-
>  include/hw/pci/pcie_sriov.h |  6 ++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index 3f256d483fa..87abad6ac86 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -287,8 +287,16 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev)
>      return dev->exp.sriov_vf.vf_number;
>  }
>  
> -
>  PCIDevice *pcie_sriov_get_pf(PCIDevice *dev)
>  {
>      return dev->exp.sriov_vf.pf;
>  }
> +
> +PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n)
> +{
> +    assert(!pci_is_vf(dev));
> +    if (n < dev->exp.sriov_pf.num_vfs) {
> +        return dev->exp.sriov_pf.vf[n];
> +    }
> +    return NULL;
> +}
> diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
> index 990cff0a1c6..80f5c84e75c 100644
> --- a/include/hw/pci/pcie_sriov.h
> +++ b/include/hw/pci/pcie_sriov.h
> @@ -68,4 +68,10 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev);
>   */
>  PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
>  
> +/*
> + * Get the n-th VF of this physical function - only valid for PF.
> + * Returns NULL if index is invalid
> + */
> +PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
> +
>  #endif /* QEMU_PCIE_SRIOV_H */
> -- 
> 2.25.1


