Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C452D89F2
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:23:14 +0100 (CET)
Received: from localhost ([::1]:54166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBQ9-00053I-0M
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koAGk-0001mr-99
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 14:09:26 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koAGX-0004DY-2F
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 14:09:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id m5so12377959wrx.9
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 11:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2cZFv9RZMXB+bfziInaxynUL78dOk+IqXrMuJq2mpdw=;
 b=J0fd7PIzv4BDjlDUrw8LWYzVIsOkHUhaMk79nVNeEFr47hvh8elhIJhWTwtKigGumD
 PZ7l6oaz8Khv8Elc+wdcSqJ+wC+ioIYLfOGGu2oDGTZaJAfh+sCz8uUIvC+CLqkzUyIs
 zpIELKDuP67rVT+YrQAoQ9b9W8COY4KigxqIxbY8xOcYlax9gxZcSuOuIlXPMcmZ4dEQ
 2/ubnRrHqMRgHKSy5fxtR2EdKysIKnTaL3P0rFoxqQhsyNItoZIDADLYOgCBZiWwNrkF
 ToalBKgEw6kz6qt3tcbA6pnnD2HdYtQ8cULhGlcgl9w6ne9Wc/PLBx4XbY3pAn2NbwCH
 ldow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2cZFv9RZMXB+bfziInaxynUL78dOk+IqXrMuJq2mpdw=;
 b=CfqXyAzebPN/XeGunNBfhMdwQskvJSWU7r14afKAveDGOOGLMgoGCriN07l3mcefWi
 x6EFpyZkuiuugrYesHXx8steHsyEfVH+EEXWZocQauwAEGfVQCHa/Ic2Fjf1pQEvaHCD
 MP2YX9kXPo/II0gJQjgOoqvrt4H2b+XyYjHgZsgwRQdopMHFZiZ5Jbot5ln4teTGdrcQ
 DBS6NgE2J3njxjhIEDvWao6J4qX7+8EEYLtrlrZKulTrcpLduY8rNDfeIO38g/dnA085
 2XbBwfsxBQpaD3/MrBH3ijiM44/1z5DiY+siIhOUwpbECwk19jUghSfVu5DGLOrhVQSs
 Zk4g==
X-Gm-Message-State: AOAM532ItExsKsq/njM/RxxLvuIf7HMCkQnmuTYp710yzG3kjX3jLlQ2
 fdbmIWFURcmcck4JT5MwTd9lkd+O9pgbKXa7dx4aKer5gpo=
X-Google-Smtp-Source: ABdhPJwPEBPSK7Qey2OK7QI9CI3fP3UJXH6SlctN1NONUyqulMjeUQFCAhz9xByLCNSg7bpbfncf7X3iKUB4N0uR5C0=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr15272939ejd.382.1607789221717; 
 Sat, 12 Dec 2020 08:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20201211170812.228643-1-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 16:06:49 +0000
Message-ID: <CAFEAcA8UWNS4hv0krDG6hDuxR+AeLwm=asHf9UeEcurs+m6PeA@mail.gmail.com>
Subject: Re: [PULL 00/34] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 17:08, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit b785d25e91718a660546a6550f64b3c543af7754:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-11 13:50:35 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 960d5fb3e8ee09bc5f1a5c84f66dce42a6cef920:
>
>   block: Fix deadlock in bdrv_co_yield_to_drain() (2020-12-11 17:52:40 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - Support for FUSE exports
> - Fix deadlock in bdrv_co_yield_to_drain()
> - Use lock guard macros
> - Some preparational patches for 64 bit block layer
> - file-posix: Fix request extension to INT64_MAX in raw_do_pwrite_zeroes()
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

