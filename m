Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643FA25C184
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 15:11:09 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDp18-000596-Vr
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 09:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDozz-00045A-2R
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:09:55 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDozw-0004gw-4W
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:09:54 -0400
Received: by mail-ed1-x530.google.com with SMTP id n13so2586041edo.10
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpHrUid1Vr7juFG+nBmHG9g6iWY9iZDtlEIz1kzXzzs=;
 b=SsEODxaCq9DbUP+IXo732faskyxKCnyW1/IHwFGoMbTqpM630mg5xmczZA0mZJO8ux
 9dSrWTrpfWSPFzZKxs1MuOczwV+hB7aE4kkkaslFWOT/e4qZFd690F5g44s+g28CqIAe
 zPlmj7ehUqqyF/GikBH66iCqY7QHcqXmfFul8bIks+mXU+BY4AMOtoRxxdhuqvyJnbFo
 qF1HZM+dpfVWBDHHVWyc7oJjRKttSN5bCwEOiYwkowq45cZ44SkWLf/P2o9bD/enrR6V
 BBPImhKzuEh3n4jrlT302qte4Llcqpipl2nYLXsyCIkFOZhTCNaP1Ua6rulDgGxuPeBm
 bNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpHrUid1Vr7juFG+nBmHG9g6iWY9iZDtlEIz1kzXzzs=;
 b=WAT9eqEE/i07SaU7+zEq+Q88j/d/+JkERGXHC6mh3GhZtAU+pqxv6cyYHVv3tymKBs
 N1t15wGxUxMyWQvMtV2kcO3OQBqTQdEGT10Dr/SttM8sjoYDEv8z49JWuXQuwImv6uMW
 2sNkh30ROKJt+2ncAYq/lKAP9eQcG2GtWQ5H/TlFXBJ+iY+FX1thHc8h4pDFXKy+WVGY
 aiCcHe5U9XR5fOApBMb+YFhMz7o+Ue46Udoe/SFIusoxqN/XhuSQ8QCq9gfeBY3M3xeB
 7Nf4Zadn7u7nyJK2EGdk9eLWa/BejyugQZR8lkTtti4Bsa/evyQ5VGaLuN8a3w2ertMd
 jibw==
X-Gm-Message-State: AOAM530MxIP4EDyNCMYSUr1xxADFcogWfaNXs5HUVk0nc6H5P79Vy3QQ
 nNT1ENt+SxGyMGT7aA3AjnvwUJ8Pp9Et9GKQ7CoULQ==
X-Google-Smtp-Source: ABdhPJz8MR4rMteEfM9BZl61ngwU0/EMRdEJ6JRQevBdvVihrbvdLIbgIVklB/cMV31ST2cHuffN4Mwd5NWzcgxeav0=
X-Received: by 2002:aa7:d596:: with SMTP id r22mr3038137edq.204.1599138589998; 
 Thu, 03 Sep 2020 06:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200902144327.GA22699@redsun51.ssa.fujisawa.hgst.com>
In-Reply-To: <20200902144327.GA22699@redsun51.ssa.fujisawa.hgst.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Sep 2020 14:09:39 +0100
Message-ID: <CAFEAcA8SxiJyvxNBQN-kU3oKtV2z979sXFBCZO8OEVR2jhR6vQ@mail.gmail.com>
Subject: Re: [PULLv2] nvme updates
To: Keith Busch <kbusch@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Sep 2020 at 15:43, Keith Busch <kbusch@kernel.org> wrote:
>
> Hi Peter,
>
> This is our second attempt at the nvme pull request from me and Klaus
> after fixing the error you identified in the first attempt.
>
> The following changes since commit 8d90bfc5c31ad60f6049dd39be636b06bc00b652:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200901' into staging (2020-09-01 16:51:37 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/pull-nvme-20200902
>
> for you to fetch changes up to 82386d4a0f19ff1e6a04e29f104da1d12269539e:
>
>   hw/block/nvme: remove explicit qsg/iov parameters (2020-09-02 08:48:50 +0200)
>
> ----------------------------------------------------------------
> qemu-nvme
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

