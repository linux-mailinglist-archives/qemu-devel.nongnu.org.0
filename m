Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB54B50DE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 16:58:36 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAEw7-0006kt-7r
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 10:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iAEth-0004pW-Cg
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 10:56:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iAEtg-0003vd-9V
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 10:56:05 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40774)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iAEtg-0003vH-2Z
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 10:56:04 -0400
Received: by mail-oi1-x242.google.com with SMTP id k9so3099508oib.7
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eLm2QeF1/m+eqwXbDIM7DWhUgryCHkwjXx1QVGlNf+w=;
 b=t9bAAp1/JUoymdaiQIsYMizHEZQQo0c+ADmtbBVRI7MzR/kxyP+PTa7Tx5PgSqqUyx
 ym5q5MrmntVW7APL5eQYHRa5ZtB9xfSNXaduAm+Ou/jVqp9KZink+SXQBfcQcQIUH0tn
 q30oni7h0PjWirZ7Gi69gMqkCROkQQHy9PIM2/0aDfVi8Cl+KA5eW9iY+X8tvgrazh/0
 WVEH5zWDvXUOzRMho66XfgeUr4/Hg3EscfSg7MNHurTsc+KgScao8RyX3YzLnJZBDZPT
 /Rl6Hhaom+T261dS4Axrw9cwHjGAQnlpTiWvM8mEbMQwV38AtjKe1h5PssJjEKK87rvd
 0gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eLm2QeF1/m+eqwXbDIM7DWhUgryCHkwjXx1QVGlNf+w=;
 b=hTFc9BEEI5Bfpis6lJGpnyCeD2zsCv2R4cmbaKZKiROKk+uxSbV+mi3XRoKJoD4EQT
 uK2DYH57LZ3UxEy3IFgXJ88uQaXFvPaFLPEQnMyc3oBS9txrEg7WsWVYjmjNOjqWbRNk
 ZP+mKy3XvNv/7tM04JmVpB+CahLW4Wqwy3GBgUluH9dQVRVxfZqZ1/JjbRAYO6bLrEwO
 1Nk7lhc5kSDKAp6KQTmT9wVMePO8wGUTcC73t2Dy0Ng3VoVoLbznEMwJQO9SQsAX2vh/
 ikkIDLDK4yK3FulQrcIyxq3kZNbHsbIjpa2sGo5mvp8FVr9PQC3ySnlmARl4v68CBBmy
 6uXQ==
X-Gm-Message-State: APjAAAWDs93Nxob2ikR1vLhYKizjKwrR/rLCwn9VkUm8jpHCDdadmJD5
 n77wtaD3/dHFbgxq/KDEdL5QQc4TQjwJuAvWui+l1QF7osM=
X-Google-Smtp-Source: APXvYqycYtym/y/O1Wair0bt+m1kCWcIkgxq+A+RjUXWhMdQyTWnsYZgUCtivZx3hw/g+OkzxcZCUAq+zwlaz040x0c=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr3800256oib.48.1568732163090; 
 Tue, 17 Sep 2019 07:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190913151845.12582-1-alex.bennee@linaro.org>
In-Reply-To: <20190913151845.12582-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2019 15:55:52 +0100
Message-ID: <CAFEAcA-bTRJQDRFandUpU4jA8Yw0+SQc35uYPbDHZTn4srczBA@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v6 0/6] semihosting cleanups (plus minor
 tests/tcg tweak)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Sep 2019 at 16:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Hi Peter,
>
> I've restored the #ifndef CONFIG_USER_ONLY check to M-profile as well
> and split the linux-user semihosting smoke check into a new commit.
>
> Alex Benn=C3=A9e (6):
>   tests/tcg: clean-up some comments after the de-tangling
>   target/arm: handle M-profile semihosting at translate time
>   target/arm: handle A-profile semihosting at translate time
>   target/arm: remove run time semihosting checks
>   target/arm: remove run-time semihosting checks for linux-user
>   tests/tcg: add linux-user semihosting smoke test for ARM
>


Applied to target-arm.next, thanks.

-- PMM

