Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A819A31D9EC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:04:28 +0100 (CET)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMVH-00081z-PQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCMU5-0007Ic-46
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:03:13 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCMU3-0004js-Fp
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:03:12 -0500
Received: by mail-ed1-x535.google.com with SMTP id v9so11933866edw.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 05:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3Gja1lz4OIKYwjL5oE3m8cmoQ42c6eTohbfvDfM8i4A=;
 b=uq4pFNhSEkY/CrDnB4TLbk/NV/4I+TbloxKUvEqBfwKBVP7Is8tbNfjtkcPX9yE+NA
 LVaJMT6Wzw291Ak66v/e6dLrP8cWlaQqe3Eyh76HXe+PwdiimCuoS9ilqM1f0ilhDlPq
 oCNlJEDA1mC6ixrNcHwKxTlDfhrXgGGxjRRDqLEXMygClZtaaO52iQkAe+b6a8emFDqt
 O3/4sPNJ8SvJcIU1/0r2eJir9KQVvScNRAG9ixCrzo4d/PZRNGH5l5uvL2X3rQXUzk9V
 hXjMSmBhIWClHzKO0i9ZHge8m3Zm4n4juMS6oWCvotmbp1xhZ3N4p+4tLhHwGXMaXxux
 SKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3Gja1lz4OIKYwjL5oE3m8cmoQ42c6eTohbfvDfM8i4A=;
 b=s/5DxAGKXt5gesnJe73Pa1Tali+LyC9tYUGbStu93XE6M77p8p69BLrrNeo0Rneqx/
 vmD9v5oqYiYWZeGp4liVYfdBLtCZLRnzdXMsmjAcozQe/J2/3rGqGPVlgWDmlwX8hElc
 Hbx5je0aCr3IQehJ7B1GeIoLk65yRJaCFEpyk/FccM4u8/7XDbw1rkUm3t9VZZyhh2UP
 kyLkxVcT6igtWqqLJ4DaCoMxBkXZWERhE8ic1CyBhFgNo364Ni9X0XeMG1aVwe+BIxWe
 E5a1reQGMmpXU3Qe4rrd/Kt0yN1K78w7OXpbmbsZorB1p3jXbUdA+C7Yq7I6rVbvJuML
 ugLw==
X-Gm-Message-State: AOAM5301WcU1Xm2uZc2nVYHpyLaliwW1TJlYiHRbvDE35N0E8uyy3uAN
 6K7vI0Nb437pbLJH+c1OuO9u2G7UlTgr1choGfvE/sG0fW8=
X-Google-Smtp-Source: ABdhPJysQw+1nhCcDkYxpCx3BHRjbzWsZ3rRwGxYQC83i1JYLTlQpHitFSE/FcRwfSrRHmXFAqEXq+l5re3mrJ1STa0=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr25657296edd.100.1613566989514; 
 Wed, 17 Feb 2021 05:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20210217110341.2243-1-peter.maydell@linaro.org>
In-Reply-To: <20210217110341.2243-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Feb 2021 13:02:58 +0000
Message-ID: <CAFEAcA-h4V7VBsn_d3UZqDgjrUF2CuWqEr3LFVtJKT_cMzx+1g@mail.gmail.com>
Subject: Re: [PULL v2 00/37] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Feb 2021 at 11:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: dropped the npcm7xx ethernet device, whose test case
> fails weirdly on the 'build-disabled' gitlab CI job:
> https://gitlab.com/qemu-project/qemu/-/jobs/1034174731#L12
>
> The following changes since commit 8ba4bca570ace1e60614a0808631a517cf5df67a:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-15 17:13:57 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210217
>
> for you to fetch changes up to 59c7a187dd8bd8ef675768dd8af9de11528ea7e2:
>
>   MAINTAINERS: add myself maintainer for the clock framework (2021-02-16 14:16:17 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Support ARMv8.5-MemTag for linux-user
>  * ncpm7xx: Support SMBus
>  * MAINTAINERS: add section for Clock framework

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

