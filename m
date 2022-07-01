Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE756313A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:18:47 +0200 (CEST)
Received: from localhost ([::1]:41888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Dja-0002Qy-K7
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DdZ-0005b0-Di
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:12:33 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DdW-0004Kl-UM
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:12:33 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id h187so3298287ybg.0
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R4v3+wIxGgP77avhGSBxN9v2ijWrN1zMXuWnTPc8El8=;
 b=ahbLAFgwxOuy9aFYjnUVOPTc3URB6T7ShdLqUjs6ST3YbcnTWWPHQMfMCmJRdS0TNc
 XCnRb6Q5lqHwCokDA8u2AVV4bZi72wSoKdqd7no725teDPwFdFolKStGeOOr9e2SQBz+
 vEwy1gGmZFMxSCjTFTep1XwMKRjEHM8dEu9ASPGT5F6KRiHWlfKi+DMMYjK+iLcP5ZDI
 akUQ4+E2yg5v3tc4X7Et3skkz+BKOZuIcfV2a0bdAiETA/cfuYe28mbLCVm9B5Q4tbUJ
 lPSYw214k80eB2pN33lG+Ize1OESuwSswQO8YsDL1vgMG5ITYi7qFIG2Uq7gyZMKshTK
 DR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R4v3+wIxGgP77avhGSBxN9v2ijWrN1zMXuWnTPc8El8=;
 b=sKSFfJ+JnBMMLe6lfr8fiqon/V+ayrJ5Iv2BmprNl2EVWov+23F5CryRq1iGs65/aH
 dm2X5qVsYZ3fRoMPUIYYQ0WZidwoJFFDFD0iQWeCXhBQ+d8gVjOjj1cwDDxTuCXTRG5c
 8PLnO3ejCXqtaQ01jK+bPrvLOIhXJGjLdmfeS623PWffWFyLTRa22NapMPJKKCDojYpq
 fPVmykqk4fxEfOMHRl8INgn5LNA3w16O6s52wuseZi6V+E/vMri10ImoSLYYh7evaPqA
 5XSREq64v1BQuYGOD3xeyb++5rZpuj28M0u4VGfNUJ+vruBzohTDASZgbBwWFZJLlmMP
 8E1w==
X-Gm-Message-State: AJIora9hCzdmTVLb2BxJ36dqcoJdH7O0/bmyt1Xm0Vw4/lbokCVKgbF5
 x1sPCLVXRP5WOy+vOB2A0Bwae9DdmOrXqvSOFhL81uZyLrw=
X-Google-Smtp-Source: AGRyM1s/Aq+ewsce3Tawa2JmRdrA5AaNgdxfnit5erQ3IdfX9VASTxw5pTbE1cCAv96CvHxaeTo2Fa9Lj16G3CRn1eY=
X-Received: by 2002:a25:5c5:0:b0:66c:b809:ddde with SMTP id
 188-20020a2505c5000000b0066cb809dddemr14239524ybf.67.1656670349690; Fri, 01
 Jul 2022 03:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-2-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 11:11:51 +0100
Message-ID: <CAFEAcA_vso+2SFgzr6h2-TxrA0XJ8i7BkANX9Cu2j0oBjR-0Sg@mail.gmail.com>
Subject: Re: [PATCH v4 01/45] target/arm: Handle SME in aarch64_cpu_dump_state
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Jun 2022 at 05:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Dump SVCR, plus use the correct access check for Streaming Mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Dumping the actual ZA storage seems like it would be more
annoying than useful :-)

thanks
-- PMM

