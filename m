Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77F650FA7A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:29:12 +0200 (CEST)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIRT-0002i0-La
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHtS-0007ep-EX
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:54:02 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:44704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHtQ-0001Td-Pi
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:54:02 -0400
Received: by mail-yb1-xb29.google.com with SMTP id e12so3105964ybc.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qzNRUjo6fRN5x56zZzC4nH624fSEv5M2swy5mt/n/nw=;
 b=U7V3otL1kEemsUp12ML9DCXqTyAm2WQVTHDKjFl/076NdQriCZrWL7yEEwXsqUgvgq
 3KAEudfc3eu/T3zp03UPjE1TaHNrgtKFJWGUKsjj4WjEsSIwXzPWeHHbVL8CI7LFUeHb
 Vi5jqtY+E7IT+rSOsPjr0mjfWQsAwQkW/s0yACxRqERkRx4qKWqFQ89zMOpnXVPWqwq3
 U/0AzzdE/o8DNY1Alb+kM9rDOb2jI0GInH+eNk6CsAos/rTZUGPoXLcYQUOdsuJ1GqqZ
 5B4Br+QiaI24iGzeC7isyl7YyE7T6i9XQMJhGvvpTol9cbOrVIUL7Z/oU4DIp2XFcjpu
 vLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzNRUjo6fRN5x56zZzC4nH624fSEv5M2swy5mt/n/nw=;
 b=bnEZCdYV2mn3q/LRaZljCFMAt2yGujDxrGiV+7x0vJEvaxt1PJ2tmxf7sKDU9iouef
 +8RNipll2zFbAbnKLZ2OrRSOfioaB7+a2Rq+KBoiHcRnxudqhe+w2PKgxEF2DQ/VFb1q
 6+Lo52bHApjQQOftm+BUvAWpjZcxifuJPpfHXfLLTC3EDqhcBl8Wlcw4a5uDhrKCOqja
 kwCrM8lWPHEga4U4t3L2X3CQ+7yVjPnemo+cQAOutnRwZuXLLAra5vwuv/RukgfaxRfM
 aKSCAJBAYZtoxHdHD9Y6GlXm2ev2KMHOiIwZiuFBFdrAcO5IyWu/yB92S/AYYRhkFzqM
 H2lA==
X-Gm-Message-State: AOAM531g8nEuLrTXgjyne+kTCvFTtGxVQoXScLLmRHMwVAS1TAQAjhC7
 +RqoeEa6p2R1zqClwPzX1myA3hfxjswtsds+IThhkg==
X-Google-Smtp-Source: ABdhPJzHoBL9RDgudUh/rDCnkR3fwoaubdws72GYqrxu2HVgt9r5UG1m36FkJBMsxmO5ctUg3DCpKcl79dwe25887zk=
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr10066301ybk.479.1650966839804; Tue, 26
 Apr 2022 02:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
 <20220422165238.1971496-48-richard.henderson@linaro.org>
In-Reply-To: <20220422165238.1971496-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 10:53:48 +0100
Message-ID: <CAFEAcA9cT_qBYJVmXH7nZ7sWLqtG0y_qnBV8FCBXS2NzJO_1ow@mail.gmail.com>
Subject: Re: [PATCH v8 47/68] target/nios2: Split out helpers for
 gen_rr_mul_high
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Fri, 22 Apr 2022 at 18:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename the macro from gen_r_mul, because these are the multiply
> variants that produce a high-part result.  Do as little work as
> possible within the macro; split out helper functions and pass
> in arguments instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

