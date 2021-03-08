Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0EF33139D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:42:04 +0100 (CET)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIxH-0000Z8-Fj
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJItC-0004hA-T3
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:37:52 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJIt8-0000dE-8v
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:37:50 -0500
Received: by mail-ej1-x62e.google.com with SMTP id e19so21673233ejt.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hdt0UPv1+JtE9WePGEuObIpZA5lYDhWSWdUZ/7HI64M=;
 b=bVjdIRx+u2Ravu+DV7y+kPgj6FXGmw1P2JNeCkVzho/S36Uc3n7jPKDCWw/ZpWBWUZ
 j6i3lwbQKF8+osWhXvrCchkFIRucMWbjKIOOK7qfQtg/blUl3Auh0W50g4AefzY4JJUO
 CM4ulnWqtvFW2XzjL1WcVsJh7AN3lM9QM/h50FCdsXw/u4VCQY8WhqrUIgHijXBRtXvI
 Aq6mJi4U/NWJBvvahGoMgFzivMrDMet7GYfVNGvWJR8Lx4k3iftSS7bMV7Q9HJd4R1qM
 ib45p1LofqCMkF0hqffd4Z6B6ixrLmkZTN3+TzSLlHQ1HnuZ4lhTQksf1GA+E9g1R18K
 KwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hdt0UPv1+JtE9WePGEuObIpZA5lYDhWSWdUZ/7HI64M=;
 b=oFnCczg3yEZXEF4/JwacOOgbHjgIxWNRnHqw4tX7vYR1XfSsyYKKG5f0PJCIibjr6O
 gDmE4M4cXOt7fIPO4XWnXfSy61pgI62PUFEWpxO98PsM49k5BOAtsDrVNlU898aaYK1w
 8KrzkwV60RBamjCpBlEh+H/aHcaNGXu+3qvMUrSPl0/HUVlFN6FDJx16u2ycTCm517xC
 5gnjnhpNxaRojCsYu/MsDn2ZilSpBoX3GsLSzCVjvyZee60Wjj5fYEoRvpNBobCjxp1f
 MqLKdBC3JKkeZlJMcftbTWF4TY/jjH4lNlH3yBTnD/5uPe9UTQwsCtS5DULYNrbRpy+g
 g5OQ==
X-Gm-Message-State: AOAM533TpgKYroIPl4y0fHCWsZRtLkg95wyEKDKuhz9yVKytSatf7hS3
 Y0R4vauW3ny+WuxHH+ev6VyjGVgVuYrJttEgNE1CGg==
X-Google-Smtp-Source: ABdhPJyclgSLrIUYz/TsSvfYBUiw7CR2vxkuf5bNXW397tRKPtd+TKG3HiOZfwjTXuNPZ9DUHPXWE6bP0sPpGPmV5BI=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr16219958ejc.250.1615221463915; 
 Mon, 08 Mar 2021 08:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-5-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:37:27 +0000
Message-ID: <CAFEAcA_ZTJUD1SfbAX07uk+WceO_NvqE_i+NrHF13bAOmfF3nw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when
 asid is not set
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, vivek.gautam@arm.com,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 at 09:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> If the asid is not set, do not attempt to locate the key directly
> as all inserted keys have a valid asid.
>
> Use g_hash_table_foreach_remove instead.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 405d5c5325..e9ca3aebb2 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -151,7 +151,7 @@ inline void
>  smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>                      uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
> -    if (ttl && (num_pages == 1)) {
> +    if (ttl && (num_pages == 1) && (asid >= 0)) {
>          SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
>
>          g_hash_table_remove(s->iotlb, &key);

Do we also need to avoid the remove-by-key codepath if
the tg is not set ?

thanks
-- PMM

