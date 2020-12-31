Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7222E82A8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 00:27:47 +0100 (CET)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv7M9-0006hg-OC
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 18:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kv7LE-0006DK-72
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 18:26:49 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kv7LB-0001zs-L1
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 18:26:47 -0500
Received: by mail-ed1-x52d.google.com with SMTP id h16so19263163edt.7
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 15:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P0v1wAlcL/H+VqSwjtNREkxVNqXEouV38mfRfyYW/HI=;
 b=WkCksLGuXXYWGzX705ojGm1wPeXUsFq4g68TUsYhbH5ViutkNZ91Bn2P76fMYLDJDZ
 mCUc5iSQaSuBPh3hJ02dabk+LyAVjqpLRuQetPpXr6v4JkAByduKywtfbyseJdewjgC1
 viqMaUm4/pWuSfza2qKEuAB1L44jeL6VDf6EaVbwzN8vvvbvo0i2YPiAcv5TzuWs0oTm
 newioEuTltaUX8BtBl1DqW4yyEygrBiSAXe/wcaLXPNYp0B72WvuqLJv28MkM3szEXq2
 1fpVNZDWv2PJJ1Wi4atIrZYghV4b18ILY65aBhrvbgbYiQJRYrb0TUhk86j5YlKfHHrc
 W//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0v1wAlcL/H+VqSwjtNREkxVNqXEouV38mfRfyYW/HI=;
 b=IUxSFtxmWv1sdgWQXLs7viUdZd8I4kECSMOkVvSXmzC++FUPrteqBy7EYPl7XICt7t
 Wcq4PjKfGWMekxP6r5f5Z2+ctViKPaX0Hi1XeDDlTs5NzRIiqPeadeylxs2KgLAO7Qv9
 15dK8DTrZ2cG3AdXjs4FYcq6nE+J/V1UQNEMhe3cHf1E2ZnUqKl3NoU5PYi+hiIImdoD
 fdlztthPN197RP2c/GsWGDGwdkHgdmSpntvliv9hzaYtMAhW7Jig3p0h1lc+efGDPlck
 Klo0HI7hcuVxptYYU+4uxcWbo9a6JZ6UGuA3SOJGerkXmmxPtaT1+RtUiGcXadA0HNzj
 Ooyg==
X-Gm-Message-State: AOAM533v8zQ8RSYkieendMu83dAEGrgUaWjqIQNOVFL9JIhkNRwQu3BL
 6makXxv2DQgbujDNudwNhQ1ykodj88jZ9rc6XfBLbg==
X-Google-Smtp-Source: ABdhPJytnhCaoC08fwW+MWhuobMkIGGFChVJnABk4cQckyZ39Kuyz+UJLCkoVy9uq0OV+JC45W8Kd2aU/J2kj07eVoA=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr5606087edr.251.1609457203809; 
 Thu, 31 Dec 2020 15:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20201218121041.299788-1-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Dec 2020 23:26:32 +0000
Message-ID: <CAFEAcA9aY14AEBe=p=5mZdA5tEFqHEaQfwUJeO5A4Az=56eUgA@mail.gmail.com>
Subject: Re: [PULL 00/17] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Fri, 18 Dec 2020 at 12:10, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2020-12-17 18:53:36 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to be7c5ddd0d80e2d6cf8e3ef12c049851d28d9c26:
>
>   block/vpc: Use sizeof() instead of HEADER_SIZE for footer size (2020-12-18 12:43:30 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - Add qemu-storage-daemon documentation
> - hw/block/nand: Decommission the NAND museum
> - vpc: Clean up some buffer abuse
> - nfs: fix int overflow in nfs_client_open_qdict
> - Several iotests fixes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

