Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5496AC03
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 17:38:30 +0200 (CEST)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnPXA-0006iY-OP
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 11:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35683)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hnPWy-0006Je-Rq
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:38:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hnPWx-0002RW-Rx
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:38:16 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43730)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hnPWx-0002R3-KD
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:38:15 -0400
Received: by mail-ot1-x343.google.com with SMTP id h59so17647650otb.10
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xb495cKI1PWB9TFV3HJZKvlHlDh/Wxj2/mXj/cNCt4s=;
 b=smR7lA7I38I3/iV2m2WEj1BblSuLgPKpofs38HHEfWDtR/WBKX8+gH+5Nwu9siIC8k
 fo+r1aKQelnrPx77krmt7tpRNq4T/C//hDfW8BiO3W02fCG7YCPKKClLi/kdtsEoxZgW
 sbhJ5XGGRWOv7pri84rtnBaR6XE5FborXfPGlo4UO4/v1qGh29m2SxMdzWv0yfv65XWf
 V0jfq3lvF102joMItj93+087uKwZaf4li5chGF99Q92pPNSg81YLzjBrQmaFbcJm2D2z
 iOBPKeGMhEIiI030fSAYPuP9y35UX4aWruQk215r+94VX1K8x4I3NNMWz9ZMMSpLHjsG
 jwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xb495cKI1PWB9TFV3HJZKvlHlDh/Wxj2/mXj/cNCt4s=;
 b=PXE+xLo7sBGDcGKKWFqc1+v6TwLT+iZKYAgGX4t60XX2niEtQ4qMmM69ueaUQSWfh3
 CaTLKIWgpoLao2/1BQfns/CpBE0u+tkyjckPVpjvxc4TzJfCzES0yfZfkicvtmC+wTT9
 DUNnMHIOjEMu8WQ8vwgDGXWAn9yovRL8DyPGuirBUCvJ71Xtc8rTQjExyra6yuXBPQE4
 1RR0yoyoZjD73CS3HAoqPHqyL9mfJysKRH/mVVZIkG00cronoTqj2poE++WRNo/73WAT
 oVZAh6vGjjxjLbEhWbgFlpOoXn3x+Kiag0RJeramETrLVGmxYMkpGPgBdJzHOLr1BzKP
 6rgA==
X-Gm-Message-State: APjAAAUz+Xdc5bXkYPOxQFdH0YW1jvEfomfm8uBZjShHruKwHe7xLPqT
 bG2luQHxvEbNddfnPPDUN0CE8tefB5Yr8tBcGe2SHqDzkWY=
X-Google-Smtp-Source: APXvYqx2DzEviJmkPsTFVZAd/6PmDmrM5FkjerBHJBUMMX+qKHa3Bs/5ZPSPcrBbG35x9w0MGsnPLwowQNZNlt7uifo=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3935727oti.91.1563291494702; 
 Tue, 16 Jul 2019 08:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190716140546.6661-1-cohuck@redhat.com>
In-Reply-To: <20190716140546.6661-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2019 16:38:03 +0100
Message-ID: <CAFEAcA-kiWu9jcZ=wjSwoYFCYzXehbYLZPOzVo5BmhyX=zmAhg@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PULL for-4.1 0/3] s390x cpumodel fixes
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

On Tue, 16 Jul 2019 at 15:05, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 5ea8ec2fcf57cb9af24ad2cf17b4d64adb03afdf:
>
>   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2019-07-15' into staging (2019-07-15 16:11:47 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20190716
>
> for you to fetch changes up to 5d8866c89817998a3d9c3055d5dc2b5a8e78658a:
>
>   s390x/cpumodel: change internal name of vxpdeh to match description (2019-07-16 11:29:38 +0200)
>
> ----------------------------------------------------------------
> straighten out some things in the gen15 cpu model
>
> ----------------------------------------------------------------
>
> Christian Borntraeger (3):
>   s390x/cpumodel: remove esort from the default model
>   s390x/cpumodel: also change name of vxbeh
>   s390x/cpumodel: change internal name of vxpdeh to match description
>
>  target/s390x/cpu_features_def.inc.h | 2 +-
>  target/s390x/gen-features.c         | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

