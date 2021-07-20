Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB423D01C0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:33:36 +0200 (CEST)
Received: from localhost ([::1]:44732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uYg-0007RR-PG
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5uVo-0005AH-JO
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:30:36 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5uVj-0001Pd-SU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:30:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id k27so29658476edk.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l9E3ZdZfIIlLYLgpLJLzzYYW8hCecD5IqXVBuk4+c/c=;
 b=IhfhgcIFhivu0aoiOg1WNDv7weuSGVhnL8cchuUxT4sqZv0c7uEyF72sRoJd1OC5AT
 fambdVpzTrp8Q72ENGoQpa8zGVUxWRNSVTCL3FjzFEuCayd1lcmCHCmk+TD9LFyA6oON
 /WFO5Ez8H+MAtOdMqQDJtkOaRz3tJvVpPHayqgVkP9Wk0BErM60E+QomtlWbgUitjosy
 jMMAoMczbm0mNatQ0WzVv4RhzMGrCQNoCQ6X/nlkzyf9pvAa9vBJifXeumQESeAy6Ty0
 LC9jo05VW50YZJTOnniTaEt2lN9fniuCEDwswVZa2Sdt+Ogt8r0gtcV5yQeK3ItmaG0X
 WpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l9E3ZdZfIIlLYLgpLJLzzYYW8hCecD5IqXVBuk4+c/c=;
 b=j4h9y40lBCzcN9Ax1mDq7FUOKWh4qQw3hCGZRrggJBGR9rYov4x2Ibdtz+upYAVVv5
 xZB5Q/hL1JlSzMF4l0Ix/1E+SnNkWap3GVRid3dORPv6+KD22qw+FQuFPk9qdzggmfr2
 f8Hj8LJ8J/zhJ1pJO4BOWF1FdAnpg4B9pth9gGe8C/c1Opqxp8XejQOBkwkJIZjnEkJQ
 TwPMgCLOk19yxdGHxee9FCzYPwMoRNOcrZhdcMb29GG7W1wSiiQvvGI3/13HRlODUEHz
 KFuZKo5HnNNwSUsx4wNRK8jaCPaBrOt36Gdq7T3X77ZCZYSV8gJ9f8XDa3h9/3v5sgIn
 nHVQ==
X-Gm-Message-State: AOAM532N9wLqi39vpOsmnM2k219chrFVKfir6vOhhY5EChAxHVNGIBZ9
 7RV6qza0gYqkYjKYAeka5Z/6Nc7s07a2AjooMXpMfQ==
X-Google-Smtp-Source: ABdhPJzVzcpdTNytYvD9YJp8aweQ+Xm5UVK2X3t1oM+exKY/SjrUjilEqkiFSgjbp5Kp+3emrhc46Bl3SstWN5D/ugE=
X-Received: by 2002:a05:6402:35c7:: with SMTP id
 z7mr43090256edc.36.1626805828084; 
 Tue, 20 Jul 2021 11:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210720151053.226144-1-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 19:29:47 +0100
Message-ID: <CAFEAcA9rvKg+WDKwDDmYVmgQ4Wpib3rVw-f=pQKq63-vBENyng@mail.gmail.com>
Subject: Re: [PULL 00/11] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Tue, 20 Jul 2021 at 16:11, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 143c2e0432859826c9e8d5b2baa307355f1a5332:
>
>   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2021-07-19' into staging (2021-07-19 19:06:05 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to d21471696b07f30cb00453709d055a25c1afde85:
>
>   iotests/307: Test iothread conflict for exports (2021-07-20 16:49:50 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - mirror: Fix active mirror deadlock
> - replication: Fix crashes due to operations on wrong BdrvChild
> - configure: Add option to use driver whitelist even in tools
> - vvfat: Fix crash when opening image read-write
> - export: Fix crash in error path with fixed-iothread=false
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

