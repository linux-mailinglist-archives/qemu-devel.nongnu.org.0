Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31153B6974
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:06:12 +0200 (CEST)
Received: from localhost ([::1]:36498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxxWF-0006Qo-Ld
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxxUT-0004wY-Q4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:04:22 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxxUS-00045d-4U
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:04:21 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bu12so32110576ejb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 13:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wwE6/I96fK0ZDFd8tfudaQQTx2t7ga0qm/6/O1o2PPY=;
 b=Xb9PiXLvHbGC09ufKODhfXzz3EM23XM05rIbqgZm2eFuX7x+RxLRdlF8iCSPlKBEwq
 pWV2+QUsZ1YgCK7yOObDP2QLNO+LyIZQrJwevmjGjrz4sntyWaLuUhqDoGmMlULcV4Zs
 JHF96foHXBbiKnH6yyTc3PWdKH7+rNhD4Q/Vhds9vyRXTKdzWBohciKkeldJv7KF7xHJ
 sO8ruo7mw/7KWXiLsB2HI7jgpVh0zSiCLLW0BoCWozROtW2IvH6iYkT1I/2SovEjcrhz
 vVRnVQbGDhsYiF5uLbhv741cFFlFGI7jkHspW5j5TDHhh0yWMDfoh2p7qoqaw1bAvsgv
 jk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wwE6/I96fK0ZDFd8tfudaQQTx2t7ga0qm/6/O1o2PPY=;
 b=A53zHH5sKD1VEYA7SnD2KOVAMlFkzPKUPLrAPlUjG65iJbGZ+MFKpwWIPGdYBRdV60
 P+ehiOg/FmOnoMTMHNKeCBaNAIf7iIeGqfY3hF0gYkQfCoMapfXCDVIlGJpcmfQKHqG9
 Al2kiUBS0JBEa/BhOEREU5vUui4Sl35eLlZK3Jw73YVxzhaTBoZykHGED7XvC5qQ7Cbd
 WgkDkKmrDj+ujZmFrhYldWibbbcH2du+nZErL3qeY7FBKlbqI7SDRPZfKZQ/6c0nRhWl
 IX2EZUA/TXzo4Ohoa5bt1vYElitsGLtf42LXywFGhmXCEq107+q07W2FU0mFnUt/EavI
 7cXg==
X-Gm-Message-State: AOAM532xpFTlf0iHctw9ngB6LbamqeZwd/LiDkMgxl9+IqJYp8fwTy9k
 zI3phY2on7eZpzeaLAJkVZYUvwMf1c1yHJMhF2vySQ==
X-Google-Smtp-Source: ABdhPJxyqw2R6oQpetVCHMaCry/Z2FewlADPt7FmaekQbVzrzyfORwKTn2zdtd9vT4+uoY32cW7rVNfeqZnQycUDYS0=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr25426155ejy.407.1624910658550; 
 Mon, 28 Jun 2021 13:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 21:03:41 +0100
Message-ID: <CAFEAcA-W8_upf4w88AbPy2y-CTCqHrT1je+w3kKQLQ=p29Vm-g@mail.gmail.com>
Subject: Re: [PULL 00/10] Block Jobs patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 14:00, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> The following changes since commit e0da9171e02f4534124b9a9e07333382b38376c6:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210624-pull-request' into staging (2021-06-25 09:10:37 +0100)
>
> are available in the Git repository at:
>
>   ssh://git@src.openvz.org/~vsementsov/qemu.git tags/pull-jobs-2021-06-25
>
> for you to fetch changes up to 149009bef4b4b4db37b3cf72b41dc2c6e8ca1885:
>
>   block-copy: atomic .cancelled and .finished fields in BlockCopyCallState (2021-06-25 14:33:51 +0300)
>
> ----------------------------------------------------------------
> block: Make block-copy API thread-safe
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

