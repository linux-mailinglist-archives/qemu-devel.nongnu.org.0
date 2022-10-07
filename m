Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE55F7B69
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:28:09 +0200 (CEST)
Received: from localhost ([::1]:52650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqCm-0007pG-FS
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpuB-0004QA-4I
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:08:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpu7-0005Vg-QD
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:08:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so7628931pjs.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ebO80EGiEl1K01kjnElVpT7a/cmS7kvWbcW65J3edjg=;
 b=hV1xi/p6QeWaQXvTJYffeuRt694Psrv6eguZepGMxW77/h4wikWSgCx8Lt/euT5EKq
 2ujgRu8HMwAxsjsJPxE+THSrVGHhNOEctuMhWewizRc4Kwm0ifeywmPiO69iDZ0iGQ7x
 gORXlKAJ+7JTZL77eHGTfUrcOss1viF+u1dp3Y7+NTCsoD4wM3uxFdLYRuwoZyFwLrP0
 8eyRs8KHF2EiQFTNRVmsDNBGIz/TkKTGyTg5FuHsfzRhphNowY0Kc8lBysu2uDcbfRMu
 srVPmOXz6RXiGx/NBfEWzH9icqa/QpPKQmh4oRN8x24ndFNV4jtkJE3mk9TH09nzWTK8
 ynpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ebO80EGiEl1K01kjnElVpT7a/cmS7kvWbcW65J3edjg=;
 b=XZx1tgDeaOJtHeDZMkj20DV4mzjDyDG6KDdRwCW6DWSN+d71WdrihLJsBKukRd4TM/
 j6GNe5zdj6R5g8CLL4pf4E5IVa3t49fb3I0iIBzGivvMEt/Yd8vZqYFYGka06wfsERyA
 Rt770/SSqAt0jyIA9FsMEBd21j/BvdzXDesB8t6035+IlMRCGdhfNgSzeb9WMcN/f2Cz
 EHKpIHpL5WvBs4gj8B3fMM44AJDNG2d2vXMRGXN3sqY/YbEkwFGcrEX88NwA6sps1/iy
 RLI46GNJbpYAtPkIHLIgUquZm3WsLtmsOoybovFOcMMQ3QFoEH8cDMtrzww8ruPD23J3
 6NTg==
X-Gm-Message-State: ACrzQf3I8glpypBSi+TxRcIv3yS0FGqNcUKdsp6Ylt8AqCB2PozxaNtR
 EL9S8wiaEnzyJATBFXOpZTCU8DCNCIZ4UF8YRS2iyA==
X-Google-Smtp-Source: AMsMyM62XJwDS+E9F1j85GiwiopEVn20SR9Jd3KLHoLGfDJhFjr+PA4E/Sylo78vJnvUt8g0DE6HH7BfSS2Bt3Ri83w=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr5451213plb.60.1665158930414; Fri, 07
 Oct 2022 09:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-28-richard.henderson@linaro.org>
 <CAFEAcA9Vd6mwMf9-70vo=t_Yec+fPh3kM_jo7wn=oNi1+cvgkQ@mail.gmail.com>
 <92b19bab-1115-cbd2-40e9-45deaa14e857@linaro.org>
In-Reply-To: <92b19bab-1115-cbd2-40e9-45deaa14e857@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:08:39 +0100
Message-ID: <CAFEAcA_HHn_7zoF2pMfKM+rmFy4iPj3575V0u61d=z33geg43g@mail.gmail.com>
Subject: Re: [PATCH v3 27/42] target/arm: Use softmmu tlbs for page table
 walking
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Oct 2022 at 16:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 02:01, Peter Maydell wrote:
> > The upcoming v8R support has its stage 2 attributes in the MAIR
> > format, so it might be a little awkward to assume the v8A-stage-2
> > format here rather than being able to add the "if !is_s2_format"
> > condition. I guess we'll deal with that when we get to it...
>
> Ah.  I had wondered whether it would be better to convert the result here, so that we
> always have the MAIR format.  I decided against it within the scope of this patch set
> because it meant that I kept the existing s1+s2 attribute merging logic unchanged.

Unfortunately, for A-profile you can't just convert the s2 attrs
to MAIR format, because their interpretation depends on the
s1 attr values in the FWB case. So you have to keep the s2
attrs as raw until they get to the point of combination.
(v8R doesn't have any equivalent of FWB.)

thanks
-- PMM

