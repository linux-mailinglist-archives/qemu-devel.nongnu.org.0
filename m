Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF1496C39
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 12:35:25 +0100 (CET)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBEfz-0005kK-Ed
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 06:35:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBEYz-0001rI-NJ
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 06:28:12 -0500
Received: from [2a00:1450:4864:20::32b] (port=47022
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBEYx-0006du-89
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 06:28:08 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so24342105wmb.5
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 03:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x4METSBRCu+M+1CeFoZY5hrhO9eCehTjQqfMGhV/KQk=;
 b=SIapDb0XpZqX+oGPaORq5tLivQQBsIazBkU7neC0/rLGfcSGQ01P/fbwx8KBvMRWct
 o57nMsJC405DIRcMYaNW1FllWyqDn84uaTIo0NVJQsFEJWRSUoLtXSkWuaGJMpRWisOa
 8fdQCzdaX+hQNXTgelkP/lRcUDjyVJRpRzk5noZ2v/3YqvMLB82V1bukBdKdAel55DjJ
 tn+cvAc05qxuVkz14h2/Zhhcblkqkjw2X6itzXEh+zPlTHYXXPNBCYtthM/yVsUoCotd
 rL1/AYBH+OYXc5ePlozSfBvjgp0XrgwuWla78BbFy1olJwX1+IYXmSqYIY/Hb8SxoUr8
 ZJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x4METSBRCu+M+1CeFoZY5hrhO9eCehTjQqfMGhV/KQk=;
 b=Hv3/M3EhxkelvAe4TEYT3IwUfKMOpa+8oc5sg8+hpqEzkHdutawLRyH5J9pm7ibhwc
 /dcQMZhsE9JxpNP4NRMqfXtOr4StOndKuLeyaj1cjaF4E9YDnmES48CutoVw9qnk/Kic
 R6bTgKKbZ6Lqcanw3I6PC8X68+Xi0G5dZ99RManuQV/HBHXUSTUSYA0IU0XrYQuKiK5s
 +pThHoPUHkPISP0L7jl1bGJ8Fjr2tWc5AA+nmGj9B20QHO26GfBEPnt4ebw0O6Fu+oHy
 zW9r0YZAKBmKDB4X9ST8JeNQnBZEBT7QAsX/XjtAnMtJg5SbStJLhhTMLXWLo5VbCjNh
 1U1g==
X-Gm-Message-State: AOAM530+jbNZhWXS4jVOoczVm6hyDkgk+bUqZx4pip0zFIrytYXRZof2
 u7xGmYTUzDa8lbeR+qIdA1fdZZtD5DfcGOe5/S1f6A==
X-Google-Smtp-Source: ABdhPJy14CwKfeSHKWC07TUDvc7jWX+vSpZjo/QVr2Lbq10nJ3NkiMM9LvWRk9PWWpCWclbtEISDO6EEKfnzbqYhfXk=
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr4360418wmm.37.1642850885360; 
 Sat, 22 Jan 2022 03:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20220120151648.433736-1-peter.maydell@linaro.org>
 <e4466aa1-9fc7-a913-91e8-50c743cc4fe2@amsat.org>
In-Reply-To: <e4466aa1-9fc7-a913-91e8-50c743cc4fe2@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Jan 2022 11:27:54 +0000
Message-ID: <CAFEAcA-cCO_S3uQP1BSNhunWO=gihwV0cr=QoG72fT80=QVBUw@mail.gmail.com>
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix crash on trying to load VM
 state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 22 Jan 2022 at 09:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 20/1/22 16:16, Peter Maydell wrote:
> > The exynos4210_uart_post_load() function assumes that it is passed
> > the Exynos4210UartState, but it has been attached to the
> > VMStateDescription for the Exynos4210UartFIFO type.  The result is a
> > SIGSEGV when attempting to load VM state for any machine type
> > including this device.
> >
> > Fix the bug by attaching the post-load function to the VMSD for the
> > Exynos4210UartState.  This is the logical place for it, because the
> > actions it does relate to the entire UART state, not just the FIFO.
> >
> > Thanks to the bug reporter @TrungNguyen1909 for the clear bug
> > description and the suggested fix.
> >
> > Fixes: c9d3396d80fe7ece9b
> >     ("hw/char/exynos4210_uart: Implement post_load function")
> > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/638
>
> Apparently GitLab doesn't recognize "Buglink":
> https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#defau=
lt-closing-pattern
> which might be why we use "Resolves: " to have GitLab
> automatically close issues.


Thanks; I can never remember which tag is the right one. I think
I just fished this one out of a random commit in the git history,
but I should have checked the docs, where we do have this
documented.

-- PMM

