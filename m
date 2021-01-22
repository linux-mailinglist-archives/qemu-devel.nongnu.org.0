Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955473003E4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:13:51 +0100 (CET)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wG6-0003oF-Fa
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2wEO-0002uM-PZ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:12:05 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2wEK-0005Tu-2k
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:12:04 -0500
Received: by mail-ej1-x636.google.com with SMTP id l9so7599160ejx.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fmzyDORVW5qLkhP7NSsuhA9NozOV6uD379krB3AmQnY=;
 b=PRDxBnOxOXBpgjbX0MjLlExJd2/GXEmxnzV2TPiPD5DlCsJG3BEc/Anu6tLy4Hyumj
 4zHsz4ZAPbtfmZLnXYMS4ceRiUIiPrG5MMogEP+6rBYQZrthh56ZRlKD1fBcPTlw2Sds
 4bEsQXoZLG5gGQNXpn1TIwqbz6gsgWCVJGaXGICgJbJc3ThK58MCxTxL1DBOHai3dYy3
 mvGZzLv0NnRofPtEQHO0lFyI7c40LoorolTfHuyBweYiVNxoK0oAUavDHHNbO0yKp/gC
 DuGPIvHepCuyrpC6IKCmaeZSnStRkJmmL2LXPHuR0H+75u4F0oYCdXwwHpc8nnG5lQJN
 iNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fmzyDORVW5qLkhP7NSsuhA9NozOV6uD379krB3AmQnY=;
 b=Mq8omu2HV8RE3pfTZpv3hthjPeO8zI7pHxQwrgHA6n43RTmsSyyVxbOiJXMO6JlV8U
 QXiGoc4PJZRSPAOKn4DCgDDtPuyDzj+CgypCyWAz0a7WNHlaArcoWf9u76byBJZHZ7+G
 5MIVEL9sNN4JJw9AmgHTk5Ig9F7BNRoTdDE9Yf0k0B9pdrPFDTWgDD9CFbfzbNJunuF9
 g37NCJ0kO7tf+t8L8jF4hI79q17uTIdKwVfFeyxJuqBa8s9PDRlDyftH8kIx5Q/O8xWN
 fp9Gn05EoWhJlMGfSf0MiwbdJVVc9+vrOqlRGBSE0WnGLUfcsfwAwFKnk6u5XEXScpuE
 OoFQ==
X-Gm-Message-State: AOAM530xzUp3dh+RK4hb3hktRU9yOjE8ycE0PL4eKc9UrM9iKd8qu8L1
 S8x6NS/GaVZCcUA1ejRQ/7k4yRHajP/1OXJlItqgrw==
X-Google-Smtp-Source: ABdhPJyQq24y4edwqd+oj3PBsnglHR86R+pGYKzC3RuMfMzfpFdPFpWW84C1FYkNmu8bC0GIWcHsb6rml5rP+Wj7DIk=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr2848355ejz.407.1611321118374; 
 Fri, 22 Jan 2021 05:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20210121123852.91187-1-laurent@vivier.eu>
In-Reply-To: <20210121123852.91187-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 13:11:47 +0000
Message-ID: <CAFEAcA8nyGio9m+ZxoQUEp5YG9u6Bj558P_rPQWJu=tjPqN=Aw@mail.gmail.com>
Subject: Re: [PULL 0/5] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Thu, 21 Jan 2021 at 12:43, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-2021011=
> 9-1' into staging (2021-01-19 15:47:23 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to b1d2e476e94cb215d9e19fef1049d413b414ffc2:
>
>   linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-21 13:=
> 27:34 +0100)
>
> ----------------------------------------------------------------
> linux-user pull request 20210119-v3
>
> Remove obsolete F_SHLCK and F_EXLCK translation
> Update sockopt
> Add F_ADD_SEALS and F_GET_SEALS


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

