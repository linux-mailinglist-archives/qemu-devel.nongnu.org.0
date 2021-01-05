Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B62EB4B4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 22:10:19 +0100 (CET)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwtas-0003U5-V3
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 16:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtZl-0002uc-VL; Tue, 05 Jan 2021 16:09:09 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtZk-0004a1-FD; Tue, 05 Jan 2021 16:09:09 -0500
Received: by mail-il1-x132.google.com with SMTP id u12so1067095ilv.3;
 Tue, 05 Jan 2021 13:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YbBYxs4hsW5m93VHJs6o1NpJlsMUpCdZX8aI/aak+U=;
 b=k8eDQt4QYM+wuZjQGsCF4f+ehe5bnilu/YWVfGvWjsl1VAzZ2gvegtqqlMkyNl059k
 vWarnSO/P0qrlb04iW0sfhFs7nhQzCDd1jYYrtYpAq26F8v/mDCck90xuRbAIF1KdBPl
 b9xeY3YNjq98gdbWgEttkFS5fUO2Dl3KGJXk9VZbevZIT/lQP53PwK8Wrh9VkKry9Iue
 ImSsb8pEcVDuG8TiKSXGdexwWdkEGBWHV2a9HmqgqMFGu9Zqr12tcvPYsRb+FTtWsBlr
 ISg2cnfRa4nDAAryOVeRJXLmWLzA2atha7sK+HsfaV7SXL8qUCjoS6KmWQ/tB1ckM3vR
 0gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YbBYxs4hsW5m93VHJs6o1NpJlsMUpCdZX8aI/aak+U=;
 b=YGtdL+AASCL79qMi2Re029IF+v6zxVfU8XtiL5Iy/L9SAgR8szvTTP/v6l28kyEtXr
 2jzoixOc+GGfln+4kLJjTXglEOxJn+A9g5CQl3TZhlkjZdcMNapFTD17Z3vmUow9k9aI
 acjsLARxdN4tj0pWYQpQklMFqcP4iID0y+Dgx0sp86vWmQlD0fYsS7JcnNGHdfgevfEh
 iG97z5nPZ8O1NA6VS9WMTa8IBFCNO9LaHjTv3f6gZOrlT6iJ348WNbZwapuEaCYVnHAf
 wISPwhYvb4c7W6archyK84YViGgGXIo7PRHhXlC+TtKaNizd0qlf5H7XL3olCteO9Iee
 zJnw==
X-Gm-Message-State: AOAM533JHkoJLjg+ifmDS6GBfqCdVfDjaPHBmxTdIFBmSwelq4djfxFR
 z8FKT/fuRg/GQNBznOpFINyvY0s9wD62WG2TNL8=
X-Google-Smtp-Source: ABdhPJwQSXR2u7OzAU8BxqCV0I9mBOXUSfNsb0iPBq11N/puZwE7xI0J0zEQdUSjoal0cGjIqP9Lie5Yui5f82oDsNo=
X-Received: by 2002:a92:c942:: with SMTP id i2mr1401461ilq.227.1609880946992; 
 Tue, 05 Jan 2021 13:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
In-Reply-To: <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2021 13:08:40 -0800
Message-ID: <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 16, 2020 at 2:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair, Peter,
>
> On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Avoid using a magic number (4) everywhere for the number of chip
> > selects supported.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >
> > (no changes since v1)
> >
> >  hw/ssi/imx_spi.c         | 4 ++--
> >  include/hw/ssi/imx_spi.h | 5 ++++-
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> >
>
> Ping, not sure who is going to pick up this series?

It should be reviewed by Jean-Christophe and then probably go via the ARM tree.

Alistair

>
> Regards,
> Bin
>

