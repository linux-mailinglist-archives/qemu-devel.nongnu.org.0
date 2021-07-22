Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59363D2671
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:12:07 +0200 (CEST)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aMo-00070b-Tm
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6aLh-0006HA-7c
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:10:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6aLf-0002PO-Jr
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:10:56 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t3so7214342edc.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YgOeg37Z+4egBEo9IYQJfeuFYaLAtvz39o8E11hknyU=;
 b=e2pe9rXnrL2lN4F40/Qf9gKGGq3e4FDo7V1bUBfnb3G6ewt1nAF3UIwU7ygTPFwnT5
 SUWw/lSXTj+MQ55e31HtbBbNY4a00KoS98XHP+vwF81+MzCcXHIgKbz7LHoR88FmuveP
 BvX6SOUX0fA4SbWsgQIZzuUlk0BaQzR2TErWq+u04XdcTF/o6QZZxv3w1IgdHWcB56z1
 E+9kS3/8MZKrw5NlwoW93QmaTK01qu8H8vfm/w1YNYKHjpNoq+KPsLDmBt7+f8HG9iBm
 fATvr/DTYL92LidJBR4pgYiDOy/teomZagGJWMD66J6x7JGWhgE7VBaqY37HDowI9L6C
 7G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YgOeg37Z+4egBEo9IYQJfeuFYaLAtvz39o8E11hknyU=;
 b=cvmfkiNdSTbQV5lY2UVIc7wyuJ/DS5atNCSSbNLwyJpE07FcnbUXT+aOAeZMyAAOsM
 qE/v8eQ6pNtgebtoW6t0bIQyVnvxWDCHmiZPdWdoobWd77Kb4g73r+aXdfxlV5rRltrV
 X9MCOSbXVs7w5727HO9pHWfUAflTZlOM6qOKqEnlNxIZu1/Ozj7u9kBnCJoobR5rFuuI
 M6tLaDeRq8KMZA7XxkEr0jsLthW7MvVKmgyC1F0Bc+oadhRxvGi0tyUZOHdSo4JGsMOu
 xHGknFTVj3GsQ9hD6PcOzVGxAh65g8hIGahxMnaT90OSoh+/syGILHUd/ATPUQ3QzvSQ
 yXcQ==
X-Gm-Message-State: AOAM531PYvAbwFoMykr57yVTOWcjcnaaB70+eRDgiSpHEdBdgqMvSWsc
 HlnQ4atu1ghcEOezBcVTWq70Nu3PpR+GGYYdWiFxhg==
X-Google-Smtp-Source: ABdhPJxiHy7zzKzqg+M3HogeLDTcXauNk/oSDMNQeBoMd8+lzEvCo/5/+AaBpBU4vxMBoYphe1FC/L7bxm5BIcszlCw=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr147991edy.44.1626966654037; 
 Thu, 22 Jul 2021 08:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210721195954.879535-1-richard.henderson@linaro.org>
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 16:10:12 +0100
Message-ID: <CAFEAcA9wKe-dynKKjzOguN0oTVH6RhaTeapu5Cwuw55qdK+y5w@mail.gmail.com>
Subject: Re: [PULL 00/27] tcg patch queue for rc0
To: Richard Henderson <richard.henderson@linaro.org>
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

On Wed, 21 Jul 2021 at 20:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit e77c8b8b8e933414ef07dbed04e02973fccffeb0:
>
>   Update version for v6.1.0-rc0 release (2021-07-21 17:10:15 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210721
>
> for you to fetch changes up to c2ffd7549b14373e9ca68eccd84fab141ffde646:
>
>   accel/tcg: Record singlestep_enabled in tb->cflags (2021-07-21 07:47:05 -1000)
>
> ----------------------------------------------------------------
> Atomic build fixes for clang-12
> Breakpoint reorg


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

