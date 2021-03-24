Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F534830B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:44:27 +0100 (CET)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAMc-0000Ld-H4
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPALF-0007t4-DF
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:43:01 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPALD-0001eE-Ks
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:43:00 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b16so29214055eds.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hE1TrJ1u1EE0sALXztJ9ZmF6/x0zU9w8s78AWrRx5vA=;
 b=O09IzA6zmmuUnrd16w7JvvwQxeSX5e7ytn2YaZUyEC/CRw9GnojpWS2+A+Q0ybHFEg
 IrnH3B7kE6ziXmyfu5L9bUbd/6fdM2E7jtFNdGpvws0XyqsBfL6rY/UxdzuZxjGJlc8D
 TNXav7/Dw9+n99ViTyP8a+2EC0ybIDDxdpitLvhSbmmdcN4sdF53GRYuCr0YSf+etFmr
 1qG2ZHtAAq38pQ/MJJzjE3MlnDDxm07Fd4QvIvC3WIjW915SYwc6mVDNp4jn0GMdrEs5
 gk8wV3KOBXyZCa4ekvMycPw+HLXsITDp1nDH35Nys6ZmH3a0SWnWprqCqOdiI5KA5knq
 P59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hE1TrJ1u1EE0sALXztJ9ZmF6/x0zU9w8s78AWrRx5vA=;
 b=eX6aFhNZ61Lr6U02DlfmFVpcilaj444R9k4Yf1NrLISfHHT5Z9QMX1IEfXdrrHgHWv
 /wmFGY92Hc3YLBP5Eepf+DmhzQEMXmuG2+3PUQl5hvwvO6zpN4VXkPtsUbggvMr9vvT7
 2PVrjziukI94VSUyb7MACBPAXMvWT7dzwZduNhsnJUM0CUJRdku11PSqC5FfVl/HIVJb
 h1e6sQxBH3FvwjbnN+N2j3JN2nzF4AsD0W1ssbxLuBdXo2BK6+vLBbRdySzPmvdR3dms
 tKIhYKhU3QmWWIf21Ba76rdg2uoPbgzgZZ36niSI2qCLSZ/sPop8d5ugnmvwsOf1aoar
 uVYA==
X-Gm-Message-State: AOAM533Qd6EoQWpYGp1At+JKhrvGG9eIu1VL0ZpfXv+6PODCrzvCtoqs
 HGEJ0IgQB/8nT6A3ianoSAsMKGY+FIOMA7ne3v3Q+w==
X-Google-Smtp-Source: ABdhPJyP7oMTvsvwusNsoFkuSwe5khL7Yr1YZgG0wMFEViwYXMxPShCEvn1KvXTzqQHT1Iw+CpropBREtwt24HHMuV8=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr5435773edv.44.1616618578039; 
 Wed, 24 Mar 2021 13:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210324145202.430759-1-stefanha@redhat.com>
 <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
 <71259336-f5d5-90bb-83ef-3fe962bfae18@virtuozzo.com>
In-Reply-To: <71259336-f5d5-90bb-83ef-3fe962bfae18@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Mar 2021 20:42:27 +0000
Message-ID: <CAFEAcA9AGoggABhV8wduAaSce3v-+zED2_QFW7QgNgGOjDJV1g@mail.gmail.com>
Subject: Re: [PULL 0/2] Block patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Mar 2021 at 20:18, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> 24.03.2021 21:05, Peter Maydell wrote:
> > On Wed, 24 Mar 2021 at 14:52, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >>
> >> Vladimir Sementsov-Ogievskiy (2):
> >>    migration/block-dirty-bitmap: make incoming disabled bitmaps busy
> >>    migrate-bitmaps-postcopy-test: check that we can't remove in-flight
> >>      bitmaps
> >
> > This failed the 'qsd-jobs' iotest on s390x:

> I can't believe it related. My commit modifies bitmap status during bitmaps migration on target vm. There is no kind of migration in qsd-jobs test.

It's possible it's an intermittent, but it's not one I've seen
before. We still have lots of time this release cycle to figure
out the issue and get this fix in.

-- PMM

