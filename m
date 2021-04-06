Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE60355097
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 12:12:13 +0200 (CEST)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTigu-0001Y2-8A
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 06:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTifV-0000g6-QQ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTifP-0004Cn-EG
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617703837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usulfOE0AzadG2EB/NS+SRJi/oO/areE8EYPHgELqrY=;
 b=c/UBhEtU7YK2HB43PFcHeGa5NwTtoSHoOgA5co+f90SzjHNXW8k1xXYZbRsprXcCG6rd0N
 rzQSV0pRGl8iBr7qDr0vzLdvPdFg18iUjo5dp5CrzhcRyksBO9t9fycaXpuIV1EtUUXqHB
 S1ys3hCo0/+pvvGKw7oKE2pc/vtss3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-5PsT0Gt0ORCwHr--Z3m7Iw-1; Tue, 06 Apr 2021 06:10:33 -0400
X-MC-Unique: 5PsT0Gt0ORCwHr--Z3m7Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1CF0802B40;
 Tue,  6 Apr 2021 10:10:31 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D219E19C45;
 Tue,  6 Apr 2021 10:10:29 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@broadcom.com,
 shannon.zhaosl@gmail.com
References: <20210402084731.93-1-yuzenghui@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
Date: Tue, 6 Apr 2021 12:10:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210402084731.93-1-yuzenghui@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zenghui,

On 4/2/21 10:47 AM, Zenghui Yu wrote:
> The GSIV values in SMMUv3 IORT node are not correct as they don't match
> the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
> our emulated vSMMU.
> 
> Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
>  hw/arm/virt-acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f5a2b2d4cb..60fe2e65a7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -292,8 +292,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
>          smmu->event_gsiv = cpu_to_le32(irq);
>          smmu->pri_gsiv = cpu_to_le32(irq + 1);
> -        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
> -        smmu->sync_gsiv = cpu_to_le32(irq + 3);
> +        smmu->sync_gsiv = cpu_to_le32(irq + 2);
> +        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
>  
>          /* Identity RID mapping covering the whole input RID range */
>          idmap = &smmu->id_mapping_array[0];
> 


