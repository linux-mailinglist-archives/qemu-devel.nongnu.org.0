Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237BC3514D1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:36:55 +0200 (CEST)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwZC-0005HD-7E
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRwXx-0004Ia-7R
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:35:37 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRwXv-0007Ha-C0
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:35:36 -0400
Received: by mail-ed1-x535.google.com with SMTP id z1so1756009edb.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qcmTyoJs+UqGgzz2PWFYcbhMGucM4EtbegH2Tn9EILQ=;
 b=no9GRLY/jQKQcd6gvDmYlK0m6E5O5STdLjUeVBGM7gG+U6KQLVn3qW8QzYwskQ2Yvd
 pFABGKtqyL1jljx4ZKAUc11hLxkgHFdyTnjpz4ab06Vnr2peFkktgXh74V1M5S4M6NmG
 bpW6jTA8oacAkWPjt9QymfR97THeMcXJSyXnJrV9ENwaSzKhmioURbga955K2ib3lrZE
 iu1NB3efA2Mo6g1+OYFsCXck/SNaJ/KFHt6tQSQy+iHtWxEyMecisUBt7w31cxnf1vrd
 UivlX7sasozVh4WNQRYXUL8iSBStN5q2jAbyThV7DSDg4/jawve9KitXPnw3WSNwOWuv
 KvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qcmTyoJs+UqGgzz2PWFYcbhMGucM4EtbegH2Tn9EILQ=;
 b=FKXrVPtmPUCxdzBxrsnQNJvpBo0EJCo0qRjDjRZdRodwLa8HaTYEHRla4gZ/59XV5B
 6ws3kgs4QcSMMjVkH4CooAgiH/nQk8bjLX/TabsX0AJkWkQbOnNz1a7y2EaYH8I/PXyz
 RPoG3X1HgD/do9U9+6BJ2FHwzR5uoWuxO7DZC02XrKGBNVMX/hLP+Z5PSlcwP4pEmSWW
 nyF/Rrf8D7sXpX90WZEox1q/LNOmit2iWFu2131zOoidSJFtIoCrKbwTbi7xbE9lxYfd
 qJfONEWk26rWWrW7/Bd6SBMWwOC7EowrOiBnhkTwjqa1L3x6t5NZNFDxdOQUu7zXcEuT
 qFaQ==
X-Gm-Message-State: AOAM532HmgCNWlg8gou0q1fgpEvu36GcmSvZU8Zbe6VTf8YziADegm4p
 V0P81LmMY7mO5hvByElNi+57GTdXQr+KHNsI7yt5CA==
X-Google-Smtp-Source: ABdhPJze/SwLZw0UbYcLiLcKecu9g80iDjPzGfEpniZL1fncmmv95YbHM4s0PpwNabpMNYP3w7DdDy97veSwc9VfTUw=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr9582734edb.204.1617280532837; 
 Thu, 01 Apr 2021 05:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210331095059.303996-1-stefanha@redhat.com>
In-Reply-To: <20210331095059.303996-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Apr 2021 12:34:59 +0000
Message-ID: <CAFEAcA9JH6Bywh9f2Ri2Ew5SGFW7fqw-+tX9q2SXbx7FB5CqiA@mail.gmail.com>
Subject: Re: [PULL for-6.0 0/6] Block patches
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 31 Mar 2021 at 10:51, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 6d40ce00c1166c317e298ad82ecf10e650c4f87d:
>
>   Update version for v6.0.0-rc1 release (2021-03-30 18:19:07 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to b6489ac06695e257ea0a9841364577e247fdee30:
>
>   test-coroutine: Add rwlock downgrade test (2021-03-31 10:44:21 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> A fix for VDI image files and more generally for CoRwlock.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

