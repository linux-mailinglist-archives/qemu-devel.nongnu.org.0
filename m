Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3B6079A9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:34:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olt6M-0005Nt-Q2
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:34:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olt5w-0008Mo-TU
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1olt5b-0006Un-21
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:33:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1olt5Y-0007jc-A5
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:33:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a14so2289019wru.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WDLa7n/zN17cmLnBWe5rmnJ44HQUR2mq7sgSsOR9wmQ=;
 b=u4FUzC1GRTfmm1fnpH8ueh0RHjD1Q7h9eSKo65wkmexjDI/lU+jc5Y3XQEQSmt8exn
 nas2MeqY8yNd762ALH0r3lwMeEO7hsK0OPSLNWTW3f0sP1rDmwRwIaUoaStto4Xnqps9
 6wZM2U0l2MCvuMQiY6xWBS3LW80+Pc9mf+tXnvb7rE1SvRwGx0lZhCIuMUGk9LMXL50t
 Q6WYabTwVv3mRi2QV4lsMh1fDGFpqlX0YfePLxxCooXqoG6Dn/oFHIyqj/DLMV/1K7rq
 h2qnZdFiVZgPA5KyQl+ilp1lNfpe3aoVhWBLeXjw1gRzubLHmgPUi2vdUDup8NSpt31X
 KH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDLa7n/zN17cmLnBWe5rmnJ44HQUR2mq7sgSsOR9wmQ=;
 b=UnhOoQ/aws+/JA0bfxfHg46gMB8P0kD5eoWhT6qMzIzn+N0I+fUZK5+HXmUCM/S7Im
 /t6tAKSGrUvU5K+EZXyjof4Qxm6y6gzPfsiHbmmbBfjCrS9xinslCTIytiI7Kj5wWQ6z
 QU2Qt6sH8qbhcilohUDnbxAtugvfqI5fgbSUHqOQoW8kfNiqz+zA5Bw8GSLSHxnu+ERs
 gMXbX750wU6KRBagS5yRvRHQ0dfzRb44coD7zZyQOWU6TN+UgthKTm63aqdYbuVQaTuv
 7d/4WwS4mUdzz2VIxWiTxcfdRjSZBYU/75wn2NqUdQsROcLTlNaPeecmRW99ocCrxQgo
 /YgA==
X-Gm-Message-State: ACrzQf0JzCbm95H3wMj460S55P0QU3cttrOkwdHvnkEpySaNYOaCzKqx
 6hdLpB+wu2g1KKLeUzur8UCoCA==
X-Google-Smtp-Source: AMsMyM6pCkwuNyZeLE2PWg0GkM0Qd3SUa/hL5s3wlyrqZ/2EJiybFfIAO/tFe7uOjMPAWrYNZpqoIg==
X-Received: by 2002:a5d:58ca:0:b0:236:2324:3f0f with SMTP id
 o10-20020a5d58ca000000b0023623243f0fmr5669362wrf.325.1666362806871; 
 Fri, 21 Oct 2022 07:33:26 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c1c0800b003c6b7f5567csm10531106wms.0.2022.10.21.07.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 07:33:26 -0700 (PDT)
Date: Fri, 21 Oct 2022 15:33:23 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eauger@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 7/8] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
Message-ID: <Y1Kts+K0WiHs7b8A@myrica>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-8-jean-philippe@linaro.org>
 <CAFEAcA8_mLVgvorF12qBMAW5NoZT2mXAzjfavCbDtcZjzcprow@mail.gmail.com>
 <5641321a-4bec-2ca9-bb14-d5ed883a9ded@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5641321a-4bec-2ca9-bb14-d5ed883a9ded@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Sep 27, 2022 at 04:35:25PM +0200, Eric Auger wrote:
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 2de16f6324..5e16d54bbb 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -1372,14 +1372,15 @@ static void create_smmu(const VirtMachineState *vms,
> >>
> >>  static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
> >>  {
> >> -    const char compat[] = "virtio,pci-iommu";
> >> +    const char compat[] = "virtio,pci-iommu\0pci1af4,1057";
> >>      uint16_t bdf = vms->virtio_iommu_bdf;
> > 
> > PCI_DEVICE_ID_VIRTIO_IOMMU is listed in include/hw/pci/pci.h
> > as 0x1014, so where does 1057 come from? (This is a hex value,
> > right?)
> the virtio spec states:
> The PCI Device ID is calculated by adding 0x1040 to the Virtio Device ID
> (this IOMMU device ID is 0d23 = 0x17 for the virtio-iommu device, also
> found in include/uapi/linux/virtio_ids.h) so 0x1057 above looks correct
> 
> note that in docs/specs/pci-ids.txt there are a bunch of other device
> ids not documented (virtio-mem, pmem)
> 
> What I don't get anymore is the device id in qemu include/hw/pci/pci.h

Yes 0x1057 is the right device ID, and it matches what the
virtio-iommu-pci device gets in hw/virtio/virtio-pci.c:1691.
The wrong 0x1014 value set by hw/virtio/virtio-iommu-pci.c:78 gets
overwritten since virtio-iommu is modern only. I can send a patch to
remove it.

Peter, do you mind taking this patch as well, or should I resend it?
I can't decide what to do about the other issues in this series, we may
have to live with some warnings, but this one should be OK.

Thanks,
Jean

[1] https://lore.kernel.org/qemu-devel/aec4e9d1-b70e-2e8d-6503-b3e550c6d5ea@redhat.com/

