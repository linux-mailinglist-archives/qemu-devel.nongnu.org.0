Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644505F9E44
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 14:02:16 +0200 (CEST)
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohrU7-0006mO-0m
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 08:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohrRK-0004mA-3I
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 07:59:22 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohrRI-0005Da-6z
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 07:59:21 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x6so10157425pll.11
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 04:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Z8nA2h81k8dhiaZfIS2NppGaRDzaUfj/ZgulA2QB3U=;
 b=i+jI1IlyI0YN4a7Jnp4qZEmcF78/uIEfCsA8/xheLsYBMvq99kxKVBIIIKG5/+VZzh
 sdWLd2Hw3QL5pZqpulzdCCUuYBOydTqm90SUgc6N3S3L6HvgjcCP3PMbsz+ZseTYvzOX
 FIqIbhrdvVZzYY9nsu6cJDHsKn3v/lwditPLLIWF7sBHiQAnJowkubueeCInPqMO5+Rl
 28PtBbOIN/R42JoZDbyI20tckT0eW2gJ8tIIqqfLlPvYGMuxzPBjmYmlDHo2tz9gPIoE
 +enkagqD98ICX+0NDXjAvs4Mze1bNP8UQ2kpYt6SwmF5GIBJP7d0bGydriKztRELPjqE
 5r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Z8nA2h81k8dhiaZfIS2NppGaRDzaUfj/ZgulA2QB3U=;
 b=oE9HSIll/mB912yL6TeJblr0XGe79nKHN8+7J54eWunG24c5DvOufb7VldYzcBunXo
 yDzbcJAWjRffZslguPvl5FHL1/ryjNiO9vDYRpfsol8t8iXFwx4pcBwurG0Ys4mRiSVk
 AMbWjMAn/SHy9usvU4VyZ5ufsH8tw4AGEVb4X4uHVUScLaDMRyRatzj2eNUUTLekCskH
 oR+MGOmrzJhyQwWmEXVXEcbqkeX3kvjxdIHvjyNbtXaXMWgxouTOGxXEYDlMOMyJwOaa
 L+xnbNMr+EkKvR6E7ByreOjr2eQM+c60JttYMWpbQBO/Zf/JHnLWixj//fefbzwqZbry
 An+g==
X-Gm-Message-State: ACrzQf3vvlNO0aN9BgUkFkkm3a87OLAxfM7iy0mb9RM7IdhAMtK1WUTD
 1t7Am9kCDevGKeGNFNPxxxRE3RfCAFK/eqXiSwaBTw==
X-Google-Smtp-Source: AMsMyM72qQHo/EMSQQRKoxk/5etD29LMdn2C1dZkeZvXF1Z5tIa4SeOPoEzClRg3XQx8093iyVogbdnAyyNisI9OQPw=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr20263409pjb.19.1665403158743; Mon, 10
 Oct 2022 04:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221007152159.1414065-1-richard.henderson@linaro.org>
 <CAFEAcA93Urww5F+_gJonUUaLeS-7W8BhYqRgcJT1hcVY3LaUdA@mail.gmail.com>
 <ed0332cf-5bf0-34ef-3233-de6840439e02@linaro.org>
In-Reply-To: <ed0332cf-5bf0-34ef-3233-de6840439e02@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 12:59:07 +0100
Message-ID: <CAFEAcA9-4iNodxpnqizh-eH5VHWTcr+4Lwmqt7rLPO7F6SYRvw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make the final stage1+2 write to secure be
 unconditional
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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

On Fri, 7 Oct 2022 at 17:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 09:20, Peter Maydell wrote:
> >> -            /* Check if IPA translates to secure or non-secure PA space. */
> >> -            if (is_secure) {
> >> -                if (ipa_secure) {
> >> -                    result->attrs.secure =
> >> -                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
> >> -                } else {
> >> -                    result->attrs.secure =
> >> -                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
> >> -                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
> >> -                }
> >> -            }
> >
> > If:
> >   is_secure == true
> >   ipa_secure == false
> >   (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW) is non-zero
> >   (env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW) is zero
> > then the old code sets attrs.secure to true...
>
> No, I think the misalignment of the two lines wrt the !() may have been confusing:

Ah, yes -- I was indeed confused by the misalignment.

thanks
-- PMM

