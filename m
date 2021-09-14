Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB8240AF09
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:37:09 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8cW-000594-Qt
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ8M5-0000u0-8f
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:20:10 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ8M3-00034h-L8
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:20:08 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so2054359wmd.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYafr7CMXdaPoATPC+RS9vx3d3EbRjP5LEpDTPLCNxQ=;
 b=gsCcDtsiJ/DBpikSwdXcip5YmqOd6yB26F58R/cH48v9UrIAwSLXRmHQBJmlXW5Ld2
 U1vgeq6WFtzq7jc4/ZBIinCYFAN1snIVDu2GxFKGA5Z72aaTwTJKj4q9e0nHn3kZ1e1d
 NFrzrzvwnwK9nm1Bk9qRXnxYsUbvp9gP/OUHVT2HzxZ/bsZSmzH0UMRdogydFtr1upbU
 9sGB22TMypnssxj0ba9nqUKchTrsHFu418Gl3j4OveSyx1fkWo4mHzgbqWeBJYzgLvuV
 dKVn3M1/L9vHtS8seoeKjEJFcKguFvLGfMuXXZiAD7HFxAtHDGweJPKoA35Ti64WWPCq
 LzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYafr7CMXdaPoATPC+RS9vx3d3EbRjP5LEpDTPLCNxQ=;
 b=IcmtR7zr7p6TmCqwffVv3XWcutkn1iPqbwBz/eL8Gtuq+Lx/M3cD1yl1G/RPp1kAhI
 43fAoN8ga9BFcVkG+Pa/nJxFcLRa8Wni9UJH2U7r77yF/VtF4BQqS7nY1IFb1tLqL9+Y
 7x3QMHuFsAZDWAn+7aH1GfqyOOgdJbu/5jIJdsUhIRYA+nLFPixK0MIZU1bPAOtUmP0E
 R4nVR4DJvRz0Bw2sZNWYfjzhZWHh5iHYr273ynbJDYfR6KNxBGykRYo22vGIJXRq+N0Q
 vigfL5Aha83EsiEUJyFEh71spoMOXjK+/3txc0kJ0E7WzsO7bGdz9yqkyigCfooFSYZN
 GNdg==
X-Gm-Message-State: AOAM532U4SnOxpYSXFbmLaZQ5dkgCbsjYfKwQgkW2S3CcROva23++my4
 FTQ6n9LR5VBcGWcwTUnsEuP52vmQyZ43lTijHuKuLg==
X-Google-Smtp-Source: ABdhPJyP++uF0eZ8EUW3kPXiBTSraSPw6O05ipTKUK4H+jEMH+yK3hyQ52NZi/FGFiP7n9UbnzxXV06ynz5xd8B5iKc=
X-Received: by 2002:a1c:a505:: with SMTP id o5mr2183327wme.32.1631625604234;
 Tue, 14 Sep 2021 06:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210914115157.35868-1-quintela@redhat.com>
In-Reply-To: <20210914115157.35868-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 14:19:13 +0100
Message-ID: <CAFEAcA9W-2xvnT7pWQahC8gqAg=BXZbwXNSpJytDKymWfJGU=A@mail.gmail.com>
Subject: Re: [PULL 0/5] Migration.next patches
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sept 2021 at 12:56, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit c6f5e042d89e79206cd1ce5525d3df219f13c3cc:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210913-3' into staging (2021-09-13 21:06:15 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/juanquintela/qemu.git tags/migration.next-pull-request
>
> for you to fetch changes up to d634d0e7b0225f97f45cecb72ca90bd0e7bdb211:
>
>   migration/ram: Don't passs RAMState to migration_clear_memory_region_dirty_bitmap_*() (2021-09-14 13:45:06 +0200)
>
> ----------------------------------------------------------------
> Migration Pull request (take 2)
>
> This pull request includes:
> - Remove RAMState unused parameter for several prototypes (dropped)
> - RDMA fix
> - give an error when using RDMA and multifd
> - Implement yank for multifd send side
>
> Please, Apply.
>

Hi; this fails to build on FreeBSD:

../src/migration/rdma.c:1146:23: error: use of undeclared identifier
'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
    int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
                      ^
../src/migration/rdma.c:1147:18: error: use of undeclared identifier
'IBV_ADVISE_MR_ADVICE_PREFETCH'
                 IBV_ADVISE_MR_ADVICE_PREFETCH;
                 ^
../src/migration/rdma.c:1150:11: warning: implicit declaration of
function 'ibv_advise_mr' is invalid in C99
[-Wimplicit-function-declaration]
    ret = ibv_advise_mr(pd, advice,
          ^
../src/migration/rdma.c:1151:25: error: use of undeclared identifier
'IBV_ADVISE_MR_FLAG_FLUSH'
                        IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
                        ^
1 warning and 3 errors generated.

Looking at the code, none of the proposed ways to detect
whether the host has this function seem to have been implemented:
did you push the wrong branch ?

thanks
-- PMM

