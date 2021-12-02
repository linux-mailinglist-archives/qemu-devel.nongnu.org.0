Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF41465D28
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 04:51:40 +0100 (CET)
Received: from localhost ([::1]:49928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msd8F-0005Ve-6P
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 22:51:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1msd6Q-0004hH-Km
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 22:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1msd6K-0002Kv-NU
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 22:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638416979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UcinAcNTDJIpfnjmgToppoeZWhPQpkMhC+JnBQlQxrw=;
 b=GcB3X/q+cZEKrZZsPjNhojkI6z3jE7/1aYJ7X8Yd/AIKQxbx46enKt/jRAQibaht+5N4aO
 i9xcpw8haHMZcCliKOA6aSlytKeY+kxSAvb7qeUieYSDV9YCwYeSx8MBKWKs0bJb7Obpsh
 48d4GDU1OzKWCk6aYLdVvcmrB6hdHUU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-I-3jQpGtNB63LQHkTC7R6w-1; Wed, 01 Dec 2021 22:49:38 -0500
X-MC-Unique: I-3jQpGtNB63LQHkTC7R6w-1
Received: by mail-lf1-f70.google.com with SMTP id
 m2-20020a056512014200b0041042b64791so10622645lfo.6
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 19:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UcinAcNTDJIpfnjmgToppoeZWhPQpkMhC+JnBQlQxrw=;
 b=pBorY8TQzK6LMr7+Q2OV2Q2MfAA+5MZ4W1vQr5pli7AnoXgKVJ6I+I5g9wsPc8MMpJ
 jPSZ+Juzj2eKp68+ehSnCWx/kK1jBlWTjSdgq7L1Zjpo8/IFIH1AOU4+PMbV3aIxXvP+
 51WMdEF+UjGhBmx6VFpixV7/fWreRY8cm0Wyrrh6sCaw/T20IztZxZIDnLGHRwdDJAeS
 y8UqeUoNl06vpZwTYTqF7gb5PlCW/GATxbv4SKYW2HdcIEcsa8FuS08x0bgDGnG0dl2s
 XjGe+DfjBI3IXKVhTO7Foryj3JY60QJfCLjRlpimdWwVZ1bP6PCLa5lfbJ3Wm49n+Gi3
 x7jA==
X-Gm-Message-State: AOAM533e6rW0xTmdjD+FbE29gm7259wYvaVMFQrJ3RVdS7RV8GcuZ/62
 /uvKNPzMs/rq0gUUdRmB/rYWF6bktmTx2hmbaySImWgsmnsRoQSHBbtsTesT6gTZdjMgS/GeJgT
 kFuhM4l2+GwznfOKy8c/khkVWRBZXnMg=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr9663249lfr.348.1638416976603; 
 Wed, 01 Dec 2021 19:49:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzukDxCfsXJkLcByuSdLsR4O5CEVZS4yTMio2r0U+SI8J+NboVA5UNL/E3wHjrO8WlegH4zx8BzxEygbK1xnWc=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr9663219lfr.348.1638416976335; 
 Wed, 01 Dec 2021 19:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20211201205113.57299-1-dwmw2@infradead.org>
In-Reply-To: <20211201205113.57299-1-dwmw2@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Dec 2021 11:49:25 +0800
Message-ID: <CACGkMEuhnUZuKa-u1MDudmnLrwXO=B5WSp-siAC-UpUONey8xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] intel_iommu: Support IR-only mode without DMA
 translation
To: David Woodhouse <dwmw2@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Dec 2, 2021 at 4:55 AM David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> By setting none of the SAGAW bits we can indicate to a guest that DMA
> translation isn't supported. Tested by booting Windows 10, as well as
> Linux guests with the fix at https://git.kernel.org/torvalds/c/c40aaaac10
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hw/i386/intel_iommu.c         | 14 ++++++++++----
>  include/hw/i386/intel_iommu.h |  1 +
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 294499ee20..ffc852d110 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2202,7 +2202,7 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
>      uint32_t changed = status ^ val;
>
>      trace_vtd_reg_write_gcmd(status, val);
> -    if (changed & VTD_GCMD_TE) {
> +    if ((changed & VTD_GCMD_TE) && s->dma_translation) {
>          /* Translation enable/disable */
>          vtd_handle_gcmd_te(s, val & VTD_GCMD_TE);
>      }
> @@ -3100,6 +3100,7 @@ static Property vtd_properties[] = {
>      DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
>      DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
>      DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
> +    DEFINE_PROP_BOOL("dma-translation", IntelIOMMUState, dma_translation, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -3605,12 +3606,17 @@ static void vtd_init(IntelIOMMUState *s)
>      s->next_frcd_reg = 0;
>      s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
>               VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
> -             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
> +             VTD_CAP_MGAW(s->aw_bits);
>      if (s->dma_drain) {
>          s->cap |= VTD_CAP_DRAIN;
>      }
> -    if (s->aw_bits == VTD_HOST_AW_48BIT) {
> -        s->cap |= VTD_CAP_SAGAW_48bit;
> +    if (s->dma_translation) {
> +            if (s->aw_bits >= VTD_HOST_AW_39BIT) {
> +                    s->cap |= VTD_CAP_SAGAW_39bit;
> +            }
> +            if (s->aw_bits >= VTD_HOST_AW_48BIT) {
> +                    s->cap |= VTD_CAP_SAGAW_48bit;
> +            }
>      }

Just wonder if this is the hardware behaviour as I see 0 is reserved
for SAGAW in vtd 3.3 spec.

Thanks

>      s->ecap = VTD_ECAP_QI | VTD_ECAP_IRO;
>
> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> index 41783ee46d..42d6a6a636 100644
> --- a/include/hw/i386/intel_iommu.h
> +++ b/include/hw/i386/intel_iommu.h
> @@ -266,6 +266,7 @@ struct IntelIOMMUState {
>      bool buggy_eim;                 /* Force buggy EIM unless eim=off */
>      uint8_t aw_bits;                /* Host/IOVA address width (in bits) */
>      bool dma_drain;                 /* Whether DMA r/w draining enabled */
> +    bool dma_translation;           /* Whether DMA translation supported */
>
>      /*
>       * Protects IOMMU states in general.  Currently it protects the
> --
> 2.31.1
>
>


