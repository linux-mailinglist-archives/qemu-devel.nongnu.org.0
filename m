Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D82B6C69
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 19:00:42 +0100 (CET)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5HV-0007KJ-H5
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 13:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf5GM-0006Ya-7g
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:59:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf5GH-0006RB-N1
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605635964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZ9mqzTVql8lYB1Dkzox1yNygwogWWAQN+lQ5aUnt9k=;
 b=HGAIgITcabSQTwJrF9mQ2aqusv2kH8NZmjRc4Lzlclq9EyORHoxKwhpODJg5bZUcmoccBu
 VWp0A/aKbAzNXBA3HDgl4a27guy7sPnDdr0t4uBReLW/mUN9cnGvZldcAT2DVaqEIFGCwo
 9Tb5NeHRI7ot1eU/Oy3Lk6mH4qGlbbY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-OIS8u0XhOkSK3ZXm-2V_Cg-1; Tue, 17 Nov 2020 12:59:23 -0500
X-MC-Unique: OIS8u0XhOkSK3ZXm-2V_Cg-1
Received: by mail-wm1-f71.google.com with SMTP id y1so2117462wma.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rZ9mqzTVql8lYB1Dkzox1yNygwogWWAQN+lQ5aUnt9k=;
 b=X7Zic9xHdjQiDmASOCcsc4Ky+gr8c1Y+OMb0lUTXN4ypeBrAsaSVEVq9pl3zq9xXu1
 0sCHfdpLprZthSclFlqZYSyZUqgytv/buhFCWd8OQUQ58DUkggPjSbhJ/QCq/kNBmOJy
 dBsJa36KZ9nGl/TqjQjZIsj/nv2PlP/M2LPdqyZln+jDJQXd0bN2ye83MJYds7nIuA8f
 6c8c7IGs5j/CeodXeohFqMqEAAKrBQwChIYqxJjosuaYaLF5Dlgbay1X7dFGpXk9TMuD
 qJxmlD6Ne/V5xuLxfTyDF2mUEa9GyCYCaB+ReN4hIk1OLsVv7GUIEMxJixCp7ZxDuaeg
 GZ0g==
X-Gm-Message-State: AOAM531PU9QaR1d0fZtlb0qS2QmyQF6S3Z4ms8oJJcghDKDmD26i+bLI
 nRluw8AbPGTPl5YcW70EPrsqkXPc/aYUkQ2kYdk/WkxxzuiFDvQvdpo0ZHFlZYrMmO95nEM/TvR
 MOTJNFQTUQfuDABQ=
X-Received: by 2002:adf:e992:: with SMTP id h18mr742741wrm.356.1605635961439; 
 Tue, 17 Nov 2020 09:59:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYwni3lt0snUs0YyOrPRE18gwdzxVSHlSs/eLoWIjfZF/rtthIFOHEiPyM0fiz9MNzMipe6A==
X-Received: by 2002:adf:e992:: with SMTP id h18mr742718wrm.356.1605635961207; 
 Tue, 17 Nov 2020 09:59:21 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k20sm4579897wmi.15.2020.11.17.09.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 09:59:20 -0800 (PST)
Subject: Re: [PATCH for-5.2] s390x/pci: fix endianness issues
To: Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20201117171340.1289659-1-cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ba7c8139-aa2b-1887-270f-834e47e6de10@redhat.com>
Date: Tue, 17 Nov 2020 18:59:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117171340.1289659-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 6:13 PM, Cornelia Huck wrote:
> zPCI control blocks are big endian, we need to take care that we
> do proper accesses in order not to break tcg guests on little endian
> hosts.
> 
> Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Works for me with virtio-pci devices for tcg on x86 and s390x, and for kvm.
> The vfio changes are not strictly needed; did not test them due to lack of
> hardware -- testing appreciated.
> 
> As this fixes a regression, I want this in 5.2.
> 
> ---
>  hw/s390x/s390-pci-bus.c  | 12 ++++++------
>  hw/s390x/s390-pci-inst.c |  4 ++--
>  hw/s390x/s390-pci-vfio.c |  8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index e0dc20ce4a56..17e64e0b1200 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -787,12 +787,12 @@ static void s390_pci_init_default_group(void)
>  
>  static void set_pbdev_info(S390PCIBusDevice *pbdev)
>  {
> -    pbdev->zpci_fn.sdma = ZPCI_SDMA_ADDR;
> -    pbdev->zpci_fn.edma = ZPCI_EDMA_ADDR;
> -    pbdev->zpci_fn.pchid = 0;
> +    stq_p(&pbdev->zpci_fn.sdma, ZPCI_SDMA_ADDR);

"zPCI control blocks are big endian" so don't we
need the _be_ accessors? stq_be_p() etc...

> +    stq_p(&pbdev->zpci_fn.edma, ZPCI_EDMA_ADDR);
> +    stw_p(&pbdev->zpci_fn.pchid, 0);
>      pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
> -    pbdev->zpci_fn.fid = pbdev->fid;
> -    pbdev->zpci_fn.uid = pbdev->uid;
> +    stl_p(&pbdev->zpci_fn.fid, pbdev->fid);
> +    stl_p(&pbdev->zpci_fn.uid, pbdev->uid);
>      pbdev->pci_group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
>  }
>  
> @@ -871,7 +871,7 @@ static int s390_pci_msix_init(S390PCIBusDevice *pbdev)
>      memory_region_init_io(&pbdev->msix_notify_mr, OBJECT(pbdev),
>                            &s390_msi_ctrl_ops, pbdev, name, PAGE_SIZE);
>      memory_region_add_subregion(&pbdev->iommu->mr,
> -                                pbdev->pci_group->zpci_group.msia,
> +                                ldq_p(&pbdev->pci_group->zpci_group.msia),
>                                  &pbdev->msix_notify_mr);
>      g_free(name);
>  
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 58cd041d17fb..7bc6b79f10ce 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>          ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
>          S390PCIGroup *group;
>  
> -        group = s390_group_find(reqgrp->g);
> +        group = s390_group_find(ldl_p(&reqgrp->g));
>          if (!group) {
>              /* We do not allow access to unknown groups */
>              /* The group must have been obtained with a vfio device */
> @@ -788,7 +788,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>      /* Length must be greater than 8, a multiple of 8 */
>      /* and not greater than maxstbl */
>      if ((len <= 8) || (len % 8) ||
> -        (len > pbdev->pci_group->zpci_group.maxstbl)) {
> +        (len > lduw_p(&pbdev->pci_group->zpci_group.maxstbl))) {
>          goto specification_error;
>      }
>      /* Do not cross a 4K-byte boundary */
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index d5c78063b5bc..f455c6f20a1a 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -116,10 +116,10 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
>      }
>      cap = (void *) hdr;
>  
> -    pbdev->zpci_fn.sdma = cap->start_dma;
> -    pbdev->zpci_fn.edma = cap->end_dma;
> -    pbdev->zpci_fn.pchid = cap->pchid;
> -    pbdev->zpci_fn.vfn = cap->vfn;
> +    stq_p(&pbdev->zpci_fn.sdma, cap->start_dma);
> +    stq_p(&pbdev->zpci_fn.edma, cap->end_dma);
> +    stw_p(&pbdev->zpci_fn.pchid, cap->pchid);
> +    stw_p(&pbdev->zpci_fn.vfn, cap->vfn);
>      pbdev->zpci_fn.pfgid = cap->gid;
>      /* The following values remain 0 until we support other FMB formats */
>      pbdev->zpci_fn.fmbl = 0;
> 


