Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6152B4C26
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:08:47 +0100 (CET)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehzi-0007y3-Ak
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kehs9-0000q7-Ha
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:00:57 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kehrv-0000fs-IL
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:00:55 -0500
Received: by mail-ed1-x52a.google.com with SMTP id t11so19416413edj.13
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 09:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=inm+LyciS4/JPflb4DIcLHpsbdoUZcYMtVF5NF/UHaU=;
 b=eloh+42EkoyfHq0LnK5ZEJnzlGzwKWkOInFknki6ogm21Yi3sC4q3whQT9WYQRecBj
 OAWISMT7HZU68lmqtSxFuyjhFoSd7eSD39353oFQDKSzWvWcwSpSz6WOpTX2j5zcHrCF
 IkEPFJX3FQYhsWaxd/8cWIXEbgx6UM0yFPw8Y7EuNeQlswvsD4EX6Izy7nPes/WpNgLZ
 c5mYOO8WMRA9u49CupAE5qYJg/1ZHNkvep8aS0Cm8ejTDdsaTcOr6fL3oJISr/jPLDnu
 xxGzo4V0BNVokoKX80r+JtQCf/XCut8bylAslQukWFUn0eidROBFRqFvmJCtxpvRu6+s
 gzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=inm+LyciS4/JPflb4DIcLHpsbdoUZcYMtVF5NF/UHaU=;
 b=E9UvUlVpTLjQIWMhv+oG/BW7r1PMDNDXshFV3CACGw7m3mCzGkpWaRYP++KUdeyio/
 fnQurnqBNzVAnsBEHy3UslEkslJwZb99Gk8TiZdUnZczTi/xBt+UkRPF82ZYnUWIr4vR
 d/TUuIN3UGZGaj+pL4KtD1wHElArZ6IpTx/donPky22Rw/CzkdpveK+9hEIqK6jdxkGH
 RYOjfXMCgqAY4wQ5yNA7rL0CDxNS5FGPlXbLgI9t/beA4S0ubwQPingepUnVWB7IDosY
 ATyRmDdZqCC3qGhBJgZq5GDJhu+zt5WdOElgZmYxj9sFq+kdTkg6RViGHHstZxYs6akE
 XdTQ==
X-Gm-Message-State: AOAM533Zh7wsGx34NSkMaT+0k4fTcnZQMyZd/rsWZnxx1YTuTRD14YnF
 hYuXQNHe6gArZ44jyv5j3CDO7by0OMnqOtosvXxWQA==
X-Google-Smtp-Source: ABdhPJw4e2zHD0AYVx+A9nnj/JyiGNkGYDqOmurqcOqz1CqTpuRzL/GgZkAqxEMllnJnsTb2Gs4oFnEAfBFQPhgIS1Q=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr15839036edy.251.1605546035539; 
 Mon, 16 Nov 2020 09:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20201116122417.28346-1-alex.bennee@linaro.org>
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 17:00:24 +0000
Message-ID: <CAFEAcA8O0PP7Yc1onF2toOViHaxZQvo7kFvgmizn=ZnNYXqL-g@mail.gmail.com>
Subject: Re: [PULL 0/9] various fixes (CI, Xen, warnings)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 16 Nov 2020 at 12:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit b50ea0d54bbca7d440315c3d0c0f7a4d6537b1=
80:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply=
-20201113-1' into staging (2020-11-14 11:22:07 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-161120-1
>
> for you to fetch changes up to 7025111a199b97ae806817788bec50f456c47d85:
>
>   .gitlab-ci.d/check-patch: tweak output for CI logs (2020-11-16 11:08:40=
 +0000)
>
> ----------------------------------------------------------------
> Various fixes
>
>   - fix resource leak in a couple of plugin
>   - fix build of Xen enabled i386 image on Aarch64
>   - maybe unitialized warning fix
>   - disable unstable Spartan-3A acceptance test
>   - terser output of gitlab checkpatch check


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

