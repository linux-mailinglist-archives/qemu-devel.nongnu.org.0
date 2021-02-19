Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61249320169
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:40:15 +0100 (CET)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDERa-0008Gz-GC
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDEPr-0007hA-6Y
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:38:29 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDEPn-000564-Jv
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:38:26 -0500
Received: by mail-ed1-x52a.google.com with SMTP id g3so12366665edb.11
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dyfgopjqfT91z7O9/P5prtYgCXA1n+93Hxr4CbLe6GU=;
 b=xveZLory7FTeU0Myj+oFWRnLt715v9NXKwGaZMdDqKz3Jb4Oinkp/+6rChGjoRAAXr
 9nsvlkOO/D7JM/4oGFe+UmV1laKG262LCn0V4HrBFgCtSsm5i99UiMcQ2pEtKDgCJJSi
 YO13xzRi/NXd9jdWa6zLBz0t2laR5b3jJLsxebGeT5tX4F1gI9fgN+kLHx6D0TYNANnv
 NztQXSC0EUZB/Na50HMZxAch85lzDUfuVR7DbbX0GA3WyhKd7A+/iJBoTHIqp2yrJ173
 v4Ea91F2p29ZXn2ZC0mAUgrItCRGGxfqviyk+K4+tCmzbuQXV+2+fNyApBtVQfZMru9s
 oyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dyfgopjqfT91z7O9/P5prtYgCXA1n+93Hxr4CbLe6GU=;
 b=RwVyt3Tuj+58cCmtkMIhQqV/CEPEj8ReZ5RH3RMkB1cghIXLSEmsFyaOdgbNzfD5c/
 CcRrH87sBIz6fC3PoAVGnPZ6ZPnrU+mHm8Gx8UxQdWx0NBQIpRXa5cPQDat+A1vsIgkw
 JgoFXa4pHoIsesg7xrdPUNh/UEEz+Slzcdishcac/dqkbrSNZsdePhvIYNyf2kOiW2jG
 fumQtTFDh3DbI3rK+Fg6tqqmY1xoQAUN95Z18tjk0nhf3gsPtE1IKL7Lkqd79/kYDdU5
 qZK0cNM5bwXA31o9OVXeDl+QXZN4uhH+Jy3Rj0dJBY5f+BpjBgAa5G8NrCyPmomwHcvj
 VKfg==
X-Gm-Message-State: AOAM531nA/2iQuZd7wZatQ1HxPkIDvKduwiU/oR+I/X7UlgridnK9NOD
 gnNedeqtr+Gbh2z8cWUHpC4qQ9qLpajoTQI8wlSFsA==
X-Google-Smtp-Source: ABdhPJwihnNRIYT0XuRmT1jl6divib6OAGAUBdRZiKfT8OoMI43Q7GrJOrah5bsLtjh2BgoCDuQqmVxyD9Q6ZMvLiFE=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr11374028edx.36.1613774302131; 
 Fri, 19 Feb 2021 14:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20210215104120.GE7226@merkur.fritz.box>
In-Reply-To: <20210215104120.GE7226@merkur.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 22:38:10 +0000
Message-ID: <CAFEAcA-Urs8JYHmAC1mbtbSNWhTsKyer=8i9zdSpnsa2eH4i2Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] block/export: vhost-user-blk server tests and
 input validation
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021 at 10:41, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 07.12.2020 um 18:20 hat Stefan Hajnoczi geschrieben:
> > v2:
> >  * Add abrt handler that terminates qemu-storage-daemon to
> >    vhost-user-blk-test. No more orphaned processes on test failure. [Peter]
> >  * Fix sector number calculation in vhost-user-blk-server.c
> >  * Introduce VIRTIO_BLK_SECTOR_BITS/SIZE to make code clearer [Max]
> >  * Fix vhost-user-blk-server.c blk_size double byteswap
> >  * Fix vhost-user-blk blkcfg->num_queues endianness [Peter]
> >  * Squashed cleanups into Coiby vhost-user-blk-test commit so the code is
> >    easier to review
> >
> > The vhost-user-blk server test was already in Michael Tsirkin's recent vhost
> > pull request, but was dropped because it exposed vhost-user regressions
> > (b7c1bd9d7848 and the Based-on tag below). Now that the vhost-user regressions
> > are fixed we can re-introduce the test case.
> >
> > This series adds missing input validation that led to a Coverity report. The
> > virtio-blk read, write, discard, and write zeroes commands need to check
> > sector/byte ranges and other inputs. This solves the issue Peter Maydell raised
> > in "[PATCH for-5.2] block/export/vhost-user-blk-server.c: Avoid potential
> > integer overflow".
> >
> > Merging just the input validation patches would be possible too, but I prefer
> > to merge the corresponding tests so the code is exercised by the CI.
>
> Is this series still open? I don't see it in master.

The Coverity issue is still unfixed, at any rate...

-- PMM

