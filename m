Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF8B6E5E67
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 12:14:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poiLl-0006AV-5L; Tue, 18 Apr 2023 06:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poiLj-0006AN-EE
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:14:11 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poiLh-0001A1-Jp
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:14:11 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94f6c285d22so132402666b.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681812848; x=1684404848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rhjLTtMg+GWMM3/9TjbqZWkMFSQML5L7F+UYiNnI7Nw=;
 b=R/Ks/j+shHxtsBDPoyEtL2pXcZsuWoD+roK8QF0o7ErH+F1V+cmM6NbMwOfi32DP6W
 +jcTpS551GQjOeTcwfYFhKx7FCCnupg1VjvJAjnEg5duEJd2QL9K1tCTl4SF03yY1qXf
 htKv6RD+pxfRl3v+d1qrUUXqphCwxPJXb14WXOFcW22sgXmE8+l5zo8bZ0oO7SFK6gW2
 sftqzkxGygnvpR22AmshQ5Qy9EIpdsNnh1npShGt3UPtU2/LNJbDypqiYDCZ+JD04ZHf
 9Fs6khDlCxMw2+Yhu2G/oReRezuG9xrDgHdhKEhVn+rHFmdGviiXh7uyOy29jErniiHq
 4ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681812848; x=1684404848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rhjLTtMg+GWMM3/9TjbqZWkMFSQML5L7F+UYiNnI7Nw=;
 b=Fm0VUIHq5BBS5RxeE/QO2qi9cxDnMIxQY9d9eg/x5ho+gPr4isTZfxVuIUAtlpk0BI
 cc4zJZugdIkVJH1dzNO2aYB7pEInw2b7Y0/spGnWFBrT6End53y3HeOEQZXb9PC6n5q/
 HnicLWxYwiLNN+4kIRERuwlHL55AwPCfF6TYtrv5HZ/JrvSNufEvSaCCM5DFb4h8+13Q
 MOx47i3izA//ANnJ1mS5uHjamFh2+E014wdx5Z/quSISPWHh6grjpGvRTHcX70j9O/cv
 443ei4eX06xX3mF5h6qIH0rc5L3YaKH0Pq3Xq3fVbaRAmMj77HJZrKvbPudVK1XDe4AC
 tY5Q==
X-Gm-Message-State: AAQBX9dZ4xttdKrqn9muaYktJwc4G2c239ds67n5uJIzOlUKSlqii06r
 rBJA6yKCOk1HpMP7rrwu1dXWQW+aO0GN7LPutq51jA==
X-Google-Smtp-Source: AKy350ZYzPdTM5PZco6FlDiv+7Shna5M1T2LZVhkYeq+gqNfymr0F2y3S79y9O34Vialsnn0jFTgWMO2DcijdDMStZ8=
X-Received: by 2002:a50:d0c9:0:b0:4fc:fc86:5f76 with SMTP id
 g9-20020a50d0c9000000b004fcfc865f76mr953170edf.6.1681812848180; Tue, 18 Apr
 2023 03:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230413110019.48922-1-zhenzhong.duan@intel.com>
In-Reply-To: <20230413110019.48922-1-zhenzhong.duan@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 11:13:57 +0100
Message-ID: <CAFEAcA9VsB7+yXG6XiyRAJ4TaUJVFAu4h-rT9ZN=+o5fu0S2cw@mail.gmail.com>
Subject: Re: [PATCH v3] memory: Optimize replay of guest mapping
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, peterx@redhat.com, 
 jasowang@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com, 
 richard.henderson@linaro.org, eduardo@habkost.net, david@redhat.com, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 13 Apr 2023 at 12:12, Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:
>
> On x86, there are two notifiers registered due to vtd-ir memory
> region splitting the entire address space. During replay of the
> address space for each notifier, the whole address space is
> scanned which is unnecessary. We only need to scan the space
> belong to notifier monitored space.
>
> While on x86 IOMMU memory region spans over entire address space,
> but on some other platforms(e.g. arm mps3-an547), IOMMU memory
> region is only a window in the whole address space. user could
> register a notifier with arbitrary scope beyond IOMMU memory
> region. Though in current implementation replay is only triggered
> by VFIO and dirty page sync with notifiers derived from memory
> region section, but this isn't guaranteed in the future.
>
> So, we replay the intersection part of IOMMU memory region and
> IOMMU notifier in memory_region_iommu_replay().
>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
> v3: Fix assert failure on mps3-an547
> v2: Add an assert per Peter
> Tested on x86 with a net card passed to guest(kvm/tcg), ping/ssh pass.
> Also did simple bootup test with mps3-an547
>
>  hw/i386/intel_iommu.c | 2 +-
>  softmmu/memory.c      | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index a62896759c78..faade7def867 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3850,7 +3850,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>                  .domain_id = vtd_get_domain_id(s, &ce, vtd_as->pasid),
>              };
>
> -            vtd_page_walk(s, &ce, 0, ~0ULL, &info, vtd_as->pasid);
> +            vtd_page_walk(s, &ce, n->start, n->end, &info, vtd_as->pasid);
>          }
>      } else {
>          trace_vtd_replay_ce_invalid(bus_n, PCI_SLOT(vtd_as->devfn),
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index b1a6cae6f583..f7af691991de 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1925,7 +1925,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>  {
>      MemoryRegion *mr = MEMORY_REGION(iommu_mr);
>      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> -    hwaddr addr, granularity;
> +    hwaddr addr, end, granularity;
>      IOMMUTLBEntry iotlb;
>
>      /* If the IOMMU has its own replay callback, override */
> @@ -1935,8 +1935,9 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>      }
>
>      granularity = memory_region_iommu_get_min_page_size(iommu_mr);
> +    end = MIN(n->end, memory_region_size(mr));
>
> -    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
> +    for (addr = n->start; addr < end; addr += granularity) {
>          iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
>          if (iotlb.perm != IOMMU_NONE) {
>              n->notify(n, &iotlb);


The documentation for the replay method of IOMMUMemoryRegionClass
says:
     * The default implementation of memory_region_iommu_replay() is to
     * call the IOMMU translate method for every page in the address space
     * with flag == IOMMU_NONE and then call the notifier if translate
     * returns a valid mapping. If this method is implemented then it
     * overrides the default behaviour, and must provide the full semantics
     * of memory_region_iommu_replay(), by calling @notifier for every
     * translation present in the IOMMU.

This commit changes the default implementation so it's no longer
doing this for every page in the address space. If the change is
correct, we should update the doc comment too.

Oddly, the doc comment for memory_region_iommu_replay() itself
doesn't very clearly state what its semantics are; it could
probably be improved.

Anyway, this change is OK for the TCG use of iommu notifiers,
because that doesn't care about replay.

thanks
-- PMM

