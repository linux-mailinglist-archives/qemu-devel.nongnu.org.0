Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDEF4E2F5F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:50:15 +0100 (CET)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWMAY-0005Lk-4s
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:50:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWM6m-0002sg-8M
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:46:20 -0400
Received: from [2607:f8b0:4864:20::112a] (port=42948
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWM6k-0006SA-FV
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:46:19 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2e612af95e3so52918947b3.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 10:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LEKN03msIdf4th6bQzg+Cx/cw3+oDE60olI3zVLUByY=;
 b=l8+jnEYyd17ULPrJUb6r/sf0G4z9tna6h+ASIm4jig5mnbBh0RC9AR9kcg6MZAr1L/
 1IYfdabtGVV8+D7B8GYc+Sk2FISmduarmV18G59sVbfp1oRIvB8lcMWGqKseMdQoCkPm
 fSscQc96X3qoP0H0TPr4w30N65WW8ctikKEo8NByZDdqOOXG4+FCoj29hDL5zAsl2zVr
 sZZfM5apcAX88ShagJvlIBq77PleHXMPumv+GLyXwRzP9GAkha7Ii8xmRgSsOvCSXGys
 TUEm3fffICDjBQBeINPlonUCiXTUv3XLqaDaZzy+929Zb6yVCUujk98nffY7bgfJJUpF
 hXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LEKN03msIdf4th6bQzg+Cx/cw3+oDE60olI3zVLUByY=;
 b=BOWY72R6sQGKozDkfB8r012xeY2kdgByvN5neo2IjuTKpkllmD1vjPx3IzkqatVhXj
 DvSTQFJUc6RSboTF7x9yox7PMNHOP9WoYaP9f+Fy8YOqxqIMjVc2JwHtSVsOMcT9/6U7
 Ryi+K1JxGu5fhQ8yYSr0b948bSh20gntVak4DMiFnRwfMq5paUxNneMFqo2c9fpao7Xb
 Ya9apqh1T33gSaaGjGU945za4jd74gpl+VA5E59/zjZDKr078M38ADkH5il2khW+Qpwy
 UPVPtDWjsmhwWD0kAPZKxbUPMD2TBQMGVX8dU7ZjtuImooO8Z9yAJttliS4VSKb+sBuG
 M37g==
X-Gm-Message-State: AOAM531XTZ2AzdnEVOS7KyTeo3uqSTqF+zxra3bVZ+VrvKT1sOjIcjjF
 cAcs/kT8Qv+yBk/eXjixOm+JsZCiZ+BTMjAK7vsEqg==
X-Google-Smtp-Source: ABdhPJyOuD4ZD9s3lU08ZgRTAhyYjJXXu8j3yzNzPRIXDNDwE63Xs5+vdytyE7QCQCDXMlIFFKToadlgIsRIFDZbDjs=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr25277481ywf.347.1647884776799; Mon, 21
 Mar 2022 10:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220317165743.238662-1-stefanha@redhat.com>
 <CAFEAcA97E1F0MgYPgZgUUegzDMpL9wNa9fzkGKE8_A-fUmbzyA@mail.gmail.com>
 <YjiPTBfFH6/K4TEy@stefanha-x1.localdomain>
In-Reply-To: <YjiPTBfFH6/K4TEy@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Mar 2022 17:46:04 +0000
Message-ID: <CAFEAcA8SMBPJg19aP4NwVx_J3E64L3j6QOtK8vbbmQR0f1hH5Q@mail.gmail.com>
Subject: Re: [PULL for-7.0 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 14:44, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Mar 17, 2022 at 06:36:36PM +0000, Peter Maydell wrote:
> > On Thu, 17 Mar 2022 at 16:57, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3:
> > >
> > >   Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu into staging (2022-03-16 10:43:58 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> > >
> > > for you to fetch changes up to fc8796465c6cd4091efe6a2f8b353f07324f49c7:
> > >
> > >   aio-posix: fix spurious ->poll_ready() callbacks in main loop (2022-03-17 11:23:18 +0000)
> > >
> > > ----------------------------------------------------------------
> > > Pull request
> > >
> > > Bug fixes for 7.0.
> >
> > msys2-32bit CI job fails on test-aio:
> >
> > | 14/85 ERROR:../tests/unit/test-aio.c:501:test_timer_schedule:
> > assertion failed: (aio_poll(ctx, true)) ERROR
> > 14/85 qemu:unit / test-aio ERROR 2.40s (exit status 2147483651 or
> > signal 2147483523 SIGinvalid)
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/2217696361
>
> Looks like a random failure. The commits touch Linux/POSIX code so I
> don't know how this pull request could affect Windows.

Seems like it.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

