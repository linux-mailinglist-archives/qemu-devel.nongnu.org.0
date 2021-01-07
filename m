Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C52ECF53
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:06:41 +0100 (CET)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxU3s-0006zz-9I
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxU2n-0006B6-N3
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:05:34 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxU2h-00054P-6e
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:05:33 -0500
Received: by mail-ed1-x536.google.com with SMTP id b73so7430081edf.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 04:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TQJP9SHvhtgCE+LhCTsQ1Cl6QLn6MFbDlgkF5dtNERo=;
 b=H0FWXnEOYDe2KC+gU6R6KLn/9+v0lECSxO6KWMunTAuPvC+1u0SawP9xTK2FGJo7Sl
 GOhwigeKhktZ0XrK4G5jarl1DF45gD2GbBux8w62Z4OkV0ukYUx+6iYlCZAfzQgxcAAM
 S6udiXdWznGkVqU4rioA6My1k8TsquqPCTtTHohFHsB8aiuBnQjho/VrPfDmQCqu3es1
 bJ2u6/6SF0R+9EcPHl4pXn0V9qEHwjjaPm+jK+1IxUwQQ9WxTEO9mPb5kn0wgGYS0R9L
 p03W+RKX0FNOTFZfTaDwIJwHFwajUJIeUFoQeO+mHi33CpmIcY303fUa/5nqNhfgjVOI
 t6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TQJP9SHvhtgCE+LhCTsQ1Cl6QLn6MFbDlgkF5dtNERo=;
 b=ZrKWu+UeemY/yjpq7AMfV0Qn7KCE/hnKEFu4HdxRSCZj2ZdU8SHfmmuhjYFFJcJ5kU
 3SqPEimsPE43AKSC0ArSlE+87vxTLFOKMRVYnFOU3qkZuC9xzZTbH2XBiXtqGvu4FZy2
 fjgI3zDQPATazNG+ojCcUs1QzFL/cyu4iC54Q0VxZENYTP66F5Si/MDIrDzXNCdZOvPb
 i6tRCi+2cE3Vzu46x4BKn9gXho1b3K5laEl0e2iATOFx2oG5NQT+WcUVPoxrXFaNcgQ9
 pGj8DkV7Qq9DRdHx7B13kveqVghwWbmTg5grydMtErJr5IM3eEXvOU4zcnEro1Su38/J
 N21w==
X-Gm-Message-State: AOAM532VZ4aLsQicrEtdQTBoJg8DuxVYqGgrUqk5OWQdVd12SbO7dAro
 xtQFpiZLrUAii/wktMUm1PuPq7OwyrWAaDZHc/cm3/wbRcg=
X-Google-Smtp-Source: ABdhPJygyxZajpU0qMBcWEA0F02iT9+o32xORVZjP4FmsNDofRI9ggJd6r6geddcrQfRf5Ei6quP+PWZh9+1Q/BVQ5U=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr1463569edq.36.1610021125186;
 Thu, 07 Jan 2021 04:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20210106202616.20004-1-alex.bennee@linaro.org>
In-Reply-To: <20210106202616.20004-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 12:05:14 +0000
Message-ID: <CAFEAcA9g-VTziowONbB2dZDKG_kdL0y8-p-Vf3JydpJPf05wow@mail.gmail.com>
Subject: Re: [PULL v4 0/4] more testing fixes (all green now)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Wed, 6 Jan 2021 at 20:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit aadac5b3d9fdce28030495f80fc76a4336e973=
28:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2021-01-06 15:55:29 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-060121-4
>
> for you to fetch changes up to af229fc367021e361cebaf84acceb01f28922cc4:
>
>   cirrus: don't run full qtest on macOS (2021-01-06 17:30:02 +0000)
>
> ----------------------------------------------------------------
> Testing updates (back to green)
>
>   - include ccache in Debian 10 docker image
>   - iotests: drop 312 from auto group
>   - bound reading of s390x framebuffer file
>   - cirrus: drop non-x86 tests so we complete


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

