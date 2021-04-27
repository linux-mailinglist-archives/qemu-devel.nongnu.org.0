Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57C236C0CD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:30:00 +0200 (CEST)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJ6V-0006P5-Fs
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJ3s-0005Jx-Sn
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:27:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJ3q-0001Uu-D2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619512032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h02zWZVZ0wy/MS60LG8WdzUDH1c3ZTHhixBtflejkCU=;
 b=NF0q6V7umrk3Kox/2YnbVGU8PNYtCZG0zSzSz+Z1jm1GRQ31h3KMpPNynVbKFaLs4SJkjI
 v6qtnahp1xSdjlUYxsD2tD0IvBqmsFsikpr+ktEb/+oLGmZA/SqPqHpbJidWI/iN3i9SSB
 0zg/6R27/Q/W2Lc7GPhUbSmsho+85ZI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Ph1_O2etO1yKZN52gvLqVQ-1; Tue, 27 Apr 2021 04:27:10 -0400
X-MC-Unique: Ph1_O2etO1yKZN52gvLqVQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 bx15-20020a170906a1cfb029037415131f28so11062755ejb.18
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 01:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h02zWZVZ0wy/MS60LG8WdzUDH1c3ZTHhixBtflejkCU=;
 b=L5o9OO00yU36NGA6uG0BySUEDKp99rVy02no3tSuchqf+7R/PeJa6rGQHgFgZ261+F
 juvNj1DCQ4/44PVZ+fZ+3xQssHC4smW0+6ItI5ryNlsHvGGW7PIJoaAFrku6qiCpTQ9F
 IEknmV+yfSApxl3b8ZygiJZ5iB+RnWd5BmrqE2aihwOxS/JK6Ipl7NhLH3JdlXZ+C59l
 /fqDRp9cHuTjftPE0EVYs73IzhYYT7dh//e0d0CaA7PMxCdcrTuC/DCaqt1S2I/r4Y5d
 gdC3e5dg2uifdWSbKH+LSCL8EFviO6gI1sukWUp9hOgm+OkkVNqWsxwi0RBK1hvwY9rt
 rVRg==
X-Gm-Message-State: AOAM531cuM4gojl2Avfrd9YpoIJqd08Lt3w5kG2qJ5oN1AmsE//Qu+gN
 PbueHgIz+iiOidSkq2KkufvnwH6Kp/fvSRWgO5WPUQ1yniFsrfXeSzboVclcN5XzlEQ9oGz1SLk
 tah1wcc23Rq7h90E=
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr2866646edv.373.1619512029139; 
 Tue, 27 Apr 2021 01:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd/VIFLo27ojTIItcxBL6ySjfdp4o4kWrtznM+mcQgrLlk2Un9QdvxJLmMgLng+WJabt4slQ==
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr2866619edv.373.1619512028822; 
 Tue, 27 Apr 2021 01:27:08 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id p9sm1764617edu.79.2021.04.27.01.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:27:08 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:27:06 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH RESEND v2 2/6] target/arm/kvm: Add helper to detect el2
 when using KVM
Message-ID: <20210427082706.phzeothsgj66mnp5@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617281290.git.haibo.xu@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 05:55:34AM -0700, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/kvm64.c   |  5 +++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db9..9cacaf2eb8 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -721,6 +721,11 @@ bool kvm_arm_steal_time_supported(void)
>      return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
>  }
>  
> +bool kvm_arm_el2_supported(void)
> +{
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
> +}
> +
>  QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
>  
>  void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 34f8daa377..7d7fc7981b 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -285,6 +285,14 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
>   */
>  bool kvm_arm_steal_time_supported(void);
>  
> +/**
> + * kvm_arm_el2_supported:
> + *
> + * Returns: true if KVM can enable el2(nested virtualization)
                                         ^ please add a space
> + * and false otherwise.
> + */
> +bool kvm_arm_el2_supported(void);
> +
>  /**
>   * kvm_arm_aarch32_supported:
>   *
> @@ -398,6 +406,11 @@ static inline bool kvm_arm_steal_time_supported(void)
>      return false;
>  }
>  
> +static inline bool kvm_arm_el2_supported(void)
> +{
> +    return false;
> +}
> +
>  /*
>   * These functions should never actually be called without KVM support.
>   */
> -- 
> 2.17.1
> 
> 

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>


