Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A09401CA6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:50:44 +0200 (CEST)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNF1H-0004VN-HM
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNEoA-0004bG-9H
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:37:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNEo8-0003zK-J7
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:37:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u16so9905326wrn.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40izNyLRAVQvwfSwCCsAPGqJ+nHaRQdVcd33Sq4p8B0=;
 b=Idr9Sf4z0qPzBqwR8iRL1yaqjlTIHEDDEc8TvxQmLiWo/kacDXcNpZyVkGqSKvR9o7
 PzI4V6SBJ4mfyiq786UbTdV29RocJzEm9nmXRNJda0wdR+KkO4tlqkRvaMxZ3onHrO4I
 70dH2m/qnxtu3bQfR1nIu8Atu+dmtuwhLNdAfS7gijSagNnx0wY4DF3icwhrbYC1gPhV
 qF50txXJAwnIHb7RRy+dWaBt4CKvXAhEWCjIUQyF1Qrczmo8NmHx6Km1hc335NtipMED
 Z3ArD4Kt0103M6nMYxVD5TyGmz+AzQfdBoiE4Dx9EMSTwQQ+JuEHSXf5R4L2qLZMAeb5
 1XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40izNyLRAVQvwfSwCCsAPGqJ+nHaRQdVcd33Sq4p8B0=;
 b=b2R56oSnNBmztwjIF3PzXAKqz13/QULFZovATivN5U2m0zuHKv24tr8e3hjA/8kGoS
 NUloZ5C6uCj6HF966zY0HOhDBFlfbkjEod9hTtoeNwWW7P3YzLsVOzTduNUQcLzXovvh
 GpIzSjD84Zzk8wSH/EU7FtgrFvK83acUvHWBc2ZLGZlW4cyk6t0F+tLLBjkrcg3x8D8f
 imnehxCb/DfqQUWDWiFiuwhwWgrdU9R3J2bRi66U04MP2Rvo1xhTB28V/llu8IGuSNDX
 pLjtSx2lrlEFBu2yyCAi2oUammppmtQ60HOPkUmZmkigVwYnEDWqvE4Kum1lZ3jWrrGE
 oHnA==
X-Gm-Message-State: AOAM532FartnvPCl1bkIvvr4iLs7QfiB6ZF8c3el9bl1/ZL37Oy8x+PV
 rgy9wcnZYEZyvyFcqshGJrv/TAVgMgnxda8RUfhdPA==
X-Google-Smtp-Source: ABdhPJy/LdqCvVu+/I6qQo6cEQtB1iTuljWWNxIPFjzoCIHNPSuEoBh8e7tYnCidZhpgh/LuDxtxqI2SgGzdU+H9nwk=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr13577546wrs.149.1630935426766; 
 Mon, 06 Sep 2021 06:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210906112945.88042-1-thuth@redhat.com>
In-Reply-To: <20210906112945.88042-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Sep 2021 14:36:17 +0100
Message-ID: <CAFEAcA-je-6-ZkM8uV78-2MLujPAF3wXmyOOdORWOuDqK_NVvw@mail.gmail.com>
Subject: Re: [PULL v2 00/10] Testing, build system and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Sept 2021 at 12:29, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 31ebff513fad11f315377f6b07447169be8d9f86:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-03' into staging (2021-09-04 19:21:19 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-09-06
>
> for you to fetch changes up to 6695e4c0fd9ef05bf6ab8e3402d5bc95b39c4cf3:
>
>   softmmu/vl: Deprecate the -sdl and -curses option (2021-09-06 10:00:14 +0200)
>
> v2:
>  - Dropped patches that were already merged through Alex' pull request
>  - Fixed the GBM patch to not cause a warning with --static use builds anymore
>
> ----------------------------------------------------------------
> * Add definitions of terms for CI/testing
> * Fix g_setenv problem discovered by Coverity
> * Gitlab CI improvements
> * Build system improvements (configure script + meson.build)
> * Removal of the show-fixed-bugs.sh script
> * Clean up of the sdl and curses options
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

