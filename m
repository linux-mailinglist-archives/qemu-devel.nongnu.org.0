Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52FA5F6DF8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:14:06 +0200 (CEST)
Received: from localhost ([::1]:50756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWJp-0000GL-Ft
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogW2N-0002fU-4r
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:56:03 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogW2I-0007Ni-BZ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:56:02 -0400
Received: by mail-pg1-x534.google.com with SMTP id b5so2630476pgb.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bSF30V8eSnQWtJkjBX6iOQToqueoUcs9p30LyXyuWIk=;
 b=vV+z5X2PNJL0qjE9qIATTobw8gS9GCgJszRMag5tV/froCAB/0coBUVVI9SZlyAqb/
 +4x4afsjjTFbriHCWDzMDo9bAde1v6VkUKY20HU1ChR7d0pSFb+3D48t554mH4jpkpSW
 JTsz4SllaIg/ePivY7cdZ7LZiRNGtT1vYlnuN9KYD4kMjUVGjkn2tG1q7LmKBkw4BiJr
 84D9cp0dLo6tai3BefX9PDu+Cy4BdetHL/CEhn7ZfvNjSjpQET/E1HQHpgOcvEqd6ymt
 3N0G5Q4m4+EjpM02ZQHIS0iFH2R9moHaCpZyoXkzHgiV0inZzCjDZ0+PT1hksH6Hhtlw
 OOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bSF30V8eSnQWtJkjBX6iOQToqueoUcs9p30LyXyuWIk=;
 b=N7s7poeXMTHlMNTZJcuXUmnuHx/UM4d0seJDWkMY57YxqTUokiScy9Fk4dCU/omPYm
 AxGQuPpyazTcaPxCpdsnPCXfxy/SI5kr7Eg+Z/8mzbysQVSyNr8i8UOV0bPTAHh5OYq3
 iWU1a83FhIKTgvRSFgxP0VDjhC+uymIoOOwPa1Rz0RmUSuYhT8BufJXhc0RmOGm8iD1K
 bFbTlyIqdB9hNdfyOhBd07ZQScLum3d4AHtFfMSroe14PHPkzxf8Rrao/S5DBAfLLuia
 vNgrnOVtVbhaTGsqHeA6kkA1/DymR3t5WeTaFapOOzHyjuBGvtkPbkKFKok/EHjbb5iT
 gdgA==
X-Gm-Message-State: ACrzQf3ZxMoUyOXa1kPiHg1oiWY5VmDghvwh/jw819AmYpw38AV74wRP
 VMjCeehlsrdkZsGsEt+wF/ZFsfy/KpDTE1jXYVq4dQ==
X-Google-Smtp-Source: AMsMyM5XqRvDjG5eYaGs84F/6iA1db9MIQrjmdNfnnkAVduR3B/7DavOffqsLV6d9sUxDxHsEFTyQ6cvbt3awqfG6ck=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr1093525pgi.192.1665082555885; Thu, 06
 Oct 2022 11:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
 <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
 <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
 <7339c803-8cfb-f2c1-bfbf-b07aa4f596f4@linaro.org>
In-Reply-To: <7339c803-8cfb-f2c1-bfbf-b07aa4f596f4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 19:55:43 +0100
Message-ID: <CAFEAcA_ch9xe0gTQipKg-QMRorZjS6=OKqfRn=WhiSxTsqFe2g@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Thu, 6 Oct 2022 at 19:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/6/22 08:22, Peter Maydell wrote:
> > Yeah, cleared-at-start is fine. But here we're also relying on
> > the stage 2 call to get_phys_addr_lpae() not setting it to 1,
> > because we pass that the same 'result' pointer, not a fresh one.
>
> I clear it first: that patch is already merged:
>
>              memset(result, 0, sizeof(*result));
>
>
>
>              ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
>
>                                       is_el0, result, fi);

Yes, but that doesn't help if this ^^^ get_phys_addr_lpae()
call sets result->attrs.secure = true.

thanks
-- PMM

