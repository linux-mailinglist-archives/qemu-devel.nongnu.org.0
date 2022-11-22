Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68213633ECE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUAS-0002QM-DR; Tue, 22 Nov 2022 09:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUAO-0002Py-7g
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:22:28 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUAM-0003Xw-AQ
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:22:27 -0500
Received: by mail-pl1-x629.google.com with SMTP id b21so13771954plc.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ox8EwBmvAcCek8yD+Q2rfJi3wmvXnFUHXnqQRxVR8+k=;
 b=tvfDm0kSiYcdzNMm0hMwf3/v5Wb4SGdH8WEmNpnxmxHcjhyh2CU0Dy9eQCyDf6yJ4V
 Cn1wO+O83bZnhvd4LqnUAl7VojKWv5bKEAnbRILDizYPB+rzMp7QveHnPliuTIlJ3rYk
 RMA5iGI4BJPYBRMFM8zMU1jhpOqCdeJF5VmHMy0UfdrM7mQHAQzr5u2k8MZUoONJ69AX
 ntKXJdSb/2AmecLHbSQ+qYP1+KOt34Awf0d9lzUjqrbhrKr6a5TNkgJo4Mvrsy06yfN9
 iAcC9qYXHh196iLqPF/lvEIOnPxI8VXi2LKJNPesnxlYhDokZC1EfwJbjVzFmgEwU2E4
 S4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ox8EwBmvAcCek8yD+Q2rfJi3wmvXnFUHXnqQRxVR8+k=;
 b=32rSX6vamczCbCoSMSIKMA/S3Gw3u0IwnedVBXgFBN2V3rK+KkPxAs5qBAQxoT7he4
 r0R0V72XrTK1yScga5XJ5rIGmNSEpYx3cLu8YKP6BdrURCfIqrn71TIJ23+RjcW5mH7J
 dB3KksogRRSa0HHNV9WCbWrigra3nNkeBPCvInrVPj616DKKWbefj8wqdYLiwhsOMrlE
 0mPctb8CHeP5uzQgePOA0DAn+gROdk1ZsA2heVTPOh3/IPp5i9X1kGFrA4PiboPycvAJ
 SpwweIJeO7sh2uyyV+XTPtYtQWBDLu0sO4AQfOGqcVe1giZNdE38c/HKnb7sk0/Gkt+U
 HnKQ==
X-Gm-Message-State: ANoB5pmbpsQyYC3gsJgWVCmnh+mROy/y2t6A8sMKHrKelJOEMgC9N3Nr
 MwbAVCj8ENCfuLDEldYNAxAjyIV/59je1D2d8DzM0g==
X-Google-Smtp-Source: AA0mqf5c9FuVy9ewQP48IygGq+rwBKjdFFzRRC/afS5Ca5tgDhkVZWosv7EKLGEldhzd3HPq9w7+iI0C6VICcjyAxQo=
X-Received: by 2002:a17:90a:7003:b0:212:f169:140e with SMTP id
 f3-20020a17090a700300b00212f169140emr25240542pjk.215.1669126944795; Tue, 22
 Nov 2022 06:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20221112042555.2622152-1-richard.henderson@linaro.org>
 <20221112042555.2622152-3-richard.henderson@linaro.org>
In-Reply-To: <20221112042555.2622152-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:22:13 +0000
Message-ID: <CAFEAcA8Btaou=YRo9Af-vO2Du_N4-yP0r4k2Sv2eL78HgFzo9w@mail.gmail.com>
Subject: Re: [PATCH for-8.0 2/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128
 for CASP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Sat, 12 Nov 2022 at 04:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |  2 --
>  target/arm/helper-a64.c    | 43 ---------------------------
>  target/arm/translate-a64.c | 61 +++++++++++---------------------------
>  3 files changed, 18 insertions(+), 88 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

