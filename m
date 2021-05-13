Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E0437F613
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:59:28 +0200 (CEST)
Received: from localhost ([::1]:46112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh93v-0004IN-73
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8yY-0003O8-2a
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:53:54 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8yV-0006O3-Nr
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:53:53 -0400
Received: by mail-ed1-x536.google.com with SMTP id i13so543013edb.9
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SjQq5kMRx9t0ry0aH2avs96pr/9GpuyAlWUU7MAX0eg=;
 b=k+M44BQeMrVaRMgmJfRpbtQeyYAWfhSrLF2olN0MoVREKSCvZ7lgZFHbnfu0bU6GPG
 nndnReSSz2KGrWipL3zu1N9un1C40U2SQOONxzsh8SiJ4y+ocQK5pupfpeF6x5sVbX8z
 42Dw3BPh4nZRoxnKCEaiyu5gqTagJoT4DDDkPcpQ9spKOcl4ptKyZfXI6mOMAtY2CTu0
 dlhk3j8cDJoag3ai08qDmCEauPiBYyLDm75dt3T3UIe8f/J5i9GdMtbrcNG7gjlfjRCe
 7rzpsBgiY2RbneRN0GaNhcMnY1UZSwXuYgu0mV3aTVLmX2Vbi6dUCEHfK50uRXkAnBWZ
 lcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjQq5kMRx9t0ry0aH2avs96pr/9GpuyAlWUU7MAX0eg=;
 b=qx/q84HewAsaHjKXYOtDT9wRJPF/NhWU7CXCwGCaar21kXHcYDdQFOkLcibIuKGwTR
 iccVjtJ2vTO3F/zBRjhEVOWPr9r7FenxvBkYnGUrzHTygFd2nR9HyVhcI0hg1qYkGZXu
 OWoranAzOV4jN26VxYQhgrkwoP5541i4MqX587YLjXgy47x7cVJGQjPM89W8g4FLQQ/8
 Rgd3W/zJe4/B8mfiCAX8kEZ5p3IaDfQ53wD55KyARNGrGCcC/GmuYH0zI93sBXRfn0f1
 Zd58U4ODsoXJewtnnIgZWRTifluV9KoqFTSu9onVisWr8mLGCl233P7QBs3bYO5h7WG8
 ghhQ==
X-Gm-Message-State: AOAM533a9dbDUEHBQ6qsIjYZYqFaZ+jXVqPT58XVjfKfbX4U29dp8Xo1
 u540JsIiXh8/g8zSqfV+xePnH5gm3eZQSynlSKwAMw==
X-Google-Smtp-Source: ABdhPJxmuIvyAVyGMN5uKvKxoOaWOhU3pjTYkg9h2KaIOv6zRn5zphDvLYWR7j9QWzK774K0SI6Eb4nEQd9l1dfDUP4=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr49601018edv.204.1620903229726; 
 Thu, 13 May 2021 03:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-52-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:53:38 +0100
Message-ID: <CAFEAcA8OLc6LKC+M2djTjZTFBzASwBysBCQa0NAMXo=ReTwnjw@mail.gmail.com>
Subject: Re: [PATCH v6 51/82] target/arm: Split out formats for 3 vectors + 1
 index
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Used by FMLA and DOT, but will shortly be used more.
> Split FMLA from FMLS to avoid an extra sub field;
> similarly for SDOT from UDOT.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      | 29 +++++++++++++++++++----------
>  target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++----------
>  2 files changed, 47 insertions(+), 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

