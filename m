Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACC3C36C4
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 22:29:44 +0200 (CEST)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Jba-0002HJ-Qh
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 16:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2JZy-0001Pq-K1
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 16:28:02 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2JZx-0006PQ-2N
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 16:28:02 -0400
Received: by mail-ej1-x635.google.com with SMTP id bu12so23970235ejb.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 13:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tTQf5IuUeyGBNRPYT5X3KYtY1tKi53JD1KmbUd4AaLA=;
 b=X2HmnzmC1CMSpCjBPLtzyc3eFhh9guMDsclkNVxrpoy4w3PaZZS6PA/IVY+gpR2eE0
 2sn5fKFCtHYgQcd7LRDe2SqSGv3rIbleTZsRWjoX+5t6IWpQE1jFliLIHzmss6RQsG30
 8pdzmZpFat+SkY/XM2+yrMMUpJTz/W1zP+DrybqDRbuarSjr4NVNDq70toNI+S5ik//L
 Sff1wZSecxpWDNAFM2o6tBbkmxW6HewtD8YJjT7Plm3iJg7IO9a9EiARBQxYs0McFw0s
 N2RGYKZj5LZGdFPb/jhVqVBJul0e9fVDdBAY076jDzCtHyR9uLBGmz9E4K87EpmHzRNp
 Mv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tTQf5IuUeyGBNRPYT5X3KYtY1tKi53JD1KmbUd4AaLA=;
 b=IJJFPI7rtpijIWczuiJs7u4RSq05RVCGOI8qweuD31BZgLlLdmmK+rgISCqBXnkZsq
 3uRx+qauGwLK7jMobDBAdEA2OtJYe67pfguwuKRfoMjUt2rLDscaRbq9HNjPi2j2vnly
 QkWgH1Y2u4ccGzXDyTl+QAlAX9tbEDt8bR+DrExq12H/JJ978wXviSrb+doj9FGCqyOO
 QD8xP18JlInycX8NQB/u/QiUqBi8jItKdEyp1QxJscC1d2yAm7R/yhW+IhYUxcyATMDu
 Dlww1A8oENdlZ0stVktBTJ2uS1KcB7ywm20w6hqBBP+WzksgdKs1rIkeahBhZQfsHeTt
 q+wQ==
X-Gm-Message-State: AOAM532OfR6VbSg7tLNjBXKtV2h4J9LrIFLyY1U83BSgHcjZM7jmcjqT
 WsDdPmdmGJkFdEA2aPkOlOGa7n9QXzGDnLh/qvjYnA==
X-Google-Smtp-Source: ABdhPJzwycDrE0UMe7irWaNB0Vv7UC53+3re+14kFU0eNyv0BBV1dfF+WT0ryAFqsyqa7pgVk2w8eYgzB8XJVBqlFZU=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr44005941ejc.382.1625948878176; 
 Sat, 10 Jul 2021 13:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210709125035.191321-1-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Jul 2021 21:27:19 +0100
Message-ID: <CAFEAcA9z2oZFEgAea=LCYDRfj8kMA83qvqg9Ma0PjPvm_aZRJg@mail.gmail.com>
Subject: Re: [PULL 00/28] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Fri, 9 Jul 2021 at 13:50, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to e60edf69e2f64e818466019313517a2e6d6b63f4:
>
>   block: Make blockdev-reopen stable API (2021-07-09 13:19:11 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Make blockdev-reopen stable
> - Remove deprecated qemu-img backing file without format
> - rbd: Convert to coroutines and add write zeroes support
> - rbd: Updated MAINTAINERS
> - export/fuse: Allow other users access to the export
> - vhost-user: Fix backends without multiqueue support
> - Fix drive-backup transaction endless drained section


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

