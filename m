Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E683C26B6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:18:35 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sGx-0006cN-2T
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sGA-0005v5-Mm
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:17:46 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sG8-0001R5-MG
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:17:46 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gn32so16844901ejc.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtJbaLWM/I7P7qKK+Sz8SRCCztjxzDga6zxGc0Mn+po=;
 b=WlOjNUQzyYKYid2rkSpojsH3ND7b/gX0+ihFbtZu/A4806UX0uZjqa44v+wiAM6bW8
 JE4EJqHswPtQdNTXXb/7YdrKxbroXnEs59KzEOsRY4MJhr6Quooj9aPAgj9GRKZfF52H
 OG2yr5fWIghOBUID/tjPKcxFIEOQIzuTvTf/12M0cIQDmP5saQnysfHrfUmzoH5h5gDm
 tdDMH23YvYBPrWBe0rZczFcgxbJsBfsMNXMGkToDaKQUQxUb1be4X4FR1reRRU/NGtXw
 XVt+6dMyIfcg8YuSZLMMZ8/u3F+JcARgxok7qkClY+SO9e6Iso46BcTHgqWwFiNrW+is
 5viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtJbaLWM/I7P7qKK+Sz8SRCCztjxzDga6zxGc0Mn+po=;
 b=C+V3hckwQ8ZjyiMBiByoEDbBQSysf5fZ12UUIXb/a+GbiG8/nob3OsydPvc4zmHsY7
 nvLX9CZUAHRBbOggy9odEBRG+xjPWSpqzHHE5BpTGbFguxmSE+PAd9N7yllxl9jlzbb/
 9NsTuKNTJw/AR91abtEk98CumoaEKpP6r7hIIdPJYQK9GoznccufxMFIDB3a+Fsh1ip/
 A8TFTguqpsOxeEY42m5zW01orxe6AJJ7AB9Ym9yL6bRD4KOTj/sDeZ3MWCxK75EQ8MPx
 auPqM7Ml7mGkr7IXgBraGDWQi5Nf8tcAUcEX7plxq0Qm/2rHGsnsuCtswLuFzfHFRhwp
 0XsQ==
X-Gm-Message-State: AOAM531YbSUQxzwIkKSArY/1yCJZZJgzE9Wwiy9nUTk3qmmLmtqZ1uaW
 nFheJdV6KL1kYnC6QTsBX4/McMvLQXxP1IFTMGHONQ==
X-Google-Smtp-Source: ABdhPJyo6lOXuRx5ENgDzbS3hVYF8uwz4ZhORbb6g/UkyUcrwkTtq1JV+ZjnM4L8KZrkXUSceE3KiBXm085Uld1GjlE=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr37484640ejc.382.1625843862337; 
 Fri, 09 Jul 2021 08:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210708151909.907124-1-cohuck@redhat.com>
In-Reply-To: <20210708151909.907124-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Jul 2021 16:17:03 +0100
Message-ID: <CAFEAcA96yLiVh-gSxZdW1kNvmJHarqNH_p3HXtpp41gQ6eDuZA@mail.gmail.com>
Subject: Re: [PULL 00/17] s390x update for softfreeze
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 16:19, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210708
>
> for you to fetch changes up to 7ab3eb42b0d795f7321c4fca0ea06cb76a005b04:
>
>   target/s390x: split sysemu part of cpu models (2021-07-07 14:01:59 +0200)
>
> ----------------------------------------------------------------
> s390x updates:
> - add gen16 cpumodels
> - refactor/cleanup some code
> - bugfixes
>
> ----------------------------------------------------------------
>

Hi -- this doesn't seem to be signed with the GPG key I have
on record for you. If I need to do an update, could you let me
know which keyserver you've uploaded to, please?

thanks
-- PMM

