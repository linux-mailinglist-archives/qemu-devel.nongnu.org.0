Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF8345C35
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 11:50:54 +0100 (CET)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOecd-00059b-QW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 06:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOeat-0003yt-OG
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:49:03 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOeaq-0000Vr-RE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:49:03 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b16so22903492eds.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 03:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+x/oV5g4bbivSW83nPpVufkEOLXiwjU3KHi3Les0UXY=;
 b=XWg8aBIvDMgdnJdG8ee592SMhVeZ4EOWnSspo+pzwwgwxs6WOZv7UqaBEzcx4MOCwA
 66sdVc/W788PcW19/rWnd+lz390Ob39f9RAwk6R8XIgxGxlWcKuMkL5oUlNHWdpYBBMH
 jh1t2o9RMNeKo2Qs1Xs6MXIhgBv5uUlgHlFXoorfsDfmdQ4r8duIt8tqYzlAeBhYOC7o
 MgXFkiOUPD98Lf0bX/m6BGsdKmEzGH1NIZuD5MQtFXKYUThntpCQs13N2trponcsPDeH
 BlpwXaUxu4hm0ZcghUbcYePZGElRQkKlnC+uRxhE7oGD4uIoNwnvLq4T/5NbfFwGRBoW
 Ya7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+x/oV5g4bbivSW83nPpVufkEOLXiwjU3KHi3Les0UXY=;
 b=BjDHbcy0qnojeg+Ga+3lzvT66a/Xap/ml5A/dHrjl8G/ghxnItMxOW4SATukrUNliD
 d1KhWzkPNrHjUf8VgCwdbGVm+olXYGj7qpDOFJk674o6G8A64P1VywlEEZDLkQb8eC0D
 VRin9fY3d1xYrGw+RDBix8GBsUOFDGI6X3xw8j/Tz5Qm/bYIHMmhTb4PSN2C4nLCEvZZ
 YPX9lIGmtXDCrJUlrzxn8Zm+uO1OCLlzmn2kUL/aWZbnVzpSEzyjC4GaB9DD9e/vO/k/
 ZgNx99CPCbZHK/dp3HxobtMSqqNzHhIJQAKAynR1xfR+qI6V+fj8XMXqN7VjVPbgEU3A
 WzbA==
X-Gm-Message-State: AOAM5337LiEc427NlKPZuHBNh+DP5eAwsocksNxxFK4gqLLNuxjQsp4h
 BRat6wxyxwE2q5+ZWvsTbO9nBj0n127DjfE6n+VQaA==
X-Google-Smtp-Source: ABdhPJxr90ijveOVGN8OzGrqDagK8W/PNm3TPkGvuzGTmtbT+igrCpy6kez2neLTYKy1kJV1BwXUuMRZJM0Zhkz6twI=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr3978977edt.36.1616496538563; 
 Tue, 23 Mar 2021 03:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210322171610.4183696-1-f4bug@amsat.org>
In-Reply-To: <20210322171610.4183696-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 10:48:29 +0000
Message-ID: <CAFEAcA9=SYQDBO7owH40rbGy78sx2Q=OGupE-rU0YwLc6mVFJQ@mail.gmail.com>
Subject: Re: [PULL 0/7] SD/MMC patches for 2021-03-21
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: =?UTF-8?Q?Simon_W=C3=B6rner?= <contact@simon-woerner.de>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Muhammad Alifa Ramdhan <info@starlabs.sg>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Cornelius Aschermann <cornelius.aschermann@rub.de>,
 Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 17:23, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit b184750926812cb78ac0caf4c4b2b13683b5bd=
e3:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' i=
nto staging (2021-03-22 11:24:55 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/sdmmc-20210322
>
> for you to fetch changes up to cffb446e8fd19a14e1634c7a3a8b07be3f01d5c9:
>
>   hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when a differe=
nt block size is programmed (2021-03-22 16:56:22 +0100)
>
> ----------------------------------------------------------------
> SD/MMC patches queue
>
> - Fix build error when DEBUG_SD is on
> - Perform SD ERASE operation
> - SDHCI ADMA heap buffer overflow
>   (CVE-2020-17380, CVE-2020-25085, CVE-2021-3409)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

