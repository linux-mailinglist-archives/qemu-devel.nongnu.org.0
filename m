Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B71FB0A3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 14:27:40 +0200 (CEST)
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlAgl-0007KW-Ui
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 08:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlAfn-0006sP-Jh
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:26:39 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:42596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlAfl-0004EN-OT
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:26:39 -0400
Received: by mail-ot1-x336.google.com with SMTP id t6so15733018otk.9
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 05:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+LiKs2QWGIogAAwR7Q+kJctXjPCnXM2kgb/LxGBjE8=;
 b=dBeltwsyv6WiBYvu1WjHvVgajRUi6KCzyLjPKBc9Mfxao/cT8zx6NU4Bki3qpHFFOf
 m07PylxUJyfXcxwFI94X+c/MN41FfnvyUWrOqQYNm+cCrDa9KS+zrJn7zdZbhL/KUPEA
 Wvh8Pmwesl3HC19kVu1at1nuWgUXKUZynox9EzQPlvZqNYO/s64xbuYp2lps4Jyg3hGM
 Ui2N5sMM8jO1MMR8Oi551RVBRSFFhbYiETwsT1c81Ibt1Nh9waXjt5Njk/807LkbbAB9
 g0W9YEyqNRba6jrahqLo89e21l9AukGOpyq8yxXUUyJTo2lhO0DVimvFGuF83U898K2M
 Xfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+LiKs2QWGIogAAwR7Q+kJctXjPCnXM2kgb/LxGBjE8=;
 b=LPkyEO4j47FfGRBegCVHGqmOKYfa7ReAiiaqAUtH3Em4rAyFtJag/0uRf0qYVKEKPh
 xbG90ArGxj3jJe9Bu/7QjERvxDP3sesFNUe8NlKhK1kwvcZ/uMhPPWlwDL0+iUiTT+JY
 7nhSGZfnYg1EHLo9Q+c7zoDmsZi5DcKHbWcWdLy7jOlImgFHzEqIOQcPVxGbGw9gt6Zu
 W7sg/iYBtN4N9nZc+G7IPF4iB+QUusGNlFB/mpLlMU5oDNQIRIFhXGT/8W6rVOdAqPpo
 4OINFrtvAcB4qQ1k0B7z+8izOtaUg70fzcShjkD0i1dML7WRdwgSp1XrvK7xNsfr6fvL
 2fZw==
X-Gm-Message-State: AOAM530wXovYl5NiqzHCRisFxAaZlGZjEMMICAbVvut2DdMJB/IZrM/K
 dvfu2sRmBSODXXwIBwjatqHvWdcq1AE2Y12tLLpEBw==
X-Google-Smtp-Source: ABdhPJx+qsOR787jW3QU0Q0cCTvM9lfQ+4OsVjet6mNhVz23DfTf2bPiOol8t8A0LnGBKCsh6HsS+X/Cd6lA5U0rOB0=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr2233846ote.135.1592310396297; 
 Tue, 16 Jun 2020 05:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200615204008.3069956-1-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 13:26:25 +0100
Message-ID: <CAFEAcA8iy3qzzbcM_X_Xgzz+KOcZ+Nq4=3q=Lag6hpuwrBCb4Q@mail.gmail.com>
Subject: Re: [PULL 00/84] QOM patches for 2020-06-15
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Mon, 15 Jun 2020 at 21:43, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 7d3660e79830a069f1848bb4fa1cdf8f666424fb:
>
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2020-06-12 23:06:22 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qom-2020-06-15
>
> for you to fetch changes up to b77b5b3dc7a4730d804090d359c57d33573cf85a:
>
>   MAINTAINERS: Make section QOM cover hw/core/*bus.c as well (2020-06-15 22:06:04 +0200)
>
> ----------------------------------------------------------------
> QOM patches for 2020-06-15
>
> * Make "info qom-tree" show children sorted
> * Fixes around device realization
> * Rework how we plug into devices into their parent bus


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

