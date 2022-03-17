Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0E4DBDC7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 05:41:18 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUhwr-00023F-3o
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 00:41:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nUhuY-0001MG-LE
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 00:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nUhuV-0007DD-OR
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 00:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647491930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ltyrwNjMOqy58XbBpqiCfjfrdSYIxpLikMSQ69OFOuo=;
 b=TeNcg0Ue44Z7WnyjE5EK7W+sS5tHEeo7txPWaFs7gmUn2Vo5Z4Rh9qeCirD/c+eCgMxOnp
 PtZze+yyw9/1MJnDaH3z+CIzQSE9bqc/LNub+Q8m0AfMql0rpsxiAt9FK18EESn/quMbuk
 WhLgHfCv21vM4aSYUiDmXUWMXeLnVug=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-6djkW6YTNHyHfibjVXQR8A-1; Thu, 17 Mar 2022 00:38:48 -0400
X-MC-Unique: 6djkW6YTNHyHfibjVXQR8A-1
Received: by mail-lj1-f199.google.com with SMTP id
 20-20020a2e0914000000b0024635d136ddso1657707ljj.22
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 21:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltyrwNjMOqy58XbBpqiCfjfrdSYIxpLikMSQ69OFOuo=;
 b=uksZjs1k3XhH/Ebfb27Sa+2nYXkhs4DV74+Tgfs2p1jyfdSvJm4RtQ+PYbIvSLxoPH
 dTMcDONFg+zy/psGWsGvSVo54q4DGFPD/A27ajohf/oSiDa2EO4HWq+f/9qhSkZe+T/c
 U7QoOamFRuwuXb8fiLFbxqmgMTGTeuumkf1ZSDA4j07FiJ1PsOZ6zovzr/K1x4p8w82r
 hKFmPXTgVTj7aby5y1RFXpCb+rZuDQwFZhsa0y+liFBLsdnUczSKvHx7FAeBXRux+TBU
 h+mtgBF1jkQ9le1LT/kih0AEoUmQ15MFKkTPFk9FWEG1ZXRUmcNaD3In8kDq+mlWh0LS
 kEHQ==
X-Gm-Message-State: AOAM531zkCB1LdYRfQturWg9hS56UQ+26RoRAjbPG/Nuzze8+dbBIJsy
 bAMBaSEAVWc7Zp044pl3Io/0a4UwaT1A4mJUz0vn2xizKwK5pQLxkDkULl1ery7iRoyz2H4zjDW
 E7Akan5bT3vJ9TJlRWmdLhp38AJgttL4=
X-Received: by 2002:a05:651c:b23:b0:247:ee17:e9ed with SMTP id
 b35-20020a05651c0b2300b00247ee17e9edmr1708061ljr.243.1647491927331; 
 Wed, 16 Mar 2022 21:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHHGTBibpeY/3uVf3SojEHwbwSyfF4iqAhH1MnaZIkP3vXnhMSt3jUJ1a0Q3yI9rkdSlpEOr9yfO4umUBgXx4=
X-Received: by 2002:a05:651c:b23:b0:247:ee17:e9ed with SMTP id
 b35-20020a05651c0b2300b00247ee17e9edmr1708053ljr.243.1647491927028; Wed, 16
 Mar 2022 21:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220210092815.45174-1-jasowang@redhat.com>
In-Reply-To: <20220210092815.45174-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Mar 2022 12:38:35 +0800
Message-ID: <CACGkMEtv3uZ6-K=E_=74EHLtRN0yBGO6WhL8MzSRvf+YB8+aDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] intel-iommu: remove VTD_FR_RESERVED_ERR
To: mst <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HI Michael:

Want to take this series?

Thanks

On Thu, Feb 10, 2022 at 5:28 PM Jason Wang <jasowang@redhat.com> wrote:
>
> This fault reason is not used and is duplicated with SPT.2 condition
> code. So let's remove it.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c          | 6 ------
>  hw/i386/intel_iommu_internal.h | 5 -----
>  2 files changed, 11 deletions(-)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 5b865ac08c..55281ee1b4 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -469,11 +469,6 @@ static void vtd_report_dmar_fault(IntelIOMMUState *s, uint16_t source_id,
>
>      assert(fault < VTD_FR_MAX);
>
> -    if (fault == VTD_FR_RESERVED_ERR) {
> -        /* This is not a normal fault reason case. Drop it. */
> -        return;
> -    }
> -
>      trace_vtd_dmar_fault(source_id, fault, addr, is_write);
>
>      if (fsts_reg & VTD_FSTS_PFO) {
> @@ -1629,7 +1624,6 @@ static const bool vtd_qualified_faults[] = {
>      [VTD_FR_PAGING_ENTRY_RSVD] = true,
>      [VTD_FR_CONTEXT_ENTRY_TT] = true,
>      [VTD_FR_PASID_TABLE_INV] = false,
> -    [VTD_FR_RESERVED_ERR] = false,
>      [VTD_FR_MAX] = false,
>  };
>
> diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
> index a6c788049b..d0bb43ae87 100644
> --- a/hw/i386/intel_iommu_internal.h
> +++ b/hw/i386/intel_iommu_internal.h
> @@ -303,11 +303,6 @@ typedef enum VTDFaultReason {
>
>      VTD_FR_PASID_TABLE_INV = 0x58,  /*Invalid PASID table entry */
>
> -    /* This is not a normal fault reason. We use this to indicate some faults
> -     * that are not referenced by the VT-d specification.
> -     * Fault event with such reason should not be recorded.
> -     */
> -    VTD_FR_RESERVED_ERR,
>      VTD_FR_MAX,                 /* Guard */
>  } VTDFaultReason;
>
> --
> 2.25.1
>


