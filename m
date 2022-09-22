Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640E5E6584
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:29:34 +0200 (CEST)
Received: from localhost ([::1]:50200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNCn-00059I-5I
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMzi-0007fn-27
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:16:03 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMzg-0003Hc-Ha
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:16:01 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z2so13845091edi.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=W9D7L/zOlldD1t4jhyojbEWApDPD1ddcdAHjt1hXWjo=;
 b=f2y5zkvd5JF1+lvIzo7ptEdwCoowT4yVZsA0vvK3EaX/bb9ggbIB33JK/bWIWWz/lx
 6+lRbDab37xu7i8eHTloHNBNweykkz3feBaZOhzIN+hiMDKbztQdqzCSCaPgjkHt1e8L
 rgXMs0zRPXL6ALwaVzRjVuh26fG1zxWiJ4kBQOoXdadVpn7QN3lmlbWJP9QzfEXCyyPq
 qxBDpZxhAZslcC8fn00/nj/LpLf7sfyyWQc/ngPwreLQxTRWRUWenDf4UlC94etSTiGs
 umSgY3C6qBj+qliZ2lV6EDEZIVsCkP21O19En9RjJbGidSXdQNEPKwMEb+21JVZ0wmWs
 alqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=W9D7L/zOlldD1t4jhyojbEWApDPD1ddcdAHjt1hXWjo=;
 b=cbT+NT6yAw7ysglZY4I78s6P/9nje8vPxj95z+CuY+KGYzfCf0unYMo94JtZeBPk6f
 2BxX97EJD2L31qoyfECsAmcE2kl1kmB5Wq1HXxbqMP5LgJMCDcEH0hYyit5Y5YZerlXC
 wugBoP4EfvLlYgz9385zSzdX1VuHp+P3/BYKkRANz3p6mZF/QFM2nXo1+xFhYYGwwF1Y
 ffXCPlTJ3Udr9TJkZby/S+pPJaIMuhWCiiCpalrQorUcI//tMvVvgT8xiHSQ+DHlj5Yw
 vyUwE65L5XpmgkHYNj4sf4RsNXHJ3lElRb/iqrJFiMgxXwIjg2/4EQOI2kp2I5Bc7Dc+
 E7gw==
X-Gm-Message-State: ACrzQf01IhIRaVgasE1UNqQjIr1ZLn7gLRHxZUDN2N5n1JnrIchprP1P
 BLe/qX/o+R1XWLQVFna/7O4iLoZEniuzeHXGudOCqT6wkkY=
X-Google-Smtp-Source: AMsMyM70wk+2rOa73MNxP5ytWcklnUgpIC5IZapPPnWr3rYrItwrxB6mqJP5Y8vAElXBoU7aur6U6VOeZzFzw8wLRDw=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr3585958ede.375.1663856158932; Thu, 22
 Sep 2022 07:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:15:47 +0100
Message-ID: <CAFEAcA9Z9niQx38fK_R31PZWm7AQ-KyJ9cwV1z-QXmJAodVfFA@mail.gmail.com>
Subject: Re: [PATCH 0/7] configure: fix misc shellcheck warnings
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Aug 2022 at 16:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently if you run shellcheck on our configure script it
> generates a ton of warnings. This patchset fixes some of the
> easier ones. I wasn't aiming for completeness or consistency;
> I just wanted to zap some of the ones where the fix is clear
> and didn't take long to write and is hopefully easy to review.
> We can always come back and take another swing at it later.
>
> thanks
> -- PMM
>
> Peter Maydell (7):
>   configure: Remove unused python_version variable
>   configure: Remove unused meson_args variable
>   configure: Add missing quoting for some easy cases
>   configure: Add './' on front of glob of */config-devices.mak.d
>   configure: Remove use of backtick `...` syntax
>   configure: Check mkdir result directly, not via $?
>   configure: Avoid use of 'local' as it is non-POSIX

Thanks to all for the review; I'll take these via target-arm.next
unless anybody has a preference otherwise.

-- PMM

