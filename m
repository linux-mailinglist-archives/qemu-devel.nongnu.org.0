Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F93C38F2B6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:04:06 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEvs-0001ab-Ol
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llEuI-0008UQ-5g
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:02:27 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llEuF-0001qf-SC
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:02:25 -0400
Received: by mail-ej1-x62c.google.com with SMTP id k14so39702498eji.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wk/YzzYQ7QcM+BcSYIQU2OGoN0AV+RdW516myBdN1Fg=;
 b=OdH+Mi5ZEM+WgGXuHwwOAP1AUgoBSKgADUINpXmN9esRLCRaH3xE1vUDSmJzO4oTAz
 gzgg32+1d4rhFKBtLtsl3XpCGObRXn85QqRS6kKbJJMiX2hRlDiEqrD8Kix69HdMIquv
 RYADJJVZjkkbaJhZq7L6V46US7m0eyHsu30tk+sdnDuN5+gsopxW7tmbunmd17gMd+ZF
 TPwjmizAHWHKsOPzMob7D97tdyRZj9SDSFDPmhGNwyg8/IroW+lc3uoyBYh4Yxu7NI12
 rXJ/2HKon+3NWHY3nupI49pH5ewv0YdgK8usVSL188K5pbfk8p3EyHShH5RnWPa5ayrz
 ekwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wk/YzzYQ7QcM+BcSYIQU2OGoN0AV+RdW516myBdN1Fg=;
 b=A6R+yXaEQoM+wtOoV9iPw2BfyKr4G4fFnJPOcvkOcuQ/PqYCotnQltTvEjDPXRCclP
 zpcXGogmogGTVjf1E10ZejEoJlNCbICoL50pyo1rVNXcbyKpRO99dkYG8RL/nYeolKvg
 8ZqvVB4TvWaxZZRe2FQEOYJUcNWRJFLqXEyMrT0D8LG0LyCJy+WSANFeHEoHZ4A3D/lO
 Slv7NjACHtKCLQHRVSoeCxe/e8kz5Rk1CtCtG3vA9IQuP6YMkKBHpIN10hZw97Y7cYwj
 MvBwa0KgTsWkWn+9xaxfDMXmMkL5rbjp8o+bqYNXQ9m0Xcna5m7jVoVIuYPPlV0dIfQ+
 U73A==
X-Gm-Message-State: AOAM533q8E1MnnrdOyE3B1bRkyj0viZ2+ZEuIYjmVSwN1ej1Wa4fTviu
 hkEDugyagU6Vper45GRudjFgECPZS/pPo92t5xNJ0A==
X-Google-Smtp-Source: ABdhPJy1WTJO5aiztR5jhZavbvXw6XpbYGqNVw/a1rS1hCgdK0ElFtfzFuOZXh+HlbiLbFq1OhYU9Nv8lGXnIqvEgN0=
X-Received: by 2002:a17:906:4812:: with SMTP id
 w18mr12752668ejq.4.1621879340914; 
 Mon, 24 May 2021 11:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210524130150.50998-1-stefanha@redhat.com>
In-Reply-To: <20210524130150.50998-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 19:01:58 +0100
Message-ID: <CAFEAcA_Yhy5fpMrODR3pv7AFkvshWSBG8OKPQYbn8mt49JFwLg@mail.gmail.com>
Subject: Re: [PULL 0/8] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Qemu-block <qemu-block@nongnu.org>,
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 May 2021 at 14:02, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 6c769690ac845fa62642a5f93b4e4bd906adab95:
>
>   Merge remote-tracking branch 'remotes/vsementsov/tags/pull-simplebench-2021-05-04' into staging (2021-05-21 12:02:34 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 0a6f0c76a030710780ce10d6347a70f098024d21:
>
>   coroutine-sleep: introduce qemu_co_sleep (2021-05-21 18:22:33 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> (Resent due to an email preparation mistake.)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

