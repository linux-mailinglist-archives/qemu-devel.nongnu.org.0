Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F49576103
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:59:37 +0200 (CEST)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJyq-0008Nh-5I
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oCJwr-0005mT-0R
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oCJwm-0005d2-QA
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657886247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6R4doAtW69Sgbq+hj6HKp+RBbejN+rZqBF340Nb4b8=;
 b=JOwuz9MLj01cCqR/bTVsK4d6hbwlveWLTW3LPN9v3mrR+9M9wZDPldsFx2As+PfSJVvKlC
 LvUd2GEcQuA5tM9V+uPm2SakGlq0yHMWL6HGsT/GH2loVyDPxgszR/FN1fD7ZT5di+4STo
 FL29ehVpNADlAfVZq8zJbSlOSmZCngk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-AtSyL3FXNX2gTgC7sgvWRQ-1; Fri, 15 Jul 2022 07:57:24 -0400
X-MC-Unique: AtSyL3FXNX2gTgC7sgvWRQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 w15-20020a056402268f00b0043ac600a6bcso3294986edd.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W6R4doAtW69Sgbq+hj6HKp+RBbejN+rZqBF340Nb4b8=;
 b=WJ8k6PuF5Ir/UcgGjnzj6lf5SEeot5WW2FC8NHwVtAq8fVvN1yalBW0ludO9YIQg/y
 0prfTKXXoiIKBlPCn2jlab0LrG1jz2RrXqS8T/36Oqu9YUhj7AybAkG1ZkKV3YUIS5t4
 qf+RqOPrtn81Jedlp9OQYihbyoBDfH+Jc7i5ITQ8b9DcSAexgwOezkNWmh+hMk7J0iBO
 5fv9/qR7RZj+wacsU9OpLaof6sT6IMyyY9bPL3ArSCuGfwIEh9F2vx7YxVoF24nwpo+K
 uZVU/jFeafo2ZvmCIiwfOd7j+tGZ1koN/G2b4JQ0CokdJrXvYvwKsBMiiS3+Gc7w3wJ+
 lXJA==
X-Gm-Message-State: AJIora/CbDk6Y5vBIRxTgll0ZNSN4c1M3iZEs55y10yGvGQFW8iy9ot0
 BhrIloFobyAV0mPxTKX0+fCupYgpso1ro4mqVd8CUDdOuY9Kn0XYxsjs/tvD778x57K6AkQQC1r
 7Os3QXXNqj3po4kc=
X-Received: by 2002:a17:906:8478:b0:72b:4f81:29d8 with SMTP id
 hx24-20020a170906847800b0072b4f8129d8mr13337302ejc.179.1657886243402; 
 Fri, 15 Jul 2022 04:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vCYNRUZgzhWb6ghEjHHs6NFTkrVdN5anuV3bZKvL7Bb1mDjYeEGfx2wgw3pkViU2G+qSBWEA==
X-Received: by 2002:a17:906:8478:b0:72b:4f81:29d8 with SMTP id
 hx24-20020a170906847800b0072b4f8129d8mr13337270ejc.179.1657886243051; 
 Fri, 15 Jul 2022 04:57:23 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a17090631cf00b0072a66960843sm1271783ejf.51.2022.07.15.04.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:57:22 -0700 (PDT)
Date: Fri, 15 Jul 2022 13:57:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v7 09/10] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220715135721.491f754e@redhat.com>
In-Reply-To: <20220714182820.30970-10-joao.m.martins@oracle.com>
References: <20220714182820.30970-1-joao.m.martins@oracle.com>
 <20220714182820.30970-10-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 14 Jul 2022 19:28:19 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> It is assumed that the whole GPA space is available to be DMA
> addressable, within a given address space limit, except for a
> tiny region before the 4G. Since Linux v5.4, VFIO validates
> whether the selected GPA is indeed valid i.e. not reserved by
> IOMMU on behalf of some specific devices or platform-defined
> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>  -EINVAL.
> 
> AMD systems with an IOMMU are examples of such platforms and
> particularly may only have these ranges as allowed:
> 
> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
> 
> We already account for the 4G hole, albeit if the guest is big
> enough we will fail to allocate a guest with  >1010G due to the
> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
> 
> [*] there is another reserved region unrelated to HT that exists
> in the 256T boundary in Fam 17h according to Errata #1286,
> documeted also in "Open-Source Register Reference for AMD Family
> 17h Processors (PUB)"
> 
> When creating the region above 4G, take into account that on AMD
> platforms the HyperTransport range is reserved and hence it
> cannot be used either as GPAs. On those cases rather than
> establishing the start of ram-above-4g to be 4G, relocate instead
> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
> Topology", for more information on the underlying restriction of
> IOVAs.
> 
> After accounting for the 1Tb hole on AMD hosts, mtree should
> look like:
> 
> 0000000000000000-000000007fffffff (prio 0, i/o):
> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
> 0000010000000000-000001ff7fffffff (prio 0, i/o):
> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
> 
> If the relocation is done or the address space covers it, we
> also add the the reserved HT e820 range as reserved.
> 
> Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> ram-above-4g relocation may be desired and the CPU wasn't configured
> with a big enough phys-bits, print an error message to the user
> and do not make the relocation of the above-4g-region if phys-bits
> is too low.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index cda435e3baeb..17613974163e 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -880,6 +880,52 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>      return start;
>  }
>  
> +static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
> +{
> +    X86CPU *cpu = X86_CPU(first_cpu);
> +
> +    /* 32-bit systems don't have hole64 thus return max CPU address */
> +    if (cpu->phys_bits <= 32) {
> +        return ((hwaddr)1 << cpu->phys_bits) - 1;
> +    }
> +
> +    return pc_pci_hole64_start() + pci_hole64_size - 1;
> +}
> +
[...]

> +
> +    /*
> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
> +     * So make sure phys-bits is required to be appropriately sized in order
> +     * to proceed with the above-4g-region relocation and thus boot.

drop mention of relocation here as it's orthogonal to the check.
Important thing we are checking here is that max used GPA is
reachable by configured vCPU (physbits).

> +     */
> +    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
> +    maxphysaddr = ((hwaddr)1 << cpu->phys_bits) - 1;
> +    if (maxphysaddr < maxusedaddr) {
> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
> +                     " phys-bits too low (%u)",
> +                     maxphysaddr, maxusedaddr, cpu->phys_bits);
> +        exit(EXIT_FAILURE);
> +    }

these hunks should be a separate patch preceding relocation patch
as it basically does max_gpa vs physbits check regardless
of relocation (i.e. relocation is only one of the reasons
max_used_gpa might exceed physbits).

> +
>      /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.


