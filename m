Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BFC30024D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:03:32 +0100 (CET)
Received: from localhost ([::1]:42432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vA3-00065Y-CG
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2v8x-0005D9-4q
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 07:02:23 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2v8u-0007ch-BU
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 07:02:22 -0500
Received: by mail-ed1-x532.google.com with SMTP id dj23so6208243edb.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NTZPY6WkVFpXEUfb1dEykbGXS9p/chRYJl8UuYW5kC4=;
 b=nHlen25YPrzO7A3I+8QFk9oxK74aiFK1fi2sWtxk4fVvLEM03YTomS+bcomz1Y5uc8
 mXaXn5Xkrovo1bRvattmUBirk6S8Hb+6/iTrntBrCrIBVY7yxo+OqTzet/RXT/CGD4AD
 H27bFjOgbhEO7yK1xXFkAFInNyQ18yVdHswdKyHpYDPN+X1HEA8dvf8IOTzNCdmnRFj2
 21lyzp86AgdO1hgWpPbbmZEfoO92xSIe0YuIR2L6vdbydEyYyxpfwnbf0qJY4A9eeziO
 zrmBuNAVdtLvWxAYoGsWj1OkMD8+JeQCQ7phP7T+lNg7zLkng6okR2uM2y1efIAw2l9v
 3d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NTZPY6WkVFpXEUfb1dEykbGXS9p/chRYJl8UuYW5kC4=;
 b=IuXL/268TSTolHUHv7/ewwuzsjRRAz9fyFiQ54vSsqsx509dSITpRYpdJa64wkcsgB
 uxfGfNP1vnh6ce0h/fii9V4SqUGCyh//JAxjDzqHOVjitINZgHbPQg4e9vGjBU71K216
 FeW02UDftgQZ2emsFaGQ4/mKYM8HpUPKbOhHPfcu32MfwPAqgr1/TicQ/CZEwXddxHwG
 eJvhUhoqU8Gtn5XwKE9tabshkXNMD71r9j+uOnm0bnVn/BVcDeNFjgf7Wo7Utopzjz8X
 JZgrJWwku05fStwajSNF4CCiJh0bnk9hy9OD5PmPruF0Fc2SX0R9xjgzgkTwldR5ZOuw
 6C4w==
X-Gm-Message-State: AOAM531Xihu3nNem2l7OaQJ0DCRYzxnFK9r3/jGi9Ajc5EY4j3VdK3IR
 bjd6DhphrBVqX6dXx3no6HuUj0+k+p1FRfDxSek8tg==
X-Google-Smtp-Source: ABdhPJxA2aD7GFCHyW38XcARuxaJPdqPOWUhMNb81VfjMO/FwdwMBpuCnTOidL4SvScN+Nz31/J05c01yLDZ9J17vx4=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr2886276edb.44.1611316938439; 
 Fri, 22 Jan 2021 04:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-13-richard.henderson@linaro.org>
 <CAFEAcA-hyjfb399qWC4ORNtoLxNs71G=paurrVX4g+aRO2=26w@mail.gmail.com>
In-Reply-To: <CAFEAcA-hyjfb399qWC4ORNtoLxNs71G=paurrVX4g+aRO2=26w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 12:02:07 +0000
Message-ID: <CAFEAcA_LC-2G72b_ByW1magzXQi3fL97kjAVXZ3zaThB-Erk1g@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] linux-user/aarch64: Implement
 PR_TAGGED_ADDR_ENABLE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 22 Jan 2021 at 11:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> The kernel's "untagged_addr()" implementation:
> https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/memory.h#L203
> slightly confusingly does "untag the addr if it's in the userspace
> half, leave the tag bits alone if in the kernel half".

...and a kernel person has just explained to me the rationale:
TBI is always enabled for userspace and never for the kernel,
so "always clear tag bits for a userspace address, never clear
them for a kernel address" is the right behaviour. I think we
should have the same logic.

-- PMM

