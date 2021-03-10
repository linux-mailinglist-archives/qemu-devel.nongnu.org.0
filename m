Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CEC333B06
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:06:26 +0100 (CET)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwfZ-0001V4-3s
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJweb-0000wT-35
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:05:25 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJweX-0004Zu-Rg
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:05:24 -0500
Received: by mail-ej1-x62b.google.com with SMTP id e19so37877433ejt.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 03:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2gmTIazz7XgYLpJAw/8SmT9+kU+rnaCNREIY9Qoc+A=;
 b=DUoCFI5bANnS4zwAlzq1B3y8fCDul7dW2Uen9QrSM8hFYDWbw/dVYY7AYNcUMwyn0Z
 WiPlJbw1RZexYXyV0iRph4gTN4J2uCfoGqy8+D6LSfXlrnplJP9EEhQnCLaLQMq6XrwN
 gZflGreiJSpHIyuhjdOGSvB+BGl3hqfvSoS29+nla2B6MBSzqDAlVuAWxDmk2hWX0w5P
 q2wy5Tc1/GiANaoC4bwJU/c1YjmZ7TdrMEdQnNJ8xJtIPIpAdooxVDChzIJHe7eHoGW8
 dSSDHQ+QJ4LXsoGY/iPzwMKhRstP5/B1l9IfuUitOrCgURW4yZjEOunEblJx2gEREx/o
 vyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2gmTIazz7XgYLpJAw/8SmT9+kU+rnaCNREIY9Qoc+A=;
 b=Airsmy+eFm+utr9m0CpJjjy8g1JLqsGyhxtcXhNeuScsIG7e+YVKT8f2NukOOEgzA0
 yS1lsurq74VYjv47na3eJQAIZG3DPB+Bo/4fDWsajZucb/kC3IPzr/sfSyGdF9kq6hrH
 Hx/hidkV04PUB05sKOzE/dzJ+441+gPGMMb5Vf6+fAK/5e39vh8UP8FnSc11t2AwRIKH
 LqFZ0vGwJ+r2d6bFLw9QwkJFc5y+lEXoR1IYigj6/v5JPSP4+bt5lbB/UjaR0SVzFHLI
 adF+P4GqxeA1a9r7yDuTu39SFpWOHLcGEWgHpaVtSrULVEmCMOfY+bYmZhe+IA/K3cel
 b2ug==
X-Gm-Message-State: AOAM533FJtOSejpigmQISNm5KWV7ZeY2FAG6tq4rpOg75jdPQ4GQ0L3N
 rKiEgNP2/e/nwgDk4E61hGCsSljMxI/3suQbrtv9kQ==
X-Google-Smtp-Source: ABdhPJyeuyFoLW8MPxAd/VBUVe67etsa0Lt2W1N7WozCEVUAWWCPFDgOLp17mBv/p+kNcMLSMT9yLU624bbcVEKqTYQ=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr2980117ejb.407.1615374308934; 
 Wed, 10 Mar 2021 03:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20210308170233.387812-1-kwolf@redhat.com>
In-Reply-To: <20210308170233.387812-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 11:04:50 +0000
Message-ID: <CAFEAcA8sC_KHXO2SJPBXUmRMNxchqEuuDcKjk3ASesTw0nQOig@mail.gmail.com>
Subject: Re: [PULL v2 00/30] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 17:02, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 138d2931979cb7ee4a54a434a54088231f6980ff:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210308' into staging (2021-03-08 11:57:36 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to ef2e38a1a1d2915b148c4a49f61626e62c46fbb6:
>
>   blockdev: Clarify error messages pertaining to 'node-name' (2021-03-08 14:56:55 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - qemu-storage-daemon: add --pidfile option
> - qemu-storage-daemon: CLI error messages include the option name now
> - vhost-user-blk export: Misc fixes
> - docs: Improvements for qemu-storage-daemon documentation
> - parallels: load bitmap extension
> - backup-top: Don't crash on post-finalize accesses
> - Improve error messages related to node-name options
> - iotests improvements


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

