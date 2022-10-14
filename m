Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A705FF22B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 18:20:55 +0200 (CEST)
Received: from localhost ([::1]:58232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojNQb-0007vF-Q7
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 12:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojNMC-00041t-U6; Fri, 14 Oct 2022 12:16:20 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:41772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojNMA-00047i-Rz; Fri, 14 Oct 2022 12:16:20 -0400
Received: by mail-oi1-x233.google.com with SMTP id w196so5533554oiw.8;
 Fri, 14 Oct 2022 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+mYqFZrY5HTM29G6eTKIT2r+50PybnKVPcgYay0m18I=;
 b=IaA2bptZad+3LoDERCbEw/k9lmKd/2F2e5r58n4c+D7D4x+msTRLtaCgRJfAl7CC7N
 OUGKrDwHhk4+Z7tyDoRgq5JraQDi3JSleL31oIArsXYXjmhzLpbKgU2SBNoaNOVEnUhd
 pOVeHnDOTNFyoqmvfLSirETC+6dTa5A2M5l1d5DcumqRJp3HOKqSvdOQbcVWOIDy0Mw/
 3FWS1kEXmIXehSXVWyJweOwARKMKSdj+RCybofc17fx3ACpLRCRIh9MHEVhg3Ke2dxsT
 cpfn4xMNwQgqKis5KTFcVvvK0u6aCKmR7DVz2S+Ub53oV37OwSZjLaw3mXSqlV4iWzgo
 cc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+mYqFZrY5HTM29G6eTKIT2r+50PybnKVPcgYay0m18I=;
 b=R59XZo0nu3ruhgW9qeRPZHCpFhj/skPQBk9q21/xWKP1YtRQChiu7rzVQEMAGzBDfl
 p1EdpcG4D6vuefD17wVe3K81ZPcUksxLWUH1zNit4+7SRYcOxQz/TeYA2606y9mFsuw4
 nxyg+qKe1fNLgo4O4j9RUKxoxf77WyruSB4NhO302MNwkIC1W6Kho4BfWyNybBopqSUy
 gSF1dZ8sXQ6JksoVqA7hMke9QWnVfoIpHV0IWi9EIm5ckPH1dL2UIhGHFTEhQIZjZKJn
 jdxfPJiMWwb32jMWNwzK46L7szmUxWoLcWKJRdFIYdEMi08tQI+CwwkG/d4sJe7pbyc+
 5tMA==
X-Gm-Message-State: ACrzQf18glOfnpT1KxDY0+hMuIvDwT+vR6HFM36y2HrAAax2yiNlkEsh
 wmetGmhCXz6vW1yJ/+4mc34=
X-Google-Smtp-Source: AMsMyM75NM77xjKDJPQD/poXq4/UVGQQRRIQKPpZDL/5pv+8nPhZ/fQGd1SoCHvLUY5sGPAdMNz9CA==
X-Received: by 2002:a05:6808:e87:b0:353:f1e2:e16f with SMTP id
 k7-20020a0568080e8700b00353f1e2e16fmr7493991oil.258.1665764175526; 
 Fri, 14 Oct 2022 09:16:15 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 64-20020a9d04c6000000b00661cc94f035sm1406033otm.41.2022.10.14.09.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 09:16:14 -0700 (PDT)
Message-ID: <7ea79b6e-0bd2-6157-ac6c-e948d9d87c21@gmail.com>
Date: Fri, 14 Oct 2022 13:16:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] hw/ppc/spapr_pci.c: Use device_cold_reset() rather than
 device_legacy_reset()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20221014142841.2092784-1-peter.maydell@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221014142841.2092784-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.856,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 10/14/22 11:28, Peter Maydell wrote:
> In spapr_phb_children_reset() we call device_legacy_reset() to reset any
> QOM children of the SPAPR PCI host bridge device. This will not reset
> any qbus such a child might own. Switch to device_cold_reset(), which will
> reset both the device and its buses. (If the child has no qbuses then
> there will be no change in behaviour.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

And queued. Thanks,


Daniel

> I couldn't figure out what exactly the QOM child objects are in this
> case -- the comment in spapr_phb_reset() suggests there's only one and
> it's the IOMMU? My guess is that they don't have any qbuses in any case.
> This patch was tested with 'make check' and 'make check-avocado' only.
> ---
>   hw/ppc/spapr_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 57c8a4f0855..7b7618d5da0 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2045,7 +2045,7 @@ static int spapr_phb_children_reset(Object *child, void *opaque)
>       DeviceState *dev = (DeviceState *) object_dynamic_cast(child, TYPE_DEVICE);
>   
>       if (dev) {
> -        device_legacy_reset(dev);
> +        device_cold_reset(dev);
>       }
>   
>       return 0;

