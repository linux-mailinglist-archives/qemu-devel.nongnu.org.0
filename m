Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CC3CF68B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:04:31 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5lfy-0007P3-BJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5lep-0006XE-AJ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:03:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5lej-00061H-KA
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:03:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id t2so27173619edd.13
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 02:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LXFEYmpIJuACB/Tixoe+K5AfPTkld05WIPlyk1yFNe8=;
 b=CDTtPY5W/epoNkl6zDf/13JZjz9+tCKWZKw9b1ZNCE0mn6rG2hNyYD9SO9POX9xhb9
 M6ebiNW2FUagU4anQxocrEGYdDZBtXnQN6SOcNi4Nbyb+W2gGxcai2Q2J/EfjMGG85oO
 Bxhn+rA7Fwhue9iL+CR6e5sdWlcNBKHdnNs12ay3OSpo1gW9cB/uEiZ6moGtSlhdn10c
 LF40/JYAmI2GN03eK2RbZ5iw5wWV9XC055/Bnly/79EGUC23H/J2awiBoa2oE43vo/p4
 y6+cXaPlsVlG0tIccFumV+ufVE2GPHNGcdU3epDDQH6dZnhT4b/hlV1rd/XBkRsndMzj
 8WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LXFEYmpIJuACB/Tixoe+K5AfPTkld05WIPlyk1yFNe8=;
 b=A24HmTe/RO0ce1SKTdDCXMzCDwTnz50ljtVuBtipSV8DnhFaAv6jhXQivNrJcbQRO1
 mzHtwzq7QKo2sW+073QFX51DEGVVV4eZFR4w8vgJC6ndV826WikoG/pTYTT4fMKkhcnq
 2E7gliEWHaGFr6NbQ7OeiUGV6w3ttGho7/5Mow2r6Ix9eoZ4CzltRdCn3Pn53SylJk4U
 /AdoOtOvp3o8Qj3k2fkHq562m7unsc6j/pHysODydhNMuHBJDkQienn8+N3GJsDKWzAc
 c/eS027XcaE855irxrGpHZuMLqQtoG2i14zgPvoLXyXpObK8eUDJAUYvHq9lbQHsxdOm
 dqQg==
X-Gm-Message-State: AOAM533EQsC1l6D7zlyrBwXbic8tWZD/e8Cgj3ZzDEs6BsEEozUXPKqH
 CmwoP8AaGyD+JaBJjY5KgmIPj35cVvhQnK1TQ6Wyzw==
X-Google-Smtp-Source: ABdhPJzi8a3MSE/L9wVc26W3HWO8L6bjrc+N7EG1Gi8bWHOXpWWSVDTjxe3sSGey9LqgBq15JrZgEs3IHnY+26sgrzc=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr38867508eds.204.1626771791828; 
 Tue, 20 Jul 2021 02:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210719172658.715442-1-mreitz@redhat.com>
In-Reply-To: <20210719172658.715442-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 10:02:31 +0100
Message-ID: <CAFEAcA93Lo7o3ig7EDmCxkJyBpfuNk+bU_ANuY-J2uFDqzOAOg@mail.gmail.com>
Subject: Re: [PULL 0/6] Block patches for 6.1-rc0
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 18:27, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit 7457b407edd6e8555e4b46488aab2f13959fccf8:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-07-19' into staging (2021-07-19 11:34:08 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-07-19
>
> for you to fetch changes up to 36109bff171ba0811fa4c723cecdf6c3561fa318:
>
>   blkdebug: protect rules and suspended_reqs with a lock (2021-07-19 17:38:38 +0200)
>
> ----------------------------------------------------------------
> Block patches for 6.1-rc0:
> - Make blkdebug's suspend/resume handling robust (and thread-safe)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

