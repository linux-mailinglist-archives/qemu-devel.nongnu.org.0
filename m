Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C4550B8C5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:40:04 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtVz-000545-Ci
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtOr-0004IR-3J
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:32:41 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtOp-0001m2-8D
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:32:40 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f16645872fso85418957b3.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S2eutZnd2xR8CnZftUo/Y9n8c22cZCpcOVDElcU4nmY=;
 b=f+Md7eFuHzl1sS0sW6d17HLq5KNOJMZzuff2fXQ/Irkjatbpf+Naav+fWgMQTJgC9R
 CRohSf9lWD5gYFJzxLKRN7OLm8QDxETCvAEebOY6C/kSMFIaHK4bNXd/qXCxH9RAV5Fg
 wWP/ygmmr1SbDZjLTk5JjZ6RTT6Pr4a6xU1cASZHoZmeP/n0BP4o2r7kG2kf9dVGHrVN
 BafWqeFqU9myl3IDgzLeLM9ebpcJksj6XmV3Lk5yLGwT46gPjunEK4LU3PQS+eJBSyPw
 j19QkdqXntE3NiWqtQuI/VytZSQn2+CrBgXvmmoXUr14/sHVu64m3k/mbp84C/eQPGa1
 6ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2eutZnd2xR8CnZftUo/Y9n8c22cZCpcOVDElcU4nmY=;
 b=PHfZ/9DbNqVcyI0B+1n2hHnwZGUP2WGCaI/bJcZEjYuM12D/81QM77wQ0Sd7ILaYkQ
 OtO0zpAgJE2kKfjNsiMP2KbiOcV9uYOjyvKCTpKvuuQ7RDoSinbnWGDG/1k4Vtta/+OU
 vHOFyVktkjBbMQrg+iSbhc0djS7+qn82lKVgVbTA14YFzMfAasC4CYSa7TJyeUFjSWJf
 14ATOrG3oCI9h6kOj0aIWuJVXiHhgGDW8AmSDymYF+rwVePOzwSq6/XAQ3GAnByw2ss0
 JB96y8lAV/+eZJLqkjHHfo2OXiauKSjlkg/pmXIPh9myLPL9Iqnv1LPARwoMieS0StDE
 STAQ==
X-Gm-Message-State: AOAM533RRGHIRtW5E2Uu1IydoVXLVcsXy2EAPY80Di087v+vIWr3p5uh
 pLtIf5j51cVMg2KHQigbffzXc4isq5je+YJfUmt05g==
X-Google-Smtp-Source: ABdhPJwzKOMwXYrollFIkWm4UmZX+i6SKKv36PDTBvFIv6gdPjYhS3fL99Iz0GEwbKVAih91/dRxCcWNzz/OY5c2X60=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4717724ywj.329.1650634358111; Fri, 22
 Apr 2022 06:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220401170813.318609-1-richard.henderson@linaro.org>
In-Reply-To: <20220401170813.318609-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:32:27 +0100
Message-ID: <CAFEAcA9c-8AETL2H2dra5r6Pey-TS37to4ES-riJOVxiGWTHbw@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Assert mmu_idx in range before use in cputlb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Coverity reports out-of-bound accesses within cputlb.c.
> This should be a false positive due to how the index is
> decoded from MemOpIdx.  To be fair, nothing is checking
> the correct bounds during encoding either.
>
> Assert index in range before use, both to catch user errors
> and to pacify static analysis.
>
> Fixes: Coverity CID 1487120, 1487127, 1487170, 1487196, 1487215, 1487238
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 40 +++++++++++++++++++++++++++-------------
>  1 file changed, 27 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

