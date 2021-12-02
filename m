Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833D465D2F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 04:55:58 +0100 (CET)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msdCP-0007BH-DJ
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 22:55:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1msdAH-0006SG-38
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 22:53:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1msdAC-0005yC-Vw
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 22:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638417219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=54T8s7hF4SQLRusavIEkSUaYVbfCp/8E9uEsrGhL3Wk=;
 b=U6GAUWG/pgqsUDcZPRg+LUmkYO6rNOnZ5f+HfyMTs8HVbYn1Mj/K3gUBMfiSny4I1X6PU8
 UvOXxQ1J3QjmkNVPeORMlVYr7tP/J6fwS0Dc1p1BOrNpTpJn2bdUgaeQvOYaRrKK8+KvOI
 LY6BrMhS7wOMKnVmvAzi5ppFKuZ9qIo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-jJHHeK9lP8SvPtzAsXmTUg-1; Wed, 01 Dec 2021 22:53:38 -0500
X-MC-Unique: jJHHeK9lP8SvPtzAsXmTUg-1
Received: by mail-lf1-f72.google.com with SMTP id
 c14-20020a056512104e00b004036d17f91bso10610015lfb.17
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 19:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=54T8s7hF4SQLRusavIEkSUaYVbfCp/8E9uEsrGhL3Wk=;
 b=bpxwot9fBW9Eu49403s1EEsiQjuWkPsEpOW4JEsGvXf/IM72Uepkxa1XHzmRxDoFcv
 aPBMtBivdQ/VJudv7zHVXhTQa/AHqRtoZnRJfHxxwAehFLACeYcPW0fr4rBj/iVEg1Uq
 5Wj7sZv7HlEQSWyvOX45b8q2lRGYb0+uf1VThyfDRc5PQUPdWWcRP27nK0BMrrPIt0fy
 Al8TlxcHLN9ETQOi/bNrBFoAgtzIYZW9MoJU7xcEvBc+BqzqzFxsr60BSkde8EY4V3NJ
 YFyhTfOWIT1zmE/fD0bMXtlagE19L1KwByH/jUqercCO4sFAxNYrHXWQ6KxrEevHekbD
 5fYg==
X-Gm-Message-State: AOAM531K8LUc801eY3Vcgnw0VpM1rWiHY0HHql+hYBJUWnt9ttBv+OU/
 N0/KkPFRkkzOBbKJw83Pmre/wJ528W4Ci6XXLs/FfdUU5TooCwBqhjApU/s+5FjELzXcorlHJQt
 TzRdOR4T4y5441r/PuI0hnPMRYxgyG7U=
X-Received: by 2002:a05:6512:3990:: with SMTP id
 j16mr9469061lfu.199.1638417217320; 
 Wed, 01 Dec 2021 19:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkZSW8d+MUrIExei10+f2AomL+32EiBy7+R4Cc+JWnnHE3gcpeR/DSEiF69Dz6fU0IdG0PWmjEOO3C/MtFPRI=
X-Received: by 2002:a05:6512:3990:: with SMTP id
 j16mr9469048lfu.199.1638417217147; 
 Wed, 01 Dec 2021 19:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20211201205113.57299-1-dwmw2@infradead.org>
 <20211201205113.57299-2-dwmw2@infradead.org>
In-Reply-To: <20211201205113.57299-2-dwmw2@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Dec 2021 11:53:25 +0800
Message-ID: <CACGkMEvtrVX8uWciiVfYpBNsaAwRAfP_P4Ja3T4Axvn47WdzNw@mail.gmail.com>
Subject: Re: [PATCH 2/2] intel_iommu: Only allow interrupt remapping to be
 enabled if it's supported
To: David Woodhouse <dwmw2@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 2, 2021 at 4:58 AM David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> We should probably check if we were meant to be exposing IR, before
> letting the guest turn the IRE bit on.

This looks correct, but it's a change of guest noticeable behaviour.
It's probably fine since we don't expect a guest that enable IR
without checking ecap.

So

Acked-by: Jason Wang <jasowang@redhat.com>

>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hw/i386/intel_iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index ffc852d110..297e1972f8 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2197,6 +2197,7 @@ static void vtd_handle_gcmd_ire(IntelIOMMUState *s, bool en)
>  /* Handle write to Global Command Register */
>  static void vtd_handle_gcmd_write(IntelIOMMUState *s)
>  {
> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
>      uint32_t status = vtd_get_long_raw(s, DMAR_GSTS_REG);
>      uint32_t val = vtd_get_long_raw(s, DMAR_GCMD_REG);
>      uint32_t changed = status ^ val;
> @@ -2218,7 +2219,8 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
>          /* Set/update the interrupt remapping root-table pointer */
>          vtd_handle_gcmd_sirtp(s);
>      }
> -    if (changed & VTD_GCMD_IRE) {
> +    if ((changed & VTD_GCMD_IRE) &&
> +        x86_iommu_ir_supported(x86_iommu)) {
>          /* Interrupt remap enable/disable */
>          vtd_handle_gcmd_ire(s, val & VTD_GCMD_IRE);
>      }
> --
> 2.31.1
>
>


