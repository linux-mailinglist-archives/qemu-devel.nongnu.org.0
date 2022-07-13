Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C8573E64
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:59:16 +0200 (CEST)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBjS0-0006rW-0x
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBjHK-0000WX-1K
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 16:48:14 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBjHH-0006l3-Hh
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 16:48:12 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31d85f82f0bso89435877b3.7
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 13:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VMKou8/cxoyWRj2LXWuE00Uz7Ica0uBvSeyt2xfCBgo=;
 b=cXVZDvfIxNbfqD5V7abnMhIJyJobRb+3iP0w2PCNBSvCfB1r73wyIIKfV/SCTAR4tt
 dCP51nPDA/xYl25/6XZxltdSlqR7/FgtUmD77FBNyuGXCMoi18axEd2j6t3xFSrz4Tja
 IRb9mAuXkUOAu+RAqK1TOCkvKu4X8GvpxG1wo5JVUelhBRaHm+o2/rKCFFtWNO5JKAr7
 SCjUNJPx+I63N5W+2sBWdeys2stngEtn83pQe3R5ORLSsVaoNCxZ/3x6ttDFLSii8LCM
 kQfAxE787Atx/rUjCrWxZTFa60p3WS5xfwUL7cBmtF0v+zW4cb0Y9TNn/ZVdgMgB98uG
 hQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VMKou8/cxoyWRj2LXWuE00Uz7Ica0uBvSeyt2xfCBgo=;
 b=zG5HDtQm5KWdJr3Qbjj7VlCwZWPGkwMUDUIgURbqv5GkC/+RnObD0hFNwF/1oFy747
 1+1FpK+6dfh3l59uCNFcL/sLve2lI6nDfjb3UvSl4NGHHjPY+c66d7BMnSAvaWrBy6rl
 guiXqLysDidRFylgawTiP2rWXDXOMbm87WxLmhJVB4+Wr5QT7P9ZoUL0kyKTC9eriCd8
 7xAM0M+HRv9deCxq6cFFNyPBYp/B0XUrC3JsFcA42rLK5BQyWrDPZGglQxkqIxey7R0z
 0QmTRtGdgz89YiLFA94dAgqe3J8ei7L1oEvrMcoKXVdjWyahJLfEFmMFP9GE+fXVYX6t
 5mZg==
X-Gm-Message-State: AJIora+t7Y9m9g1Ech06/bMF62dbhlswHy1jMxtmicuQ/qOR4CuVo52c
 v/iOW3mQL1Ac6GJ+pnFYmnMe1TVnF9YrHTl8cOngpQ==
X-Google-Smtp-Source: AGRyM1s2z6ltzUEj3g2FpX98PPkzhpdgD5XksT+E/OIJbsDdz+iDnq5BlGGcrKPMnMvhg/b9lxxgpHyOQ8ZVxLv4tBU=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr6345164ywc.64.1657745290134; Wed, 13
 Jul 2022 13:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220712180617.1362407-1-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jul 2022 21:47:31 +0100
Message-ID: <CAFEAcA_sCoCm7pt0ojSQbrWPvDQzXfdNO0XKzZOwuHusBDm0wA@mail.gmail.com>
Subject: Re: [PULL 00/35] Block patches
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Tue, 12 Jul 2022 at 19:10, Hanna Reitz <hreitz@redhat.com> wrote:
>
> The following changes since commit 9548cbeffffd4253e38570d29b8cff0bf77c998f:
>
>   iotests/copy-before-write: specify required_fmts (2022-07-12 13:21:02 +0530)
>
> are available in the Git repository at:
>
>   https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-07-12
>
> for you to fetch changes up to 85c4bf8aa6c93c24876e8870ae7cf8ab2e5a96cf:
>
>   vl: Unlink absolute PID file path (2022-07-12 14:31:15 +0200)
>
> ----------------------------------------------------------------
> Block patches:
> - Refactoring for non-coroutine variants of bdrv/blk_co_* functions:
>   Auto-generate more of them with the block coroutine wrapper generator
>   script
> - iotest fixes
> - Both for the storage daemon and the system emulator: Fix PID file
>   handling when daemonizing (store the absolute path and delete that on
>   exit, which is necessary because daemonizing will change the working
>   directory to /)
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

