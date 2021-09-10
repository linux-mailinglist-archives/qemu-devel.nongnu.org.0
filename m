Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA69740697F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:10:32 +0200 (CEST)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdUO-0003ri-0I
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOdTQ-0002qU-5r
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:09:32 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOdTO-0002Bh-G0
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:09:31 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so976082wms.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oawZT0BOw9gTNa1pnvUEoZ6AAx0NXIeWFOksSyq14Os=;
 b=AD9YNvMLrO1kN5T1L67TDEuc8i2EhQ0rtwItiGNr3+8kbEKY63STpxX0Tamohtw0Dp
 Syj/UZ6Zq8z4gMBy+KZV+Hwk/icu+087ChNbE8NRUh/vAn+WcFaeqTD5FjUOrasUZWA1
 LbZtxO+ZolUX7QKKyPfB0+iCUO0nIHxzNtdtAo1KcdQQDVmitJMLWWD+1D1ZFTDyX3+u
 B4CSHn35DrhEY4QbgFX8rlnKeOh8HT6eVDAiQ3sCk9TzTvLqIEuPjTwt/wJ2nWqgDXTC
 Qycch9yaH+bs52OvH/6W8to+6O5ICBKmLLYJvCXDr3xMuJIRB7nq9cLA9AftF/JQ5gXO
 Biuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oawZT0BOw9gTNa1pnvUEoZ6AAx0NXIeWFOksSyq14Os=;
 b=xOj4pG6o3/3OCBPJjwDvqhRWVGCk4dprrXfeSfVa2/XEnPY3cVqF8DyLswICIgZR2p
 JjqiP34FokloGzckdDvxdJ7oFgcmrRe3dYqhhGjffGK4rolO26titX6v6TSYqi90FeC5
 JBMiL4x+Mk8TPzlC/Su6p8SOXwSVsrymYVwvXD1HfPfhpVdEHJAvIdrePZPGo9okfp08
 wdvEU1f8eXYck4wAkwob3QXUOKJBOwiQmPl8BiaNo54LDQcPSEa/pxjHDPN0AJkf7Luj
 ze9DRCef2mTmuHzmBfyWbcZRH4wPMUmj8PBqpKnKf+QNi8iG1YOJIiS5RyZlzX8ctVDN
 eabA==
X-Gm-Message-State: AOAM533Rg6W0962bpoA5jbbcesT2JjduADR9cwmwF3n+WLjvi5JMco+5
 OQ365flOpmAwDfk6koB7AY0yJUwfDbc5udOcxOBTGQ==
X-Google-Smtp-Source: ABdhPJwYz5HoNcxDWzE3bNSrxVuuNlVJdrRiz4Co1QlR14W8bcy7B/AF5kC9FzuDJKQ8Rd8wG3QBSUmVIVfbGbU2ftw=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr2041732wmh.126.1631268568573; 
 Fri, 10 Sep 2021 03:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 11:08:38 +0100
Message-ID: <CAFEAcA8_3ai6OGzBLUqZHKthYf6=RbCyeHhqL1Tg0fOVoL6GGA@mail.gmail.com>
Subject: Re: [PULL 00/12] qemu-sparc queue 20210908
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

On Wed, 8 Sept 2021 at 12:55, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit abf7aee72ea66944a62962603e4c2381f5e473e7:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/s390x-pull-request-2021-09-07' into staging (2021-09-07 17:46:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-sparc-20210908
>
> for you to fetch changes up to 15a2a1a4d1eecc74a87e1552f5cc4e3668375715:
>
>   escc: fix STATUS_SYNC bit in R_STATUS register (2021-09-08 11:09:45 +0100)
>
> ----------------------------------------------------------------
> qemu-sparc queue
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

