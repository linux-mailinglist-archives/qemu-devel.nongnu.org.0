Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF257B705
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:10:22 +0200 (CEST)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9T2-0003FU-Rr
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE9R5-0000TS-Me
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:08:19 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE9R3-00068U-Sq
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:08:19 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ef5380669cso172891997b3.9
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z49c9rGk0UrCBJCIiuMr5B+IetBjymPYphvd2x2jpcI=;
 b=mm/6lllg9VO2cONLn3EXG3Fs29o+7GK5tCVxxN39RK49dkCRCAmCPMph9r/yIEniij
 ozhfak3UqyjSkpxeB6AE8GMr+nJeueANRnzcxqO/8OQdEDwJ/Jy9RTNwn7FOs+HEUKaB
 XFWZnU+0P1vT+P/qXdP6z3WEA6mxNPKlHDtQvZJ10uuZCJk8p+ZMwNKoDGBG6YoBKQVP
 yKgB72GgTzSkedBORo4dqC+eXrk93kud+aHI6UJHM4/8N2wkq/kZg28Y+dTRNFIcrlAc
 lMZ+2a1b3/xYretFXqaf7zhjINe8d6JR9shtAcKKnNNCKerCce92kFI5vLoDIofwDT5Z
 kr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z49c9rGk0UrCBJCIiuMr5B+IetBjymPYphvd2x2jpcI=;
 b=da4P8GAGIHa4MtFoKooZrnyrAk+3payysJ7A2TRLVr5rfrdCDvsStklHireQ3GMwUh
 mgEoW8tny/uubrzYpq6Smkv0fp2z4rcwSK0v1W6i0KG8aaSm591oDUuWcuyQ5ADdPOgF
 udr+Ugoq2Oq/8j+vvBNYty+nBL6JFlZCdGTKOLHeqdxIurl0tBZSIwOiipF0aavhXTr6
 FE3P0w0M0wLhTnzYV+U9qnc8Snqilg7twy6GtFsQW91DKZbioGoYOl30fSew+oN5pCjC
 FdeTpfPh8nCuB5ufe6QA6fbfSJSJcDrb13aVMbou3q9V87Q1xN23etNefq8SCjP1OoVk
 cguw==
X-Gm-Message-State: AJIora+a6vthDK2NiEiXx0mC28sQRGumgjlBEBfRdxKcdZ4V5mOr/spV
 LtD1diMdXIvNpFNRwEF3IHumpGpNw22DfE8QeytgtQ==
X-Google-Smtp-Source: AGRyM1uQpncUSjIKpAWv39VGPueGDwNCcUN5etPZj8Ozvb4HvQNFuQQ9PEaDpbSe2KSm/O3uG7YYLbwnt+NqdlRn0rE=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr40945290ywp.347.1658322496769; Wed, 20
 Jul 2022 06:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220719232631.25316-1-tsimpson@quicinc.com>
In-Reply-To: <20220719232631.25316-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 14:08:05 +0100
Message-ID: <CAFEAcA9pgy_=0TwLb3CBnnF-MXsVXvz5youAts36d4sKYXdU4g@mail.gmail.com>
Subject: Re: [PULL 0/2] Hexagon (target/hexagon) bug fixes for mem_noshuf
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, f4bug@amsat.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 20 Jul 2022 at 00:27, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit d48125de38f48a61d6423ef6a01156d6dff9ee2c:
>
>   Merge tag 'kraxel-20220719-pull-request' of https://gitlab.com/kraxel/qemu into staging (2022-07-19 17:40:36 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20220719-1
>
> for you to fetch changes up to 15fc6badbd28a126346f84c1acae48e273b66b67:
>
>   Hexagon (target/hexagon) fix bug in mem_noshuf load exception (2022-07-19 14:20:08 -0700)
>
> ----------------------------------------------------------------
> Recall that the semantics of a Hexagon mem_noshuf packet are that the
> store effectively happens before the load.  There are two bug fixes
> in this series.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

