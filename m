Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D065F7A37
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:04:25 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogotj-0000qD-EI
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ognkN-0003pU-Vm
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:50:40 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ognkM-0007oA-9W
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:50:39 -0400
Received: by mail-pl1-x631.google.com with SMTP id c24so4580895pls.9
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W0BglreLrwH5fUyC2ggrR2MYe6iUcEpenq/p4enk0kE=;
 b=XrG0ixbSG2GXzXs44skoOPDt+nZcrkFflWSvipCFG+xKJOlecuIKSmreaYCg0GT8vq
 HbSjAEtlOXQyean4ZHa8NmCy3Xqqt0dm303VqvcC48RU4CECspukvfDsR4VRwDhqg+wR
 dnlmiatJjuBuOAnCpaHjtfXOMXTrHYKwMM1DXOxjG9yG2lfVHR5x5J54kuo0EV2popoL
 NAaSarGShaltz1q40B+Hr9lPBC3Dc/RsxuRMPxsc1Pq8dsftzVQN83E6oBRaEeHI9Hny
 ebglzKQxxncZPtT0+MSDnxFGs35Ch7kW0NL2RLP1kaE1XmlWez8mUCFLSgsuPgHhWsaK
 wuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W0BglreLrwH5fUyC2ggrR2MYe6iUcEpenq/p4enk0kE=;
 b=o3pPoJ/xQGSBlvNX4LUsx+DubiNKxuN26hHOlcJi9vSH1rDFi7huWGW/f3gk/vmAm3
 nLrGGA00wMynflMzuR3216uoKmwSubqjVP6M0jDZmq3briBJfdl0dADfaOJDovfIC3WI
 LyqNcC3SUcztMMMHjYGnf28rArGKwIGhYR5RxKYzrq9eWI6vXH1aJcqZJtyj4QBly45p
 pAgRsFGe6QGlCMJOBgVtL3hZygQ0NWVFXoyKckXAVNcjl8qIR9c9VQxhEikhfUmvm52R
 l4r7sfjeXt23ArNCRN5zJbUGTPoqm92QC3Dc9IwLKlrHst3CdkumnzIWu+sxrAbDylwR
 nOpQ==
X-Gm-Message-State: ACrzQf0M+wa2qwIJhjE+1Uv9Ojzx+PYdfKEzCIs/U1/kFZVycNq57FeC
 wMyy3WbUdBV1U3XpVn+FDWmGSA4UQbKMiKMnLMKj9A==
X-Google-Smtp-Source: AMsMyM6yvCCGSWNsveEE4WUu4p3aecEIRbJEqa97TngMRV5gFio9rD/jm6I80RjJbhHcLOVWi0emJDS/UX9PcTU+mWM=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr5085766pll.19.1665150636821; Fri, 07
 Oct 2022 06:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
 <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
 <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
 <7339c803-8cfb-f2c1-bfbf-b07aa4f596f4@linaro.org>
 <CAFEAcA_ch9xe0gTQipKg-QMRorZjS6=OKqfRn=WhiSxTsqFe2g@mail.gmail.com>
 <cbae421e-906a-6d33-8480-a3f103c119b1@linaro.org>
In-Reply-To: <cbae421e-906a-6d33-8480-a3f103c119b1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 14:50:25 +0100
Message-ID: <CAFEAcA_5iKqXx0VYBJ6zzFdGqGVTBxCfMGvX07E806ZHUTA+LA@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 6 Oct 2022 at 21:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/6/22 11:55, Peter Maydell wrote:
> > On Thu, 6 Oct 2022 at 19:20, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 10/6/22 08:22, Peter Maydell wrote:
> >>> Yeah, cleared-at-start is fine. But here we're also relying on
> >>> the stage 2 call to get_phys_addr_lpae() not setting it to 1,
> >>> because we pass that the same 'result' pointer, not a fresh one.
> >>
> >> I clear it first: that patch is already merged:
> >>
> >>               memset(result, 0, sizeof(*result));
> >>               ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
> >>                                        is_el0, result, fi);
> >
> > Yes, but that doesn't help if this ^^^ get_phys_addr_lpae()
> > call sets result->attrs.secure = true.
>
> Ok, sure, let's make the write to .secure be unconditional.
> I've split this out into a new patch 2 for clarity.

If you can send that extra patch out, I can take it plus
1..20 from this series into target-arm.next, so your next revision
of this series can be smaller.

thanks
-- PMM

