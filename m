Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B23AB64C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:44:18 +0200 (CEST)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lttFh-0003AG-L2
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lttEt-0002VK-Sl
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:43:27 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lttEo-0007he-Td
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:43:27 -0400
Received: by mail-ej1-x629.google.com with SMTP id nb6so10245021ejc.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TaJskMe9uo261Cm3VzDsgoY1PfpT052U56EHUdCmVMQ=;
 b=o2RYiFukuhYEsq9kD4XAgB5pcGcx1Si8Tss52TvNS2d2kgUxrGgZrEloXpDs7dHtga
 BS+IN6yK9FWouJRjh6pi4BP3wMzNfquzVa5ihWhqUXM0Lf/+Hscqgz1eRJJHEosW4l93
 7Lkexhdnb6xyAdHhcuxuM/fPEkjHWLIyw92LUI767AdxpaVHft6ybuMb92qZk2vtszyx
 S0dtuIlAxYWYG19KN0TVFxDFxtFux7IEqGX2e9Q8Jh/zHr/NE6O598b2wlKCEH9fXSKi
 h6l0GYyp3WKHg2A4wgDyxkM9D3UAYhLEJTXO9d6C0JzhTgCm9UbPT2nTdMpkGo1XwSIx
 4nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TaJskMe9uo261Cm3VzDsgoY1PfpT052U56EHUdCmVMQ=;
 b=PZ9WzdgKqC0lCJiWYFsPb+v/57uHWm+LySnWqgnsTm//qT0UG9T0N5LvW5yZvesMjE
 s99SVI1QJN6fRlmFWoFIUOWp+eAzuMWt/Ar5gdeQjGW1+zfqp/lx5nSKEz1PdnnZKrXz
 nRt8bnMtFMhHR2CVqFSNtIIW7QAQESeyI4x4T/UL8f0frhNzfdN705OpkkLSgQSuXsNN
 Gr0TTU+EjPBylRhlfYesHY7Bie65i68I893gZaEhVuRoBAct9cTrW4BoHgbZYDB5/BIH
 uCsjJ+Vtj5+Slf7eRzEBnVwb3rO7/KncHz0h9zgc3M65ag3Z5H8HwGcBYG7LZ6s8wRQX
 7mCw==
X-Gm-Message-State: AOAM532vxPGom6Vlr8VW2Io4aaytJcgnxQkrWm4YYc5oTlQvl49bI36y
 nh9ZHpp7Jg0NxaBOkrw9lj92roj/TcEZWttOf4vDhQ==
X-Google-Smtp-Source: ABdhPJymRbKeGDFMsn0rFaHcmWOcNdl6+t15HLU/DTZf7fD2vhney/Subv0X8l7OEhF72do9YZn53uXVL3W+k2c0Eos=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr5771901ejb.56.1623941001060; 
 Thu, 17 Jun 2021 07:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 15:42:45 +0100
Message-ID: <CAFEAcA_82Fx1_RZyifq_BTWX5NBwQPHPpFSyH8Ht0Cr0qZZppw@mail.gmail.com>
Subject: Re: [PULL 0/8] configure: Change to -std=gnu11
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Wed, 16 Jun 2021 at 02:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-c11-20210615
>
> for you to fetch changes up to c7a7cb5692690ad621b6eb2d1c7256907ff45d67:
>
>   configure: Remove probe for _Static_assert (2021-06-15 18:31:00 -0700)
>
> ----------------------------------------------------------------
> Change to -std=gnu11.
> Replace QEMU_GENERIC with _Generic.
> Remove configure detect of _Static_assert.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

