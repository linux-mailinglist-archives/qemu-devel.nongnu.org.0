Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12A173CE4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 17:29:24 +0100 (CET)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7iVv-00032f-63
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 11:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iV0-0002Ty-Va
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:28:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iUz-0001O2-VY
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:28:26 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42460)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7iUz-0001NJ-QK
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:28:25 -0500
Received: by mail-ot1-x342.google.com with SMTP id 66so3085669otd.9
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 08:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i52BYjf5GlldymvoEHLvVf5pSSNmC4+GPc5TMQ0kTF0=;
 b=maVLaVcVBM2WU26/rxdU3rVt/RIjTNpN2osy8uXf+vDwaoVkali8rQIFCqhMXnxoIf
 rkF0snCut5ppfTO0kFnqUdNw8aypyNmzO0TnARklQ/TP3YrYpFsW93aLnYmmvHPO1J5x
 NUf0kqCZabZIAgLRmegFCD6Reic+pZOPk3AAIxeSljrqCYko6b32gKGYwBwK5BdFkg/g
 sPPTju4YeyWm0z79hiTrZ+IdlVoh1+ODsHFkIT6sTaXiOjRCSqcg1eUFi7O+tGH6myO/
 iKoa9QbHGgFDCf4jTLBhZEkami5P2o72qxYvA1uuSI2xBd3erb6aQAhRrtaVp+WqZDIT
 FUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i52BYjf5GlldymvoEHLvVf5pSSNmC4+GPc5TMQ0kTF0=;
 b=XntGbWSB+R7i1TvLYsI38BwXD6i2GXrCNK1Lbe78adanIwGVx5hUUugPk/bHjdZal+
 tN+xNmvaDx+C6tGzvZkryjVkLb/z61jNaNpgah65CaV2esv7wRiHOR7Zt2pRkmwihS2H
 eWtRq60CSswBhVexxbuVoAR8rczHcS56JPQFiRvC7wxBI1Fx0KilpXpOcsCKzZOxzSxh
 cNZN2wopF+odRDO4f6NEc+UHWCP+4oTqoLhRJJc7p+pyc/dG0ufOPlsQ344NA3eQ4zyi
 N3cDDSh/0cQVEo5cc+SCUZ6W8SbFVc1swpWPK7QcYGsDW/TvwEqTN5M9Wvg20pfCHp1U
 7Cow==
X-Gm-Message-State: APjAAAXM0ViPO569hIF7hwXDoLZg7Yc0x3C9eEh8jScMck+3kFqc6rGh
 G0IpENUoWvL80QxogMCe6GSuqVByOQLWa5BmiIj6OA==
X-Google-Smtp-Source: APXvYqzmDC8xnnAUNDKcix0YoyFB4AsIx4cDdnntocDeCz0KrTNOypFdZhX7Z+SKiS71fedf3NmCuFvG+wGx1GWgF8I=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr3790059otq.221.1582907304786; 
 Fri, 28 Feb 2020 08:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-8-richard.henderson@linaro.org>
In-Reply-To: <20200225180831.26078-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 16:28:13 +0000
Message-ID: <CAFEAcA_pc7c9ZkpYQ3nL2fTk5wtZM_Z7ggj=_Pt-ABZVv5Ga9g@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] target/arm: Honor the HCR_EL2.TTLB bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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

On Tue, 25 Feb 2020 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This bit traps EL1 access to tlb maintenance insns.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

