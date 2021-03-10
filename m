Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382E334244
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:57:13 +0100 (CET)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Cy-0000KM-Hj
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK18A-000373-32
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:52:14 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK187-0007Gi-Ai
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:52:13 -0500
Received: by mail-ej1-x633.google.com with SMTP id c10so39580598ejx.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PVF6UrXsRo68T2XKGkUMM/q3RuXdlxRfyuIGTKqLf9U=;
 b=Rj0FIA9MnoOqhJhLRTafF9anIzlkJI+nkMf1vaOo/J27FNebRZowKjTV8RrIXpnzmb
 QgAZNOx9kE4imJDsndgkFiEbqxscoDwczroAuFCrc6pj7F7sEJCGPB8Db+/7yyGRuCgK
 krUp4xa8aPwKlJNc1iRI1rTkvA1ClabvCKvLQOlA4+eO8/lK9WGfTPQPW0ZCBTg233GK
 W9mFcvPMQCOIxrQgijjWKrMsNbf6jfG6cqjxXqfhpTqCvIYFKDv4pkt5pK4o+JQYQTSI
 T4Xo6RTOFAtUp31jt2+aDMZ1dkkol4D0QXcKAABzv7o4GwUi4ww//CvmJWjbXqZHaDPX
 A9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PVF6UrXsRo68T2XKGkUMM/q3RuXdlxRfyuIGTKqLf9U=;
 b=VbzExt2egCedH7Nlxvda/lEbzB4mGw7znzAu8761GXNnOC9lctHOl0+FB6jS0h32FI
 X77lFE78G/5Xp59mUrKvYUcFMX38cCR24I0EnMetCHLwNr9zC3KuCuLxck15bwu6A7vO
 aeEa1TrDGUN3UzlD4xUyDp+ATsmaoxqSOGXrQ2LUlYn7r5TDK2LYdNKojyMLmUCO2gVp
 TL0aKDErmN5QoJBCnCKuxFTMYXrCWiL8uabDKYENaNPkAmHsy0wKGil+x6b+YvnY9vHx
 2cLQtjobeNqac9Yuq856sM5LNcL5G4sXwdxmLoX85vQ2MJ5U1ZI+tdoLqEZqlDVWe3cP
 tVJA==
X-Gm-Message-State: AOAM532x4Ng8B570s2vNy6KPRYV4HkOdw8aDeqSpWYh60CDD1SCF2M6I
 XTSOD0Zg/LeLa/9iRlXEsa4Y+lgR8BNriMMGwj4IuA==
X-Google-Smtp-Source: ABdhPJw7GsNKVvSc5plgk17pPCF7vRtPzr9u+o+1uDgNZCPHE1SqYTCOB19V1QJ0+wxRx0apfm/2ukE4ca8+0UWlAzM=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr4363824ejj.4.1615391529832; 
 Wed, 10 Mar 2021 07:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20210215104120.GE7226@merkur.fritz.box>
 <CAFEAcA-Urs8JYHmAC1mbtbSNWhTsKyer=8i9zdSpnsa2eH4i2Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-Urs8JYHmAC1mbtbSNWhTsKyer=8i9zdSpnsa2eH4i2Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 15:51:51 +0000
Message-ID: <CAFEAcA_yd6KydPA_Szdt6-_xjiaQOzXkCPEXxZ80hEatM5grWA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] block/export: vhost-user-blk server tests and
 input validation
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Fri, 19 Feb 2021 at 22:38, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 15 Feb 2021 at 10:41, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 07.12.2020 um 18:20 hat Stefan Hajnoczi geschrieben:
> > > v2:
> > >  * Add abrt handler that terminates qemu-storage-daemon to
> > >    vhost-user-blk-test. No more orphaned processes on test failure. [Peter]
> > >  * Fix sector number calculation in vhost-user-blk-server.c
> > >  * Introduce VIRTIO_BLK_SECTOR_BITS/SIZE to make code clearer [Max]
> > >  * Fix vhost-user-blk-server.c blk_size double byteswap
> > >  * Fix vhost-user-blk blkcfg->num_queues endianness [Peter]
> > >  * Squashed cleanups into Coiby vhost-user-blk-test commit so the code is
> > >    easier to review
> > >
> > > The vhost-user-blk server test was already in Michael Tsirkin's recent vhost
> > > pull request, but was dropped because it exposed vhost-user regressions
> > > (b7c1bd9d7848 and the Based-on tag below). Now that the vhost-user regressions
> > > are fixed we can re-introduce the test case.
> > >
> > > This series adds missing input validation that led to a Coverity report. The
> > > virtio-blk read, write, discard, and write zeroes commands need to check
> > > sector/byte ranges and other inputs. This solves the issue Peter Maydell raised
> > > in "[PATCH for-5.2] block/export/vhost-user-blk-server.c: Avoid potential
> > > integer overflow".
> > >
> > > Merging just the input validation patches would be possible too, but I prefer
> > > to merge the corresponding tests so the code is exercised by the CI.
> >
> > Is this series still open? I don't see it in master.
>
> The Coverity issue is still unfixed, at any rate...

Ping^2 ! I'd like to get us down to no outstanding Coverity issues for the
6.0 release, and this (CID 1435956) is one of the handful still unfixed.

thanks
-- PMM

