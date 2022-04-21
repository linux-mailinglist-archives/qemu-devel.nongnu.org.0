Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC550A68D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:06:16 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaG0-00024G-3v
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZcb-0001bv-ER
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:25:35 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:38579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZcU-0000QW-HG
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:25:31 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ec0bb4b715so57906207b3.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHGRs9PUJZ6cTFvhZyuM8jZqIx/VUy6ECAHzWPjnfL4=;
 b=BqHy7aG9T3c4sLXvMidYwjmy2mHnQbEkHqdWdfaYTprvCiuG5BEYij30vYuTteUTSD
 /EsLdAIx6lNmlD/sgrG3P2I2X1Pw2KhaH372OpAzdhhwMerK0fNSCFFeKF5kkxgEEbcV
 VD28hiTCRj6r6j9uAg8MaA1wcAtUeajG/dDJpwh/B21FBV7AewqH6LhLjyAGQG6lDzmI
 SF21hDLGpIRmL8h8eTtpBxw6YGnmgkRBGbg5+PNCot/19fv966K324/YDQsw1B4XQtgm
 lsmI0qy0nMtaKD7RlIL+73RFphzenJhMLW7wU36yc25NvSMXQ8wyrEQmTGDhgjGb19+b
 oOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHGRs9PUJZ6cTFvhZyuM8jZqIx/VUy6ECAHzWPjnfL4=;
 b=LTHNL2DVIaDX7U0uXOJe2IGJdDpoVSNmeQuuZPRQY9P2iK8uSq58i6X5PB1mRzpNkh
 V9O/IVqhGC4GkaJW+Ns0aRjHLXJ7HiOOGzUjbkVAXntE86XLoOOz10Qtkkcj9DzFFzul
 +HBT/LyPHESTnb9wU4Ys/xYmn2JEHZgqucgTSPJydNSLXG6oT8Ca8ZuWelP24F3wMbQ0
 DDqcGyvRJS8c7NZEZcrGU20IjGkV70XlpGhvUl8ln077ZIJww11v0bhs9SvisnVz/9dY
 nb/1kwnNzbvM4CMQOvIZiT4BhPcKzXJJhcLYf9sCL0XaoUjKys20+SHBKYFJvLAAVIZq
 XV9A==
X-Gm-Message-State: AOAM530OeEopMnGUkgqs3W8OpPrpISBb3H7GiPWAaa/2nlc2S95+GyrO
 ghMJdwgS5IV/wEgFWs9MmzFq2TLVpJE31lSj/r6xiA==
X-Google-Smtp-Source: ABdhPJy3OUzTo+OyTmB+CtkXr7OUVcLYjtNF4yultRvMU1VyXvo6lvqBkGOxgscJ6vAiCD16LGnbUo5XzeFXAdtMFPw=
X-Received: by 2002:a81:3450:0:b0:2f1:d8f4:cd9c with SMTP id
 b77-20020a813450000000b002f1d8f4cd9cmr430462ywa.455.1650558325078; Thu, 21
 Apr 2022 09:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-11-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:25:14 +0100
Message-ID: <CAFEAcA_foagYcT8D_f+bOCh_Y4u3A0=-CyJObWMVhSoBVp0SaA@mail.gmail.com>
Subject: Re: [PATCH v3 10/60] target/arm: Remove fpexc32_access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Sun, 17 Apr 2022 at 18:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is incorrect in that it does not properly consider
> CPTR_EL2.FPEN.  We've already got another mechanism for raising
> an FPU access trap: ARM_CP_FPU, so use that instead.
>
> Remove CP_ACCESS_TRAP_FP_EL{2,3}, which becomes unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       |  5 -----
>  target/arm/helper.c    | 17 ++---------------
>  target/arm/op_helper.c | 13 -------------
>  3 files changed, 2 insertions(+), 33 deletions(-)
>

Always nice when you can fix a bug by deleting code :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

