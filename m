Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BAE59EE7F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:54:23 +0200 (CEST)
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbqo-00049H-4q
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbpn-0002XM-42
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:53:19 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:44620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbpl-0008DM-K2
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:53:18 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-33387bf0c4aso414066887b3.11
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jnM6VSP/dIqL9iD8qyhxe7atHYA8kITihiv5S2SMqY8=;
 b=EqdYSIgGGLFlqkMIMm6vk2S+hsdmP0A0SX7igPhxcbQx33Ip1gzEqRMrEOCmRXiPP0
 6ubPeoGFMUljnP1jmvGtM6T41PZ7qEZbwX6f4HboqhKX4jE+PBJNeZPIr3IS3sBfbX8j
 spVEs0eL80k9+JEanYCX/9+ReNSrd/5ePDpTIGpJKWT+mWoB47kEpc9uAQqeBnNyN4SL
 SVzJ20ajTOpYwjshVyFNyOoOBjCJ8gT/QiLc2Cqk5qkPHqx7UGDKDnrDrNGEe3hsSJmI
 J9W+Krd+CKUUCE9GHNMfmH8llf4f3qlIG6OJL7l+bUjj01E0KllB0+RZVNNhpwJv05I1
 Fe/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jnM6VSP/dIqL9iD8qyhxe7atHYA8kITihiv5S2SMqY8=;
 b=m6fZsd7ODd1MwW2ZB9WAWY5s2/G8aK9CgGFdnSkOOO9ktt3zEUoJNEV4p7RzXJDXaM
 10/eQLUvghOnFZ3VaUVkE6ryqUSPdBYGgR8Zezx/btRixivvDdArvx4PRunrGRnKeUJw
 iMrWFnihbLXcuHyZ7wFm54Yi1UNsjkJmQqe2e/N4HwDrTInAbl4LKZA6K2Ka5wOun8eS
 CZRc2NzXzptiHkbUS0fak/oBD/8dZmeL7rU3T29esNCNj3miMeSS/knqcouQVojlhRWa
 XLrD0V/4xmZpQsRtEP7ei7PGb9NLyqwILv4YJa6j1SddCj7RH3jSUCVL4ChqST0cEjuN
 aahw==
X-Gm-Message-State: ACgBeo2/q0/Vwru/dT+VgRQVePRG7Lpr5Xay/TXSJsntYoPqr5VKuHtx
 Ldf0hmNZOGjqFYTV5EijcYCeFpQh6605dJEMM/1LaQ==
X-Google-Smtp-Source: AA6agR4ozTzmyS0AFOJ7GPpQOcCtwKVw6Q7C/4AzsbOaIRod+6gWZUgWdV7AaEcsl3i5+Isbrea0ZJEaIWZPJvdKDW4=
X-Received: by 2002:a25:d011:0:b0:692:c1b5:6198 with SMTP id
 h17-20020a25d011000000b00692c1b56198mr26594760ybg.413.1661291596258; Tue, 23
 Aug 2022 14:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Tue, 23 Aug 2022 14:53:05 -0700
Message-ID: <CAFXwXrnQkNSqp1359Eu-3jgfgg8m1Bd_O_p4qPNxWN9zq4F3BA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] target/arm: Implement FEAT_PMUv3p5
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 22 Aug 2022 at 06:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements the Armv8.5 feature FEAT_PMUv3p5, which is
> a set of minor enhancements to the PMU:
>  * EL2 and EL3 can now prohibit the cycle counter from counting
>    when in EL2 or when Secure, using new MDCR_EL2.HCCD and
>    MDCR_EL3.SCCD bits
>  * event counters are now 64 bits, with the overflow detection
>    configurably at the 32 bit or 64 bit mark
>
> It also fixes a set of bugs in the existing PMU emulation which I
> discovered while trying to test my additions.
>
> This is of course all intended for 7.2.
>
> Changes v1->v2:
>  * fixed indent error, comment typo
>  * a non-change: opted not to use bitwise |= for bool
>  * fixed patch 8 to implement MDCR_EL3.SCCD, not some
>    weird mix of MCCD and SCCD
>  * update emulation.rst to note feature is implemented
>
> Patch 8 is the only one that needs review.

Thanks, queued to target-arm.next.


r~

