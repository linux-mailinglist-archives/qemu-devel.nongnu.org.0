Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A93331420C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:40:56 +0100 (CET)
Received: from localhost ([::1]:37728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EH9-00021x-7C
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l999C-0001sv-DU
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:12:23 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9997-0004Vp-2a
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:12:22 -0500
Received: by mail-ej1-x634.google.com with SMTP id a9so25713945ejr.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N6OhmQe5dU6Kegl0uzjaOeOFtObGxivtc0eBxTdIrP8=;
 b=YgxD6XxGvmZ2FR5O6LVcYWA0FCCt1Y1W4zuebLoygPg9fUon9n99AyqGHhC8xg1mN3
 IpQ/1qGak6CmI1smix4kkJdoRFcx9ONm92jgC5g5+Po8JLT5mDZKWXBDD7Ss5EjpPeax
 y9XsBdEpXXh/pitGhE/Fafch4i8CGdgHzgCXzrKlM+Sd8ctIXaxQbV54ko43uqW/t0W3
 v+hvwUVgFaCz/S42JWRASQRvjgD82LeIKdEpYG5AxQzNYJEptDN5YodDvyq0lWDrMh0O
 aDb8qsO9yQSCKtodqCONnSkBq86ySLrkhZEVoefcqAycD9EffpS6MatS49P5xjqGcGM3
 w+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N6OhmQe5dU6Kegl0uzjaOeOFtObGxivtc0eBxTdIrP8=;
 b=Jj/na9R+r0McS1dEPm7w8VICMDDd+wDx85vXySXcTTPObYOwam0f4IQuwz5aK8Jpfh
 OxsQW1iDGVO3oH4DqT5x70Nkqbxg4k75ln+8/+skEZBry116hWQpBXtBZwpX1N8CrwZO
 xv+LDRTledHDAmChjiTe3/MTPSDWTcVNwi6pjrXjBLywuUt/h7MafTfH+6qCNjU4/sWh
 4C5Py7WDzPBHh8L1GlG6/SE1NPND09hOAkpP/wOi1UEyvBWka4LUD+doKOu7FaVXd7q4
 WcJOk/zCXkoy0XzNyoFwKhG0vQ2iuLK6GuNR/6pvhBY5/8PRTXtzMw6oZVP5q9Q+t4GC
 lUyA==
X-Gm-Message-State: AOAM532KuIsD3oUTlMOWDnn0sUWRH+k1Z38blJ20xN55GvdebuJn6ENf
 BuFjGOxA0/PK/jFmH34Rf5Xd6UKHBqIqCSXlW5Tq8w==
X-Google-Smtp-Source: ABdhPJxrnifjxjiRPNwnKjAHH5rAwyqRMYu/CZR23dyMc6HpGY+8AzQsTjEpsEcydSKG6SULbSKwlT20SlBAVvvnmwQ=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr17613176ejh.85.1612800732687; 
 Mon, 08 Feb 2021 08:12:12 -0800 (PST)
MIME-Version: 1.0
References: <20210208123821.19818-1-alex.bennee@linaro.org>
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:12:01 +0000
Message-ID: <CAFEAcA-686CdbiMRi9pxVHsXmg=-i7CirXMGrcagRvQrGNmSqQ@mail.gmail.com>
Subject: Re: [PULL 00/16] testing, gdbstub and doc tweaks
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Mon, 8 Feb 2021 at 12:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab=
60:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205=
' into staging (2021-02-05 22:59:12 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-docs-0802=
21-1
>
> for you to fetch changes up to d994cc54498e8952113110b07a76dbfecd46a909:
>
>   docs/system: document an example booting the versatilepb machine (2021-=
02-08 10:55:20 +0000)
>
> ----------------------------------------------------------------
> Testing, gdbstub and doc tweaks:
>
>   - increase timeout on replay kernel acceptance test
>   - fixes for binfmt_misc docker images
>   - better gdb version detection
>   - don't silently skip gdb tests
>   - fix for gdbstub auxv handling
>   - cleaner handling of check-tcg on tcg disabled builds
>   - expand vexpress/versitile docs with examples
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

