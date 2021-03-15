Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1E833C6C3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:24:55 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLspi-0002B6-6b
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLsns-00013K-LA
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:23:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLsnq-0000RY-Oc
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:23:00 -0400
Received: by mail-ej1-x62d.google.com with SMTP id jt13so68274768ejb.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q/nuFaeOyrOC7jae12LNl8MT+D7PuA5+0CaJmZnBuF4=;
 b=MZf/wmhrieOzGCgf2pDa4IGVxwKOAywdTDWbPm6Skap3WZconwhHlHLCSqX0b/JH+/
 0uEGSp4rMCHhUjWoIiJs8GsgIN+97n9rDNEmjDzKcDemoNs3RTCbBfh3kkww/d+PkFX/
 Fy0vxgmZ9SFeek+xSql5V+si9PKXijOhSyEkalgLQoJMM6rGixG7sI4gxgKE4VeX4+3E
 cHYzwFlnyxnw3eYI62mlkZmiYbQ4nrq2XSz8MmR6XhvsCF/ywQ4yTbYX0gI+u3v0nsxR
 W9PUrzW2xFNKy5qUAANiuidx+OPrtEQ/EiikPXGsSXW+Bwp7rCMOL85p7LUrIYoh36Eu
 GsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q/nuFaeOyrOC7jae12LNl8MT+D7PuA5+0CaJmZnBuF4=;
 b=XQw25GD7GSjl/kbjCFdcYvWIhpFSfkuU0eWoJ0uGMvjHIujA14AZx2iyzKRi+hkzQK
 mpbfaGyQbtoiHOU43NbQwmE04Ao4aUfgTFlcx4pUhvTVXocHfy/BTxxBXoLSqTgjvYli
 q9kv357HjpjiGLNgpIno5JRtM3xOQeXw88fiUeS5nE3HNqYLQPvFh0ENWqfr44vpjezH
 397dsoOuYZz+zmdfc/szlMDd+Faa/jJKGTGJkys3bg/uptoRGS8tp/KBUzp+ETQJFi0h
 Tv/qKBrK4f1eaK4JJWV4zpyBdMowaris5Sg21UFGH5m28wCjkip9jySMzTrBUUDZNfo3
 P0ZQ==
X-Gm-Message-State: AOAM533KhK+Ku1qtQCTvtEwoub/oqpT/lUYlTJWaw9eB7+HSKdm+4L5I
 oGxZtEYs3nSelK7EPBpeweL43eItdrrN7KG04Y75kA==
X-Google-Smtp-Source: ABdhPJxKXglCNxuBWvHgaEBA3XkCnt2+0+IauzwKYGdJA2t6h8m4Kwfjog+l0miuw6B+od9EjFwXMtShBJ5AttPVZto=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr15328188ejc.407.1615836177201; 
 Mon, 15 Mar 2021 12:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210314234649.2614590-1-f4bug@amsat.org>
In-Reply-To: <20210314234649.2614590-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 19:22:35 +0000
Message-ID: <CAFEAcA-O_09MNtxa1e1HemW7ephhjmx0D5E=cN=yxV5xNbgQ0g@mail.gmail.com>
Subject: Re: [PULL 0/4] AVR patches for 2021-03-15
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Mar 2021 at 23:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b=
14:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-p=
ull-request' into staging (2021-03-14 17:47:49 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/avr-20210315
>
> for you to fetch changes up to 56b90e60c4019b08012bd8bd1459efc00b055577:
>
>   target/avr: Fix interrupt execution (2021-03-15 00:39:52 +0100)
>
> ----------------------------------------------------------------
> AVR patches queue
>
> - Only reset 'interrupt_request' mask once all interrupts executed
> - Documentation and typo fixes
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

