Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B431906C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:55:58 +0100 (CET)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFG0-0000Zg-Jk
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAFDo-0008OM-E3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:53:40 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAFDm-0002GS-6N
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:53:40 -0500
Received: by mail-ej1-x62d.google.com with SMTP id y9so11032015ejp.10
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 08:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qx7WvpTXxrxPhPf18mpIbrOe+HqTMepNPanEEXLGHnI=;
 b=ZDH0noIs8Mo84+El3oIwGxP4iGjR5O1Oy+OKkeW/O0+2K7+zzaMm67mdecxFOqqFKs
 KjHO7kRvF76glsH8D+ntMEjQOvw75k5+09Y9VY+btjHSddkzjhPnVIY5haOGRxHyfqJN
 6i1npZsqTJ5KI1kA24v70KUYNA+HzIe184gfZ3I4ewqXstHYllLY8AOa8tqX482M49Dx
 tSqEmyxGJaX5WHuo6MY9WjdrM6dYlL0oJWwPOSd6MGS35yYGJO2Y5qgvb3aj34T4yBDV
 yJPbX7mGYM1FKcGuDxMhgSdtzO0/t+tEnWmuqVjIkKaiTRveHdajfuY0qCXzKOc6dgwI
 Eh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qx7WvpTXxrxPhPf18mpIbrOe+HqTMepNPanEEXLGHnI=;
 b=oxMZpk1PZKf2gyin+xUQEPVCu+ebV4sx25wvWc/T1/qJTyetCP6yrGkH2wlro4jXaZ
 AaM5kSIkFx78cp+keudkrnZQBaex2yJk3EkjbjruQipx6+jqm6SFJL0wUdJZB1Hd045K
 8jDjKFkqG7l9a++d7ol904riLfS3G9NraJXaJ5X1tTLLTW52uK59me52+oF5N3Wz84ix
 Nn6D70EC1aAuU1dBT0L59uAIYxg0o1UcRkmo/ySpjNrUNkz35ShR2sdYIp9ttoIBcewg
 0le7qM1mC9ICZu93xNQ+Aye5yjj7EvhRyBehDFSnrsvddhizlf+9EKXqLRV9U4sH2GXu
 YZWQ==
X-Gm-Message-State: AOAM531tX4tigGjr8yOXBj8XUp085FmuRzRRmVO5daNE4lXwFGFJ4l/k
 FyQnsxxnVBoqFsWA1AaHnBbIbPg3kyzbKfw3L6enZQ==
X-Google-Smtp-Source: ABdhPJz5i0UaShrUwlzjIk/ZABvU2VOHzTVqo2iqfhulSJmhdwZdjMGIG92WnxRDy9tr4XY6UruOTkNeDKqhl4XSWCg=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr9418996ejc.482.1613062416694; 
 Thu, 11 Feb 2021 08:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20210211152139.1004257-1-its@irrelevant.dk>
In-Reply-To: <20210211152139.1004257-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 16:53:25 +0000
Message-ID: <CAFEAcA-LSBD0irW=1sGt2PM5OpWPyNETzaKemEjquO2JxkFTVA@mail.gmail.com>
Subject: Re: [PULL v2 0/3] emulated nvme fixes
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 15:21, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> Two small fixes for emulated nvme for regressions reported by Alexander
> Graf and Bin Meng.
>
> Sorry for the noise with v1. This should be good and also got the full
> CI treatment.
>
> The following changes since commit 83339e21d05c824ebc9131d644f25c23d0e41ecf:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-02-10 15:42:20 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-pull-request
>
> for you to fetch changes up to 832a59e43b5d8b8a9c2b2565008ebea1059d539d:
>
>   hw/block/nvme: fix error handling in nvme_ns_realize (2021-02-11 14:23:08 +0100)
>
> ----------------------------------------------------------------
> Two small fixes for regressions reported by Alexander Graf and Bin Meng.
>
> v2: spotted one bug in the error handling.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

