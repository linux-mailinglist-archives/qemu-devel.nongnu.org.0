Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31C35DC74
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:26:05 +0200 (CEST)
Received: from localhost ([::1]:47938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWGFA-0003kk-AT
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWGCn-0002ly-6N
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:23:37 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWGCj-0003WS-9o
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:23:36 -0400
Received: by mail-ej1-x629.google.com with SMTP id w3so25082574ejc.4
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dwey0aRVPXgs+SssSxlFgPXDTB5K30a0f8z/jsS6qEs=;
 b=qkAVNl+QD/HXMccswZ6tAxPpH7r6K4I8MG/kmAlO+cswlj+ohCA7SYK51tOMEMacBq
 EBqhOLa1PWxLlr3eyEz9tgi5prlVlxyJAMHNqPg2uYxgCCY4Zks30y6xtz6tEKG6w1o3
 rAvbc9yvgo56QTdF6kw9ggpkkDPk+uEe56jGZYH9iFtNOCZP6Ct3pcr8p2h8qTzuHjMz
 Ews6tkcR70KxQx08sUnwY2foTn8DfeU1XO0jwHXKr+pwWG8ARLLp5yqZFKKHfBot/Fkw
 k5HdFIlTPUefJnws16tv0V8aMGSzt271BwG1bfVAlnm01+1ylvBQUsx3+fb+44bGfV26
 PGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dwey0aRVPXgs+SssSxlFgPXDTB5K30a0f8z/jsS6qEs=;
 b=I9SB7vuMN5+LPnmPxOfzlk/+taCE9WhpY5Iel8LZFxQteQv3m2RckYk0aIPb542J5W
 icBog/p1nWM/wMDSsChaFaH4ZPitE1vb4kv+VR9sIJ0EKCAh9f0xApnpY/XYjTBlN5rz
 2Qr1ufUIHQZLS6WtigjYVUiOZfyegxXueqDYarzBulvl1n9/itmw+6p0B3XQ5rPLFd1a
 1F6qhTUY4WxMbUy5ekcRY1eaVIJJboZ48nybkBTh0yUsUi6sGCPpsPlaQg5X43uvssyq
 G3g5cLQS6ZNj7btdR9Mg+uUDOac8IleYTc4kEXJRJFgyiEHTmM01QLiheJqN+j4HwG+O
 ahKw==
X-Gm-Message-State: AOAM532MJKsFSmWfy4B9hjy9uU9cK0VcJ6enK75sn+zeUE64NKv2fSDS
 3BkPKPXAmUGb1bxs/Du3tFt8P0I2mnfaPsIm1ycCNQ==
X-Google-Smtp-Source: ABdhPJzk+ZDLV28wzBKZ+tLVklIXnCWbYDR/3LKN3YP913TgdRUpeg4fcr1HoIzNKY9BzwMGF8VIKmPqx/GBYAQJP9I=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr31148094ejh.4.1618309411643; 
 Tue, 13 Apr 2021 03:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210412121846.144565-1-vsementsov@virtuozzo.com>
 <CAFEAcA-damn2CQDe2OMpEj=5Lo=ZTcsBOMoaHJqsX4ktL3qyCw@mail.gmail.com>
 <bda0a2e0-c596-0959-89e3-0c9980d2c3ec@virtuozzo.com>
In-Reply-To: <bda0a2e0-c596-0959-89e3-0c9980d2c3ec@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 11:22:46 +0100
Message-ID: <CAFEAcA8ZFiu8EAcmChQHjktXVVef842vV9dALZJeefAN1+4QeA@mail.gmail.com>
Subject: Re: [PULL 0/1] NBD fix for 6.0-rc3
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 rvkagan@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 at 07:47, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> 12.04.2021 18:48, Peter Maydell wrote:
> > On Mon, 12 Apr 2021 at 13:19, Vladimir Sementsov-Ogievskiy
> > <vsementsov@virtuozzo.com> wrote:
> >>
> >> The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:
> >>
> >>    Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2021-04-12
> >>
> >> for you to fetch changes up to d3c278b689845558cd9811940436b28ae6afc5d7:
> >>
> >>    block/nbd: fix possible use after free of s->connect_thread (2021-04-12 11:56:03 +0300)
> >>
> >> ----------------------------------------------------------------
> >> One fix of possible use-after-free in NBD block-driver for 6.0-rc3
> >>
> >> ----------------------------------------------------------------
> >>
> >> Note: the tag is signed by a new key, as I've lost the old one. So,
> >> now there are two keys with my name on http://keys.gnupg.net, the elder
> >> is lost. I feel stupid about that :(. Anyway, both keys are not signed by
> >> anybody except for myself. And this is my first pull-request to Qemu,
> >> so, I think some kind of TOFU still applies.
> >
> > I'd really rather not deal with trying to add a new source of pull
> > requests the day before rc3, please. Eric, could you do a pull
> > or something?

> Hmm. Ok, that's not a degradation of 6.0 and there is no existing bug
> somewhere, so we can just not care for 6.0.

I think fixing a use-after-free is sensible for rc3; it's only having
it come to me via a new unknown submitter of pull requests that I'm
not happy about.

thanks
-- PMM

