Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C960432A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 13:29:09 +0200 (CEST)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol7G0-0005xQ-Af
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 07:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ol7Bc-0001zh-Fk
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 07:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ol7BP-0003mZ-Eb
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 07:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666178660;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3R4Mgf/XcoN7txDeA7+iuUegJ1KgeAAPBmMvX7O+xk=;
 b=fPp4U3i5wyK5Ahv3Rif/nOOIaaX8KEw4SvG1SjycCen/Cpvw8LX0iJJqulIzbKmfNEGDFV
 Fa+PJeSuVZY6ku6vcOvCIuqSSk5rm8PxwBRm/WWTahGabzpVBuhWFE8FH52cAmu2cSK5/w
 w9yOU1LznyDjDGGnXlArHgLA32CNcOg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-1JqARNxjOeGcAAbyWweVwA-1; Wed, 19 Oct 2022 07:24:19 -0400
X-MC-Unique: 1JqARNxjOeGcAAbyWweVwA-1
Received: by mail-qk1-f197.google.com with SMTP id
 u6-20020a05620a430600b006e47fa02576so14708868qko.22
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 04:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3R4Mgf/XcoN7txDeA7+iuUegJ1KgeAAPBmMvX7O+xk=;
 b=pb48DZQN8goT/5jWCI5Q5fcS/ClC3Ko3Jfzkj+vJhY7k1K+OmWfhcSXmUZo8V9Im8Q
 VUu/in3Z0ZoWI8rV7jda77R/ni09G3dPzv7vkhYb/Wh9UWwjtetZzi0AnX7EH3g1kgZk
 sh8lbLOFsCL8N8GFGbLD4zu8DnuFcMa4p/aA9yXQB4rTauhn/LanLew7MZkbDEAg4zb8
 43PwUk1+ZYfxIJYCFPnY3RUxsY6RE3vOt817/EW4Du1luvAm/7PrAqJ36kUdGwFwKv3r
 LwFGmCvNRfyEQbrwAzLGiXW5Wjr1w1TdF9VLKel9LHZ4YhSkTmz7iQDfm8WQ9DrZGK11
 3hgQ==
X-Gm-Message-State: ACrzQf3z3q7PtfiUhxl2FTk5IHRGV4vTQ0YC6eetmvlmoQp9iwSXIzoN
 AO+TYTN2oQNj967lp2e6fWoYKPgG+9XY+KiBqbQCtd3kiJITZljpEG72w6Zhf564/9e/iXXukKV
 JP9BTGg5JPBU0H2Y=
X-Received: by 2002:a05:620a:2a16:b0:6ee:d149:9fbb with SMTP id
 o22-20020a05620a2a1600b006eed1499fbbmr5048770qkp.195.1666178658655; 
 Wed, 19 Oct 2022 04:24:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4J0mt8QYtRKbjLn5HUfeanwTZIcvdekOnncE5GVO/ecHXPQqbc/rw2s+ZvCMKFFogpJK4TAA==
X-Received: by 2002:a05:620a:2a16:b0:6ee:d149:9fbb with SMTP id
 o22-20020a05620a2a1600b006eed1499fbbmr5048760qkp.195.1666178658400; 
 Wed, 19 Oct 2022 04:24:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ay40-20020a05620a17a800b006bb78d095c5sm4519956qkb.79.2022.10.19.04.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 04:24:17 -0700 (PDT)
Message-ID: <98df60ec-be6d-84aa-d2bd-3bb2ebf0d1a5@redhat.com>
Date: Wed, 19 Oct 2022 13:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86-iommu: Fail flag registration of DEVIOTLB if DT not
 supported
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>
References: <20221018215407.363986-1-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221018215407.363986-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 10/18/22 23:54, Peter Xu wrote:
> All x86 IOMMUs need to fail DEVIOTLB notification registrations if DT is
> not supported.  Otherwise any device (e.g. vhost) can register with
> DEVIOTLB but it'll never receive the notifications, causing device not
> operational.
>
> Fixes: b68ba1ca57 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP IOMMUTLBNotificationType")
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/i386/amd_iommu.c   | 8 ++++++++
>  hw/i386/intel_iommu.c | 7 +++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 725f69095b..42486e790f 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1476,6 +1476,7 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                                             Error **errp)
>  {
>      AMDVIAddressSpace *as = container_of(iommu, AMDVIAddressSpace, iommu);
> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(as->iommu_state);
>  
>      if (new & IOMMU_NOTIFIER_MAP) {
>          error_setg(errp,
> @@ -1484,6 +1485,13 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                     PCI_FUNC(as->devfn));
>          return -EINVAL;
>      }
> +
> +    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "Device-iotlb not declared support for vIOMMU");
with current vhost code, vhost will then silently fallbac to UNMAP
notifier registration and this will succeed. It would be nice to clarify
whether the vIOMMU works with vhost in this downgraded mode (at least
ats=off and device-ioltb=off)?

Thanks

Eric
> +        return -ENOTSUP;
> +    }
> +
>      return 0;
>  }
>  
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6524c2ee32..a07d9631b0 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3057,6 +3057,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>  {
>      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
>      IntelIOMMUState *s = vtd_as->iommu_state;
> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
>  
>      /* TODO: add support for VFIO and vhost users */
>      if (s->snoop_control) {
> @@ -3065,6 +3066,12 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>          return -ENOTSUP;
>      }
>  
> +    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "Device-iotlb not declared support for vIOMMU");
> +        return -ENOTSUP;
> +    }
> +
>      /* Update per-address-space notifier flags */
>      vtd_as->notifier_flags = new;
>  


