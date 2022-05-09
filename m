Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA851FB37
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:23:51 +0200 (CEST)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1UQ-0004rI-D0
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1no0jI-000075-L0; Mon, 09 May 2022 06:35:04 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:39450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1no0jG-0003Of-K8; Mon, 09 May 2022 06:35:04 -0400
Received: by mail-oi1-x230.google.com with SMTP id l16so14658014oil.6;
 Mon, 09 May 2022 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8j58kTuBSwXnNgXCreJ83+5ltHGmhJZwXmznaSkicY=;
 b=Ir1MyHZD0F2Kg11AbemGpfwaMf9GgZg+UH/jS6gubhnUgYhaNvlBQQvX2Pjdz/oGou
 bnbJqdbDfJ2ZaVgpD/ictyXHBapt9sxOuFDVzsu2h+xo9YLX3JveaDMck7BW8tKz0kL+
 SssQEvKvFf7kMzyLOePbTVD5rlmBa7vMpt+I81RX6FTVzWLsEG03k+vss12lyQjKwXvF
 WYRaA/D+b5lXy/msMoSLGF8R47p4vNw9/Cc/LDUBy5T9auUwlCBdI70oaX2WlN/mNbuh
 g4vxBCGBiW5mC7d/d+JFQkJHtpw7Ezdc8thxv92E8kKB4s/FXSA/fpoNM1gdKQxRPeTT
 5ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8j58kTuBSwXnNgXCreJ83+5ltHGmhJZwXmznaSkicY=;
 b=ZbatRJTd/GTGMgi5x8q0UhOiig4kry7HREcR1v5D9nvp99secFJU0dY0G1AKFoJFmM
 xOp+PmgS/AZl+aWmq5wxEMpXVU/Yw6BN1fUEH9U9F3KApBK0B9nOm6ShJUWg3uccm//7
 KKKmv6nH0U2c4Rfz9Yu+MFkg6sjQYKNrYZHX/cnbqUHgPEHazsuMXHnbdp1wll7YghRP
 l96xez6E+r23blUe7uQIM+7ASrmN1fsiSIiCyVCkOBARagObZOQEa7tw3ZP7U5wCG0wJ
 vro4mGyGS1cbTyExwjLV7DNvEBOEyc0fuecaURK4yhBd/UrYmixy+8rFmbBrg8RrQ6O/
 rpug==
X-Gm-Message-State: AOAM532t78oOtsPaJI8DxOXbHT+gLHG/R4gDgu8XJwLLHuWB2JhlWUaG
 I0/W1t7c/zM9EzhLtsOG1AYzLvqCbl6krSlEa3Y=
X-Google-Smtp-Source: ABdhPJyPMeMmYg27T5yar15eB9qRzgiM+MKS7U6SEDVqNGmAfMc20Lqgl0iDDeiHpzFahPO/Pld8SCm6TbSo4U1qhIQ=
X-Received: by 2002:a05:6808:1928:b0:325:2113:59c5 with SMTP id
 bf40-20020a056808192800b00325211359c5mr7000950oib.136.1652092500058; Mon, 09
 May 2022 03:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220505084208.2338968-1-stefanha@redhat.com>
 <ae41daa5-4c10-b805-59e5-442c43876036@linaro.org>
In-Reply-To: <ae41daa5-4c10-b805-59e5-442c43876036@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 9 May 2022 11:34:49 +0100
Message-ID: <CAJSP0QXTrqdGhyf4b8sxC2Qmj_Gws4sr3XDBq=-vj_sEuaKCQA@mail.gmail.com>
Subject: Re: [PULL 0/3] Block patches
To: Richard Henderson <richard.henderson@linaro.org>, 
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 May 2022 at 17:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/5/22 03:42, Stefan Hajnoczi wrote:
> > The following changes since commit 9cf289af47bcfae5c75de37d8e5d6fd23705322c:
> >
> >    Merge tag 'qga-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-04 03:42:49 -0700)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >
> > for you to fetch changes up to bef2e050d6a7feb865854c65570c496ac5a8cf53:
> >
> >    util/event-loop-base: Introduce options to set the thread pool size (2022-05-04 17:02:19 +0100)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > Add new thread-pool-min/thread-pool-max parameters to control the thread pool
> > used for async I/O.
> >
> > ----------------------------------------------------------------
> >
> > Nicolas Saenz Julienne (3):
> >    Introduce event-loop-base abstract class
> >    util/main-loop: Introduce the main loop into QOM
> >    util/event-loop-base: Introduce options to set the thread pool size
> >
> >   qapi/qom.json                    |  43 ++++++++--
> >   meson.build                      |  26 +++---
> >   include/block/aio.h              |  10 +++
> >   include/block/thread-pool.h      |   3 +
> >   include/qemu/main-loop.h         |  10 +++
> >   include/sysemu/event-loop-base.h |  41 +++++++++
> >   include/sysemu/iothread.h        |   6 +-
> >   event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
> >   iothread.c                       |  68 +++++----------
> >   util/aio-posix.c                 |   1 +
> >   util/async.c                     |  20 +++++
> >   util/main-loop.c                 |  65 ++++++++++++++
> >   util/thread-pool.c               |  55 +++++++++++-
> >   13 files changed, 419 insertions(+), 69 deletions(-)
> >   create mode 100644 include/sysemu/event-loop-base.h
> >   create mode 100644 event-loop-base.c
> >
>
> This appears to introduce a new error on msys2-64bit:
>
>
> 14/85 qemu:unit / test-aio                                          ERROR           2.14s
>    exit status 3
>  >>> MALLOC_PERTURB_=82 G_TEST_SRCDIR=C:/GitLab-Runner/builds/qemu-project/qemu/tests/unit
> G_TEST_BUILDDIR=C:/GitLab-Runner/builds/qemu-project/qemu/build/tests/unit
> C:/GitLab-Runner/builds/qemu-project/qemu/build/tests/unit/test-aio.exe --tap -k
> ------------------------------------- 8< -------------------------------------
> stderr:
> (test program exited with status code 3)
>
> https://gitlab.com/qemu-project/qemu/-/jobs/2418935125
>
> Are you in a position to test this yourself locally?

I haven't reproduced it yet but will dig a bit more.

test-aio.exe succeeds under Wine:
# random seed: R02S572ad8b9cfeac92bb23a64678114e66d
1..29
# Start of aio tests
ok 1 /aio/acquire
ok 2 /aio/external-client
# Start of bh tests
ok 3 /aio/bh/schedule
ok 4 /aio/bh/schedule10
ok 5 /aio/bh/cancel
ok 6 /aio/bh/delete
ok 7 /aio/bh/flush
# Start of callback-delete tests
ok 8 /aio/bh/callback-delete/one
ok 9 /aio/bh/callback-delete/many
# End of callback-delete tests
# End of bh tests
# Start of event tests
ok 10 /aio/event/add-remove
ok 11 /aio/event/wait
ok 12 /aio/event/flush
# Start of wait tests
ok 13 /aio/event/wait/no-flush-cb
# End of wait tests
# End of event tests
# Start of timer tests
ok 14 /aio/timer/schedule
# End of timer tests
# Start of coroutine tests
ok 15 /aio/coroutine/queue-chaining
ok 16 /aio/coroutine/worker-thread-co-enter
# End of coroutine tests
# End of aio tests
# Start of aio-gsource tests
ok 17 /aio-gsource/flush
# Start of bh tests
ok 18 /aio-gsource/bh/schedule
ok 19 /aio-gsource/bh/schedule10
ok 20 /aio-gsource/bh/cancel
ok 21 /aio-gsource/bh/delete
ok 22 /aio-gsource/bh/flush
# Start of callback-delete tests
ok 23 /aio-gsource/bh/callback-delete/one
ok 24 /aio-gsource/bh/callback-delete/many
# End of callback-delete tests
# End of bh tests
# Start of event tests
ok 25 /aio-gsource/event/add-remove
ok 26 /aio-gsource/event/wait
ok 27 /aio-gsource/event/flush
# Start of wait tests
ok 28 /aio-gsource/event/wait/no-flush-cb
# End of wait tests
# End of event tests
# Start of timer tests
ok 29 /aio-gsource/timer/schedule
# End of timer tests
# End of aio-gsource tests

Stefan

