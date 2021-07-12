Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037073C64E6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 22:23:29 +0200 (CEST)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m32Se-0007Pc-2y
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 16:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m32RX-00068v-Mr
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 16:22:19 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m32RV-00067N-En
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 16:22:18 -0400
Received: by mail-ed1-x530.google.com with SMTP id h2so29918720edt.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FiJgiVjLJVh+rY4wvLU2yuiCQ3DmyRY7gdMaMzUU3f0=;
 b=P0QFRa3fMWWoPryZu18+47ydA/NLS0MxfeWoK7PcKLeUG8ZRG+26BWG+Mmei4Sg4Q8
 KvEb/eiPfXfM3Lj+c4Wr1hxG0DNAm5/KG45yY6BH7pjapNu+AFZn0zwOhmqNotA/2SBN
 Kv+UsOoAkjh9fQOuZIdcc7eKqzp0BI2fQ9w5WSB6XBKYR3z1MmR/Hhrpi3jAaxkW2KrM
 a5VZPXPpdRKrtoR1kNjMB1BY5LKCnqStmBYxRc88301LptRYuHH3Wdg5EhHur9qwnmNe
 XnPwBvYH1ppCQyZthk2/VIKGa9coZSAlXlQ0jcnpg9OKeKZ4ZTFuQMR0s0qUo/UH2NfA
 d8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FiJgiVjLJVh+rY4wvLU2yuiCQ3DmyRY7gdMaMzUU3f0=;
 b=qKEA3SmGCLQJCJ1yQN8TRoB63ti4ISDY5Kp+8SuCe28fR6bXHapTgkZ81+CVP3peqi
 LTtc9iXHJl+Lfx0098N/3053lfN0BTsFzcFq7sIKf2Q0WnUelQKTMBO6juXWcnYvnbpg
 JBgBvJgSuowpwbE1Jv4okpdxlCqGC+Z67doC4IN8WJU120xXfl5NgQKFnOCYQC0aXQh5
 sp3JkPKt1Z9ux+ilMLb0PitEnjz8fiBOK1zVdfzuJrCFSBZaHqXjwc2/X3y1Lpd3cwr5
 ZHjJo7sXncw8M5M1uvKg7jZel52h2lOLmuQt0+zJ+XUapgLi858Sy8wnzAnpEh0uy7qy
 7tZw==
X-Gm-Message-State: AOAM530Y6doCyftZxMcDXuif4YV/gQCrTpZXvZCOeK6/cI2fUvP9qx2T
 8tNjI+69QYF2aKyyJS0XmitYiZ4ev/k0w4kIvinsig==
X-Google-Smtp-Source: ABdhPJyd1Fz6q1zadcskixNiHuheW92opsC4pD+j7V9YhlC07ATeE/5dRk5hVbwTCGZkf8aEQPGHw0FOolaqEAkKPMA=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr760956edp.251.1626121335550; 
 Mon, 12 Jul 2021 13:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210708151909.907124-1-cohuck@redhat.com>
In-Reply-To: <20210708151909.907124-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 21:21:36 +0100
Message-ID: <CAFEAcA9Vrdfs0Wi1QLf4OaTXm7ttBYGnrHyaXJ0DM8m3bNYqRA@mail.gmail.com>
Subject: Re: [PULL 00/17] s390x update for softfreeze
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 16:19, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210708
>
> for you to fetch changes up to 7ab3eb42b0d795f7321c4fca0ea06cb76a005b04:
>
>   target/s390x: split sysemu part of cpu models (2021-07-07 14:01:59 +0200)
>
> ----------------------------------------------------------------
> s390x updates:
> - add gen16 cpumodels
> - refactor/cleanup some code
> - bugfixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

