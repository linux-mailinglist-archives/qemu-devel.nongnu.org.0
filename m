Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE225CADD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 22:36:00 +0200 (CEST)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDvxf-0005ND-E7
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 16:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDvwj-0004xZ-NK
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 16:35:01 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDvwi-0002ru-2Q
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 16:35:01 -0400
Received: by mail-ej1-x633.google.com with SMTP id i26so5626168ejb.12
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vT3FWggpMREdYJZIRJUtwlmU/KslYvUKBwRFwxLyFSc=;
 b=stz+Bp01ma8QGfMuwcmDbnUIVrpsRsGrLYEHCK9yvAv9anXsdXa9/9zHZj4+kxpalW
 7cT/I1Ltfool2gxHbwD09FJxtQ6DYhhu/Qf/KwDDiwlEK59/Hb7PMEuk3UtVvDxnh1Go
 +PY0ry89C7rQbI7CYRkXHal8z5nWmN2pizuIjWs3DXc8watCd15+kAVa7ZtWoCExsWLo
 ZwB5GOm4fWIVozY1aSZ4W5IV256DHl+KK3Lo/LDl4bAkHg3vSXlX8bmh9S64MGUjuWn9
 xNtSvK0tlqrUc5X4dn+oI6umh/P0VbEndFg3BTngm3cH7jft0kC9+zLhFkQexmJFjXFf
 wDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vT3FWggpMREdYJZIRJUtwlmU/KslYvUKBwRFwxLyFSc=;
 b=B7jrQrlQBSOjbCRsxq9dgAKFDSzuOhSupJyrXQDafHDnLPI0FDMZVH3PC5IusbMoH6
 8fQd3jWnXkyddGuBgTJdO4aoiOYrRAo4ViwmjQoWDxJKP1fgVgfN1Bbm+Lc8HaQZPrIE
 9GaBaZwEzU2F8wbBZahT9XoMDwkIIiqnLr1muobH7I6lG5KFTes0trSZkf1TNuE+gJnr
 NMV83H/qudAiIk72lQZ8d+1Q5LZ0qN4mD8XDrY/Vrdir8SNPX9+GSlvqOzycCJwsT10o
 tRvGvMZVNxCNiakgoDQ2tl5+Y5WCKUXx6OZYQxnHelupyiJxYw1XtuREpPNWLK3CY2Pg
 G2AQ==
X-Gm-Message-State: AOAM533oQ0wqUdzYj6g4RsEukymlPKo66T3nUbhc4lIzbJxzClAKJwWi
 31NWoZ9ntgLuMOCOW1xE4Cjhr6E8MzuUPAw7QHM0Bg==
X-Google-Smtp-Source: ABdhPJyiyFgObPhps93J04dRumrsfderU3ZYtu7l4yMK71MTU4y8HEyZLz4mF6RyAelIIifDDcwo4uASMyHUhr/n1iU=
X-Received: by 2002:a17:906:59b:: with SMTP id 27mr4298196ejn.56.1599165298581; 
 Thu, 03 Sep 2020 13:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200903123130.451577-1-thuth@redhat.com>
In-Reply-To: <20200903123130.451577-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Sep 2020 21:34:47 +0100
Message-ID: <CAFEAcA-eX5D2iptriNr568PL0nXp3nrr0S621BreT_9pjiYhJA@mail.gmail.com>
Subject: Re: [PULL v3 00/15] Cirrus-CI improvements, and other CI-related
 fixes, m68k
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Sep 2020 at 13:31, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit ed215cec0fcaeaece064b0fdf37fe3bceb06d76c:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/machine-next-pull-request' into staging (2020-09-02 15:26:38 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-09-03
>
> for you to fetch changes up to 0a796d63bcd4e840bb94fbe894ae2ad77b9ee2f7:
>
>   gitlab-ci.yml: Set artifacts expiration time (2020-09-03 12:47:33 +0200)
>
> ----------------------------------------------------------------
> * Cirrus-CI improvements and fixes (compile with -Werror & fix for 1h problem)
> * Two build system fixes to fix some failures the CI
> * One m68k QOMification patch
> * Some trivial qtest patches
> * Some small improvements for the Gitlab CI
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

