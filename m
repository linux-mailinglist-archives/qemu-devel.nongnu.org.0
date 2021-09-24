Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1C417691
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:08:12 +0200 (CEST)
Received: from localhost ([::1]:50522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTls4-00049v-0O
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTlpF-0001Ja-0a
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:05:20 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTlpD-0002WZ-3A
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:05:16 -0400
Received: by mail-wr1-x431.google.com with SMTP id g16so27904735wrb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 07:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dE797+OKo/0jSOHSNbIAFOGTUcxf9iQiv478tRP7U50=;
 b=WNkE8kheTt79/5A3TkGddpR/g0m653mdQFY+in3BB9NT0PxGK1Sj+FXUJxj1Tn4awf
 WrNMA3YBDBjYPiGoXyZVABEjz0qS/cIOL4S6nPCB+63An1Zu7SskpYouxQuuVYNzKxBC
 DwVms8yIWxbKEcwhfeE551ylX8ZtRlvztvkwQuP/6uYyDLHg+GveCX38zQNcibEu33Lq
 ZOPe98eKfFiFxjxfoF49LiLOoTzHZwhvEIPeyH8aodORD6RZLiFA6hO8WbL8DTm04yAS
 b7akidJr+x4/4hf1v99Q+9WHf2tm60LhyX9x9P8ezJ2kvJtvy/7Ufc8zOZI5HOWgOhrq
 DypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dE797+OKo/0jSOHSNbIAFOGTUcxf9iQiv478tRP7U50=;
 b=d6+Z/XUZtrIfeg6VufDpsaUtwcS4KjLrO26lrBgRyAipnQqgnN++O7e7OeUdk6IOg5
 14IcaxHX8RbxcxtkVyENTjHihNM+eSfxmM6/wGRmLNJOZ7iyuvqz/3OjX2cuuKfQIggu
 Te/waHqgyCtwyFh9O940Z2Z5/ZJHgFtvl9HuxSLizk7fUPEvrShVgNbjwIXS+ZQ4YpiS
 9CB/ohXMGbjamJS95mJvJwLfkfSnHIxjMEHOB7sFnr8mbJBM6RVxz0ZLMnv//0xJNEq/
 8Wg+xJNOBIQOxkkMHsXoKI9FVLbN32DO5zO7kDXnbSmMfkZqHqfq4LiZOFGRV2+sv6C9
 elWQ==
X-Gm-Message-State: AOAM532jPZMRWO5TI2KqJ5Z2uDa2LH8moR521tRLWKZcpssvYPebIKNH
 IZNo+vApdJDRqxkuwInEXVAWtFqZchjz994E0K5Cvw==
X-Google-Smtp-Source: ABdhPJzQRcnttqLVHErZknYi92dxujCm66yQ9eKWabf9k8mfyjH86CV8m65J6kgMZTbvImIu6Sjp+udbLXhuXyQQWHg=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr11395169wrw.376.1632492313634; 
 Fri, 24 Sep 2021 07:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210924064701.283182-1-its@irrelevant.dk>
In-Reply-To: <20210924064701.283182-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Sep 2021 15:04:20 +0100
Message-ID: <CAFEAcA_vniV3pp0Ajjp5Oi6Y44EEm6Tr04S6CHmjCMq97ySvOQ@mail.gmail.com>
Subject: Re: [PULL 0/3] hw/nvme updates
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 07:47, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 2c3e83f92d93fbab071b8a96b8ab769b01902475:
>
>   Merge remote-tracking branch 'remotes/alistair23/tags/pull-riscv-to-apply-20210921' into staging (2021-09-21 10:57:48 -0700)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to c53a9a91021c2f57de9ab18393d0048bd0fe90c2:
>
>   hw/nvme: Return error for fused operations (2021-09-24 08:43:58 +0200)
>
> ----------------------------------------------------------------
> hw/nvme updates
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

