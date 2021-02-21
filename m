Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB27F320D3C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 20:44:21 +0100 (CET)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDueS-0004WW-QR
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 14:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDubi-0001lx-78
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:41:30 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDubg-0006UP-Ny
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:41:29 -0500
Received: by mail-ed1-x533.google.com with SMTP id c6so19386446ede.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 11:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aS20qmAWNtDWNbI/npgno9J39igMaT4z9hqZ/ktfbUc=;
 b=GWbXuZMCOrveO0SmsjLMV6y+AMBfzmpS5ag2d+pyBxr8R70UPPfaJeki2hRq5qSrrd
 qO8diRvK9ZHBkFgmfs+umUgWrhhR4mQ9ckmnY6gfxwuvmwQvbwEdG92CCP+O3WMaQWXM
 jIv9aKGW4ofOprrxXNqrPeTSs9rBzcYYRC6Y9WdvwbrcWoaclhbFqH33L0P1VugAEHnf
 sFGmmWO0Sc8fWvXadMk5CFbCEUtX9ouwQ/d6HuQWFflBNvZhfBi8XXzw6eBVo7Imjbzk
 9JrnDeSA8E2CuSvqtzQg41NtI0YeannvB5gdlXHOOMcD1ZoR2JpNdsfbv6NNbd8iyJXn
 ji7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aS20qmAWNtDWNbI/npgno9J39igMaT4z9hqZ/ktfbUc=;
 b=PRX23Qt09p9VXGsXQ5dP/8V+VXraOYcTYmrRxBqcj/JDOGz0W9nUN8fRuFinYnzN1U
 9JqzvMyukGWHRdzmBAtQ2yBUq9a1QPuK4kEpofCrvv8YwcPqdOxQKl1KwLSfqzUPR+m/
 hWBL9snhMmHWHtc9nfMTPsGlgzmudtC/SKmqd7beEUcKAYkD4v9mUUQILif2ayK9BJBF
 Rg3daJn13mpBU6C5dhwuNNCt1oIu72VmdykXJYLIAg8KCKK3xVTmrsgdNVbl+o13hKKw
 tjjyfHmhNmQ867UCfOQYiPG/Wg5WYbHcRY5q4W6AE+FDGEqqy43JV6Jf0KSnsarl5wyy
 11jg==
X-Gm-Message-State: AOAM531x98AzFznMDh9cB7LoT7qZXZL2+lMu2ZAkhAdB/zxggGbGJZfT
 vtWhTDXkx7Bd3rbACpHhyz3cbinPK2eTk7rQrBTarQ==
X-Google-Smtp-Source: ABdhPJz1/RRZ8/+UJdSN6yeh8Nvfncebs5gwZuW+udcID8vD6fLGwhpKtDnv8goz/XToS0wDUSzXweVMjVa5xYRvItA=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr19197126edx.36.1613936487373; 
 Sun, 21 Feb 2021 11:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20210221183055.60338-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210221183055.60338-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 19:41:16 +0000
Message-ID: <CAFEAcA9bP5TTroWz8k4kkB6bAj81zRBFgR4Uzi0L3BjoNd9JkA@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Fix mouse association state
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 18:31, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

This is hard to review without a commit message that describes:
 * what the problem is that the change is trying to fix
 * what the change is doing
 * why this fixes the problem

Without a commit message you're asking code reviewers to
reverse-engineer your intentions from the code change,
which is a lot more work than if you told us up front :-)

thanks
-- PMM

