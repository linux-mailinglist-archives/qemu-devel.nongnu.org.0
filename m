Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50FE33A490
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 12:34:10 +0100 (CET)
Received: from localhost ([::1]:42196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLP0b-0003tY-7Q
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 07:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLOyt-0003OC-NK
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 07:32:23 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLOys-0001lk-0J
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 07:32:23 -0400
Received: by mail-ed1-x52f.google.com with SMTP id bf3so13961569edb.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wvwTJG5H/Q3b1z1xmS0RVMrIyqaZFtH+JVetPpyMD8s=;
 b=qbO9YX6Nx1q/qAH5yrZLQfFUi6s/FrV2/tykfIAEOFs29BaR41Xt4V8yzaj4Vx4lkT
 lD8o1OqGdbD+NVnPvZyJXkaYIcc2+JWSbb8q8PU3p1l1W1Zh51TA/hYVzkZF1c/A15rQ
 7wAm5KHJKAZQ1uzz22y08DTEeZQhV+FDJIGfogk8p9ZujxRlex1fYhPQfuAcd7skSlAc
 nAucRNU9eqO/KSrtQESlJa5beSuv2OioVtF+XvCraXwRmWGawyjzNcLrfiGIFZPgvmR7
 6G6D1SvsEChMs3HWPNlt+y/P/lQL2DY/oK++bv6Sir+3Mog5jsDkDQNHdYKQff/S4nBU
 +SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvwTJG5H/Q3b1z1xmS0RVMrIyqaZFtH+JVetPpyMD8s=;
 b=CIOeubZtZKzaZLCoqo5TFOqUtGoyyq8/xEhNuy1qsmNCuFpKUbhm11c3jY9eEnuoH3
 LHBXNtcPo+3bYKfLyNa6wu1tmF4vgaTY/LB5WUYElX48ZSgqyCgaWzmPFojY7VqqfA34
 wEyhO6Zx0XOmnKlyE8Evltd1WTPw4eCTs4ehBETA1LJCa+FWsUb/njxA+ne+mxnQZwPl
 oviZM1XHYOcY9KNpbKEJeF7H6mZWOe8j0gbeO1MvDIpz4W2mbn6y22VWRIAV5tePc0Ou
 +LBVVcYvX/kw3rjTx4cje1+Gm+Q0HK9K6NKz9rKM5j/eYWURlFUTQvs+e+Fop95PQp6E
 3KqQ==
X-Gm-Message-State: AOAM532XJ+ZP1x99piK5dDx+pr+3VGO8wMBMmAkIF4fUmXA3HivGEem3
 h51iHSRmC8fM/HpTle0YfzvD7cbKqAwleXQK+qciTQ==
X-Google-Smtp-Source: ABdhPJyZPQuaXY9Ev+5Enr8Um3zG7JuJARKPgKjJ6eDghFf4W432K6iAJuua1Bxnlm+apb6eBef8dDAwE8HgExiWBmk=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr24085757edr.52.1615721540228; 
 Sun, 14 Mar 2021 04:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210311221827.2595898-1-laurent@vivier.eu>
In-Reply-To: <20210311221827.2595898-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Mar 2021 11:31:58 +0000
Message-ID: <CAFEAcA8zLHL6UqGpKf7QLYbYrkuF51zyZ-w_seuDvY5xJLUUwg@mail.gmail.com>
Subject: Re: [PULL 0/4] M68k for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Thu, 11 Mar 2021 at 22:21, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit f4abdf32714d1845b7c01ec136dd2b04c2f7db47:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-docs-xen-up=
> dates-100321-2' into staging (2021-03-11 16:20:58 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request
>
> for you to fetch changes up to a9431a03f70c8c711a870d4c1a0439bdbb4703cf:
>
>   target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature (2021-03-11 21:12:32 +=
> 0100)
>
> ----------------------------------------------------------------
> Prepare MacOS ROM support:
>   - add RTR instruction
>   - fix unaligned access requirement
>   - fix ATC bit (68040 MMU)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

