Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F12D7C86
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knlxO-0005k1-UA
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knlhy-00027y-LN
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:55:54 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knlhw-0005T0-PY
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:55:54 -0500
Received: by mail-ed1-x52f.google.com with SMTP id q16so10033651edv.10
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RDIxEyDRncwe2kFyKOOHhHnuL3UBYtOIKZXO4GGpVRU=;
 b=S29UGCHzFLF6SqsEt4eWx0+bXs+N/8jkV91pjT2PJdJR70yHl13XlAvL+vUuTBTDfd
 eCLaPpERYS8qG0HptJo8wGhbbEzDIt8Y7ZO9ZOvIsQLF0qf0XeEiGundQrmogYtOinuf
 u3l8wnqmGhSEEx63C1kjzv1oNFIjkG3uTxsQxrO66EQDvBGNsfxqIW+ARdHaCP9rfIsH
 L5vAe6VQwqyntoq6BqgxWrVR9RCQH8F72t287nA2yx3BxE4i8kPKLZNdEdBDsBmuX1IS
 VSwgZInZgAhEfIGxBd4YtN54SOM2zcIKm9/CC31/dtz9upYRrVeOor2aGRasMi+JRpRU
 qWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDIxEyDRncwe2kFyKOOHhHnuL3UBYtOIKZXO4GGpVRU=;
 b=TzrZBKGHbqzvH+S+tEuPo3L3WjMRRbu90RdSLfyMqqxRbVKJwnD3XDVq4NL1G5E7d9
 35+EXXLXdwsl0wSL2tf0FeirjGNG4xBCIOV1iz3+dc0bF5FXZVg6PvK/Qz8iEa1mNBA5
 iKb826tgg/GEF/cN/SLkX4o68UAxkHVvTP1Bsos+X/unj4YUjK3jKw8xQYaCfcd5EZOu
 NcAlkqbZEo0L5amaMjEafmuz5QARqVCncAUZ81V7xoOsj7nCNQcRVBA76OuUTYnP172b
 RJEgAmkTv4apueNyGAgG28MRnOk9TGC2dNWPiH4oPCesfrWzUt+C7VzUIwTg0RcJZlaU
 eaDg==
X-Gm-Message-State: AOAM533m5aIZc1pGbfwTbaqjnzZNiBQQ9fKtZe4eIOFZ1fXFhsP9mkaE
 mDqf6nWVFN4laGF2JPZCn6/ja8J9NcbFu3EYnTts2Q==
X-Google-Smtp-Source: ABdhPJxoIyE0vdEzoAmAoWQ1MytaECY1v4+hXBlC8u4tcw6YmStB0aBoo1U9yWRxb9aNh2omIYq6VCCXY1nJitDkh3w=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr12599317edr.251.1607705751243; 
 Fri, 11 Dec 2020 08:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20201211011049.474889-1-richard.henderson@linaro.org>
In-Reply-To: <20201211011049.474889-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 16:55:40 +0000
Message-ID: <CAFEAcA9NXcVJSqsz0=+E=hVo=ccF62wJYfBsW0qKJnVjuBxStQ@mail.gmail.com>
Subject: Re: [PULL 0/3] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 01:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' into staging (2020-12-10 17:01:05 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20201210
>
> for you to fetch changes up to 9e2658d62ebc23efe7df43fc0e306f129510d874:
>
>   accel/tcg: rename tcg-cpus functions to match module name (2020-12-10 17:44:10 -0600)
>
> ----------------------------------------------------------------
> Split CpusAccel for tcg variants
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

