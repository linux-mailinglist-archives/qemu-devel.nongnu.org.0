Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890A23DFF76
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:42:11 +0200 (CEST)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBELi-0007kb-L8
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBEKB-0006ga-AG
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 06:40:35 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBEK6-0005ks-5p
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 06:40:35 -0400
Received: by mail-ed1-x536.google.com with SMTP id x14so2856942edr.12
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=peTnIguepTbshvPKl+5+DC9PLMjPIoK6p04pt3T4gok=;
 b=BX+Sc2EWlP9UDKU/Tg1oIXo1EwBxkAhD2tJ0j/7wknT0Ql5XdCJvdDPhSfCs1sOMhP
 e+gQC//OY5XL0C7aMbtBuMDoWcdRPGvhAWtc6Zbj04A7VkO4NYkilcK8MdD4bERa0dbr
 dOtWEBUx9KcVCcYekXVz4WUHBGR8bbiryyR/5yTWJi4B6xiKfIABQoYGu/rgTQMaZN6b
 IvEqmWWZbS4TnexsOxq2miuGn16xz3DJZmhCUEy0R+Q4ZMaK1RCgauPzugVuf9uYsOjJ
 Di2Pm6neYLpRLM1XefXOFtM57VQIuSsGV16au/kCLYJxoIq+T2Ltr9Oq7gj4nPxwvD6K
 QbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=peTnIguepTbshvPKl+5+DC9PLMjPIoK6p04pt3T4gok=;
 b=ZPEbupfB3q1vMGHa79jSgbbYjAKzwl8vMKSs1Z5jSunK7Iov+nkcfZzWI6hRWCV9/1
 HRgKrzj6U0TgNTjb5pgc1vYGWauPgWtj0Z7HmN39vTWs0pLnDRpYbUetZMhT/UaNKwis
 WuQau+8626k1D2gjk+2yP7pjUAVLJrN2jkYegSR+rmQ/bECWLJhmswkoa7rUVM//qD0+
 Er1/VvSsKJUc2Gl3ewHxOk9CaJ64oeuWW2z2T+noOzqLOq6DsoaaGQRQGK2+w5mMKWh7
 wjYXrrVjvynlJEiyHie8hy3+O2MVxsNByo74NMEM/iDsF2s/YrPE77vJlHzcdLo69OGk
 QASQ==
X-Gm-Message-State: AOAM532BImOhU+sbS/QWV2KmTBZCZJa1Tu4+S2IWVfkVhCKW0wJf/S7Y
 PI4tqB2X2kAkgEhqIlZRy0xObu0dJwfbpxYCqg7+3Q==
X-Google-Smtp-Source: ABdhPJxCNmBXm1pZzzhAQPn5MfI7UUyea0v+BQAh8JgIADwIxKERuC4CZjsi70M0DA0X9pN0fDToXgFNoMxwAd5ABxY=
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr31253872edb.36.1628073627897; 
 Wed, 04 Aug 2021 03:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210803144125.51097-1-kwolf@redhat.com>
In-Reply-To: <20210803144125.51097-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 11:39:44 +0100
Message-ID: <CAFEAcA-HFeRWJebjO-voDpDqneY8QuN4DarAhXkBqG-HUWJtyQ@mail.gmail.com>
Subject: Re: [PULL 0/1] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 15:41, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 7f1cab9c628a798ae2607940993771e6300e9e00:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-08-02 17:21:50 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 87ab88025247b893aad5071fd38301b67be76d1a:
>
>   block: Fix in_flight leak in request padding error path (2021-08-03 15:43:30 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Fix hang after request padding error (Windows + 512-on-4k emulation)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

