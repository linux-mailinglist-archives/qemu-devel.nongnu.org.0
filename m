Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9F34A567
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 11:24:33 +0100 (CET)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPjdn-0004CP-Tv
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 06:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPjc5-0003F8-9W
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:22:45 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPjc1-0001gl-6y
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:22:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id bf3so5693066edb.6
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kJOhQ3YvSNeyK8D20Hu+xeaaKL6X3ifRqu603qQH91c=;
 b=x11NA5dOlUTdF8W3pX2mIJRXJN8+F5MxnkmfUgIvP/c6W2IDZUrkGKKd+4W/w955gi
 MqDGq+QTr/CtLN58eJYlZHK/EIOmq4guWW+4tI0z1PuAYLAYERsNMoXy0HtdHMFGMn99
 1mozAO9f5NfdSsuq7iasyHDvV6rwC9aPUw6eQo6biayNPTVP104MYWT0rhKxvrwL9Fi9
 MILK4a7FnlmM9N89J0/rqGPAForWIiKpBr6w3dU7J3LaRU9j3wc4XYZgMDEUL3XO3Xi4
 8JIiF1eDPFk2UNSQFEAfucxjXbnsoKx5B9i5lNe7DthgMeXBmyvoQPiTwQqgrD0iY1zV
 HJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kJOhQ3YvSNeyK8D20Hu+xeaaKL6X3ifRqu603qQH91c=;
 b=j60+gm4Ntjyi4qxUrIFmjSotVBg12FHbxrkCTcAezwBJTiyK46wAoDbryIJs4XPq0I
 17SK2tPdxduU0icvDG5aRPHYpIAyg3ZQX72MMe/9SU/LUnGr7wtVuFeNa0yKtLMCvtmD
 P99PTBj9mqrkkhXWGTZwX8KIJCCRGaXJdszlderHaZdnhKqCu3x+9HwsYTaWaTsnDnFQ
 z6IOR4wEBNngro37k9gmYAidYvOdC9rA2HOdLLkLGc4h3AAb8iRJvnGo0gjvkNBLISup
 6rsFwSh5ibQCkx/ndbSMST59z0Fe7FgxDwmuTjiT4SEusMUPmGGoGVGaFpq5fCVexxit
 96Zg==
X-Gm-Message-State: AOAM530RQL6yKJnMJXI+Lski950ZOLGEHMwbxTH2tR1QcIdgZKiIRuai
 289VvgB7xyGBE9hmlhdFA/fE6mZu2tgxuHrjJX+LxA==
X-Google-Smtp-Source: ABdhPJwWxa4cuF7Nv3Ede71rh7IayhjX6YXGcNeZJDD8wlAvmApUaKAXRbRI55HIxF9decmOCaE5VXKELI8jI8OwImA=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr13984680edt.36.1616754159282; 
 Fri, 26 Mar 2021 03:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210324145202.430759-1-stefanha@redhat.com>
In-Reply-To: <20210324145202.430759-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 10:22:07 +0000
Message-ID: <CAFEAcA9sW32iBjxnhmG3k+7mSE2a17fPKLUEZQV09eJN10FS7g@mail.gmail.com>
Subject: Re: [PULL 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Mar 2021 at 14:52, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 67c1115edd98f388ca89dd38322ea3fadf034523:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210323-pull-request' into staging (2021-03-23 23:47:30 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 3460fd7f3959d1fa7bcc255796844aa261c805a4:
>
>   migrate-bitmaps-postcopy-test: check that we can't remove in-flight bitmaps (2021-03-24 13:41:19 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> This dirty bitmap fix solves a crash that can be triggered in the destination
> QEMU process during live migration.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

