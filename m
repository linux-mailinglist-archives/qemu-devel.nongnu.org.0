Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657CB513256
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:21:06 +0200 (CEST)
Received: from localhost ([::1]:55244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Cl-0004t9-Ny
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1b6-0002q7-7X
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:42:09 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:33742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1b4-000139-G1
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:42:07 -0400
Received: by mail-yb1-xb32.google.com with SMTP id j2so8337033ybu.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2yfXQGc2EWPL815xFesxzfcLi9l1t+7Oh2kedPs5GBs=;
 b=IF7daEddXexwYhXnZyS/9RE1DF3x/1MYO6xvOebUDtluWujWNmqbW6Y7Y+s6+/jGrb
 V1ePzejED0EF/iBysKymOHwNTpDEjAOR5Rh1TldQcWxtIMboFSqndzdAuBFVtabtiyMG
 1mZW+V1Nu5COBJdcQ2mJWrDUiF259eQfm09LpKOhaGJbMqH2JgADMfzBdaFZUye65VWl
 PM82gPWNbFD5/XOqe7i0AP5DGGj2/bBjiqqo/0+Vp5xPpAXN/rZ4jy7D6Aceskwsn0M6
 qbjlPXUgd8a73IpZjOtoCobCALdt0cwlJbGW8kDEyPMxAdf34GLc3ZqKqPAK2OQGrB50
 1LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yfXQGc2EWPL815xFesxzfcLi9l1t+7Oh2kedPs5GBs=;
 b=VJUeC3XOZp/j6PL0QThE4KbnIcylw2qs6AJtNRbUSGNMvp/6DDmIw5KyLQix2HL2UI
 n7wXZndz5sn3ZxnwkOMIxQg7lItYcTt2hUHlHIyZLpnedHc4wV4Q8QuIIUIoiRfBn/bQ
 apnTUFgbsWOvFRe4DdkupArpyYH7mcjFV35eQMStWfQ5XCSwXWYtkurNtaS7lxstpuB0
 sAwVCNIAdCam/vsAtFc0X3miGNi8zvNbBINvGG0BfiV9exwNX36uwWZnrQs2UB4lqBsV
 YVFjrv9RlwuLA1+Wwz3fNZtGQ+uyd0fbGbKnAzLdMatE8yRJpwgJw7ClWiLBu3u3/aux
 I17Q==
X-Gm-Message-State: AOAM533U/JeWM4cZCVcNCMOkAxpfMLqmR5l2U7XBBI7CKDamHai1TYhJ
 shjN8wfShAeRbknE0wTLVq3hWYwgx2kkqbw/ELS7nw==
X-Google-Smtp-Source: ABdhPJxoLCHbOYtvKsUA/8bQAKWFuHoK+23SYcZwCdHxZTHPRQ+mXqcTD5lOSOI+u9rghD0PiV2y4/Nz/DqqWUxnRVE=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr30014147ybs.85.1651142525648; Thu, 28
 Apr 2022 03:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-39-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:41:54 +0100
Message-ID: <CAFEAcA9EpCMLo9Y6=riQ=u8neaeYmUKGca=6FTW=b6OtuScU+A@mail.gmail.com>
Subject: Re: [PATCH 38/47] target/arm: Use tcg_constant in FCPY, CPY
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

