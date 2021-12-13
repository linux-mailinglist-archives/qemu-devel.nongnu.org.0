Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C837C472459
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:35:53 +0100 (CET)
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhkO-00061F-VG
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:35:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwhiX-00043K-9P
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:33:58 -0500
Received: from [2a00:1450:4864:20::335] (port=52823
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwhiV-0003GD-Cb
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:33:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id o29so11444976wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 01:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Zxn4eyNz+F9ql0sU6rLSYFtOStAIkKxbop1Ep3ooUbU=;
 b=JEbdh9gaFD+zCNclR2tyMoP35eu0OgYs9IHKWHsIQ/jJqImRSZzlAUXRG7yjUizna3
 QP7bKuPiSW9NiXyVT0bAb/YdNnQAVgRINTHLognG6yzkSq81H2gXyW7Q1HKtA833nqQP
 4GX6CVfRK8Zg2LiOtLVr2viFmv+ivKHBOmjfDBFwcm8x3Z50vdW84GdDiPuxs9XLHXg/
 zjiaFzZvfqVu0qfjIFVDpqSG03NiXnxFowKgV7AUoDSTGkSiiCu7Mw0IwI7ORcvGOyNd
 EQYfAntQNlyha0rYdWKHjt3JLBKUpZSmBcyE6SaOyCyhFBlmXdUAyjBsOxGxwF1Dw0LQ
 bA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zxn4eyNz+F9ql0sU6rLSYFtOStAIkKxbop1Ep3ooUbU=;
 b=zH6lLqHw1h+nO0UKGzQj+3E69kde3BpHZstK7K3RAvg6mb+KyyIdo9evqHOVvUeHKI
 jpp8LfsE3lwnV1CyOOxIrX+JtwZ6EimY79H3FU7X1j0+VDtEWK1xK+7HavQK+WKCizL1
 ysbgGPRRrY/kYA+EwXRAml09LtBgNlI6LIpWGnyFNmCsPfOiDLCtugSCKxz2ezKTm8Z1
 9ImRsG31atrGdiq0UMVRNHoYvf866fvEzWegOOZbLoWnbODTda2ZPKl7IpW4CXRhu8jW
 rFcczKpQlQmnbNODjRYlMWu4Ni1J0uPz22wRQti/Bsaenz8BawGgNKzY7MpNh3mRzZnC
 441g==
X-Gm-Message-State: AOAM532nkr6aLxaZeopvIgknoiQ146YRSNYyAkHya2NpfZaxjM2jNCgM
 5mHrlx695b2FEZv8NSDLTg9URg==
X-Google-Smtp-Source: ABdhPJz+7hCoDsyG4rAfqzUSZfAlLs90kBwXG70jOZwU6zLI9m8rWk2/5v727zOvBepFcslTC03TMA==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr36489604wmj.37.1639388032851; 
 Mon, 13 Dec 2021 01:33:52 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id z14sm10486757wrp.70.2021.12.13.01.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 01:33:52 -0800 (PST)
Date: Mon, 13 Dec 2021 09:33:30 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] MAINTAINERS: Add a separate entry for acpi/VIOT tables
Message-ID: <YbcTasuYcur/ZOJi@myrica>
References: <20211213045924.344214-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213045924.344214-1-ani@anisinha.ca>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 10:29:24AM +0530, Ani Sinha wrote:
> All work related to VIOT tables are being done by Jean. Adding him as the
> maintainer for acpi VIOT table code in qemu.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Acked-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7543eb4d59..f9580f2fe2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1776,6 +1776,13 @@ F: docs/specs/acpi_mem_hotplug.rst
>  F: docs/specs/acpi_pci_hotplug.rst
>  F: docs/specs/acpi_hw_reduced_hotplug.rst
>  
> +ACPI/VIOT
> +M: Jean-Philippe Brucker <jean-philippe@linaro.org>
> +R: Ani Sinha <ani@anisinha.ca>
> +S: Supported
> +F: hw/acpi/viot.c
> +F: hw/acpi/viot.h
> +
>  ACPI/HEST/GHES
>  R: Dongjiu Geng <gengdongjiu1@gmail.com>
>  L: qemu-arm@nongnu.org
> -- 
> 2.25.1
> 

