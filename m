Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7425C513291
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:36:39 +0200 (CEST)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Rq-00013c-HL
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1hc-0006hm-AC
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:48:52 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:43217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1hU-00023x-5b
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:48:46 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec42eae76bso48153297b3.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MZNFHOGf5hUSZB77p5SjqAlvbcou9dQwvV6CosDCZ2k=;
 b=gv9IwORWn41jSrF8ZM0A6AF5S8ZUBuWLGK4uBjUkZasBGy6zw/GjhxRH7uV/qKzr43
 pqqcf/raGHVplIJGOJsdh7l6S7yCw9MvUUM5yIWzjnLhP0RJYkbMG0QwILw51jv3pwnC
 j2DnOZ/DX+2x/IvCK1zzh+XcM90sATDzArt15Rh+A8LKmweZs+f38Gw8iRn27WmmKNbX
 34WU9TQldVP8Afr4kFyQyKkYSDxaF2pGs1mV2rFAOC+m1D85ALgGkPi2SJp6u0CohIF8
 8kdh5UGDvoDQgeWdJ7+o45KehZRpON27BchwuNSdXwDmZojm2NrPK2cq6WDQB8EESDfY
 U92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZNFHOGf5hUSZB77p5SjqAlvbcou9dQwvV6CosDCZ2k=;
 b=rqPJqX6bweefCyzahoZzlOhjfHj+LodhAOqD/Fh2chwki2eAAMJbsuUNl6c7JMV1m/
 H11boaDN/xOSlq3uKvffzVstK2Sb42KvZ+tjf5qYGzTgCJGVqDwfQTor1XT97VTRnxP+
 XDTs3MksvGObD161J51OgZOLJWoU0cfsI4VzvEXFxskUP6yU9yaa+j4ekQ11Ue9CDa1J
 450ix9V0f8dUSS1B2zwY5s7qn+vduDRWYJhFtJgA4FHrPBbVPRCXjmqzaS5u8cNgxWQn
 Nua676cP7RJ1CdDPPoitvuHx7K6QEEbwK0nef/wCJqwCuKceBhza/W6wtXYQ1aZVJnLK
 vJZA==
X-Gm-Message-State: AOAM531mceH+U+G2fIOSqo3wmMHcHftvMXWQQH1KL99d3DKIiOtPCc36
 t6Onr9WtYwaSC7euObU9+7QuWzMzy+/FqzUEdHHhZA==
X-Google-Smtp-Source: ABdhPJwQOf+zrMGr42MwXhvl+Z5KhGgAnIck69FUboOW1hUWC65Lil+KSHB7c2NSXKuYknKb/FaBmJ5P8nC+Kp7+h5I=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32588645ywb.257.1651142923153; Thu, 28
 Apr 2022 03:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-45-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:48:32 +0100
Message-ID: <CAFEAcA-FgJi1=gwwhFj1sSusrSTJUtRQ1jO+TKEtc4tKv89gBA@mail.gmail.com>
Subject: Re: [PATCH 44/47] target/arm: Use tcg_constant in do_zzi_{sat, ool},
 do_fp_imm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

