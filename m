Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE24E3C87CE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:36:03 +0200 (CEST)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gvb-0002PW-0i
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3glB-00054J-MT
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:25:19 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3gl9-0006aZ-1q
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:25:17 -0400
Received: by mail-ej1-x62a.google.com with SMTP id oz7so168771ejc.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9siXxpQrVp+2h32fbWWlHGH0Rfc5Y6ojgaWp3TdszrI=;
 b=J1E/m+yF+4EKRcwmlMB13UJ0BWk69AFFAYGNjDjKaddG22qR3K8AAuwGrki0Ce54JY
 rFKPwQ3zGWqZu8y/eYktgev5mLELecYr+tcfXDK0cdjO06zkNWKyJkItL0wtKbhNCw4G
 qM0jF7Wgm/MNRQ07cRpqVIkSS5gjHQyx8UVZpoOqV85KCi5PUw2TPR1QKmplJQHFunnX
 HYiIiKZggxB1P2BOXm7xAtIvQ8ntfnGKVvKqrvTeljl7WpQ/xjPQnB/GKJ27RrSAjUmS
 zn7H+67WlLN6nZrZG+k9Nnp6mZp7w7Z3M/LWDBL68J/9Jzq8XY8d0YrB6jQuiYoVgrh4
 EWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9siXxpQrVp+2h32fbWWlHGH0Rfc5Y6ojgaWp3TdszrI=;
 b=T6wksRqOGW84ViGvirwkz0OQH1QY2KlJ15qTLyuYUV2OlJpT07LID6sBvjlOTUx9J0
 +ThmakTiWfRI0An4IN9EtyqL6ZNdZkishEoKLspgWw9OLqSFBZk/er/QCsAYdsCYEwo/
 6RS3ti1jibsFR6DLAlUAvwgBWDyj7avtp3f2UjsVGOGB8Pb08eC0F8IfFnuvzgWM5Rur
 KQk9cRZtFLZMk42iMd+I9Ip+MANWJIPulIVKFtetTf9cn/FgHsurz4H27+TPAvsKF+nL
 87hu0ivn68XdTd0cEp/9YV47KFC7DQN5+HnblWw7z/mXagSeiK0UBIKIw0I/26XKD4ka
 e8fw==
X-Gm-Message-State: AOAM530Tb+dRWtiz9qgkf33Uk5F9rZi7zMhtuxp6+Fmj3NObeNLRIhox
 u0qHmbyDYlo2j8r1XsIH/C1unkuhK0p+A3cpqg6/6veQ0Z7IBg==
X-Google-Smtp-Source: ABdhPJy9QuloCkW3CcPtj+eSzb1/72CuIpWRr+57hsYsJKPQI01OQbpppHEsOwXxv8o+mqImXPGaocsQ1jcBZjUO3FA=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr13061919ejx.85.1626276312674; 
 Wed, 14 Jul 2021 08:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 16:24:32 +0100
Message-ID: <CAFEAcA-X=eTo4qOkB+emn_niHX2Y2KKJNBEnziy17zQcEVg69A@mail.gmail.com>
Subject: Re: [PULL 00/14] misc translator patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Tue, 13 Jul 2021 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-misc-20210713
>
> for you to fetch changes up to 6e94937a54c6ef80c3f523d8560c8b6521e6c79c:
>
>   target/hppa: Clean up DisasCond (2021-07-13 08:13:19 -0700)
>
> ----------------------------------------------------------------
> Cleanup alpha, hppa, or1k wrt tcg_constant_tl.
> Implement x86 fcs:fip, fds:fdp.
> Trivial x86 watchpoint cleanup.



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

