Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5C5F6BD5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:33:38 +0200 (CEST)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogToX-0008BM-EM
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSiA-0005jH-SG
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:22:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSi4-0006cl-G9
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:22:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id x1so2011635plv.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pVoW6L5/2Mq3J0jYZnOA2YLWQiFhtZWXuPQ7oQhu+us=;
 b=bItGL6jrS5Hgyf77V7EPSLTp03+CK0A0fQwesfUX+GcPX6L22VWVXlTDGgvZMOgNb8
 V44lTmGF1bRO4FirC377o3EsYNDviSy8/I679NVP15+4oBp3j2D/Vpm5Pm4BuEgQ3fXX
 hj/ETMrBv/p7RnMlkuUGrTZjZltU9OVTQAnCA+F8i4SRQG+dgZivIY33pwFsSGH0bOUn
 fF4g5prvKnAeOokC4uS7TRda9uCJ5z6qrPaF7aogLdb0AARxnreEXbe8iFXqeN14C/RG
 MFx5UHIcLZh1S310oDtcFiiIRLbMAQxDkw2DCU5MhlWlAep/lj0UInElFSCGeNw9S0u7
 csgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pVoW6L5/2Mq3J0jYZnOA2YLWQiFhtZWXuPQ7oQhu+us=;
 b=FLErK4md616iXJBxflkK/CjOtc7/sn3bJuzwV6i+RhFWihkNYC8lgiUp1XhZYaxB66
 YEtX1gwprFWjFWH16PA+LWcdmh9SJigNeSvXHvJ4X5q7G+EICnBYSei08tgh48yr3hBS
 BGfdvVjZxGcTwB4jRlOMX4aWckbGnKK5KgKVzeUOzidkZhdyDqA8sYiv04mAIV9ZC4lg
 iL1AEMa3M86KKKNzvXS2l/7gOgvsJaiu6y5sQ/bE4sC4Zoj5d30cl/pmA/fncy+tDEje
 KyGBTlpvON8RcpqmeH+9dgTo4ZRwE3lMuNCoQDK+oB6ctovEN4yctdf3EPm2ToflbRtn
 CeGg==
X-Gm-Message-State: ACrzQf1u8Lf0i8YNd5bgd3EWvMC75UNGKUvTdORlKIeSFkVzGHatg1r8
 zjbPBiYeTAHhLCqfYwMV1kuj6QNxfgeEpz7+y6AIrA==
X-Google-Smtp-Source: AMsMyM6qIhKYHibni89CXUcKUkZ4Ye8n8BuzGgdgm/a7PoDi5PSkCKZyQ+HX1TPy55An79FE2PKutmtYqm+LX1Y+ZTs=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr239314pjb.19.1665069771210; Thu, 06
 Oct 2022 08:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
 <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
In-Reply-To: <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 16:22:39 +0100
Message-ID: <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
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

On Thu, 6 Oct 2022 at 16:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/6/22 07:27, Peter Maydell wrote:
> > On Sat, 1 Oct 2022 at 17:24, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> The starting security state comes with the translation regime,
> >> not the current state of arm_is_secure_below_el3().
> >>
> >> Create a new local variable, s2walk_secure, which does not need
> >> to be written back to result->attrs.secure -- we compute that
> >> value later, after the S2 walk is complete.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >> v3: Do not modify ipa_secure, per review.
> >> ---
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > I did find myself wondering if we should explicitly set
> >    result->attrs.secure = false;
> > in an else-branch of the last "if (is_secure)", though.
> > At the moment we rely on get_phys_addr_lpae() for the stage2
> > doing that for us, I think. Having the code here always set
> > result->attrs.secure before the 'return 0' avoids having to think
> > about that...
>
> Yes, we're currently (and predating this patch set) relying on the attrs structure being
> cleared to start.  But I can certainly add the assignment if you like.

Yeah, cleared-at-start is fine. But here we're also relying on
the stage 2 call to get_phys_addr_lpae() not setting it to 1,
because we pass that the same 'result' pointer, not a fresh one.

-- PMM

