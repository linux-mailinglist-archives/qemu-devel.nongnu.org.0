Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678D148FF43
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 22:47:23 +0100 (CET)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9DMw-00040T-2U
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 16:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9DKa-0002fv-2p
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:44:56 -0500
Received: from [2a00:1450:4864:20::335] (port=37494
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9DKY-0007ID-9Q
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:44:55 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso19953860wmj.2
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7TVWkqkeO6FjjiIBahjqpVF6yUEEjXomzhQgTsCpcyk=;
 b=XB30x7ZMSPaOiW5bryIqCZiSnD8hvzvIyAbhHnJHoCHHeHZGMb/lky+chiXLqgzSfz
 Co+t1wN9DL6/gIyBqP01xvVQSsawBemYe9+19USGtVaC0BKqpPogt3+EsWr2OV1kG4Fu
 JL5UMJ27YPx7ifsCNobR2IGC9rD/RPt/wV1x0ShikVrz7Io9gRuFoNz5fbnOCagfkCr1
 hcnRf+acEf07tiXsSE5bdMAiEPFIbW7X3ubrNgpslreaVvMvW8N4tb+YYPOkIut7ZU0T
 jxBblvs3595jvIO2BKU1eoMFpUo9Q9+/A9IYAcfkf/Rdap17KP2Qg6xZZowgThbF+ZqW
 AYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7TVWkqkeO6FjjiIBahjqpVF6yUEEjXomzhQgTsCpcyk=;
 b=1PT7UKhIN8WmuekbkMfSay0HrghDsXQPmm8pYaQHXglT5CK7qaBw0ShP9OkLjMyvO0
 k/SH4sXEIIIIWsQtbJhBvd1G8tNy43c6N9/JJN7PD0FfL6+zAo/0nLLfqG3aOTVvwJjw
 a/p1IEKjcG1ISay+wyJNUQfj6ts5y5s3soDCEmrpylE+WwicLEUXKFdL6zuvJuTe5ouj
 UU+up4DFKsPqfXgeDgXn5ZbuLNQCxlcMILFZjh128brSxS46+jm3yyabaj+k5D5QlBgr
 uwV6TiHpbt1zxHRXbb22q6XjVlOfudNT9Tmnh5nuVoAgjBlZyTQAGBG974tUktpnX5j8
 Gm9w==
X-Gm-Message-State: AOAM531H74IIyI+fmcQ09xqbr04NmIV4eQQtioDkuY3tOH4BhDbkxC7m
 2gBnX1tIeZLkcIa1ileNB591q7TtGqpedeB0Ds1+gQ==
X-Google-Smtp-Source: ABdhPJxXisDDQQbsRbrqQBMJ3ur8C/6yrCknWJC/D68unSMtQfy0hq20xcSpUw2cA8HQFvLaLVDvh2oN4dZ2zxUNqUA=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr17549919wmh.133.1642369491955; 
 Sun, 16 Jan 2022 13:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20220116204423.16133-1-imp@bsdimp.com>
 <20220116204423.16133-3-imp@bsdimp.com>
In-Reply-To: <20220116204423.16133-3-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Jan 2022 21:44:40 +0000
Message-ID: <CAFEAcA9YBjaapcZ538oakESnJBHd0Tysk8XTw+AESb8p8Q28qQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] linxu-user: Change return type of queue_signal to void
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <Laurent@vivier.eu>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 Jan 2022 at 20:44, Warner Losh <imp@bsdimp.com> wrote:
>
> queue_signal always returns 1, and nobody checks it. This is better
> expressed as a void function return type.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  linux-user/signal-common.h | 4 ++--
>  linux-user/signal.c        | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-

This one's a dup of patch 3 from my series from Friday:
https://patchew.org/QEMU/20220114153732.3767229-1-peter.maydell@linaro.org/20220114153732.3767229-4-peter.maydell@linaro.org/


-- PMM

