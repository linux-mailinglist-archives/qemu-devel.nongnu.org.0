Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EE650E56
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7HlY-000180-Ro; Mon, 19 Dec 2022 10:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7HlW-00017o-Pq
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:09:18 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7HlU-0000CX-Tv
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:09:18 -0500
Received: by mail-pg1-x530.google.com with SMTP id 82so6393719pgc.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rTXN5JLR/UeqMX+hHOYA0ZbEagYVNdHXwE6Yw2F/NKs=;
 b=QxgwJWM0Xk638eWFDrHLLRl3hy9OS4/O+wqXDcDv1nOvRwQ4r5yD/Yqna0jAmtjSiQ
 XxWpw06w5fSb3c8LVW4LQAd0SEIRIfTyfnqPfUMlNcAXTQPEZTUJ8qsEj8ceuFGqQmUa
 6H7VLghFj3rwlNW3NJtq20whTMb3t08Fw7J+tugAABYKPcgnBebeDbJGvoZrOThLyjDH
 qcyUCmujsxHYfTvqw34zOwulq+IoC2y9IfiLhAi4laeTgWgCrFnfe2f0jD/5WeJaa6++
 HRYq1w20MZbeX0QeXA5e/PQSdfv6neQ0vztNrcbWyXQA/G39jVQ89bUtFPsllj338Bgw
 pW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rTXN5JLR/UeqMX+hHOYA0ZbEagYVNdHXwE6Yw2F/NKs=;
 b=7BTwTNMTi5fZGErNmYNNM42FMqukOyjkVJ1EeYbB/DgEFnBp2MvKRIafCSElC2smrY
 DzIedOIzJQX7i8h7wme3Ftbb/2KEkRVP611y/Q1rNRn4KIs9HfLiEx8wWLODOO7sTqlT
 gHh40qUx3I1ngW95lCBdex6DmJwdikhHLfHFvLT14q0e9Gn3PyNNgFQ++bN29yBWoZvY
 Bh2i8mcmgLdicWUfTpIidz+9MGIilsnvJrFJDk+ZKO6FKumlE+vbcRAEoTrt0nUx1b/v
 1bHXC4R5xbZ/8wbMQng02Aa0CH2qYiF7saRFHvLRVkMmwVeP/mGQGfUtPhBs9pCDLa9g
 +/pg==
X-Gm-Message-State: ANoB5pm+Qbkrht2KVdb0+cTCe85995mCY/q3RrTArN+XH013XFiMhSM/
 ZH/Jn/9X3RZ7N+v9VQA+7Mr6W32uvoeC8Nn/MhG4dg==
X-Google-Smtp-Source: AA0mqf4uSjzwSgXGHYY3NEqwdpl3kVpre8mroiL/h+k5bWpYxJsh+xCMFkiDqPGs2FXkVxFTWLzp7oT/08QIMlARutQ=
X-Received: by 2002:aa7:8502:0:b0:576:9786:94c2 with SMTP id
 v2-20020aa78502000000b00576978694c2mr26756950pfn.26.1671462555319; Mon, 19
 Dec 2022 07:09:15 -0800 (PST)
MIME-Version: 1.0
References: <20221218175035.449904-1-richard.henderson@linaro.org>
In-Reply-To: <20221218175035.449904-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 15:09:04 +0000
Message-ID: <CAFEAcA_ueFn4BTKDeS20NCDA4c7=CnW2ZF1HPcpOGBQ+LOYNGw@mail.gmail.com>
Subject: Re: [PULL 0/2] target sh4 and tricore patches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 18 Dec 2022 at 17:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 562d4af32ec2213061f844b3838223fd7711b56a:
>
>   Merge tag 'pull-loongarch-20221215' of https://gitlab.com/gaosong/qemu into staging (2022-12-18 13:53:29 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-misc-20221218
>
> for you to fetch changes up to 3b1371159cdb6f31d87fbb339853cc6a963ea6a1:
>
>   target/tricore: Fix gdbstub write to address registers (2022-12-18 09:39:17 -0800)
>
> ----------------------------------------------------------------
> Fix tricore gdbstub.
> Fix superh_cpu_synchronize_from_tb.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

