Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E214A4C7194
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:18:21 +0100 (CET)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOij6-0003Af-8N
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:18:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOihL-000206-E2
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:16:31 -0500
Received: from [2607:f8b0:4864:20::1135] (port=46394
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOihI-00056g-BY
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:16:31 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2d07c4a0d06so113821977b3.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 08:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AQSZDw9b1T/oiQrSEJHQ1wpMoimfZoKwpkWd4JQLWkU=;
 b=F5xVswrVPEhnylMMcriXkDzU7R6MxvWbsPYTzIR/6YGbY3N6USm5z65zmP9dnCEqL5
 qJ28JWMpwO7+ie3G2Odh6EPpcBh8nbVRv3+T7IbsuCq0YfQ3wUkrMA+n2n7VlZbv4FLQ
 31S9JYJkD8abdBtxE6uO0N3Kg1Zhsr5e35oEGidt8nInxiwosdmODKNAp95AZPrh5dSI
 NlEy49x/Z6+zZP3h1dr8yVp8VriI0uLjKtmaIWs7nBWa9O3EEp8Exp03giroYtzctRDy
 mTGZlhysyFjkCpiuaCgfyCSvtG/lowk534WVkCks6a6p3pJNOlWUsyLZZ1/3hxDhAXun
 0q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQSZDw9b1T/oiQrSEJHQ1wpMoimfZoKwpkWd4JQLWkU=;
 b=rw79msURaaeA8vRvm8K0kszAE7fG9Ky5rkTz0KGSgPYoWhMtm7KN/i6zBcch+yBrGd
 pxoDiJP/yRA96J54EPmbcDQaMdGPlP9YDpoGy/DRlc2aGYpZaSEcD8x5AJV9vnS7T17X
 AMWppLfmpfJkBQqPpyxdRl/nNAYVIUPtPU8KWjxqqDw207gChxuz0dn7vtSdLQqi1bFt
 lpgRYsyLgNVSG0mMZBL6FfLB6LGUXgkPa/45nyrbSDzu/6WLjLzYaZKPmRyHW1Gzf6Uq
 1ALGddI1ssahSB1fyM/QDKAPstOXR/Z5aVu0QeporwfPwY0xK3nmIGW1jzKK74MQuq+w
 FpJA==
X-Gm-Message-State: AOAM531lK0duUC1dVJqep21rqpTNjO8Ljl+pm09ekj6Yl/DZo6q78QtL
 2gazcX6a/6kL7OQ76tg7xP18/uvbpl9NGhNcVtK6Ug==
X-Google-Smtp-Source: ABdhPJx83dm1rMxhm1ITgk7WFNxdrC7AIdOyuWwXz8FfZkqKJ9WuPS+Hy5JNuy0tbMjAxTUw8WCMEh9LaH1rEQ3QIz4=
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr20347309ywb.64.1646064987439; Mon, 28
 Feb 2022 08:16:27 -0800 (PST)
MIME-Version: 1.0
References: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
In-Reply-To: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 16:16:16 +0000
Message-ID: <CAFEAcA_jsunyeYOqu0aPtC3XrdD30b1Fk-6QsiDCTs=AJcvYVQ@mail.gmail.com>
Subject: Re: [PATCH] allow disabling tests
To: Simeon Schaub <schaub@mit.edu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 16:10, Simeon Schaub <schaub@mit.edu> wrote:
>
> From b6ec17a85a8fb2431545f9c5093dbce9a090b522 Mon Sep 17 00:00:00 2001
> From: Simeon David Schaub <schaub@mit.edu>
> Date: Mon, 28 Feb 2022 10:51:04 -0500
> Subject: [PATCH] allow disabling tests
>
> Adds an option to avoid running tests as part of the build process. I
> ran `make update-buildoptions` to update the meson options, but this
> seemed to also change the `qga-vss` option. I assume this isn't intended
> to happen, any ideas what's going on there?

What tests are we running as part of the build process?
I wouldn't expect us to run any tests unless you ask for them
by running "make check".

We *build* the testcase binaries as part of the build process, which
perhaps is what you're running into ?

thanks
-- PMM

