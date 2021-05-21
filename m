Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A738C6D1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:48:44 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4a3-0005p0-UZ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk4XQ-0002Sf-4N
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:46:02 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk4XL-0005UE-UO
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:45:59 -0400
Received: by mail-ed1-x532.google.com with SMTP id r11so23115160edt.13
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t7L8oTpQNjgCQOlDkPy29TudxLAYpP466y+fGX0Ik10=;
 b=pvdHCfN4PJ7fiB2Xx2fbJim7jvWzr3ozfFfnxznWoefoAPubkPAde8ihvhMGmSdY1N
 Ra6QYKS5iPz3t4xZCMKIj56wb2iAruKr4o+dNG4o56dkc66s6bXjqRMZfZfDK8Y+KbSG
 FJLd+qI3JTJSgXLpYrLAhyJ6Aa+a5UHMSC8wRQKC93ZMU/6VZDWkzUMScjVOQT5LimAY
 mB9DHAowAg2jE5NvEs8QkO9aunNdP6Q+36q6uhWhF1bCuee35rhOhT/Hs5MHRh0Z/ssz
 98URSpYXzEuoQq7mVou2SKTWQRU0Qj/Yr2WtufP3DnG+raXxKW54gqPThrjfRowwKrxO
 fIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t7L8oTpQNjgCQOlDkPy29TudxLAYpP466y+fGX0Ik10=;
 b=CV366Eb+7ro2J9T59MQDJafPeCwsXIREwQps77ytHBjnu9ACWjcWZhEmhMbX/QKoJB
 vr8ZAptDrDFSPWydWHcQGbpRhwV3+y7OVoIiUY+FT7MweVoyGNQcpJwDOvx8/iLDTkwQ
 IUlU/v4YmH8/kFEx6l4LM/ODh+gclmiLwqVYwJbJjfRRIoYMEPt+ZFhuBZyMAJ3HxERg
 c0LCj3OfwZxLhOfEASGM0c/Gr1bX32l+he7m/r1rRzW3Qu81tkwCcIZFH7gQSaBdRaRc
 0uFJsCTIQtYBHMo1tFlHNaGjCU+aAcHGfCRf11YvBvrfD0dFf+SjlUBeOfRBT9+/TyS4
 pRlA==
X-Gm-Message-State: AOAM532zpAZzbw4gncpkbepeJ9lZQ09pMtKtXrz71LrJ7JLRZsRtbYCO
 kw+1bkQ9RtkvfVWKF0ROfZDnF6jWLrVaEpDilAZ8bQ==
X-Google-Smtp-Source: ABdhPJwIZhiOPGXNIJFNiCLatObqw4l4dUktjO9RWmyqV0AoM67Xk2nxF2kDXyFZMb2phrzFniP3QYltcfysR3VveCo=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr10874686edu.52.1621601154212; 
 Fri, 21 May 2021 05:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 13:45:34 +0100
Message-ID: <CAFEAcA86heLwb5Z5fYDM=NO_LXqJg-WwF7+WLTaZAzA_jF+pjA@mail.gmail.com>
Subject: Re: [PULL 0/9] scripts/simplebench patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Tue, 4 May 2021 at 10:01, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>
> are available in the Git repository at:
>
>   https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-simplebench-2021-05-04
>
> for you to fetch changes up to e34bd02694026722410b80cee02ab7f33f893e9b:
>
>   MAINTAINERS: update Benchmark util: add git tree (2021-05-04 11:37:26 +0300)
>
> ----------------------------------------------------------------
> scripts/simplebench improvements for 2021-05-04
>
> ----------------------------------------------------------------
> Vladimir Sementsov-Ogievskiy (9):
>       simplebench: bench_one(): add slow_limit argument
>       simplebench: bench_one(): support count=1
>       simplebench/bench-backup: add --compressed option
>       simplebench/bench-backup: add target-cache argument
>       simplebench/bench_block_job: handle error in BLOCK_JOB_COMPLETED
>       simplebench/bench-backup: support qcow2 source files
>       simplebench/bench-backup: add --count and --no-initial-run
>       simplebench/bench-backup: add --drop-caches argument
>       MAINTAINERS: update Benchmark util: add git tree



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

