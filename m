Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40A3D788D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:33:02 +0200 (CEST)
Received: from localhost ([::1]:33826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8O8j-0006fI-SA
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8O7l-0005g3-Rk
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:32:01 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8O7j-0006jN-Va
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:32:01 -0400
Received: by mail-ed1-x531.google.com with SMTP id x14so10808561edr.12
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZdLq3uv8CsswTFyy7488Y2F6o2QdD4UHTIzucSQZotI=;
 b=nke7qjYUg9SKx8PNU/Y1lcswMeYJRPCUtqIRC2D42VgM137PbnXRvxOXm7rxrYAcp4
 1HAip2BK3P73QtEZSN4hs4BH1CZGA0c19nNGZ2TV4HO+VFKwa9WsAA3doMeitWjfJMdM
 804J6rDtmLpZ8bxByAUG0s10pltCCQQwjRQoAGGMCzsc9Z76KHEqEpnrQmmGQu5+ATiu
 ZeDnDmIqoAtaSoxmpZxY7GLltgbSD7AdUxUI7ohWKvAmUwlokNifUXkCcJAIRSpslU/B
 Nnoumba013+Gd3jUv8/qnEbr8BBVlzjA3c1+7TzgVYKsToIChZ344VRrnJuAJY0f373X
 6vYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdLq3uv8CsswTFyy7488Y2F6o2QdD4UHTIzucSQZotI=;
 b=ZRj/eeP2kUl3z7s3hMddvJNP/kb1Pr2IEQNPqq5AYQAqDcneRP/Lq72KVc90zAVB59
 sBf/rbQrHbYTH4mfCANxYKvrkwJteHmX0RKzLvgo5P5PUdpZx0F6MoYEvVi4AmJ6swLY
 67lM5MfjDLz93YvcNI7xpbeIo0xrMYZ2LPyuqwtIV7piFu/xGwENAWjSixSrTFHTN6l0
 N/v/UnvOjKhVs/YspabM9L2NcYAc4iIQSRdcm+7oumOTiQg7S21VejuuFsNyvA2t0UDP
 6DheRSg3RO6ijCJ1LZiWUneUOCUBcNq0yI3xvW9eumP8eYbU2lwUFrMyEAynFFybL74P
 dcbA==
X-Gm-Message-State: AOAM533I1rDsB5BSLxEkZ/fmYKUclKAzgR1dL3+tccgBX4Q682vFErXk
 Rv3nyTMkmZZ6IxNs01A5zPRVAKOOBvTcMB5sFvxS3g==
X-Google-Smtp-Source: ABdhPJwWeJZwqy+N8Q+oVe8U6u7Mq6QvgpqM6H6zZCXhbPFCMCvPY46DjfFyPNjcATtJxkE5iC9fUJRaIaJefKFrwlc=
X-Received: by 2002:a05:6402:35c7:: with SMTP id
 z7mr28238166edc.36.1627396317707; 
 Tue, 27 Jul 2021 07:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210726191901.4680-1-its@irrelevant.dk>
In-Reply-To: <20210726191901.4680-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 15:31:15 +0100
Message-ID: <CAFEAcA8m6Fh-WQu53DKNdJNm3V4FJRYmhL2xqM2Smighd4ME7Q@mail.gmail.com>
Subject: Re: [PULL for-6.1 00/11] hw/nvme fixes
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 20:19, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 1d6f147f043bece029a795c6eb9d43c1abd909b6:
>
>   Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20210725' into staging (2021-07-26 13:36:51 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 9631a8ab21679e3d605f7f540dd8c692b9593e02:
>
>   tests/qtest/nvme-test: add mmio read test (2021-07-26 21:09:39 +0200)
>
> ----------------------------------------------------------------
> hw/nvme fixes
>
> * new PMR test (Gollu Appalanaidu)
> * pmr/sgl mapping fix (Padmakar Kalghatgi)
> * hotplug fixes (me)
> * mmio out-of-bound read fix (me)
> * big-endian host fixes (me)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

